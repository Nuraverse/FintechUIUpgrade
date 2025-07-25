#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Global Parameter Setup
/// Created By			: Nataraj Y
/// Created Date		: 18-May-2010
/// Purpose	            : 
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 19-May-2010
/// Reason              : Global Parameter Setup
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 22-May-2010
/// Reason              : Global Parameter Setup
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 24-May-2010
/// Reason              : Global Parameter Setup
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 25-May-2010
/// Reason              : Global Parameter Setup
/// 
/// <Program Summary>
#endregion

#region NameSpaces
using System;
using System.Web;
using System.Data;
using System.Text;
using S3GBusEntity;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Xml;
using System.Xml.Linq;
using System.Linq;
using System.ServiceModel;
using AjaxControlToolkit;
#endregion

public partial class System_Admin_S3GSysAdminGlobalParamerterSetup_Add : ApplyThemeForProject
{
    #region Intialization
    int intGPSId = 0;
    int intMnthIdId = 0;
    int intMnthEndDetId = 0;
    int intCompanyId = 0;
    int intErrCode = 0;
    int intMaxMonth;
    int intUserId = 0;
    string strDateFormat;
    bool boolGPSDone = true;
    bool bModify = false;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    CompanyMgtServicesReference.CompanyMgtServicesClient objCompanyMasterClient;
    //AccountMgtServicesReference.AccountMgtServicesClient objAccountMgtServiceClient;
    S3GBusEntity.CompanyMgtServices.S3G_SYSAD_GlobalParameterSetupDataTable objS3G_SYSAD_GlobalParameterSetupDataTable;
    S3GBusEntity.CompanyMgtServices.S3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable objS3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable;
    SerializationMode SerMode = SerializationMode.Binary;
    public static System_Admin_S3GSysAdminGlobalParamerterSetup_Add obj_Page;
    string strKey = "Insert";
    string strMode;
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../Common/HomePage.aspx';";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminCompanyMaster_Add.aspx';";
    string strRedirectPage;
    #endregion

