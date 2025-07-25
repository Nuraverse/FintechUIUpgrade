#region [Revision History]
/// Screen Name     :   FAGlobalParameterSetup.aspx
/// Created By      :   Tamilselvan S
/// Created Date    :   31-Jan-2012
/// Purpose         :   To define global Parameter setup details
#endregion [Revision History]

#region [NameSpace]

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
using FA_BusEntity;

#endregion [NameSpace]

public partial class System_Admin_FAGlobalParameterSetup : ApplyThemeForProject_FA
{
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objAdminServiceClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable ObjFA_SYS_GPSDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupRow objGPS_Row;

    #region [Intialization]
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectAddPage = "~/Common/HomePage.aspx";
    string strRedirectViewPage = "~/Common/HomePage.aspx";
    string strRedirectPageView = "window.location.href='../Common/HomePage.aspx';";
    string strRedirectPageAdd = "window.location.href='../Common/HomePage.aspx';";


    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    bool bClearList = false;
    //Code end
    UserInfo_FA ObjUserInfo_FA = null;
    int intUserID, intCompanyID, intMode, intGPS_ID = 0;
    Dictionary<string, string> Procparam = null;
    FASession ObjGPSsession = null;
    string strConnectionName = "";
    int intlevelID = 0;


    #endregion [Intialization]

    #region [Event's]

