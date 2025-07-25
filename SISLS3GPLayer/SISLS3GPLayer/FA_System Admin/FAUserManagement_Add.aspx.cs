
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: User Management
/// Created By			: M.Saran
/// Created Date		: 01-Feb-2012
/// Purpose	            : 
/// Reason              : System Admin User Management Developement
/// <Program Summary>
#endregion


#region "Name Spaces"
using System;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web.UI;
using System.ServiceModel;
using System.Data;
using System.Text;
using FA_BusEntity;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Configuration;
#endregion

public partial class System_Admin_FAUserManagement_Add : ApplyThemeForProject_FA
{

    #region Intialization
    int intErrCode = 0;
    int intUserId = -1;
    int intCreatedBy = 0;
    int inthdUserid;
    string strRedirectPageMC;
    string strDateFormat = string.Empty;
    FASerializationMode SerMode = FASerializationMode.Binary;
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objUserManagementClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable ObjS3G_SYSAD_UserManagementDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable ObjS3G_SYSAD_UserMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable();

    public static System_Admin_FAUserManagement_Add obj_Page;

    string strRedirectPage = "../FA_System Admin/FAUserManagement_View.aspx";
    DataSet dsBranchRole = new DataSet();
    DataTable dtBranch = null;
    int intCompanyID = 0;
    string strModeCode = string.Empty;
    Dictionary<string, string> Procparam = null;
    StringBuilder strbSelLocation = new StringBuilder();
    StringBuilder strbSelRoleCode = new StringBuilder();
    Dictionary<string, string> dictValue = new Dictionary<string, string>();
    int intLOBID = 0;
    bool booChecked = true;
    UserInfo_FA ObjUserInfo_FA = null;
    string strMode = "C";
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    bool bChecked = true;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../FA_System Admin/FAUserManagement_Add.aspx';";
    string strRedirectPageView = "window.location.href='../FA_System Admin/FAUserManagement_View.aspx';";
    static string strPageName = "User Management";
    string strConnectionName = "";
    /*Password Policy variable declaration -*/
    string strUpperCaseNeed;
    string strNumberNeed;
    string strSpecCharNeed;
    int intPWDLength;
    //string strRedirectPage = "../LoginPage.aspx";
    Boolean boolLoginPage;
    int intGPSPwdItrCount;
    string strNewPassword;
    DataSet dsChagePWD = new DataSet();
    Dictionary<string, string> ProcPWDparam = null;
    int intErrorCode;
    string strPWDDefaultString;
    #endregion

    #region PageLoad

