#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Common
/// Screen Name			: Master Page
/// Created By			: Kaliraj K
/// Created Date		: This master page is used for new window pages
#endregion

#region NameSpaces
using System;
using System.Threading;
using System.Globalization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using AjaxControlToolkit;
using System.Configuration;
using System.IO.Compression;
using System.IO;

#endregion

namespace SmartLend3G
{
    public partial class S3GMasterPageCollapse : System.Web.UI.MasterPage
    {
        #region Intialization
        string strLocalization;
        UserInfo ObjUserInfo;
        string strMenuText;
        Dictionary<string, string> Procparam = null;
        #endregion

        #region Page Load
        private void FunPriCheckIfFileExits()
        {
            String strPath = Server.MapPath(@"~\Data\UserManagement\" + ObjUserInfo.ProUserIdRW.ToString() + "_Disc.xml");
            if (File.Exists(strPath))
            {
                File.Delete(strPath);
                Utility.FunPubKillSession();
                //string strRedirectPageView = "window.location.href='../LoginPage.aspx';";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), new Guid().ToString(), "<script>forceClose();</script>", false);
            }
        }
        private void FunPriCheckIfUserIsActive()
        {
            try
            {
                if (Session["Last_Used_Time"] == null)
                {
                    Session["Last_Used_Time"] = DateTime.Now;
                    FunPriUpdateUserAsActive(Convert.ToDateTime(Session["Last_Used_Time"]));
                }
                else
                {
                    DateTime Now = DateTime.Now;
                    DateTime LoggedIn = Convert.ToDateTime(Session["Last_Used_Time"]);
                    TimeSpan Diff = Now - LoggedIn;

                    if (Diff.Minutes > 15 && Diff.Minutes < 45)
                    {
                        Session["Last_Used_Time"] = DateTime.Now;
                        FunPriUpdateUserAsActive(Convert.ToDateTime(Session["Last_Used_Time"]));
                    }
                }
            }
            catch (Exception e)
            {
                throw e;
            }

        }
        private void FunPriUpdateUserAsActive(DateTime ActiveDateTime)
        {
            S3GAdminServicesReference.S3GAdminServicesClient ObjAdminServiceClient = new S3GAdminServicesReference.S3GAdminServicesClient();
            try
            {

                int ErrorCode = ObjAdminServiceClient.FunPubUpdateUserIsActive(ActiveDateTime, ObjUserInfo.ProUserIdRW, ObjUserInfo.ProCompanyIdRW, 0);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                ObjAdminServiceClient.Close();
            }
        }
        /// <summary>
        /// Page Load Event
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            ObjUserInfo = new UserInfo();
            try
            {
                //By Chandu to forcefully LogOut User on 22-Aug-2013
                FunPriCheckIfFileExits();
                //By Chandu to forcefully LogOut User

                ///By Chandu For Checking if the user is active on 12-Aug-2013
                FunPriCheckIfUserIsActive();
                ///By Chandu For Checking if the user is active
            }
            catch (Exception ex)
            {
                throw ex;
            }
            string strPageUrl = Request.Url.ToString();

            string strPageName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);
            strPageUrl = strPageUrl.Replace(strPageName, "");
            strPageUrl = strPageUrl.TrimEnd('/');
            string strModuleName = strPageUrl.Substring(strPageUrl.LastIndexOf("/") + 1);
            hdndate.Value = DateTime.Today.ToString();
            //Added by Suseela - To connect FA code statrs 
            ObjUserInfo = new UserInfo();
            int UserID = ObjUserInfo.ProUserIdRW;
            int intCompany_ID = ObjUserInfo.ProCompanyIdRW;

            Procparam = new Dictionary<string, string>();
            DataTable dtUserDtls = new DataTable();

            Procparam.Add("@UserID", ObjUserInfo.ProUserIdRW.ToString());
            dtUserDtls = Utility.GetDefaultData("S3G_SYSAD_USERDETAILSFA", Procparam);
            string strUserCode = dtUserDtls.Rows[0]["USER_CODE"].ToString();
            string strPwd = dtUserDtls.Rows[0]["PASSWORD"].ToString();
            string strUserID = dtUserDtls.Rows[0]["USER_ID"].ToString();

            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            string strFAConnection = (string)AppReader.GetValue("FA_LOGIN", typeof(string));

            System.Configuration.AppSettingsReader AppWebReader = new System.Configuration.AppSettingsReader();
            string strWebConnection = (string)AppReader.GetValue("WEB_CRM_LOGIN", typeof(string));

