

/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name               : System Admin 
/// Screen Name               : Exchange Rate Master
/// Created By                : Muni Kavitha    
/// Created Date              : 30-Jan-2012
/// Purpose                   : 
/// Last Updated By           : 
/// Last Updated Date         : 
/// Reason                    :

/// <Program Summary>

#region NameSpaces
using System;
using System.Collections.Generic;
using System.Data;
using System.ServiceModel;
using System.Web.Security;
using System.Web.UI;
using FA_BusEntity;
using System.IO;
using System.Configuration;
using System.Globalization;
using System.Web.Services;
using System.Text;
using System.Web.UI.WebControls;
#endregion

public partial class Sysadm_FASysExchangeMaster_Add : ApplyThemeForProject
{

    #region Common Variable declaration
    int intCompanyID, intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strExchangeRate_ID = "0";
    int intErrCode = 0;
    int intExchangeRate_ID = 0;
    string validationCode;
    string strDateFormat = string.Empty;
    string str_IsMultiCurrency = string.Empty;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASerializationMode ObjSerMode = FASerializationMode.Binary;
    StringBuilder sbExchangeRateXML = new StringBuilder();




    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objExchangeRateMaster;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterDataTable objFA_Sys_ExchangeMaster_DTB = null;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterRow objFA_Sys_ExchangeMasterRow = null;

    FASession objFASession;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "~/FA_System Admin/FASysExchangeMaster_View.aspx";
    string strRedirectPageAdd = "window.location.href='../FA_System Admin/FASysExchangeMaster_Add.aspx';";
    string strRedirectPageView = "window.location.href='../FA_System Admin/FASysExchangeMaster_View.aspx';";
    static string strPageName = "Exchange Rate Master";
    //User Authorization
    string strMode = "C";
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    string strConnectionName = "";

    //Code end
    #endregion

    #region Methods

    #region "User Authorization"
    //This is used to implement User Authorization
    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                if (!bCreate)
                {
                    //btnSave.Enabled = false;
                    btnSave.Enabled_False();
                    // btnSave.CssClass = "cancel_btn fa fa-times";
                }
                txtDate.Text = DateTime.Now.ToString(strDateFormat);
                txtTime.Text = DateTime.Now.ToString("hh:mm tt");
                break;

            case 1: // Modify Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                //btnClear.Enabled = false;
                //btnClear.CssClass = "cancel_btn fa fa-times";
                btnClear.Enabled_False();
                if (!bModify)
                {

                }
                //Utility_FA.ClearDropDownList_FA(ddlLOB);
                //Utility_FA.ClearDropDownList_FA(ddlType);
                break;

            case -1:// Query Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);

