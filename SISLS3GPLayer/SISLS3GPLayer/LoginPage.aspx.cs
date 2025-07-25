using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.IO;
using System.Text;
using S3GAdminServicesReference;
using S3GBusEntity;
using System.Net;
using System.Globalization;

public partial class LoginPage : System.Web.UI.Page
{
    S3GAdminServicesReference.S3GAdminServicesClient ObjS3GAdminClient;
    string strAlert;
    string strPWDRemainingDays;
    string strRedirectPWDPage = "window.location.href='./Common/Changepassword.aspx?qsMode=login';";
    //string strRedirectHomePage = "window.location.href='./Common/HomePage.aspx';";
    string strRedirectHomePage = "window.location.href='./Common/SMLMaster.aspx';";
    string strRedirectLoginPage = "window.location.href='./LoginPage.aspx';";
    string strPWDGPSRecyItrCount;
    int strPWDSystemCount;
    Dictionary<string, string> Procparam = null;
    DataTable dtItrCount = new DataTable();
    private Boolean FunPriEncryptedCount()
    {

        String StrEncrypted = File.ReadAllLines("D:/applcn.dll").GetValue(0).ToString();//ClsPubCommCrypto.EncryptText(StrEncrypted);
        String StrDecrypt = LicenceEnc.Decrpyt(StrEncrypted);
        if (StrDecrypt == "Invalid Key!")
            return false;
        int LimitUsers = Convert.ToInt32(StrDecrypt);



        DataTable dt = new DataTable();
        int ActiveUserCount;
        Dictionary<String, String> ParamsDict = new Dictionary<String, String>();
        ParamsDict.Clear();
        ParamsDict.Add("@LocationCode", "0");
        dt = Utility.GetDefaultData("S3G_SYSAD_GET_ACTIVEUSERCOUNT", ParamsDict);

        if (dt.Rows.Count == 0)
            ActiveUserCount = 0;
        else
            ActiveUserCount = Convert.ToInt32(dt.Rows[0][0].ToString());


        if (ActiveUserCount + 1 > LimitUsers)
        {
            return false;
        }
        return true;
    }
    private Boolean ResourceExists()
    {
        if (File.Exists("D:/applcn.dll"))
        {
            return true;
        }
        return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserCode.Focus();
        if (!IsPostBack)
        {
            //Procparam = new Dictionary<string, string>();
            // DataTable dt = Utility.GetDefaultData("S3G_SA_GET_COMPVISION", Procparam);
            // dvText.InnerHtml = dt.Rows[0][0].ToString();
            FungetEnvironment();
            // txtUserCode.Text = "Sysadm";
            // txtPassword.Text = "Sis@12";
        }
    }
    ///// <summary>
    /// PreInit Event of Page to set theme
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = "S3GTheme_Green_Light";
    }
    protected void imgbtnLogin_Click(object sender, EventArgs e)
    {
        try
        {

            ////By Chandu 23-Oct-2013
            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            int SSOEnabled = (int)AppReader.GetValue("SSOEnabled", typeof(int));

            if (SSOEnabled == 1)
            {
                if (ResourceExists())
                {
                    Boolean AllowAccess = FunPriEncryptedCount();
                    if (!AllowAccess)
                    {
                        Utility.FunShowAlertMsg(this, "In sufficient licence,please try later");
                        return;
                    }
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "Error in Licence Key Resource file.Kindly Contact System Administrator!");
                    return;
                }
            }
            ////By Chandu 23-Oct-2013

            string strUserLogin = txtUserCode.Text.Trim();
            string strPassword = txtPassword.Text;
            int intCompanyID = 0;
            int intUserID = 0;
            int intUser_Level_Id = 0;
            string strCompanyName = string.Empty;
            string strCompanyCode = string.Empty;
            string strUsername = string.Empty;
            string strLocalization = string.Empty;
            string strUserTheme = string.Empty;
            string strAccess = string.Empty;
            string strCountryName = string.Empty;
            string strUserType = string.Empty;
            string strMarqueeText = string.Empty;
            string strCompareDate = string.Empty;
            DateTime Last_LoginDate;
            int interrorCode;
            int intUserStatus;
            string strPWDIterationCount;




            ObjS3GAdminClient = new S3GAdminServicesReference.S3GAdminServicesClient();
            interrorCode = ObjS3GAdminClient.FunPubValidateLogin(out intCompanyID, out intUserID, out intUser_Level_Id, out strUsername, out strCompanyName,
                out strCompanyCode, out Last_LoginDate, out strUserTheme, out strAccess, out strCountryName, out strUserType, out strMarqueeText, out strCompareDate,
                strUserLogin, strPassword, SSOEnabled);

            DataSet ds = new DataSet();
            Procparam = new Dictionary<string, string>();

            #region Checking Active Directory

            string strADIntegration = System.Configuration.ConfigurationManager.AppSettings["Is_AD_Intgeration"].ToString();

            if (strADIntegration == "1")
            {
                int intValidUser = Utility.ValidateADLogin(strUserLogin, strPassword);
                if (intValidUser == 0)
                {
                    //cvLogin.ErrorMessage = "Invalid User ID or Password";
                    //cvLogin.IsValid = false;
                    //cvLogin.CssClass = "styleMandatoryLabelLogin";
                    Utility.FunShowAlertMsg(this, "Invalid User ID or Password", "LoginPage.aspx");
                    txtPassword.Focus();
                    return;
                }

                //interrorCode = 0;
            }

            #endregion

            switch (interrorCode)
            {
                case 1:
                    //cvLogin.ErrorMessage = "Invalid User ID or Password";
                    //cvLogin.IsValid = false;
                    //cvLogin.CssClass = "styleMandatoryLabelLogin";
                    Utility.FunShowAlertMsg(this, "Invalid User ID or Password", "LoginPage.aspx");
                    txtUserCode.Focus();

                    if (Procparam != null)
                    {
                        Procparam.Clear();
                    }
                    Procparam.Add("@User_Code", strUserLogin);
                    dtItrCount = Utility.GetDefaultData("S3G_UPD_UserStatus_DisableAccess", Procparam);
                    if (dtItrCount.Rows.Count > 0)
                    {
                        if (dtItrCount.Rows[0]["UserStatus"].ToString() == "0")
                        {
                            Utility.FunShowAlertMsg(this, "User account locked, contact system administrator.", "LoginPage.aspx");
                        }
                        else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "1")
                        {
                            Utility.FunShowAlertMsg(this, "Invalid UserID Or Password", "LoginPage.aspx");
                        }
                        else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "2")
                        {
                            Utility.FunShowAlertMsg(this, "User account locked, contact system administrator.", "LoginPage.aspx");
                        }
                        else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "3")
                        {

                        }
                        else
                        {

                        }
                    }
                    break;

                case 2:
                    if (strADIntegration != "1") //This if condition added by Praba, no need to check password in our db for AD Integration
                    {
                        //cvLogin.ErrorMessage = "Invalid Password";
                        //cvLogin.IsValid = false;
                        //cvLogin.CssClass = "styleMandatoryLabelLogin";
                        Utility.FunShowAlertMsg(this, "Invalid Password", "LoginPage.aspx");
                        txtPassword.Focus();

                        if (Procparam != null)
                        {
                            Procparam.Clear();
                        }
                        Procparam.Add("@User_Code", strUserLogin);
                        dtItrCount = Utility.GetDefaultData("S3G_UPD_UserStatus_DisableAccess", Procparam);
                        if (dtItrCount.Rows.Count > 0)
                        {
                            if (dtItrCount.Rows[0]["UserStatus"].ToString() == "0")
                            {
                                Utility.FunShowAlertMsg(this, "User account locked, contact system administrator.", "LoginPage.aspx");
                            }
                            else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "1")
                            {
                                Utility.FunShowAlertMsg(this, "Invalid UserID Or Password", "LoginPage.aspx");
                            }
                            else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "2")
                            {
                                Utility.FunShowAlertMsg(this, "User account locked, contact system administrator.", "LoginPage.aspx");
                            }
                            else if (dtItrCount.Rows[0]["UserStatus"].ToString() == "3")
                            {

                            }
                            else
                            {

                            }
                        }
                    }
                    else
                    {
                        goto case 0;
                    }
                    break;
                case 3:
                    Utility.FunShowAlertMsg(this, "The User ID that you are using is currently active or may not have logged out properly.In case if it is an improper logout kindly wait for 15 minutes or contact your administrator");
                    break;

                //case 5:
                //    DateTime dt = DateTime.ParseExact("31/12/2016", "dd/MM/yyyy", CultureInfo.InvariantCulture);
                //    DateTime dtLicenceDate = DateTime.ParseExact(strUserType, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                //    if (dtLicenceDate > dt)
                //    {
                //        Utility.FunShowAlertMsg(this, "licence Expired,Kindly Contact System Administrator!");
                //        return;
                //    }
                //    break;

                case 0:
                    //if (strCompareDate != string.Empty)
                    //{
                    //    DateTime dt = DateTime.ParseExact("31/01/2018", "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    //    DateTime dtLicenceDate = DateTime.ParseExact(strCompareDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    //    if (dtLicenceDate >= dt)
                    //    {
                    //        Utility.FunShowAlertMsg(this, "licence Expired,Kindly Contact System Administrator!");
                    //        return;
                    //    }
                    //}


                    UserInfo UserInfo = new UserInfo(intCompanyID, intUserID, intUser_Level_Id, strUserLogin, strCompanyName, strUsername, "", strUserTheme, Last_LoginDate, strAccess, strCountryName, strUserType, strMarqueeText);
                    /*Method added to handle Password policy - BCA Enhancement - Kuppu - Sep-13*/
                    FunPriGetPWDChangeDays(intCompanyID, strUserLogin, strRedirectPWDPage);


                    ///Method to Capture LoggedIn User Details by Chandu July-31-2013
                    int Executed = FunPriUserLoginTrans(UserInfo.ProCompanyIdRW, UserInfo.ProUserIdRW, UserInfo.ProLastLoginRW);
                    ///Method to Capture LoggedIn User Details by Chandu July-31-2013

                    break;
            }
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            Utility.FunShowAlertMsg(this, ex.Message.Replace("'", ""));
        }
        finally
        {
            if (ObjS3GAdminClient != null)
            {
                ObjS3GAdminClient.Close();
            }
        }
    }
    private int FunPriUserLoginTrans(int Company_ID, int User_ID, DateTime Last_Login)
    {
        int intErrorCode;
        S3GAdminServicesClient ObjWebServiceClient = new S3GAdminServicesClient();
        try
        {
            String strPath = Server.MapPath(@"~\Data\UserManagement\" + User_ID + "_Disc.xml");
            if (File.Exists(strPath))
            {
                File.Delete(strPath);
            }
            String Host_Name = string.Empty;
            int maxVal = 0;
            String IP_Address = string.Empty;
            String Machine_Name = string.Empty;
            //string domain = System.Configuration.ConfigurationManager.AppSettings["Domain"].ToString();
            try
            {
                Host_Name = System.Net.Dns.GetHostEntry(Request.UserHostName).HostName;
                maxVal = System.Net.Dns.GetHostAddresses(Host_Name).Length - 1;
                IP_Address = System.Net.Dns.GetHostAddresses(Host_Name).GetValue(maxVal).ToString();
                Machine_Name = System.Environment.MachineName;
                //using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, domain))
                //{
                //    PrincipalContext PCName = new PrincipalContext(ContextType.Machine, null);
                //    Machine_Name = PCName.ConnectedServer;
                //}
            }
            catch (Exception ex1)
            {
                Host_Name = "Host Unknown";
                IP_Address = "0.0.0.0";
                goto Err_;
            }


        Err_:
            String Session_ID = System.Guid.NewGuid().ToString();

            StringBuilder StrInsUserDet = new StringBuilder();

            if (Host_Name.ToString().ToUpper().Trim() == "Host Unknown".ToString().ToUpper().Trim())
            {
                IP_Address = Request.ServerVariables["REMOTE_ADDR"];
                Machine_Name = System.Environment.MachineName;
                Host_Name = System.Environment.MachineName;
                //using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, domain))
                //{
                //    PrincipalContext PCName = new PrincipalContext(ContextType.Machine, null);
                //    Host_Name = PCName.ConnectedServer;
                //    Machine_Name = System.Environment.MachineName;
                //}
               // Host_Name = Request.UserHostName;
            }
            StrInsUserDet.Append("<Root>");
            StrInsUserDet.Append("<Details Company_ID = '" + Convert.ToString(Company_ID) + "'");
            StrInsUserDet.Append(" USER_ID = '" + Convert.ToString(User_ID.ToString()) + "'");
            StrInsUserDet.Append(" IP_Address = '" + Convert.ToString(IP_Address.ToString()) + "'");
            StrInsUserDet.Append(" Host_Name = '" + Convert.ToString(Host_Name.ToString()) + "'");
            StrInsUserDet.Append(" Session_ID = '" + Convert.ToString(Session_ID.ToString()) + "'");
            StrInsUserDet.Append(" Machine_Name = '" + Convert.ToString(Machine_Name.ToString()) + "'");
            StrInsUserDet.Append(" />");
            StrInsUserDet.Append("</Root>");

            SystemAdmin.S3G_SYSAD_UserLoginDetailsDataTable dt = new SystemAdmin.S3G_SYSAD_UserLoginDetailsDataTable();
            SystemAdmin.S3G_SYSAD_UserLoginDetailsRow dr = dt.NewS3G_SYSAD_UserLoginDetailsRow();
            dr.COMPANY_ID = Company_ID.ToString();
            dr.USER_ID = User_ID.ToString();
            dr.HOST_NAME = Host_Name.ToString();
            dr.IP_ADDRESS = IP_Address.ToString();
            dr.Session_ID = Session_ID.ToString();
            dr.XMLUserLoginDetails = StrInsUserDet.ToString();
            dt.AddS3G_SYSAD_UserLoginDetailsRow(dr);


            SerializationMode SerMode = SerializationMode.Binary;
            intErrorCode = ObjWebServiceClient.FunPubInsertUserLoginDetails(SerMode, ClsPubSerialize.Serialize(dt, SerMode));

            HttpCookie CookUser_ID = new HttpCookie("CookUser_ID");
            Response.Cookies["CookUser_ID"].Value = User_ID.ToString();

            HttpCookie CookCOMPANY_ID = new HttpCookie("CookCOMPANY_ID");
            Response.Cookies["CookCOMPANY_ID"].Value = Company_ID.ToString();

            HttpCookie CookSession_ID = new HttpCookie("CookSession_ID");
            Response.Cookies["CookSession_ID"].Value = Session_ID.ToString();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            ObjWebServiceClient.Close();
        }
        return 0;
    }
    public void FunPriGetPWDChangeDays(int intCompanyID, string strUserLogin, string strRedirectPWDPage)
    {
        DataSet dsChagePWD = new DataSet();

        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@User_Code", strUserLogin.ToString());
        dsChagePWD = Utility.GetDataset("S3G_Get_PWDChange_Days", Procparam);
        //FungetEnvironment(intCompanyID);
        if (dsChagePWD.Tables[0].Rows.Count > 0)
        {
            strPWDRemainingDays = dsChagePWD.Tables[0].Rows[0]["Remaining_Days"].ToString();

            if (strPWDRemainingDays != "")
            {
                if (strPWDRemainingDays == "0")
                {
                    strAlert += @"Your password has been expired.Kindly change it now.";
                    Utility.FunShowAlertMsg(this, strAlert, "Common/Changepassword.aspx?qsMode=login");
                }
                else if (strPWDRemainingDays == "1" || strPWDRemainingDays == "2")
                {
                    strAlert += @"Your password will expire in " + strPWDRemainingDays + " Day(s)";
                    strAlert += @"\n Do you want to change it now ?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPWDPage + "}else {" + strRedirectHomePage + "}";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "", strAlert, true);
                }
                else
                {
                    //Response.Redirect("Common/HomePage.aspx", false);
                    Response.Redirect("Common/SMLMaster.aspx", false);
                }
            }
            else
            {
                //Response.Redirect("Common/HomePage.aspx", false);
                Response.Redirect("Common/SMLMaster.aspx", false);
            }
        }
    }
    protected void FungetEnvironment()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        DataTable DtEnvi = Utility.GetDefaultData("S3G_GET_EnvironmentName", Procparam);
        lblEnvironment.Text = DtEnvi.Rows[0]["ENVI"].ToString();
    }
}