            //BRS SUB SYSTEM CODE ADDED ON 28-09-21, STARTS HERE
            System.Configuration.AppSettingsReader AppBRSReader = new System.Configuration.AppSettingsReader();
            string strBRSConnection = (string)AppReader.GetValue("BRS_LOGIN", typeof(string));
            //BRS SUB SYSTEM CODE ADDED ON 28-09-21, ENDS HERE

            if (strPageName == "S3GFinancialAccounting.aspx" && strModuleName == "Sub System")
            {
                //string strScipt = "window.open('http://siststs3g02:9003/LoginPage.aspx?UID=" + strUserCode + "&PWD=" + strPwd + "&CID=" + intCompany_ID + "');";
                string strScipt = "window.open('" + strFAConnection + "?UID=" + strUserCode + "&PWD=" + strPwd + "&CID=" + intCompany_ID + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "master", strScipt, true);
            }
            if (strPageName == "S3GCRMWEB.aspx" && strModuleName == "Sub System")
            {
                string strScipt = "window.open('" + strWebConnection + "?UID=" + strUserCode + "&PWD=" + strPwd + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "master", strScipt, true);
            }

            //BRS SUB SYSTEM CODE ADDED ON 28-09-21, STARTS HERE
            if (strPageName == "S3GBRS.aspx" && strModuleName == "Sub System")
            {
                string strScipt = "window.open('" + strBRSConnection + "?UID=" + strUserCode + "&PWD=" + strPwd + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "master", strScipt, true);
            }
            //BRS SUB SYSTEM CODE ADDED ON 28-09-21, ENDS HERE

            //Added by Suseela - code ends 
            strLocalization = ObjUserInfo.ProLocalizationRW;
            if (ObjUserInfo.ProUserNameRW != null)
            {
                FunPriSetPageTitle();
            }
            else
            {
                Response.Redirect("~/SessionExpired.aspx");
            }

            //WebControl ctrl = GetPostBackControl() as WebControl;
            //if (ctrl != null && !SetNextFocus(Controls, ctrl.TabIndex + 1)) { ctrl.Focus(); }
            if (!IsPostBack)
            {
                if (!(strPageName == "S3GFinancialAccounting.aspx" && strPageName == "S3GCRMWEB.aspx" && strPageName == "S3GBRS.aspx"))
                {
                    getControls(strPageName);
                }
            }
        }

        #endregion

        public Control GetPostBackControl()
        {
            try
            {
                Control control = null;

                Page page = (HttpContext.Current.Handler as Page);
                string ctrlname1 = ScriptManager.GetCurrent(page).AsyncPostBackSourceElementID;

                var tabContainer = page.FindControl(ctrlname1) as AjaxControlToolkit.ComboBox;


                string ctrlname = Request.Params.Get("__EVENTTARGET");
                if (ctrlname1 != null && ctrlname1 != string.Empty && ctrlname1 != "null")
                {
                    control = FindControl(ctrlname);
                    if (control != null)
                        control.Focus();
                    else
                    {
                        foreach (string ctl in Request.Form)
                        {
                            if (ctl != null)
                            {
                                Control c = FindControl(ctl);

                                if (c != null && c.ClientID.Replace("$", "_").Contains(ctrlname1))
                                {
                                    control = c;
                                    c.Focus();
                                    break;
                                }
                            }
                        }
                    }
                }
                return control;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private bool SetNextFocus(ControlCollection controls, int tabIndex)
        {
            foreach (Control control in controls)
            {
                if (control.HasControls())
                {
                    bool found = SetNextFocus(control.Controls, tabIndex);
                    if (found) { return true; }
                }

                WebControl webControl = control as WebControl;
                if (webControl == null) { continue; }
                if (webControl.TabIndex != tabIndex) { continue; }

                webControl.Focus();
                return true;
            }

            return false;
        }







        /// <summary>
        /// Event triggered onPage Intialization
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {


            //Ramesh M for cultureinfo
            base.OnInit(e);
            //Modified by Nataraj Y to add localization to be obtained from Session variable 
            if (strLocalization != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(strLocalization);
                Thread.CurrentThread.CurrentCulture = new CultureInfo(strLocalization);
            }
            else
            {
                strLocalization = "en";//ConfigurationManager.AppSettings["localization"].ToString();
            }

            // FunPriLoadMenu();


        }

        private void FunPriSetPageTitle()
        {
            if (SiteMapPath1.Provider.CurrentNode != null)
            {
                string strPageTitle = SiteMapPath1.Provider.CurrentNode.Description;
                strPageTitle = "S3G - " + strPageTitle;
                this.Page.Title = strPageTitle;
            }

        }
        /// <summary>
        /// To Get and Set Dynamic Control name for each Page
        /// </summary>
        /// <param name="strPageName"></param>
        private void getControls(string strPageName)
        {
            string strProgram = string.Empty;
            DataTable dtUserData = new DataTable();
            Dictionary<string, string> dictProcParam = new Dictionary<string, string>();
            //dictProcParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictProcParam.Add("@Option", "791");
            if (strPageName.Trim() != string.Empty)
            {
                strProgram = strPageName.Split('?')[0].ToString().Trim();
                if (strPageName.Split('?').Length > 1)
                {
                    if (strPageName.Split('?')[1] != null && Convert.ToString(strPageName.Split('?')[1]).Contains("Chq"))
                    {
                        dictProcParam.Add("@Param1", strPageName.Trim());
                    }
                    else if (strPageName.Split('?')[1] != null && Convert.ToString(strPageName.Split('?')[1]).Contains("G"))
                    {
                        dictProcParam.Add("@Param1", strPageName.Trim());
                    }
                    else
                    {
                        dictProcParam.Add("@Param1", strProgram.Trim());
                    }
                }
                else
                {
                    dictProcParam.Add("@Param1", strProgram.Trim());
                }
            }

            dtUserData = Utility.GetDefaultData("S3G_OR_GET_CUSTLOOKUP", dictProcParam);
            if (dtUserData.Rows.Count > 0)
            {
                for (int rowcount = 0; rowcount <= dtUserData.Rows.Count - 1; rowcount++)
                {
                    LoopTextboxes(this.Page.Master.Controls, dtUserData.Rows[rowcount]["INPUT_COLUMN_NAME"].ToString(), dtUserData.Rows[rowcount]["TOOL_TIP"].ToString(), dtUserData.Rows[rowcount]["IS_UPPER"].ToString());
                    LoopLabelboxes(this.Page.Master.Controls, dtUserData.Rows[rowcount]["DISPLAY_COLUMN_NAME"].ToString(), dtUserData.Rows[rowcount]["DISPLAY_TEXT"].ToString(), dtUserData.Rows[rowcount]["TOOL_TIP"].ToString());
                    LoopDropdownboxes(this.Page.Master.Controls, dtUserData.Rows[rowcount]["INPUT_COLUMN_NAME"].ToString(), dtUserData.Rows[rowcount]["TOOL_TIP"].ToString(), dtUserData.Rows[rowcount]["IS_UPPER"].ToString());
                }
            }
        }

        private void LoopTextboxes(ControlCollection controlCollection, string strControlName, string strlblTooltip, string isUpper)
        {
            foreach (Control control in controlCollection)
            {
                if (control is TextBox)
                {
                    if (((TextBox)control).ID != null)
                    {
                        if (((TextBox)control).ClientID.ToUpper().EndsWith(strControlName.ToUpper()))
                        {
                            ((TextBox)control).ToolTip = strlblTooltip;
                            if (isUpper.Trim() != string.Empty && isUpper == "Y")
                            {
                                if (Convert.ToString(((TextBox)control).Attributes["class"]) != string.Empty)
                                {
                                    ((TextBox)control).CssClass = Convert.ToString(((TextBox)control).Attributes["class"]) + " styleDisplayText";
                                }
                                else
                                {
                                    ((TextBox)control).CssClass = "styleDisplayText";
                                }
                            }
                            break;
                        }
                    }
                }
                if (control.Controls != null)
                {
                    LoopTextboxes(control.Controls, strControlName, strlblTooltip, isUpper);
                }
            }
        }

        private void LoopLabelboxes(ControlCollection controlCollection, string strControlName, string strlblText, string strlblTooltip)
        {
            foreach (Control control in controlCollection)
            {
                if (control is Label)
                {
                    if (((Label)control).ID != null)
                    {
                        if (((Label)control).ID.ToUpper() == strControlName.ToUpper())
                        {
                            ((Label)control).Text = strlblText;
                            ((Label)control).ToolTip = strlblTooltip;
                            break;
                        }
                    }
                }
                if (control.Controls != null)
                {
                    LoopLabelboxes(control.Controls, strControlName, strlblText, strlblTooltip);
                }
            }
        }

        private void LoopDropdownboxes(ControlCollection controlCollection, string strControlName, string strlblTooltip, string isUpper)
        {
            foreach (Control control in controlCollection)
            {
                if (control is DropDownList)
                {
                    if (((DropDownList)control).ID != null)
                    {
                        if (((DropDownList)control).ID.ToUpper() == strControlName.ToUpper())
                        {
                            ((DropDownList)control).ToolTip = strlblTooltip;
                            break;
                        }
                    }
                }
                if (control.Controls != null)
                {
                    LoopDropdownboxes(control.Controls, strControlName, strlblTooltip, isUpper);
                }
            }
        }

    }



}