                //    btnSave.Enabled = btnClear.Enabled = false;
                btnClear.Enabled_False();
                btnSave.Enabled_False();
                // btnSave.CssClass = btnClear.CssClass = "cancel_btn fa fa-times";
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPage);
                }
                txtBaseValue.Enabled = txtExchValue.Enabled = false;
                txtDate.ReadOnly = txtTime.ReadOnly = true;

                //Utility_FA.ClearDropDownList_FA(ddlLocation);
                // ddlLocation.ClearDropDownList();
                ddlLocation.Enabled = false;
                Utility_FA.ClearDropDownList_FA(ddlExchangeCur);
                Utility_FA.ClearDropDownList_FA(ddlDownload);
                //CalExchangeDate.Enabled = false;
                chkLink.Enabled = fupManUpload.Enabled = false;
                break;


        }
    }
    //Code end
    #endregion

    //To Load Page
    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            //FunPubSetIndex(1);
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            //Code end
            objFASession = new FASession();
            strDateFormat = objFASession.ProDateFormatRW;
            strConnectionName = objFASession.ProConnectionName;

            //CalExchangeDate.Format = strDateFormat;

            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;

            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strMode = Request.QueryString.Get("qsMode");
                strExchangeRate_ID = fromTicket.Name;
            }

            if (!IsPostBack)
            {

                txtDate.Attributes.Add("Readonly", "true");
                txtTime.Attributes.Add("Readonly", "true");
                FunPriLoadLocation();
                FunPriLoadCurrencies(1);

                if (Request.QueryString["qsMode"] == "Q")
                {
                    FunPriGetExchangeRateDetails(strExchangeRate_ID);
                    FunPriDisableControls(-1);
                }
                else if (Request.QueryString["qsMode"] == "M")
                {
                    FunPriGetExchangeRateDetails(strExchangeRate_ID);
                    FunPriDisableControls(1);
                }
                else
                {
                    FunPriDisableControls(0);
                }

            }
            if (string.IsNullOrEmpty(hdn_BasePrecision.Value))
                hdn_BasePrecision.Value = "0";
            if (string.IsNullOrEmpty(hdn_ExchPrecision.Value))
                hdn_ExchPrecision.Value = "0";

            txtBaseValue.SetDecimalPrefixSuffix_FA(5, Convert.ToInt32(hdn_BasePrecision.Value), true, lblBaseval.Text, 0);
            txtExchValue.SetDecimalPrefixSuffix_FA(5, Convert.ToInt32(hdn_ExchPrecision.Value), true, lblExchValue.Text, 0);

            ddlLocation.AddItemToolTipText_FA();
            ddlExchangeCur.AddItemToolTipText_FA();
            ddlDownload.AddItemToolTipText_FA();
            ddlLocation.Focus();
        }
        catch (Exception ex)
        {
            //FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            validationCode = "1305";
            throw ex;
        }
    }

    // To save Exchange Rate Details
    private int FunPriSaveDetails()
    {
        objExchangeRateMaster = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            objFA_Sys_ExchangeMaster_DTB = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterDataTable();
            objFA_Sys_ExchangeMasterRow = objFA_Sys_ExchangeMaster_DTB.NewFA_Sys_ExchangeMasterRow();

            objFA_Sys_ExchangeMasterRow.Company_ID = intCompanyID;
            objFA_Sys_ExchangeMasterRow.User_ID = intUserID;
            //objFA_Sys_ExchangeMasterRow.Location_Code  = ddlLocation.SelectedValue;
            if (strExchangeRate_ID != null)
                objFA_Sys_ExchangeMasterRow.Exch_Rate_ID = Convert.ToInt64(strExchangeRate_ID);
            //if (strMode =="M")
            //    objFA_Sys_ExchangeMasterRow .option  =2;
            //else 
            //    objFA_Sys_ExchangeMasterRow .option  =1;
            objFA_Sys_ExchangeMasterRow.XML_ExchRate_DTL = FunGenerateXML();
            objFA_Sys_ExchangeMaster_DTB.AddFA_Sys_ExchangeMasterRow(objFA_Sys_ExchangeMasterRow);
            intErrCode = objExchangeRateMaster.FunPubInsertExchangeMaster(ObjSerMode, FAClsPubSerialize.Serialize(objFA_Sys_ExchangeMaster_DTB, ObjSerMode),strConnectionName,out intExchangeRate_ID);

        }

        catch (Exception ex)
        {
            //    FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            if (objExchangeRateMaster != null)
                objExchangeRateMaster.Close();
        }
        return intErrCode;
    }

    //To Generate XML for Saving Exchange Details
    private string FunGenerateXML()
    {
        try
        {
            sbExchangeRateXML.Append("<Root> <Details");

            //objFA_Sys_ExchangeMasterRow.Location_Code  = ddlLocation.SelectedValue;
            //if (ddlLocation.SelectedIndex > 0)
            sbExchangeRateXML.Append(" Location_ID = '" + ddlLocation.SelectedValue + "'");
            //else
            //    sbExchangeRateXML.Append(" Location_ID = '" + null + "'");

            sbExchangeRateXML.Append(" Base_Cur_Code = '" + hdn_BaseCur.Value + "'");
            sbExchangeRateXML.Append(" BCC_Def_Value = '" + txtBaseValue.Text + "'");

            sbExchangeRateXML.Append(" Exch_Cur_Code = '" + ddlExchangeCur.SelectedValue + "'");
            sbExchangeRateXML.Append(" EXC_Def_Value = '" + txtExchValue.Text + "'");

            sbExchangeRateXML.Append(" Recorded_Date = '" + Utility_FA.StringToDate(txtDate.Text).ToString() + "'");
            sbExchangeRateXML.Append(" Recorded_Time = '" + txtTime.Text + "'");

            if (ddlDownload.SelectedIndex > 0)
                sbExchangeRateXML.Append(" Ref_Site = '" + ddlDownload.SelectedValue + "'");
            else
                sbExchangeRateXML.Append(" Ref_Site = '" + null + "'");

            //sbExchangeRateXML.Append(" Per_Interval = '" + chkPerIntv.Checked.ToString ()  + "'");
            if (!fupManUpload.HasFile)
                sbExchangeRateXML.Append(" Upload_Path = '" + null + "'");
            else
                sbExchangeRateXML.Append(" Upload_Path = '" + fupManUpload.FileName + "'");

            sbExchangeRateXML.Append(" /> </Root>");
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sbExchangeRateXML.ToString();
    }

    //Function To Get Exchange Rate Details for Modify/Query Mode
    private void FunPriGetExchangeRateDetails(string strExchangeRate_ID)
    {
        try
        {
            DataTable dtTable = new DataTable();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            Procparam.Add("@Exchange_Rate_ID", strExchangeRate_ID);

            dtTable = Utility_FA.GetDefaultData(SPNames.GetExchangeRateDetails, Procparam);
            if (dtTable.Rows.Count > 0)
            {
                txtBaseCur.Text = dtTable.Rows[0]["Base_Cur_Code"].ToString();
                txtBaseValue.Text = dtTable.Rows[0]["BCC_Def_Value"].ToString();
                ddlLocation.SelectedValue = dtTable.Rows[0]["Location_ID"].ToString();
                ddlExchangeCur.SelectedValue = dtTable.Rows[0]["Exch_Cur_Code"].ToString();
                txtExchValue.Text = dtTable.Rows[0]["EXC_Def_Value"].ToString();
                txtDate.Text = dtTable.Rows[0]["Recorded_Date"].ToString();
                txtTime.Text = dtTable.Rows[0]["Recorded_Time"].ToString();
                ddlDownload.SelectedValue = dtTable.Rows[0]["Ref_Site"].ToString();
                if (ddlDownload.SelectedIndex > 0)
                    chkLink.Checked = true;
            }
            ddlLocation.AddItemToolTipText_FA();
            ddlExchangeCur.AddItemToolTipText_FA();
            ddlDownload.AddItemToolTipText_FA();
        }
        catch (Exception ex)
        {
            //    FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            validationCode = "1304";
            throw ex;
        }
    }

    //Function To load Location
    private void FunPriLoadLocation()
    {
        try
        {
            //Get multicurrency exists or not from session
            if (objFASession.ProMultiCompanyRW == true)
                str_IsMultiCurrency = "1";
            else
                str_IsMultiCurrency = "0";

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (strMode == "C")
            {
                // Procparam.Add("@Is_Active", "1");
                Procparam.Add("@Option", "2");
            }
            Procparam.Add("@Program_ID", "9");
            Procparam.Add("@MultiCurrency", str_IsMultiCurrency);
            ddlLocation.BindDataTable_FA(SPNames.GetLocation, Procparam, new string[] { "Location_ID", "Location" });
            Procparam = null;
            if (ddlLocation.Items.Count == 2)
            {
                ddlLocation.SelectedIndex = 1;
                //   ddlLocation.Items[0].Remove[0];
                ddlLocation.ClearDropDownList();
                ddlLocation.Enabled = false;
            }
        }

        catch (Exception ex)
        {
            //FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    //Function To load Exchange Currency
    private void FunPriLoadCurrencies(int intOption)
    {
        try
        {
            //Get multicurrency exists or not from session
            if (objFASession.ProMultiCompanyRW == true)
                str_IsMultiCurrency = "1";
            else
                str_IsMultiCurrency = "0";

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
            if (ddlExchangeCur.SelectedIndex > 0)
                Procparam.Add("@Exch_Cur_Code", ddlExchangeCur.SelectedValue);
            if (strMode == "C")
                Procparam.Add("@Mode", "C");
            Procparam.Add("@option", intOption.ToString());
            Procparam.Add("@MultiCurrency", str_IsMultiCurrency);

            DataSet ds = Utility_FA.GetDataset(SPNames.GetCurrencyCodesPrecision, Procparam);
            if (intOption == 1)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtBaseCur.Text = ds.Tables[0].Rows[0]["Base_Cur_Code"].ToString();
                    hdn_BaseCur.Value = ds.Tables[0].Rows[0]["Base_cur_ID"].ToString();
                    hdn_BasePrecision.Value = ds.Tables[0].Rows[0]["Base_Prec"].ToString();
                }
                else
                {
                    hdn_BasePrecision.Value = "0";
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    ddlExchangeCur.DataValueField = "Currency_ID";
                    ddlExchangeCur.DataTextField = "Currency_Name";
                    ddlExchangeCur.DataSource = ds.Tables[1];
                    ddlExchangeCur.DataBind();
                    System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                    ddlExchangeCur.Items.Insert(0, liSelect);
                    if (ddlExchangeCur.Items.Count == 2)
                    {
                        ddlExchangeCur.SelectedIndex = 1;
                        FunPriLoadCurrencies(3);
                    }
                }
                txtBaseValue.Focus();
            }
            //else if (intOption == 2)
            //{
            //    if (ds.Tables[0].Rows.Count > 0)
            //    {
            //        txtBaseCur.Text = ds.Tables[0].Rows[0]["Base_Cur_Code"].ToString();
            //        hdn_BaseCur.Value = ds.Tables[0].Rows[0]["Base_cur_ID"].ToString();
            //        hdn_BasePrecision.Value = ds.Tables[0].Rows[0]["Base_Prec"].ToString();
            //    }
            //}
            else if (intOption == 3)
            {
                if (ds.Tables[0].Rows.Count > 0)
                    hdn_ExchPrecision.Value = ds.Tables[0].Rows[0]["Exch_Prec"].ToString();
                else
                    hdn_ExchPrecision.Value = "0";
                txtExchValue.Focus();
            }
            Procparam = null;
            if (string.IsNullOrEmpty(hdn_BasePrecision.Value))
                hdn_BasePrecision.Value = "0";
            if (string.IsNullOrEmpty(hdn_ExchPrecision.Value))
                hdn_ExchPrecision.Value = "0";

            txtBaseValue.SetDecimalPrefixSuffix_FA(5, Convert.ToInt32(hdn_BasePrecision.Value), true, lblBaseval.Text, 0);
            txtExchValue.SetDecimalPrefixSuffix_FA(5, Convert.ToInt32(hdn_ExchPrecision.Value), true, lblExchValue.Text, 0);

            ddlExchangeCur.AddItemToolTipText_FA();

        }
        catch (Exception ex)
        {
            validationCode = "1306";
            throw ex;
        }
    }

    //To enable or Disable the DownLoad Driodown based on Link checked
    protected void FunEnableDisable_URL(object sender, EventArgs e)
    {
        ddlDownload.SelectedIndex = 0;
        if (chkLink.Checked == true)
        {
            ddlDownload.Enabled = true;
            chkLink.Focus();
        }
        else if (chkLink.Checked == false)
        {
            ddlDownload.Enabled = false;
            chkLink.Focus();
        }
        chkLink.Focus();
    }

    // To Clear_FA the Data in the Page
    private void FunPriClearPage()
    {
        try
        {
            FunPriLoadLocation();
            //ddlLocation.SelectedIndex = 0;
            FunPriLoadCurrencies(1);
            txtDate.Text = DateTime.Now.ToString(strDateFormat);
            //txtDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            txtTime.Text = DateTime.Now.ToString("hh:mm tt");
            txtBaseValue.Text = txtExchValue.Text = string.Empty;
            ddlDownload.SelectedIndex = 0;
            chkLink.Checked = ddlDownload.Enabled = false;

            ddlDownload.AddItemToolTipText_FA();
            ddlLocation.AddItemToolTipText_FA();
        }
        catch (Exception ex)
        {
            validationCode = "1307";
            throw ex;
        }
    }

    #endregion

    #region Events

    #region Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();


        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvExchangeRateMaster.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvExchangeRateMaster.IsValid = false;
        }
    }

    #endregion

    #region DropDown Events

    //To get Currency Details based on Location
    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //str_IsMultiCurrency = "1";//Get multicurrency exists or not from session
            FunPriLoadCurrencies(1);
            ddlLocation.Focus();
        }
        catch (Exception objException)
        {
            validationCode = "1306";
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvExchangeRateMaster.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvExchangeRateMaster.IsValid = false;
        }
    }

    //To get the Exchange Currency Details
    protected void ddlExchangeCur_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadCurrencies(3);
            txtExchValue.Text = string.Empty;
            ddlExchangeCur.Focus();
        }
        catch (Exception objException)
        {
            validationCode = "1306";
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvExchangeRateMaster.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvExchangeRateMaster.IsValid = false;
        }
    }

    #endregion

    #region  Button Events

    //save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            //FunPriSaveDetails();
            // Utility_FA.FunShowValidationMsg_FA(this.Page, FunPriSaveDetails(), strRedirectPageAdd, strRedirectPageView, strMode, false);

            int OutResult;
            OutResult = FunPriSaveDetails();
            if (OutResult != 1301 && OutResult != 1302)
                Utility_FA.FunShowValidationMsg_FA(this, OutResult);
            else
                Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, strRedirectPageAdd, strRedirectPageView, strMode, false);
            btnSave.Focus();

        }
        catch (Exception objException)
        {
            validationCode = "1303";
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvExchangeRateMaster.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvExchangeRateMaster.IsValid = false;
        }
    }

    //cancel
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
        btnCancel.Focus();
    }

    //Clear_FA
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriClearPage();
            btnClear.Focus();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvExchangeRateMaster.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvExchangeRateMaster.IsValid = false;
        }
    }

    #endregion


    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtDate, txtDate.Text, lblDate.Text))
        {
            txtDate.Text = DateTime.Now.ToString(objFASession.ProDateFormatRW);
            txtDate.Focus();
            return;
        }
    }
    protected void txtBaseCur_TextChanged(object sender, EventArgs e)
    {
        //txtDebit.SetDecimalPrefixSuffix_FA(objFASession.ProGpsPrefixRW, objFASession.ProGpsSuffixRW, true, "Debit");
        txtBaseValue.SetDecimalPrefixSuffix_FA(5, Convert.ToInt32(hdn_BasePrecision.Value), true, "Debit", 0);
        txtBaseCur.Focus();

    }

    #endregion

    protected void txtExchValue_TextChanged(object sender, EventArgs e)
    {
        btnSave.Focus();
    }


}
public static class ClassExtend
{
    public static void Enabled_False(this Button btn)
    {
        btn.Enabled = false;
        btn.CssClass = "cancel_btn fa fa-times";
    }
    public static void Enabled_True(this Button btn)
    {
        btn.Enabled = true;
        btn.CssClass = "grid_btn";
    }
    public static void Enabled_False(this LinkButton btn)
    {
        btn.Enabled = false;
        btn.CssClass = "grid_btn_delete fa fa-times";
    }
    public static void Enabled_True(this LinkButton btn)
    {
        btn.Enabled = true;
        btn.CssClass = "grid_btn";
    }



}