    protected void Page_Load(object sender, EventArgs e)
    {
        FunPubPageLoad();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        bool blnValReturn = false;
        Utility_FA.FunShowValidationMsg_FA(this.Page, FunPubGPSSave(out blnValReturn), strRedirectPageAdd, strRedirectPageView, strMode, blnValReturn);
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        FunPubReset();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectAddPage);
    }

    protected void ddlFinancialYearStartMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunPriLoadFinancialYearEndMonth();
    }

    protected void ddlFinancialYearEnd_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunPriLoadFinancialYearEndMonth();
    }

    protected void rblCurrencyLevel_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblCurrencyLevel.SelectedValue == "0")
        {
            txtMaxDecimal.ReadOnly = false;
        }
        else
        {
            txtMaxDecimal.ReadOnly = true;
        }
    }

    #endregion [Event's]

    #region [Function's]

    public void FunPubPageLoad()
    {
        ObjUserInfo_FA = new UserInfo_FA();
        ObjGPSsession = new FASession();
        intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
        intUserID = ObjUserInfo_FA.ProUserIdRW;
        intlevelID = ObjUserInfo_FA.ProUserLevelIdRW;
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bDelete = ObjUserInfo_FA.ProDeleteRW;
        bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
        strConnectionName = ObjGPSsession.ProConnectionName;
        txtFixedAssetValue.SetDecimalPrefixSuffix_FA(6, 2, true, true);
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
        if (!IsPostBack)
        {
            FunPubBindControls(intMode);
            FunPubGetGPSDetails();

            intMode = strMode == "M" ? 1 : strMode == "Q" ? -1 : 0;
            FunPriDisableControls(intMode);
            if (strMode == "C" || strMode == "")
            {
                FunPriLoadFinancialYearAndMonth();
                FunPriLoadPandLAccountcode();
                FunPriLoadIBSLiabilitycode();
                FunPriLoadIBSAssetcode();
            }
            if (intlevelID.ToString() == "5")
            {
                txtIntrumentValiedDays.ReadOnly = false;
                txtProjectedYears.ReadOnly = false;
                txtMaxDecimal.ReadOnly = false;
                txtMaxDigit.ReadOnly = false;
                chkBudgetApplicable.Enabled = true;
                txtdenominator.ReadOnly = false;


            }
            else
            {
                txtIntrumentValiedDays.ReadOnly = true;
                txtProjectedYears.ReadOnly = true;
                txtMaxDecimal.ReadOnly = true;
                txtMaxDigit.ReadOnly = true;
                ddlPandLAccountcode.ClearDropDownList_FA();
                chkBudgetApplicable.Enabled = false;
            }
            if (rblCurrencyLevel.SelectedValue == "0")
            {
                txtMaxDecimal.ReadOnly = false;
            }
            else
            {
                txtMaxDecimal.ReadOnly = true;
                txtMaxDecimal.Text = "";
            }


        }

    }

    public void FunPubBindControls(int intMode)
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", "-1");
        Procparam.Add("@LookupType", "3");
        ddlDateFormat.BindDataTable_FA(SPNames.GetLookupDetails, Procparam, "Lookup_Code", "Lookup_Desc");
        ddlDateFormat.AddItemToolTipText_FA();

        Procparam["@LookupType"] = "34";
        //ddldenominatordays.BindDataTable_FA(SPNames.GetLookupDetails, Procparam, "Lookup_Desc", "Lookup_Desc");
        //ddldenominatordays.AddItemToolTipText_FA();
    }

    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode
                if (!bCreate)
                {
                    btnSave.Enabled_False();
                }
                rblCurrencyLevel.AddItemToolTipText_FA();
                chkMultiCompany.Enabled = true;
                chkBudgetApplicable.Enabled = chkDimension.Enabled = chkDim2LinkWithDim1.Enabled = true;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                break;

            case 1: // Modify Mode
                if (!bModify)
                {
                    btnSave.Enabled_False();
                }
                btnClear.Enabled_False();
                chkMultiCompany.Enabled = false;
                // chkBudgetApplicable.Enabled = chkDimension.Enabled = chkDim2LinkWithDim1.Enabled = false;
                //txtIntrumentValiedDays.ReadOnly = true;
                rblCurrencyLevel.AddItemToolTipText_FA();

                rblCurrencyLevel.ClearRadioButtonList_FA();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                break;

            case -1:// Query Mode
                if (!bQuery)
                {
                    Response.Redirect(strRedirectAddPage);
                }
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                rblCurrencyLevel.AddItemToolTipText_FA();
                rblCurrencyLevel.ClearRadioButtonList_FA();
                ddlDateFormat.ClearDropDownList_FA();
                //ddldenominatordays.ClearDropDownList_FA();
                txtMaxDecimal.ReadOnly = txtMaxDigit.ReadOnly = txtIntrumentValiedDays.ReadOnly = txtProjectedYears.ReadOnly = true;
                //chkAuthorization.Enabled = false;
                btnClear.Enabled_False();
                btnSave.Enabled_False();
                chkMultiCompany.Enabled = false;
                break;
        }

    }

    public void FunPubReset()
    {
        ddlDateFormat.ClearSelection();
        //ddldenominatordays.ClearSelection();
        txtMaxDecimal.Text = txtMaxDigit.Text = "";
        //chkAuthorization.Checked = false;
    }

    public int FunPubGPSSave(out bool blnValReturn)
    {
        int intReturnValue = 0;
        blnValReturn = false;
        objAdminServiceClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objAdminServiceClient.Open();
        ObjFA_SYS_GPSDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable();
        try
        {
            objGPS_Row = ObjFA_SYS_GPSDataTable.NewFA_GlobalParameter_SetupRow();
            objGPS_Row.Company_ID = intCompanyID;
            objGPS_Row.Date_Format = Convert.ToInt32(ddlDateFormat.SelectedValue);
            objGPS_Row.Currency_Max_Prefix = Convert.ToInt32(txtMaxDigit.Text.Trim());
            if (!string.IsNullOrEmpty(txtMaxDecimal.Text.Trim()))
                objGPS_Row.Currency_Max_Suffex = Convert.ToInt16(txtMaxDecimal.Text.Trim());
            else
                objGPS_Row.Currency_Max_Suffex = -1;
            objGPS_Row.Denominator_Days = Convert.ToInt32(txtdenominator.Text.Trim());
            objGPS_Row.Financial_Year = ddlFinancialYearStart.SelectedValue + "-" + ddlFinancialYearEnd.SelectedValue;
            objGPS_Row.Year_StartMonth = ddlFinancialYearStartMonth.SelectedValue;
            objGPS_Row.Year_EndMonth = ddlFinancialYearEndMonth.SelectedValue;
            objGPS_Row.Budget_Applicable = chkBudgetApplicable.Checked;
            objGPS_Row.Dimension_Applicable = chkDimension.Checked;
            objGPS_Row.Dim2_Linkwith_Dim1 = chkDim2LinkWithDim1.Checked;
            objGPS_Row.Created_By = intUserID;
            objGPS_Row.Modified_By = intUserID;
            objGPS_Row.Multi_Company = chkMultiCompany.Checked;
            objGPS_Row.Currency_Level_ID = Convert.ToInt32(rblCurrencyLevel.SelectedValue);
            objGPS_Row.Currency_Level = Convert.ToString(rblCurrencyLevel.SelectedItem.Text);
            objGPS_Row.Instrument_Valied_Days = Convert.ToInt32(txtIntrumentValiedDays.Text);
            objGPS_Row.NoOfProjectedYears = Convert.ToInt32(txtProjectedYears.Text);
            objGPS_Row.XML_ProgramRoleAuthorization = gvAuthorization.FunPubFormXml_FA(true).Replace("AUTHORIZATION", "AUTHORIZATIONS");
            if (ddlPandLAccountcode.SelectedIndex > 0)
            {
                objGPS_Row.GL_Code = ddlPandLAccountcode.SelectedValue;
                objGPS_Row.GL_Desc = ddlPandLAccountcode.SelectedItem.Text.Trim();
            }
            if (ddlibsaccountliability.SelectedIndex > 0)
            {
                objGPS_Row.Ibs_liability = ddlibsaccountliability.SelectedValue;

            }
            if (ddlibsaccountasset.SelectedIndex > 0)
            {
                objGPS_Row.Ibs_Asset = ddlibsaccountasset.SelectedValue;

            }
            objGPS_Row.Force_Pwd_Change = chkForcePWDChange.Checked;

            if (!string.IsNullOrEmpty(txtDaysPWD.Text.Trim()))
            {
                objGPS_Row.Days = Convert.ToInt32(txtDaysPWD.Text.Trim());
            }
            else
            {
                objGPS_Row.Days = 0;
            }

            objGPS_Row.Enforce_inital_pwd = chkInitialChangePWD.Checked;

            if (!string.IsNullOrEmpty(txtDisableAccess.Text.Trim()))
            {
                objGPS_Row.Disable_Access_Wrong_pwd = Convert.ToInt32(txtDisableAccess.Text.Trim());
            }
            else
            {
                objGPS_Row.Disable_Access_Wrong_pwd = 0;
            }

            if (!string.IsNullOrEmpty(txtMiniPWDLen.Text.Trim()))
            {
                objGPS_Row.Min_pwd_length = Convert.ToInt32(txtMiniPWDLen.Text.Trim());
            }
            else
            {
                objGPS_Row.Min_pwd_length = 0;
            }

            if (!string.IsNullOrEmpty(txtpwdrecycleitr.Text.Trim()))
            {
                objGPS_Row.Pwd_Recycle_Itr = Convert.ToInt32(txtpwdrecycleitr.Text.Trim());
            }
            else
            {
                objGPS_Row.Pwd_Recycle_Itr = 0;
            }
            objGPS_Row.UpperCase_Char = chkUpperCaseChar.Checked;
            objGPS_Row.Numeral_Char = chkNumbers.Checked;
            objGPS_Row.Spec_Char = chkSpecialCharacters.Checked;


            objGPS_Row.Dep_Method = ddlDepreciationMethod.SelectedValue;
            if (!string.IsNullOrEmpty(txtFixedAssetValue.Text))
                objGPS_Row.Least_Asset_Value = Convert.ToDecimal(txtFixedAssetValue.Text);

            if ((string.IsNullOrEmpty(hdnGPS_ID.Value) || Convert.ToInt32(hdnGPS_ID.Value) == 0) && (strMode.ToString() == "C" || strMode == ""))
            {
                objGPS_Row.Global_Parameter_ID = 0;
                ObjFA_SYS_GPSDataTable.AddFA_GlobalParameter_SetupRow(objGPS_Row);
                intReturnValue = objAdminServiceClient.FunPubInsertUpdateGPS(FASerializationMode.Binary, FAClsPubSerialize.Serialize(ObjFA_SYS_GPSDataTable, FASerializationMode.Binary), "C", strConnectionName);
            }
            else
            {
                objGPS_Row.Global_Parameter_ID = Convert.ToInt32(hdnGPS_ID.Value);
                ObjFA_SYS_GPSDataTable.AddFA_GlobalParameter_SetupRow(objGPS_Row);
                intReturnValue = objAdminServiceClient.FunPubInsertUpdateGPS(FASerializationMode.Binary, FAClsPubSerialize.Serialize(ObjFA_SYS_GPSDataTable, FASerializationMode.Binary), "M", strConnectionName);
            }
        }
        catch (Exception ex)
        { }
        return intReturnValue;
    }

    public void FunPubGetGPSDetails()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        DataSet dsGPS = Utility_FA.GetDataset(SPNames.Get_GPS_Details, Procparam);
        strMode = "C";
        if (dsGPS.Tables[0].Rows.Count > 0)
        {
            hdnGPS_ID.Value = Convert.ToString(dsGPS.Tables[0].Rows[0]["Global_Parameter_ID"]);
            hdnUserLevelAccess.Value = Convert.ToString(dsGPS.Tables[0].Rows[0]["User_Level_ID"]);
            intGPS_ID = Convert.ToInt32(dsGPS.Tables[0].Rows[0]["Global_Parameter_ID"]);
            if (intGPS_ID > 0 && ObjUserInfo_FA.ProUserLevelIdRW != 5)
            {
                strMode = "Q";
            }
            else if (intGPS_ID > 0 && ObjUserInfo_FA.ProUserLevelIdRW == 5 && bModify == true)
            {
                strMode = "M";
            }
            ddlDateFormat.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["Date_Format"]);

            ddlFinancialYearStart.Items.Clear();
            ddlFinancialYearStart.Items.Add(new ListItem(Convert.ToString(dsGPS.Tables[0].Rows[0]["Financial_YearStart"]), Convert.ToString(dsGPS.Tables[0].Rows[0]["Financial_YearStart"])));
            ddlFinancialYearEnd.Items.Clear();
            ddlFinancialYearEnd.Items.Add(new ListItem(Convert.ToString(dsGPS.Tables[0].Rows[0]["Financial_YearEnd"]), Convert.ToString(dsGPS.Tables[0].Rows[0]["Financial_YearEnd"])));
            ddlFinancialYearStartMonth.Items.Clear();
            ddlFinancialYearStartMonth.Items.Add(new ListItem(Convert.ToString(dsGPS.Tables[0].Rows[0]["Year_StartMonth"]), Convert.ToString(dsGPS.Tables[0].Rows[0]["Year_StartMonth"])));
            ddlFinancialYearEndMonth.Items.Clear();
            ddlFinancialYearEndMonth.Items.Add(new ListItem(Convert.ToString(dsGPS.Tables[0].Rows[0]["Year_EndMonth"]), Convert.ToString(dsGPS.Tables[0].Rows[0]["Year_EndMonth"])));
            if (Convert.ToString(dsGPS.Tables[0].Rows[0]["trans"]) == "True")
            {
                chkDim2LinkWithDim1.Enabled = chkDimension.Enabled = false;
            }
            else
            {
                chkDim2LinkWithDim1.Enabled = chkDimension.Enabled = true;
            }
            txtMaxDigit.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["Currency_Max_Prefix"]);

            //Code commented and added by saran on 6-july-2012 start
            //txtMaxDecimal.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["Currency_Max_Suffex"]);
            if (!string.IsNullOrEmpty(Convert.ToString(dsGPS.Tables[0].Rows[0]["Currency_Max_Suffix"])))
                txtMaxDecimal.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["Currency_Max_Suffix"]);
            //Code commented and added by saran on 6-july-2012 end

            txtdenominator.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["Denominator_days"]);
            //ddldenominatordays.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["Denominator_days"]);
            FunPriLoadPandLAccountcode();
            FunPriLoadIBSLiabilitycode();
            FunPriLoadIBSAssetcode();
            if (ddlPandLAccountcode.Items.Count > 1)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(dsGPS.Tables[0].Rows[0]["GL_Code"])))
                {
                    ddlPandLAccountcode.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["GL_Code"]);
                    //ddlPandLAccountcode.ClearDropDownList_FA();
                }
            }
            if (ddlibsaccountliability.Items.Count > 1)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(dsGPS.Tables[0].Rows[0]["IBS_Account_Liability"])))
                {
                    ddlibsaccountliability.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["IBS_Account_Liability"]);
                    //ddlPandLAccountcode.ClearDropDownList_FA();
                }
            }
            if (ddlibsaccountasset.Items.Count > 1)
            {
                if (!string.IsNullOrEmpty(Convert.ToString(dsGPS.Tables[0].Rows[0]["IBS_Account_Asset"])))
                {
                    ddlibsaccountasset.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["IBS_Account_Asset"]);
                    //ddlPandLAccountcode.ClearDropDownList_FA();
                }
            }
            chkBudgetApplicable.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Budget_Applicable"]);
            chkDimension.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Dimension_Applicable"]);
            chkDim2LinkWithDim1.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Dim2_Linkwith_Dim1"]);
            chkMultiCompany.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Multi_Company"]);
            rblCurrencyLevel.SelectedValue = Convert.ToString(dsGPS.Tables[0].Rows[0]["Currency_Level_ID"]);
            txtIntrumentValiedDays.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["Instrument_Valied_Days"]);
            txtProjectedYears.Text = Convert.ToString(dsGPS.Tables[0].Rows[0]["noof_budget_prj_yr"]);
            chkForcePWDChange.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Force_Pwd_Change"].ToString());
            chkInitialChangePWD.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Enforce_inital_pwd"].ToString());
            chkUpperCaseChar.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["UpperCase_Char"].ToString());
            chkNumbers.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Numeral_Char"].ToString());
            chkSpecialCharacters.Checked = Convert.ToBoolean(dsGPS.Tables[0].Rows[0]["Spec_Char"].ToString());

            if (dsGPS.Tables[0].Rows[0]["Days"].ToString() == "0")
            {
                txtDaysPWD.Text = "0";
            }
            else
            {
                txtDaysPWD.Text = dsGPS.Tables[0].Rows[0]["Days"].ToString(); ;
            }

            if (dsGPS.Tables[0].Rows[0]["Disable_Access_Wrong_pwd"].ToString() == "0")
            {
                txtDisableAccess.Text = "0";
            }
            else
            {
                txtDisableAccess.Text = dsGPS.Tables[0].Rows[0]["Disable_Access_Wrong_pwd"].ToString(); ;
            }

            if (dsGPS.Tables[0].Rows[0]["Min_pwd_length"].ToString() != "0")
            {
                txtMiniPWDLen.Text = dsGPS.Tables[0].Rows[0]["Min_pwd_length"].ToString(); ;
            }
            else
            {
                txtMiniPWDLen.Text = string.Empty;
            }

            if (dsGPS.Tables[0].Rows[0]["Pwd_Recycle_Itr"].ToString() == "0")
            {
                txtpwdrecycleitr.Text = "0";
            }
            else
            {
                txtpwdrecycleitr.Text = dsGPS.Tables[0].Rows[0]["Pwd_Recycle_Itr"].ToString(); ;
            }

            if (!string.IsNullOrEmpty(dsGPS.Tables[0].Rows[0]["Dep_Method"].ToString()))
            {
                ddlDepreciationMethod.SelectedValue = dsGPS.Tables[0].Rows[0]["Dep_Method"].ToString();
            }

            if (!string.IsNullOrEmpty(dsGPS.Tables[0].Rows[0]["Least_Asset_Value"].ToString()))
            {
                txtFixedAssetValue.Text = dsGPS.Tables[0].Rows[0]["Least_Asset_Value"].ToString();
            }
        }
        if (dsGPS.Tables[1].Rows.Count > 0)
        {
            gvAuthorization.DataSource = dsGPS.Tables[1];
            gvAuthorization.DataBind();
        }
    }

    private void FunPriLoadFinancialYearAndMonth()
    {
        ddlFinancialYearStart.Items.Add(new ListItem(DateTime.Now.Year.ToString(), DateTime.Now.Year.ToString()));
        ddlFinancialYearEnd.Items.Add(new ListItem("--Select--", "0"));
        for (int inti = DateTime.Now.Year; inti <= (DateTime.Now.Year + 5); inti++)
        {
            ddlFinancialYearEnd.Items.Add(new ListItem(inti.ToString(), inti.ToString()));
        }
        ddlFinancialYearStart.AddItemToolTipText_FA();
        ddlFinancialYearEnd.AddItemToolTipText_FA();
        FunPriLoadFinancialYearStartMonth();
        FunPriLoadFinancialYearEndMonth();
    }

    private void FunPriLoadFinancialYearStartMonth()
    {
        string strMonthYear = string.Empty;
        ddlFinancialYearStartMonth.Items.Clear();
        ddlFinancialYearStartMonth.Items.Add(new ListItem("--Select--", "0"));
        for (int intMonth = 1; intMonth <= 12; intMonth++)
        {
            strMonthYear = Convert.ToString(DateTime.Now.Year) + Convert.ToString(intMonth);
            if (intMonth.ToString().Length == 1)
                strMonthYear = Convert.ToString(DateTime.Now.Year) + "0" + Convert.ToString(intMonth);
            ddlFinancialYearStartMonth.Items.Add(new ListItem(strMonthYear, strMonthYear));
        }
        ddlFinancialYearStartMonth.AddItemToolTipText_FA();
    }

    private void FunPriLoadFinancialYearEndMonth()
    {
        string strMonthYear = string.Empty;
        ddlFinancialYearEndMonth.Items.Clear();
        ddlFinancialYearEndMonth.Items.Add(new ListItem("--Select--", "0"));
        if (ddlFinancialYearEnd.SelectedIndex > 0 && ddlFinancialYearStartMonth.SelectedIndex > 0 && ddlFinancialYearStart.SelectedValue != ddlFinancialYearEnd.SelectedValue)
        {
            for (int intMonth = 1; intMonth <= 12; intMonth++)
            {
                if (intMonth.ToString().Length == 1)
                    strMonthYear = ddlFinancialYearEnd.SelectedValue + Convert.ToString("0" + intMonth);
                else
                    strMonthYear = ddlFinancialYearEnd.SelectedValue + Convert.ToString(intMonth);
                ddlFinancialYearEndMonth.Items.Add(new ListItem(strMonthYear, strMonthYear));
            }
        }
        else if (ddlFinancialYearEnd.SelectedIndex > 0 && ddlFinancialYearStartMonth.SelectedIndex > 0 && ddlFinancialYearStart.SelectedValue == ddlFinancialYearEnd.SelectedValue)
        {
            for (int intMonth = Convert.ToInt32(ddlFinancialYearStartMonth.SelectedValue.Substring(4, 2)) + 1; intMonth <= 12; intMonth++)
            {
                if (intMonth.ToString().Length == 1)
                    strMonthYear = ddlFinancialYearEnd.SelectedValue + Convert.ToString("0" + intMonth);
                else
                    strMonthYear = ddlFinancialYearEnd.SelectedValue + Convert.ToString(intMonth);
                ddlFinancialYearEndMonth.Items.Add(new ListItem(strMonthYear, strMonthYear));
            }
        }
        ddlFinancialYearEndMonth.AddItemToolTipText_FA();
        ddlFinancialYearStart.AddItemToolTipText_FA();
    }

    private void FunPriLoadPandLAccountcode()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@option", "2");
        ddlPandLAccountcode.BindDataTable_FA("FA_GET_PL_GLCODE", Procparam, new string[] { "GL_Code", "GL_Desc" });
    }
    private void FunPriLoadIBSLiabilitycode()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@option", "2");
        ddlibsaccountliability.BindDataTable_FA("FA_GET_PL_GLCODE", Procparam, new string[] { "GL_Code", "GL_Desc" });
    }
    private void FunPriLoadIBSAssetcode()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@option", "1");
        ddlibsaccountasset.BindDataTable_FA("FA_GET_PL_GLCODE", Procparam, new string[] { "GL_Code", "GL_Desc" });
    }


    #endregion [Function's]

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

}