    #region PageLoad
    /// <summary>
    /// Page load Function will load default Global Param settings
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        UserInfo ObjUserInfo = new UserInfo();
        S3GSession ObjS3GSession = new S3GSession();
        txtEffectiveDate.Attributes.Add("readonly", "readonly");
        intGPSId = Convert.ToInt32(hdnGlobalParamId.Value);
        intMnthIdId = Convert.ToInt32(hdnMonth_End_Params_ID.Value);
        intMnthEndDetId = Convert.ToInt32(hdnMonth_End_Params_Det_ID.Value);
        intCompanyId = ObjUserInfo.ProCompanyIdRW;
        intUserId = ObjUserInfo.ProUserIdRW;
        strDateFormat = ObjS3GSession.ProDateFormatRW;
        bModify = ObjUserInfo.ProModifyRW;
        bQuery = ObjUserInfo.ProViewRW;
        bCreate = ObjUserInfo.ProCreateRW;
        bIsActive = ObjUserInfo.ProIsActiveRW;
        bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
        cexEffectiveDate.Format = strDateFormat;
        System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyId.ToString();
        System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = intUserId.ToString();
        obj_Page = this;
        if (!bIsActive)
        {
            btnSave.Enabled_False();
            btnClear.Enabled_False();
        }
        else
        {
            if (boolGPSDone)
            {
                //if (bMakerChecker)
                //{
                //Modified by saranya 10-Feb-2012 to validate user based on user level and Maker Checker
                //if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(intUserId), Convert.ToInt32(ObjUserInfo.ProUserLevelIdRW))))
                if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(intUserId), Convert.ToInt32(ObjUserInfo.ProUserLevelIdRW), true)))
                {
                    strMode = "M";
                }
                else
                {
                    strMode = "Q";
                }
                //}
                //else
                //{

                //    if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(hdnUserId.Value), Convert.ToInt32(hdnUserLevelId.Value))))
                //    {
                //        strMode = "M";

                //    }
                //    else
                //    {
                //        strMode = "Q";
                //    }
                //}


            }
            else
            {
                strMode = "C";
            }


        }
        if (!IsPostBack)
        {
            //if (DateTime.Now.Month > 3)
            //{
            //    intMaxMonth = 0;
            //}
            //else
            //{
            //    intMaxMonth = -1;
            //}
            intMaxMonth = 0;
            lblYearLock.Text = DateTime.Now.AddYears(intMaxMonth).Year.ToString() + "-" + DateTime.Now.AddYears(intMaxMonth).Year.ToString();
            lblMonthLock.Text = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString("00");



            funPriLoadFinYear();

            //ddlFinacialYear.FillFinancialYears();

            ddlFinancialMonth.FillFinancialMonth(lblYearLock.Text);
            ddlFinacialYear.SelectedValue = lblYearLock.Text;
            ddlFinancialMonth.SelectedValue = lblMonthLock.Text;
            //FunProLoadGPS(intCompanyId, lblYearLock.Text, lblMonthLock.Text);

            //ViewState["Mode"] = strMode;
            FunProLoadType(intCompanyId);
            FunProLoadGPS_New(intCompanyId, lblYearLock.Text, lblMonthLock.Text);
            FunProIntializeGridData();
            FunPriLoadLob();
            //FunPriEnableDisableGridControls(strMode);
            if (strMode == "M")
            {
                FunPriDisableControls(1);
            }
            else if (strMode == "Q")
            {
                FunPriDisableControls(-1);
            }
            else
            {
                FunPriDisableControls(0);
            }

        }

    }
    private void funPriLoadFinYear()
    {
        try
        {
            DataTable dt = new DataTable();
            Dictionary<string, string> dictProParm = new Dictionary<string, string>();
            dictProParm.Add("@Company_ID", intCompanyId.ToString());
            dt = Utility.GetDefaultData("S3G_SA_LOAD_FINYEAR", dictProParm);
            if (dt.Rows.Count > 0)
            {
                ddlFinacialYear.FillDataTable(dt, "FINYEAR", "FINYEAR");
                ddlFinacialYear.Items.RemoveAt(1);
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    public void FillFinancialYears(DropDownList ddlSourceControl)
    {
        try
        {
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");

            ddlSourceControl.Items.Insert(0, liSelect);

            System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear - 1) + "-" + (intCurrentYear - 1)), ((intCurrentYear - 1) + "-" + (intCurrentYear - 1)));
            ddlSourceControl.Items.Insert(1, liPSelect);

            System.Web.UI.WebControls.ListItem liCSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear) + "-" + (intCurrentYear)), ((intCurrentYear) + "-" + (intCurrentYear)));
            ddlSourceControl.Items.Insert(2, liCSelect);

            System.Web.UI.WebControls.ListItem liNSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear + 1) + "-" + (intCurrentYear + 1)), ((intCurrentYear + 1) + "-" + (intCurrentYear + 1)));
            ddlSourceControl.Items.Insert(3, liNSelect);

            // }

        }
        catch (Exception exp)
        {
            throw exp;
        }

    }
    #endregion

    #region Page Events

    /// <summary>
    /// Main Save Button inserts and & Modifies GPS Details into Table
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
        DataTable dtTable = new DataTable();
        try
        {
            if (Convert.ToDecimal(txtMaxDigit.Text) == 0)
            {
                strAlert = strAlert.Replace("__ALERT__", "Maximum Digit should not be 0.");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                return;
            }
            else if (Convert.ToInt32(txtMaxDigit.Text) > 18)
            {
                strAlert = strAlert.Replace("__ALERT__", "Maximum Digit should not be greater than 18.");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                return;
            }

            if (chkForcePWDChange.Checked == true && (txtDaysPWD.Text == "" || txtDaysPWD.Text == "0"))
            {
                Utility.FunShowAlertMsg(this, "On force password change - Days should not be empty or zero");
                return;
            }
            if (grvMothEndParam.Rows.Count > 0)
            {
                CheckBox chkBxHeader = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
                if (chkBxHeader.Checked == true || chkMonthLock.Checked == true)
                {
                    Dictionary<string, string> Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Company_ID", intCompanyId.ToString());
                    Procparam.Add("@MonthLock", ddlFinancialMonth.SelectedItem.Text);
                    dtTable = Utility.GetDefaultData("S3G_GET_GPSEXCEPTIONS", Procparam);
                    if (Convert.ToInt32(dtTable.Rows[0]["COUNTSS"].ToString()) > 0)
                    {
                        Utility.FunShowAlertMsg(this, "Month cannot be closed until all the Transactions are Approved");
                        return;
                    }
                }
            }

            objS3G_SYSAD_GlobalParameterSetupDataTable = new CompanyMgtServices.S3G_SYSAD_GlobalParameterSetupDataTable();
            objS3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable = new CompanyMgtServices.S3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable();
            CompanyMgtServices.S3G_SYSAD_GlobalParamMonthEnd_DetailsRow objGLobalMonthEndRow;
            CompanyMgtServices.S3G_SYSAD_GlobalParameterSetupRow objGlobalSetupRow;

            #region Current Year and Month
            objGlobalSetupRow = objS3G_SYSAD_GlobalParameterSetupDataTable.NewS3G_SYSAD_GlobalParameterSetupRow();
            objGlobalSetupRow.Global_Parameters_ID = intGPSId;
            objGlobalSetupRow.Month_End_Params_ID = intMnthIdId;
            objGlobalSetupRow.Company_ID = intCompanyId;
            objGlobalSetupRow.Currency_ID = Convert.ToInt32(ddlCurrency.SelectedItem.Value);
            objGlobalSetupRow.Currency_Effective_Date = Utility.StringToDate(txtEffectiveDate.Text);
            objGlobalSetupRow.Currency_Max_Dec_Digit = Convert.ToDecimal(txtMaxDecimal.Text);
            objGlobalSetupRow.Currency_Max_Digit = Convert.ToDecimal(txtMaxDigit.Text);
            objGlobalSetupRow.Display_Date_Format = ddlDateFormat.SelectedItem.Value;
            objGlobalSetupRow.Global_Parm_Created_By = intUserId;//Seesion to be included
            objGlobalSetupRow.Global_Parm_Modified_By = intUserId;
            objGlobalSetupRow.Global_Parm_Is_Active = true;
            objGlobalSetupRow.Integrated_System = rbtnIntegratedSystem.Checked;
            objGlobalSetupRow.Mnth_Param_Hdr_Created_By = intUserId;//session to be include
            objGlobalSetupRow.Mnth_Param_Hdr_Modified_By = intUserId;
            objGlobalSetupRow.Mnth_Param_Hdr_Is_Active = true;
            objGlobalSetupRow.Month_Option = chkMonthLock.Checked;
            objGlobalSetupRow.Month_Value = ddlFinancialMonth.SelectedItem.Text;
            objGlobalSetupRow.Pincode_Digits = Convert.ToInt32(txtFieldDigits.Text);
            objGlobalSetupRow.Pincode_Field_Type = ddlFieldType.SelectedItem.Value;
            objGlobalSetupRow.Standalone_System = rbtnStandAlone.Checked;
            objGlobalSetupRow.Account_Credit = chkAccountCredit.Checked;
            objGlobalSetupRow.Year_Lock_Option = chkYearLock.Checked;
            objGlobalSetupRow.Year_Lock_Value = ddlFinacialYear.SelectedItem.Text;
            objGlobalSetupRow.XMLLobdetails = FunProFormMLAXML();
            objGlobalSetupRow.Force_Pwd_Change = chkForcePWDChange.Checked;
            objGlobalSetupRow.GL_Type = Convert.ToInt32(ddlGL_Type.SelectedValue).ToString();
            objGlobalSetupRow.SL_Type = Convert.ToInt32(ddlSLType.SelectedValue).ToString();
            objGlobalSetupRow.Xml_CustomerRange = grvcustomerrange.FunPubFormXml();

            if (!string.IsNullOrEmpty(txtDaysPWD.Text.Trim()))
            {
                objGlobalSetupRow.Days = Convert.ToInt32(txtDaysPWD.Text.Trim());
            }
            else
            {
                objGlobalSetupRow.Days = 0;
            }

            objGlobalSetupRow.Enforce_inital_pwd = chkInitialChangePWD.Checked;

            if (!string.IsNullOrEmpty(txtDisableAccess.Text.Trim()))
            {
                objGlobalSetupRow.Disable_Access_Wrong_pwd = Convert.ToInt32(txtDisableAccess.Text.Trim());
            }
            else
            {
                objGlobalSetupRow.Disable_Access_Wrong_pwd = 0;
            }

            if (!string.IsNullOrEmpty(txtMiniPWDLen.Text.Trim()))
            {
                objGlobalSetupRow.Min_pwd_length = Convert.ToInt32(txtMiniPWDLen.Text.Trim());
            }
            else
            {
                objGlobalSetupRow.Min_pwd_length = 0;
            }

            if (!string.IsNullOrEmpty(txtpwdrecycleitr.Text.Trim()))
            {
                objGlobalSetupRow.Pwd_Recycle_Itr = Convert.ToInt32(txtpwdrecycleitr.Text.Trim());
            }
            else
            {
                objGlobalSetupRow.Pwd_Recycle_Itr = 0;
            }
            objGlobalSetupRow.UpperCase_Char = chkUpperCaseChar.Checked;
            objGlobalSetupRow.Numeral_Char = chkNumbers.Checked;
            objGlobalSetupRow.Spec_Char = chkSpecialCharacters.Checked;

            objS3G_SYSAD_GlobalParameterSetupDataTable.AddS3G_SYSAD_GlobalParameterSetupRow(objGlobalSetupRow);
            #endregion
            SerializationMode SerMode = SerializationMode.Binary;
            #region Adding Month End Details
            foreach (GridViewRow Row in grvMothEndParam.Rows)
            {
                int intBranchId = Convert.ToInt32(((Label)Row.FindControl("lblBranchId")).Text);
                int intMonthEndId = Convert.ToInt32(((Label)Row.FindControl("lblMonthEndId")).Text);
                bool boolBilling = ((CheckBox)Row.FindControl("chkBilling")).Checked;
                bool boolMonth = ((CheckBox)Row.FindControl("chkMonth")).Checked;
                bool boolInterest = ((CheckBox)Row.FindControl("chkInterest")).Checked;
                bool boolDelequency = ((CheckBox)Row.FindControl("chkDeliquency")).Checked;
                bool boolODI = ((CheckBox)Row.FindControl("chkOdi")).Checked;
                bool boolDemand = ((CheckBox)Row.FindControl("chkDemand")).Checked;
                bool boolDepreciation = ((CheckBox)Row.FindControl("chkDepreciation")).Checked;
                objGLobalMonthEndRow = objS3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable.NewS3G_SYSAD_GlobalParamMonthEnd_DetailsRow();
                objGLobalMonthEndRow.Month_End_Params_Det_ID = intMonthEndId;
                objGLobalMonthEndRow.Month_End_Params_ID = intMnthIdId;
                objGLobalMonthEndRow.Branch_ID = intBranchId;
                objGLobalMonthEndRow.Billing = boolBilling;
                objGLobalMonthEndRow.Deliquency = boolDelequency;
                objGLobalMonthEndRow.Demand = boolDemand;
                objGLobalMonthEndRow.Depreciation = boolDepreciation;
                objGLobalMonthEndRow.ODI = boolODI;
                objGLobalMonthEndRow.Interest_Calculation = boolInterest;
                objGLobalMonthEndRow.Mnth_Param_Dtl_Created_By = intUserId;//Session to here
                objGLobalMonthEndRow.Mnth_Param_Dtl_Modified_By = intUserId;
                objGLobalMonthEndRow.Mnth_Param_Dtl_Is_Active = true;
                objGLobalMonthEndRow.Month_Lock = boolMonth;
                objS3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable.AddS3G_SYSAD_GlobalParamMonthEnd_DetailsRow(objGLobalMonthEndRow);

            }

            #endregion

            byte[] byteobjS3G_SYSAD_GlobalParameterTable = ClsPubSerialize.Serialize(objS3G_SYSAD_GlobalParameterSetupDataTable, SerMode);
            byte[] byteobjS3G_SYSAD_GlobalParamMonthEnd_Details = ClsPubSerialize.Serialize(objS3G_SYSAD_GlobalParamMonthEnd_DetailsDataTable, SerMode);
            //service client
            //objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            if (boolGPSDone)
            {
                intErrCode = objCompanyMasterClient.FunPubModifyGlobalParamSetUp(SerMode, byteobjS3G_SYSAD_GlobalParameterTable, byteobjS3G_SYSAD_GlobalParamMonthEnd_Details);
            }
            else
            {
                intErrCode = objCompanyMasterClient.FunPubCreateGlobalParamSetUp(SerMode, byteobjS3G_SYSAD_GlobalParameterTable, byteobjS3G_SYSAD_GlobalParamMonthEnd_Details);
            }

            if (intErrCode == 0)
            {
                //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                btnSave.Enabled_False();
                //End here
                strAlert = strAlert.Replace("__ALERT__", "Global Parameter details updated successfully");
                string[] strCurrency = ddlCurrency.SelectedItem.Text.Split('-');
                S3GSession ObjS3GSession = new S3GSession(ddlDateFormat.SelectedValue, strCurrency[1].ToString(), strCurrency[0].ToString(), Convert.ToInt32(ddlCurrency.SelectedValue), Convert.ToInt32(txtFieldDigits.Text), ddlFieldType.SelectedItem.Value, Convert.ToInt32(txtMaxDigit.Text), Convert.ToInt32(txtMaxDecimal.Text), "");
                //strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminGlobalParameterSetup_Add.aspx';";
                strRedirectPageAdd = "window.location.href='../Common/HomePage.aspx';";
            }
            else if (intErrCode == 2)
            {
                strAlert = strAlert.Replace("__ALERT__", @"Previous month was not locked \n Lock the previous month!");
                chkMonthLock.Checked = false;
                strRedirectPageAdd = "";
            }
            else if (intErrCode == 3)
            {
                strAlert = strAlert.Replace("__ALERT__", @"Previous year was not locked \n Lock the previous year!");
                chkYearLock.Checked = false;
                strRedirectPageAdd = "";
            }
            else if (intErrCode == 4)
            {
                strAlert = strAlert.Replace("__ALERT__", @"Year already locked!\n Cannot add records to a closed financial year");
                strRedirectPageAdd = "";
            }

            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Error updating global parameters");
                strRedirectPageAdd = "";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageAdd, true);
            btnSave.Focus();
        }

        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            //if (objCompanyMasterClient != null)
            //{
            objCompanyMasterClient.Close();
            //}
        }
    }
    /// <summary>
    /// Moth Lock Check Box Checks weather all Branch Moths are locked r not
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkMonthLock_CheckedChanged(object sender, EventArgs e)
    {
        if (chkMonthLock.Checked == true)
        {
            bool boolChecked = false;
            foreach (GridViewRow grvrowBrnchRow in grvMothEndParam.Rows)
            {
                CheckBox chkBranchMonthLock = (CheckBox)grvrowBrnchRow.FindControl("chkMonth");
                if (chkBranchMonthLock.Checked)
                {
                    boolChecked = true;
                }
                else
                {
                    boolChecked = false;
                    goto exitloop;
                }
            }
        exitloop:
            if (boolChecked)
            {
                chkMonthLock.Checked = true;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked,since all branches are not locked for the month');", true);
                chkMonthLock.Checked = false;
            }
            chkMonthLock.Focus();
        }
    }
    /// <summary>
    /// Fired and every rows Check changed to ensure proper month Lock and unlock mechanism
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkLockEvent_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkbox = (CheckBox)sender;

        string str = chkbox.ClientID;
        int intIndex = str.IndexOf("grvMothEndParam_ctl");
        int intRow = Convert.ToInt32(str.Substring(intIndex).Replace("grvMothEndParam_ctl", "").Substring(0, 2));
        intRow = intRow - 2;
        CheckBox chkMonth = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkMonth");
        CheckBox chkBxHeader = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");

        if (chkbox.Checked)
        {
            CheckBox chkBilling = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkBilling");
            CheckBox chkInterest = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkInterest");
            //CheckBox chkDeliquency = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDeliquency");
            CheckBox chkOdi = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkOdi");
            //CheckBox chkDemand = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDemand");
            //CheckBox chkDepreciation = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDepreciation");

            CheckBox chkServicecharge = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkServicecharge");
            CheckBox chkDiscountCharge = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDiscountCharge");
            CheckBox chkBalanceUpdation = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkBalanceUpdation");

            if (str.Contains("chkMonth") && chkMonth.Checked == true)
            {
                chkMonth.Checked = (chkBilling.Checked && chkInterest.Checked && chkServicecharge.Checked && chkOdi.Checked && chkDiscountCharge.Checked && chkBalanceUpdation.Checked);
                if (!chkMonth.Checked)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch untill all process are locked');", true);
                    chkMonth.Checked = false;
                    chkBxHeader.Checked = false;
                    chkMonthLock.Checked = false;
                }
            }
        }
        else
        {

            Label lblBranchId = (Label)grvMothEndParam.Rows[intRow].FindControl("lblBranchId");
            Label lblBranch = (Label)grvMothEndParam.Rows[intRow].FindControl("lblBranch");

            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            dictparam.Add("@COMPANY_ID", intCompanyId.ToString());
            dictparam.Add("@LOCATION_ID", lblBranchId.Text);
            dictparam.Add("@LOCATION_CODE", lblBranch.Text);
            dictparam.Add("@LOCK_MONTH", lblMonthLock.Text);
            dictparam.Add("@USER_ID", intUserId.ToString());
            DataTable dtLckCnt = Utility.GetDefaultData("S3G_MEP_CHK_MNTH_LCK_FA", dictparam);
            if (dtLckCnt != null && dtLckCnt.Rows.Count > 0)
            {
                if (dtLckCnt.Rows[0][0].ToString() == "1")
                {
                    chkbox.Checked = true;
                    Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs.MNTHEND_PARM_LCK);
                    chkbox.Focus();
                    return;
                }
            }

            if (!str.Contains("chkMonth"))
            {
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch untill all process are locked');", true);

                chkMonth.Checked = false;
                chkBxHeader.Checked = false;
                chkMonthLock.Checked = false;
            }
        }
    }
    /// <summary>
    /// Gridview Row Created event adds a java script to Check all and uncheck all in grid view columns
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow &&
   (e.Row.RowState == DataControlRowState.Normal ||
    e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBoxMonth = (CheckBox)e.Row.FindControl("chkMonth");

            CheckBox chkBxHeaderMonth = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
            chkBoxMonth.Attributes["onclick"] = string.Format
                                       (
                                          "javascript:ChildClick(this,'{0}');",
                                          chkBxHeaderMonth.ClientID
                                       );
        }
    }
    /// <summary>
    /// Fiered on Header Checkboxes check changed event to ensure proper Month Lock
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkHdrLockEvent_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkBxHeader = (CheckBox)this.grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock");
        foreach (GridViewRow grvMothEndParamRow in grvMothEndParam.Rows)
        {
            CheckBox chkMonth = (CheckBox)grvMothEndParamRow.FindControl("chkMonth");
            if (chkBxHeader.Checked)
            {
                CheckBox chkBilling = (CheckBox)grvMothEndParamRow.FindControl("chkBilling");
                CheckBox chkInterest = (CheckBox)grvMothEndParamRow.FindControl("chkInterest");
                //CheckBox chkDeliquency = (CheckBox)grvMothEndParamRow.FindControl("chkDeliquency");
                CheckBox chkOdi = (CheckBox)grvMothEndParamRow.FindControl("chkOdi");
                //CheckBox chkDemand = (CheckBox)grvMothEndParamRow.FindControl("chkDemand");
                //CheckBox chkDepreciation = (CheckBox)grvMothEndParamRow.FindControl("chkDepreciation");

                CheckBox chkServicecharge = (CheckBox)grvMothEndParamRow.FindControl("chkServicecharge");
                CheckBox chkDiscountCharge = (CheckBox)grvMothEndParamRow.FindControl("chkDiscountCharge");
                CheckBox chkBalanceUpdation = (CheckBox)grvMothEndParamRow.FindControl("chkBalanceUpdation");

                if (chkBxHeader.ID.Contains("Month") && chkMonth.Checked == true)
                {
                    chkMonth.Checked = (chkBilling.Checked && chkInterest.Checked && chkServicecharge.Checked && chkOdi.Checked && chkDiscountCharge.Checked && chkBalanceUpdation.Checked);
                    if (!chkMonth.Checked)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch until all process are locked');", true);
                        chkMonth.Checked = false;
                        chkBxHeader.Checked = false;
                        chkMonthLock.Checked = false;
                    }
                }
            }
            else
            {
                if (!chkBxHeader.ID.Contains("Month"))
                {
                    // ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Month cannot be locked for a branch Since all process are locked');", true);
                    chkMonth.Checked = false;
                    chkBxHeader.Checked = false;
                    chkMonthLock.Checked = false;
                }
            }
        }
    }
    /// <summary>
    /// Handles  Financial YearChange Event loads respective Finace Months
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlFinacialYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlFinancialMonth.Items.Clear();
        ddlFinancialMonth.Items.Add(new ListItem("--Select--", "0"));
        lblYearLock.Text = "";
        chkYearLock.Enabled = false;
        FunPubResetMonthEndParamDetails();
        ddlFinacialYear.Focus();
        if (ddlFinacialYear.SelectedIndex > 0)
        {
            lblYearLock.Text = ddlFinacialYear.SelectedItem.Text;
            lblMonthLock.Text = "";
            ddlFinancialMonth.FillFinancialMonth(ddlFinacialYear.SelectedItem.Text);
            ddlFinacialYear.Focus();
            return;
        }
    }

    /// <summary>
    /// created by tamilselvan.s on 16/12/2011 for Reset month end parameter details
    /// </summary>
    public void FunPubResetMonthEndParamDetails()
    {
        grvMothEndParam.DataSource = null;
        grvMothEndParam.DataBind();
        grvMothEndParam.DataSource = null;
        grvMothEndParam.DataBind();
        chkMonthLock.Enabled = false;
        lblMonthLock.Text = "";
    }

    /// <summary>
    /// Handles 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlFinancialMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunPubResetMonthEndParamDetails();
        ddlFinancialMonth.Focus();
        if (ddlFinancialMonth.SelectedIndex > 0)
        {
            //FunProLoadGPS(intCompanyId, ddlFinacialYear.SelectedItem.Text, ddlFinancialMonth.SelectedItem.Text);
            FunProLoadGPS_New(intCompanyId, ddlFinacialYear.SelectedItem.Text, ddlFinancialMonth.SelectedItem.Text);
            lblMonthLock.Text = ddlFinancialMonth.SelectedItem.Text;
            ddlFinancialMonth.Focus();
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void chkYearLock_CheckedChanged(object sender, EventArgs e)
    {
        if (chkYearLock.Checked)
        {
            if (chkMonthLock.Checked)
            {
                return;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "onchange", @"alert('Year cannot be locked for a company until month is locked');", true);
                chkYearLock.Checked = false;
            }
            chkYearLock.Focus();
        }
    }

    #endregion

    #region Page Methods
    /// <summary>
    /// 
    /// </summary>
    /// <param name="intCompanyid"></param>
    protected void FunProLoadBranch(int intCompanyid)
    {
        objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
        try
        {
            CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable objS3G_SYSAD_Branch_ListDataTable = new CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable();
            CompanyMgtServices.S3G_SYSAD_Branch_ListRow objBranchRow;
            objBranchRow = objS3G_SYSAD_Branch_ListDataTable.NewS3G_SYSAD_Branch_ListRow();
            objBranchRow.Company_ID = intCompanyid;
            objS3G_SYSAD_Branch_ListDataTable.AddS3G_SYSAD_Branch_ListRow(objBranchRow);
            SerializationMode SerMode = SerializationMode.Binary;
            byte[] bytesobjS3G_SYSAD_Branch_ListDataTable = ClsPubSerialize.Serialize(objS3G_SYSAD_Branch_ListDataTable, SerMode);
            //service client
            //objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            byte[] bytesobjBranchListDataTable = objCompanyMasterClient.FunPubBranch_List(SerMode, bytesobjS3G_SYSAD_Branch_ListDataTable);
            objS3G_SYSAD_Branch_ListDataTable = (CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable)ClsPubSerialize.DeSerialize(bytesobjBranchListDataTable, SerMode, typeof(CompanyMgtServices.S3G_SYSAD_Branch_ListDataTable));


            DataTable dtBranchList = objS3G_SYSAD_Branch_ListDataTable;
            dtBranchList.Columns.Add("Month_Lock", typeof(System.Boolean));
            dtBranchList.Columns.Add("Billing", typeof(System.Boolean));
            dtBranchList.Columns.Add("Interest_Calculation", typeof(System.Boolean));
            dtBranchList.Columns.Add("Deliquency", typeof(System.Boolean));
            dtBranchList.Columns.Add("ODI", typeof(System.Boolean));
            dtBranchList.Columns.Add("Demand", typeof(System.Boolean));
            dtBranchList.Columns.Add("Depreciation", typeof(System.Boolean));
            dtBranchList.Columns.Add("Month_End_Params_Det_ID", typeof(System.String));

            for (int i = 0; i <= objS3G_SYSAD_Branch_ListDataTable.Rows.Count - 1; i++)
            {

                dtBranchList.Rows[i]["Month_Lock"] = false;
                dtBranchList.Rows[i]["Billing"] = false;
                dtBranchList.Rows[i]["Interest_Calculation"] = false;
                dtBranchList.Rows[i]["Deliquency"] = false;
                dtBranchList.Rows[i]["ODI"] = false;
                dtBranchList.Rows[i]["Demand"] = false;
                dtBranchList.Rows[i]["Depreciation"] = false;
                dtBranchList.Rows[i]["Month_End_Params_Det_ID"] = "0";
                dtBranchList.Rows[i]["Location_Name"] = dtBranchList.Rows[i]["Location"];
            }
            grvMothEndParam.DataSource = dtBranchList;
            grvMothEndParam.DataBind();


        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            //if (objCompanyMasterClient != null)
            //{
            objCompanyMasterClient.Close();
            //}
        }

    }

    protected string FunProFormMLAXML()
    {
        StringBuilder strbuXML = new StringBuilder();
        strbuXML.Append("<Root>");
        foreach (GridViewRow grvData in grvMLASLA.Rows)
        {
            string strLOBID = ((Label)grvData.FindControl("lblLOBId")).Text;
            bool blnMLA = ((CheckBox)grvData.FindControl("chkMLA")).Checked;
            bool blnMLASLA = ((CheckBox)grvData.FindControl("chkMLASLA")).Checked;
            strbuXML.Append(" <Details LOB_Id='" + strLOBID + "' OnlyMLA='" + blnMLA.ToString() + "' MLAANDSLA='" + blnMLASLA.ToString() + "'/>");
        }
        strbuXML.Append("</Root>");
        return strbuXML.ToString();
    }

    protected void FunProLoadLOB(int intComapnyid)
    {
        DataTable dtLOB;
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());
        Procparam.Add("@Is_Active", "1");
        // Procparam.Add("@Program_ID", "5"); 
        dtLOB = Utility.GetDefaultData("S3G_Get_LOB_LIST", Procparam);
        dtLOB.Columns.Add("OnlyMLA", typeof(System.Boolean));
        dtLOB.Columns.Add("MLAANDSLA", typeof(System.Boolean));
        for (int i = 0; i <= dtLOB.Rows.Count - 1; i++)
        {
            dtLOB.Rows[i]["OnlyMLA"] = true;
            dtLOB.Rows[i]["MLAANDSLA"] = false;
        }
        grvMLASLA.DataSource = dtLOB;
        grvMLASLA.DataBind();
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="intCompanyId"></param>
    protected void FunProLoadGPS(int intCompanyId, string strFinancialYear, string strFinancialMonth)
    {
        objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
        try
        {
            if (intCompanyId > 0)
            {

                // objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
                #region Loading for Current Month
                byte[] byteGPSDetails = objCompanyMasterClient.FunPubQueryGPSDetails(intCompanyId, strFinancialYear, strFinancialMonth);
                objS3G_SYSAD_GlobalParameterSetupDataTable = (CompanyMgtServices.S3G_SYSAD_GlobalParameterSetupDataTable)ClsPubSerialize.DeSerialize(byteGPSDetails, SerMode, typeof(CompanyMgtServices.S3G_SYSAD_GlobalParameterSetupDataTable));
                if (objS3G_SYSAD_GlobalParameterSetupDataTable.Rows.Count <= 0)
                {
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    Dictionary<string, string> Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Company_ID", intCompanyId.ToString());
                    Procparam.Add("@Currency_ID", "0");
                    if (!boolGPSDone)
                    {
                        Procparam.Add("@IS_Active", "1");
                    }

                    ddlCurrency.BindDataTable("S3G_Get_Currency_Details", Procparam, new string[] { "Currency_ID", "Currency_Code", "Currency_Name" });
                    boolGPSDone = false;
                    FunProLoadBranch(intCompanyId);
                    FunProLoadLOB(intCompanyId);
                    btnClear.Enabled_True();
                }
                else
                {

                    txtFieldDigits.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Pincode_Digits"].ToString();
                    //txtEffectiveDate.Text = DateTime.Parse(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Currency_Effective_Date"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                    txtEffectiveDate.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Currency_Effective_Date"].ToString();
                    txtMaxDecimal.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Currency_Max_Dec_Digit"].ToString(); ;
                    txtMaxDigit.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Currency_Max_Digit"].ToString(); ;
                    ddlDateFormat.SelectedValue = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Display_Date_Format"].ToString(); ;
                    ddlFieldType.SelectedValue = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Pincode_Field_Type"].ToString(); ;
                    lblYearLock.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Year_Lock_Value"].ToString();
                    ddlFinacialYear.SelectedValue = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Year_Lock_Value"].ToString();
                    lblMonthLock.Text = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Month_Value"].ToString();
                    ddlFinancialMonth.SelectedValue = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Month_Value"].ToString();
                    chkMonthLock.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Month_Option"].ToString());
                    chkYearLock.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Year_Lock_Option"].ToString());
                    rbtnIntegratedSystem.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Integrated_System"].ToString()); ;
                    rbtnMLA.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Only_MLA"].ToString());
                    rbtnMLASLA.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["MLA_SLA"].ToString()); ;
                    rbtnStandAlone.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Standalone_System"].ToString()); ;
                    //chkAccountCredit.Checked = Convert.ToBoolean(objS3G_SYSAD_GlobalParameterSetupDataTable.Tables[0].Rows[0]["Account_Credit"].ToString());
                    hdnGlobalParamId.Value = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Global_Parameters_ID"].ToString();
                    hdnMonth_End_Params_Det_ID.Value = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Month_End_Params_Det_ID"].ToString();
                    hdnMonth_End_Params_ID.Value = objS3G_SYSAD_GlobalParameterSetupDataTable.Rows[0]["Month_End_Params_ID"].ToString();
                    boolGPSDone = true;
                    //grvMothEndParam.DataSource = objS3G_SYSAD_GlobalParameterSetupDataTable;
                    //grvMothEndParam.DataBind();
                    btnClear.Enabled_False();
                    if (chkYearLock.Checked)
                    {
                        chkYearLock.Enabled = false;
                    }
                    else
                    {
                        chkYearLock.Enabled = true;
                    }

                }
                #endregion

            }
            else
            {
                strAlert = "Company details was not added";
                strAlert += @"\n\nWould you like to add a company?";
                strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                strRedirectPageView = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            //if (objCompanyMasterClient != null)
            //{
            objCompanyMasterClient.Close();
            //}
        }
    }

    protected void FunProLoadGPS_New(int intCompanyId, string strFinancialYear, string strFinancialMonth)
    {
        objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
        try
        {
            //objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            byte[] byteGPSDetails = objCompanyMasterClient.FunPubQueryGPSDetails_New(intCompanyId, strFinancialYear, strFinancialMonth);
            DataSet ds = (DataSet)S3GBusEntity.ClsPubSerialize.DeSerialize(byteGPSDetails, S3GBusEntity.SerializationMode.Binary, typeof(DataSet));
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (!IsPostBack)
                {
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    Dictionary<string, string> Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Company_ID", intCompanyId.ToString());
                    Procparam.Add("@Currency_ID", "0");
                    Procparam.Add("@IS_Active", "1");
                    ddlCurrency.BindDataTable("S3G_Get_Currency_Details", Procparam, new string[] { "Currency_ID", "Currency_Code", "Currency_Name" });
                    txtFieldDigits.Text = ds.Tables[0].Rows[0]["Pincode_Digits"].ToString();
                    //txtEffectiveDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["Currency_Effective_Date"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                    txtEffectiveDate.Text = ds.Tables[0].Rows[0]["Currency_Effective_Date"].ToString();
                    txtMaxDecimal.Text = ds.Tables[0].Rows[0]["Currency_Max_Dec_Digit"].ToString(); ;
                    txtMaxDigit.Text = ds.Tables[0].Rows[0]["Currency_Max_Digit"].ToString(); ;
                    ddlDateFormat.SelectedValue = ds.Tables[0].Rows[0]["Display_Date_Format"].ToString(); ;
                    ddlFieldType.SelectedValue = ds.Tables[0].Rows[0]["Pincode_Field_Type"].ToString(); ;
                    rbtnIntegratedSystem.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Integrated_System"].ToString()); ;
                    rbtnStandAlone.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Standalone_System"].ToString()); ;
                    chkAccountCredit.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Account_Credit"].ToString());
                    hdnGlobalParamId.Value = ds.Tables[0].Rows[0]["Global_Parameters_ID"].ToString();
                    ddlCurrency.SelectedValue = ds.Tables[0].Rows[0]["Currency_ID"].ToString();

                    //Added on 14-Sep-2018 Starts here
                    if (Convert.ToString(ds.Tables[0].Rows[0]["GL_TYPE"]) != "" && Convert.ToString(ds.Tables[0].Rows[0]["GL_TYPE"]) != "0")
                        ddlGL_Type.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["GL_TYPE"]);
                    else
                        ddlGL_Type.SelectedValue = "1";

                    if (Convert.ToString(ds.Tables[0].Rows[0]["SL_TYPE"]) != "" && Convert.ToString(ds.Tables[0].Rows[0]["SL_TYPE"]) != "0")
                        ddlSLType.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["SL_TYPE"]);
                    else
                        ddlSLType.SelectedValue = "1";

                    ddlGL_Type.ClearDropDownList();
                    ddlSLType.ClearDropDownList();
                    //Added on 14-Sep-2018 Ends here

                    if (Convert.ToInt32(ddlCurrency.SelectedValue) > 0)
                    {
                        ddlCurrency.ClearDropDownList();
                        cexEffectiveDate.Enabled = false;
                        txtEffectiveDate.ReadOnly = true;
                    }
                    hdnUserId.Value = ds.Tables[0].Rows[0]["Created_By"].ToString();
                    hdnUserLevelId.Value = ds.Tables[0].Rows[0]["User_Level_ID"].ToString();

                    boolGPSDone = true;
                    if (ds.Tables.Count == 3)
                    {
                        grvMLASLA.DataSource = ds.Tables[1];
                        grvMLASLA.DataBind();
                        if (ds.Tables[2].Rows.Count > 0)
                        {
                            grvcustomerrange.DataSource = ds.Tables[2];
                            grvcustomerrange.DataBind();
                            ViewState["dtCustomerRange"] = ds.Tables[2];
                        }

                    }
                    else if (ds.Tables.Count == 5)
                    {
                        grvMLASLA.DataSource = ds.Tables[3];
                        grvMLASLA.DataBind();
                        if (ds.Tables[4].Rows.Count > 0)
                        {
                            grvcustomerrange.DataSource = ds.Tables[4];
                            grvcustomerrange.DataBind();
                            ViewState["dtCustomerRange"] = ds.Tables[4];
                        }
                    }
                    if (grvcustomerrange.Rows.Count > 0)
                    {
                        UserControls_S3GAutoSuggest ddlGl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlGl_code");
                        if (ddlGL_Type.SelectedValue == "1")
                        {

                            ddlGl_code.ReadOnly = false;
                        }
                        else if (ddlGL_Type.SelectedValue == "3")
                        {
                            ddlGl_code.ReadOnly = true;
                        }
                        else
                        {
                            ddlGl_code.ReadOnly = false;
                        }
                        UserControls_S3GAutoSuggest ddlSl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlSl_code");
                        if (ddlSLType.SelectedValue == "1")
                        {
                            ddlSl_code.ReadOnly = false;
                        }
                        else if (ddlSLType.SelectedValue == "3")
                        {
                            ddlSl_code.ReadOnly = true;
                        }
                        else
                        {
                            ddlSl_code.ReadOnly = false;
                        }
                    }
                    //if (ds.Tables.Count == 2)
                    //{
                    //    grvMLASLA.DataSource = ds.Tables[1];
                    //    grvMLASLA.DataBind();
                    //}
                    //else if (ds.Tables.Count == 4)
                    //{
                    //    grvMLASLA.DataSource = ds.Tables[3];
                    //    grvMLASLA.DataBind();
                    //}

                    chkForcePWDChange.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Force_Pwd_Change"].ToString());
                    chkInitialChangePWD.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Enforce_inital_pwd"].ToString());
                    chkUpperCaseChar.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["UpperCase_Char"].ToString());
                    chkNumbers.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Numeral_Char"].ToString());
                    chkSpecialCharacters.Checked = Convert.ToBoolean(ds.Tables[0].Rows[0]["Spec_Char"].ToString());

                    if (ds.Tables[0].Rows[0]["Days"].ToString() == "0")
                    {
                        txtDaysPWD.Text = "0";
                    }
                    else
                    {
                        txtDaysPWD.Text = ds.Tables[0].Rows[0]["Days"].ToString(); ;
                    }

                    if (ds.Tables[0].Rows[0]["Disable_Access_Wrong_pwd"].ToString() == "0")
                    {
                        txtDisableAccess.Text = "0";
                    }
                    else
                    {
                        txtDisableAccess.Text = ds.Tables[0].Rows[0]["Disable_Access_Wrong_pwd"].ToString(); ;
                    }

                    if (ds.Tables[0].Rows[0]["Min_pwd_length"].ToString() != "0")
                    {
                        txtMiniPWDLen.Text = ds.Tables[0].Rows[0]["Min_pwd_length"].ToString(); ;
                    }
                    else
                    {
                        txtMiniPWDLen.Text = string.Empty;
                    }

                    if (ds.Tables[0].Rows[0]["Pwd_Recycle_Itr"].ToString() == "0")
                    {
                        txtpwdrecycleitr.Text = "0";
                    }
                    else
                    {
                        txtpwdrecycleitr.Text = ds.Tables[0].Rows[0]["Pwd_Recycle_Itr"].ToString(); ;
                    }
                }
                /*Commented and Added on 14-Sep-2018 Starts here*/
                //if (ds.Tables.Count == 4)
                if (ds.Tables.Count == 5)
                /*Commented and Added on 14-Sep-2018 Ends here*/
                {
                    lblYearLock.Text = ds.Tables[1].Rows[0]["Year_Lock_Value"].ToString();
                    ddlFinacialYear.SelectedValue = ds.Tables[1].Rows[0]["Year_Lock_Value"].ToString();
                    lblMonthLock.Text = ds.Tables[1].Rows[0]["Month_Value"].ToString();
                    ddlFinancialMonth.SelectedValue = ds.Tables[1].Rows[0]["Month_Value"].ToString();
                    chkMonthLock.Checked = Convert.ToBoolean(ds.Tables[1].Rows[0]["Month_Option"].ToString());
                    chkYearLock.Checked = Convert.ToBoolean(ds.Tables[1].Rows[0]["Year_Lock_Option"].ToString());
                    hdnMonth_End_Params_Det_ID.Value = ds.Tables[2].Rows[0]["Month_End_Params_Det_ID"].ToString();
                    hdnMonth_End_Params_ID.Value = ds.Tables[1].Rows[0]["Month_End_Params_ID"].ToString();
                    grvMothEndParam.DataSource = ds.Tables[2];
                    grvMothEndParam.DataBind();
                    //grvMLASLA.DataSource = ds.Tables[3];
                    //grvMLASLA.DataBind();
                }
                else
                {
                    grvMothEndParam.DataSource = null;
                    grvMothEndParam.DataBind();
                    //FunProLoadBranch(intCompanyId);
                    ddlFinacialYear.SelectedValue = strFinancialYear;
                    ddlFinancialMonth.SelectedValue = strFinancialMonth;
                    //grvMLASLA.DataSource = ds.Tables[1];
                    //grvMLASLA.DataBind();
                }
                //}
                //else
                //{
                //    FunProLoadBranch(intCompanyId);
                //    //FunProLoadLOB(intCompanyId);
                //}

                btnClear.Enabled_False();
                if (chkYearLock.Checked)
                {
                    chkYearLock.Enabled = false;
                }
                else
                {
                    chkYearLock.Enabled = true;
                }

                if (ddlFinacialYear.SelectedIndex > 0 && ddlFinancialMonth.SelectedIndex > 0 && (((DataTable)grvMothEndParam.DataSource) != null && ((DataTable)grvMothEndParam.DataSource).Rows.Count > 0))
                {
                    chkMonthLock.Enabled = true;
                }
            }
            else
            {
                //if (!bCreate && bQuery && bModify)
                //{
                //    strAlert = strAlert.Replace("__ALERT__", "Permission denied");
                //    strRedirectPage = "window.location.href='../Common/HomePage.aspx';";
                //    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPage, true);

                //}
                //else if (bCreate)
                //{
                FunPriDisableControls(0);
                // }
                //else if (!bCreate)
                //{
                //  FunPriDisableControls(-1);
                //}
            }
            FunPriEnableDisableGridControls(strMode);
            //Changed by Thalai 12-Jan-2012 Start
            /* Currency Master not loading - 
             * Disable Clear list */
            //ddlCurrency.ClearDropDownList();
            //Changed by Thalai 12-Jan-2012 End
            if (strMode != "M" && strMode != "C")
            {
                chkMonthLock.Enabled = chkYearLock.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            //if (objCompanyMasterClient != null)
            //{
            objCompanyMasterClient.Close();
            //}
        }
    }

    /// <summary>
    /// 
    /// </summary>
    protected void FunPubCleraControls()
    {
        txtEffectiveDate.Text = "";
        txtFieldDigits.Text = "";
        txtMaxDecimal.Text = "";
        txtMaxDigit.Text = "";
        ddlCurrency.SelectedIndex = 0;
        ddlDateFormat.SelectedIndex = 0;
        ddlFieldType.SelectedIndex = 0;
        chkMonthLock.Checked = false;
        chkYearLock.Checked = false;
        grvMothEndParam.Columns.Clear();
        rbtnIntegratedSystem.Checked = false;
        //rbtnStandAlone.Checked = false;
        ddlFinacialYear.SelectedIndex = 0;
        ddlFinancialMonth.SelectedIndex = 0;
    }
    #endregion

    #region Commented Code

    //protected void chkMonth_CheckedChanged(object sender, EventArgs e)
    //{

    //    CheckBox chkbox = (CheckBox)sender;
    //    if (chkbox.Checked)
    //    {
    //        string str = chkbox.ClientID;
    //        int intIndex = str.IndexOf("grvMothEndParam_ctl");
    //        int intRow = Convert.ToInt32(str.Substring(intIndex).Replace("grvMothEndParam_ctl", "").Substring(0, 2));
    //        intRow = intRow - 2;
    //        CheckBox chkMonth = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkMonth");

    //        CheckBox chkBilling = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkBilling");
    //        CheckBox chkInterest = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkInterest");
    //        CheckBox chkDeliquency = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDeliquency");
    //        CheckBox chkOdi = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkOdi");
    //        CheckBox chkDemand = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDemand");

    //        chkMonth.Checked = (chkBilling.Checked && chkInterest.Checked && chkDeliquency.Checked && chkOdi.Checked && chkDemand.Checked);
    //        //CheckBox chkDeliquency = (CheckBox)grvMothEndParam.Rows[intRow].FindControl("chkDeliquency");
    //    }
    //}

    //protected void FunProLoadCompany()
    //{
    //    try
    //    {
    //        CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable ObjS3G_SYSAD_CompanyMasterDataTable = new CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable();
    //        objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
    //        SerializationMode SerMode = SerializationMode.Binary;
    //        byte[] byteCompanyDetails = objCompanyMasterClient.FunPubGetCompany_List(0);
    //        ObjS3G_SYSAD_CompanyMasterDataTable = (CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable)ClsPubSerialize.DeSerialize(byteCompanyDetails, SerMode, typeof(CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable));
    //        ddlCompanyCode.FillDataTable(ObjS3G_SYSAD_CompanyMasterDataTable, ObjS3G_SYSAD_CompanyMasterDataTable.Company_IDColumn.ColumnName, ObjS3G_SYSAD_CompanyMasterDataTable.Company_NameColumn.ColumnName);


    //    }
    //    catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
    //    {
    //        lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
    //    }
    //    catch (Exception ex)
    //    {
    //        lblErrorMessage.InnerText = ex.Message;
    //    }
    //}

    #endregion


    protected void btnClear_Click(object sender, EventArgs e)
    {
        FunPubCleraControls();
        btnClear.Focus();
    }

    protected void ddlDateFormat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlDateFormat.SelectedIndex > 0)
        {
            cexEffectiveDate.Format = ddlDateFormat.SelectedValue;
            S3GSession ObjS3GSession_DateFormat = new S3GSession();
            //Changes modified by Tamilselvan.S on 19/01/2012 for Datetime format changes
            if (cexEffectiveDate.Enabled == true)
                txtEffectiveDate.Text = "";
            else
                txtEffectiveDate.Text = Convert.ToDateTime(Utility.StringToDate(txtEffectiveDate.Text)).ToString(cexEffectiveDate.Format);
            ObjS3GSession_DateFormat.ProDateFormatRW = ddlDateFormat.SelectedValue;
            ddlDateFormat.Focus();
        }
    }
    #region FieldDisable
    private void FunPriDisableControls(int intMode)
    {
        switch (intMode)
        {

            case 0://Create Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                if (ddlCurrency.Items.Count == 0)
                {
                    Dictionary<string, string> Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Company_ID", intCompanyId.ToString());
                    Procparam.Add("@Currency_ID", "0");
                    Procparam.Add("@IS_Active", "1");
                    ddlCurrency.BindDataTable("S3G_Get_Currency_Details", Procparam, new string[] { "Currency_ID", "Currency_Code", "Currency_Name" });
                }
                boolGPSDone = false;
                FunProLoadBranch(intCompanyId);
                FunProLoadLOB(intCompanyId);
                btnClear.Enabled_True();
                txtMaxDecimal.ReadOnly = true;
                break;

            case 1://Modify Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                //grvMLASLA.Columns[2].ItemStyle.CssClass = "enabledflase";
                txtMaxDecimal.ReadOnly = true;
                ddlDateFormat.Enabled = false;
                rbtnIntegratedSystem.Enabled = false;
                rbtnStandAlone.Enabled = false;
                chkAccountCredit.Enabled = false;
                break;

            case -1: // Query Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                txtFieldDigits.ReadOnly = true;
                txtEffectiveDate.ReadOnly = true;
                txtMaxDecimal.ReadOnly = true;
                txtMaxDigit.ReadOnly = true;
                ddlDateFormat.Enabled = true;
                ddlFieldType.Enabled = true;
                ddlCurrency.Enabled = true;
                ddlFinacialYear.Enabled = true;
                ddlFinancialMonth.Enabled = true;
                ddlDateFormat.ClearDropDownList();
                ddlCurrency.ClearDropDownList();
                ddlFieldType.ClearDropDownList();
                btnSave.Enabled_False();
                btnClear.Enabled_False();
                cexEffectiveDate.Enabled = false;
                rbtnIntegratedSystem.Enabled = false;
                rbtnStandAlone.Enabled = false;
                rbtnMLA.Enabled = false;
                rbtnMLASLA.Enabled = false;
                chkMonthLock.Enabled = false;
                chkYearLock.Enabled = false;
                //grvMLASLA.Columns[2].ItemStyle.CssClass = "enabledflase";
                txtMaxDecimal.ReadOnly = true;
                break;
        }
    }
    #endregion
    private void FunPriEnableDisableGridControls(string strModes)
    {
        //if (grvMothEndParam.HeaderRow != null)
        //{
        //    CheckBox chkall = grvMothEndParam.HeaderRow.FindControl("chkHdrMonthLock") as CheckBox;
        //    if (strModes != "M" && strModes != "C")
        //    {
        //        chkall.Enabled = false;
        //    }
        //}
        //foreach (GridViewRow grv in grvMothEndParam.Rows)
        //{

        //    CheckBox chkMonth = grv.FindControl("chkMonth") as CheckBox;
        //    if (strModes != "M" && strModes != "C")
        //    {
        //        chkMonth.Enabled = false;

        //    }
        //}
        foreach (GridViewRow grv_MLASLA in grvMLASLA.Rows)
        {
            RadioButton rbtnMLA = (RadioButton)grv_MLASLA.FindControl("chkMLA");
            RadioButton rbtnMLASLA = (RadioButton)grv_MLASLA.FindControl("chkMLASLA");
            if (strModes != "M" && strModes != "C")
            {
                rbtnMLA.Enabled = false;
                rbtnMLASLA.Enabled = false;

            }
        }
    }
    protected void ddlCurrency_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());
        Procparam.Add("@Currency_ID", ddlCurrency.SelectedValue);
        DataTable dtCurrencyDetails = Utility.GetDefaultData("S3G_Get_Currency_Details", Procparam);
        txtMaxDecimal.Text = dtCurrencyDetails.Rows[0]["Precision"].ToString();
        ddlCurrency.Focus();
    }
    /// <summary>
    /// Function written for reteriving Lob based status for billing,ODI,Interest Calculation,Delinquency,Demand for the selected branch
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            lblmodalerror.Text = "";
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Year_Lock_Value", ddlFinacialYear.SelectedItem.Text);
            Procparam.Add("@Month_Value", ddlFinancialMonth.SelectedValue);
            Procparam.Add("@Location_ID", e.CommandArgument.ToString());
            Procparam.Add("@User_ID", intUserId.ToString());
            DataTable dtLobBranchDetails = Utility.GetDefaultData("S3G_LOANAD_GetLOB_BranchMonthEndParam", Procparam);
            if (dtLobBranchDetails.Rows.Count > 0)
            {
                GridViewLOB.DataSource = dtLobBranchDetails;
                GridViewLOB.DataBind();
            }
            else
            {
                GridViewLOB.DataSource = null;
                GridViewLOB.DataBind();
                //Utility.FunShowAlertMsg(this, "No records found!");
                //return;
                lblmodalerror.Text = "No Records Found !";
            }
            ModalPopupExtenderPassword.Show();

        }

    }

    /// <summary>
    /// GridView Row DataBound Event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvMothEndParam_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            CheckBox chkMonth = (CheckBox)e.Row.FindControl("chkMonth");
            if (strMode != "M" && strMode != "C")
            {
                chkMonth.Enabled = false;
            }
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            if (strMode != "M" && strMode != "C")
            {
                ((CheckBox)e.Row.FindControl("chkHdrMonthLock")).Enabled = false;
            }
        }
    }

    ///// <summary>
    ///// GridView Row DataBound Event
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void GridViewLOB_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        CheckBox chkBilling = (CheckBox)e.Row.FindControl("chkBilling");
    //        CheckBox chkInterest = (CheckBox)e.Row.FindControl("chkInterest");
    //        CheckBox chkDeliquency = (CheckBox)e.Row.FindControl("chkDeliquency");
    //        CheckBox chkOdi = (CheckBox)e.Row.FindControl("chkOdi");
    //        CheckBox chkDemand = (CheckBox)e.Row.FindControl("chkDemand");
    //        if (strMode != "M" && strMode != "C")
    //        {
    //            chkBilling.Enabled = chkInterest.Enabled = chkDeliquency.Enabled = chkOdi.Enabled = chkDemand.Enabled = false;
    //        }
    //    }
    //}

    protected void chkForcePWDChange_CheckedChanged(object sender, EventArgs e)
    {
    }

    protected void chkInitialChangePWD_CheckedChanged(object sender, EventArgs e)
    {
    }

    protected void chkUpperCaseChar_CheckedChanged(object sender, EventArgs e)
    {
    }

    protected void chkNumbers_CheckedChanged(object sender, EventArgs e)
    {
    }

    protected void chkSpecialCharacters_CheckedChanged(object sender, EventArgs e)
    {
    }
    protected void btnExit_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/Common/HomePage.aspx");
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:RemoveTabnew(this);", true);
    }

    //Code Added by Gomathi Start


    protected void FunProIntializeGridData()
    {
        try
        {
            if (ViewState["dtCustomerRange"] == null)
            {
                DataTable dtCustomerRange;
                dtCustomerRange = new DataTable("InflowDetails");
                dtCustomerRange.Columns.Add("Sno");
                dtCustomerRange.Columns.Add("lob_id");
                dtCustomerRange.Columns.Add("LOB");
                dtCustomerRange.Columns.Add("flag_id");
                dtCustomerRange.Columns.Add("Flag_Desc");
                dtCustomerRange.Columns.Add("GL_Code");
                dtCustomerRange.Columns.Add("SL_Code");
                dtCustomerRange.Columns.Add("Old_New");


                DataRow DRow = dtCustomerRange.NewRow();
                DRow["Sno"] = 0;
                DRow["lob_id"] = "";
                DRow["LOB"] = "";
                DRow["flag_id"] = "";
                DRow["Flag_Desc"] = "";
                DRow["GL_Code"] = "";
                DRow["SL_Code"] = "";
                DRow["Old_New"] = "";



                dtCustomerRange.Rows.Add(DRow);
                grvcustomerrange.DataSource = dtCustomerRange;
                grvcustomerrange.DataBind();
                grvcustomerrange.Rows[0].Visible = false;
                ViewState["dtCustomerRange"] = dtCustomerRange;
                grvcustomerrange.Visible = true;

                dtCustomerRange.Rows[0].Delete();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Load Grid data");
        }
    }
    [System.Web.Services.WebMethod]
    public static string[] GetSearchOptionList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@company_id", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@Prefix", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3g_Sysad_GetFlagList", Procparam));

        return suggetions.ToArray();
    }


    [System.Web.Services.WebMethod]
    public static string[] GetGLCodeList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
        Procparam.Add("@Type", obj_Page.rbtnIntegratedSystem.Checked.ToString());
        Procparam.Add("@Option", "1");
        Procparam.Add("@Prefix", prefixText);
        //Procparam.Add("@GL_Code", System.Web.HttpContext.Current.Session["AutoSuggestGLCodeSearch"].ToString());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("FAS3G_SYSAD_GET_GLCode_GPS", Procparam));
        return suggetions.ToArray();
    }


    [System.Web.Services.WebMethod]
    public static string[] GetSLCodeList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
        Procparam.Add("@Type", obj_Page.rbtnIntegratedSystem.Checked.ToString());
        Procparam.Add("@Option", "2");
        Procparam.Add("@Prefix", prefixText);
        UserControls_S3GAutoSuggest ddlGl_code = (UserControls_S3GAutoSuggest)obj_Page.grvcustomerrange.FooterRow.FindControl("ddlGl_code");
        Procparam.Add("@GL_Code", ddlGl_code.SelectedValue);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("FAS3G_SYSAD_GET_GLCode_GPS", Procparam));
        return suggetions.ToArray();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlGL_Type.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select GL Type");
                return;
            }
            if (ddlSLType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select SL Type");
                return;
            }

            DataRow DRow;
            DataTable dtCustomerRange = (DataTable)ViewState["dtCustomerRange"];

            UserControls_S3GAutoSuggest ddlflag = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlflag");
            UserControls_S3GAutoSuggest ddlGl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlGl_code");
            UserControls_S3GAutoSuggest ddlSl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlSl_code");
            //TextBox txtAmountF = (TextBox)gvInflow.FooterRow.FindControl("txtAmountF");
            //CheckBox ChkActiveF = (CheckBox)grvcustomerrange.FooterRow.FindControl("ChkActiveF");
            DropDownList ddlLOB = (DropDownList)grvcustomerrange.FooterRow.FindControl("ddlLOB");


            if (Convert.ToInt32(ddlLOB.SelectedValue) <= 0)
            {
                Utility.FunShowAlertMsg(this, "Select the LOB");
                return;
            }

            if (Convert.ToInt32(ddlflag.SelectedValue) <= 0)
            {
                Utility.FunShowAlertMsg(this, "Select the CashFlow");
                return;
            }
            if (ddlGL_Type.SelectedValue == "1")
            {
                if (ddlGl_code.SelectedText == "--Select--" || ddlGl_code.SelectedText == "" || ddlGl_code.SelectedValue == "0")
                {
                    Utility.FunShowAlertMsg(this, "Select the GL Code");
                    return;
                }
            }
            if (ddlSLType.SelectedValue == "1")
            {
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Clear();
                Procparam.Add("@GL_Code", ddlGl_code.SelectedValue);
                DataTable dt = Utility.GetDefaultData("S3G_Get_GLSL_CodeLists", Procparam);
                if ((ddlSl_code.SelectedText == "--Select--" || ddlSl_code.SelectedText == "" || ddlSl_code.SelectedValue == "0") && dt.Rows.Count > 0)
                {
                    Utility.FunShowAlertMsg(this, "Select the SL Code");
                    return;
                }
            }
            //if (ddlcharge.SelectedIndex <= 0)
            //{
            //    Utility.FunShowAlertMsg(this, "Select the Charge Type");
            //    return;
            //}

            //if (((DataTable)(ViewState["dtTempAuthApprover"])) == null)
            //{
            //    Utility.FunShowAlertMsg(this, "Assign Atleast One Value");
            //    return;
            //}
            //Label lblSNo = (Label)gvInflow.Rows[gvInflow.Rows.Count - 1].FindControl("lblSerialNo");
            //int s;
            //s = Convert.ToInt32(lblSNo.Text) + 1;
            string express = "flag_id = '" + ddlflag.SelectedValue + "' and " + "(lob_id='0' or lob_id= '" + ddlLOB.SelectedValue + "') and " + "(GL_Code= '" + ddlGl_code.SelectedValue + "')";
            if (((DataTable)(ViewState["dtCustomerRange"])) != null)
            {
                DataRow[] dArray = ((DataTable)(ViewState["dtCustomerRange"])).Select(express); 
                if (dArray.Length > 0)
                {
                    Utility.FunShowAlertMsg(this, "CashFlow Already exist");
                    return;
                }
            }


            // int CashInflow_ID = Convert.ToInt32(ddlCashInflow.SelectedValue);

            DRow = dtCustomerRange.NewRow();
            DRow["Sno"] = dtCustomerRange.Rows.Count + 1;
            if (Convert.ToInt32(ddlLOB.SelectedValue.ToString()) > 0)
                DRow["lob_id"] = ddlLOB.SelectedValue;
            else
                DRow["lob_id"] = "0";
            if (Convert.ToInt32(ddlLOB.SelectedValue.ToString()) > 0)
                DRow["LOB"] = ddlLOB.SelectedItem.Text.ToString();
            else
                DRow["LOB"] = "";
            DRow["flag_id"] = ddlflag.SelectedValue;
            DRow["Flag_Desc"] = ddlflag.SelectedText;
            if (ddlGl_code.SelectedText.ToString() != "--Select--" || ddlGl_code.SelectedText.ToString() != "")
                DRow["GL_Code"] = ddlGl_code.SelectedText;
            //if (Convert.ToInt32(ddlSl_code.SelectedValue.ToString()) > 0)
            if ((ddlSl_code.SelectedText.ToString() != "--Select--" || ddlSl_code.SelectedText.ToString() != "") && ddlSl_code.SelectedValue != "0")
                DRow["SL_Code"] = ddlSl_code.SelectedText;
            DRow["Old_New"] = "1";

            //if (ddlCashInflow.SelectedIndex > 0)
            //{
            //    DRow["CASHINFLOW"] = ddlCashInflow.SelectedItem.Text;
            //}
            //string InflowfilterExpression = (" CashFlow_ID = '" + Convert.ToString(ddlCashInflow.SelectedValue) + "'");
            ////string InflowfilterExpression = (" CashFlow_ID = '" + Convert.ToString(ddlCashInflow.SelectedValue) + "' And Is_Active=True");
            ////string isactive = (" Is_Active =True '" + Convert.ToString(ddlCashInflow.SelectedValue) + "'");

            //DataRow[] dtLOBFilterDetails = dtCustomerRange.Select(InflowfilterExpression);

            //if (dtLOBFilterDetails.Length > 0)
            //{

            //    Utility.FunShowAlertMsg(this, "Selected cashflow already exist");
            //    ViewState["InflowDetails"] = dtCustomerRange;
            //    return;

            //}
            dtCustomerRange.Rows.Add(DRow);
            dtCustomerRange = (DataTable)ViewState["dtCustomerRange"];
            FunProFillgrid(dtCustomerRange);
            FunPriLoadLob();
            //if (Mcashflowid == null)
            //{
            //    DataTable dtMain = new DataTable();
            //    if ((DataTable)ViewState["dtTempAuthApprover"] == null)
            //        dtMain = ((DataTable)ViewState["dtTempAuthApproverPopUp"]).Clone();
            //    else
            //        dtMain = (DataTable)ViewState["dtTempAuthApprover"];

            //    foreach (GridViewRow GvRow in grvAssignValue.Rows)
            //    {
            //        Label sno = (Label)GvRow.FindControl("lblSNo");
            //        Label lblFromAmount = (Label)GvRow.FindControl("lblFromAmount");
            //        Label lblToAmount = (Label)GvRow.FindControl("lblToAmount");
            //        Label lblpercentageoramount = (Label)GvRow.FindControl("lblpercentageoramount");
            //        Label cashflowid = (Label)GvRow.FindControl("cashflowid");
            //        DataRow dRow = dtMain.NewRow();
            //        dRow["SNo"] = sno.Text;
            //        dRow["FromAmount"] = lblFromAmount.Text;
            //        dRow["ToAmount"] = lblToAmount.Text;
            //        dRow["cashflowid"] = cashflowid.Text;
            //        dRow["chargetype"] = Mchargetype;
            //        dRow["PercentageorAmount"] = lblpercentageoramount.Text;
            //        dtMain.Rows.Add(dRow);
            //    }
            //    ViewState["dtTempAuthApprover"] = dtMain;
            //    ViewState["dtTempAuthApproverPopUp"] = null;
            //}


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Add");
        }

    }


    protected void FunProFillgrid(DataTable dtCustomerRange)
    {
        try
        {
            grvcustomerrange.DataSource = ViewState["dtCustomerRange"] = dtCustomerRange;
            grvcustomerrange.DataBind();

            //if (dtCustomerRange.Rows.Count > 0)
            //{
            //    grvcustomerrange.Visible = true;
            //}
            //else
            //{
            //    grvcustomerrange.Visible = false;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Load Grid");
        }
    }

    protected void gvInflow_Deleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtCustomerRange;
            dtCustomerRange = (DataTable)ViewState["dtCustomerRange"];
            DataRow[] drdelete = dtCustomerRange.Select("Sno='" + Convert.ToString(e.RowIndex + 1) + "'");
            DataRow[] drdeletee = dtCustomerRange.Select("flag_id='" + Convert.ToString(e.RowIndex) + "'");
            string strCasflowid = dtCustomerRange.Rows[e.RowIndex]["flag_id"].ToString();
            if (drdelete != null && drdelete.Length > 0)
            {
                dtCustomerRange.Rows.RemoveAt(e.RowIndex);
            }
            dtCustomerRange.AcceptChanges();
            FunProSetSerielNum(ref dtCustomerRange);
            FunProFillgrid(dtCustomerRange);
            FunPriLoadLob();
            if (dtCustomerRange.Rows.Count == 0)
            {
                ViewState["dtCustomerRange"] = null;

                FunProIntializeGridData();
                FunPriLoadLob();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void FunProSetSerielNum(ref DataTable dt)
    {
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            dt.Rows[i][0] = (i + 1).ToString();
        }
    }
    protected void FunProLoadType(int intComapnyid)
    {
        DataTable dtLOB;
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());

        ddlGL_Type.BindDataTable("S3G_SYSAD_GET_GLType", Procparam, new string[] { "value", "name" });
        ddlSLType.BindDataTable("S3G_SYSAD_GET_GLSLType", Procparam, new string[] { "value", "name" });
    }

    protected void ddlGL_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (grvcustomerrange.Rows.Count > 0)
        //{
        //    Utility.FunShowAlertMsg(this, "hi");
        //    return;
        //}

        hdngl.Value = ddlGL_Type.SelectedValue;
        ViewState["dtCustomerRange"] = null;
        FunProIntializeGridData();
        FunPriLoadLob();
        UserControls_S3GAutoSuggest ddlGl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlGl_code");
        if (ddlGL_Type.SelectedValue == "1")
        {


            ddlGl_code.ReadOnly = false;
        }
        else if (ddlGL_Type.SelectedValue == "3")
        {

            ddlGl_code.ReadOnly = true;
        }
        else
        {
            ddlGl_code.ReadOnly = false;
        }
    }

    protected void ddlSLType_SelectedIndexChanged(object sender, EventArgs e)
    {

        hdnsl.Value = ddlSLType.SelectedValue;
        ViewState["dtCustomerRange"] = null;
        FunProIntializeGridData();
        FunPriLoadLob();
        UserControls_S3GAutoSuggest ddlSl_code = (UserControls_S3GAutoSuggest)grvcustomerrange.FooterRow.FindControl("ddlSl_code");
        if (ddlSLType.SelectedValue == "1")
        {


            ddlSl_code.ReadOnly = false;
        }
        else if (ddlSLType.SelectedValue == "3")
        {

            ddlSl_code.ReadOnly = true;
        }
        else
        {
            ddlSl_code.ReadOnly = false;
        }
    }

    protected void FunPriLoadLob()
    {
        try
        {
            DropDownList ddlLob = (DropDownList)(grvcustomerrange).FooterRow.FindControl("ddlLOB");
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Is_Active", "1");
            //}
            Procparam.Add("@User_Id", intUserId.ToString());
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            ddlLob.BindDataTable("S3G_ORG_GetLOBDetails", Procparam, new string[] { "LOB_ID", "LOB" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Load Grid data");
        }
    }
}