    /// <summary>
    /// Loading on page load 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            FunPriLoadPage();

        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    /// <summary>
    /// this method is used when page loads
    /// </summary>
    private void FunPriLoadPage()
    {
        try
        {
            obj_Page = this;
            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intCreatedBy = ObjUserInfo_FA.ProUserIdRW;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            FASession ObjFASession = new FASession();
            strDateFormat = ObjFASession.ProDateFormatRW;
            strConnectionName = ObjFASession.ProConnectionName;
            CalendarExtender1.Format = strDateFormat;
            StringBuilder strRegion = new StringBuilder();

            txtUserCode.Attributes.CssStyle.Add("text-transform", "uppercase");
            /*Password Policy variable declaration - BCA Enhancement - Kuppu - Sep -17*/
            ProcPWDparam = new Dictionary<string, string>();
            ProcPWDparam.Add("@Company_ID", intCompanyID.ToString());
            DataSet ds = Utility_FA.GetDataset("FA_GET_GPSDETAILS", ProcPWDparam);

            if (ds.Tables[0].Rows.Count > 0)
            {
                strUpperCaseNeed = ds.Tables[0].Rows[0]["UpperCase_Char"].ToString();
                strNumberNeed = ds.Tables[0].Rows[0]["Numeral_Char"].ToString();
                strSpecCharNeed = ds.Tables[0].Rows[0]["Spec_Char"].ToString();
                intPWDLength = Convert.ToInt32(ds.Tables[0].Rows[0]["Min_pwd_length"].ToString());
            }

            strPWDDefaultString = "New Password should contains atleast ";

            if (strUpperCaseNeed == "True" || strUpperCaseNeed == "1")
            {
                strPWDDefaultString = strPWDDefaultString + "one uppercase alphabet[A-Z];";
            }

            if (strNumberNeed == "True" || strNumberNeed == "1")
            {
                strPWDDefaultString = strPWDDefaultString + " one numeral[0-9];";
            }

            if (strSpecCharNeed == "True" || strSpecCharNeed == "1")
            {
                strPWDDefaultString = strPWDDefaultString + " one special character[!,@,#,$,..];";
            }

            if (strUpperCaseNeed == "False" || strUpperCaseNeed == "0" && strNumberNeed == "False" || strNumberNeed == "0" && strSpecCharNeed == "False" || strSpecCharNeed == "0")
            {
                strPWDDefaultString = "Enter a password contains atleast one uppercase alphabet[A-Z]; a numeral[0-9] ; a special character[!,@,#,$,..];";
            }

            if (intPWDLength > 0)
            {
                strPWDDefaultString = strPWDDefaultString + " Length should be minimum " + intPWDLength + " digits.";
            }
            else
            {
                strPWDDefaultString = "Enter a password contains atleast one uppercase alphabet[A-Z]; a numeral[0-9] ; a special character[!,@,#,$,..];";
            }

            lblPWDString.Text = strPWDDefaultString;


            txtPassword.Attributes.Add("value", txtPassword.Text);
            txtUserCode.Attributes.CssStyle.Add("text-transform", "uppercase");

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            if (Request.QueryString["qsUserId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsUserId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intUserId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }

            }

            if (!IsPostBack)
            {
                //txtDateofJoining.Attributes.Add("readonly", "readonly");
                txtDateofJoining.Attributes.Add("onblur", "fnDoDate(this,'" + txtDateofJoining.ClientID + "','" + strDateFormat + "',false,  false);");
                FunBindUserCode();
                FunPriloadDesignation();
                FunPriloadLocationTreeview();
                FunGetUserDetails();
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (((intUserId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intUserId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriDisableControls(0);

                }

            }

            treeview.Attributes.Add("onclick", "postBackByObject()");

            //txtPassword.Attributes.Add("value", txtPassword.Text);
            if (strMode == "M" || strMode == "Q")
            {
                if (!chkResetPwd.Checked)
                    txtPassword.Attributes.Add("value", "*************");
                else
                {
                    if (!string.IsNullOrEmpty(txtPassword.Text))
                        txtPassword.Attributes.Add("value", txtPassword.Text);
                    else
                        txtPassword.Attributes.Add("value", txtPassword.Attributes["value"]);

                }
            }
            else
                txtPassword.Attributes.Add("value", txtPassword.Text);

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }



    #endregion

    #region Page Events


    /// <summary>
    /// This is used to Clear_FA data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriClear();

        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }

        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }

    }

    /// <summary>
    /// this method is used to Clear_FA the controls and treeview ontrols
    /// </summary>
    private void FunPriClear()
    {
        try
        {
            fnPubClear();
            foreach (TreeNode treeviewnode in treeview.Nodes)
                FunNodeClearCheck(treeviewnode); //to Clear_FA Treeview
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to Clear_FA all controls except the tree view
    /// </summary>
    private void fnPubClear()
    {
        try
        {
            txtUserCode.Text = "";
            txtUserName.Text = "";
            txtPassword.Attributes.Add("value", "");
            //txtDesignation.Text = "";
            txtDateofJoining.Text = DateTime.Now.ToString(strDateFormat);
            txtMobileNo.Text = "";
            txtEMailId.Text = "";
            ddlLevel.SelectedIndex = 0;
            txtDesignation.SelectedIndex = 0;


            //ddlReportingLevel.SelectedIndex = 0;
            //  ddlHigherLevel.SelectedIndex = 0;
            chkCopyProfile.Checked = false;
            //ddlCopyProfile.SelectedIndex = 0;
            ddlReportingLevel.Clear_FA();
            ddlHigherLevel.Clear_FA();
            ddlCopyProfile.Clear_FA();
            chkActive.Checked = true;
            chkCurrent_Period.Checked = true;
            chkPrior_Period.Checked = false;
            FunGetUserDetails();

            FunPrichkCopyProfileChecked();

            //grvRoleCode.DataSource = null;
            //grvRoleCode.DataBind();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this event is called when pre rendering the treeview
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void treeview_PreRender(object sender, EventArgs e)
    {
        try
        {
            FunPriTreeViewPreRender();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    /// <summary>
    /// this methods call when treeview prerenders.
    /// </summary>
    private void FunPriTreeViewPreRender()
    {
        try
        {
            if (!IsPostBack)
            {
                if (strMode == "Q")
                    treeview.ExpandAll();
                else
                    treeview.CollapseAll();
                FunPriCheckLocation();
            }
            else
            {
                treeview.ExpandAll();
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to select the selected locations in treeview.
    /// </summary>
    private void FunPriCheckLocation()
    {
        try
        {
            foreach (TreeNode treeviewnode in treeview.Nodes)
            {
                if (ViewState["Locationss"] != null)
                    FunNodeCheckMod(treeviewnode, (DataTable)ViewState["Locationss"]); //to check locations in Treeview
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to load the selected locations from treeview controls.
    /// </summary>
    /// <param name="e"></param>
    private void FunNodeloop(TreeNode e)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {
                FunPubAssignValue(e.ChildNodes[i].Value.Split('-')[0].ToString(), e.ChildNodes[i].Value.Split('-')[1].ToString());
                if (e.ChildNodes[i].ChildNodes.Count == 0)
                    FunPubAssignValue(e.ChildNodes[i]);
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeloop(e.ChildNodes[i]);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// This method is used to Clear_FA all checked items in a treeview.
    /// </summary>
    /// <param name="e"></param>
    private void FunNodeGetValue(TreeNode tn)
    {
        try
        {
            int levels = Convert.ToInt32(tn.Value.Split('-')[0].ToString());
            string str1 = tn.Parent.Value;
            string str2 = tn.Parent.Parent.Value;

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to select the level and location values was assigned to the data table.
    /// </summary>
    /// <param name="Level"></param>
    /// <param name="value"></param>
    public void FunPubAssignValue(string Level, string value)
    {
        try
        {
            if (ViewState["DtMappingLevel"] == null || ((DataTable)ViewState["DtMappingLevel"]).Columns.Count == 0)
            { FunPubCreateTable(); }
            DataTable dt = ((DataTable)ViewState["DtMappingLevel"]);
            DataRow drow = dt.NewRow();
            drow["M" + Level] = value;
            dt.Rows.Add(drow);
            ViewState["DtMappingLevel"] = dt;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this is used to assign the value from treeview
    /// </summary>
    /// <param name="tn"></param>
    public void FunPubAssignValue(TreeNode tn)
    {
        try
        {
            if (ViewState["DtMappingLevel"] == null || ((DataTable)ViewState["DtMappingLevel"]).Columns.Count == 0)
            { FunPubCreateTable(); }
            DataTable dt = ((DataTable)ViewState["DtMappingLevel"]);
            string strCurrentValue = string.Empty;
            int intLevels = Convert.ToInt32(tn.Value.Split('-')[0].ToString());
            string strnewValue = string.Empty;
            for (int i = 0; i < intLevels; i++)
            {
                if (i == 0 && tn.Checked)
                {
                    strCurrentValue = tn.Value;
                }
                else if (i == 1 && tn.Parent.Checked)
                {
                    strCurrentValue = tn.Parent.Value + "|" + strCurrentValue;
                }
                else if (i == 2 && tn.Parent.Parent.Checked)
                {
                    strCurrentValue = tn.Parent.Parent.Value + "|" + strCurrentValue;
                }
                else if (i == 3 && tn.Parent.Parent.Parent.Checked)
                {
                    strCurrentValue = tn.Parent.Parent.Parent.Value + "|" + strCurrentValue;
                }
                else if (i == 4 && tn.Parent.Parent.Parent.Parent.Checked)
                {
                    strCurrentValue = tn.Parent.Parent.Parent.Parent.Value + "|" + strCurrentValue;
                }
            }

            if (!dictValue.ContainsKey(strCurrentValue))
                dictValue.Add(strCurrentValue, strCurrentValue);

            ViewState["DtMappingLevel"] = dt;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to construct the datatable
    /// </summary>
    public void FunPubCreateTable()
    {
        try
        {
            DataTable dt = new DataTable();
            for (int i = 1; Convert.ToInt32(ViewState["TVMAxLevel"].ToString()) >= i; i++)
            {
                dt.Columns.Add("M" + i);
            }
            ViewState["DtMappingLevel"] = dt;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }

    //pending
    /// <summary>
    /// This is used to save user (role access,Location) details 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            #region Password Policy
            if (chkResetPwd.Checked && txtPassword.Text.Trim() != "")
            {
                if (txtPassword.Text.Length < intPWDLength)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "New Password length should be minimum " + intPWDLength + " digits");
                    return;
                }

                if (strUpperCaseNeed == "true" && !pwdHasCapitals(txtPassword.Text.Trim()))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "New Password should contain atleast one uppercase alphabet[A-Z]");
                    return;
                }

                if (strNumberNeed == "true" && !pwdHasNumbers(txtPassword.Text.Trim()))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "New Password should contain atleast one numeral[0-9]");
                    return;
                }

                if (strSpecCharNeed == "true" && !pwdHasSpecChar(txtPassword.Text.Trim()))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "New Password should contain atleast one special character[!,@,#,$,..]");
                    return;
                }
                if (txtPassword.Text != string.Empty)
                {
                    strNewPassword = FAClsPubCommCrypto.EncryptText(txtPassword.Text.Trim());
                }
                else
                {
                    strNewPassword = hdnPassword.Value;
                }

                if (ProcPWDparam != null)
                {
                    ProcPWDparam.Clear();
                }
                ProcPWDparam.Add("@User_ID", intUserId.ToString());
                ProcPWDparam.Add("@Password", strNewPassword);
                ProcPWDparam.Add("@Company_ID", intCompanyID.ToString());

                dsChagePWD = Utility_FA.GetDataset("FA_SA_UPD_CHANGE_PASSWORD", ProcPWDparam);

                if (dsChagePWD.Tables[1].Rows.Count > 0)
                {
                    intGPSPwdItrCount = Convert.ToInt32(dsChagePWD.Tables[1].Rows[0]["PWD_Itr_Count"].ToString());
                }

                if (dsChagePWD.Tables[0].Rows.Count > 0)
                {
                    intErrorCode = Convert.ToInt32(dsChagePWD.Tables[0].Rows[0]["ErrorCode"].ToString());

                    if (intErrorCode == 1)
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "You cannot enter previous " + intGPSPwdItrCount + " passwords.");
                        chkResetPwd.Checked = false;
                        txtPassword.Text = "";
                        return;
                    }
                }
            }
            #endregion Password Policy

            if (!FunChkPageValidations())
                FunPriSaveUserDetails();


        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            //lblErrorMessage.Text = ex.Message;
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;

        }
        finally
        {
            if (objUserManagementClient != null)
                objUserManagementClient.Close();
        }
    }

    /// <summary>
    /// this method is used to return true or false based on all page level validation.
    /// </summary>
    /// <returns></returns>
    private bool FunChkPageValidations()
    {
        bool IsError = false;
        try
        {



            if (!string.IsNullOrEmpty(ddlReportingLevel.SelectedValue) && !string.IsNullOrEmpty(ddlReportingLevel.SelectedValue))
            {
                if (ddlReportingLevel.SelectedValue != "0" && ddlReportingLevel.SelectedValue != "0")
                    if (ddlReportingLevel.SelectedValue == ddlReportingLevel.SelectedValue)
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "Reporting level and Higher level cannot be the same user");//Error Code 502
                        //Utility_FA.FunShowValidationMsg_FA(this, 502);
                        //return true;
                    }
            }

            if (ddlCopyProfile.SelectedValue == "0")
            {
                bool istreechecked = false;
                foreach (TreeNode node in treeview.CheckedNodes)
                {
                    istreechecked = true;
                }
                if (!istreechecked)
                {
                    //Utility_FA.FunShowAlertMsg_FA(this.Page, "Select atleast one Location");//Error Code 503
                    Utility_FA.FunShowValidationMsg_FA(this, 503);
                    return true;
                }

                //For roles
                bool istreecheckedR = false;
                foreach (GridViewRow gvnode in grvRoleCode.Rows)
                {
                    CheckBox chkSelRoleCode = (CheckBox)gvnode.FindControl("chkSelRoleCode");
                    if (chkSelRoleCode.Checked)
                        istreecheckedR = true;
                }
                if (!istreecheckedR)
                {
                    //Utility_FA.FunShowAlertMsg_FA(this.Page, "Select atleast one Role Code");//Error Code 504
                    Utility_FA.FunShowValidationMsg_FA(this, 504);
                    return true;
                }

            }
        }
        catch (Exception ex)
        {

        }
        return IsError;
    }

    /// <summary>
    /// this method is used to save the user details.
    /// </summary>
    private void FunPriSaveUserDetails()
    {
        try
        {
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow;
            ObjUserManagementRow = ObjS3G_SYSAD_UserManagementDataTable.NewFA_SYS_UserManagementRow();
            ObjUserManagementRow.Company_ID = intCompanyID;
            ObjUserManagementRow.User_Code = txtUserCode.Text;
            ObjUserManagementRow.User_Name = txtUserName.Text.Trim();

            if ((intUserId > 0) && (!chkResetPwd.Checked))
            {
                ObjUserManagementRow.Password = "0";
            }
            else
            {
                if (txtPassword.Text != string.Empty)
                {
                    ObjUserManagementRow.Password = FAClsPubCommCrypto.EncryptText(txtPassword.Attributes["value"].Trim());
                }
                else
                    ObjUserManagementRow.Password = hdnPassword.Value;
            }

            ObjUserManagementRow.Email_ID = txtEMailId.Text.Trim();
            ObjUserManagementRow.DOJ = Utility_FA.StringToDate(txtDateofJoining.Text);
            ObjUserManagementRow.Designation = txtDesignation.Text.Trim();
            ObjUserManagementRow.Mobile_No = txtMobileNo.Text;
            ObjUserManagementRow.Created_By = intCreatedBy;
            ObjUserManagementRow.Is_Active = chkActive.Checked;
            ObjUserManagementRow.User_Level_ID = Convert.ToInt32(ddlLevel.SelectedValue);
            ObjUserManagementRow.Current_Period = chkCurrent_Period.Checked;
            ObjUserManagementRow.Prior_Period = chkPrior_Period.Checked;
            if (!string.IsNullOrEmpty(ddlReportingLevel.SelectedValue))
                ObjUserManagementRow.Reporting_Next_level = Convert.ToInt32(ddlReportingLevel.SelectedValue);
            else
                ObjUserManagementRow.Reporting_Next_level = 0;
            if (!string.IsNullOrEmpty(ddlHigherLevel.SelectedValue))
                ObjUserManagementRow.Reporting_Higher_level = Convert.ToInt32(ddlHigherLevel.SelectedValue);
            else
                ObjUserManagementRow.Reporting_Higher_level = 0;
            ObjUserManagementRow.Is_Active = chkActive.Checked;
            ObjUserManagementRow.User_ID = intUserId;
            if (!string.IsNullOrEmpty(ddlCopyProfile.SelectedValue))
                ObjUserManagementRow.CopyProfile_User_ID = Convert.ToInt32(ddlCopyProfile.SelectedValue);
            else
                ObjUserManagementRow.CopyProfile_User_ID = 0;

            if (intUserId > 0)
            {
                if (ddlAction.SelectedIndex > 0)
                {
                    ObjUserManagementRow.DelMod = Convert.ToInt32(ddlAction.SelectedValue);//0-Deletion//1-Modification
                }
                else
                {
                    ObjUserManagementRow.DelMod = -1;
                }

            }
            else
            {
                ObjUserManagementRow.DelMod = -1;
            }

            ObjUserManagementRow.Mode = 1;

            FunGetBranchRoleSelectedDet();
            ObjUserManagementRow.XMLLocationDet = strbSelLocation.ToString();
            ObjUserManagementRow.XMLRoleCodeDet = strbSelRoleCode.ToString();



            ObjS3G_SYSAD_UserManagementDataTable.AddFA_SYS_UserManagementRow(ObjUserManagementRow);

            intErrCode = objUserManagementClient.FunPubCreateUserInt(SerMode, FAClsPubSerialize.Serialize(ObjS3G_SYSAD_UserManagementDataTable, SerMode), strConnectionName);
            switch (intErrCode)
            {
                case 505:
                case 506:

                    if (intUserId > 0)
                    {
                        string strFileName = Server.MapPath(@"~\Data\UserManagement\" + intUserId.ToString() + ".xml");
                        if (File.Exists(strFileName))
                        {
                            File.Delete(strFileName);
                        }

                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "User details updated successfully", strRedirectPage);
                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "User details updated successfully");
                        Utility_FA.FunShowValidationMsg_FA(this, intErrCode, strRedirectPageView, strRedirectPageView, strMode, false);
                    }
                    else
                    {
                        //strAlert = "User details added successfully";
                        //strAlert += @"\n\nWould you like to add one more user?";
                        //strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                        //strRedirectPageView = "";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                        Utility_FA.FunShowValidationMsg_FA(this, intErrCode, strRedirectPageAdd, strRedirectPageView, strMode, false);

                        lblErrorMessage.Text = string.Empty;
                    }
                    break;
                default:
                    Utility_FA.FunShowValidationMsg_FA(this, intErrCode);
                    break;



            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + "window.location.href='" + strRedirectPage + "';", true);
            lblErrorMessage.Text = string.Empty;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This is used to redirect page 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriCancel();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    /// <summary>
    /// this method is used to redirect to view page when cancel button clicked
    /// </summary>
    private void FunPriCancel()
    {
        try
        {
            Response.Redirect(strRedirectPage);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }


    /// <summary>
    /// This is used to tick selected checkbox when records bind in grid
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void grvRoleCode_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                CheckBox chkSelRoleCode = (CheckBox)e.Row.FindControl("chkSelRoleCode");
                if (!bModify || strMode == "Q")
                {
                    chkSelRoleCode.Enabled = false;

                }
                chkSelRoleCode.Attributes.Add("onclick", "javascript:fnGridUnSelect('" + grvRoleCode.ClientID + "','chkAll','chkSelRoleCode');");

            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAll");
                chkAll.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + grvRoleCode.ClientID + "',this,'chkSelRoleCode');");
                if (!bModify || strMode == "Q")
                {
                    chkAll.Enabled = false;
                }
            }

        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }



    }

    /// <summary>
    /// this event is used to get the user details for the selected copy profile user.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlCopyProfile_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriCopyProfile();

        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }

        finally
        {
            if (objUserManagementClient != null)
                objUserManagementClient.Close();
        }
    }


    /// <summary>
    /// this method is used to get the user details for the selected copy profile user.
    /// </summary>
    private void FunPriCopyProfile()
    {
        try
        {
            if (ddlCopyProfile.SelectedValue == "0")
            {
                ddlCopyProfile.Enabled = false;
                chkCopyProfile.Checked = false;
                chkCurrent_Period.Checked = true;
                chkPrior_Period.Checked = false;
                //RfvddlLOB.Enabled = true;
                FunGetUserDetails();
                //grvRoleCode.DataSource = null;
                //grvRoleCode.DataBind();
                //txtDesignation.Text = "";
                ddlLevel.SelectedIndex = 0;
                //ddlReportingLevel.SelectedIndex = 0;
                // ddlHigherLevel.SelectedIndex = 0;
                ddlReportingLevel.Clear_FA();
                ddlHigherLevel.Clear_FA();
                TPLevelAccessDtls.Enabled = true;
                return;
            }
            //RfvddlLOB.Enabled = false;
            ddlCopyProfile.Enabled = true;

            intUserId = Convert.ToInt32(ddlCopyProfile.SelectedValue);

            FunGetUserDetails();
            TPLevelAccessDtls.Enabled = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// this event is used to check the user going to modify or delete the access.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 

    protected void txtPassword_Changed(object sender, EventArgs e)
    {
        try
        {
            hdnPassword.Value = FAClsPubCommCrypto.EncryptText(txtPassword.Text.Trim());
        }
        catch (Exception ex)
        {
 
        }
    }

    protected void ddlAction_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriActionEvent();
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    /// <summary>
    /// this event is used to check the user Level4/5 report&higher Level is optional.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriSetRepoHigherLevel();
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }
    /// <summary>
    /// this method is used to check the user going to modify or delete the access.
    /// </summary>
    private void FunPriActionEvent()
    {
        try
        {
            //btnSave.Text = "Save";
            grvRoleCode.Enabled = true;
            if (ddlAction.SelectedIndex > 0)
            {
                if (ddlAction.SelectedValue == "0")//Deletion
                {
                    //btnSave.Text = "Delete";
                }

            }
            else
                grvRoleCode.Enabled = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to check the user Level4/5 report&higher Level is optional.
    /// </summary>
    private void FunPriSetRepoHigherLevel()
    {
        try
        {
            if (Convert.ToInt32(ddlLevel.SelectedValue) > 3)//for Level4/5
            {
                ddlReportingLevel.IsMandatory = ddlHigherLevel.IsMandatory = false;
            }
            else
            {
                ddlReportingLevel.IsMandatory = ddlHigherLevel.IsMandatory = true;
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion

    #region Page Methods

    //Pending
    /// <summary>
    /// This method is used to display User details
    /// </summary>
    private void FunGetUserDetails()
    {
        try
        {
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow;
            ObjUserManagementRow = ObjS3G_SYSAD_UserManagementDataTable.NewFA_SYS_UserManagementRow();

            ObjUserManagementRow.Company_ID = intCompanyID;
            ObjUserManagementRow.User_ID = intUserId;

            ObjS3G_SYSAD_UserManagementDataTable.AddFA_SYS_UserManagementRow(ObjUserManagementRow);

            if (ddlCopyProfile.SelectedValue != "0")
            {
                strMode = "M";
            }
            byte[] byteBranchRoleDetails = objUserManagementClient.FunPubQueryBranchRoleDetails(SerMode, FAClsPubSerialize.Serialize(ObjS3G_SYSAD_UserManagementDataTable, SerMode), strMode, strConnectionName);
            dsBranchRole = (DataSet)FAClsPubSerialize.DeSerialize(byteBranchRoleDetails, FASerializationMode.Binary, typeof(DataSet));

            if (intUserId > 0)
            {
                byte[] byteUserDetails = objUserManagementClient.FunPubQueryUser(SerMode, FAClsPubSerialize.Serialize(ObjS3G_SYSAD_UserManagementDataTable, SerMode), strConnectionName);

                ObjS3G_SYSAD_UserManagementDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(byteUserDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
                hdnID.Value = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Created_By"].ToString();
                if (ddlCopyProfile.SelectedValue == "0")
                {
                    txtUserCode.Text = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["User_Code"].ToString();
                    txtUserName.Text = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["User_Name"].ToString();
                    txtMobileNo.Text = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Mobile_No"].ToString();
                    txtEMailId.Text = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Email_ID"].ToString();
                    txtDateofJoining.Text = DateTime.Parse(ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["DOJ"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                }
                else
                {
                    txtDateofJoining.Text = DateTime.Now.ToString(strDateFormat);
                }
                //txtDesignation.Text = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Designation"].ToString();
                txtDesignation.SelectedValue = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Designation_ID"].ToString();
                ddlLevel.SelectedValue = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["User_Level_ID"].ToString();
                FunPriSetRepoHigherLevel();
                if (!string.IsNullOrEmpty(ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_Next_Name"].ToString()))
                {
                    ddlReportingLevel.SelectedValue = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_Next_level"].ToString();
                    ddlReportingLevel.SelectedText = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_Next_Name"].ToString();
                }

                if (!string.IsNullOrEmpty(ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_High_Name"].ToString()))
                {
                    ddlHigherLevel.SelectedValue = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_Higher_level"].ToString();
                    ddlHigherLevel.SelectedText = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Reporting_High_Name"].ToString();
                }



                chkCurrent_Period.Checked = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Current_Period"].ToString() == "True" ? true : false;
                chkPrior_Period.Checked = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Prior_Period"].ToString() == "True" ? true : false;

                chkActive.Checked = ObjS3G_SYSAD_UserManagementDataTable.Rows[0]["Is_Active"].ToString() == "True" ? true : false;

            }

            if (dsBranchRole.Tables[0].Rows.Count > 0)
            {
                ViewState["Locationss"] = dsBranchRole.Tables[0];

            }
            if (dsBranchRole.Tables[1].Rows.Count > 0)
            {
                grvRoleCode.DataSource = dsBranchRole.Tables[1];
                grvRoleCode.DataBind();
                FunPriChkAllRecords("grvRoleCode");

            }

        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
        finally
        {
            dsBranchRole.Dispose();
            dsBranchRole = null;

        }
    }

    /// <summary>
    /// this method is used to check all chaeck boxes if we select All in server side.
    /// </summary>
    /// <param name="gridName"></param>
    private void FunPriChkAllRecords(string gridName)
    {
        try
        {
            bool booCheckedAll = true;
            switch (gridName)
            {
                case "grvRoleCode":
                    CheckBox chkallRoleCode = grvRoleCode.HeaderRow.FindControl("chkAll") as CheckBox;
                    CheckBox chkSelRoleCode = null;

                    foreach (GridViewRow grvData in grvRoleCode.Rows)
                    {
                        chkSelRoleCode = ((CheckBox)grvData.FindControl("chkSelRoleCode"));
                        if (!chkSelRoleCode.Checked)
                        {
                            booCheckedAll = false;
                            break;
                        }

                    }

                    if (booCheckedAll)
                    {
                        chkallRoleCode.Checked = true;
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to load the default treeview using the location master
    /// </summary>
    private void FunPriloadLocationTreeview()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            DataSet ds = new DataSet();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            ds = Utility_FA.GetDataset("FA_SYS_GETLOCATIONTREEVIEW", Procparam);
            ds.DataSetName = "Menus";
            ds.Tables[0].TableName = "Menu";
            //ViewState["TVMAxLevel"] = ds.Tables[0].Compute("max(Hierarchy_Type)", "Hierarchy_Type>0");
            DataRelation relation = new DataRelation("ParentChild",
            ds.Tables[0].Columns["Location_ID"],
            ds.Tables[0].Columns["pid"], true);
            //ds.Tables[0].Columns["Is_Operational"].DataType = System.Boolean;
            relation.Nested = true;
            ds.Relations.Add(relation);

            XmlDataSource1.Data = ds.GetXml();
            XmlDataSource1.DataBind();
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// this event is fired when we change the checkbox in treeview.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void treeview_OnTreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    {
        try
        {
            FunNodeCheckChildnode(e.Node);
            FunPriLocationbasedRoles();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }

    }

    /// <summary>
    /// this method is used to load the Roles(Program access) based on Locations
    /// </summary>
    private void FunPriLocationbasedRoles()
    {
        try
        {
            string strSelLocations = "";
            foreach (TreeNode node in treeview.CheckedNodes)
            {
                strSelLocations += node.Value + ",";
            }
            if (strSelLocations.Length > 0)
                strSelLocations = strSelLocations.Remove(strSelLocations.Length - 1);
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@User_ID", intUserId.ToString());
            Procparam.Add("@Location_ID", strSelLocations);
            Procparam.Add("@Strmode", strMode);
            DataTable dttble = new DataTable();
            dttble = Utility_FA.GetDefaultData("FA_SYS_GETUSERLOCROLEDETAILS", Procparam);
            //FunNodeCheckParentnode(e.Node);

            if (dttble.Rows.Count > 0)
            {
                grvRoleCode.DataSource = dttble;
                grvRoleCode.DataBind();
                FunPriChkAllRecords("grvRoleCode");
            }
            else
            {
                grvRoleCode.DataSource = null;
                grvRoleCode.DataBind();
                FunPriChkAllRecords("grvRoleCode");
            }


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used ot check the parent node if child node is checked.
    /// </summary>
    /// <param name="e"></param>
    private void FunNodeCheckParentnode(TreeNode e)
    {
        try
        {

            e.Parent.Checked = false;
            if (e.Parent.Parent != null)
            {
                FunNodeCheckParentnode(e.Parent);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }


    /// <summary>
    /// This method is used to Clear_FA all checked items in a treeview.
    /// </summary>
    /// <param name="e"></param>
    private void FunNodeClearCheck(TreeNode e)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {
                e.ChildNodes[i].Checked = false;
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeClearCheck(e.ChildNodes[i]);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }



    /// <summary>
    /// this method is used to checkthe treeview based on the location
    /// </summary>
    /// <param name="e"></param>
    /// <param name="dtLocation"></param>


    private void FunNodeCheckMod(TreeNode e, DataTable dtLocation)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {

                foreach (DataRow dr in dtLocation.Rows)
                {
                    if (dr["Location_Id"].ToString() == e.ChildNodes[i].Value)
                        e.ChildNodes[i].Checked = true;

                }
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeCheckMod(e.ChildNodes[i], dtLocation);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// this method is used to chek the child nodes when parent node checked.
    /// </summary>
    /// <param name="e"></param>
    private void FunNodeCheckChildnode(TreeNode e)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {
                e.ChildNodes[i].Checked = e.Checked;
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeCheckChildnode(e.ChildNodes[i]);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }


    }


    /// <summary>
    /// This is used to bind user code in dropdownlist
    /// </summary>
    private void FunBindUserCode()
    {
        try
        {
            //FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListRow ObjUserMasterRow;
            //ObjUserMasterRow = ObjS3G_SYSAD_UserMasterDataTable.NewFA_SYS_UserMaster_ListRow();
            //ObjUserMasterRow.Company_ID = intCompanyID;
            //ObjUserMasterRow.User_ID = intUserId;
            //ObjS3G_SYSAD_UserMasterDataTable.AddFA_SYS_UserMaster_ListRow(ObjUserMasterRow);
            //byte[] byteUserDetails = objUserManagementClient.FunPubQueryUserMaster(SerMode, FAClsPubSerialize.Serialize(ObjS3G_SYSAD_UserMasterDataTable, SerMode), strConnectionName);
            //ObjS3G_SYSAD_UserMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable)FAClsPubSerialize.DeSerialize(byteUserDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable));

            ObjUserInfo_FA = new UserInfo_FA();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANY_ID", intCompanyID.ToString());
            Procparam.Add("User_ID", intUserId.ToString());
            DataTable dtUserName = new DataTable();
            // dtUserName = Utility_FA.GetDefaultData("FA_Sys_GetUserCodeDtls", Procparam);

            //ddlReportingLevel.FillDataTable(dtUserName, "User_ID", "User_Name");
            //ddlHigherLevel.FillDataTable(dtUserName, "User_ID", "User_Name");

            //Current user can not be reporting level user or higher level Removing current user id
            //ddlHigherLevel.Items.Remove(ddlHigherLevel.Items.FindByValue(ObjUserInfo_FA.ProUserIdRW.ToString()));
            //ddlReportingLevel.Items.Remove(ddlReportingLevel.Items.FindByValue(ObjUserInfo_FA.ProUserIdRW.ToString()));
            //
            // ddlCopyProfile.FillDataTable(dtUserName, "User_ID", "User_Name");



        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    // changed by bhuvana for performance on October 3rd 2013//
    [System.Web.Services.WebMethod]
    public static string[] GetUsers(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();

        Procparam.Add("@Company_ID", obj_Page.intCompanyID.ToString());
        Procparam.Add("@User_ID", obj_Page.intUserId.ToString());
        Procparam.Add("@Prefix", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_Sys_GetUserCodeDtls_AGT", Procparam));

        return suggetions.ToArray();
    }

    //end here//

    /// <summary>
    /// This is used to get branch and role details based on region and user
    /// </summary>

    private void FunGetBranchRoleSelectedDet()
    {
        try
        {
            CheckBox chkBranch = null;
            string strLocationID = string.Empty;
            string strRegionID = string.Empty;

            strbSelLocation.Append("<Root>");

            foreach (TreeNode node in treeview.CheckedNodes)
            {
                strLocationID = node.Value;
                strbSelLocation.Append(" <Details Location_ID='" + strLocationID + "' /> ");
            }
            strbSelLocation.Append("</Root>");

            CheckBox chkRoleCode = null;
            string strRoleCenterID = string.Empty;
            string strCurrentPeriod = string.Empty;
            string strPriorPeriod = string.Empty;

            strbSelRoleCode.Append("<Root>");
            foreach (GridViewRow grvData in grvRoleCode.Rows)
            {
                chkRoleCode = ((CheckBox)grvData.FindControl("chkSelRoleCode"));


                if (chkRoleCode.Checked)
                {
                    strRoleCenterID = ((Label)grvData.FindControl("lblRoleCenterID")).Text;
                    strbSelRoleCode.Append(" <Details RoleCode_ID='" + strRoleCenterID + "' /> ");
                }
            }
            strbSelRoleCode.Append("</Root>");

            CheckBox chkLOB = null;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion


    /// <summary>
    /// this event is called when copy profile checkbox is checked
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkCopyProfile_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            FunPrichkCopyProfileChecked();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
        finally
        {
            objUserManagementClient.Close();
        }

    }

    /// <summary>
    /// this method is called when copy profile checkbox is checked
    /// </summary>
    private void FunPrichkCopyProfileChecked()
    {
        try
        {
            //if (ddlCopyProfile.SelectedIndex > 0)
            //    ddlCopyProfile.SelectedIndex = 0;
            ddlCopyProfile.Clear_FA();
            ddlCopyProfile.Enabled = chkCopyProfile.Checked;
            if (!chkCopyProfile.Checked)
            {
                grvRoleCode.DataSource = null;
                grvRoleCode.DataBind();
                //txtDesignation.Text = "";
                ddlLevel.SelectedIndex = 0;
                //ddlReportingLevel.SelectedIndex = 0;
                //ddlHigherLevel.SelectedIndex = 0;
                // RFVCopyProfile.Enabled = false;
                ddlReportingLevel.Clear_FA();
                ddlHigherLevel.Clear_FA();
                ddlCopyProfile.IsMandatory = false;
                TPLevelAccessDtls.Enabled = true;
            }
            else
            {
                //RFVCopyProfile.Enabled = true;
                ddlCopyProfile.IsMandatory = true;
                TPLevelAccessDtls.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// this method is used to control the methods based on modes.
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                        btnSave.Enabled_False();
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    txtDateofJoining.Text = DateTime.Now.ToString(strDateFormat);
                    chkActive.Enabled = false;
                    chkResetPwd.Checked = true;
                    //chkCopyLobprofile.Enabled = ddlCopyLOb.Enabled = lblLOBCpyProfile.Enabled = false;
                    lblAction.Enabled = ddlAction.Enabled = false;
                    chkCurrent_Period.Enabled = false;
                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        btnSave.Enabled_False();
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    txtUserCode.Enabled = false;
                    txtUserName.Enabled = false;
                    txtDateofJoining.Enabled = false;
                    btnClear.Enabled_False();
                    txtPassword.Attributes.Add("value", "*************");
                    //txtPassword.Text = "*************";
                    txtPassword.Enabled = false;
                    ddlCopyProfile.Enabled = false;
                    chkResetPwd.Checked = false;
                    divReset.Style.Add("display", "Block");
                    chkCopyProfile.Enabled = false;
                    CalendarExtender1.Enabled = false;
                    rfvPassword.Enabled = false;
                    lblAction.Enabled = ddlAction.Enabled = true;
                    grvRoleCode.Enabled = false;

                    chkCurrent_Period.Enabled = false;

                    break;

                case -1:// Query Mode   
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }
                    //ddlCopyProfile.Enabled = true;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    if (bClearList)
                    {
                        //ddlLevel.ClearDropDownList_FA();
                        // ddlReportingLevel.ClearDropDownList_FA();
                        //ddlHigherLevel.ClearDropDownList_FA();
                        ddlCopyProfile.ReadOnly = true;
                        ddlLevel.ClearDropDownList_FA();
                        ddlReportingLevel.ReadOnly = true;
                        ddlHigherLevel.ReadOnly = true;
                    }
                    chkActive.Enabled = false;
                    txtDesignation.ClearDropDownList_FA();
                    txtEMailId.ReadOnly = true;
                    txtMobileNo.ReadOnly = true;
                    txtUserCode.ReadOnly = true;
                    txtUserName.ReadOnly = true;
                    txtDateofJoining.ReadOnly = true;
                    btnClear.Enabled_False();
                    btnSave.Enabled_False();
                    //btnRemoveLOB.Enabled = false;
                    txtPassword.Attributes.Add("value", "*************");
                    txtPassword.ReadOnly = true;
                    chkResetPwd.Disabled = true;
                    divReset.Style.Add("display", "Block");
                    chkCopyProfile.Enabled = false;
                    ddlCopyProfile.Enabled = false;
                    CalendarExtender1.Enabled = false;
                    //chkCopyLobprofile.Enabled = ddlCopyLOb.Enabled = lblLOBCpyProfile.Enabled = false;
                    lblAction.Enabled = ddlAction.Enabled = false;
                    chkCurrent_Period.Enabled = chkPrior_Period.Enabled = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    grvRoleCode.Columns[2].Visible = false;
                    break;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriloadDesignation()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            txtDesignation.BindDataTable_FA("FA_GET_DESIGN", Procparam, new string[] { "DESIGNATION_ID", "DESIGNATION_NAME" });
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    // Added By R. Manikandan PSWD Policy 
    #region Methods to check GPS Password Policy values

    private bool pwdHasCapitals(string text)
    {
        foreach (char c in text)
        {
            if (char.IsUpper(c))
                return true;
        }
        return false;
    }

    private bool pwdHasNumbers(string text)
    {
        foreach (char c in text)
        {
            if (char.IsNumber(c))
                return true;
        }
        return false;
    }

    private bool pwdHasSpecChar(string text)
    {
        foreach (char c in text)
        {
            if (!char.IsLetterOrDigit(c))
                return true;
        }
        return false;
    }

    # endregion Methods to check GPS values

}
