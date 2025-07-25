#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Orgination 
/// Screen Name			: Customer Master
/// Created By			: Prabhu K
/// Created Date		: 22-July-2010
/// Purpose	            : To Add/Edit the Customer
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using ORG = S3GBusEntity.Origination;
using ORGSERVICE = OrgMasterMgtServicesReference;
using System.Collections;
using System.Globalization;
using System.Configuration;
using System.Web;
using System.Security.Permissions;
using System.Reflection;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

#endregion

public partial class Origination_S3GOrgCustomerMaster_Add : ApplyThemeForProject
{
    #region Initialization

    #region Variables
    //int ErrorCode;
    int intCompanyId = 0;
    int intProgramID = 45;
    int intUserId = 0;
    int intCustomerId = 0;
    string strCustomerCode;
    int intUserLevelId = 0;
    Dictionary<string, string> Procparam = null;
    //User Authorization
    string strMode = string.Empty;
    bool bClearList = false;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    static string strDocpath;
    static string strCurrentFilePath;
    //Code end
    public string strDateFormat;
    string strKey = "Insert";
    static string strPageName = "Customer Master";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../Credit Admin/S3GOrgCustomerMaster_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../Credit Admin/S3GOrgCustomerMaster_Add.aspx';";
    public static Origination_S3GOrgCustomerMaster_Add obj_Page;
    DataTable dtContractNos = null; DataTable dtSubContractNos = null;
    DataTable dtCustSubLimit = null;
    public static DataTable dtUserRights;
    #endregion

    #region Objects
    S3GSession ObjS3GSession;
    UserInfo ObjUserInfo;
    StringBuilder strbBnkDetails = new StringBuilder();
    #endregion

    #endregion

    #region PageLoad

    /// <summary>
    /// Event for Display the UI to Add/Edit the Customer.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Page.Form.Attributes.Add("enctype", "multipart/form-data");
            ObjUserInfo = new UserInfo();
            ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            intCompanyId = ObjUserInfo.ProCompanyIdRW;
            intUserId = ObjUserInfo.ProUserIdRW;
            intUserLevelId = ObjUserInfo.ProUserLevelIdRW;
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyId;
            System.Web.HttpContext.Current.Session["AutoProgramID"] = intProgramID;

            TextBox txtItemNameNationality = ((TextBox)ddlNationality.FindControl("txtItemName"));
            txtItemNameNationality.Attributes.Add("onchange", "fnTrashSuggest('" + ddlNationality.ClientID + "');");
            TextBox txtItemNametxtGroupCode = ((TextBox)txtGroupCode.FindControl("txtItemName"));
            txtItemNametxtGroupCode.Attributes.Add("onchange", "fnTrashSuggest('" + txtGroupCode.ClientID + "');");
            TextBox txtItemNametxtMfcCode = ((TextBox)txtMfcCode.FindControl("txtItemName"));
            txtItemNametxtMfcCode.Attributes.Add("onchange", "fnTrashSuggest('" + txtMfcCode.ClientID + "');");
            TextBox txtItemNametxtBankName = ((TextBox)txtBankName.FindControl("txtItemName"));
            txtItemNametxtBankName.Attributes.Add("onchange", "fnTrashBankSuggest('" + txtBankName.ClientID + "');");
            //btnSave.Enabled_False();
            if (!IsPostBack)
            {
                ExpiryMonth();
                FunProIntializeData();
                funPriLoadCommonLoad();
                FunGetIndustryCode();
                //funPriLoadNationality();
                PopulateBranchList();
                funPriLoadAddressType();
                FunProClearCaches();
                FunPriInsertCustSubLimit("", "", "", "", "","0");
                FunGetCity();
                //FunGetSubIndustryCode();
                // FunPriLoadRelationType();  


            }
            chkCustomer.Focus();
            obj_Page = this;

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            ftxtBankAddress.ValidChars += "\n";
            //ftxtBankBranch.ValidChars += "\n";
            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            //Code end
            string strFormat = ObjS3GSession.ProDateFormatRW;
            calPassportIssueDate.Format = calPassportExpDate.Format = strFormat;
            txtDOB.Attributes.Add("onblur", "fnDoDate(this,'" + txtDOB.ClientID + "','" + strFormat + "',true,false);");
            txtResidenceOmanSince.Attributes.Add("onblur", "fnDoDate(this,'" + txtResidenceOmanSince.ClientID + "','" + strFormat + "',true,false);");
            txtWeddingdate.Attributes.Add("onblur", "fnDoDate(this,'" + txtWeddingdate.ClientID + "','" + strFormat + "',true,false);");
            txtIdentityIssueDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIdentityIssueDate.ClientID + "','" + strFormat + "',true,false);");
            txtIdentityExpiredate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIdentityExpiredate.ClientID + "','" + strFormat + "',false,false);");
            txtLabourCardDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtLabourCardDate.ClientID + "','" + strFormat + "',true,false);");
            txtLaborExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtLaborExpDate.ClientID + "','" + strFormat + "',false,false);");
            txtDateOfJoin.Attributes.Add("onblur", "fnDoDate(this,'" + txtDateOfJoin.ClientID + "','" + strFormat + "',true,false);");
            txtOCCIIssueDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOCCIIssueDate.ClientID + "','" + strFormat + "',true,false);");
            txtOCCIExpiryDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOCCIExpiryDate.ClientID + "','" + strFormat + "',false,false);");
            //txtFacLimitExp.Attributes.Add("onblur", "fnDoDate(this,'" + txtFacLimitExp.ClientID + "','" + strFormat + "',false,'F');");
            txtMaxLenLimiExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtMaxLenLimiExpDate.ClientID + "','" + strFormat + "',false,'F');");
            txtPassportIssueDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtPassportIssueDate.ClientID + "','" + strFormat + "',true,false);");
            txtPassportExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtPassportExpDate.ClientID + "','" + strFormat + "',false,false);");
            txtCurrentMarketValue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Current Market Value");//5366
            txtRemainingLoanValue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, "Remaining Loan Value");
            txtTotNetWorth.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Total Net Worth");
            txtMonBusIncome.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Monthly Business Income");
            //txtFactoringLimit.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Factoring Limit");
            txtMaxLenLimit.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Maximum Lending Limit");
            txtAnnualSales.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, "Annual Sales");
            txtTotalAssets.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, "Total Assets");
            txtPaidCapital.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Paid Up Capital");
            txtbookvalue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Book Value of Shares");
            txtfacevalue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Face Value of Shares");
            //txtNonMoci.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "NON-MOCI");
            //txtCEOWeddingDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCEOWeddingDate.ClientID + "','" + strFormat + "',true,false);");
            // txtExprDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtExprDate.ClientID + "','" + strFormat + "',true,false);");
            //txtIdentityExpiredate.Attributes.Add("readonly", "true");
            //txtIdentityIssueDate.Attributes.Add("readonly", "true");123           
            if (Request.QueryString["CR_VALUE"] != null)
            {
                if (Request.QueryString["CR_VALUE"].ToString() != string.Empty && Request.QueryString["CR_VALUE"].ToString() != " ")
                {
                    txtCustomercode.Text = Request.QueryString["CR_VALUE"].ToString();
                }
            }

            if (Request.QueryString["qsCustomerId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsCustomerId"));
                if (fromTicket != null)
                {
                    intCustomerId = Convert.ToInt32(fromTicket.Name);
                    ViewState["CustomerId"] = intCustomerId;
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid Customer Details");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
                strMode = Request.QueryString["qsMode"];
            }
            if (ViewState["CustomerId"] != null)
            {
                intCustomerId = Convert.ToInt32(ViewState["CustomerId"]);
            }
            if (strMode == "")
            {
                tcCustomerMaster.Tabs[6].Visible = false;
            }
            System.Web.HttpContext.Current.Session["AutoStrMode"] = strMode;
            //txtPercentageStake.SetDecimalPrefixSuffix(2, 2, false, false, "Promoters Stake %");
            //txtJVPartnerStake.SetDecimalPrefixSuffix(2, 2, false, false, "JV Partner Stake %");
            if (ObjUserInfo.ProCountryNameR.Trim().ToLower() == "india")
            {
                ftxtMICRCode.FilterType = AjaxControlToolkit.FilterTypes.Numbers;
                txtMICRCode.MaxLength = 25;
            }
            else
            {
                ftxtMICRCode.FilterType = AjaxControlToolkit.FilterTypes.Custom | AjaxControlToolkit.FilterTypes.Numbers | AjaxControlToolkit.FilterTypes.LowercaseLetters | AjaxControlToolkit.FilterTypes.UppercaseLetters;
                txtMICRCode.MaxLength = 25;
            }

            if (!IsPostBack)
            {
                TextBox txtFirst_Name = ucEntityNamesSetup.FindControl("txtFirst_Name") as TextBox;
                TextBox txtSecond_Name = ucEntityNamesSetup.FindControl("txtSecond_Name") as TextBox;
                TextBox txtThird_Name = ucEntityNamesSetup.FindControl("txtThird_Name") as TextBox;
                TextBox txtFourth_Name = ucEntityNamesSetup.FindControl("txtFourth_Name") as TextBox;
                TextBox txtFifth_Name = ucEntityNamesSetup.FindControl("txtFifth_Name") as TextBox;
                TextBox txtSixth_Name = ucEntityNamesSetup.FindControl("txtSixth_Name") as TextBox;
                txtFirst_Name.AutoPostBack = txtSecond_Name.AutoPostBack = txtThird_Name.AutoPostBack = txtFourth_Name.AutoPostBack = txtFifth_Name.AutoPostBack = txtFifth_Name.AutoPostBack = txtSixth_Name.AutoPostBack = false;

                ucBasicDetAddressSetup.BindAddressSetupDetails(1);
                ucEntityNamesSetup.BindNameSetupDetails();
                pnlCustdtls.Visible = dvCustdtls.Visible = false;
                FunPriSetControlSettings();
                FunPubBindAddsGrid();
                CalendarExtenderSD.Format = ObjS3GSession.ProDateFormatRW;
                CalendarValidupto.Format = ObjS3GSession.ProDateFormatRW;
                CalendarWeddingdate.Format = ObjS3GSession.ProDateFormatRW;
                calIdentityIssueDate.Format = ObjS3GSession.ProDateFormatRW;
                calResidenceOmanSince.Format = ObjS3GSession.ProDateFormatRW;
                calIdentityExpiredate.Format = calLabourCardDate.Format = calLaborExpDate.Format = calPassportIssueDate.Format = calPassportExpDate.Format = ObjS3GSession.ProDateFormatRW;
                calDateOfJoin.Format = calOCCIIssueDate.Format = calOCCIExpiryDate.Format = calFacLimitExp.Format = calMaxLenLimiExpDate.Format = ObjS3GSession.ProDateFormatRW;

                if (strMode != "Q")
                {
                    rbnCreditType.SelectedValue = "2";// Defalut value bind it as One Shot
                    FunPriLoadMasterData();
                    FunProLoadAddressCombos();
                    // FunSetCompanyCountryName();
                    //FunPriLoadContractNos();                    
                }


                //txtDOB.Attributes.Add("onblur", "fnDoDate(this,'" + txtDOB.ClientID + "','" + strDateFormat + "',true,false);");
                //txtWeddingdate.Attributes.Add("onblur", "fnDoDate(this,'" + txtWeddingdate.ClientID + "','" + strDateFormat + "',true,false);");
                //txtIdentityExpiredate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIdentityExpiredate.ClientID + "','" + strDateFormat + "',true,true);");
                //txtIdentityIssueDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIdentityIssueDate.ClientID + "','" + strDateFormat + "',true,false);");
                //txtPassportExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtPassportExpDate.ClientID + "','" + strDateFormat + "',true,true);");
                //txtOCCIIssueDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOCCIIssueDate.ClientID + "','" + strDateFormat + "',true,false);");
                //txtOCCIExpiryDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOCCIExpiryDate.ClientID + "','" + strFormat + "',false,true);");
                //User Authorization
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (intCustomerId > 0)
                {
                    if (strMode == "M")
                    {
                        FunPriDisableControls(1);
                        if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
                        {
                            rfvIndustryCode.Enabled = true;
                            rfvcmbsub.Enabled = true;
                            lblIndustryCode.CssClass = "styleReqFieldLabel";
                            lblsub.CssClass = "styleReqFieldLabel";
                        }
                        else
                        {
                            lblIndustryCode.CssClass = "styleReqFieldLabel";
                            lblsub.CssClass = "styleDisplayLabel";
                            rfvIndustryCode.Enabled = true;
                            rfvcmbsub.Enabled = false;
                        }
                    }
                    else
                    {
                        FunPriLoadMasterData();
                        FunPriDisableControls(-1);
                    }

                }
                else
                {
                    if (Request.QueryString["IsFromEnquiry_Pros_Query"] != null)
                    {
                        FunPriDisableControls(-1);
                    }
                    else
                    {
                        FunPriDisableControls(0);
                    }


                    if (strMode != "Q")
                    {
                        rbnFactoringApplicable.SelectedValue = "2";
                        rbnFactoringApplicable_OnSelectedIndexChanged(sender, e);
                        cmbFactoringType.Enabled = false;
                    }
                }

                if (Request.QueryString["IsFromEnquiry"] != null || Request.QueryString["IsFromApplication"] != null || Request.QueryString["IsFromAssignment"] != null)
                {
                    chkCoApplicant.Enabled = chkGuarantor1.Enabled = false;
                    if (Request.QueryString["IsFromAssignment"] != null)
                        btnCancel.Enabled_False();

                    if (Request.QueryString["EnquiryID"] != null)
                    {
                        int intEnquiryID = Convert.ToInt32(Request.QueryString.Get("EnquiryID"));
                        FunPriLoadEnquiryDetails(intEnquiryID);
                    }
                }
                ucBasicDetAddressSetup.ValGroup("AddAdds");
                ucEntityNamesSetup.ValGroup("Main");
                FunBind_Effective_To();
            }
            //if (strMode != "Q")
            //{
            //    if (txtFamilyName.Text.Trim() == string.Empty)
            //    {
            //        if (ddlCustomerType.SelectedValue != "0")
            //        {
            //            if (ddlCustomerType.SelectedItem.Text.Trim().ToLower() == "individual")
            //            {
            //                TextBox txtFourth_Name = ucEntityNamesSetup.FindControl("txtFourth_Name") as TextBox;
            //                if (txtFourth_Name.Text.Trim() != string.Empty)
            //                {
            //                    txtFamilyName.Text = txtFourth_Name.Text.Trim();
            //                }
            //            }
            //        }
            //    }
            //}
            if (strMode == "Q")
            {
                txtIdentityExpiredate.Enabled = false;
                txtLaborExpDate.Enabled = false;
                txtOCCIExpiryDate.Enabled = false;
                //txtFacLimitExp.Enabled = false;
                txtMaxLenLimiExpDate.Enabled = false;
                txtPassportExpDate.Enabled = false;
                txtNonMoci.Enabled = false;
                //txtIdentityExpiredate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIdentityExpiredate.ClientID + "','" + strFormat + "',false,false);");
                //txtLaborExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtLaborExpDate.ClientID + "','" + strFormat + "',false,false);");
                //txtOCCIExpiryDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOCCIExpiryDate.ClientID + "','" + strFormat + "',false,false);");
                //txtFacLimitExp.Attributes.Add("onblur", "fnDoDate(this,'" + txtFacLimitExp.ClientID + "','" + strFormat + "',false,false);");
                //txtMaxLenLimiExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtMaxLenLimiExpDate.ClientID + "','" + strFormat + "',false,false);");
                //txtPassportExpDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtPassportExpDate.ClientID + "','" + strFormat + "',false,false);");
            }
            //btnSave.Enabled_False();
            if (Request.QueryString["IsFromApplicationGuarantor"] != null)
            {
                chkCustomer.Enabled = false;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.PageLoadError;
            cvCustomerMaster.IsValid = false;//strDateFormat
            if (strMode == "Q")
            {
                txtIdentityExpiredate.Enabled = false;
                txtLaborExpDate.Enabled = false;
                txtOCCIExpiryDate.Enabled = false;
                //txtFacLimitExp.Enabled = false;
                txtMaxLenLimiExpDate.Enabled = false;
                txtPassportExpDate.Enabled = false;
                txtNonMoci.Enabled = false;
            }
        }
    }

    protected void FunSetComboBoxAttributes(AjaxControlToolkit.ComboBox cmb, string Type, string maxLength)
    {
        TextBox textBox = cmb.FindControl("TextBox") as TextBox;

        if (textBox != null)
        {
            textBox.Attributes.Add("onkeyup", "maxlengthfortxt('" + maxLength + "');fnCheckSpecialChars('true');");
            textBox.Attributes.Add("onblur", "funCheckFirstLetterisNumeric(this, '" + Type + "');");
            textBox.Attributes.Add("onpaste", "return false");
        }
    }

    protected void FunSetComboBoxAttributes(TextBox textBox, string Type, string maxLength)
    {
        if (textBox != null)
        {
            textBox.Attributes.Add("onkeyup", "maxlengthfortxt('" + maxLength + "');fnCheckSpecialChars('true');");
            textBox.Attributes.Add("onblur", "funCheckFirstLetterisNumeric(this, '" + Type + "');");
            textBox.Attributes.Add("onpaste", "return false");
        }
    }

    //<<Performance>>
    [System.Web.Services.WebMethod]
    public static string[] GetCityList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
        Procparam.Add("@Category", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_GetAddressLoodup_AGT", Procparam), false);

        return suggetions.ToArray();
    }

    protected void FunProLoadAddressCombos()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            if (intCompanyId > 0)
            {
                Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            }
            DataTable dtAddr = Utility.GetDefaultData("S3G_SYSAD_GetAddressLoodup", Procparam);

            DataTable dtSource = new DataTable();
            //if (dtAddr.Select("Category = 1").Length > 0)
            //{
            //    dtSource = dtAddr.Select("Category = 1").CopyToDataTable();
            //}
            //else
            //{
            //    dtSource = FunProAddAddrColumns(dtSource);
            //}

            //<<Performance>>
            //txtComCity.FillDataTable(dtSource, "Name", "Name", false);
            //txtPerCity.FillDataTable(dtSource, "Name", "Name", false);

            dtSource = new DataTable();
            if (dtAddr.Select("Category = 2").Length > 0)
            {
                dtSource = dtAddr.Select("Category = 2").CopyToDataTable();
            }
            else
            {
                dtSource = FunProAddAddrColumns(dtSource);
            }

            //txtComState.FillDataTable(dtSource, "Name", "Name", false);
            //txtPerState.FillDataTable(dtSource, "Name", "Name", false);

            dtSource = new DataTable();
            if (dtAddr.Select("Category = 3").Length > 0)
            {
                dtSource = dtAddr.Select("Category = 3").CopyToDataTable();
            }
            else
            {
                dtSource = FunProAddAddrColumns(dtSource);
            }

            //txtComCountry.FillDataTable(dtSource, "ID", "Name", false);
            ////txtComCountry.SelectedValue = "18";
            //txtPerCountry.FillDataTable(dtSource, "ID", "Name", false);
            //txtPerCountry.SelectedValue = "18";

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = ex.Message;
            cvCustomerMaster.IsValid = false;
        }
    }


    //private void FunPriLoadContractNos()
    //{
    //    try
    //    {
    //        Procparam = new Dictionary<string, string>();
    //        Procparam.Clear();
    //        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
    //        Procparam.Add("@Customer_Id", intCustomerId.ToString());
    //        DataSet dsContractNos = Utility.GetDataset("S3G_ORG_Get_PANumSANum", Procparam);

    //        dtContractNos = dsContractNos.Tables[0].Copy();
    //        dtSubContractNos = dsContractNos.Tables[1].Copy();

    //        if (dtContractNos.Rows.Count > 0)
    //        {
    //            ddlPANum.FillDataTable(dtContractNos, "PANum", "PANum");
    //            ViewState["dsContractNos"] = dsContractNos;
    //        }
    //        if (dtSubContractNos.Rows.Count > 0)
    //        {
    //            ddlSANum.FillDataTable(dtSubContractNos, "SANum", "SANum");
    //        }
    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}

    protected DataTable FunProAddAddrColumns(DataTable dt)
    {
        dt.Columns.Add("ID");
        dt.Columns.Add("Name");
        dt.Columns.Add("Category");

        return dt;
    }

    /// <summary>
    /// Event for Pre-Initialize the Components  
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected new void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["IsFromEnquiry"] != null || Request.QueryString["IsFromApplication"] != null || Request.QueryString["IsFromAssignment"] != null || Request.QueryString["IsFromApplicationGuarantor"] != null || Request.QueryString["IsFromEnquiry_Pros_Query"] != null)
            {
                this.Page.MasterPageFile = "~/Common/MasterPage.master";
                UserInfo ObjUserInfo = new UserInfo();
                this.Page.Theme = ObjUserInfo.ProUserThemeRW;

            }
            else
            {
                this.Page.MasterPageFile = "~/Common/S3GMasterPageCollapse.master";
                UserInfo ObjUserInfo = new UserInfo();
                this.Page.Theme = ObjUserInfo.ProUserThemeRW;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = "Unable to Initialize the Customer Details";
            cvCustomerMaster.IsValid = false;
        }
    }


    #endregion

    #region Button Events

    /// <summary>
    /// Event for Insert/Update the CustomerDetails
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string strPassport;
            string strNational;


            foreach (GridViewRow gr in grvCustSubLimit.Rows)
            {
                Label txtValues = (Label)gr.FindControl("lblLobId");
                if (txtValues.Text == "4")
                {
                    if (rbnFactoringApplicable.SelectedValue == "2")
                    {
                        Utility.FunShowAlertMsg(this, "Selected Line of business only Applicable if Factoring Applicable Select Yes in Factoring Customers Tab");
                        return;
                    }
                }
            }


            if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
            {
                string[] strCustomerDetails = ddlConstitutionName.SelectedItem.Text.Trim().Split('-');
                if (strCustomerDetails[0].Trim() == "2" || strCustomerDetails[0].Trim() == "3" || strCustomerDetails[0].Trim() == "4" || strCustomerDetails[0].Trim() == "70" || strCustomerDetails[0].Trim() == "72")
                {
                    if (!(grvBankDetails.Rows.Count > 0))
                    {
                        if ((chkCustomer.Checked == true))
                        {
                            Utility.FunShowAlertMsg(this, "Add atleast one Bank Details");
                            ddlAccountType.Focus();
                            return;
                        }
                    }
                    if (!(ViewState["SharsDetails"] != null && ((DataTable)ViewState["SharsDetails"]).Rows.Count > 0))
                    {
                        Utility.FunShowAlertMsg(this, "Add atleast one Share Holder Details");
                        grvShars.FooterRow.Focus();
                        return;
                    }
                }
            }
            if (ddlCustomerType.SelectedItem.ToString().ToLower() == "individual" && (chkCustomer.Checked == true))
            {
                if (!(grvBankDetails.Rows.Count > 0))
                {
                    Utility.FunShowAlertMsg(this, "Add atleast one Bank Details");
                    ddlAccountType.Focus();
                    return;
                }
            }
            if (ddlCustomerType.SelectedItem.ToString().ToLower() == "individual")
            {
                txt_CUSTOMER_NAME.Text = ucEntityNamesSetup.FirstName + " " + ucEntityNamesSetup.SecondName + " " + ucEntityNamesSetup.ThirdName + " " + ucEntityNamesSetup.FourthName + " " + ucEntityNamesSetup.FifthName + " " + ucEntityNamesSetup.SixthName;
                if (txtFamilyName.Text.Trim() == string.Empty)
                {
                    txtFamilyName.Text = ucEntityNamesSetup.FourthName;
                }
            }
            if (txt_CUSTOMER_NAME.Text.Trim() == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Enter Customer Name");
                txt_CUSTOMER_NAME.Focus();
                return;
            }
            if (ViewState["AddsDetailsTable"] != null && ((DataTable)ViewState["AddsDetailsTable"]).Rows.Count == 0)
            {
                Utility.FunShowAlertMsg(this, "Add atleast one Address Details");
                btnAddAdds.Enabled_True();
                btnModifyAdds.Enabled_False();
                ddlAddressType.Focus();
                return;
            }

            // Customer Detail De Dup Check            
            if (FunPriValidateDeDuplCustomerDet(2))
            {
                return;
            }
            else
            {
                if (UserFunctionCheck("CHOPETR_UP"))// Special Rights Check Against the User
                {
                    if (lblDedupeErrorMsg.Text.Trim() != string.Empty)
                    {
                        lblDedupeErrorMsg.Text = lblDedupeErrorMsg.Text.Trim() + " Are you sure want to Continue?";
                        mpeHotList.Show();
                    }
                    else
                    {
                        FunPriSaveAfterCustomer();
                    }
                }
                else
                {
                    if (lblDedupeErrorMsg.Text.Trim() != string.Empty)
                    {
                        Utility.FunShowAlertMsg(this, lblDedupeErrorMsg.Text.Trim());
                        return;
                    }
                    else
                    {
                        FunPriSaveAfterCustomer();
                    }
                }
            }

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            if (intCustomerId > 0)
            {
                cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.UpdateError;
            }
            else
            {
                cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.InsertError;
            }
            cvCustomerMaster.IsValid = false;

        }
    }

    private void FunPriSaveAfterCustomer()
    {
        string strPassport;
        string strNational;

        if (strMode == "M")
        {
            // Customer Max Lending Limit ad Factoring Limit
            if (FunPriValidateLimitDet())
            {
                return;
            }
        }

        Procparam = new Dictionary<string, string>();
        Procparam.Add("@CustomerName", txt_CUSTOMER_NAME.Text.ToString());
        foreach (GridViewRow grv in gvConstitutionalDocuments.Rows)
        {
            TextBox txtValues = (TextBox)grv.FindControl("txtValues");
            string strDocumentFlag = grv.Cells[1].Text;
            if (strDocumentFlag.ToUpper() == "CID-PP")
            {
                strPassport = txtValues.Text.ToString();
                Procparam.Add("@PassportNo", strPassport);
            }
            else if (strDocumentFlag.ToUpper() == "CID-UID")
            {
                strNational = txtValues.Text;
                Procparam.Add("@NationalIdentificationNo", strNational.ToString());
            }
        }
        //txtValues.Text = Convert.ToDecimal(dt.Compute("Sum(Tran_Currency_Amount1)", "")).ToString(FunSetSuffix());
        DataTable dtNeg = Utility.GetDefaultData("NegativeListComparison", Procparam);
        if (dtNeg.Rows.Count > 0)
        {
            if (Convert.ToInt32(dtNeg.Rows[0]["ErrorCode"].ToString()) > 0)
            {
                Utility.FunShowAlertMsg(this, "The entered Details exists in the Negative Customer List");
                return;
            }

        }
        string strDocName = "";
        string strConstitutionAlert = "";

        //if (FunPriValidateDeDuplicateCustomer(out strDocName, out strDeDupCustomerCode))
        //{
        //    strDocName = strDocName.Substring(0, strDocName.Length - 1);
        //    strConstitutionAlert = "alert('__ALERT__');";
        //    if (strDeDupCustomerCode != "")
        //    {
        //        strDeDupCustomerCode = strDeDupCustomerCode.Substring(0, strDeDupCustomerCode.Length - 1);
        //        strDeDupCustomerCode.Replace(",", @"\n");
        //        strConstitutionAlert = strDocName + @" already Exist for following Customer \n" + strDeDupCustomerCode;
        //    }
        //    else
        //    {
        //        strConstitutionAlert = strDocName + @" already Exist for another Customer";
        //    }
        //    strConstitutionAlert += @"\n\nWould you like to proceed?";
        //    strConstitutionAlert = "if(confirm('" + strConstitutionAlert + "')){ document.getElementById('ctl00_ContentPlaceHolder1_btnProceedSave').click();}else{;" + strRedirectPageView + "}";
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Cusotmer Master", strConstitutionAlert, true);
        //    return;
        //}
        strDocName = "";
        if (FunPriValidateDuplicateConstitutionDocs(out strDocName))
        {
            strDocName = strDocName.Substring(0, strDocName.Length - 1);
            strConstitutionAlert = "alert('__ALERT__');";
            strConstitutionAlert = strDocName + " already Exist for another Customer";
            strAlert = strAlert.Replace("__ALERT__", strConstitutionAlert);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Master", strAlert, true);
            //strConstitutionAlert += @"\n\nWould you like to proceed?";
            //strConstitutionAlert = "if(confirm('" + strConstitutionAlert + "')){ document.getElementById('ctl00_ContentPlaceHolder1_btnProceedSave').click();}else{;" + strRedirectPageView + "}";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Cusotmer Master", strConstitutionAlert, true);
            return;
        }

        //if (txtComPincode.Text.Trim().Length > 0 && ObjS3GSession.ProPINCodeDigitsRW != txtComPincode.Text.Trim().Length)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Details", "alert('Communication address Postal Code should be " + ObjS3GSession.ProPINCodeDigitsRW.ToString() + " digits');", true);
        //    tcCustomerMaster.ActiveTab = tbAddress;
        //    return;
        //}
        //else if (txtPerPincode.Text.Trim().Length > 0 && ObjS3GSession.ProPINCodeDigitsRW != txtPerPincode.Text.Trim().Length)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Details", "alert('Permanent address Postal Code should be " + ObjS3GSession.ProPINCodeDigitsRW.ToString() + " digits');", true);
        //    tcCustomerMaster.ActiveTab = tbAddress;
        //    return;
        //}
        //if (ddlCustomerType.SelectedItem.Text.ToUpper() != "INDIVIDUAL")
        //{
        //    if (cmbPublic.SelectedIndex == 0)
        //    {
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Details", "alert('Select the Public/Closely held');", true);
        //        tcCustomerMaster.ActiveTabIndex = 1;
        //        return;
        //    }
        //}

        if (ddlCustomerType.SelectedItem.Text.ToUpper() == "INDIVIDUAL")
        {
            if (txtDOB.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Details", "alert('Enter the Date of Birth');", true);
                tcCustomerMaster.ActiveTabIndex = 1;
                return;
            }


        }
        //if (ddlCustomerType.SelectedItem.Text.ToUpper() != "INDIVIDUAL" && txtResidentialAddress.Text != "" && txtResidentialAddress.Text.Length > 300)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Customer Details", "alert('Residential Address Length should be less than or equal to 300');", true);
        //    tcCustomerMaster.ActiveTabIndex = 1;
        //    return;

        //}
        if (ViewState["ConsDocPath"] == null)
        {
            Utility.FunShowAlertMsg(this, "Define the spooling path in Document Path Setup for Constitution Document");
            return;
        }
        if (ViewState["ConsDocPath"] != null)
        {
            if (Convert.ToString(ViewState["ConsDocPath"]) == "")
            {
                Utility.FunShowAlertMsg(this, "Define the spooling path in Document Path Setup for Constitution Document");
                return;
            }
        }

        foreach (GridViewRow grv in gvConstitutionalDocuments.Rows)
        {
            //AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = (AjaxControlToolkit.AsyncFileUpload)grv.FindControl("asyFileUpload");
            //TextBox txOD = grv.FindControl("txOD") as TextBox;
            LinkButton hlnkView = grv.FindControl("hlnkView") as LinkButton;
            CheckBox chkIsMandatory = (CheckBox)grv.FindControl("chkIsMandatory");
            CheckBox chkIsNeedImageCopy = (CheckBox)grv.FindControl("chkIsNeedImageCopy");
            CheckBox chkCollected = (CheckBox)grv.FindControl("chkCollected");
            CheckBox chkScanned = (CheckBox)grv.FindControl("chkScanned");
            TextBox txtValues = grv.FindControl("txtValues") as TextBox;
            Label lblActualPath = (Label)grv.FindControl("lblActualPath");
            int intRowindex = grv.RowIndex;
            string fileExtension = string.Empty;
            if (chkScanned.Checked && (string.IsNullOrEmpty(lblActualPath.Text)))//Cache["File" + intRowindex.ToString()] == null ||
            {
                Utility.FunShowAlertMsg(this, "All the scanned documents file should be uploaded.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }
            if (chkIsNeedImageCopy.Checked && (!chkScanned.Checked))//Cache["File" + intRowindex.ToString()] == null ||
            {
                Utility.FunShowAlertMsg(this, "All the scanned documents should be Collected.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }
            else
            {
                if (Cache["File" + intRowindex.ToString()] != null)
                {
                    try
                    {
                        HttpPostedFile hpf = (HttpPostedFile)Cache["File" + intRowindex.ToString()];
                        fileExtension = hpf.FileName;
                    }
                    catch
                    {

                    }
                }
                else if (!string.IsNullOrEmpty(lblActualPath.Text))
                {
                    fileExtension = lblActualPath.Text;
                }
            }
            if (chkIsMandatory.Checked && (!chkCollected.Checked))
            {
                Utility.FunShowAlertMsg(this, "All the mandatory documents should be collected.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }
            if ((chkCollected.Checked) && txtValues.Text.Trim() == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "All the Collected documents values should be entered.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }
            // Modified by R. Manikandan
            //Added Two Condition to check Mandatory Scanned Doc must only validated chkScanned.Checked == true && chkCollected.Checked == true

            if (!string.IsNullOrEmpty(fileExtension) && chkScanned.Checked == true && chkCollected.Checked == true)
            {
                fileExtension = fileExtension.Substring(fileExtension.LastIndexOf('.') + 1);
                if (fileExtension != "" && fileExtension.ToLower() != "bmp" && fileExtension.ToLower() != "jpeg" && fileExtension.ToLower() != "jpg" && fileExtension.ToLower() != "gif" && fileExtension.ToLower() != "png" && fileExtension.ToLower() != "pdf")
                {
                    Utility.FunShowAlertMsg(this, "Image/PDF file only can be uploaded. Please check the file format " + fileExtension + "");
                    //Utility.FunShowAlertMsg(this, "Image/PDF file only can be uploaded. Check the file format of " + fileExtension + "");
                    return;
                }

            }


            //string fileExtension = AsyncFileUpload1.FileName.Substring(AsyncFileUpload1.FileName.LastIndexOf('.') + 1);
            //if (fileExtension != "" && fileExtension.ToLower() != "bmp" && fileExtension.ToLower() != "jpeg" && fileExtension.ToLower() != "jpg" && fileExtension.ToLower() != "gif" && fileExtension.ToLower() != "png" && fileExtension.ToLower() != "pdf")
            //{
            //    Utility.FunShowAlertMsg(this, "Image/PDF file only can be uploaded. Check the file format of " + AsyncFileUpload1.FileName.ToString() + "");
            //    return;
            //}

            //if (chkIsMandatory.Checked && !chkCollected.Checked)
            //{
            //    Utility.FunShowAlertMsg(this, "All the mandatory documents should be collected.");
            //    tcCustomerMaster.ActiveTab = TabConstitution;
            //    return;
            //}
            //if (chkIsNeedImageCopy.Checked && (!chkScanned.Checked || (!hlnkView.Enabled && !AsyncFileUpload1.HasFile)))
            // Bug Fixed on 07 - DEC - 2012  Based On Bashyam sir Mail.

            if (chkIsNeedImageCopy.Checked && (!hlnkView.Enabled) && (chkIsMandatory.Checked))
            {
                Utility.FunShowAlertMsg(this, "All the mandatory documents should be Uploaded.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }
            if (chkCollected.Checked && (grv.Cells[1].Text.ToString().StartsWith("CID")) && txtValues.Text.Trim() == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "All the Collected documents values should be entered.");
                tcCustomerMaster.ActiveTab = TabConstitution;
                return;
            }

            if (grv.Cells[1].Text.ToString().ToUpper() == "CID-PTN")
            {
                if (ObjS3GSession.ProCompanyCountry.Trim().ToLower() == "india" && txtValues.Text.Trim() != "")
                {
                    string strExp = @"^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}$";
                    if (!Regex.IsMatch(txtValues.Text.Trim(), strExp))
                    {
                        Utility.FunShowAlertMsg(this, "Permanent Tax Number should be in format of AAAAA9999A");
                        tcCustomerMaster.ActiveTab = TabConstitution;
                        txtValues.Focus();
                        return;
                    }
                }
            }
        }
        FunPriSaveCustomer();
    }

    protected void btnProceedSave_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriSaveCustomer();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            if (intCustomerId > 0)
            {
                cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.UpdateError;
            }
            else
            {
                cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.InsertError;
            }
            cvCustomerMaster.IsValid = false;
        }
    }
    private void FunPriSaveCustomer()
    {

        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            FunPriSetControlSettings();
            int intErrorCode = 0;
            CustomerMasterBusEntity ObjCustomerMaster = new CustomerMasterBusEntity();
            ObjCustomerMaster.ID = Convert.ToInt32(intCustomerId);
            ObjCustomerMaster.CustomerCode = txtCustomercode.Text.Trim();
            ObjCustomerMaster.CustomerType_ID = Convert.ToInt32(ddlCustomerType.SelectedValue);
            if (!string.IsNullOrEmpty(txtGroupCode.SelectedValue))
            {
                ObjCustomerMaster.GROUP_ID = Convert.ToInt32(txtGroupCode.SelectedValue);
                //ObjCustomerMaster.GroupCode = cmbGroupCode.Text.Trim();
            }
            //ObjCustomerMaster.Groupname = txtGroupName.Text.Trim();
            if (!string.IsNullOrEmpty(cmbIndustryCode.Text.Trim()))
                ObjCustomerMaster.IndustryCode = cmbIndustryCode.SelectedValue;
            ObjCustomerMaster.IndustryName = cmbIndustryCode.SelectedItem.Text;
            if (ObjCustomerMaster.IndustryCode == "--Select--")
            {
                ObjCustomerMaster.IndustryName = "";
                ObjCustomerMaster.IndustryCode = "";
            }
            //Sub Industry
            if (!string.IsNullOrEmpty(cmbsub.Text.Trim()))
                ObjCustomerMaster.SubIndustryCode = cmbsub.SelectedValue;
            ObjCustomerMaster.SubIndustryName = cmbsub.SelectedItem.Text;
            //Sub Industry
            if (ddlCustomerType.SelectedItem.Text.ToLower() == "non individual")
            {
                if (cmbIndustryCode.SelectedItem.Text == string.Empty || cmbIndustryCode.SelectedItem.Text == "" || cmbIndustryCode.SelectedItem.Text == "0")
                {
                    Utility.FunShowAlertMsg(this, "Enter Industry Name");
                    return;
                }
                else if (cmbsub.SelectedItem.Text == string.Empty || cmbsub.SelectedItem.Text == "0" || cmbsub.SelectedItem.Text == "")
                {
                    Utility.FunShowAlertMsg(this, "Enter Sub Industry Name");
                    return;
                }
            }
            if (ddlTAXApplicable.SelectedValue.ToString() == "1" && txtVATIN.Text.Trim() == "")
            {
                Utility.FunShowAlertMsg(this, "Enter Customer VAT TIN");
                return;
            }
            //if (Convert.ToInt32(cmbIndustryCode.SelectedValue) > 0)
            //{
            //    ObjCustomerMaster.IndustryCode = cmbIndustryCode.SelectedValue;
            //    ObjCustomerMaster.IndustryName = cmbIndustryCode.SelectedItem.Text;
            //}
            if (!string.IsNullOrEmpty(ddlConstitutionName.Text.Trim())) ObjCustomerMaster.Constitution_ID = Convert.ToInt32(ddlConstitutionName.SelectedValue);
            ObjCustomerMaster.Title = ddlTitle.SelectedValue;
            ObjCustomerMaster.CustomerName = txt_CUSTOMER_NAME.Text.Trim();
            if (!string.IsNullOrEmpty(ddlPostingGroup.SelectedValue)) ObjCustomerMaster.CustomerPostingGroupCode_ID = Convert.ToInt32(ddlPostingGroup.SelectedValue);

            //ObjCustomerMaster.Comm_Address1 = txtComAddress1.Text.Trim();
            //ObjCustomerMaster.Comm_Address2 = txtCOmAddress2.Text.Trim();
            ////<<Performance>>
            ////ObjCustomerMaster.Comm_City = txtComCity.Text.Trim();
            //ObjCustomerMaster.Comm_City = txtComCity.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Comm_State = txtComState.Text.Trim();
            //ObjCustomerMaster.Comm_Country = txtComCountry.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Comm_PINCode = txtComPincode.Text.Trim();
            //ObjCustomerMaster.Comm_Mobile = txtComMobile.Text.Trim();
            //ObjCustomerMaster.Comm_Telephone = txtComTelephone.Text.Trim();
            //ObjCustomerMaster.Comm_Email = txtComEmail.Text.Trim();
            //ObjCustomerMaster.Comm_Website = txtComWebsite.Text.Trim();
            //ObjCustomerMaster.Perm_Address1 = txtPerAddress1.Text.Trim();
            //ObjCustomerMaster.Perm_Address2 = txtPerAddress2.Text.Trim();
            ////<<Performance>>
            ////ObjCustomerMaster.Perm_City = txtPerCity.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Perm_City = txtPerCity.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Perm_State = txtPerState.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Perm_Country = txtPerCountry.SelectedItem.Text.Trim();
            //ObjCustomerMaster.Perm_PINCode = txtPerPincode.Text.Trim();
            //ObjCustomerMaster.Perm_Mobile = txtPerMobile.Text.Trim();
            //ObjCustomerMaster.Perm_Telephone = txtPerTelephone.Text.Trim();
            //ObjCustomerMaster.Perm_Email = txtPerEmail.Text.Trim();
            //ObjCustomerMaster.Perm_Website = txtPerWebSite.Text.Trim();

            ObjCustomerMaster.Gender = ddlGender.SelectedValue;
            ObjCustomerMaster.Cust_Tax_App = ddlTAXApplicable.SelectedValue.ToString();
            if (txtVATIN.Text.Trim() != "")
            {
                ObjCustomerMaster.Cust_VAT_TIN = txtVATIN.Text.Trim();
            }

            if (!string.IsNullOrEmpty(txtDOB.Text.Trim()))
                ObjCustomerMaster.DateofBirth = Utility.StringToDate(txtDOB.Text);
            if (!string.IsNullOrEmpty(txtResidenceOmanSince.Text.Trim()))
                ObjCustomerMaster.Residence_Oman_Since = Utility.StringToDate(txtResidenceOmanSince.Text);
            if (!string.IsNullOrEmpty(ddlMaritalStatus.Text.Trim())) ObjCustomerMaster.MaritalStatus_ID = Convert.ToInt32(ddlMaritalStatus.SelectedValue);
            ObjCustomerMaster.Qualification = txtQualification.Text.Trim();
            ObjCustomerMaster.Profession = txtProfession.Text.Trim();
            ObjCustomerMaster.SpouseName = txtSpouseName.Text.Trim();
            if (!string.IsNullOrEmpty(txtChildren.Text.Trim())) ObjCustomerMaster.Children = Convert.ToInt32(txtChildren.Text.Trim());
            if (!string.IsNullOrEmpty(txtTotalDependents.Text.Trim())) ObjCustomerMaster.TotalDependents = Convert.ToInt32(txtTotalDependents.Text.Trim());
            if (!string.IsNullOrEmpty(txtWeddingdate.Text.Trim())) ObjCustomerMaster.WeddingAnniversaryDate = Utility.StringToDate(txtWeddingdate.Text);
            if (!string.IsNullOrEmpty(ddlHouseType.Text.Trim())) ObjCustomerMaster.HouseORFlat_ID = Convert.ToInt32(ddlHouseType.SelectedValue);
            if (!string.IsNullOrEmpty(txtCurrentMarketValue.Text.Trim())) ObjCustomerMaster.CurrentMarketValue = txtCurrentMarketValue.Text.Trim();
            if (!string.IsNullOrEmpty(txtRemainingLoanValue.Text.Trim())) ObjCustomerMaster.RemainingLoanValue = txtRemainingLoanValue.Text.Trim();
            if (!string.IsNullOrEmpty(txtTotNetWorth.Text.Trim())) ObjCustomerMaster.TotalNetMorth = txtTotNetWorth.Text.Trim();
            if (!string.IsNullOrEmpty(cmbPublic.Text.Trim())) ObjCustomerMaster.PublicCloselyheld_ID = Convert.ToInt32(cmbPublic.SelectedValue);
            if (!string.IsNullOrEmpty(txtDirectors.Text.Trim())) ObjCustomerMaster.NoOfDirectors = Convert.ToInt32(txtDirectors.Text.Trim());
            ObjCustomerMaster.ListedAtStockExchange = txtSE.Text.Trim();
            if (!string.IsNullOrEmpty(txtPaidCapital.Text.Trim())) ObjCustomerMaster.PaidupCapital = Convert.ToDecimal(txtPaidCapital.Text.Trim());
            if (!string.IsNullOrEmpty(txtfacevalue.Text.Trim())) ObjCustomerMaster.FaceValueofShares = Convert.ToDecimal(txtfacevalue.Text.Trim());
            if (!string.IsNullOrEmpty(txtbookvalue.Text.Trim())) ObjCustomerMaster.BookValueofShares = Convert.ToDecimal(txtbookvalue.Text.Trim());
            ObjCustomerMaster.BusinessProfile = txtBusinessProfile.Text.Trim();
            ObjCustomerMaster.Geographicalcoverage = txtGeographical.Text.Trim();
            if (!string.IsNullOrEmpty(txtnobranch.Text.Trim())) ObjCustomerMaster.NoOfBranches = Convert.ToDecimal(txtnobranch.Text.Trim());
            if (!string.IsNullOrEmpty(ddlGovernment.Text.Trim())) ObjCustomerMaster.GovernmentInstitutionalParticipation_ID = Convert.ToInt32(ddlGovernment.SelectedValue);
            if (!string.IsNullOrEmpty(txtPercentageStake.Text.Trim())) ObjCustomerMaster.PercentageOfStake = Convert.ToDecimal(txtPercentageStake.Text.Trim());
            ObjCustomerMaster.JVPartnerName = txtJVPartnerName.Text.Trim();
            if (!string.IsNullOrEmpty(txtJVPartnerStake.Text.Trim())) ObjCustomerMaster.JVPartnerStake = Convert.ToDecimal(txtJVPartnerStake.Text.Trim());
            ObjCustomerMaster.CEOName = txtCEOName.Text.Trim();
            if (!string.IsNullOrEmpty(txtCEOAge.Text.Trim())) ObjCustomerMaster.CEOAge = Convert.ToDecimal(txtCEOAge.Text.Trim());
            if (!string.IsNullOrEmpty(txtCEOexperience.Text.Trim())) ObjCustomerMaster.CEOExperienceInYears = Convert.ToDecimal(txtCEOexperience.Text.Trim());
            //if (!string.IsNullOrEmpty(txtCEOWeddingDate.Text.Trim())) ObjCustomerMaster.CEOWeddingDate = Utility.StringToDate(txtCEOWeddingDate.Text);
            //ObjCustomerMaster.ResidentialAddress = txtResidentialAddress.Text.Trim();


            string strXMLBankDetails = ((DataTable)ViewState["DetailsTable"]).FunPubFormXml(true);
            strXMLBankDetails = strXMLBankDetails.Replace("OWN_BRANCH_ID='-1'", "");
            strXMLBankDetails = strXMLBankDetails.Replace("BRANCH='&nbsp;'", "");
            strXMLBankDetails = strXMLBankDetails.Replace("OWN_BRANCH_ID='&nbsp;'", "");
            ObjCustomerMaster.XmlBankDetails = strXMLBankDetails;

            if (!string.IsNullOrEmpty(txtValidupto.Text.Trim())) ObjCustomerMaster.ValidUpto = Utility.StringToDate(txtValidupto.Text);
            ObjCustomerMaster.Created_By = intUserId;
            ObjCustomerMaster.Modified_By = intUserId;
            ObjCustomerMaster.Company_ID = intCompanyId;
            ObjCustomerMaster.Customer = chkCustomer.Checked;
            ObjCustomerMaster.Guarantor1 = chkGuarantor1.Checked;
            ObjCustomerMaster.Guarantor2 = chkGuarantor1.Checked;
            ObjCustomerMaster.CoApplicant = chkCoApplicant.Checked;
            ObjCustomerMaster.Customer_Group = chkGroupDet.Checked;
            ObjCustomerMaster.XmlConstitutionalDocuments = gvConstitutionalDocuments.FunPubFormXml(true);
            ObjCustomerMaster.CustomerCode = txtCustomercode.Text.Trim();
            ObjCustomerMaster.XmlSubLimitDetails = ((DataTable)ViewState["CUST_SUBLIMIT"]).FunPubFormXml();

            // Added By R. Manikandan CBO Related Chages
            //if (!string.IsNullOrEmpty(txtIdentityExpiredate.Text.Trim()))
            //    ObjCustomerMaster.ExprDate = Utility.StringToDate(txtIdentityExpiredate.Text.ToString()).ToString();

            //Added By Ganapathy on 13-Nov-2013 BEGINS

            if (Request.QueryString["IsFromEnquiry"] != null && Request.QueryString["EnquiryID"] != null)
            {
                ObjCustomerMaster.Enquiry_ID = Convert.ToInt32(Request.QueryString["EnquiryID"].ToString());
            }

            //Added By Ganapathy on 13-Nov-2013 ENDS


            //BCA Changes - Kuppu - Aug-17
            ObjCustomerMaster.Family_Name = txtFamilyName.Text.Trim(); //txtFamilyName.Text.Trim();
            ObjCustomerMaster.Notes = txtNotes.Text.Trim();
            ObjCustomerMaster.IS_BlockListed = chkBadTrack.Checked;
            //BDO Changes - Thangam M - 03-Oct-2012
            if (rbnCreditType.SelectedIndex > -1)
            {
                ObjCustomerMaster.CreditType = Convert.ToInt32(rbnCreditType.SelectedValue);
            }
            //End here
            // Created By : Anbuvel.T, Date : 18-MAY-2018, Description : Customer Master Changes Done.
            ObjCustomerMaster.Nationality = Convert.ToInt32(ddlNationality.SelectedValue);

            if (txtPassportNumber.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Passport_Number = txtPassportNumber.Text.Trim();
                if (txtPassportIssueDate.Text.Trim() != string.Empty)
                {
                    ObjCustomerMaster.Passport_Issue_Date = Utility.StringToDate(txtPassportIssueDate.Text.Trim());
                }
                if (txtPassportExpDate.Text.Trim() != string.Empty)
                {
                    ObjCustomerMaster.Passport_Exp_Date = Utility.StringToDate(txtPassportExpDate.Text.Trim());
                }
            }
            ObjCustomerMaster.NID_CR_RID_Number = txtIdentityColumn.Text.Trim();
            ObjCustomerMaster.NID_CR_RID_Issue_Date = Utility.StringToDate(txtIdentityIssueDate.Text.Trim());
            ObjCustomerMaster.NID_CR_RID_Exp_Date = Utility.StringToDate(txtIdentityExpiredate.Text.Trim());
            if (((DataTable)ViewState["AddsDetailsTable"]).Rows.Count > 0)
            {
                ObjCustomerMaster.XmlAddressDetails = ((DataTable)ViewState["AddsDetailsTable"]).FunPubFormXml();
            }
            if (txtVisaNo.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Visa_Number = txtVisaNo.Text.Trim();
            }
            if (ddlBranch.SelectedValue != "0")
                ObjCustomerMaster.Customer_Branch = Convert.ToInt32(ddlBranch.SelectedValue);
            if (txtLabourCardNo.Text.Trim() != string.Empty)
                ObjCustomerMaster.Labour_Card_No = txtLabourCardNo.Text.Trim();
            if (txtLabourCardDate.Text.Trim() != string.Empty)
                ObjCustomerMaster.Labour_Card_Issue_Date = Utility.StringToDate(txtLabourCardDate.Text.Trim());
            if (txtLaborExpDate.Text.Trim() != string.Empty)
                ObjCustomerMaster.Labour_Card_Exp_Date = Utility.StringToDate(txtLaborExpDate.Text.Trim());
            if (cmbOccupation.SelectedIndex > 0)
            {
                ObjCustomerMaster.Occupation = Convert.ToInt32(cmbOccupation.SelectedValue);
            }
            if (rbnOwn.SelectedIndex > -1)
            {
                ObjCustomerMaster.ISOwn = Convert.ToInt32(rbnOwn.SelectedValue);
            }
            if (rbnMFCEmpIndi.SelectedIndex > -1)
                ObjCustomerMaster.MFC_Employee_Indi = Convert.ToInt32(rbnMFCEmpIndi.SelectedValue);
            //if (hdnMFCUserID.Value != string.Empty)
            //{
            //    ObjCustomerMaster.MFC_Employee_ID = Convert.ToInt32(hdnMFCUserID.Value);
            //}
            if (txtMfcCode.SelectedValue != string.Empty && txtMfcCode.SelectedValue != "0")
            {
                ObjCustomerMaster.MFC_Employee_ID = Convert.ToInt32(txtMfcCode.SelectedValue);
            }
            if (cmbEmployerName.SelectedIndex > 0)
            {
                try
                {
                    ObjCustomerMaster.Employer_Name = Convert.ToInt32(cmbEmployerName.SelectedValue);
                }
                catch
                {
                    ObjCustomerMaster.Other_Employer_Name = cmbEmployerName.SelectedItem.Text.Trim();
                }
            }
            else
            {
                try
                {
                    ObjCustomerMaster.Other_Employer_Name = cmbEmployerName.SelectedItem.Text.Trim();
                }
                catch
                {
                    ObjCustomerMaster.Other_Employer_Name = string.Empty;
                }
            }
            if (cmEmpEcoCode.SelectedIndex > 0)
            {
                ObjCustomerMaster.Employer_Eco_Act_Code = Convert.ToInt32(cmEmpEcoCode.SelectedValue);
            }
            if (txtEmployeeCode.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Employee_Code = txtEmployeeCode.Text.Trim();
            }
            if (txtDepartmentName.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Department_Name = txtDepartmentName.Text.Trim();
            }
            if (txtDesignation.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Designation = txtDesignation.Text.Trim();
            }
            if (txtPlaceofWork.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Place_of_Work = txtPlaceofWork.Text.Trim();
            }
            if (txtDateOfJoin.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Date_Of_Join = Utility.StringToDate(txtDateOfJoin.Text.Trim());
            }
            if (txtMonBusIncome.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Monthily_Income = Convert.ToDecimal(txtMonBusIncome.Text.Trim());
            }
            if (ddlVIP.SelectedIndex > 0)
            {
                ObjCustomerMaster.VIP_Customer = Convert.ToInt32(ddlVIP.SelectedValue);
            }
            if (rbnFinancialRequired.SelectedIndex > -1)
            {
                ObjCustomerMaster.Financial_required = Convert.ToDecimal(rbnFinancialRequired.SelectedValue);
            }
            if (cmbFinancialReceived.SelectedIndex > -1)
            {
                ObjCustomerMaster.Financial_received = Convert.ToInt32(cmbFinancialReceived.SelectedValue);
            }
            if (txtOCCIIssueDate.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.OCCI_Issue_Date = Utility.StringToDate(txtOCCIIssueDate.Text.Trim());
            }
            if (txtNonMoci.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Non_MOCI = Convert.ToDecimal(txtNonMoci.Text.Trim());
            }
            if (txtOCCIExpiryDate.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.OCCI_Exp_Date = Utility.StringToDate(txtOCCIExpiryDate.Text.Trim());
            }
            if (rbnFactoringApplicable.SelectedIndex > -1)
            {
                ObjCustomerMaster.Fac_Applicable = Convert.ToInt32(rbnFactoringApplicable.SelectedValue);
            }
            if (cmbFactoringType.SelectedIndex > -1)
            {
                ObjCustomerMaster.Fac_Type = Convert.ToInt32(cmbFactoringType.SelectedValue);
            }
            if (txtFactoringLimit.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Fac_Limit = Convert.ToDecimal(txtFactoringLimit.Text.Trim());
            }
            if (rbnCovenantApplicable.SelectedIndex > -1)
            {
                ObjCustomerMaster.Covenants_Applicable = Convert.ToInt32(rbnCovenantApplicable.SelectedValue);
            }
            if (txtCovenantClause.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Covenants_Clause = txtCovenantClause.Text.Trim();
            }
            if (rbnAssignmentCollection.SelectedIndex > -1)
            {
                ObjCustomerMaster.Assignment_Collection = Convert.ToDecimal(rbnAssignmentCollection.SelectedValue);
            }
            if (txtFacLimitExp.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Fact_Limit_Exp_date = Utility.StringToDate(txtFacLimitExp.Text.Trim());
            }
            if (cmbIndustryType.SelectedIndex > -1)
            {
                ObjCustomerMaster.Customer_Industry = Convert.ToInt32(cmbIndustryType.SelectedValue);
            }
            if (rbnSenAppli.SelectedIndex > -1)
            {
                ObjCustomerMaster.Seni_Mem_Applicable = Convert.ToInt32(rbnSenAppli.SelectedValue);
            }
            if (rbnSenMemStatus.SelectedIndex > -1)
            {
                ObjCustomerMaster.Seni_Mem_Status = Convert.ToInt32(rbnSenMemStatus.SelectedValue);
            }
            if (rbnSenMemRelInd.SelectedIndex > -1)
            {
                ObjCustomerMaster.Seni_Mem_Rela_Indi = Convert.ToInt32(rbnSenMemRelInd.SelectedValue);
            }
            if (txtMaxLenLimit.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Max_Lend_Amount = Convert.ToDecimal(txtMaxLenLimit.Text.Trim());
            }
            if (rbnRelaPartyind.SelectedIndex > -1)
            {
                ObjCustomerMaster.Related_Parti_Indi = Convert.ToInt32(rbnRelaPartyind.SelectedValue);
            }
            if (txtMaxLenLimiExpDate.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Max_Lend_Limit_Exp = Utility.StringToDate(txtMaxLenLimiExpDate.Text.Trim());
            }
            if (ViewState["SharsDetails"] != null && ((DataTable)ViewState["SharsDetails"]).Rows.Count > 0)
            {
                ObjCustomerMaster.XmlShareDetails = ((DataTable)ViewState["SharsDetails"]).FunPubFormXml();
            }
            if (!(ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual"))
            {
                ObjCustomerMaster.CUSTOMER_NAME1 = ucEntityNamesSetup.FirstName.Trim();
                ObjCustomerMaster.CUSTOMER_NAME2 = ucEntityNamesSetup.SecondName.Trim();
                ObjCustomerMaster.CUSTOMER_NAME3 = ucEntityNamesSetup.ThirdName.Trim();
                ObjCustomerMaster.CUSTOMER_NAME4 = ucEntityNamesSetup.FourthName.Trim();
                ObjCustomerMaster.CUSTOMER_NAME5 = ucEntityNamesSetup.FifthName.Trim();
                ObjCustomerMaster.CUSTOMER_NAME6 = ucEntityNamesSetup.SixthName.Trim();
                txt_CUSTOMER_NAME.Text = ucEntityNamesSetup.FirstName.Trim() + " " + ucEntityNamesSetup.SecondName.Trim() + " " + ucEntityNamesSetup.ThirdName.Trim()
                    + " " + ucEntityNamesSetup.FourthName.Trim() + " " + ucEntityNamesSetup.FifthName.Trim() + " " + ucEntityNamesSetup.SixthName.Trim();
                ObjCustomerMaster.CustomerName = txt_CUSTOMER_NAME.Text.Trim();
            }
            if (txtDrivingNumber.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Driving_Lic_Number = txtDrivingNumber.Text.Trim();
            }
            if (txtBussinessFirm.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Business_Firm_Name = txtBussinessFirm.Text.Trim();
            }
            if (txtBussinessActivity.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Business_Activity = txtBussinessActivity.Text.Trim();
            }
            if (txtCRNumber.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Employer_CR_Number = txtCRNumber.Text.Trim();
            }
            if (txtNRID.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.NRID_Number = txtNRID.Text.Trim();
            }
            if (txtAnnualSales.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Annual_Sale = Convert.ToDecimal(txtAnnualSales.Text.Trim());
            }
            if (txtTotalAssets.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Total_Asset = Convert.ToDecimal(txtTotalAssets.Text.Trim());
            }
            if (txtKeyDecisionMaker.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Key_deci_Maker = txtKeyDecisionMaker.Text.Trim();
            }
            if (txtAuditorName.Text.Trim() != string.Empty)
            {
                ObjCustomerMaster.Auditor_Name = txtAuditorName.Text.Trim();
            }
            ObjCustomerMaster.SME_Indicator = Convert.ToInt32(rbnSMEIndicator.SelectedValue);
            if (cmbSenMemProfession.SelectedIndex > -1)
            {
                ObjCustomerMaster.Seni_Mem_Profession = Convert.ToInt32(cmbSenMemProfession.SelectedValue);
            }
            if (rbnLanCollateral.SelectedIndex > -1)
            {
                ObjCustomerMaster.Land_Collateral = rbnLanCollateral.SelectedValue;
            }
            if (chkIS_SME_FORCED.Checked)
            {
                ObjCustomerMaster.IS_SME_FORCED = 1;
            }
            else
            {
                ObjCustomerMaster.IS_SME_FORCED = 0;
            }
            ObjCustomerMaster.XmlAdditionalInfo = grvAdditionalInfo.FunPubFormXml(true);
            //aceMfcCode
            if (intCustomerId > 0)
            {
                ObjCustomerMaster.XmlTrackDetails = "<Root></Root>";
                ObjCustomerMaster.Mode = "Update";
                //if (lblNoCustomerTrack.Visible)
                //{
                //    ObjCustomerMaster.XmlTrackDetails = "<Root></Root>";
                //}
                //else
                //{
                //    string strXML = gvTrack.FunPubFormXml(true);
                //    strXML = strXML.Replace("RELEASEDBY='&nbsp;'", " ");
                //    strXML = strXML.Replace("TYPE='-1'", " ");
                //    strXML = strXML.Replace("RELEASEDATE=''", " ");
                //    strXML = strXML.Replace("DATE=''", " ");
                //    ObjCustomerMaster.XmlTrackDetails = strXML;
                //}

            }
            else
            {
                ObjCustomerMaster.Mode = "Insert";
            }
            intErrorCode = objCustomerMasterClient.FunPubCreateCustomerInt(out strCustomerCode, ObjCustomerMaster);//(ObjCustomerMaster, out strCustomerCode)

            if (intErrorCode == 0)
            {
                btnSave.Visible = false;
                //Added by Thangam M on 18/Oct/2012 to avoid double save click
                btnSave.Enabled_False();
                //End here
                FunProClearCaches();
                if (intCustomerId > 0)
                {
                    strAlert = strAlert.Replace("__ALERT__", "Customer details updated successfully");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
                else
                {
                    string[] strCustomerDetails = strCustomerCode.Split('~');
                    txtCustomercode.Text = strCustomerDetails[1].ToString();
                    if (Request.QueryString["IsFromEnquiry"] != null || Request.QueryString["IsFromApplication"] != null)
                    {
                        string strCustomerAlert = "alert('Customer details added successfully');";
                        strCustomerAlert += "window.close();opener.window.document.getElementById('ctl00_ContentPlaceHolder1_txtCustomerFocus').focus()";
                        strRedirectPageView = "";
                        if (ViewState["strProposalNo"] != null)
                        {
                            funPriUpdateProspectCustomerId(ViewState["strProposalNo"].ToString(), strCustomerDetails[0].ToString());
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strCustomerAlert, true);
                        Utility.store("EnqNewCustomerId", strCustomerDetails[0].ToString());
                        return;
                    }
                    else if (Request.QueryString["IsFromApplicationGuarantor"] != null)
                    {
                        string strCustomerAlert = "alert('Customer or Guarantor details added successfully');";
                        strCustomerAlert += "window.close();opener.window.document.getElementById('ctl00_ContentPlaceHolder1_txtCustomerMasterGuarantorFocus').focus()";
                        strRedirectPageView = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strCustomerAlert, true);
                        Utility.store("CustGurantorId", strCustomerDetails[0].ToString());
                        Utility.store("GurantorCode", txtCustomercode.Text);
                        Utility.store("GurantorName", txt_CUSTOMER_NAME.Text);


                        return;
                    }
                    else
                    {
                        btnSave.Enabled_False();
                        strAlert = "Customer Code is " + txtCustomercode.Text;
                        strAlert += @"\n\nCustomer details added successfully";
                        strAlert += @"\n\nWould you like to add one more Customer?";
                        strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
                        strRedirectPageView = "";
                    }
                }
            }
            else if (intErrorCode == 85)
            {
                Utility.FunShowAlertMsg(this, "Already given Customer Code Exist");
            }
            else if (intErrorCode == -1)
            {
                Utility.FunShowAlertMsg(this.Page, Resources.LocalizationResources.DocNoNotDefined);
            }
            else if (intErrorCode == -2)
            {
                Utility.FunShowAlertMsg(this.Page, Resources.LocalizationResources.DocNoExceeds);
            }
            else if (intErrorCode == -3)
            {
                //Added by Tamilselvan.S on 2/11/2011 for Adding validation for DNC number length
                Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs._3.ToString());
            }

            else
            {
                if (intCustomerId > 0)
                {
                    strAlert = strAlert.Replace("__ALERT__", "Error in updating Customer details");
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Error in adding Customer details");
                }
                strRedirectPageView = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }
    private void funPriUpdateProspectCustomerId(string strProposalNo, string StrNewCustomerId)
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@CompanyId", intCompanyId.ToString());
            Procparam.Add("@NewCustomerId", StrNewCustomerId);
            Procparam.Add("@ProspectProposalNo", strProposalNo);
            DataSet dsConstitution = Utility.GetDataset("S3G_UPDATE_PROSPECT_CUST_ID", Procparam);
        }
        catch (Exception ex)
        {

        }
        finally
        {

        }
    }
    private bool FunPriValidateDuplicateConstitutionDocs(out string strConsDocName)
    {
        bool blnIsDuplicate = false;
        strConsDocName = "";
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "309");
            Procparam.Add("@Param1", intCompanyId.ToString());
            DataSet dsConstitution = Utility.GetDataset("S3G_ORG_GetCustomerLookUp", Procparam);
            foreach (GridViewRow grDocs in gvConstitutionalDocuments.Rows)
            {
                string strID = grDocs.Cells[0].Text;
                string strDocumentFlag = grDocs.Cells[1].Text;
                string strDocName = grDocs.Cells[2].Text;
                TextBox txtValues = (TextBox)grDocs.FindControl("txtValues");
                if (txtValues != null && strDocumentFlag.ToUpper().StartsWith("CID"))
                {
                    if (txtValues.Text.Trim() != "")
                    {
                        string strCustomerCondition = "";
                        if (intCustomerId > 0)
                        {
                            strCustomerCondition = " and Customer_Id <> " + intCustomerId;
                        }
                        DataRow[] drDuplicateDoc = dsConstitution.Tables[0].Select("DocumentFlag = '" + strDocumentFlag + "' and Values = '" + txtValues.Text.ToUpper().Trim() + "'" + strCustomerCondition);
                        if (drDuplicateDoc.Length > 0)
                        {
                            strConsDocName += strDocName + ",";
                            blnIsDuplicate = true;
                        }
                    }
                }
            }
            //if (blnIsDuplicate)
            //{

            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate Duplicate Documents");
        }
        return blnIsDuplicate;
    }

    private bool FunPriValidateDeDuplicateCustomer(out string strConsDocName, out string strDeDupCustomerCode)
    {
        bool blnIsDuplicate = false;
        strConsDocName = "";
        strDeDupCustomerCode = "";
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@CONSTITUTIONID", ddlConstitutionName.SelectedValue);
            Procparam.Add("@COMPANYID", intCompanyId.ToString());
            DataSet dsConstitution = Utility.GetDataset("S3G_ORG_GETDEDUPPARAMETER", Procparam);
            DataRow[] drDeDupField = dsConstitution.Tables[0].Select("DeDup_Field <> '' and IsRequired = 1");
            bool IsDuplicateCustomerName = false;
            bool IsDuplicateAddress1 = false;
            bool IsDuplicateAddress2 = false;

            if (drDeDupField.Length > 0)
            {
                foreach (DataRow drFieldName in drDeDupField)
                {
                    string strFieldName = drFieldName["DeDup_Field"].ToString();
                    dsConstitution.Tables[1].CaseSensitive = false;
                    if (strFieldName.ToUpper() == "CUSTOMER_NAME")
                    {
                        DataRow[] drDeDup = dsConstitution.Tables[1].Select("Customer_Name = '" + txt_CUSTOMER_NAME.Text + "'");
                        if (drDeDup.Length > 0)
                        {
                            IsDuplicateCustomerName = true;
                            strConsDocName += "Customer Name,";
                        }
                    }
                    //if (strFieldName.ToUpper() == "COMM_ADDRESS1")
                    //{
                    //    DataRow[] drDeDup = dsConstitution.Tables[1].Select("Comm_Address1 = '" + txtComAddress1.Text + "'");
                    //    if (drDeDup.Length > 0)
                    //    {
                    //        IsDuplicateAddress1 = true;
                    //        strConsDocName += "Communication Address1,";
                    //    }
                    //}
                    //if (strFieldName.ToUpper() == "COMM_ADDRESS2")
                    //{
                    //    DataRow[] drDeDup = dsConstitution.Tables[1].Select("Comm_Address2 = '" + txtCOmAddress2.Text + "'");
                    //    if (drDeDup.Length > 0)
                    //    {
                    //        IsDuplicateAddress2 = true;
                    //        strConsDocName += "Communication Address2,";
                    //    }
                    //}
                }
            }
            foreach (GridViewRow grDocs in gvConstitutionalDocuments.Rows)
            {
                string strCategoryID = grDocs.Cells[9].Text;
                string strDocumentFlag = grDocs.Cells[1].Text;
                string strDocName = grDocs.Cells[2].Text;
                TextBox txtValues = (TextBox)grDocs.FindControl("txtValues");
                if (txtValues != null)
                {
                    if (txtValues.Text.Trim() != "")
                    {
                        DataRow[] drDuplicateDoc = dsConstitution.Tables[0].Select("CONSDOCUMENTCATEGORY_ID = '" + strCategoryID + "' and Document_Value = '" + txtValues.Text.ToUpper().Trim() + "'");
                        if (drDuplicateDoc.Length > 0)
                        {
                            strConsDocName += strDocName + ",";
                            blnIsDuplicate = true;
                            foreach (DataRow dr in drDuplicateDoc)
                            {
                                if (!strDeDupCustomerCode.Contains(dr["CustomerCode"].ToString()))
                                {
                                    strDeDupCustomerCode += dr["CustomerCode"].ToString() + ",";
                                }

                            }
                        }
                    }
                }
            }
            if (IsDuplicateAddress1 || IsDuplicateAddress2 || IsDuplicateCustomerName || blnIsDuplicate)
            {
                blnIsDuplicate = true;
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate Duplicate Documents");
        }
        return blnIsDuplicate;
    }

    private void ClearControls()
    {
        try
        {

            txtDOB.Text = txtAge.Text = txtQualification.Text = txtProfession.Text =
            txtSpouseName.Text = txtChildren.Text = txtTotalDependents.Text = txtWeddingdate.Text = txtCurrentMarketValue.Text
            = txtRemainingLoanValue.Text = txtTotNetWorth.Text = txtDirectors.Text = txtSE.Text = txtPaidCapital.Text = txtfacevalue.Text
            = txtbookvalue.Text = txtBusinessProfile.Text = txtGeographical.Text = txtnobranch.Text = txtPercentageStake.Text =
            txtJVPartnerName.Text = txtJVPartnerStake.Text = txtCEOName.Text = txtCEOAge.Text = txtCEOexperience.Text =
            txtAccountNumber.Text = txtMICRCode.Text = txtBankAddress.Text =
            txtLOBName.Text = txtValidupto.Text = txtUtilizedAmt.Text
            = txtFacilityType.Text = hdnCustAge.Value = txtCustomercode.Text = string.Empty;
            if (!(Request.QueryString["IsFromEnquiry"] != null))
            {
                txt_CUSTOMER_NAME.Text = txtIdentityColumn.Text = txtIdentityExpiredate.Text = txtIdentityIssueDate.Text = string.Empty;
            }
            ucEntityNamesSetup.ClearControls();
            txtBankName.Clear();
            ddlBankBranch.SelectedIndex = -1;
            cmbIndustryCode.SelectedValue = "0";
            if (ddlConstitutionName.Items.Count > 0) ddlConstitutionName.SelectedIndex = -1;
            if (ddlTitle.Items.Count > 0) ddlTitle.SelectedIndex = -1;
            if (ddlPostingGroup.Items.Count > 0) ddlPostingGroup.SelectedIndex = -1;
            if (ddlGender.Items.Count > 0) ddlGender.SelectedIndex = -1;
            if (ddlMaritalStatus.Items.Count > 0) ddlMaritalStatus.SelectedIndex = -1;
            if (ddlHouseType.Items.Count > 0) ddlHouseType.SelectedIndex = -1;
            //if (ddlOwn.Items.Count > 0) ddlOwn.SelectedIndex = 0;
            if (cmbPublic.Items.Count > 0) cmbPublic.SelectedIndex = -1;
            if (ddlGovernment.Items.Count > 0) ddlGovernment.SelectedIndex = -1;

            if (ddlAccountType.Items.Count > 0) ddlAccountType.SelectedIndex = -1;
            cmbIndustryCode.SelectedIndex = 0;
            cmbIndustryCode.SelectedIndex = -1;
            cmbsub.SelectedIndex = -1;
            gvConstitutionalDocuments.Dispose();
            gvConstitutionalDocuments.DataSource = null;
            gvConstitutionalDocuments.DataBind();
            txt_CUSTOMER_NAME.Enabled = true;
            tcCustomerMaster.ActiveTab = tbAddress;
            txtNotes.Text = string.Empty;
            ddlBranch.SelectedIndex = -1;
            ddlAddressType.SelectedValue = "2";
            ddlNationality.Clear();
            if (!(Request.QueryString["IsFromEnquiry"] != null))
            {
                FunPubBindAddsGrid();
                ucBasicDetAddressSetup.BindAddressSetupDetails(1);
                ucBasicDetAddressSetup.ClearControls();
            }
            AdditionalInfor();

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.ClearError;
            cvCustomerMaster.IsValid = false;

        }
    }
    /// <summary>
    /// Event for Clear the Controls
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            chkCoApplicant.Checked = chkCustomer.Checked = chkGuarantor1.Checked = chkGroupDet.Checked = false;
            if (ddlCustomerType.Items.Count > 0) ddlCustomerType.SelectedIndex = 0;
            ClearControls();
            pnlCustdtls.Visible = dvCustdtls.Visible = false;
            txt_CUSTOMER_NAME.ReadOnly = false;
            rbnCreditType.SelectedValue = "2";
            txtGroupCode.Enabled = false;
            lblIdentityColumn.Text = "Reference Number";
            lblIdentityIssueDate.Text = "Issue Date";
            lblIdentityExpiredate.Text = "Expiry Date";
            rfvIdentityColumn.ErrorMessage = "Enter Reference Number";
            rfvIdentityIssueDate.ErrorMessage = "Enter Issue Date";
            rfvIdentityExpiredate.ErrorMessage = "Enter Expiry Date";
            cmbsub.Items.Clear();
            ClearControls();
            grvBankDetails.DataSource = null;
            grvBankDetails.DataBind();
            FunProIntializeData();
            ddlNationality.Clear();
            FunPriToggleLoanAdminControls(false);
            ClearAllIndControls();
            ClearAllNonControls();
            chkCustomer.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.ClearError;
            cvCustomerMaster.IsValid = false;

        }
    }

    /// <summary>
    /// Event for Cancel the Process
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            FunProClearCaches();
            if (Request.QueryString["IsFromEnquiry"] != null)
            {
                strAlert = "window.close();";
                //window.opener.location.reload();"; for bug in Pricing Commented on 15/02/2011 by Nataraj
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
            }
            else if (Request.QueryString["IsFromApplication"] != null)
            {
                strAlert = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
            }
            else if (Request.QueryString["IsFromApplicationGuarantor"] != null)
            {
                strAlert = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
            }
            else if (Request.QueryString["IsFromEnquiry_Pros_Query"] != null)
            {
                strAlert = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
            }
            else if (Request.QueryString["IsFromAssignment"] != null)
            {
                //strAlert = "window.close();";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "window.close();", true);
            }
            else
            {
                Response.Redirect("~/Credit Admin/S3gOrgCustomerMaster_View.aspx");
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.CancelError;
            cvCustomerMaster.IsValid = false;
        }
    }
    #endregion

    #region Local Methods



    #region GetCompletionList
    /// <summary>
    /// GetCompletionList
    /// </summary>
    /// <param name="prefixText">search text</param>
    /// <param name="count">no of matches to display</param>
    /// <returns>string[] of matching names</returns>
    [System.Web.Services.WebMethod]
    public static string[] GetCompletionList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
        Procparam.Add("@Option", "2");
        //if (Convert.ToInt32(obj_Page.intUserId) > 0)
        //{
        //    Procparam.Add("@User_ID", obj_Page.intUserId.ToString());
        //}
        Procparam.Add("@Program_Id", "45");
        //Procparam.Add("@Is_Active", "1");
        Procparam.Add("@Prefixtext", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_LOCATION", Procparam));
        return suggetions.ToArray();

        //DataTable dt1 = new DataTable();

        //dt1 = (DataTable)HttpContext.Current.Session["GroupDT"];

        //List<String> suggetions = GetSuggestions(prefixText, count, dt1);


        //return suggetions.ToArray();
    }

    //[System.Web.Services.WebMethod]
    //public static string[] GetIndustryList(String prefixText, int count)
    //{
    //    DataTable dt1 = new DataTable();

    //    dt1 = (DataTable)HttpContext.Current.Session["IndustryDT"];

    //    List<String> suggetions = GetSuggestions(prefixText, count, dt1);


    //    return suggetions.ToArray();
    //}

    //#endregion


    #region GetSuggestions
    /// <summary>
    /// GetSuggestions
    /// </summary>
    /// <param name="key">Country Names to search</param>
    /// <returns>Country Names Similar to key</returns>
    private static List<String> GetSuggestions(string key, int count, DataTable dt1)
    {
        List<String> suggestions = new List<string>();
        try
        {

            //DataTable dt1 = new DataTable();

            //dt1 = (DataTable)HttpContext.Current.Session["GroupDT"];// objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);

            string filterExpression = "value like '" + key + "%'";
            DataRow[] dtSuggestions = dt1.Select(filterExpression);

            foreach (DataRow dr in dtSuggestions)
            {
                string suggestion = dr["value"].ToString();
                suggestions.Add(suggestion);
            }

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            return suggestions;

            //   lblErrorMessage.Text = Resources.LocalizationResources.CustomerTypeChangeError;
        }

        return suggestions;
    }
    #endregion


    /// <summary>
    /// Load the Master data in Dropdownlist
    /// </summary>
    private void FunPriLoadMasterData()
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            ObjStatus.Option = 1;
            ObjStatus.Param1 = S3G_Statu_Lookup.CUSTOMER_TYPE.ToString();
            Utility.FillDLL(ddlCustomerType, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));
            //ddlCustomerType.SelectedIndex = 2;
            //ddlCustomerType.ClearDropDownList();

            ObjStatus.Param1 = S3G_Statu_Lookup.HOUSE_TYPE.ToString();
            Utility.FillDLL(ddlHouseType, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            //ObjStatus.Param1 = S3G_Statu_Lookup.COMPANY_TYPE.ToString();
            //Utility.FillDLL(cmbPublic, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@Param1", "COMPANY_TYPE");
            cmbPublic.BindDataTable("S3G_OR_Get_CustLookUp", Procparam, new string[] { "ID", "Name" });

            ObjStatus.Param1 = S3G_Statu_Lookup.GOVERNMENT.ToString();
            Utility.FillDLL(ddlGovernment, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            ObjStatus.Param1 = S3G_Statu_Lookup.MARITAL_STATUS.ToString();
            Utility.FillDLL(ddlMaritalStatus, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            ObjStatus.Param1 = S3G_Statu_Lookup.ACCOUNT_TYPE.ToString();
            Utility.FillDLL(ddlAccountType, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            ObjStatus.Param1 = "TITLE";
            Utility.FillDLL(ddlTitle, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            // Gender
            ObjStatus.Param1 = "GENDER";
            Utility.FillDLL(ddlGender, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            // Modified By : Anbuvel.T Date : 05-2018, Description : GL Posting Code Display - Based on FA Account Card
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "4");
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            ddlPostingGroup.BindDataTable("S3G_OR_GET_ENTYLST", Procparam, new string[] { "ID", "Code" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "6");
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            ddlTAXApplicable.BindDataTable("S3G_OR_GET_ENTYLST", Procparam, new string[] { "ID", "NAME" });

            //ObjStatus.Option = 3;
            //ObjStatus.Param1 = intCompanyId.ToString();
            //ObjStatus.Param2 = intCustomerId.ToString();
            //Utility.FillDLL(ddlPostingGroup, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            //ObjStatus.Option = 4;
            //ObjStatus.Param1 = intCompanyId.ToString();
            //ObjStatus.Param2 = intUserId.ToString();
            //Utility.FillDLL(ddlBranchList, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

            ObjStatus.Option = 8;
            ObjStatus.Param1 = "GROUP";
            ObjStatus.Param2 = intCompanyId.ToString();
            DataTable dt = new DataTable();
            dt = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            System.Web.HttpContext.Current.Session["GroupDT"] = dt;


            //ObjStatus.Option = 8;
            //ObjStatus.Param1 = "INDUSTRY";
            //ObjStatus.Param2 = intCompanyId.ToString();
            //DataTable Indusdt = new DataTable();
            //Indusdt = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            //System.Web.HttpContext.Current.Session["IndustryDT"] = Indusdt;
            FunGetIndustryCode();

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }
    private void ConstitutionBind()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "2");
        Procparam.Add("@Param1", Convert.ToString(intCompanyId));
        Procparam.Add("@Param3", ddlCustomerType.SelectedValue);
        ddlConstitutionName.BindDataTable("S3G_OR_Get_CustLookUp", Procparam, new string[] { "Constitution_ID", "ConstitutionName" });
        //ObjStatus.Option = 2;
        //ObjStatus.Param1 = intCompanyId.ToString();
        //Utility.FillDLL(ddlConstitutionName, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));
    }
    private void ComplianceAge()
    {
        hdnCustAge.Value = string.Empty;
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "2");
        Procparam.Add("@Companyid", Convert.ToString(intCompanyId));
        Procparam.Add("@PROGRAM_ID", Convert.ToString(45));
        DataTable dtcheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
        if (dtcheck.Rows.Count > 0)
        {
            if (Convert.ToInt32(dtcheck.Rows[0]["CHECK_AGE"]) > 0)
            {
                hdnCustAge.Value = Convert.ToString(dtcheck.Rows[0]["CHECK_AGE"]);
            }
        }
    }

    private void ExpiryMonth()
    {
        hdnExpiryMonth.Value = string.Empty;
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "4");
        Procparam.Add("@Companyid", Convert.ToString(intCompanyId));
        Procparam.Add("@PROGRAM_ID", "45");
        DataTable dtcheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
        if (dtcheck.Rows.Count > 0)
        {
            if (Convert.ToInt32(dtcheck.Rows[0]["Expiry_Month"]) > 0)
            {
                hdnExpiryMonth.Value = Convert.ToString(dtcheck.Rows[0]["Expiry_Month"]);
            }
        }
    }
    /*
    private void FunPriLoadRelationType()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", intCompanyId.ToString());
            DataTable dt = new DataTable();
            dt = Utility.GetDefaultData("S3G_ORG_GetRelationType", Procparam);
            GrvRelation.DataSource = dt;
            GrvRelation.DataBind();
        }
        catch (Exception objException)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
    }
     */

    /// <summary>
    /// Toggle the Tabs for LoanAdmin Checking
    /// </summary>
    /// <param name="blnIsEnabled"></param>
    private void FunPriToggleLoanAdminControls(bool blnIsEnabled)
    {
        try
        {
            tcCustomerMaster.Tabs[4].Enabled = blnIsEnabled;
            tcCustomerMaster.Tabs[5].Enabled = blnIsEnabled;
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw new ApplicationException("Unable to Toggle Customer Track/Credit Details");
        }
    }

    /// <summary>
    /// Toggle the Controls for CustomerType(Individual/NonIndividual)
    /// </summary>
    private void FunPriToggleCustomerTypeControls()
    {
        try
        {
            if (Convert.ToInt16(ddlCustomerType.SelectedValue) > 0)
            {
                if (ddlCustomerType.SelectedItem.Text.ToUpper() == "INDIVIDUAL")
                {
                    PriFunToggleCustomerTypeControls(false);
                    cmbPublic.SelectedIndex = ddlGovernment.SelectedIndex = 0;
                    txtDirectors.Text = txtSE.Text = txtPaidCapital.Text = txtfacevalue.Text =
                    txtbookvalue.Text = txtBusinessProfile.Text = txtGeographical.Text =
                    txtnobranch.Text = txtPercentageStake.Text = txtJVPartnerName.Text =
                    txtJVPartnerStake.Text = txtCEOName.Text = txtCEOAge.Text =
                    txtCEOexperience.Text = //txtResidentialAddress.Text =
                        //txtCEOWeddingDate.Text = 
                    string.Empty;
                }
                else
                {
                    PriFunToggleCustomerTypeControls(true);
                    txtDOB.Text = txtAge.Text = txtQualification.Text =
                    txtProfession.Text = txtSpouseName.Text = txtChildren.Text =
                    txtTotalDependents.Text = txtTotNetWorth.Text = txtRemainingLoanValue.Text =
                    txtWeddingdate.Text = string.Empty;
                    lblGender.CssClass = lblDOB.CssClass =
                    "styleDisplayLabel";
                    ddlMaritalStatus.SelectedIndex = ddlHouseType.SelectedIndex = 0;//ddlOwn.SelectedIndex =
                    ddlGender.SelectedIndex = 0;

                }
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw new ApplicationException("Due to Data Problem,Unable to Toggle Controls for Customer Type");
        }
    }


    /// <summary>
    /// Toggle the Controls for CustomerType(Individual/NonIndividual)
    /// </summary>
    /// <param name="blnIsEnabled"></param>
    private void PriFunToggleCustomerTypeControls(bool blnIsEnabled)
    {
        try
        {

            //Toggle the Controls for IndividualCustomerType
            pnlNonIndividual.Enabled = txtDirectors.Enabled = blnIsEnabled;
            txtSE.Enabled = txtPaidCapital.Enabled = txtfacevalue.Enabled = txtbookvalue.Enabled = blnIsEnabled;
            txtBusinessProfile.Enabled = txtGeographical.Enabled = txtnobranch.Enabled = ddlGovernment.Enabled = blnIsEnabled;
            txtPercentageStake.Enabled = txtJVPartnerName.Enabled = txtJVPartnerStake.Enabled = txtCEOName.Enabled = blnIsEnabled;
            txtCEOAge.Enabled = txtCEOexperience.Enabled = blnIsEnabled;

            //rfvPublic.Enabled = blnIsEnabled; // rfvGeographical.Enabled = rfvBusinessProfile.Enabled =rfvBusinessProfile.Enabled = 
            rfvOmaniStaff.Enabled =
            rfvJVPartnerStake.Enabled = rfvAnnualSales.Enabled = rfvTotalAssets.Enabled = rfvNoOfEmployees.Enabled =
            rfvOCCIIssueDate.Enabled = rfvOCCIExpiryDate.Enabled = rfvNonMoci.Enabled = blnIsEnabled;

            //Toggle the Controls for NonIndividualCustomerType
            pnlIndividual.Enabled = ddlGender.Enabled = txtDOB.Enabled = CalendarExtenderSD.Enabled = !blnIsEnabled;
            txtAge.Enabled = ddlMaritalStatus.Enabled = txtQualification.Enabled = txtProfession.Enabled = !blnIsEnabled;
            ddlHouseType.Enabled = !blnIsEnabled;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Toggle Customer Type Controls");
        }
    }


    /// <summary>
    /// method for default settings for all controls
    /// </summary>
    private void FunPriSetControlSettings()
    {
        try
        {
            //lblCustomercode.Text = Resources.LocalizationResources.ORG_CUST_lblCustomercode;
            //lblCustomerType.Text = Resources.LocalizationResources.ORG_CUST_lblCustomerType;
            //lblgroupcode.Text = Resources.LocalizationResources.ORG_CUST_lblgroupcode;
            //lblGroupName.Text = Resources.LocalizationResources.ORG_CUST_lblGroupName;
            //lblIndustryCode.Text = Resources.LocalizationResources.ORG_CUST_lblIndustryCode;
            //lblIndustryName.Text = Resources.LocalizationResources.ORG_CUST_lblIndustryName;
            //lblConstitutionName.Text = Resources.LocalizationResources.ORG_CUST_lblConstitutionName;
            //lblTitle.Text = Resources.LocalizationResources.ORG_CUST_lblTitle;
            //lblCustomerName.Text = Resources.LocalizationResources.ORG_CUST_lblCustomerName;
            //lblCustomerPostingGroup.Text = Resources.LocalizationResources.ORG_CUST_lblCustomerPostingGroup;

            //lblComAddress1.Text = Resources.LocalizationResources.ORG_CUST_lblComAddress1;
            //lblPerAddress1.Text = Resources.LocalizationResources.ORG_CUST_lblPerAddress1;
            //lblComAddress2.Text = Resources.LocalizationResources.ORG_CUST_lblComAddress2;
            //lblPerAddress2.Text = Resources.LocalizationResources.ORG_CUST_lblPerAddress2;
            //lblComcity.Text = Resources.LocalizationResources.ORG_CUST_lblComcity;
            //lblPerCity.Text = Resources.LocalizationResources.ORG_CUST_lblPerCity;
            //lblComState.Text = Resources.LocalizationResources.ORG_CUST_lblComState;
            //lblPerState.Text = Resources.LocalizationResources.ORG_CUST_lblPerState;
            //lblComCountry.Text = Resources.LocalizationResources.ORG_CUST_lblComCountry;
            //lblPerCountry.Text = Resources.LocalizationResources.ORG_CUST_lblPerCountry;
            //lblCompincode.Text = Resources.LocalizationResources.ORG_CUST_lblCompincode;
            //lblPerpincode.Text = Resources.LocalizationResources.ORG_CUST_lblPerpincode;
            //lblComMobile.Text = Resources.LocalizationResources.ORG_CUST_lblComMobile;
            //lblPerMobile.Text = Resources.LocalizationResources.ORG_CUST_lblPerMobile;
            //lblComTelephone.Text = Resources.LocalizationResources.ORG_CUST_lblComTelephone;
            //lblPerTelephone.Text = Resources.LocalizationResources.ORG_CUST_lblPerTelephone;
            //lblComEmail.Text = Resources.LocalizationResources.ORG_CUST_lblComEmail;
            //lblPerEmail.Text = Resources.LocalizationResources.ORG_CUST_lblPerEmail;
            //lblComWebSite.Text = Resources.LocalizationResources.ORG_CUST_lblComWebSite;
            //lblPerWebSite.Text = Resources.LocalizationResources.ORG_CUST_lblPerWebSite;

            //lblGender.Text = Resources.LocalizationResources.ORG_CUST_lblGender;
            //lblDOB.Text = Resources.LocalizationResources.ORG_CUST_lblDOB;
            //lblAge.Text = Resources.LocalizationResources.ORG_CUST_lblAge;
            //lblMaritalStatus.Text = Resources.LocalizationResources.ORG_CUST_lblMaritalStatus;
            //lblQualification.Text = Resources.LocalizationResources.ORG_CUST_lblQualification;
            //lblProfession.Text = Resources.LocalizationResources.ORG_CUST_lblProfession;
            //lblSpouseName.Text = Resources.LocalizationResources.ORG_CUST_lblSpouseName;
            //lblChildren.Text = Resources.LocalizationResources.ORG_CUST_lblChildren;
            //lblTotalDependents.Text = Resources.LocalizationResources.ORG_CUST_lblTotalDependents;
            //lblWeddingdate.Text = Resources.LocalizationResources.ORG_CUST_lblWeddingdate;
            //lblHouseType.Text = Resources.LocalizationResources.ORG_CUST_lblHouseType;
            //lblOwn.Text = Resources.LocalizationResources.ORG_CUST_lblOwn;
            //lblCurrentMarketValue.Text = Resources.LocalizationResources.ORG_CUST_lblCurrentMarketValue;
            //lblRemainingLoanValue.Text = Resources.LocalizationResources.ORG_CUST_lblRemainingLoanValue;
            //lblTotNetWorth.Text = Resources.LocalizationResources.ORG_CUST_lblTotNetWorth;

            //lblPublic.Text = Resources.LocalizationResources.ORG_CUST_lblPublic;
            //lblDirectors.Text = Resources.LocalizationResources.ORG_CUST_lblDirectors;
            //lblStockExchange.Text = Resources.LocalizationResources.ORG_CUST_lblStockExchange;
            //lblPaidCapital.Text = Resources.LocalizationResources.ORG_CUST_lblPaidCapital;
            //lblfacevalue.Text = Resources.LocalizationResources.ORG_CUST_lblfacevalue;
            //lblbookvalue.Text = Resources.LocalizationResources.ORG_CUST_lblbookvalue;
            //lblBusinessProfile.Text = Resources.LocalizationResources.ORG_CUST_lblBusinessProfile;
            //lblGeographical.Text = Resources.LocalizationResources.ORG_CUST_lblGeographical;
            //lblnobranch.Text = Resources.LocalizationResources.ORG_CUST_lblnobranch;
            //lblGovernment.Text = Resources.LocalizationResources.ORG_CUST_lblGovernment;
            //lblStake.Text = Resources.LocalizationResources.ORG_CUST_lblStake;
            //lblJVPartnerName.Text = Resources.LocalizationResources.ORG_CUST_lblJVPartnerName;
            //lblJVPartnerStake.Text = Resources.LocalizationResources.ORG_CUST_lblJVPartnerStake;
            //lblCEO.Text = Resources.LocalizationResources.ORG_CUST_lblCEO;
            //lblCEOAge.Text = Resources.LocalizationResources.ORG_CUST_lblCEOAge;
            //lblCEOexperience.Text = Resources.LocalizationResources.ORG_CUST_lblCEOexperience;
            //lblResidentialAddress.Text = Resources.LocalizationResources.ORG_CUST_lblResidentialAddress;
            //lblCEOWeddingDate.Text = Resources.LocalizationResources.ORG_CUST_lblCEOWeddingDate;

            //lblAccountType.Text = Resources.LocalizationResources.ORG_CUST_lblAccountType;
            //lblAccountNumber.Text = Resources.LocalizationResources.ORG_CUST_lblAccountNumber;
            //lblBankName.Text = Resources.LocalizationResources.ORG_CUST_lblBankName;
            //lblBankBranch.Text = Resources.LocalizationResources.ORG_CUST_lblBankBranch;
            //lblMICRCode.Text = Resources.LocalizationResources.ORG_CUST_lblMICRCode;
            //lblBankAddress.Text = Resources.LocalizationResources.ORG_CUST_lblBankAddress;

            //lblLOBName.Text = Resources.LocalizationResources.ORG_CUST_lblLOBName;
            //lblProductGroup.Text = Resources.LocalizationResources.ORG_CUST_lblProductGroup;
            //lblSanctionamt.Text = Resources.LocalizationResources.ORG_CUST_lblSanctionamt;
            //lblValid.Text = Resources.LocalizationResources.ORG_CUST_lblValid;
            //lblUtilizedAmt.Text = Resources.LocalizationResources.ORG_CUST_lblUtilizedAmt;
            //lblFacilityType.Text = Resources.LocalizationResources.ORG_CUST_lblFacilityType;
            //lblHeading.Text = Resources.LocalizationResources.ORG_CUST_lblHeading;

            //btnSave.Text = Resources.LocalizationResources.ORG_CUST_btnSave;
            //btnClear.Text = Resources.LocalizationResources.ORG_CUST_btnClear;



            rfvCustomerType.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvCustomerType;
            rfvConstitutionName.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvConstitutionName;
            rfvTitle.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvTitle;
            //rfvComAddress1.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComAddress1;
            //rfvtxtPerAddress1.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvtxtPerAddress1;
            ////<<Performance>>
            ////rfvComCity.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComCity;
            ////txtComCity.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComCity;
            ////rfvPerCity.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerCity;
            ////txtPerCity.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerCity;
            //rfvComState.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComState;
            //rfvPerState.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerState;
            //rfvComCountry.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComCountry;
            //rfvPerCountry.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerCountry;
            ////rfvComPincode.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComPincode;
            ////rvfPerPincode.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rvfPerPincode;
            //rfvComTelephone.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComTelephone;
            //rfvPerTelephone.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerTelephone;
            ////rfvComEmail.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvComEmail;
            //revEmailId.ErrorMessage = Resources.LocalizationResources.ORG_CUST_revEmailId;
            ////rfvPerEmail.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPerEmail;
            //revPerEmail.ErrorMessage = Resources.LocalizationResources.ORG_CUST_revPerEmail;
            //revComWebsite.ErrorMessage = Resources.LocalizationResources.ORG_CUST_revComWebsite;

            //revPerWebSite.ErrorMessage = Resources.LocalizationResources.ORG_CUST_revPerWebSite;
            //rfvGender.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvGender;
            //rfvDOB.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvDOB;
            //rfvQualification.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvQualification;
            //rfvtxtProfession.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvtxtProfession;
            //rfvHouseType.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvHouseType;
            //rfvOwn.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvOwn;
            //rfvtotalnetworth.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvtotalnetworth;
            //rfvPublic.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvPublic;
            //rfvDirectors.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvDirectors;
            //rfvBusinessProfile.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvBusinessProfile;
            //rfvGeographical.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvGeographical;
            //rfvnobranch.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvnobranch;
            //rfvCEOName.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvCEOName;
            //rfvCEOAge.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvCEOAge;
            //rfvCEOexperience.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvCEOexperience;
            //rfvResidentialAddress.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvResidentialAddress;

            rfvAccountType.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvAccountType;
            rfvAccountNumber.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvAccountNumber;
            txtBankName.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvBankName;
            rfvBankBranch.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvBankBranch;
            //rfvMICRCode.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvMICRCode;
            //rfvBankAddress.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rfvBankAddress;

            rvfCustomerName.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rvfCustomerName;

            rvfCustomerName.ErrorMessage = Resources.LocalizationResources.ORG_CUST_rvfCustomerName;


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Initialise the Controls");
        }
    }

    /// <summary>
    /// Method for Loading the Constitutional Documents
    /// </summary>
    /// <param name="CustomerID"></param>
    private void FunPriLoadCustomerConstitutionDocs(int CustomerID, int IsLoadFromProspect, int IsLoadFromApplicationGuarantor, string strDMSProposalNo)
    {
        DataTable ObjCustomerDetails = new DataTable();
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();



            if (IsLoadFromProspect == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "2");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", strDMSProposalNo);
                ObjCustomerDetails = Utility.GetDefaultData("S3G_OR_GET_DMS_PROSDTLS", strProParm);
                gvConstitutionalDocuments.DataSource = ObjCustomerDetails;
                gvConstitutionalDocuments.DataBind();
            }
            else if (IsLoadFromApplicationGuarantor == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "2");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", CustomerID.ToString());
                ObjCustomerDetails = Utility.GetDefaultData("S3G_OR_GET_DMS_GUARDTLS", strProParm);
                gvConstitutionalDocuments.DataSource = ObjCustomerDetails;
                gvConstitutionalDocuments.DataBind();
            }
            else
            {

                if (IsLoadFromProspect == 1)
                    ObjStatus.Option = 1004;
                else
                    ObjStatus.Option = 169;
                ObjStatus.Param1 = CustomerID.ToString();
                gvConstitutionalDocuments.DataSource = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
                gvConstitutionalDocuments.DataBind();
            }


            //Added By Thangam M on 12/Mar/2012 to fix bug id - 5451
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Clear", "javascript:fnClearAsyncUploader('" + gvConstitutionalDocuments.Rows.Count.ToString() + "');", true);

            ViewState["ConstitutionDocument"] = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            ObjStatus.Option = 787;
            ObjStatus.Param1 = intCompanyId.ToString();
            DataTable dtConsDocPath = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            if (dtConsDocPath == null || (dtConsDocPath != null && dtConsDocPath.Rows.Count == 0))
            {
                Utility.FunShowAlertMsg(this, "Define the spooling path in Document Path Setup for Consitution Document");
                return;
            }
            ViewState["ConsDocPath"] = dtConsDocPath.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Due to Data Problem, Unable to Load the Constitution Documents");
        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }
    protected void hlnkView_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriShowPRDD(sender);
        }
        catch (Exception ex)
        {
            cvCustomerMaster.ErrorMessage = ex.Message;
            cvCustomerMaster.IsValid = false;
        }
    }
    private void FunPriShowPRDD(object sender)
    {
        try
        {
            string strFileName = string.Empty;
            string strFieldAtt = ((LinkButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("gvConstitutionalDocuments", strFieldAtt);
            //Label lblPath = gvConstitutionalDocuments.Rows[gRowIndex].FindControl("myThrobber") as Label;
            Label lblActualPath = gvConstitutionalDocuments.Rows[gRowIndex].FindControl("lblActualDocument_Path") as Label;
            if (lblActualPath.Text.Trim() != string.Empty)
            {
                strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
                string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
            }
            else
            {
                Utility.FunShowAlertMsg(this, "No record found");
                return;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Due to Data Problem, Unable to View the Document");
        }
    }
    private void FunPriLoadCustomerBankDetails(int CustomerID, int IsLoadFromProspect, int IsLoadFromApplicationGuarantor, string strDMSProposalNo)
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            DataTable dt = new DataTable();
            if (IsLoadFromProspect == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "4");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", strDMSProposalNo);
                dt = Utility.GetDefaultData("S3G_OR_GET_DMS_PROSDTLS", strProParm);
                ViewState["DetailsTable"] = dt;
                grvBankDetails.DataSource = (DataTable)ViewState["DetailsTable"];
                grvBankDetails.DataBind();
                FunPriHideBankColumns();
            }

            else if (IsLoadFromApplicationGuarantor == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "4");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", intCustomerId.ToString());
                dt = Utility.GetDefaultData("S3G_OR_GET_DMS_GUARDTLS", strProParm);
                ViewState["DetailsTable"] = dt;
                grvBankDetails.DataSource = (DataTable)ViewState["DetailsTable"];
                grvBankDetails.DataBind();
                FunPriHideBankColumns();
            }
            else
            {

                S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
                ObjStatus.Option = 200;
                ObjStatus.Param1 = CustomerID.ToString();
                ViewState["DetailsTable"] = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
                if (ViewState["DetailsTable"] != null)
                {
                    grvBankDetails.DataSource = (DataTable)ViewState["DetailsTable"];
                    grvBankDetails.DataBind();
                    FunPriHideBankColumns();

                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Due to Data Problem, Unable to Load Bank Details");
        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }

    private void FunPriLoadCustSubLimit(int CustomerID)
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            DataTable dt = (DataTable)ViewState["CUST_SUBLIMIT"];
            DataTable dt1;
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            ObjStatus.Option = 2000;
            ObjStatus.Param1 = CustomerID.ToString();

            dt1 = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            if (dt1.Rows.Count > 0)
            {
                dt.Merge(dt1, true, MissingSchemaAction.Ignore);

                ViewState["CUST_SUBLIMIT"] = dt;
                if (ViewState["CUST_SUBLIMIT"] != null)
                {
                    grvCustSubLimit.DataSource = (DataTable)ViewState["CUST_SUBLIMIT"];
                    grvCustSubLimit.DataBind();
                    grvCustSubLimit.Rows[0].Visible = false;

                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }

    private void FunPriHideBankColumns()
    {
        try
        {
            //grvBankDetails.Columns[0].Visible = false;
            //grvBankDetails.Columns[1].Visible = false;
            //grvBankDetails.Columns[2].Visible = false;
            //grvBankDetails.Columns[4].Visible = false;
            //grvBankDetails.Columns[6].Visible = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// Method for Disable the Text in Constitutional Document Details tab
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    private bool FunPriDisableValueField(string str)
    {
        string[] strCheck = new string[2];
        bool blnIsResult = true;
        try
        {
            strCheck = str.Split('-');
            if (strCheck.Length > 0)
            {
                if (Convert.ToString(strCheck[0]) != "CID")
                    blnIsResult = false;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
        return blnIsResult;

    }

    /// <summary>
    /// Method for assign the Text into Coombobox
    /// </summary>
    /// <param name="strControlText"></param>
    /// <param name="cmbControl"></param>
    private void FunPriSetDropDownText(string strControlText, AjaxControlToolkit.ComboBox cmbControl)
    {
        try
        {
            for (int i = 0; i < cmbControl.Items.Count; i++)
            {
                if (cmbControl.Items[i].Text == strControlText)
                    cmbControl.SelectedItem.Text = strControlText;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
    }

    /// <summary>
    /// Method for Loading the Customer Details
    /// </summary>
    /// <param name="CustomerID"></param>
    private void FunPriLoadCustomerDetails(int CustomerID, int IsLoadFromProspect, int IsFromApplicationGuarantor, string strProposalNo)
    {
        DataTable ObjCustomerDetails = new DataTable();
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();


            if (IsLoadFromProspect == 1)
            {
                ViewState["strProposalNo"] = strProposalNo;
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "1");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", strProposalNo);
                ObjCustomerDetails = Utility.GetDefaultData("S3G_OR_GET_DMS_PROSDTLS", strProParm);
            }

            else if (IsFromApplicationGuarantor == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "1");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", CustomerID.ToString());
                ObjCustomerDetails = Utility.GetDefaultData("S3G_OR_GET_DMS_GUARDTLS", strProParm);
            }
            else
            {
                if (IsLoadFromProspect == 1)
                    ObjStatus.Option = 1003;
                else
                    ObjStatus.Option = 10;
                ObjStatus.Param1 = CustomerID.ToString();

                ObjCustomerDetails = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            }


            if (ObjCustomerDetails.Rows.Count > 0)
            {
                txtCustomercode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Code"]);
                ListItem lst;
                if (strMode == "Q")
                {
                    lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Type"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Type_ID"]));
                    ddlCustomerType.Items.Add(lst);
                    cmbIndustryCode.Enabled = false;
                    cmbsub.Enabled = false;
                }
                ddlCustomerType.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Type_ID"]);
                if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
                {
                    //txt_CUSTOMER_NAME.ReadOnly = false;
                    txt_CUSTOMER_NAME.Enabled = true;
                    rvfCustomerName.Enabled = true;
                    pnlCustdtls.Visible = dvCustdtls.Visible = false;
                    FunPubBindSharsGrid();
                    IndReqFieldValidate(false);
                    NonIndReqFieldValidate(true);
                    funPriLoadNonIndividualLoad();
                    rfvTitle.Enabled = false;
                    rfvDOB.Enabled = false;
                    rbnSMEIndicator.SelectedValue = "2";
                    rbnSMEIndicator.Enabled = true;
                    txtGroupCode.Enabled = true;
                    EnableSeniorIndicator(false);
                }
                else
                {
                    //txt_CUSTOMER_NAME.ReadOnly = true;
                    txt_CUSTOMER_NAME.Enabled = false;
                    rvfCustomerName.Enabled = false;
                    pnlCustdtls.Visible = dvCustdtls.Visible = true;
                    IndReqFieldValidate(true);
                    NonIndReqFieldValidate(false);
                    funPriLoadIndividualLoad();
                    rfvTitle.Enabled = true;
                    rfvDOB.Enabled = true;
                    rbnSMEIndicator.SelectedValue = "2";
                    rbnSMEIndicator.Enabled = false;
                    txtGroupCode.Enabled = true;
                    EnableSeniorIndicator(true);
                    ComplianceAge();
                }
                Indnonind();
                if (ddlCustomerType.SelectedItem.Text.ToUpper() == "INDIVIDUAL")
                {
                    PriFunToggleCustomerTypeControls(false);
                }
                else
                {
                    PriFunToggleCustomerTypeControls(true);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["GroupCode"]) != string.Empty)
                {
                    //dvCustomerGroup.Visible = true;
                    //txtGroupCode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Groupname"]);
                    txtGroupCode.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Group_Id"]);
                    txtGroupCode.SelectedText = Convert.ToString(ObjCustomerDetails.Rows[0]["Groupname"]);
                }
                //if (!string.IsNullOrEmpty(txtGroupName.Text))
                //{
                //    txtGroupName.ReadOnly = true;
                //}
                //  FunPriSetDropDownText(Convert.ToString(ObjCustomerDetails.Rows[0]["IndustryCode"]), cmbIndustryCode); commented by Prakash 
                FunGetIndustryCode();

                //cmbIndustryCode.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["IndustryCode"]);
                //                txtIndustryName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["IndustryName"]);
                //cmbIndustryCode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["IndustryName"]);
                //cmbsub.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Sub_Industryname"]);
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Family_Name"]) != string.Empty)
                {
                    txtFamilyName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Family_Name"]);
                }
                txtNotes.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Notes"]);
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["CreditType"]) != string.Empty)
                {
                    rbnCreditType.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["CreditType"]);
                }
                chkBadTrack.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["IS_BlocListed"]);
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_BRANCH"]) != string.Empty)
                {
                    ddlBranch.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_BRANCH"]);
                }

                if (Convert.ToString(ObjCustomerDetails.Rows[0]["TAX_APPLICABLE"]) != string.Empty)
                {
                    ddlTAXApplicable.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["TAX_APPLICABLE"]);
                }

                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Cust_VAT_TIN"]) != string.Empty)
                {
                    txtVATIN.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Cust_VAT_TIN"]);
                }
                //if (!string.IsNullOrEmpty(txtIndustryName.Text))
                //{
                //    txtIndustryName.Enabled = false;
                //}

                if (strMode == "Q")
                {
                    lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Constitution_Name"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Constitution_ID"]));
                    ddlConstitutionName.Items.Add(lst);
                }
                ConstitutionBind();
               // FunPubBindTAXApp();
                ddlConstitutionName.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Constitution_ID"]);
                // Constitutio nName Special Rights Check
                if (strMode == "M")
                {
                    if (UserFunctionCheck("CCONSTI_UP"))
                    {
                        ddlConstitutionName.Enabled = true;
                    }
                    else
                    {
                        ddlConstitutionName.ClearDropDownList();
                    }
                }
                if (strMode == "M")
                {
                    CustomerTypeCheck();
                }
                if (strMode == "Q")
                {
                    lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Title"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Title_ID"]));
                    ddlTitle.Items.Add(lst);
                }
                ddlTitle.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Title_ID"]);
                //added Relation Type
                chkCustomer.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["Customer"]);
                chkGuarantor1.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["Guarantor1"]);
                //chkGuarantor2.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["Guarantor2"]);
                chkCoApplicant.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["Co_Applicant"]);
                chkGroupDet.Checked = Convert.ToBoolean(ObjCustomerDetails.Rows[0]["CUSTOMER_GROUP"]);
                if (chkCustomer.Checked)
                    chkCustomer.Enabled = false;
                if (chkGuarantor1.Checked)
                    chkGuarantor1.Enabled = false;
                //if (chkGuarantor2.Checked)
                //    chkGuarantor2.Enabled = false;
                if (chkCoApplicant.Checked)
                    chkCoApplicant.Enabled = false;
                if (chkGroupDet.Checked)
                {
                    chkGroupDet.Enabled = false;
                    txtGroupCode.Enabled = false;
                }
                //end
                txt_CUSTOMER_NAME.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Name"]);
                ListItem ListPosting = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Posting_Code"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Posting_Group_Code_ID"]), true);
                ListPosting.Selected = false;
                if (ddlPostingGroup.Items.FindByValue(Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Posting_Group_Code_ID"])) == null)
                {
                    if (ddlPostingGroup.Items.FindByText(Convert.ToString(ObjCustomerDetails.Rows[0]["Posting_Code"])) != null)
                    {
                        ddlPostingGroup.Items.Remove(ddlPostingGroup.Items.FindByText(Convert.ToString(ObjCustomerDetails.Rows[0]["Posting_Code"])));
                    }
                    ddlPostingGroup.Items.Add(ListPosting);
                }
                ddlPostingGroup.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Posting_Group_Code_ID"]);
                //ucBasicDetAddressSetup.BindAddressSetupDetails(1);
                //ucOtherDetAddressSetup.BindAddressSetupDetails(2);
                //if (ObjCustomerDetails.Tables[0].Rows.Count > 0)
                //{
                //    ucBasicDetAddressSetup.PostalCode_Text = ds.Tables[0].Rows[0]["Postal_Code_Text"].ToString();
                //    ucBasicDetAddressSetup.PostalCode_Value = ds.Tables[0].Rows[0]["Postal_Code_Value"].ToString();
                //    ucBasicDetAddressSetup.PostBoxNo = ds.Tables[0].Rows[0]["Post_Box_No"].ToString();
                //    ucBasicDetAddressSetup.WayNo = ds.Tables[0].Rows[0]["Way_No"].ToString();
                //    ucBasicDetAddressSetup.HouseNo = ds.Tables[0].Rows[0]["House_No"].ToString();
                //    ucBasicDetAddressSetup.BlockNo = ds.Tables[0].Rows[0]["Block_No"].ToString();
                //    ucBasicDetAddressSetup.FlatNo = ds.Tables[0].Rows[0]["Flat_No"].ToString();
                //    ucBasicDetAddressSetup.LandMark = ds.Tables[0].Rows[0]["LandMark"].ToString();
                //    ucBasicDetAddressSetup.AreaSheik_Text = ds.Tables[0].Rows[0]["Area_Sheik_Text"].ToString();
                //    ucBasicDetAddressSetup.AreaSheik_Value = ds.Tables[0].Rows[0]["Area_Sheik_Value"].ToString();
                //    ucBasicDetAddressSetup.ResidencePhoneNo = ds.Tables[0].Rows[0]["Residence_Phone_No"].ToString();
                //    ucBasicDetAddressSetup.ResidenceFaxNo = ds.Tables[0].Rows[0]["Residence_Fax_No"].ToString();
                //    ucBasicDetAddressSetup.MobilePhoneNo = ds.Tables[0].Rows[0]["Mobile_Phone_No"].ToString();
                //    ucBasicDetAddressSetup.ContactName = ds.Tables[0].Rows[0]["Contact_Name"].ToString();
                //    ucBasicDetAddressSetup.ContactNo = ds.Tables[0].Rows[0]["Contact_No"].ToString();
                //    ucBasicDetAddressSetup.OfficePhoneNo = ds.Tables[0].Rows[0]["Office_Phone_No"].ToString();
                //    ucBasicDetAddressSetup.OfficeFaxNo = ds.Tables[0].Rows[0]["Office_Fax_No"].ToString();
                //    ucBasicDetAddressSetup.CustomerEmail = ds.Tables[0].Rows[0]["Cust_Email"].ToString();
                //}
                //if (ds.Tables[1].Rows.Count > 0)
                //{
                //    ucOtherDetAddressSetup.PostalCode_Text = null;
                //    ucOtherDetAddressSetup.PostalCode_Value = null;
                //    ucOtherDetAddressSetup.AreaSheik_Text = null;
                //    ucOtherDetAddressSetup.AreaSheik_Value = null;
                //    ucOtherDetAddressSetup.PostalCode_Text = ds.Tables[1].Rows[0]["Postal_Code_Text"].ToString();
                //    ucOtherDetAddressSetup.PostalCode_Value = ds.Tables[1].Rows[0]["Postal_Code_Value"].ToString();
                //    ucOtherDetAddressSetup.PostBoxNo = ds.Tables[1].Rows[0]["Post_Box_No"].ToString();
                //    ucOtherDetAddressSetup.WayNo = ds.Tables[1].Rows[0]["Way_No"].ToString();
                //    ucOtherDetAddressSetup.HouseNo = ds.Tables[1].Rows[0]["House_No"].ToString();
                //    ucOtherDetAddressSetup.BlockNo = ds.Tables[1].Rows[0]["Block_No"].ToString();
                //    ucOtherDetAddressSetup.FlatNo = ds.Tables[1].Rows[0]["Flat_No"].ToString();
                //    ucOtherDetAddressSetup.LandMark = ds.Tables[1].Rows[0]["LandMark"].ToString();
                //    ucOtherDetAddressSetup.AreaSheik_Text = ds.Tables[1].Rows[0]["Area_Sheik_Text"].ToString();
                //    ucOtherDetAddressSetup.AreaSheik_Value = ds.Tables[1].Rows[0]["Area_Sheik_Value"].ToString();
                //    ucOtherDetAddressSetup.ResidencePhoneNo = ds.Tables[1].Rows[0]["Residence_Phone_No"].ToString();
                //    ucOtherDetAddressSetup.ResidenceFaxNo = ds.Tables[1].Rows[0]["Residence_Fax_No"].ToString();
                //    ucOtherDetAddressSetup.MobilePhoneNo = ds.Tables[1].Rows[0]["Mobile_Phone_No"].ToString();
                //    ucOtherDetAddressSetup.ContactName = ds.Tables[1].Rows[0]["Contact_Name"].ToString();
                //    ucOtherDetAddressSetup.ContactNo = ds.Tables[1].Rows[0]["Contact_No"].ToString();
                //    ucOtherDetAddressSetup.OfficePhoneNo = ds.Tables[1].Rows[0]["Office_Phone_No"].ToString();
                //    ucOtherDetAddressSetup.OfficeFaxNo = ds.Tables[1].Rows[0]["Office_Fax_No"].ToString();
                //    ucOtherDetAddressSetup.CustomerEmail = ds.Tables[1].Rows[0]["Cust_Email"].ToString();
                //}

                //txtComAddress1.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Address1"]);
                //txtCOmAddress2.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Address2"]);
                ////<<Performance>>
                ////txtComCity.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_City"]);
                //txtComCity.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_City"]);

                //if (strMode == "Q" || strMode == "M")
                //{
                //    txtComState.Items.Add(Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_State"]));
                //    txtPerState.Items.Add(Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_State"]));
                //    txtComCountry.Items.Add(Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Country"]));
                //    txtPerCountry.Items.Add(Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Country"]));
                //}
                //txtComState.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_State"]);
                //txtComCountry.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Country"]);
                //txtComPincode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_PINCode"]);
                //txtComMobile.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Mobile"]);
                //txtComTelephone.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Telephone"]);
                //txtComEmail.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Email"]);
                //txtComWebsite.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Comm_Website"]);
                //txtPerAddress1.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Address1"]);
                //txtPerAddress2.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Address2"]);
                ////<<Performance>>
                ////txtPerCity.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_City"]);
                //txtPerCity.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_City"]);
                //txtPerState.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_State"]);
                //txtPerCountry.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Country"]);
                //txtPerPincode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_PINCode"]);
                //txtPerMobile.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Mobile"]);
                //txtPerTelephone.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Telephone"]);
                //txtPerEmail.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Email"]);
                //txtPerWebSite.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Perm_Website"]);
                cmbIndustryCode.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Industry_ID"]);
                FunGetSubIndustryCode();
                cmbsub.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Sub_Industry_ID"]);
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Nationality"]) != string.Empty)
                {
                    ddlNationality.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Nationality"]);
                    ddlNationality.SelectedText = Convert.ToString(ObjCustomerDetails.Rows[0]["NATIONALITY_NAME"]);
                }
                NationalityBind();
                // Nationality Special Rights Check
                if (strMode == "M")
                {
                    if (UserFunctionCheck("CNATION_UP"))
                    {
                        ddlNationality.Enabled = true;
                    }
                    else
                    {
                        ddlNationality.Enabled = false;
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_NUMBER"]) != string.Empty)
                {
                    txtIdentityColumn.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_NUMBER"]);
                    if (strMode == "M")
                    {
                        if (UserFunctionCheck("CNIRICR_UP"))
                        {
                            txtIdentityColumn.Enabled = true;
                        }
                        else
                        {
                            txtIdentityColumn.ReadOnly = true;
                            RevIdentityColumn.Enabled = RevCRNUMBERVal.Enabled = false;
                        }
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_ISSUE_DATE"]) != string.Empty)
                {
                    txtIdentityIssueDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_ISSUE_DATE"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_EXP_DATE"]) != string.Empty)
                {
                    txtIdentityExpiredate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["NID_CR_RID_EXP_DATE"]);
                }
                if (ddlCustomerType.SelectedItem.Text.ToUpper() == "INDIVIDUAL")
                {
                    #region Individual Type
                    if (ObjCustomerDetails.Rows[0]["Gender"] == DBNull.Value)
                    {
                        ddlGender.SelectedIndex = 0;
                    }
                    else
                    {
                        ddlGender.SelectedValue = Convert.ToInt16(ObjCustomerDetails.Rows[0]["Gender"]).ToString();
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["DateofBirth"]) != "") txtDOB.Text = DateTime.Parse(Convert.ToString(ObjCustomerDetails.Rows[0]["DateofBirth"]), CultureInfo.CurrentCulture.DateTimeFormat).ToString(ObjS3GSession.ProDateFormatRW);

                    //Check if not exist
                    if (txtDOB.Text == "1/1/1900")
                    {
                        txtDOB.Text = string.Empty;
                    }
                    if (!string.IsNullOrEmpty(txtDOB.Text))
                    {
                        AgeCalculation(txtDOB.Text.Trim());
                        //int intDOBYear = Utility.StringToDate(txtDOB.Text).Year;
                        //txtAge.Text = ((DateTime.Now.Year - intDOBYear)).ToString();//+ 1
                        //if (strMode == "M")
                        //{
                        //    if (Convert.ToInt32(txtAge.Text) >= 60)
                        //    {
                        //        rbnSenAppli.SelectedValue = "1";
                        //        rbnSenAppli.Enabled = true;
                        //    }
                        //    else
                        //    {
                        //        rbnSenAppli.SelectedValue = "2";
                        //        rbnSenAppli.Enabled = false;
                        //    }
                        //    if (rbnSenAppli.SelectedValue == "1")//Yes
                        //    {
                        //        EnableSenMemberIndicator(true);
                        //    }
                        //    else
                        //    {
                        //        EnableSenMemberIndicator(false);
                        //    }
                        //}
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["IS_RESEDENCE_SINCE"]) != string.Empty)
                        txtResidenceOmanSince.Text = Convert.ToString((ObjCustomerDetails.Rows[0]["IS_RESEDENCE_SINCE"]));
                    if (ObjCustomerDetails.Rows[0]["Marital_Status_ID"] == DBNull.Value)
                    {
                        ddlMaritalStatus.SelectedIndex = -1;
                    }
                    else
                    {
                        if (strMode == "Q")
                        {
                            lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Marital_Status"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Marital_Status_ID"]));
                            ddlMaritalStatus.Items.Add(lst);
                        }
                        ddlMaritalStatus.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Marital_Status_ID"]);
                        ddlMaritalStatus_OnSelectedIndexChanged(null, null);
                    }
                    txtQualification.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Qualification"]);
                    txtProfession.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Profession"]);
                    txtSpouseName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Spouse_Name"]);
                    txtChildren.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Children"]) == "0") ? "" : Convert.ToString(ObjCustomerDetails.Rows[0]["Children"]);
                    txtTotalDependents.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Total_Dependents"]) == "0") ? "" : Convert.ToString(ObjCustomerDetails.Rows[0]["Total_Dependents"]);
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Wedding_Anniversary_Date"]) != "") txtWeddingdate.Text = DateTime.Parse(Convert.ToString(ObjCustomerDetails.Rows[0]["Wedding_Anniversary_Date"]), CultureInfo.CurrentCulture.DateTimeFormat).ToString(ObjS3GSession.ProDateFormatRW);
                    if (txtWeddingdate.Text == "1/1/1900")
                    {
                        txtWeddingdate.Text = string.Empty;
                    }
                    if (ObjCustomerDetails.Rows[0]["House_Flat_ID"] == DBNull.Value)
                    {
                        ddlHouseType.SelectedIndex = -1;
                    }
                    else
                    {
                        if (strMode == "Q")
                        {
                            lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["House_Flat"]), Convert.ToString(ObjCustomerDetails.Rows[0]["House_Flat_ID"]));
                            ddlHouseType.Items.Add(lst);
                        }
                        ddlHouseType.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["House_Flat_ID"]);
                    }
                    //if (ObjCustomerDetails.Rows[0]["Is_Own"] == DBNull.Value)
                    //{
                    //    ddlOwn.SelectedIndex = -1;
                    //}
                    //else
                    //{
                    //    ddlOwn.SelectedValue = (Convert.ToString(ObjCustomerDetails.Rows[0]["Is_Own"]).ToLower() == "true") ? "1" : "0";
                    //}
                    ////Added by ganapathy to fix the bugID 6343
                    //if (ddlOwn.SelectedValue == "0")
                    //{
                    //    txtCurrentMarketValue.Enabled = false;
                    //    txtRemainingLoanValue.Enabled = false;
                    //    txtTotNetWorth.Enabled = false;
                    //}
                    //else
                    //{
                    //    txtCurrentMarketValue.Enabled = true;
                    //    txtRemainingLoanValue.Enabled = true;
                    //    txtTotNetWorth.Enabled = true;
                    //}
                    //End here
                    //Commented by Thangam M on 09/Mar/2012 to fix bug id 5445
                    //txtCurrentMarketValue.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Current_Market_Value"]) == "0") ? "" : Convert.ToString(ObjCustomerDetails.Rows[0]["Current_Market_Value"]);
                    //End here
                    //Code Modified By Ganapathy for fixing the bug 6343
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Is_Own"]) != string.Empty)
                    {
                        rbnOwn.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Is_Own"]);
                        if (rbnOwn.SelectedValue == "1")//Yes
                        {
                            txtCurrentMarketValue.Enabled = txtRemainingLoanValue.Enabled = txtTotNetWorth.Enabled = true;
                            rfvCurrentMarketValue.Enabled = true;
                        }
                        else
                        {
                            txtCurrentMarketValue.Enabled = txtRemainingLoanValue.Enabled = txtTotNetWorth.Enabled = false;
                            rfvCurrentMarketValue.Enabled = false;
                        }
                    }
                    txtCurrentMarketValue.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Current_Market_Value"]);
                    txtRemainingLoanValue.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Remaining_Loan_Value"]);
                    txtTotNetWorth.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Total_Net_Morth"]);
                    //End here
                    ucEntityNamesSetup.BindNameSetupDetails();
                    ucEntityNamesSetup.FirstName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME1"]);
                    ucEntityNamesSetup.SecondName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME2"]);
                    ucEntityNamesSetup.ThirdName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME3"]);
                    ucEntityNamesSetup.FourthName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME4"]);
                    ucEntityNamesSetup.FifthName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME5"]);
                    ucEntityNamesSetup.SixthName = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME6"]);
                    //txtFirstName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME1"]);
                    //txtSecondName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME2"]);
                    //txtThirdName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME3"]);
                    //txtFourthName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME4"]);
                    //txtFifthName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME5"]);
                    //txtSixthName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CUSTOMER_NAME6"]);
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Visa_Number"]) != string.Empty)
                    {
                        txtVisaNo.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Visa_Number"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_No"]) != string.Empty)
                    {
                        txtLabourCardNo.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_No"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_Issue_Date"]) != string.Empty)
                    {
                        txtLabourCardDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_Issue_Date"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_Exp_Date"]) != string.Empty)
                    {
                        txtLaborExpDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Labour_Card_Exp_Date"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Occupation"]) != string.Empty)
                    {
                        cmbOccupation.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Occupation"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_Indi"]) != string.Empty)
                    {
                        rbnMFCEmpIndi.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_Indi"]);
                        if (rbnMFCEmpIndi.SelectedValue == "1")
                        {
                            rbnMFCEmpIndi.Enabled = false;
                        }
                        else
                        {
                            rbnMFCEmpIndi.Enabled = true;
                        }
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_ID"]) != string.Empty && Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_ID"]) != "0")
                    {
                        DisableEmployeedtl(false);
                        txtMfcCode.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_ID"]);
                        txtMfcCode.SelectedText = Convert.ToString(ObjCustomerDetails.Rows[0]["MFC_Employee_Name"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Employer_Name"]) != string.Empty)
                    {
                        cmbEmployerName.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Employer_Name"]);
                    }
                    else
                    {
                        if (Convert.ToString(ObjCustomerDetails.Rows[0]["OTHER_EMPLOYER"]) != string.Empty)
                        {
                            cmbEmployerName.SelectedItem.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["OTHER_EMPLOYER"]);
                        }
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Employer_Eco_Act_Code"]) != string.Empty)
                    {
                        cmEmpEcoCode.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Employer_Eco_Act_Code"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Employee_Code"]) != string.Empty)
                    {
                        txtEmployeeCode.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Employee_Code"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Department_Name"]) != string.Empty)
                    {
                        txtDepartmentName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Department_Name"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Designation"]) != string.Empty)
                    {
                        txtDesignation.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Designation"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Place_of_Work"]) != string.Empty)
                    {
                        txtPlaceofWork.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Place_of_Work"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Date_Of_Join"]) != string.Empty)
                    {
                        txtDateOfJoin.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Date_Of_Join"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Monthily_Income"]) != string.Empty)
                    {
                        txtMonBusIncome.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Monthily_Income"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Number"]) != string.Empty)
                    {
                        txtPassportNumber.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Number"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Issue_Date"]) != string.Empty)
                    {
                        txtPassportIssueDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Issue_Date"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Exp_Date"]) != string.Empty)
                    {
                        txtPassportExpDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Passport_Exp_Date"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["DRIVING_LIC_NUMBER"]) != string.Empty)
                    {
                        txtDrivingNumber.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["DRIVING_LIC_NUMBER"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["BUSINESS_FIRM_NAME"]) != string.Empty)
                    {
                        txtBussinessFirm.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["BUSINESS_FIRM_NAME"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["EMPLOYER_CR_NUMBER"]) != string.Empty)
                    {
                        txtCRNumber.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["EMPLOYER_CR_NUMBER"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["NRID_NUMBER"]) != string.Empty)
                    {
                        txtNRID.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["NRID_NUMBER"]);
                    }
                    if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BUSINESS")
                    {
                        rbnMFCEmpIndi.Enabled = false;
                        txtMfcCode.Enabled = false;
                        rfvrbnMFCEmpIndi.Enabled = false;
                        EnabledEmployedInd(false);
                        EnabledEmployeedBus(true);
                        EnabledEmployeedBusRFV(true);
                        EnabledEmployedIndRFV(false);
                    }
                    else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED")
                    {
                        rbnMFCEmpIndi.Enabled = true;
                        rfvrbnMFCEmpIndi.Enabled = true;
                        txtMfcCode.Enabled = false;
                        EnabledEmployedInd(true);
                        EnabledEmployedIndRFV(true);
                        EnabledEmployeedBus(false);
                        EnabledEmployeedBusRFV(false);
                    }
                    else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                    {
                        rbnMFCEmpIndi.Enabled = true;
                        rfvrbnMFCEmpIndi.Enabled = true;
                        txtMfcCode.Enabled = false;
                        EnabledEmployedInd(true);
                        EnabledEmployedIndRFV(true);
                        EnabledEmployeedBus(true);
                        EnabledEmployeedBusRFV(true);
                    }
                    else
                    {
                        txtMfcCode.IsMandatory = false;
                        rbnMFCEmpIndi.Enabled = false;
                        rfvrbnMFCEmpIndi.Enabled = false;
                        txtMfcCode.Enabled = false;
                        EnabledEmployedInd(false);
                        EnabledEmployedIndRFV(false);
                        EnabledEmployeedBus(false);
                        EnabledEmployeedBusRFV(false);
                        cmEmpEcoCode.Enabled = false;
                    }
                    if (rbnMFCEmpIndi.SelectedValue == "1")
                    {
                        EnabledEmployedIndRFV(false);
                        if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED")
                        {
                            txtMfcCode.IsMandatory = true;
                            txtMfcCode.Enabled = true;
                            EnabledEmployedInd(false);
                        }
                        else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                        {
                            txtMfcCode.IsMandatory = true;
                            txtMfcCode.Enabled = true;
                            EnabledEmployedInd(true);
                        }
                    }
                    else
                    {
                        txtMfcCode.Enabled = false;
                        txtMfcCode.IsMandatory = false;
                        EnabledEmployedIndRFV(false);
                        if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED" || cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                        {
                            EnabledEmployedInd(true);
                            EnabledEmployedIndRFV(true);
                        }
                        else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BUSINESS")
                        {
                            EnabledEmployedInd(false);
                        }
                        else
                        {
                            EnabledEmployedInd(false);
                        }
                    }
                    #endregion
                }
                else
                {
                    #region Non-Individual

                    if (strMode == "Q")
                    {
                        lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Public_Closely"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Public_Closely_ID"]));
                        cmbPublic.Items.Add(lst);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Public_Closely_ID"]) != "0")
                    {
                        cmbPublic.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Public_Closely_ID"]);
                    }
                    txtDirectors.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["No_Of_Directors"]) == "0") ? string.Empty : Convert.ToString(ObjCustomerDetails.Rows[0]["No_Of_Directors"]);
                    txtSE.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Listed_At_Stock_Exchange"]) == "0") ? string.Empty : Convert.ToString(ObjCustomerDetails.Rows[0]["Listed_At_Stock_Exchange"]);
                    txtPaidCapital.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Paidup_Capital"]) == "0") ? string.Empty : Convert.ToString(ObjCustomerDetails.Rows[0]["Paidup_Capital"]);
                    txtfacevalue.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Face_Value_of_Shares"]) == "0") ? string.Empty : Convert.ToString(ObjCustomerDetails.Rows[0]["Face_Value_of_Shares"]);
                    txtbookvalue.Text = (Convert.ToString(ObjCustomerDetails.Rows[0]["Book_Value_of_Shares"]) == "0") ? string.Empty : Convert.ToString(ObjCustomerDetails.Rows[0]["Book_Value_of_Shares"]);
                    txtBusinessProfile.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Business_Profile"]);
                    txtGeographical.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Geographical_Coverage"]);
                    txtnobranch.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["No_Of_Branches"]);
                    if (cmbPublic.SelectedItem.Text.Trim().ToUpper() == "PUBLIC" || cmbPublic.SelectedItem.Text.Trim().ToUpper() == "CLOSELY HELD")
                    {
                        EnabledCloselyRFV(true);
                    }
                    else
                    {
                        EnabledCloselyRFV(false);
                    }
                    if (strMode == "Q")
                    {
                        lst = new ListItem(Convert.ToString(ObjCustomerDetails.Rows[0]["Participation"]), Convert.ToString(ObjCustomerDetails.Rows[0]["Participation_ID"]));
                        ddlGovernment.Items.Add(lst);
                    }
                    ddlGovernment.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Participation_ID"]);
                    //Changed By Thangam M on 12/Mar/2012 to fix bug id - 5447
                    txtPercentageStake.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Percentage_Of_Stake"]);
                    txtJVPartnerName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["JV_Partner_Name"]);
                    txtJVPartnerStake.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["JV_Partner_Stake"]);
                    if (txtPercentageStake.Text.Trim() != string.Empty && txtJVPartnerStake.Text.Trim() != string.Empty)
                    {
                        txtNoOfEmployees.Text = Convert.ToString(Convert.ToInt32(txtPercentageStake.Text.Trim()) + Convert.ToInt32(txtJVPartnerStake.Text.Trim()));
                    }
                    else
                    {
                        if (txtPercentageStake.Text.Trim() != string.Empty)
                        {
                            txtNoOfEmployees.Text = txtPercentageStake.Text.Trim();
                        }
                        if (txtJVPartnerStake.Text.Trim() != string.Empty)
                        {
                            txtNoOfEmployees.Text = txtJVPartnerStake.Text.Trim();
                        }
                    }
                    txtCEOName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CEO_Name"]);
                    txtCEOAge.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CEO_Age"]);
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["ANNUAL_SALE"]) != string.Empty)
                    {
                        txtAnnualSales.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["ANNUAL_SALE"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["TOTAL_ASSET"]) != string.Empty)
                    {
                        txtTotalAssets.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["TOTAL_ASSET"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["KEY_DECI_MAKER"]) != string.Empty)
                    {
                        txtKeyDecisionMaker.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["KEY_DECI_MAKER"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["BUSINESS_ACTIVITY"]) != string.Empty)
                    {
                        txtBussinessActivity.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["BUSINESS_ACTIVITY"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["AUDITOR_NAME"]) != string.Empty)
                    {
                        txtAuditorName.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["AUDITOR_NAME"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["NON_MOCI"]) != string.Empty)
                    {
                        txtNonMoci.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["NON_MOCI"]);
                    }
                    txtCEOexperience.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["CEO_Experience_In_Years"]);
                    //txtResidentialAddress.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Residential_Address"]);
                    //Created By : Anbuvel.T,Date : 19-MAY-2018, Description : Customer Master Changes done                    

                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Financial_required"]) != string.Empty)
                    {
                        rbnFinancialRequired.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Financial_required"]);
                        rbnFinancialRequired_SelectedIndexChanged(null, null);
                        //if (rbnFinancialRequired.SelectedValue == "1")
                        //{
                        //    cmbFinancialReceived.Enabled = true;
                        //    rfvFinancialReceived.Enabled = true;
                        //}
                        //else
                        //{
                        //    cmbFinancialReceived.Enabled = false;
                        //    rfvFinancialReceived.Enabled = false;
                        //}
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["Financial_received"]) != string.Empty)
                    {
                        //funPriLoadNonIndividualLoad();
                        cmbFinancialReceived.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Financial_received"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["OCCI_Issue_Date"]) != string.Empty)
                    {
                        txtOCCIIssueDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["OCCI_Issue_Date"]);
                    }
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["OCCI_Exp_Date"]) != string.Empty)
                    {
                        txtOCCIExpiryDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["OCCI_Exp_Date"]);
                    }

                    //if (((DataTable)ViewState["ShareDetails"]).Rows.Count > 0)
                    //{
                    //    ObjCustomerMaster.XmlShareDetails = ((DataTable)ViewState["ShareDetails"]).FunPubFormXml();
                    //}
                    #endregion
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["VIP_Customer"]) != string.Empty)
                {
                    ddlVIP.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["VIP_Customer"]);
                }
                rbnSMEIndicator.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["SME_INDICATOR"]);
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["IS_SME_FORCED"]) != string.Empty)
                {
                    if (Convert.ToString(ObjCustomerDetails.Rows[0]["IS_SME_FORCED"]) == "0")
                    {
                        chkIS_SME_FORCED.Checked = false;
                    }
                    else
                    {
                        chkIS_SME_FORCED.Checked = true;
                    }
                }
                if (strMode == "M")
                {
                    if (rbnSMEIndicator.SelectedValue == "1")
                    {
                        rbnSMEIndicator.Enabled = false;
                    }
                    else
                    {
                        rbnSMEIndicator.Enabled = true;
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["SENI_MEM_PROFESSION"]) != string.Empty)
                {
                    cmbSenMemProfession.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["SENI_MEM_PROFESSION"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Applicable"]) != string.Empty)
                {
                    rbnFactoringApplicable.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Applicable"]);
                }
                if (strMode == "M")
                {
                    if (rbnFactoringApplicable.SelectedValue == "1")//Yes
                    {
                        EnableFactoring(true);
                    }
                    else
                    {
                        EnableFactoring(false);
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["LAND_COLLATERAL"]) != string.Empty)
                {
                    rbnLanCollateral.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["LAND_COLLATERAL"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Type"]) != string.Empty)
                {
                    cmbFactoringType.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Type"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Limit"]) != string.Empty)
                {
                    if (strMode == "M")
                    {
                        if (UserFunctionCheck("CFAC_LIMIT"))
                        {
                            txtFactoringLimit.Enabled = true;
                        }
                        else
                        {
                            txtFactoringLimit.Enabled = false;
                        }
                    }
                    txtFactoringLimit.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Fac_Limit"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Covenants_Applicable"]) != string.Empty)
                {
                    rbnCovenantApplicable.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Covenants_Applicable"]);
                    if (strMode == "M")
                    {
                        if (rbnCovenantApplicable.SelectedValue == "1")//Yes
                        {
                            txtCovenantClause.Enabled = true;
                        }
                        else
                        {
                            txtCovenantClause.Enabled = false;
                        }
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Covenants_Clause"]) != string.Empty)
                {
                    txtCovenantClause.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Covenants_Clause"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Assignment_Collection"]) != string.Empty)
                {
                    rbnAssignmentCollection.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Assignment_Collection"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Fact_Limit_Exp_date"]) != string.Empty)
                {
                    txtFacLimitExp.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Fact_Limit_Exp_date"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Industry"]) != string.Empty)
                {
                    cmbIndustryType.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Customer_Industry"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Applicable"]) != string.Empty)
                {
                    rbnSenAppli.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Applicable"]);
                    if (strMode == "M")
                    {
                        if (rbnSenAppli.SelectedValue == "1")
                        {
                            EnableSenMemberIndicator(true);
                        }
                        else
                        {
                            EnableSenMemberIndicator(false);
                        }
                    }
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Status"]) != string.Empty)
                {
                    rbnSenMemStatus.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Status"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Rela_Indi"]) != string.Empty)
                {
                    rbnSenMemRelInd.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Seni_Mem_Rela_Indi"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Max_Lend_Amount"]) != string.Empty)
                {
                    //if (strMode == "M")
                    //{
                    //    if (UserFunctionCheck("CMAX_LIMIT"))
                    //    {
                    //        txtMaxLenLimit.Enabled = true;
                    //    }
                    //    else
                    //    {
                    //        txtMaxLenLimit.Enabled = false;
                    //    }
                    //}
                    txtMaxLenLimit.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Max_Lend_Amount"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Related_Parti_Indi"]) != string.Empty)
                {
                    rbnRelaPartyind.SelectedValue = Convert.ToString(ObjCustomerDetails.Rows[0]["Related_Parti_Indi"]);
                }
                if (Convert.ToString(ObjCustomerDetails.Rows[0]["Max_Lend_Limit_Exp"]) != string.Empty)
                {
                    txtMaxLenLimiExpDate.Text = Convert.ToString(ObjCustomerDetails.Rows[0]["Max_Lend_Limit_Exp"]);
                }
                if (rbnCovenantApplicable.SelectedValue == "1")//Yes
                {
                    txtCovenantClause.Enabled = true;
                }
                else
                {
                    txtCovenantClause.Enabled = false;
                }
                AdditionalInforFetch(CustomerID);
                FunPriLoadCustomerBankDetails(CustomerID, IsLoadFromProspect, IsFromApplicationGuarantor, strProposalNo);
                FunPriLoadCustSubLimit(CustomerID);
                FunPriLoadCustomerConstitutionDocs(CustomerID, IsLoadFromProspect, IsFromApplicationGuarantor, strProposalNo);
                FunPriLoadCustomerTrackDetails(CustomerID);
                FunPriLoadAddressDetails(CustomerID, IsLoadFromProspect, IsFromApplicationGuarantor, strProposalNo);
                FunPriLoadShareDetails(CustomerID);
                //FunPriToggleCustomerTypeControls();
                FunProClearUploader();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            objCustomerMasterClient.Close();
        }
    }

    #region Alert Tab

    private void FunPriBindCustomerTrackDLL()
    {
        try
        {
            Dictionary<string, string> ProcParam = new Dictionary<string, string>();
            ProcParam.Add("@CompanyId", intCompanyId.ToString());
            ProcParam.Add("@CustomerId", intCustomerId.ToString());
            ProcParam.Add("@UserId", intUserId.ToString());
            DataSet dsCustomerTrackDDL = Utility.GetDataset("S3G_ORG_LOADCUSTOMERTRACKDDL", ProcParam);
            ViewState["TrackLOB"] = dsCustomerTrackDDL.Tables[0];
            ViewState["TrackAccountNo"] = dsCustomerTrackDDL.Tables[1];
            ViewState["TrackType"] = dsCustomerTrackDDL.Tables[2];

            DataTable objTrack = ViewState["CustomerTrackDetails"] as DataTable;
            bool blnIsFooterOnly = false;
            if (objTrack.Rows.Count == 0)
            {
                DataRow drTrack = objTrack.NewRow();
                drTrack["LOB_ID"] = 0;
                drTrack["LOB_NAME"] = "";
                drTrack["PA_SA_REF_ID"] = 0;
                drTrack["ACCOUNTNO"] = "";
                drTrack["DATE"] = "";
                drTrack["RELEASEDATE"] = "";
                drTrack["LOGINBY"] = "";
                drTrack["RELEASED_BY"] = 0;
                drTrack["RELEASEDBY"] = "";
                drTrack["REASON"] = "";
                drTrack["TRACK_TYPE"] = "";
                drTrack["TRACK_TYPE_ID"] = 0;
                objTrack.Rows.Add(drTrack);
                blnIsFooterOnly = true;
            }
            gvTrack.DataSource = objTrack;
            gvTrack.DataBind();
            if (blnIsFooterOnly)
            {
                objTrack.Rows.Clear();
                ViewState["CustomerTrackDetails"] = objTrack;

                gvTrack.Rows[0].Cells.Clear();
                gvTrack.Rows[0].Visible = false;
            }
            FunPriGenerateNewAlertRow();


        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void FunPriGenerateNewAlertRow()
    {
        try
        {

            DropDownList ddlLOBTrack = gvTrack.FooterRow.FindControl("ddlLOBTrack") as DropDownList;
            DropDownList ddlAccountNo = gvTrack.FooterRow.FindControl("ddlAccountNo") as DropDownList;
            DropDownList ddlType = gvTrack.FooterRow.FindControl("ddlType") as DropDownList;

            Utility.FillDLL(ddlLOBTrack, ((DataTable)ViewState["TrackLOB"]), true);
            Utility.FillDLL(ddlAccountNo, ((DataTable)ViewState["TrackAccountNo"]), true);
            Utility.FillDLL(ddlType, ((DataTable)ViewState["TrackType"]), true);

            ddlLOBTrack.Focus();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Track_AddRow_OnClick(object sender, EventArgs e)
    {

        DataTable objTrack = (DataTable)ViewState["CustomerTrackDetails"];

        DropDownList ddlLOBTrack = gvTrack.FooterRow.FindControl("ddlLOBTrack") as DropDownList;
        DropDownList ddlAccountNo = gvTrack.FooterRow.FindControl("ddlAccountNo") as DropDownList;
        DropDownList ddlType = gvTrack.FooterRow.FindControl("ddlType") as DropDownList;
        TextBox txtDate = gvTrack.FooterRow.FindControl("txtDate") as TextBox;
        TextBox txtReleaseDate = gvTrack.FooterRow.FindControl("txtReleaseDate") as TextBox;
        TextBox txtReason = gvTrack.FooterRow.FindControl("txtReason") as TextBox;
        //if (ddlLOBTrack.SelectedIndex <= 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Line of Business");
        //    return;
        //}
        //if (ddlAccountNo.SelectedIndex <= 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Account No.");
        //    return;
        //}
        //if (ddlType.SelectedIndex <= 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Account No.");
        //    return;
        //}
        //if (string.IsNullOrEmpty(txtReleaseDate.Text))
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Release Date");
        //    return;
        //}
        //if (string.IsNullOrEmpty(txtDate.Text))
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Date");
        //    return;
        //}
        DataRow drTrack = objTrack.NewRow();
        drTrack["LOB_ID"] = ddlLOBTrack.SelectedValue;
        drTrack["LOB_NAME"] = ddlLOBTrack.SelectedItem.Text;
        drTrack["PA_SA_REF_ID"] = ddlAccountNo.SelectedValue;
        drTrack["ACCOUNTNO"] = ddlAccountNo.SelectedItem.Text;
        drTrack["DATE"] = txtDate.Text;
        drTrack["RELEASEDATE"] = txtReleaseDate.Text;
        drTrack["LOGINBY"] = ObjUserInfo.ProUserNameRW;
        drTrack["RELEASED_BY"] = intUserId.ToString();
        drTrack["RELEASEDBY"] = ObjUserInfo.ProUserNameRW;
        drTrack["REASON"] = txtReason.Text;
        drTrack["TRACK_TYPE"] = ddlType.SelectedItem.Text;
        drTrack["TRACK_TYPE_ID"] = ddlType.SelectedValue;
        objTrack.Rows.Add(drTrack);

        gvTrack.DataSource = objTrack;
        gvTrack.DataBind();
        ViewState["CustomerTrackDetails"] = objTrack;
        FunPriGenerateNewAlertRow();
        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Please select Email or SMS');", true);

        //}
    }

    //protected void gvTrack_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    try
    //    {
    //        //if (e.Row.RowType == DataControlRowType.Footer)
    //        //{
    //        //    TextBox txtDate = e.Row.FindControl("txtDate") as TextBox;
    //        //    TextBox txtReleaseDate = e.Row.FindControl("txtReleaseDate") as TextBox;
    //        //    DropDownList ddlLOBTrack = e.Row.FindControl("ddlLOBTrack") as DropDownList;
    //        //    DropDownList ddlAccountNo = e.Row.FindControl("ddlAccountNo") as DropDownList;
    //        //    DropDownList ddlType = e.Row.FindControl("ddlType") as DropDownList;
    //        //    AjaxControlToolkit.CalendarExtender CalendarDate = e.Row.FindControl("CalendarDate") as AjaxControlToolkit.CalendarExtender;
    //        //    AjaxControlToolkit.CalendarExtender CalendarReleaseDate = e.Row.FindControl("CalendarReleaseDate") as AjaxControlToolkit.CalendarExtender;
    //        //    CalendarDate.Format = strDateFormat;
    //        //    CalendarReleaseDate.Format = strDateFormat;
    //        //    txtDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtDate.ClientID + "','" + strDateFormat + "',true,false);");
    //        //    txtReleaseDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReleaseDate.ClientID + "','" + strDateFormat + "',false,'F');");
    //        //}
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //        cvCustomerMaster.ErrorMessage = "Due to Data Problem,Unable to Set the DateFormat in Customer Track Details";
    //        cvCustomerMaster.IsValid = false;
    //    }
    //}

    protected void gvTrack_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblLOBName = (Label)e.Row.FindControl("lblLOBName");
                //Label lblAccountNo = (Label)e.Row.FindControl("lblAccountNo");
                //Label lblTypeId = (Label)e.Row.FindControl("lblTypeId");
                //Label lblDate = (Label)e.Row.FindControl("lblDate");
                //Label lblReason = (Label)e.Row.FindControl("lblReason");
                //Label lblReleaseDate = (Label)e.Row.FindControl("lblReleaseDate");
                //Label lblReleasedBy = (Label)e.Row.FindControl("lblReleasedBy");
                //if (ViewState["CustomerTrackDetails"] != null)
                //{
                //    DataTable dtCustomerTrack = (DataTable)ViewState["CustomerTrackDetails"];
                //    lblLOBName.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["LOB_NAME"]);
                //    lblAccountNo.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["ACCOUNTNO"]);
                //    lblReason.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["REASON"]);
                //    lblDate.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["DATE"]);
                //    lblReleaseDate.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["RELEASEDATE"]);
                //    lblTypeId.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["TRACK_TYPE"]);
                //    if (dtCustomerTrack.Rows[e.Row.RowIndex]["RELEASEDBY"].ToString() == "")
                //    {
                //        lblReleasedBy.Text = intUserId.ToString();
                //        e.Row.Cells[8].Text =
                //        e.Row.Cells[11].Text = ObjUserInfo.ProUserNameRW;
                //    }
                //    else
                //    {
                //        lblReleasedBy.Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["RELEASED_BY"]);
                //        e.Row.Cells[8].Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["LOGINBY"]);
                //        e.Row.Cells[11].Text = Convert.ToString(dtCustomerTrack.Rows[e.Row.RowIndex]["RELEASEDBY"]);
                //    }
                //}
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                TextBox txtDate = e.Row.FindControl("txtDate") as TextBox;
                TextBox txtReleaseDate = e.Row.FindControl("txtReleaseDate") as TextBox;
                DropDownList ddlLOBTrack = e.Row.FindControl("ddlLOBTrack") as DropDownList;
                DropDownList ddlAccountNo = e.Row.FindControl("ddlAccountNo") as DropDownList;
                DropDownList ddlType = e.Row.FindControl("ddlType") as DropDownList;
                AjaxControlToolkit.CalendarExtender CalendarDate = e.Row.FindControl("CalendarDate") as AjaxControlToolkit.CalendarExtender;
                AjaxControlToolkit.CalendarExtender CalendarReleaseDate = e.Row.FindControl("CalendarReleaseDate") as AjaxControlToolkit.CalendarExtender;
                CalendarDate.Format = strDateFormat;
                CalendarReleaseDate.Format = strDateFormat;
                txtDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtDate.ClientID + "','" + strDateFormat + "',true,false);");
                txtReleaseDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReleaseDate.ClientID + "','" + strDateFormat + "',false,'F');");
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    #endregion
    private void FunPriLoadCustomerTrackDetails(int intCustomerId)
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            ObjStatus.Option = 303;
            ObjStatus.Param1 = intCustomerId.ToString();
            ObjStatus.Param2 = intUserId.ToString();
            ObjStatus.Param3 = intCompanyId.ToString();
            DataTable ObjCustomerTrackDetails = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
            ViewState["CustomerTrackDetails"] = ObjCustomerTrackDetails;

            gvTrack.DataSource = ObjCustomerTrackDetails;
            gvTrack.DataBind();

            //FunPriBindCustomerTrackDLL();
            //if (ObjCustomerTrackDetails.Rows.Count > 0)
            //{
            //    lblNoCustomerTrack.Visible = pnlNoCustomerTrack.Visible = false;
            //    gvTrack.Visible = true;
            //    divTrack.Visible = true;
            //}
            //else
            //{
            //    lblNoCustomerTrack.Visible = pnlNoCustomerTrack.Visible = true;
            //    // Need to comment by Manikandan. R
            //    gvTrack.Visible = false;
            //    divTrack.Visible = false;
            //}
            //if (gvTrack.Rows.Count < 1 && gvTrack.FooterRow.Visible)
            //{
            //    lblNoCustomerTrack.Visible = true;
            //    // Need to comment by Manikandan. R
            //    gvTrack.Visible = false;
            //    divTrack.Visible = false;
            //}
            //else
            //{
            //    lblNoCustomerTrack.Visible = false;
            //    gvTrack.Visible = true;
            //    divTrack.Visible = true;
            //}
            Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
            objProcedureParameters.Add("@CustomerId", intCustomerId.ToString());
            gvCredit.DataSource = Utility.GetDefaultData("s3g_org_LoadCustomerCreditDetails", objProcedureParameters);
            gvCredit.DataBind();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Due to Data Problem, Unable to Load the Customer Track Details");
        }
        finally
        {
            objCustomerMasterClient.Close();
        }

    }
    /// <summary>
    /// Toggle the Controls based on User's AccessPermission
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            if (!bQuery)
            {
                Response.Redirect(strRedirectPageView);
            }


            switch (intModeID)
            {
                case 0: // Create Mode
                    FunPriToggleLoanAdminControls(false);
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    btnClear.Enabled_True();
                    ddlGender.SelectedIndex = 0;
                    btnModify.Enabled_False();
                    txtCustomercode.ReadOnly = false;
                    lblCustomercode.Visible = txtCustomercode.Visible = DivtxtCustomercode.Visible = false;
                    btnModifyAdds.Enabled_False();
                    txtCurrentMarketValue.Enabled = false;
                    btnDeDup.Enabled_True();

                    if (Request.QueryString["IsFromEnquiry"] != null)
                    {
                        if (Request.QueryString["NewCustomerID"] != null)//LoadProspectInfo
                        {
                            if (Request.QueryString["NewCustomerID"] != "0")
                            {
                                FunPriLoadCustomerDetails(0, 1, 0, Request.QueryString["NewCustomerID"].ToString());
                            }
                        }
                    }
                    if (Request.QueryString["IsFromApplicationGuarantor"] != null)
                    {
                        if (Request.QueryString["NewCustomerID"] != null)//LoadProspectInfo
                        {
                            if (Request.QueryString["NewCustomerID"] != "0")
                            {
                                FunPriLoadCustomerDetails(Convert.ToInt32(Request.QueryString["NewCustomerID"].ToString()), 0, 1, "");
                            }
                        }
                    }

                    break;

                case 1: // Modify Mode
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    FunPriSetControlSettings();
                    //FunPriToggleCustomerTypeControls();
                    FunPriLoadCustomerDetails(intCustomerId, 0, 0, "");
                    btnModify.Enabled_False();
                    tcCustomerMaster.ActiveTabIndex = 0;
                    txtCustomercode.ReadOnly = true;
                    //Lined by Thangam M 0n 28/Feb/2012 for bug id 5453
                    //txt_CUSTOMER_NAME.ReadOnly = true;
                    //End here
                    lblCustomercode.Visible = txtCustomercode.Visible = DivtxtCustomercode.Visible = true;
                    txtAge.ReadOnly = true;
                    btnClear.Enabled_False();
                    dvLimitHis.Visible = true;
                    //Dictionary<string, string> ProcParam = new Dictionary<string, string>();
                    //ProcParam.Add("@COMPANYID", intCompanyId.ToString());
                    //ProcParam.Add("@CUSTOMERID", intCustomerId.ToString());
                    //DataSet dsAccountCount = Utility.GetDataset("S3G_ORG_GETACCOUNTCOUNT", ProcParam);
                    //if (Convert.ToInt32(dsAccountCount.Tables[0].Rows[0][0]) > 0)
                    //{
                    //    //txt_CUSTOMER_NAME.ReadOnly = true;
                    //    txt_CUSTOMER_NAME.Enabled = false;
                    //    if (bClearList)
                    //    {
                    //        ddlTitle.RemoveDropDownList();
                    //        ddlCustomerType.RemoveDropDownList();
                    //        ddlConstitutionName.RemoveDropDownList();
                    //        ddlPostingGroup.RemoveDropDownList();
                    //        ddlGender.ClearDropDownList();
                    //    }
                    //    //CalendarExtenderSD.Enabled = false;
                    //    //cmbIndustryCode.ReadOnly = txtIndustryName.ReadOnly = true;
                    //}
                    btnDeDup.Enabled_True();
                    Indnonind();
                    ddlCustomerType.ClearDropDownList();
                    //ddlConstitutionName.ClearDropDownList();
                    //ddlNationality.Enabled = false;
                    //txtIdentityColumn.ReadOnly = true;
                    //RevIdentityColumn.Enabled = RevCRNUMBERVal.Enabled = false;
                    break;
                case -1:// Query Mode
                    FunPriSetControlSettings();
                    btnDeDup.Enabled_False();
                    //FunPriToggleCustomerTypeControls();
                    ConstReqFieldValidate(false);
                    rfvNoOfEmployees.Enabled = rfvDirectors.Enabled = rfvNonMoci.Enabled = false;
                    rfvNonMoci.Enabled = false;
                    EnableFactoring(false);
                    pnlIndividual.Enabled = false;
                    pnlNonIndividual.Enabled = false;
                     ddlTAXApplicable.Enabled = false;
                     txtVATIN.Enabled = false;
                    if (Request.QueryString["IsFromEnquiry_Pros_Query"] != null)
                    {
                        if (Request.QueryString["NewCustomerID"] != null)//LoadProspectInfo
                        {
                            if (Request.QueryString["NewCustomerID"] != "0")
                            {
                                FunPriLoadCustomerDetails(0, 1, 0, Request.QueryString["NewCustomerID"].ToString());
                            }
                        }

                        rfvTitle.Enabled = false;
                        rfvIndustryCode.Enabled = false;
                        rfvcmbsub.Enabled = false;
                        rfvddlBranchList.Enabled = false;
                        rfvResidenceOmanSince.Enabled = false;
                        rfvPassportIssueDate.Enabled = false;
                        rfvPassportExpDate.Enabled = false;
                        //rfvProfession.Enabled = false;
                        //rfvVisaNo.Enabled = false;
                        rfvLabourCardNo.Enabled = false;
                        rfvLabourCardDate.Enabled = false;
                        txtLaborExpDate.Enabled = false;
                        rfvOccupation.Enabled = false;
                        //rfvQualification.Enabled = false;
                        rfvIdentityColumn.Enabled = false;
                        rfvVIP.Enabled = false;
                        RevIdentityColumn.Enabled = false;
                        //rfvIndustryType.Enabled = false;
                        rfvSenAppli.Enabled = false;
                        rfvSenMemStatus.Enabled = false;
                        rfvSenMemRelInd.Enabled = false;
                        rfvRelaPartyind.Enabled = false;
                        //rfvMaxLenLimiExpDate.Enabled = false;
                        //rfvMaxLenLimiExpDate.Enabled = false;
                        rfvLaborExpDate.Enabled = false;
                        RevCRNUMBERVal.Enabled = false;
                        RevIdentityColumn.Enabled = false;
                        //rfvMaxLenLimiExpDate.Enabled = false;
                        RevCRNUMBERVal.Enabled = false;
                        RevCRNUMBERVal.Enabled = false;
                        txtCRNumber.Enabled = false;
                        txtNRID.Enabled = false;
                        RegularExpressionValidator1.Enabled = false;
                        rfvtxtCRNumber.Enabled = false;
                        rfvCRNumber.Enabled = false;
                        //rfvMaxLenLimiExpDate.Enabled = false;
                        rfvMaxLenLimit.Enabled = false;

                    }
                    else
                    {
                        EnableCustomerControl();
                        FunPriLoadCustomerDetails(intCustomerId, 0, 0, "");
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    tcCustomerMaster.ActiveTabIndex = 0;
                    lblCustomercode.Visible = true;
                    txtCustomercode.Visible = DivtxtCustomercode.Visible = true;
                    FunPriToggleQueryModeControls();
                    txtGroupCode.Enabled = false;
                    //btnCopyAddress.Visible = false;
                    chkCustomer.Enabled = false;
                    chkGuarantor1.Enabled = false;
                    //chkGuarantor2.Enabled = false;
                    chkCoApplicant.Enabled = false;
                    chkGroupDet.Enabled = false;
                    rbnCreditType.Enabled = false;
                    grvCustSubLimit.Columns[grvCustSubLimit.Columns.Count - 1].Visible = false;
                    grvCustSubLimit.FooterRow.Visible = false;
                    grvAddressDetails.Columns[grvAddressDetails.Columns.Count - 1].Visible = false;
                    grvAddressDetails.FooterRow.Visible = false;
                    Indnonind();
                    if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
                    {
                        grvShars.FooterRow.Visible = false;
                        grvShars.Columns[grvShars.Columns.Count - 1].Visible = false;
                    }
                    grvBankDetails.Columns[grvBankDetails.Columns.Count - 1].Visible = false;
                    btnAddAdds.Visible = btnModifyAdds.Visible = btnAdd.Visible = btnModify.Visible = btnBnkClear.Visible = false;
                    pnlAddressDetails.Enabled = false;
                    ucEntityNamesSetup.ReadOnly(true);
                    txtCustomercode.ReadOnly = true;
                    RevCRNUMBERVal.Enabled = false;
                    RevIdentityColumn.Enabled = false;
                    txtTotNetWorth.Enabled =
                    txtMonBusIncome.Enabled =
                    txtFactoringLimit.Enabled =
                    txtMaxLenLimit.Enabled =
                    txtAnnualSales.Enabled =
                    txtTotalAssets.Enabled =
                    txtPaidCapital.Enabled =
                    txtbookvalue.Enabled =
                    txtfacevalue.Enabled =
                    txtNonMoci.Enabled =
                    txtCurrentMarketValue.Enabled = false;
                    dvLimitHis.Visible = true;
                    rfvNoOfEmployees.Enabled = rfvDirectors.Enabled = rfvNonMoci.Enabled = false;
                    //gvTrack.FooterRow.Visible = false;
                    break;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void funPriLoadDMSGuarantorInfor(int ICustomerId, int IAction)
    {
        try
        {

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void FunPriToggleQueryModeControls()
    {
        //txt_CUSTOMER_NAME.ReadOnly = true;
        txt_CUSTOMER_NAME.Enabled = false;
        tblBankDetails.Visible = false;
        if (bClearList)
        {
            ddlCustomerType.RemoveDropDownList();
            ddlConstitutionName.RemoveDropDownList();
            ddlGender.ClearDropDownList();
            ddlGovernment.RemoveDropDownList();
            ddlHouseType.RemoveDropDownList();
            ddlMaritalStatus.RemoveDropDownList();
            //ddlOwn.RemoveDropDownList();
            ddlPostingGroup.RemoveDropDownList();
            //cmbPublic.RemoveDropDownList();
            ddlTitle.RemoveDropDownList();
            ddlBranch.RemoveDropDownList();
            ddlAddressType.RemoveDropDownList();
        }
        CalendarExtenderSD.Enabled = calLabourCardDate.Enabled = calLaborExpDate.Enabled = false;
        txtDOB.ReadOnly = txtWeddingdate.ReadOnly = txtPassportNumber.ReadOnly = txtPassportIssueDate.ReadOnly =
        txtPassportExpDate.ReadOnly = txtVisaNo.ReadOnly = txtDrivingNumber.ReadOnly =
        txtLabourCardNo.ReadOnly = txtLabourCardDate.ReadOnly = txtLaborExpDate.ReadOnly =
        txtIdentityColumn.ReadOnly = txtIdentityIssueDate.ReadOnly = txtIdentityExpiredate.ReadOnly =
        txtQualification.ReadOnly = txtProfession.ReadOnly = txtResidenceOmanSince.ReadOnly = txtSpouseName.ReadOnly = txtChildren.ReadOnly = txtTotalDependents.ReadOnly =
        txtCurrentMarketValue.ReadOnly = txtRemainingLoanValue.ReadOnly = txtTotNetWorth.ReadOnly =
        txtDirectors.ReadOnly = txtBussinessFirm.ReadOnly = txtCRNumber.ReadOnly = txtSE.ReadOnly = txtPaidCapital.ReadOnly = txtfacevalue.ReadOnly = txtbookvalue.ReadOnly =
        txtBusinessProfile.ReadOnly = txtGeographical.ReadOnly = txtnobranch.ReadOnly = txtPercentageStake.ReadOnly =
        txtJVPartnerName.ReadOnly = txtJVPartnerStake.ReadOnly = txtCEOName.ReadOnly = txtCEOAge.ReadOnly = txtCEOexperience.ReadOnly =
        txtAccountNumber.ReadOnly = txtBankAddress.ReadOnly =
        txtBankName.ReadOnly = txtMICRCode.ReadOnly = true;
        ddlBankBranch.Enabled = false;
        CalendarWeddingdate.Enabled = false;
        calIdentityExpiredate.Enabled = calIdentityIssueDate.Enabled = calResidenceOmanSince.Enabled = calPassportIssueDate.Enabled = calPassportExpDate.Enabled = false;
        cmbIndustryCode.ClearDropDownList();
        btnAdd.Enabled_False();
        btnModify.Enabled_False();
        btnClear.Enabled_False();
        btnSave.Enabled_False();
        grvBankDetails.Columns[grvBankDetails.Columns.Count - 1].Visible = false;
        if (gvTrack.Rows.Count > 0)
        {
            if (gvTrack.Columns[12] != null) gvTrack.Columns[12].Visible = false;
        }
        ddlNationality.ReadOnly = true;
        if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
        {
            txtKeyDecisionMaker.ReadOnly = txtDirectors.ReadOnly = true;
            rbnFinancialRequired.Enabled = false;
            if (cmbFinancialReceived.Items.Count > 0)
            {
                cmbFinancialReceived.ClearDropDownList();
            }
            else
            {
                cmbFinancialReceived.Enabled = false;
            }
            cmbPublic.ClearDropDownList();
            cmbFinancialReceived.Enabled = calOCCIIssueDate.Enabled = calOCCIExpiryDate.Enabled = false;
            txtAnnualSales.ReadOnly = txtTotalAssets.ReadOnly = txtBussinessActivity.ReadOnly = txtAuditorName.ReadOnly = txtOCCIIssueDate.ReadOnly =
            txtOCCIExpiryDate.ReadOnly = txtOCCIIssueDate.ReadOnly = txtNonMoci.ReadOnly = txtNoOfEmployees.ReadOnly = true;
        }
        else
        {
            cmbOccupation.ClearDropDownList();
            cmEmpEcoCode.ClearDropDownList();
            rbnOwn.Enabled = rbnMFCEmpIndi.Enabled = cmEmpEcoCode.Enabled = false;
            txtFamilyName.ReadOnly = txtNRID.ReadOnly = true;
            ddlVIP.RemoveDropDownList();
        }
        rbnFactoringApplicable.Enabled = rbnCovenantApplicable.Enabled = rbnAssignmentCollection.Enabled =
        rbnSMEIndicator.Enabled = rbnSenAppli.Enabled = rbnSenMemStatus.Enabled = rbnSenMemRelInd.Enabled = rbnLanCollateral.Enabled = rbnRelaPartyind.Enabled = false;
        cmbFactoringType.ClearDropDownList();
        cmbIndustryType.ClearDropDownList();
        cmbSenMemProfession.ClearDropDownList();
        cmbFactoringType.Enabled = cmbIndustryType.Enabled = cmbSenMemProfession.Enabled = false;
        txtFactoringLimit.ReadOnly = txtCovenantClause.ReadOnly = txtMaxLenLimit.ReadOnly = txtMaxLenLimiExpDate.ReadOnly = txtFacLimitExp.ReadOnly = true;
        txtNotes.ReadOnly = true;
        chkBadTrack.Enabled = false;
        btnAdd.Enabled_False();
        btnModify.Enabled_False();
        btnAddAdds.Enabled_False();
        btnModifyAdds.Enabled_False();
        btnBnkClear.Enabled_False();
        pnlCustdtls.Enabled = false;
        pnlAddressDetails.Enabled = false;
        calFacLimitExp.Enabled = calMaxLenLimiExpDate.Enabled = false;
    }
    private void FunPriToggleModifyModeControls()
    {

    }


    #endregion

    #region Dropdown Events

    protected void ddlCustomerType_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriToggleCustomerTypeControls();
            ddlCustomerType.Focus();
            ucEntityNamesSetup.ClearControls();
            ClearControls();
            grvBankDetails.DataSource = null;
            grvBankDetails.DataBind();
            FunProIntializeData();
            ddlNationality.Clear();
            txtNRID.Text = string.Empty;
            //FunPubBindAddsGrid();
            lblIdentityColumn.Text = "Reference Number";
            lblIdentityIssueDate.Text = "Issue Date";
            lblIdentityExpiredate.Text = "Expiry Date";
            rfvIdentityColumn.ErrorMessage = "Enter Reference Number";
            rfvIdentityIssueDate.ErrorMessage = "Enter Issue Date";
            rfvIdentityExpiredate.ErrorMessage = "Enter Expiry Date";
            if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
            {
                EnabledCloselyRFV(false);
                //txt_CUSTOMER_NAME.ReadOnly = false;
                txtIdentityIssueDate.AutoPostBack = true;
                txt_CUSTOMER_NAME.Enabled = true;
                rvfCustomerName.Enabled = true;
                pnlCustdtls.Visible = dvCustdtls.Visible = false;
                FunPubBindSharsGrid();
                IndReqFieldValidate(false);
                NonIndReqFieldValidate(true);
                funPriLoadNonIndividualLoad();
                txtGroupCode.Enabled = true;
                rfvTitle.Enabled = false;
                rfvDOB.Enabled = false;
                rbnSMEIndicator.SelectedValue = "2";
                rbnSMEIndicator.Enabled = true;
                EnableSeniorIndicator(false);
                ExpiryMonth();
            }
            else
            {
                //txt_CUSTOMER_NAME.ReadOnly = true;
                ucEntityNamesSetup.BindNameSetupDetails();
                txtIdentityIssueDate.AutoPostBack = false;
                txt_CUSTOMER_NAME.Enabled = false;
                rvfCustomerName.Enabled = false;
                pnlCustdtls.Visible = dvCustdtls.Visible = true;
                IndReqFieldValidate(true);
                NonIndReqFieldValidate(false);
                funPriLoadIndividualLoad();
                rfvTitle.Enabled = true;
                rfvDOB.Enabled = true;
                rbnSMEIndicator.SelectedValue = "2";
                rbnSMEIndicator.Enabled = false;
                //txtIdentityColumn.AutoPostBack = true;
                txtGroupCode.Enabled = true;
                EnableSeniorIndicator(true);
                rbnSenAppli.SelectedValue = "2";
                EnableSenMemberIndicator(false);
                ComplianceAge();
            }
            Indnonind();
            if (ddlCustomerType.SelectedIndex > 0)
            {
                ConstitutionBind();
                ////Default Bind
                ddlConstitutionName.ClearSelection();
                if (ddlCustomerType.SelectedItem.ToString().ToLower() == "individual")
                {
                    try
                    {
                        //ddlConstitutionName.Items.FindByText("1-INDIVIDUALS").Selected = true;
                        //ddlConstitutionName_OnSelectedIndexChanged(sender, e);
                    }
                    catch (Exception exInd)
                    {
                        ClsPubCommErrorLogDB.CustomErrorRoutine(exInd, strPageName);
                    }
                }
                ddlPostingGroup.SelectedIndex = 1;
            }
            TextBox txtItemNameNationality = ((TextBox)ddlNationality.FindControl("txtItemName"));
            if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
            {
                BindNonIndTypes();
            }
            else
            {
                txtItemNameNationality.Focus();
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.CustomerTypeChangeError;
            cvCustomerMaster.IsValid = false;
        }
    }

    private void IndReqFieldValidate(Boolean Value)
    {
        //rfvQualification.Enabled = Value;
        //rfvProfession.Enabled = Value;
        rfvHouseType.Enabled = Value;
        //rfvVisaNo.Enabled = Value;
        rfvLabourCardNo.Enabled = Value;
        rfvLabourCardDate.Enabled = Value;
        rfvLaborExpDate.Enabled = Value;
        rfvOccupation.Enabled = Value;
        rfvVIP.Enabled = Value;
        //rfvFirstName.Enabled = Value;
        //rfvSecondName.Enabled = Value;
        //rfvThirdName.Enabled = Value;
        //rfvFourthName.Enabled = Value;
        rfvTitle.Enabled = Value;
    }

    private void NonIndReqFieldValidate(Boolean Value)
    {
        //rfvPublic.Enabled = Value;
        rfvDirectors.Enabled = Value;
        //rfvBusinessProfile.Enabled = Value;
        //rfvGeographical.Enabled = Value;
        rfvOmaniStaff.Enabled = Value;
        rfvJVPartnerStake.Enabled = Value;
        rfvJVPartnerStake.Enabled = Value;

    }

    protected void ddlConstitutionName_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            if (Convert.ToInt16(ddlConstitutionName.SelectedValue) > 0)
            {
                S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
                ObjStatus.Option = 7;
                ObjStatus.Param1 = ddlConstitutionName.SelectedValue.ToString();
                gvConstitutionalDocuments.DataSource = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
                gvConstitutionalDocuments.DataBind();

                //Added By Thangam on 12/Mar/2012 to fix bug id - 5451
                FunProClearUploader();

                ViewState["ConstitutionDocument"] = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
                ddlConstitutionName.Focus();
                ObjStatus.Option = 787;
                ObjStatus.Param1 = intCompanyId.ToString();
                DataTable dtConsDocPath = objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus);
                if (dtConsDocPath == null)
                {
                    Utility.FunShowAlertMsg(this, "Define the spooling path in Document Path Setup for Consitution Document");
                    return;
                }
                if (dtConsDocPath.Rows.Count == 0)
                {
                    Utility.FunShowAlertMsg(this, "Define the spooling path in Document Path Setup for Consitution Document");
                    return;
                }
                ViewState["ConsDocPath"] = dtConsDocPath.Rows[0][0].ToString();
                strDocpath = dtConsDocPath.Rows[0][0].ToString();
                AdditionalInfor();
                NIDRIDCRValidate();
            }
            else
            {
                tcCustomerMaster.Tabs[3].Enabled = false;
            }
            CustomerTypeCheck();
            txtIdentityColumn.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.ConstitutionChangeError;
            cvCustomerMaster.IsValid = false;
        }
        finally
        {
            objCustomerMasterClient.Close();
            //upConstitution.Update();
        }
    }

    private void CustomerTypeCheck()
    {
        if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
        {
            ConstitutionValueChange();
        }
    }
    protected void cmbGroupCode_OnTextChanged(object sender, EventArgs e)
    {
        try
        {

            //txtGroupName.Text = string.Empty;
            //txtGroupName.Focus();

            //DataTable dt = (DataTable)HttpContext.Current.Session["GroupDT"];

            //if (dt.Rows.Count > 0)
            //{
            //    string filterExpression = "Value = '" + cmbGroupCode.Text + "'";
            //    DataRow[] dtSuggestions = dt.Select(filterExpression);

            //    if (dtSuggestions.Length > 0)
            //    {
            //        txtGroupName.Text = dtSuggestions[0]["Description"].ToString();
            //        //txtGroupName.ReadOnly = true;
            //        txtGroupName.ReadOnly = false;
            //    }
            //    else
            //    {
            //        txtGroupName.ReadOnly = false;
            //    }
            //}
            //if (cmbGroupCode.Text == string.Empty)
            //{
            //    //txtGroupName.ReadOnly = false;
            //    txtGroupName.ReadOnly = true;
            //    txtGroupName.Text = string.Empty;
            //}


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.GroupChangeError;
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void cmbIndustryCode_OnTextChanged(object sender, EventArgs e)
    {
        //txtIndustryName.Text = string.Empty;
        //try
        //{
        //    DataTable dt = (DataTable)HttpContext.Current.Session["IndustryDT"];

        //    if (dt.Rows.Count > 0)
        //    {
        //        string filterExpression = "Value = '" + cmbIndustryCode.Text + "' and Company_Id = " + intCompanyId.ToString();
        //        DataRow[] dtSuggestions = dt.Select(filterExpression);
        //        if (dtSuggestions.Length > 0)
        //        {
        //            txtIndustryName.Text = dtSuggestions[0]["Description"].ToString();
        //            //txtIndustryName.ReadOnly = true;
        //            txtIndustryName.ReadOnly = false;
        //        }
        //        else
        //        {
        //            txtIndustryName.ReadOnly = false;
        //        }
        //    }
        //    if (cmbIndustryCode.Text == string.Empty)
        //    {
        //        //txtIndustryName.ReadOnly = false;
        //        txtIndustryName.ReadOnly = true;
        //        txtIndustryName.Text = string.Empty;
        //    }
        //    upIndustryCode.Update();
        //}
        //catch (Exception ex)
        //{
        //    ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        //    cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Load the Industry Name";
        //    cvCustomerMaster.IsValid = false;
        //}
    }

    //protected void ddlPANum_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        ddlSANum.Items.Clear();
    //        DataSet dsContractNos = new DataSet();
    //        if (ViewState["dsContractNos"] != null)
    //        {
    //            dsContractNos = (DataSet)ViewState["dsContractNos"];
    //            dtSubContractNos = dsContractNos.Tables[1].Copy();
    //            if (dtSubContractNos.Rows.Count > 0)
    //            {
    //                DataRow[] drSANum = dtSubContractNos.Select("PANum='" + ddlPANum.SelectedValue + "'");
    //                if (drSANum.Length > 0)
    //                    ddlSANum.FillDataTable(drSANum.CopyToDataTable(), "SANum", "SANum");
    //            }
    //        }

    //    }
    //    catch (Exception objException)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
    //        cvCustomerMaster.ErrorMessage = "Error in loading sub contract no";
    //        cvCustomerMaster.IsValid = false;
    //    }
    //}
    #endregion

    #region Grid Events

    /// <summary>
    /// Disable the "Values" Control in Constitutional Document Tab
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvConstitutionalDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            e.Row.Cells[0].Visible = false;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Label lblPath = e.Row.FindControl("myThrobber") as Label;
                int rowindex = e.Row.RowIndex;
                LinkButton hlnkView = e.Row.FindControl("hlnkView") as LinkButton;
                CheckBox chkIsMandatory = e.Row.FindControl("chkIsMandatory") as CheckBox;
                CheckBox chkIsNeedImageCopy = e.Row.FindControl("chkIsNeedImageCopy") as CheckBox;
                CheckBox chkCollected = e.Row.FindControl("chkCollected") as CheckBox;
                CheckBox chkScanned = e.Row.FindControl("chkScanned") as CheckBox;
                TextBox txtValues = e.Row.FindControl("txtValues") as TextBox;

                FileUpload flUpload = (FileUpload)e.Row.FindControl("flUpload");
                Label lblActualPath = (Label)e.Row.FindControl("lblActualPath");
                TextBox txtFileupld = e.Row.FindControl("txtFileupld") as TextBox;
                Button btnBrowse = (Button)e.Row.FindControl("btnBrowse");

                if (!chkIsNeedImageCopy.Checked)
                {
                    chkScanned.Enabled = false;
                }

                // AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = (AjaxControlToolkit.AsyncFileUpload)e.Row.FindControl("asyFileUpload");
                if (lblActualPath != null)
                {
                    if (lblActualPath.Text.Trim() != string.Empty)
                    {
                        hlnkView.Enabled = true;
                        //if (strMode == "M")
                        //{
                        //    string strViewst = "File" + rowindex.ToString();
                        //    Cache[strViewst] = lblActualPath.Text.Trim();
                        //}
                    }
                    else
                    {
                        hlnkView.Enabled = false;
                    }
                }
                else
                {
                    hlnkView.Enabled = false;
                }

                if (!chkIsNeedImageCopy.Checked)
                {
                    txtFileupld.Visible =
                    flUpload.Visible = false;
                }



                TextBox txtVal = (TextBox)e.Row.FindControl("txtValues");
                // Commented By R. Manikandan Enable value field to enter the Remarks on 07-JAN-2013

                //if (txtVal != null)
                //{
                //    txtVal.Enabled = FunPriDisableValueField(e.Row.Cells[1].Text);
                //}
                if (!string.IsNullOrEmpty(Request.QueryString["qsMode"]))
                {
                    if (Request.QueryString["qsMode"].ToString() == "Q")
                    {
                        txtFileupld.Visible =
                    flUpload.Visible =
                        chkIsMandatory.Enabled = chkIsNeedImageCopy.Enabled = chkCollected.Enabled =
                            chkScanned.Enabled = txtValues.Enabled = false;
                    }
                }
                if (lblActualPath.Text.Trim() != string.Empty)
                {
                    lblActualPath.Visible = true;
                }
                else
                {
                    lblActualPath.Visible = false;
                }
                //flUpload.Attributes.Add("onchange", "fnAssignPath('" + flUpload.ClientID + "','" + hdnSelectedPath.ClientID + "', '" + btnBrowse.ClientID + "'); ");
                flUpload.Attributes.Add("onchange", "fnLoadPath('" + btnBrowse.ClientID + "'); ");

                //fnLoadPath('" + btnBrowse.ClientID + "');

            }
            //e.Row.Cells[11].Visible = false;

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = "Unable to Toggle the Values in Constitution Document Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    //Added by Thangam M on 12/Mar/2012 to fix bug id - 5451
    private void FunPriClearUploader(AjaxControlToolkit.AsyncFileUpload Uploader)
    {
        if (Uploader != null)
        {
            HttpContext crntContext;
            if (HttpContext.Current != null && HttpContext.Current.Session != null)
            {
                crntContext = HttpContext.Current;
            }
            else
            {
                crntContext = null;
            }
            if (crntContext != null)
            {
                foreach (string key in crntContext.Session.Keys)
                {
                    if (key.Contains(Uploader.ClientID))
                    {
                        crntContext.Session.Remove(key);
                    }
                }
            }
        }
    }

    //Added by Thangam M on 12/Mar/2012 to fix bug id - 5451
    protected void FunProClearUploader()
    {
        try
        {
            if (gvConstitutionalDocuments.Rows.Count > 0)
            {
                for (int i = 0; i <= gvConstitutionalDocuments.Rows.Count - 1; i++)
                {
                    LinkButton hlnkView = gvConstitutionalDocuments.Rows[i].FindControl("hlnkView") as LinkButton;
                    AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = (AjaxControlToolkit.AsyncFileUpload)gvConstitutionalDocuments.Rows[i].FindControl("asyFileUpload");
                    FunPriClearUploader(AsyncFileUpload1);
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Clear", "javascript:fnClearAsyncUploader('" + gvConstitutionalDocuments.Rows.Count.ToString() + "');", true);

            }
        }
        catch (Exception)
        {

        }
    }

    protected void gvCustomerTrack_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlType = (DropDownList)e.Row.FindControl("ddlType");
                OrgMasterMgtServicesReference.OrgMasterMgtServicesClient objCustomerMasterClient = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
                S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
                ObjStatus.Option = 1;
                ObjStatus.Param1 = S3G_Statu_Lookup.CATEGORY_TYPE.ToString();
                Utility.FillDLL(ddlType, objCustomerMasterClient.FunPub_GetS3GStatusLookUp(ObjStatus));

                if (ViewState["CustomerTrackDetails"] != null)
                {
                    DataTable dtCustomerTrack = (DataTable)ViewState["CustomerTrackDetails"];
                    ddlType.SelectedValue = dtCustomerTrack.Rows[e.Row.RowIndex]["TRACK_TYPE_ID"].ToString();
                    if (dtCustomerTrack.Rows[e.Row.RowIndex]["RELEASEDBY"].ToString() == "")
                    {
                        Label lblReleasedBy = (Label)e.Row.FindControl("lblReleasedBy");
                        lblReleasedBy.Text = intUserId.ToString();
                        e.Row.Cells[10].Text = ObjUserInfo.ProUserNameRW;
                    }
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    protected void gvCustomerTrack_RowCreated(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtDate = e.Row.FindControl("txtDate") as TextBox;
                txtDate.Attributes.Add("readonly", "readonly");
                AjaxControlToolkit.CalendarExtender CalendarDate = e.Row.FindControl("CalendarDate") as AjaxControlToolkit.CalendarExtender;
                CalendarDate.Format = ObjS3GSession.ProDateFormatRW;

                TextBox txtReleaseDate = e.Row.FindControl("txtReleaseDate") as TextBox;
                txtReleaseDate.Attributes.Add("readonly", "readonly");
                AjaxControlToolkit.CalendarExtender CalendarReleaseDate = e.Row.FindControl("CalendarReleaseDate") as AjaxControlToolkit.CalendarExtender;
                CalendarReleaseDate.Format = ObjS3GSession.ProDateFormatRW;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem,Unable to Set the DateFormat in Customer Track Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    #endregion

    #region TextBox Events

    /// <summary>
    /// Assign the Age field while DOB Changing 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtDOB_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            txtAge.Text = string.Empty;
            if (!string.IsNullOrEmpty(txtDOB.Text))
            {
                if (!(Utility.StringToDate(txtDOB.Text.Trim()) <= Utility.StringToDate(txtIdentityIssueDate.Text.Trim())))
                {
                    Utility.FunShowAlertMsg(this, "Date of Birth Should be lesser then than " + lblIdentityIssueDate.Text.Trim());
                    txtDOB.Text = string.Empty;
                    txtDOB.Focus();
                    return;
                }
                //int intDOBYear = Utility.StringToDate(txtDOB.Text).Year;
                //txtAge.Text = ((DateTime.Now.Year - intDOBYear)).ToString();
                AgeCalculation(txtDOB.Text.Trim());
                if (txtAge.Text.Trim() != string.Empty)
                {
                    if (FunPriValidateAgeComplaince(Convert.ToInt32(txtAge.Text)) && chkCustomer.Checked)
                    {
                        Utility.FunShowAlertMsg(this, "Maximum Age of borrower exceeded");
                        txtDOB.Text = txtAge.Text = string.Empty;
                        txtDOB.Focus();
                        return;
                    }
                    if (Convert.ToInt32(txtAge.Text) < 18 || (Convert.ToInt32(txtAge.Text) > 65 && (!(hdnCustAge.Value != string.Empty && chkCustomer.Checked))))
                    {
                        Utility.FunShowAlertMsg(this, "Customer Age Should be Between 18 And 65");
                        txtDOB.Text = txtAge.Text = string.Empty;
                        txtDOB.Focus();
                        return;
                    }
                    else
                    {
                        //if (Convert.ToInt32(txtAge.Text) >= 60)//Commented by sathish Based on Raja V Observation on 04-Jan-2019
                        //{
                        //    rbnSenAppli.SelectedValue = "1";
                        //    rbnSenAppli.Enabled = true;
                        //}
                        //else
                        //{
                        //    rbnSenAppli.SelectedValue = "2";
                        //    rbnSenAppli.Enabled = false;
                        //}
                        //rbnSenAppli_OnSelectedIndexChanged(sender, e);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = Resources.LocalizationResources.AgeCalculateError;
            cvCustomerMaster.IsValid = false;
        }
        ddlGender.Focus();
    }
    #endregion

    #region Bank Details Tab
    protected void FunProIntializeData()
    {
        DataTable dtBankViewDetails = new DataTable("BankDetails");
        try
        {
            dtBankViewDetails.Columns.Add("AccountType");
            dtBankViewDetails.Columns.Add("AccountType_ID");
            dtBankViewDetails.Columns.Add("Account_Number");
            dtBankViewDetails.Columns.Add("Bank_ID");
            dtBankViewDetails.Columns.Add("Bank_Name");
            dtBankViewDetails.Columns.Add("Branch_ID");
            dtBankViewDetails.Columns.Add("Branch_Name");
            dtBankViewDetails.Columns.Add("IFSC_Code");
            dtBankViewDetails.Columns.Add("PANum");
            dtBankViewDetails.Columns.Add("SANum");
            dtBankViewDetails.Columns.Add("MICR_Code");
            dtBankViewDetails.Columns.Add("Bank_Address");
            dtBankViewDetails.Columns.Add("BankMapping_ID");
            dtBankViewDetails.Columns.Add("Master_ID");
            dtBankViewDetails.Columns.Add("IsDefaultAccount", typeof(bool));
            dtBankViewDetails.Columns[2].Unique = true;
            ViewState["DetailsTable"] = dtBankViewDetails;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Initialize the Data for BankDetails");
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtBankAddress.Text.Length > 300)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Followup Details", "alert('Bank Address Length should be less than or equal to 300');", true);
                tcCustomerMaster.ActiveTabIndex = 2;
                return;
            }
            DataRow drDetails;
            DataTable dtBankDetails = (DataTable)ViewState["DetailsTable"];
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            DataRow[] drDefault = dtBankDetails.Select("IsDefaultAccount = 'True'");
            if (drDefault.Length > 0 && chkDefaultAccount.Checked)
            {
                Utility.FunShowAlertMsg(this, "Only one Default Account is applicable to particular Customer");
                chkDefaultAccount.Focus();
                return;
            }
            DataRow[] drDefaultBranch = dtBankDetails.Select("Account_Number = '" + txtAccountNumber.Text.Trim() + "'");
            if (drDefaultBranch.Length > 0)
            {
                Utility.FunShowAlertMsg(this, "Account Number must be Unique");
                txtAccountNumber.Focus();
                return;
            }
            // To Check Same Account Number,Bank Name and Branch
            DataRow[] drDefaultCheck = dtBankDetails.Select("Account_Number = '" + txtAccountNumber.Text.Trim() + "' and Bank_ID = '" + txtBankName.SelectedValue + "' and Branch_ID = '" + ddlBankBranch.SelectedValue + "'");
            if (drDefaultCheck.Length > 0)
            {
                Utility.FunShowAlertMsg(this, "Same Combination already exists aginst Account Number,Branch and Branch Name");
                txtAccountNumber.Focus();
                return;
            }
            if (dtBankDetails.Rows.Count < 10)
            {
                drDetails = dtBankDetails.NewRow();
                string strBankMapId = Convert.ToString(dtBankDetails.Rows.Count + 1);
                drDetails["BankMapping_ID"] = strBankMapId;
                drDetails["Master_ID"] = "0";
                drDetails["AccountType"] = ddlAccountType.SelectedItem.Text;
                drDetails["AccountType_ID"] = ddlAccountType.SelectedItem.Value;
                drDetails["Account_Number"] = txtAccountNumber.Text.Trim();
                drDetails["Bank_ID"] = txtBankName.SelectedValue;
                drDetails["Bank_Name"] = txtBankName.SelectedText.Trim();
                drDetails["Branch_ID"] = ddlBankBranch.SelectedValue;
                drDetails["Branch_Name"] = ddlBankBranch.SelectedItem.Text.Trim();
                drDetails["MICR_Code"] = txtMICRCode.Text.Trim();
                drDetails["Bank_Address"] = txtBankAddress.Text.Trim();
                drDetails["IsDefaultAccount"] = chkDefaultAccount.Checked;
                drDetails["IFSC_Code"] = txtIFSC_Code.Text.Trim();
                //if (ddlPANum.SelectedIndex > 0)
                //    drDetails["PANum"] = ddlPANum.SelectedValue;
                //if (ddlSANum.SelectedIndex > 0)
                //    drDetails["SANum"] = ddlSANum.SelectedValue;



                dtBankDetails.Rows.Add(drDetails);
                grvBankDetails.DataSource = dtBankDetails;
                grvBankDetails.DataBind();
                FunPriHideBankColumns();
                ViewState["DetailsTable"] = dtBankDetails;
                ClearBankDetailsControls();
                ddlAccountType.Focus();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Bank Details", "alert('Customer Bank Details should be less than or equal to 9 Banks');", true);
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Add Bank Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtBankAddress.Text.Length > 300)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Followup Details", "alert('Bank Address Length should be less than or equal to 300');", true);
                tcCustomerMaster.ActiveTabIndex = 2;
                return;
            }
            DataTable dtBankDetails = (DataTable)ViewState["DetailsTable"];
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            DataRow[] drDefault = dtBankDetails.Select("IsDefaultAccount = 'True' and BankMapping_ID <> '" + hdnBankId.Value + "'");
            if (drDefault.Length > 0 && chkDefaultAccount.Checked)
            {
                Utility.FunShowAlertMsg(this, "Only one Default Account is applicable to particular Customer");
                return;
            }

            DataRow[] drDefaultBranch = dtBankDetails.Select("Account_Number = '" + txtAccountNumber.Text.Trim() + "' and BankMapping_ID <> '" + hdnBankId.Value + "'");
            if (drDefaultBranch.Length > 0)
            {
                Utility.FunShowAlertMsg(this, "Account Number must be Unique");
                txtAccountNumber.Focus();
                return;
            }
            //DataRow[] drDefaultBranch = dtBankDetails.Select("Branch_Name = '" + txtBankBranch.Text.Trim() + "' and BankMapping_ID <> '" + hdnBankId.Value + "'");
            //if (drDefaultBranch.Length > 0)
            //{
            //    Utility.FunShowAlertMsg(this, "Branch Name must be Unique");
            //    txtAccountNumber.Focus();
            //    return;
            //}
            // To Check Same Account Number,Bank Name and Branch
            DataRow[] drDefaultCheck = dtBankDetails.Select("Account_Number = '" + txtAccountNumber.Text.Trim() + "' and Bank_ID = '" + txtBankName.SelectedValue + "' and Branch_ID = '" + ddlBankBranch.SelectedValue.Trim() + "' and BankMapping_ID <> '" + hdnBankId.Value + "'");
            if (drDefaultCheck.Length > 0)
            {
                Utility.FunShowAlertMsg(this, "Same Combination already exists aginst Account Number,Branch and Branch Name");
                txtAccountNumber.Focus();
                return;
            }

            DataView dvBankdetails = dtBankDetails.DefaultView;
            dvBankdetails.Sort = "BankMapping_ID";
            int rowindex = dvBankdetails.Find(hdnBankId.Value);
            dvBankdetails[rowindex].Row["AccountType"] = ddlAccountType.SelectedItem.Text;
            dvBankdetails[rowindex].Row["AccountType_ID"] = ddlAccountType.SelectedItem.Value;
            dvBankdetails[rowindex].Row["Account_Number"] = txtAccountNumber.Text.Trim();
            dvBankdetails[rowindex].Row["Bank_ID"] = txtBankName.SelectedValue;
            dvBankdetails[rowindex].Row["Bank_Name"] = txtBankName.SelectedText.Trim();
            dvBankdetails[rowindex].Row["Branch_ID"] = ddlBankBranch.SelectedValue;
            dvBankdetails[rowindex].Row["Branch_Name"] = ddlBankBranch.SelectedItem.Text.Trim();
            dvBankdetails[rowindex].Row["IFSC_Code"] = txtIFSC_Code.Text.Trim();
            //if (ddlPANum.SelectedIndex > 0)
            //    dvBankdetails[rowindex].Row["PANum"] = ddlPANum.SelectedValue;
            //if (ddlSANum.SelectedIndex > 0)
            //    dvBankdetails[rowindex].Row["SANum"] = ddlSANum.SelectedValue;
            dvBankdetails[rowindex].Row["MICR_Code"] = txtMICRCode.Text.Trim();
            dvBankdetails[rowindex].Row["Bank_Address"] = txtBankAddress.Text.Trim();
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            dvBankdetails[rowindex].Row["IsDefaultAccount"] = chkDefaultAccount.Checked;
            grvBankDetails.DataSource = dvBankdetails;
            grvBankDetails.DataBind();
            FunPriHideBankColumns();
            ViewState["DetailsTable"] = dvBankdetails.Table;
            ClearBankDetailsControls();
            btnAdd.Enabled_True();
            btnModify.Enabled_False();
            ddlAccountType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Modify the Bank Details";
            cvCustomerMaster.IsValid = false;

        }
    }

    protected void ClearBankDetailsControls()
    {
        try
        {
            ddlAccountType.SelectedIndex = 0;
            txtAccountNumber.Text = "";
            txtBankName.Clear();
            ddlBankBranch.SelectedIndex = -1;
            txtMICRCode.Text = "";
            txtBankAddress.Text = "";
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            chkDefaultAccount.Checked = false;

            txtIFSC_Code.Text = string.Empty;
            //if (ddlSANum.Items.Count > 0)
            //    ddlSANum.Items.Clear();
            //ddlPANum.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void btnBnkClear_Click(object sender, EventArgs e)
    {
        try
        {

            ddlAccountType.SelectedIndex = 0;
            txtAccountNumber.Text = "";
            txtBankName.Clear();
            ddlBankBranch.SelectedIndex = -1;
            txtMICRCode.Text = "";
            txtBankAddress.Text = "";
            hdnBankId.Value = "";
            btnAdd.Enabled_True();
            btnModify.Enabled_False();
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            chkDefaultAccount.Checked = false;

            txtIFSC_Code.Text = string.Empty;
            ddlAccountType.Focus();
            //if (ddlSANum.Items.Count > 0)
            //    ddlSANum.Items.Clear();
            //ddlPANum.SelectedIndex = -1;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Unable to Clear the Data in Bank Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void grvBankDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (strMode != "Q")
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    /* For Deleting purpose, Restrcit to add attribute to the Cell Remove linkbutton*/
                    for (int intCellIndex = 0; intCellIndex < e.Row.Cells.Count - 2; intCellIndex++)
                    {
                        e.Row.Cells[intCellIndex].Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink
                        (this.grvBankDetails, "Select$" + e.Row.RowIndex);
                    }
                    e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
                    e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);";

                }
            }
            if (strMode == "Q" && e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox lblBankAddress = e.Row.FindControl("lblBankAddress") as TextBox;
                lblBankAddress.Enabled = true;
                lblBankAddress.ReadOnly = true;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Load the Bank Details");
        }
    }

    protected void grvBankDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtDelete = (DataTable)ViewState["DetailsTable"];
            dtDelete.Rows.RemoveAt(e.RowIndex);
            grvBankDetails.DataSource = dtDelete;
            grvBankDetails.DataBind();
            FunPriHideBankColumns();
            ViewState["DetailsTable"] = dtDelete;
            ClearBankDetailsControls();
            if (grvBankDetails.Rows.Count == 0)
            {
                btnAdd.Enabled_True();
                btnModify.Enabled_False();
            }
            ddlAccountType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Remove Bank Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void grvBankDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            Label lblBankMappingId = grvBankDetails.SelectedRow.FindControl("lblBankMappingId") as Label;
            Label lblMasterId = grvBankDetails.SelectedRow.FindControl("lblMasterId") as Label;
            Label lblAccountType = grvBankDetails.SelectedRow.FindControl("lblAccountType") as Label;
            Label lblAccountTypeId = grvBankDetails.SelectedRow.FindControl("lblAccountTypeId") as Label;
            TextBox lblBankAddress = grvBankDetails.SelectedRow.FindControl("lblBankAddress") as TextBox;
            Label lblBank_ID = grvBankDetails.SelectedRow.FindControl("lblBank_ID") as Label;
            Label lblBranch_ID = grvBankDetails.SelectedRow.FindControl("lblBranch_ID") as Label;
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            CheckBox chkGridDefaultAccount = grvBankDetails.SelectedRow.FindControl("chkDefaultAccount") as CheckBox;

            ddlAccountType.SelectedValue = lblAccountTypeId.Text;
            if (grvBankDetails.SelectedRow.Cells[5].Text != "&nbsp;")
                txtAccountNumber.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[5].Text);
            if (grvBankDetails.SelectedRow.Cells[9].Text != "&nbsp;")
                txtMICRCode.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[9].Text);
            if (grvBankDetails.SelectedRow.Cells[10].Text != "&nbsp;")
            {
                txtBankName.SelectedValue = Convert.ToString(lblBank_ID.Text.Trim());
                txtBankName.SelectedText = Convert.ToString(grvBankDetails.SelectedRow.Cells[10].Text);
            }
            if (grvBankDetails.SelectedRow.Cells[11].Text != "&nbsp;")
            {
                PopulateBankBranchList(Convert.ToString(lblBank_ID.Text.Trim()));
                ddlBankBranch.SelectedValue = Convert.ToString(lblBranch_ID.Text.Trim());
            }
            txtBankAddress.Text = lblBankAddress.Text;
            hdnBankId.Value = lblBankMappingId.Text;
            /*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            chkDefaultAccount.Checked = chkGridDefaultAccount.Checked;
            if (grvBankDetails.SelectedRow.Cells[6].Text != "&nbsp;")
                txtIFSC_Code.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[6].Text);//IFSC Code
            //ddlPANum.SelectedIndex = -1;
            //if (!string.IsNullOrEmpty(grvBankDetails.SelectedRow.Cells[7].Text))
            //{
            //    if (grvBankDetails.SelectedRow.Cells[7].Text != "&nbsp;")
            //        ddlPANum.SelectedValue = Convert.ToString(grvBankDetails.SelectedRow.Cells[7].Text);
            //}
            //ddlSANum.Items.Clear();
            //if (!string.IsNullOrEmpty(grvBankDetails.SelectedRow.Cells[8].Text))
            //{
            //    if (grvBankDetails.SelectedRow.Cells[8].Text != "&nbsp;")
            //    {
            //        ddlPANum_SelectedIndexChanged(null, null);
            //        ddlSANum.SelectedValue = Convert.ToString(grvBankDetails.SelectedRow.Cells[8].Text);
            //    }
            //}
            btnAdd.Enabled_False();
            btnModify.Enabled_True();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem,Unable to view the Bank Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    #endregion

    protected void asyncFileUpload_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {

    }

    private void FunPriCopyCommuncationAddress()
    {

        //if (txtPerState.Items.Contains(new ListItem((txtComState.SelectedItem.Text), (txtComState.SelectedItem.Text))))// && txtComState.SelectedItem.Text.Trim() != "")
        //{
        //    txtPerState.Items.Add(new ListItem((txtComState.SelectedItem.Text), (txtComState.SelectedItem.Text)));
        //}

        //if (txtPerCountry.Items.Contains(new ListItem((txtComCountry.SelectedItem.Text), (txtComCountry.SelectedItem.Text))))// && txtComCountry.SelectedItem.Text.Trim() != "")
        //{
        //    txtPerCountry.Items.Add(new ListItem((txtComCountry.SelectedItem.Text), (txtComCountry.SelectedItem.Text)));
        //}        
        //txtPerAddress1.Text = txtComAddress1.Text;
        //txtPerAddress2.Text = txtCOmAddress2.Text;        
        //txtPerCity.SelectedValue = txtComCity.SelectedValue;       
        //if (txtComState.SelectedItem.Value == "0")
        //{
        //    txtPerState.SelectedIndex = 0;
        //}
        //else
        //{
        //    txtPerState.SelectedValue = txtComState.SelectedValue;
        //}

        //if (txtComCountry.SelectedItem.Value == "0")
        //{
        //    txtPerCountry.SelectedIndex = 0;
        //}
        //else
        //{
        //    txtPerCountry.SelectedItem.Text = txtComCountry.SelectedItem.Text;
        //}
        //txtPerTelephone.Text = txtComTelephone.Text;
        //txtPerPincode.Text = txtComPincode.Text;
        //txtPerMobile.Text = txtComMobile.Text;
        //txtPerEmail.Text = txtComEmail.Text;
        //txtPerWebSite.Text = txtComWebsite.Text;
    }

    protected void btnCopyAddress_Click(object sender, EventArgs e)
    {
        FunPriCopyCommuncationAddress();
    }
    protected void gvCredit_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (gvCredit.DataSource != null && ((DataTable)gvCredit.DataSource).Rows.Count > 0)
        {
            if (e.Row.Cells[1] != null && e.Row.Cells[1].Text != string.Empty)
            {
                e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Right;
            }
            if (e.Row.Cells[2] != null && e.Row.Cells[2].Text != string.Empty)
            {
                e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            }
            if (e.Row.Cells[3] != null && e.Row.Cells[3].Text != string.Empty)
            {
                e.Row.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            }
            if (e.Row.Cells[4] != null && e.Row.Cells[4].Text != string.Empty)
            {
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            }


        }

    }


    private void FunPriLoadEnquiryDetails(int intEnquiryNumber)
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());
        Procparam.Add("@EnquiryResponse_ID", intEnquiryNumber.ToString());
        DataTable dt = Utility.GetDefaultData("S3G_ORG_GETENQUIRYDETAILSFORPRICING", Procparam);
        txt_CUSTOMER_NAME.Text = dt.Rows[0]["Customer_Name"].ToString();
        //txtComAddress1.Text = dt.Rows[0]["Address"].ToString();
        //txtCOmAddress2.Text = dt.Rows[0]["Address2"].ToString();        
        //txtComCity.SelectedValue = dt.Rows[0]["City"].ToString();
        //txtComTelephone.Text = dt.Rows[0]["TELNO"].ToString();
        //txtComWebsite.Text = dt.Rows[0]["WEBSITE"].ToString();        
        //txtComState.SelectedValue = txtComState.Items.FindByText(dt.Rows[0]["State"].ToString()).Value;
        //txtComCountry.SelectedItem.Text = dt.Rows[0]["Country"].ToString();
        //txtComCountry.SelectedValue = txtComCountry.Items.FindByText(dt.Rows[0]["Country"].ToString()).Value;
        //txtPerCountry.SelectedItem.Text = dt.Rows[0]["Country"].ToString();
        //txtPerCountry.SelectedValue = txtComCountry.Items.FindByText(dt.Rows[0]["Country"].ToString()).Value;       
        //txtComPincode.Text = dt.Rows[0]["PINCode_ZipCode"].ToString();
        //txtComMobile.Text = dt.Rows[0]["Mobile"].ToString();
        //txtComEmail.Text = dt.Rows[0]["EMail"].ToString();
        ddlConstitutionName.SelectedValue = dt.Rows[0]["Constitution_ID"].ToString();
        chkCustomer.Checked = true;
        ddlConstitutionName_OnSelectedIndexChanged(this, new EventArgs());
    }


    #region ""

    protected void btnBrowse_OnClick(object sender, EventArgs e)
    {
        int intRowIndex = Utility.FunPubGetGridRowID("gvConstitutionalDocuments", ((Button)sender).ClientID);
        //string strPath = string.Empty;
        //string strNewFileName = string.Empty;
        //FileUpload flUpload2 = (FileUpload)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("flUpload");
        //TextBox txtFileupld = (TextBox)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("txtFileupld");
        //LinkButton lblActualPath = (LinkButton)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("hlnkView");
        //Label lblPathF = (Label)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("lblActualPath");

        //if (strDocpath == string.Empty || strDocpath == null)
        //{
        //    //Utility.FunShowValidationMsg(this, "ORG_CUST", 5);
        //    Utility.FunShowAlertMsg(this, "Constitution Path not defined");
        //    return;
        //}

        //if (flUpload2.HasFile)
        //{
        //    strNewFileName = flUpload2.FileName;
        //    lblActualPath.Text = txtFileupld.Text = flUpload2.FileName;
        //    flUpload2.ToolTip = lblActualPath.Text;

        //    if (strDocpath != "")
        //    {
        //        strPath = Path.Combine(strDocpath, ddlCustomerType.SelectedValue + "/" + ddlConstitutionName.SelectedValue + "/" + "COMPANY" + intCompanyId.ToString() + "/" + "Constitution-" + 1.ToString());
        //        if (Directory.Exists(strPath))
        //        {
        //            Directory.Delete(strPath, true);
        //        }
        //        Directory.CreateDirectory(strPath);
        //        strPath = strPath + "/" + strNewFileName;
        //    }
        //    strCurrentFilePath = lblPathF.Text = strPath;
        //    FileInfo f1 = new FileInfo(strPath);

        //    if (f1.Exists == true)
        //        f1.Delete();
        //    flUpload2.SaveAs(strPath);
        //    //FileUpload t = (FileUpload)(gvConstitutionalDocuments.Rows[intRowIndex].Cells[1].FindControl("flUpload"));
        //    //t.Focus();
        //    //flUpload2.Focus();

        //}
        //else
        //{
        //    Utility.FunShowAlertMsg(this, "No HashFile");
        //}
        HttpFileCollection hfc = Request.Files;
        for (int i = 0; i < hfc.Count; i++)
        {
            HttpPostedFile hpf = hfc[i];
            if (hpf.ContentLength > 0)
            {
                CheckBox chkScanned = (CheckBox)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("chkScanned");
                HiddenField hdnSelectedPath = (HiddenField)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("hdnSelectedPath");
                FileUpload flUpload = (FileUpload)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("flUpload");
                Label lblActualPath = (Label)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("lblActualPath");
                TextBox txtFileupld = (TextBox)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("txtFileupld");
                Label lblActualDocument_Path = (Label)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("lblActualDocument_Path");
                LinkButton hlnkView = (LinkButton)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("hlnkView");
                //chkSelect.Checked = true;
                //chkScanned.ToolTip = flUpload.ToolTip = hdnSelectedPath.Value;
                lblActualPath.Text = hpf.FileName;
                txtFileupld.Text = hpf.FileName;
                string strViewst = "File" + intRowIndex.ToString();
                Cache[strViewst] = hpf;
                string strNewFileName = @"\COMPANY" + intCompanyId.ToString();
                string strPath = "";
                strPath = strNewFileName;
                strPath = Convert.ToString(ViewState["ConsDocPath"]) + strNewFileName;
                if (!Directory.Exists(strPath))
                {
                    Directory.CreateDirectory(strPath);
                }

                if (hpf != null)
                {
                    strPath += @"\" + System.IO.Path.GetFileName(hpf.FileName).Split('.')[0].ToString() + DateTime.Now.ToLocalTime().ToString().Replace(" ", "").Replace("/", "").Replace(":", "") + "." + System.IO.Path.GetFileName(hpf.FileName).Split('.')[1].ToString();
                    lblActualPath.Text = strPath;
                    lblActualPath.Visible = true;
                    hlnkView.Enabled = true;
                    lblActualDocument_Path.Text = strPath;
                    hpf.SaveAs(strPath);
                }
                else
                {
                    lblActualPath.Visible = false;
                    hlnkView.Enabled = false;
                }
            }
        }
    }

    protected void chkScanned_CheckedChanged(object sender, EventArgs e)
    {
        int intRowIndex = Utility.FunPubGetGridRowID("gvConstitutionalDocuments", ((CheckBox)sender).ClientID);
        CheckBox chkScanned = (CheckBox)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("chkScanned");
        Label lblActualPath = (Label)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("lblActualPath");
        Label lblActualDocument_Path = (Label)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("lblActualDocument_Path");
        TextBox txtFileupld = (TextBox)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("txtFileupld");
        //Button btnBrowse = (Button)gvConstitutionalDocuments.Rows[intRowIndex].FindControl("btnBrowse");
        if (!chkScanned.Checked)
        {
            lblActualPath.Text = lblActualDocument_Path.Text =
               txtFileupld.Text = string.Empty;
        }
    }

    protected void FunProUploadFilesNew()
    {
        try
        {
            for (int i = 0; i <= gvConstitutionalDocuments.Rows.Count - 1; i++)
            {
                string strViewst = "File" + i.ToString();
                CheckBox chkScanned = (CheckBox)gvConstitutionalDocuments.Rows[i].FindControl("chkScanned");
                Label lblCurrentPath = (Label)gvConstitutionalDocuments.Rows[i].FindControl("lblActualPath");

                if (chkScanned.Checked)
                {
                    HttpPostedFile hpf = (HttpPostedFile)Cache[strViewst];
                    string strNewFileName = @"\COMPANY" + intCompanyId.ToString();
                    string strPath = "";
                    strPath = strNewFileName;
                    strPath = Convert.ToString(ViewState["ConsDocPath"]) + strNewFileName;
                    if (!Directory.Exists(strPath))
                    {
                        Directory.CreateDirectory(strPath);
                    }

                    if (hpf != null)
                    {
                        strPath += @"\" + System.IO.Path.GetFileName(hpf.FileName).Split('.')[0].ToString() + DateTime.Now.ToLocalTime().ToString().Replace(" ", "").Replace("/", "").Replace(":", "") + "." + System.IO.Path.GetFileName(hpf.FileName).Split('.')[1].ToString();
                        lblCurrentPath.Text = strPath;
                        hpf.SaveAs(strPath);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriUploadFiles()
    {
        try
        {


            foreach (GridViewRow grv in gvConstitutionalDocuments.Rows)
            {
                AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = (AjaxControlToolkit.AsyncFileUpload)grv.FindControl("asyFileUpload");
                TextBox txOD = grv.FindControl("txOD") as TextBox;

                if (AsyncFileUpload1.FileName != "")
                {
                    FileInfo fileInfo = new FileInfo(AsyncFileUpload1.FileName);
                    if (AsyncFileUpload1.HasFile)
                    {

                        string strNewFileName = @"\COMPANY" + intCompanyId.ToString();
                        string strPath = "";
                        //if (txOD.Text != "")
                        //{
                        strPath = strNewFileName;
                        strPath = Convert.ToString(ViewState["ConsDocPath"]) + strNewFileName;
                        if (!Directory.Exists(strPath))
                        {
                            Directory.CreateDirectory(strPath);
                        }

                        strPath += @"\" + AsyncFileUpload1.FileName.Split('.')[0].ToString() + DateTime.Now.ToLocalTime().ToString().Replace(" ", "").Replace("/", "").Replace(":", "") + "." + AsyncFileUpload1.FileName.Split('.')[1].ToString();
                        //}
                        txOD.Text = strPath;

                        AsyncFileUpload1.SaveAs(strPath);
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("PRDD Master Document Path does not exist");
        }
    }

    protected void FunProClearCaches()
    {
        for (int i = 0; i <= gvConstitutionalDocuments.Rows.Count - 1; i++)
        {
            string strViewst = "File" + i.ToString();
            if (Cache[strViewst] != null)
            {
                Cache.Remove(strViewst);
            }
        }
    }

    //protected void FunSetCompanyCountryName()
    //{

    //    Procparam = new Dictionary<string, string>();
    //    Procparam.Add("@Param1", intCompanyId.ToString());
    //    Procparam.Add("@Option", "1000");
    //    DataTable dt = Utility.GetDefaultData("S3G_ORG_GetCustomerLookUp", Procparam);
    //    if (dt.Rows.Count > 0)
    //    {
    //        txtPerCountry.Text = txtComCountry.Text = dt.Rows[0]["COUNTRY"].ToString();
    //    }
    //}
    #endregion

    protected void grvCustSubLimit_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                Label lblSerialNo = grvCustSubLimit.FooterRow.FindControl("lblSerialNo") as Label;
                DropDownList ddlEntityTypeF = grvCustSubLimit.FooterRow.FindControl("ddlLobF") as DropDownList;
                TextBox txtLimitF = grvCustSubLimit.FooterRow.FindControl("txtLimitF") as TextBox;
                TextBox txtCutOffDateF = grvCustSubLimit.FooterRow.FindControl("txtCutOffDateF") as TextBox;
                if (!UserFunctionCheck("CMAX_LIMIT"))
                {
                    Utility.FunShowAlertMsg(this, "User does not have Rights to Alter the Limits");
                    return;
                }
                FunPriInsertCustSubLimit(lblSerialNo.Text, ddlEntityTypeF.SelectedValue, ddlEntityTypeF.SelectedItem.Text, txtLimitF.Text.Trim(), txtCutOffDateF.Text.Trim(),"1");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }


    protected void grvCustSubLimit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            if (!UserFunctionCheck("CMAX_LIMIT"))
            {
                Utility.FunShowAlertMsg(this, "User does not have Rights to Alter the Limits");
                return;
            }

            dtCustSubLimit = FunPriGetSubLimitDataTable();
            if (dtCustSubLimit.Rows.Count == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "There should be atleast one row in the grid");
                return;
            }
            dtCustSubLimit.Rows.RemoveAt(e.RowIndex);
            ViewState["CUST_SUBLIMIT"] = dtCustSubLimit;
            FunPriFillGrid();
            if (dtCustSubLimit.Rows.Count > 0)
                txtMaxLenLimit.Text = dtCustSubLimit.Compute("sum(Limit)", "1=1").ToString();
            else
                txtMaxLenLimit.Text = "0.000";
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvCustSubLimit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            grvCustSubLimit.EditIndex = e.NewEditIndex;
            FunPriFillGrid();
            DropDownList ddlEntityTypeE = grvCustSubLimit.Rows[e.NewEditIndex].FindControl("ddlEntityTypeE") as DropDownList;
            TextBox txtCutOffDateE = grvCustSubLimit.Rows[e.NewEditIndex].FindControl("txtCutOffDateE") as TextBox;
            AjaxControlToolkit.CalendarExtender CECutoffDate = grvCustSubLimit.Rows[e.NewEditIndex].FindControl("CalendarExtenderCuttOffDateE") as AjaxControlToolkit.CalendarExtender;
            CECutoffDate.Format = strDateFormat;

            txtCutOffDateE.Attributes.Add("onblur", "fnDoDate(this,'" + txtDOB.ClientID + "','" + strDateFormat + "',true,false);");

            txtCutOffDateE.Text = DateTime.Parse(txtCutOffDateE.Text.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
            FunPubLoadEntityType(ddlEntityTypeE);

            ddlEntityTypeE.SelectedValue = ((DataTable)ViewState["CUST_SUBLIMIT"]).Rows[e.NewEditIndex]["Entity_Id"].ToString();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvCustSubLimit_RowUpdating(object sender, GridViewUpdateEventArgs e)//Added By Sathish
    {
        try
        {
            DataTable dtEditApprDet = (DataTable)ViewState["CUST_SUBLIMIT"];
            int IEditIndex = 0;
            IEditIndex = e.RowIndex;
            DropDownList ddlEntityTypeE = (DropDownList)grvCustSubLimit.Rows[e.RowIndex].FindControl("ddlEntityTypeE");
            TextBox txtLimitAmntE = (TextBox)grvCustSubLimit.Rows[e.RowIndex].FindControl("txtLimitAmntE");
            TextBox txtCutOffDateE = (TextBox)grvCustSubLimit.Rows[e.RowIndex].FindControl("txtCutOffDateE");
            DataTable dt = (DataTable)ViewState["CUST_SUBLIMIT"];
            if (dt.Rows.Count > 0)
            {
                DataRow[] drDupCheck = dt.Select("Entity_Id<>'" + ddlEntityTypeE.SelectedValue + "'");
                if (drDupCheck.Count() > 0)
                {
                    DataRow[] drDupCheck2 = drDupCheck.CopyToDataTable().Select("Entity_Id='" + ddlEntityTypeE.SelectedValue + "'");
                    if (drDupCheck2.Count() > 0)
                    {
                        Utility.FunShowAlertMsg(this, "Supplier already Added");
                        return;
                    }
                }
            }
            dtEditApprDet.Rows[IEditIndex]["Entity_Id"] = ddlEntityTypeE.SelectedValue;
            dtEditApprDet.Rows[IEditIndex]["ENTITY_NAME"] = ddlEntityTypeE.SelectedItem.Text;
            dtEditApprDet.Rows[IEditIndex]["Limit"] = txtLimitAmntE.Text;
            dtEditApprDet.Rows[IEditIndex]["CuttOffDate"] = Utility.StringToDate(txtCutOffDateE.Text);
            ViewState["CUST_SUBLIMIT"] = dtEditApprDet;
            grvCustSubLimit.EditIndex = -1;
            FunPriFillGrid();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvCustSubLimit_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            grvCustSubLimit.EditIndex = -1;
            FunPriFillGrid();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private void FunPriInsertCustSubLimit(string strSno, string strEntityId, string strEntityName, string strEntityLimit, string strCuttoffDate,string strDelStatus)
    {
        try
        {
            //if (strMode == "M")
            //{
            //    if (!UserFunctionCheck("CMAX_LIMIT"))
            //    {
            //        Utility.FunShowAlertMsg(this, "User does not have Rights to Alter the Limits");
            //        return; 
            //    }
                
            //}

            if (strEntityId =="4")
            {
                if (rbnFactoringApplicable.SelectedValue == "2")
                {
                    Utility.FunShowAlertMsg(this, "Selected Line of business only Applicable if Factoring Applicable Select Yes in Factoring Customers Tab");
                    return;
                }
            }
            
            if (strEntityLimit != string.Empty)
            {
                if (Convert.ToDecimal(strEntityLimit) <= 0)
                {
                    Utility.FunShowAlertMsg(this, "Limit should be greater than the Zero");
                    return;
                }
            }

            DataTable dt = (DataTable)ViewState["CUST_SUBLIMIT"];
            if (ViewState["CUST_SUBLIMIT"] != null)
            {
                DataRow[] drDupCheck = dt.Select("Lob_Id='" + strEntityId + "'");
                if (drDupCheck.Count() > 0)
                {
                    Utility.FunShowAlertMsg(this, "Line of Business already Exists");
                    return;
                }
            }

            DataRow drEmptyRow;
            dtCustSubLimit = FunPriGetSubLimitDataTable();
            drEmptyRow = dtCustSubLimit.NewRow();
            drEmptyRow["Serial_Number"] = "0";
            drEmptyRow["Lob_Id"] = strEntityId;
            drEmptyRow["Lob_NAME"] = strEntityName;
            if (strEntityLimit != string.Empty)
                drEmptyRow["Limit"] = Convert.ToDecimal(strEntityLimit);
            if (strCuttoffDate != string.Empty)
                drEmptyRow["CuttOffDate"] = Utility.StringToDate(strCuttoffDate);
            drEmptyRow["DEL_STAT"] = strDelStatus;

            dtCustSubLimit.Rows.Add(drEmptyRow);
            ViewState["CUST_SUBLIMIT"] = dtCustSubLimit;
            FunPriFillGrid();
            if (dtCustSubLimit.Rows.Count > 0)
                txtMaxLenLimit.Text = dtCustSubLimit.Compute("sum(Limit)", "1=1").ToString();
            else
                txtMaxLenLimit.Text = "0.000";

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {

        }
    }
    private void FunPriFillGrid()
    {
        try
        {
            DataTable dtCustSubLimit = (DataTable)ViewState["CUST_SUBLIMIT"];
            grvCustSubLimit.DataSource = dtCustSubLimit;
            grvCustSubLimit.DataBind();
            grvCustSubLimit.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private DataTable FunPriGetSubLimitDataTable()
    {
        try
        {

            if (ViewState["CUST_SUBLIMIT"] == null)
            {
                dtCustSubLimit = new DataTable();
                dtCustSubLimit.Columns.Add("Serial_Number");
                dtCustSubLimit.Columns.Add("Lob_Id");
                dtCustSubLimit.Columns.Add("Lob_NAME");
                dtCustSubLimit.Columns.Add("Limit", System.Type.GetType("System.Decimal"));
                dtCustSubLimit.Columns.Add("CuttOffDate");
                dtCustSubLimit.Columns.Add("DEL_STAT", Type.GetType("System.Int32"));
                ViewState["CUST_SUBLIMIT"] = dtCustSubLimit;
            }
            dtCustSubLimit = (DataTable)ViewState["CUST_SUBLIMIT"];

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        return dtCustSubLimit;

    }

    protected void grvCustSubLimit_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlLOBF = e.Row.FindControl("ddlLOBF") as DropDownList;
                DropDownList lnkAdd = e.Row.FindControl("lnkAdd") as DropDownList;
                TextBox txtCutOffDateF = e.Row.FindControl("txtCutOffDateF") as TextBox;
                txtCutOffDateF.Attributes.Add("onblur", "fnDoDate(this,'" + txtCutOffDateF.ClientID + "','" + strDateFormat + "',false,true);");

                AjaxControlToolkit.CalendarExtender CalendarExtenderCuttOffDate = e.Row.FindControl("CalendarExtenderCuttOffDate") as AjaxControlToolkit.CalendarExtender;
                CalendarExtenderCuttOffDate.Format = strDateFormat;
                //FunPubLoadEntityType(ddlEntityTypeF);
                FunPubLoadLob(ddlLOBF);
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkEdit = e.Row.FindControl("lnkEdit") as LinkButton;
                LinkButton lnkRemove = e.Row.FindControl("lnkRemove") as LinkButton;
                LinkButton lnkAdd = e.Row.FindControl("lnkAdd") as LinkButton;
                TextBox txtCutOffDate = e.Row.FindControl("txtCutOffDate") as TextBox;
                Label lbldelst = e.Row.FindControl("lbldelst") as Label;
                Label lblLobId = e.Row.FindControl("lblLobId") as Label;



                if (strMode == "Q")
                {
                    lnkEdit.Enabled = false;
                    lnkRemove.Enabled = false;
                    lnkAdd.Enabled = false;
                }
                else
                {
                    //Dictionary<string, string> ProParm = new Dictionary<string, string>();
                    //ProParm.Add("@OPTION", "2001");
                    //ProParm.Add("@Param1", intCustomerId.ToString());
                    //ProParm.Add("@Param2", lblLobId.Text);
                    //DataTable dt = Utility.GetDefaultData("S3G_OR_GET_CUSTLOOKUP", ProParm);
                    //if (dt.Rows.Count > 0)
                    //{
                    //    lnkRemove.Enabled = false;
                    //    lnkRemove.OnClientClick = null;
                    //}
                }
                if (txtCutOffDate.Text != string.Empty)
                {
                    txtCutOffDate.Text = DateTime.Parse(txtCutOffDate.Text.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    public void FunPubLoadEntityType(DropDownList ddlCommon)
    {
        Dictionary<string, string> ProParm = new Dictionary<string, string>();
        ProParm.Add("@COMPANY_ID", "1");
        ddlCommon.BindDataTable("S3G_ORG_GET_ENTITY", ProParm, new string[] { "ID", "NAME" });

    }
    public void FunPubLoadLob(DropDownList ddlCommon)
    {
        Dictionary<string, string> strProcparam = new Dictionary<string, string>();
        //if (intCustomerId == 0)
        //{
        //    strProcparam.Add("@Is_Active", "1");
        //}
        strProcparam.Add("@Is_Active", "1");
        strProcparam.Add("@User_Id", intUserId.ToString());
        strProcparam.Add("@Company_ID", intCompanyId.ToString());
        strProcparam.Add("@Program_Id", "45");
        strProcparam.Add("@Consitution_Id", ddlConstitutionName.SelectedValue);
        ddlCommon.BindDataTable("S3G_SA_Get_LOBLst", strProcparam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });

    }
    public void txtLimitAmnt_OntextChanged(object sender, EventArgs e)
    {
        TextBox txtAmount = (TextBox)sender;
        if (Convert.ToDecimal(txtAmount.Text) <= 0)
        {
            Utility.FunShowAlertMsg(this, "Amount Should be greater than Zero");
            txtAmount.Text = string.Empty;
            return;
        }
    }
    public void OntxtPercentageStake(object sender, EventArgs e)
    {
        StaffUpdation();
    }

    private void StaffUpdation()
    {
        //txtnobranch.Text = "0";

        if (txtPercentageStake.Text != string.Empty)
        {
            if (txtJVPartnerStake.Text != string.Empty)
                txtnobranch.Text = (Convert.ToInt32(txtPercentageStake.Text) + Convert.ToInt32(txtJVPartnerStake.Text)).ToString();
            else
                txtnobranch.Text = Convert.ToInt32(txtPercentageStake.Text).ToString();
        }
        else
        {
            if (txtJVPartnerStake.Text != string.Empty)
                txtnobranch.Text = Convert.ToInt32(txtJVPartnerStake.Text).ToString();
            else
                txtnobranch.Text = "";
        }
    }

    public void OntxtJVPartnerStake(object sender, EventArgs e)
    {
        StaffUpdation();
    }
    // Added By R. Manikandan CBO Related CR
    protected void FunGetCity()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", "1");
        Procparam.Add("@Category", "1");
        Procparam.Add("@PrefixText", "");
        //txtComCity.BindDataTable("S3G_SYSAD_GetAddressLoodup_AGT", Procparam, true, "-- Select --", new string[] { "ID", "NAME" });
        //txtPerCity.BindDataTable("S3G_SYSAD_GetAddressLoodup_AGT", Procparam, true, "-- Select --", new string[] { "ID", "NAME" });
    }
    protected void FunGetIndustryCode()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", "1");
        cmbIndustryCode.ClearSelection();
        cmbIndustryCode.BindDataTable("OR_GET_INDUSTRYCODE", Procparam, new string[] { "ID", "NAME" });

    }
    protected void FunGetSubIndustryCode()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", "1");
        Procparam.Add("@INDUSTRY_ID", cmbIndustryCode.SelectedValue);
        cmbsub.BindDataTable("OR_GET_SUBINDUSTRYCODE", Procparam, new string[] { "ID", "NAME" });
    }
    //protected void FunGetConstitutionName()
    //{
    //    Procparam = new Dictionary<string, string>();
    //    Procparam.Clear();
    //    Procparam.Add("@Company_ID", "1");
    //    Procparam.Add("@INDUSTRY_ID", cmbIndustryCode.SelectedValue);
    //    DataTable dtAddr = Utility.GetDefaultData("OR_GET_SUBINDUSTRYCODE", Procparam);

    //    //DataTable dtSource = new DataTable();
    //    //cmbIndustryCode.BindDataTable("OR_GET_INDUSTRYCODE", Procparam, true, "-- Select --", new string[] { "ID", "NAME" });
    //    ddlConstitutionName.FillDataTable(dtAddr, "ID", "NAME", true);
    //}


    #endregion

    #region cmbIndustryCode_SelectedIndexChanged(object sender, EventArgs e)
    protected void cmbIndustryCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunGetSubIndustryCode();
        NameChange(null, null);
        cmbsub.Focus();
    }
    #endregion

    #region Griview grvShars Mthods
    protected void grvShars_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddNew")
            {
                TextBox txtFSholderName = (TextBox)grvShars.FooterRow.FindControl("txtFSholderName");
                TextBox txtFSHARE_HOLDER_NO = (TextBox)grvShars.FooterRow.FindControl("txtFSHARE_HOLDER_NO");
                UserControls_S3GAutoSuggest ddlFSHARE_HOLDER_NATION = (UserControls_S3GAutoSuggest)grvShars.FooterRow.FindControl("ddlFSHARE_HOLDER_NATION");
                TextBox txtFSHARE_HOLDER_PERC = (TextBox)grvShars.FooterRow.FindControl("txtFSHARE_HOLDER_PERC");
                if (!(ddlFSHARE_HOLDER_NATION.SelectedValue != "0"))
                {
                    Utility.FunShowAlertMsg(this, "Select Share Holder Nationality");
                    ddlFSHARE_HOLDER_NATION.Focus();
                    return;
                }
                Label lblSNO = (Label)grvShars.FindControl("lblSNO");
                DataRow dr = null;
                DataTable dtShars = (DataTable)ViewState["SharsDetails"];
                if (dtShars.Rows.Count > 0)
                {
                    decimal decTotalCheck = Convert.ToDecimal(dtShars.Compute("SUM(SHARE_HOLDER_PERC)", ""));
                    if (decTotalCheck > 0 && decTotalCheck + Convert.ToDecimal(txtFSHARE_HOLDER_PERC.Text.Trim()) > Convert.ToDecimal(100))
                    {
                        Utility.FunShowAlertMsg(this, "Share Holder Percentage should not exceed more than 100%");
                        grvShars.FooterRow.FindControl("txtFSholderName").Focus();
                        return;
                    }
                    DataRow[] drDefaultBranch = dtShars.Select("SHARE_HOLDER_NO = '" + txtFSHARE_HOLDER_NO.Text.Trim() + "'");
                    if (drDefaultBranch.Length > 0)
                    {
                        Utility.FunShowAlertMsg(this, "Share Holders ID No must be Unique");
                        txtFSHARE_HOLDER_NO.Focus();
                        return;
                    }
                }
                else
                {
                    if (Convert.ToDecimal(txtFSHARE_HOLDER_PERC.Text.Trim()) > Convert.ToDecimal(100))
                    {
                        Utility.FunShowAlertMsg(this, "Share Holder Percentage should not exceed more than 100%");
                        grvShars.FooterRow.FindControl("txtFSholderName").Focus();
                        return;
                    }
                }

                if (txtFSholderName.Text == string.Empty)
                {
                    txtFSholderName.Focus();
                    Utility.FunShowAlertMsg(this, "Enter the Share holder Name");
                    return;
                }
                dr = dtShars.NewRow();
                dr["SNO"] = dtShars.Rows.Count + 1;
                dr["SHARE_HOLDER_NAME"] = txtFSholderName.Text.Trim().ToUpper();
                dr["SHARE_HOLDER_NO"] = txtFSHARE_HOLDER_NO.Text.Trim().ToUpper();
                dr["SHARE_HOLDER_NATION"] = ddlFSHARE_HOLDER_NATION.SelectedText.Trim().ToUpper();
                dr["SHARE_HOLDER_NATION_ID"] = ddlFSHARE_HOLDER_NATION.SelectedValue;
                dr["SHARE_HOLDER_PERC"] = Convert.ToDecimal(txtFSHARE_HOLDER_PERC.Text.Trim());
                dtShars.Rows.Add(dr);
                grvShars.DataSource = dtShars;
                grvShars.DataBind();
                ViewState["SharsDetails"] = dtShars;
                decimal decTotal = Convert.ToDecimal(dtShars.Compute("SUM(SHARE_HOLDER_PERC)", ""));
                FunPubAddSummary(false, decTotal);
                grvShars.FooterRow.FindControl("txtFSholderName").Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {
        }
    }

    protected void grvShars_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtDelete = (DataTable)ViewState["SharsDetails"];
            dtDelete.Rows.RemoveAt(e.RowIndex);
            if (dtDelete.Rows.Count > 0)
            {
                grvShars.DataSource = dtDelete;
                grvShars.DataBind();
                ViewState["SharsDetails"] = dtDelete;
            }
            else
            {
                FunPubBindSharsGrid();
            }
            grvShars.FooterRow.FindControl("txtFSholderName").Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    #endregion

    #region FunPubBindSharsGrid()
    private void FunPubBindSharsGrid()
    {
        try
        {
            DataTable dtUsers = new DataTable();
            DataRow dr;
            dtUsers.Columns.Add("SNO");
            dtUsers.Columns.Add("SHARE_HOLDER_NAME");
            dtUsers.Columns.Add("SHARE_HOLDER_NO");
            dtUsers.Columns.Add("SHARE_HOLDER_NATION");
            dtUsers.Columns.Add("SHARE_HOLDER_NATION_ID");
            dtUsers.Columns.Add("SHARE_HOLDER_PERC", typeof(decimal));
            dr = dtUsers.NewRow();
            dtUsers.Rows.Add(dr);
            grvShars.DataSource = dtUsers;
            grvShars.DataBind();
            dtUsers.Rows[0].Delete();
            ViewState["SharsDetails"] = dtUsers;
            grvShars.Rows[0].Visible = false;
            FunPubAddSummary(false, Convert.ToDecimal(0.00));
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    #endregion

    #region FunPubBindAddsGrid()
    private void FunPubBindAddsGrid()
    {
        try
        {
            DataTable dtadds = new DataTable();
            DataRow dr;
            dtadds.Columns.Add("CUST_ADD_MAPPING_ID");
            dtadds.Columns.Add("CUST_ADDRESS_ID");
            dtadds.Columns.Add("CUST_ADDRESS_TYPE_ID");
            dtadds.Columns.Add("CUST_ADDRESS_TYPE");
            dtadds.Columns.Add("POSTAL_CODE_TEXT");
            dtadds.Columns.Add("POSTAL_CODE_VALUE");
            dtadds.Columns.Add("POST_BOX_NO");
            dtadds.Columns.Add("WAY_NO");
            dtadds.Columns.Add("HOUSE_NO");
            dtadds.Columns.Add("BLOCK_NO");
            dtadds.Columns.Add("FLAT_NO");
            dtadds.Columns.Add("LANDMARK");
            dtadds.Columns.Add("AREA_SHEIK");
            //dtadds.Columns.Add("Area_Sheik_Value");
            dtadds.Columns.Add("RESIDENCE_PHONE_NO");
            dtadds.Columns.Add("RESIDENCE_FAX_NO");
            dtadds.Columns.Add("MOBILE_PHONE_NO");
            dtadds.Columns.Add("CONTACT_NAME");
            dtadds.Columns.Add("CONTACT_NO");
            dtadds.Columns.Add("OFFICE_PHONE_NO");
            dtadds.Columns.Add("OFFICE_FAX_NO");
            dtadds.Columns.Add("CUST_EMAIL");
            dr = dtadds.NewRow();
            dtadds.Rows.Add(dr);
            grvAddressDetails.DataSource = dtadds;
            grvAddressDetails.DataBind();
            dtadds.Rows[0].Delete();
            ViewState["AddsDetailsTable"] = dtadds;
            grvAddressDetails.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }
    #endregion
    //private void funPriLoadNationality()
    //{
    //    try
    //    {
    //        Dictionary<string, string> Procparam = new Dictionary<string, string>();
    //        Procparam.Add("@Company_ID", intCompanyId.ToString());
    //        Procparam.Add("@Lookup_Type", "NATIONALITY");
    //        Procparam.Add("@Table_Name", "S3G_ORG_GROUP_INDUSTRY_TYPE");
    //        ddlNationality.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, true, "--Select--", new string[] { "LOOKUP_CODE", "LOOKUP_CODE", "DESCRIPTION" });
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //    }
    //}

    protected void ddlNationality_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        txtNRID.Text = string.Empty;
        //ClearNames();
        NationalityBind();
        ddlConstitutionName.Focus();
    }

    private void NationalityBind()
    {
        try
        {
            string strValue = @"\";
            if (ddlCustomerType.SelectedItem.Text.Trim().ToUpper() == "INDIVIDUAL")
            {
                txtIdentityColumn.AutoPostBack = false;
                txtIdentityIssueDate.AutoPostBack = true;
                string[] strCustomerDetails = ddlNationality.SelectedText.Trim().Split('-');
                if (strCustomerDetails[0].Trim() == "100")//Oman//ddlNationality.SelectedText.Trim().ToUpper().ToUpper().Contains("OMAN") || Bahrain,Kuwait,Qatar,ARABIA
                {
                    lblIdentityColumn.Text = "N.ID. Number";
                    lblIdentityColumn.ToolTip = "N.ID. Number";
                    lblIdentityColumn.Attributes.Add("title", "N.ID. Number");
                    txtIdentityColumn.ToolTip = "N.ID. Number";
                    rfvIdentityColumn.ErrorMessage = "Enter N.ID. Number";
                    lblIdentityIssueDate.Text = "N.ID. Issue Date";
                    lblIdentityIssueDate.ToolTip = "N.ID. Issue Date";
                    txtIdentityIssueDate.ToolTip = "N.ID. Issue Date";
                    lblIdentityExpiredate.Text = "N.ID. Expiry Date";
                    lblIdentityExpiredate.ToolTip = "N.ID. Expiry Date";
                    txtIdentityExpiredate.ToolTip = "N.ID. Expiry Date";
                    rfvIdentityIssueDate.ErrorMessage = "Enter N.ID. Issue Date";
                    rfvIdentityExpiredate.ErrorMessage = "Enter N.ID. Expiry Date";
                    txtIdentityColumn.MaxLength = 12;
                    RevIdentityColumn.Enabled = true;
                    RevCRNUMBERVal.Enabled = false;
                    EnabledNationality(false);
                }
                else if (strCustomerDetails[0].Trim() == "419" || strCustomerDetails[0].Trim() == "443"
                    || strCustomerDetails[0].Trim() == "453" || strCustomerDetails[0].Trim() == "456")//Oman//ddlNationality.SelectedText.Trim().ToUpper().ToUpper().Contains("OMAN") || Bahrain,Kuwait,Qatar,ARABIA
                {
                    lblIdentityColumn.Text = "NRID. Number";
                    lblIdentityColumn.ToolTip = "NRID. Number";
                    txtIdentityColumn.ToolTip = "NRIDD. Number";
                    lblIdentityColumn.Attributes.Add("title", "NRIDD. Number");
                    rfvIdentityColumn.ErrorMessage = "Enter NRIDD. Number";
                    lblIdentityIssueDate.Text = "NRID. Issue Date";
                    lblIdentityIssueDate.ToolTip = "NRID. Issue Date";
                    txtIdentityIssueDate.ToolTip = "NRID. Issue Date";
                    lblIdentityExpiredate.Text = "NRID. Expiry Date";
                    lblIdentityExpiredate.ToolTip = "NRID. Expiry Date";
                    txtIdentityExpiredate.ToolTip = "NRID. Expiry Date";
                    rfvIdentityIssueDate.ErrorMessage = "Enter NRID. Issue Date";
                    rfvIdentityExpiredate.ErrorMessage = "Enter NRID. Expiry Date";
                    txtIdentityColumn.MaxLength = 12;
                    RevIdentityColumn.Enabled = true;
                    RevCRNUMBERVal.Enabled = false;
                    EnabledNationality(true);
                    txtIdentityColumn.AutoPostBack = true;
                }
                else//Non Oman
                {
                    lblIdentityColumn.Text = "RID Number";
                    lblIdentityColumn.ToolTip = "RID Number";
                    lblIdentityColumn.Attributes.Add("title", "RID Number");
                    txtIdentityColumn.ToolTip = "RID Number";
                    rfvIdentityColumn.ErrorMessage = "Enter RID Number";
                    lblIdentityIssueDate.Text = "RID Issue Date";
                    lblIdentityIssueDate.ToolTip = "RID Issue Date";
                    txtIdentityIssueDate.ToolTip = "RID Issue Date";
                    rfvIdentityIssueDate.ErrorMessage = "Enter RID Issue Date";
                    lblIdentityExpiredate.Text = "RID Expiry Date";
                    lblIdentityExpiredate.ToolTip = "RID Expiry Date";
                    txtIdentityExpiredate.ToolTip = "RID Expiry Date";
                    rfvIdentityExpiredate.ErrorMessage = "Enter RID Expiry Date";
                    txtIdentityColumn.MaxLength = 12;
                    RevIdentityColumn.Enabled = true;
                    RevCRNUMBERVal.Enabled = false;
                    EnabledNationality(true);
                }
            }
            else
            {
                lblIdentityColumn.Text = "CR No.";
                lblIdentityColumn.ToolTip = "CR No.";
                lblIdentityColumn.Attributes.Add("title", "CR No.");
                txtIdentityColumn.ToolTip = "CR No.";
                lblIdentityIssueDate.Text = "CR No. Issue Date";
                lblIdentityIssueDate.ToolTip = "CR No. Issue Date";
                txtIdentityIssueDate.ToolTip = "CR No. Issue Date";
                lblIdentityExpiredate.Text = "CR No. Expiry Date";
                lblIdentityExpiredate.ToolTip = "CR No. Expiry Date";
                txtIdentityExpiredate.ToolTip = "CR No. Expiry Date";
                rfvIdentityColumn.ErrorMessage = "Enter CR No.";
                rfvIdentityIssueDate.ErrorMessage = "Enter CR No. Issue Date";
                rfvIdentityExpiredate.ErrorMessage = "Enter CR No. Expiry Date";
                revCRNumber.ErrorMessage = "Enter CR No.";
                txtIdentityColumn.MaxLength = 11;
                RevIdentityColumn.Enabled = false;
                RevCRNUMBERVal.Enabled = true;
            }
            NIDRIDCRValidate();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    //protected void ddlAddressType_OnSelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (ddlAddressType.SelectedIndex > 0)
    //        {
    //            pnlCA.GroupingText = ddlAddressType.SelectedItem.Text.Trim() + " Address";
    //            //ucBasicDetAddressSetup.BindAddressSetupDetails(Convert.ToInt32(ddlAddressType.SelectedValue));
    //        }
    //    }
    //    catch(Exception ex)
    //    {

    //    }
    //}

    private void funPriLoadAddressType()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "ADDRESS_TYPE");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            ddlAddressType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });
            //Added on 22-Jun-2019 Starts Here
            //Address type should be permanent on page load . User can change if the communication address to be entered 
            if (ddlAddressType != null && ddlAddressType.Items.Count > 0)
            {
                ddlAddressType.SelectedValue = "2";
            }
            //Added on 22-Jun-2019 Ends Here
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void funPriLoadIndividualLoad()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "OCCUPATION");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            cmbOccupation.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });
            MFCEmployeeInd();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void MFCEmployeeInd()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());
        Procparam.Add("@Lookup_Type", "EMPLOYER");
        Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
        cmbEmployerName.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyId.ToString());
        Procparam.Add("@Lookup_Type", "EMPLOYER_ACTCODE");
        Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
        cmEmpEcoCode.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });
    }


    private void funPriLoadCommonLoad()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "FACTORING_TYPE");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            cmbFactoringType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "INDUSTRY_TYPE");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            cmbIndustryType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "SENIOR_PROFESSION");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            cmbSenMemProfession.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void funPriLoadNonIndividualLoad()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", "FINANCIAL_RECEIVED");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            cmbFinancialReceived.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    //private void funPriLoadNonIndividualLoad()
    //{
    //    try
    //    {
    //        Dictionary<string, string> Procparam = new Dictionary<string, string>();
    //        Procparam.Add("@Company_ID", intCompanyId.ToString());
    //        Procparam.Add("@Lookup_Type", "FINANCIAL_RECEIVED");
    //        Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
    //        cmbFinancialReceived.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, true, "--Select--", new string[] { "ID", "DESCRIPTION" });

    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //    }
    //}

    protected void btnAddAdds_Click(object sender, EventArgs e)
    {
        try
        {
            //if (txtBankAddress.Text.Length > 300)
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Followup Details", "alert('Bank Address Length should be less than or equal to 300');", true);
            //    tcCustomerMaster.ActiveTabIndex = 2;
            //    return;
            //}
            if (ddlAddressType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select Address Type");
                ddlAddressType.Focus();
                return;
            }
            DataRow drDetails;
            DataTable dtAddsDetails = (DataTable)ViewState["AddsDetailsTable"];
            if (dtAddsDetails.Rows.Count < 10)
            {
                drDetails = dtAddsDetails.NewRow();
                string strBankMapId = Convert.ToString(dtAddsDetails.Rows.Count + 1);
                drDetails["CUST_ADD_MAPPING_ID"] = strBankMapId;
                drDetails["CUST_ADDRESS_ID"] = "0";
                drDetails["CUST_ADDRESS_TYPE_ID"] = ddlAddressType.SelectedValue;
                drDetails["CUST_ADDRESS_TYPE"] = ddlAddressType.SelectedItem.Text.Trim();
                drDetails["POSTAL_CODE_TEXT"] = ucBasicDetAddressSetup.PostalCode_Text;
                drDetails["POSTAL_CODE_VALUE"] = ucBasicDetAddressSetup.PostalCode_Value;
                drDetails["POST_BOX_NO"] = ucBasicDetAddressSetup.PostBoxNo.ToUpper();
                drDetails["WAY_NO"] = ucBasicDetAddressSetup.WayNo.ToUpper();
                drDetails["HOUSE_NO"] = ucBasicDetAddressSetup.HouseNo.ToUpper();
                drDetails["BLOCK_NO"] = ucBasicDetAddressSetup.BlockNo.ToUpper();
                drDetails["FLAT_NO"] = ucBasicDetAddressSetup.FlatNo.ToUpper();
                drDetails["LANDMARK"] = ucBasicDetAddressSetup.LandMark.ToUpper();
                drDetails["AREA_SHEIK"] = ucBasicDetAddressSetup.AreaSheik.ToUpper();
                //  drDetails["Area_Sheik_Value"] = ucBasicDetAddressSetup.AreaSheik_Value;
                drDetails["RESIDENCE_PHONE_NO"] = ucBasicDetAddressSetup.ResidencePhoneNo.ToUpper();
                drDetails["RESIDENCE_FAX_NO"] = ucBasicDetAddressSetup.ResidenceFaxNo.ToUpper();
                drDetails["MOBILE_PHONE_NO"] = ucBasicDetAddressSetup.MobilePhoneNo.ToUpper();
                drDetails["CONTACT_NAME"] = ucBasicDetAddressSetup.ContactName.ToUpper();
                drDetails["CONTACT_NO"] = ucBasicDetAddressSetup.ContactNo.ToUpper();
                drDetails["OFFICE_PHONE_NO"] = ucBasicDetAddressSetup.OfficePhoneNo.ToUpper();
                drDetails["OFFICE_FAX_NO"] = ucBasicDetAddressSetup.OfficeFaxNo.ToUpper();
                drDetails["CUST_EMAIL"] = ucBasicDetAddressSetup.CustomerEmail.ToUpper();
                dtAddsDetails.Rows.Add(drDetails);
                grvAddressDetails.DataSource = dtAddsDetails;
                grvAddressDetails.DataBind();

                ViewState["AddsDetailsTable"] = dtAddsDetails;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Bank Details", "alert('Customer Bank Details should be less than or equal to 9 Banks');", true);
            }
            //ucBasicDetAddressSetup.BindAddressSetupDetails(1);
            ucBasicDetAddressSetup.ClearControls();
            funPriLoadAddressType();
            //ddlAddressType.SelectedIndex = -1;
            ddlAddressType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Add Bank Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void btnModifyAdds_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlAddressType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select Address Type");
                ddlAddressType.Focus();
                return;
            }
            if (txtBankAddress.Text.Length > 300)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Followup Details", "alert('Bank Address Length should be less than or equal to 300');", true);
                tcCustomerMaster.ActiveTabIndex = 2;
                return;
            }
            DataTable dtAddsDetails = (DataTable)ViewState["AddsDetailsTable"];

            DataView dvAddsdetails = dtAddsDetails.DefaultView;
            dvAddsdetails.Sort = "CUST_ADD_MAPPING_ID";
            int rowindex = dvAddsdetails.Find(hdnAddsID.Value);
            dvAddsdetails[rowindex].Row["CUST_ADDRESS_TYPE_ID"] = ddlAddressType.SelectedValue;
            dvAddsdetails[rowindex].Row["CUST_ADDRESS_TYPE"] = ddlAddressType.SelectedItem.Text.Trim();
            dvAddsdetails[rowindex].Row["WAY_NO"] = ucBasicDetAddressSetup.WayNo.ToUpper();
            dvAddsdetails[rowindex].Row["HOUSE_NO"] = ucBasicDetAddressSetup.HouseNo.ToUpper();
            dvAddsdetails[rowindex].Row["BLOCK_NO"] = ucBasicDetAddressSetup.BlockNo.ToUpper();
            dvAddsdetails[rowindex].Row["FLAT_NO"] = ucBasicDetAddressSetup.FlatNo.ToUpper();
            dvAddsdetails[rowindex].Row["LANDMARK"] = ucBasicDetAddressSetup.LandMark.ToUpper();
            dvAddsdetails[rowindex].Row["AREA_SHEIK"] = ucBasicDetAddressSetup.AreaSheik;
            //dvAddsdetails[rowindex].Row["Area_Sheik_Value"] = ucBasicDetAddressSetup.AreaSheik_Value;
            dvAddsdetails[rowindex].Row["RESIDENCE_PHONE_NO"] = ucBasicDetAddressSetup.ResidencePhoneNo.ToUpper();
            dvAddsdetails[rowindex].Row["RESIDENCE_FAX_NO"] = ucBasicDetAddressSetup.ResidenceFaxNo.ToUpper();
            dvAddsdetails[rowindex].Row["MOBILE_PHONE_NO"] = ucBasicDetAddressSetup.MobilePhoneNo.ToUpper();
            dvAddsdetails[rowindex].Row["CONTACT_NAME"] = ucBasicDetAddressSetup.ContactName.ToUpper();
            dvAddsdetails[rowindex].Row["CONTACT_NO"] = ucBasicDetAddressSetup.ContactNo.ToUpper();
            dvAddsdetails[rowindex].Row["OFFICE_PHONE_NO"] = ucBasicDetAddressSetup.OfficePhoneNo.ToUpper();
            dvAddsdetails[rowindex].Row["OFFICE_FAX_NO"] = ucBasicDetAddressSetup.OfficeFaxNo.ToUpper();
            dvAddsdetails[rowindex].Row["CUST_EMAIL"] = ucBasicDetAddressSetup.CustomerEmail.ToUpper();
            dvAddsdetails[rowindex].Row["POST_BOX_NO"] = ucBasicDetAddressSetup.PostBoxNo.ToUpper();
            dvAddsdetails[rowindex].Row["POSTAL_CODE_VALUE"] = ucBasicDetAddressSetup.PostalCode_Value;
            dvAddsdetails[rowindex].Row["POSTAL_CODE_TEXT"] = Convert.ToString(ucBasicDetAddressSetup.PostalCode_Text);
            grvAddressDetails.DataSource = dvAddsdetails;
            grvAddressDetails.DataBind();
            FunPriHideBankColumns();
            ViewState["AddsDetailsTable"] = dvAddsdetails.Table;
            ClearBankDetailsControls();
            btnAddAdds.Enabled_True();
            btnModifyAdds.Enabled_False();
            ucBasicDetAddressSetup.ClearControls();
            funPriLoadAddressType();
            ddlAddressType.SelectedValue = "2";
            ddlAddressType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Modify the Bank Details";
            cvCustomerMaster.IsValid = false;

        }
    }

    protected void grvAddressDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (strMode != "Q")
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    /* For Deleting purpose, Restrcit to add attribute to the Cell Remove linkbutton*/
                    for (int intCellIndex = 0; intCellIndex < e.Row.Cells.Count - 2; intCellIndex++)
                    {
                        e.Row.Cells[intCellIndex].Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink
                        (this.grvAddressDetails, "Select$" + e.Row.RowIndex);
                    }
                    e.Row.Attributes["onmouseover"] = "javascript:setMouseOverColor(this);";
                    e.Row.Attributes["onmouseout"] = "javascript:setMouseOutColor(this);";

                }
            }
            //if (strMode == "Q" && e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    TextBox lblBankAddress = e.Row.FindControl("lblBankAddress") as TextBox;
            //    lblBankAddress.Enabled = true;
            //    lblBankAddress.ReadOnly = true;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Load the Bank Details");
        }
    }

    protected void grvAddressDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtDelete = (DataTable)ViewState["AddsDetailsTable"];
            dtDelete.Rows.RemoveAt(e.RowIndex);
            grvAddressDetails.DataSource = dtDelete;
            grvAddressDetails.DataBind();
            if (dtDelete.Rows.Count == 0)
            {
                FunPubBindAddsGrid();
            }
            else
            {
                ViewState["AddsDetailsTable"] = dtDelete;
                ClearBankDetailsControls();
            }
            if (grvAddressDetails.Rows.Count == 0)
            {
                btnAddAdds.Enabled_True();
                btnModifyAdds.Enabled_False();
            }
            ucBasicDetAddressSetup.ClearControls();
            ddlAddressType.SelectedValue = "2";
            ddlAddressType.Enabled = true;
            ddlAddressType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem, Unable to Remove Address Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    protected void grvAddressDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Label lblCust_Add_Mapping_ID = grvAddressDetails.SelectedRow.FindControl("lblCust_Add_Mapping_ID") as Label;
            Label lblCust_Address_ID = grvAddressDetails.SelectedRow.FindControl("lblCust_Address_ID") as Label;
            Label lblCust_Address_Type_ID = grvAddressDetails.SelectedRow.FindControl("lblCust_Address_Type_ID") as Label;
            Label lblPostalCode_Text = grvAddressDetails.SelectedRow.FindControl("lblPostalCode_Text") as Label;
            Label lblPostalCode_Value = grvAddressDetails.SelectedRow.FindControl("lblPostalCode_Value") as Label;
            Label lblArea_Sheik_Text = grvAddressDetails.SelectedRow.FindControl("lblArea_Sheik_Text") as Label;
            //Label lblArea_Sheik_Value = grvAddressDetails.SelectedRow.FindControl("lblArea_Sheik_Value") as Label;
            if (lblCust_Address_Type_ID.Text.Trim() != string.Empty)
            {
                hdnAddsID.Value = lblCust_Add_Mapping_ID.Text.Trim();
                ucBasicDetAddressSetup.PostalCode_Text = lblPostalCode_Text.Text.Trim();
                ucBasicDetAddressSetup.PostalCode_Value = lblPostalCode_Value.Text.Trim();
                ucBasicDetAddressSetup.PostBoxNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[7].Text.Trim()));
                ucBasicDetAddressSetup.WayNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[8].Text.Trim()));
                ucBasicDetAddressSetup.HouseNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[9].Text.Trim()));
                ucBasicDetAddressSetup.BlockNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[10].Text.Trim()));
                ucBasicDetAddressSetup.FlatNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[11].Text.Trim()));
                ucBasicDetAddressSetup.LandMark = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[12].Text.Trim()));
                ucBasicDetAddressSetup.AreaSheik = lblArea_Sheik_Text.Text.Trim();
                ucBasicDetAddressSetup.ResidencePhoneNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[14].Text.Trim()));
                ucBasicDetAddressSetup.ResidenceFaxNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[15].Text.Trim()));
                ucBasicDetAddressSetup.MobilePhoneNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[16].Text.Trim()));
                ucBasicDetAddressSetup.ContactName = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[17].Text.Trim()));
                ucBasicDetAddressSetup.ContactNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[18].Text.Trim()));
                ucBasicDetAddressSetup.OfficePhoneNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[19].Text.Trim()));
                ucBasicDetAddressSetup.OfficeFaxNo = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[20].Text.Trim()));
                ucBasicDetAddressSetup.CustomerEmail = Convert.ToString(Server.HtmlDecode(grvAddressDetails.SelectedRow.Cells[21].Text.Trim()));
                ddlAddressType.SelectedValue = lblCust_Address_Type_ID.Text.Trim();
                ddlAddressType.ClearDropDownList();
            }
            //Label lblAccountTypeId = grvBankDetails.SelectedRow.FindControl("lblAccountTypeId") as Label;
            //TextBox lblBankAddress = grvBankDetails.SelectedRow.FindControl("lblBankAddress") as TextBox;

            //CheckBox chkGridDefaultAccount = grvBankDetails.SelectedRow.FindControl("chkDefaultAccount") as CheckBox;

            //ddlAccountType.SelectedValue = lblAccountTypeId.Text;
            //if (grvBankDetails.SelectedRow.Cells[5].Text != "&nbsp;")
            //    txtAccountNumber.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[5].Text);
            //if (grvBankDetails.SelectedRow.Cells[9].Text != "&nbsp;")
            //    txtMICRCode.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[9].Text);
            //if (grvBankDetails.SelectedRow.Cells[10].Text != "&nbsp;")
            //    txtBankName.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[10].Text);
            //if (grvBankDetails.SelectedRow.Cells[11].Text != "&nbsp;")
            //    txtBankBranch.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[11].Text);
            //txtBankAddress.Text = lblBankAddress.Text;
            //hdnBankId.Value = lblCust_Add_Mapping_ID.Text;
            ///*Modified By prabhu on 16-Nov-2011 for CR (Default Account in Bank Details)*/
            //chkDefaultAccount.Checked = chkGridDefaultAccount.Checked;
            //if (grvBankDetails.SelectedRow.Cells[6].Text != "&nbsp;")
            //    txtIFSC_Code.Text = Convert.ToString(grvBankDetails.SelectedRow.Cells[6].Text);//IFSC Code
            //ddlPANum.SelectedIndex = -1;
            //if (!string.IsNullOrEmpty(grvBankDetails.SelectedRow.Cells[7].Text))
            //{
            //    if (grvBankDetails.SelectedRow.Cells[7].Text != "&nbsp;")
            //        ddlPANum.SelectedValue = Convert.ToString(grvBankDetails.SelectedRow.Cells[7].Text);
            //}
            //ddlSANum.Items.Clear();
            //if (!string.IsNullOrEmpty(grvBankDetails.SelectedRow.Cells[8].Text))
            //{
            //    if (grvBankDetails.SelectedRow.Cells[8].Text != "&nbsp;")
            //    {
            //        ddlPANum_SelectedIndexChanged(null, null);
            //        ddlSANum.SelectedValue = Convert.ToString(grvBankDetails.SelectedRow.Cells[8].Text);
            //    }
            //}
            btnAddAdds.Enabled_False();
            btnModifyAdds.Enabled_True();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvCustomerMaster.ErrorMessage = "Due to Data Problem,Unable to view the Address Details";
            cvCustomerMaster.IsValid = false;
        }
    }

    //protected void txtBranchList_OnTextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string strhdnValue = hdnLocationID.Value;
    //        if ((strhdnValue == "-1" || strhdnValue == string.Empty) || txtBranchList.Text.Trim() == "Records not found!")
    //        {
    //            txtBranchList.Text = string.Empty;
    //            hdnLocationID.Value = string.Empty;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "User Management");
    //    }
    //}

    //protected void txtGroupCode_OnTextChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string strhdnValue = hdnGroupCode.Value;
    //        if ((strhdnValue == "-1" || strhdnValue == string.Empty) || txtGroupCode.Text.Trim() == "Records not found!")
    //        {
    //            txtGroupCode.Text = string.Empty;
    //            hdnGroupCode.Value = string.Empty;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "User Management");
    //    }
    //}

    #region Location Bind
    // Created By: Anbuvel
    // Created Date: 19-May-2018
    // Description: To Bind Location Value
    /// <summary>
    /// GetBranchList
    /// </summary>
    /// <param name="prefixText">search text</param>
    /// <param name="count">no of matches to display</param>
    /// <returns>string[] of matching names</returns>
    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_Page.intCompanyId.ToString());
        Procparam.Add("@Type", "GEN");
        if (Convert.ToInt32(obj_Page.intUserId) > 0)
        {
            Procparam.Add("@User_ID", obj_Page.intUserId.ToString());
        }
        Procparam.Add("@Program_Id", "45");
        //Procparam.Add("@Lob_Id", obj_Page.ddlLOB.SelectedValue);
        Procparam.Add("@Is_Active", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_SA_GET_BRANCHLIST, Procparam));

        return suggetions.ToArray();
    }

    #endregion

    private void FunPriLoadAddressDetails(int intCustomerId, int IsLoadFromProspect, int IsLoadFromApplicationGuarantor, string strDMSProposalNo)
    {
        try
        {
            DataTable dt = new DataTable();
            if (IsLoadFromProspect == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "3");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", strDMSProposalNo);
                dt = Utility.GetDefaultData("S3G_OR_GET_DMS_PROSDTLS", strProParm);

            }

            else if (IsLoadFromApplicationGuarantor == 1)
            {
                Dictionary<string, string> strProParm = new Dictionary<string, string>();
                strProParm.Add("@Option", "3");
                strProParm.Add("@Company_ID", intCompanyId.ToString());
                strProParm.Add("@Guar_Id", intCustomerId.ToString());
                dt = Utility.GetDefaultData("S3G_OR_GET_DMS_GUARDTLS", strProParm);
            }
            else
            {


                Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
                objProcedureParameters.Add("@Option", "1");
                objProcedureParameters.Add("@CustomerId", intCustomerId.ToString());
                objProcedureParameters.Add("@Company_ID", Convert.ToString(intCompanyId));
                dt = Utility.GetDefaultData("S3G_OR_GET_CUSTOTHERS_DTLS", objProcedureParameters);
            }
            if (dt.Rows.Count > 0)
            {
                grvAddressDetails.DataSource = dt;
                grvAddressDetails.DataBind();
                ViewState["AddsDetailsTable"] = dt;
                ucBasicDetAddressSetup.SetAddressDetails(dt.Rows[0]);
                ddlAddressType.SelectedValue = Convert.ToString(dt.Rows[0]["Cust_Address_Type_ID"]);
                ddlAddressType.ClearDropDownList();
                hdnAddsID.Value = Convert.ToString(dt.Rows[0]["CUST_ADD_MAPPING_ID"]);
                btnAddAdds.Enabled_False();
                //ucBasicDetAddressSetup.PostalCode_Text = Convert.ToString(dt.Rows[0]["PostalCode_Text"]);
                //ucBasicDetAddressSetup.PostalCode_Value = Convert.ToString(dt.Rows[0]["PostalCode_Value"]);
                //ucBasicDetAddressSetup.PostBoxNo = Convert.ToString(dt.Rows[0]["Post_Box_No"]);
                //ucBasicDetAddressSetup.WayNo = Convert.ToString(dt.Rows[0]["Way_No"]);
                //ucBasicDetAddressSetup.HouseNo = Convert.ToString(dt.Rows[0]["House_No"]);
                //ucBasicDetAddressSetup.BlockNo = Convert.ToString(dt.Rows[0]["Block_No"]);
                //ucBasicDetAddressSetup.FlatNo = Convert.ToString(dt.Rows[0]["Flat_No"]);
                //ucBasicDetAddressSetup.LandMark =Convert.ToString( dt.Rows[0]["LandMark"]);
                //ucBasicDetAddressSetup.AreaSheik_Text = Convert.ToString(dt.Rows[0]["Area_Sheik_Text"]);
                //ucBasicDetAddressSetup.AreaSheik_Value = Convert.ToString(dt.Rows[0]["Area_Sheik_Value"]);
                //ucBasicDetAddressSetup.ResidencePhoneNo = Convert.ToString(dt.Rows[0]["Residence_Phone_No"]);
                //ucBasicDetAddressSetup.ResidenceFaxNo = Convert.ToString(dt.Rows[0]["Residence_Fax_No"]);
                //ucBasicDetAddressSetup.MobilePhoneNo = Convert.ToString(dt.Rows[0]["Mobile_Phone_No"]);
                //ucBasicDetAddressSetup.ContactName = Convert.ToString(dt.Rows[0]["Contact_Name"]);
                //ucBasicDetAddressSetup.ContactNo = Convert.ToString(dt.Rows[0]["Contact_No"]);
                //ucBasicDetAddressSetup.OfficePhoneNo = Convert.ToString(dt.Rows[0]["Office_Phone_No"]);
                //ucBasicDetAddressSetup.OfficeFaxNo = Convert.ToString(dt.Rows[0]["Office_Fax_No"]);
                //ucBasicDetAddressSetup.CustomerEmail = Convert.ToString(dt.Rows[0]["Cust_Email"]);
                //ddlAddressType.SelectedValue = Convert.ToString(dt.Rows[0]["Cust_Address_Type_ID"]);
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private void FunPriLoadShareDetails(int intCustomerId)
    {
        try
        {
            DataTable dt = new DataTable();
            Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
            objProcedureParameters.Add("@Option", "2");
            objProcedureParameters.Add("@CustomerId", intCustomerId.ToString());
            objProcedureParameters.Add("@Company_ID", Convert.ToString(intCompanyId));
            dt = Utility.GetDefaultData("S3G_OR_GET_CUSTOTHERS_DTLS", objProcedureParameters);
            if (dt.Rows.Count > 0)
            {
                grvShars.DataSource = dt;
                grvShars.DataBind();
                ViewState["SharsDetails"] = dt;
                decimal decTotal = Convert.ToDecimal(dt.Compute("SUM(SHARE_HOLDER_PERC)", ""));
                FunPubAddSummary(false, decTotal);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    public void FunPubAddSummary(bool FromPage, decimal totalperc)
    {

        GridViewRow FRow = grvShars.FooterRow;
        int intCells = FRow.Cells.Count;
        GridViewRow FNRow;
        FNRow = new GridViewRow(FRow.RowIndex + 1, -1, FRow.RowType, FRow.RowState);
        intCells = 6;
        for (int i = 0; i <= intCells - 1; i++)
        {
            TableCell clNew = new TableCell();
            FNRow.Cells.Add(clNew);
        }
        if (!FromPage)
        {
            FNRow.Cells[3].Attributes.Add("align", "left");
            FNRow.Cells[4].Attributes.Add("align", "right");
            FNRow.Cells[3].Text = "Total";
            FNRow.Cells[4].Text = totalperc.ToString(FunsetsuffixPer());
        }
        FNRow.Attributes.Add("border", "none");
        ((System.Web.UI.WebControls.Table)grvShars.Controls[0]).Rows.Add(FNRow);
        ViewState["Summary"] = "1";
    }

    private void Indnonind()
    {
        if (ddlCustomerType.SelectedItem.ToString().ToLower() == "non individual")
        {
            pnlIndividual.Visible = false;
            pnlNonIndividual.Visible = true;
        }
        else
        {
            pnlIndividual.Visible = true;
            pnlNonIndividual.Visible = false;
        }
    }

    #region TO Get Branch List
    private void PopulateBranchList()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(CompanyId));
            Procparam.Add("@User_ID", Convert.ToString(UserId));
            Procparam.Add("@Program_ID", "45");
            Procparam.Add("@OPTION", "1");
            Procparam.Add("@Is_Active", "1");
            ddlBranch.ClearSelection();
            ddlBranch.BindDataTable("S3G_GET_LOCATION", Procparam, new string[] { "BRANCH_ID", "BRANCH" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    #endregion
    #region TO Get Branch List
    protected void rbnMFCEmpIndi_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearMFCIndicatorValue();
            if (rbnMFCEmpIndi.SelectedValue == "1")//Yes
            {
                EnabledEmployedIndRFV(false);
                if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED")
                {
                    txtMfcCode.IsMandatory = true;
                    txtMfcCode.Enabled = true;
                    EnabledEmployedInd(false);
                }
                else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                {
                    txtMfcCode.IsMandatory = true;
                    txtMfcCode.Enabled = true;
                    EnabledEmployedInd(true);
                }
                TextBox txtItemNametxtMfcCode = ((TextBox)txtMfcCode.FindControl("txtItemName"));
                txtItemNametxtMfcCode.Focus();
            }
            else
            {
                txtMfcCode.Enabled = false;
                txtMfcCode.IsMandatory = false;
                EnabledEmployedIndRFV(false);
                if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED" || cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                {
                    EnabledEmployedInd(true);
                    EnabledEmployedIndRFV(true);
                    if (rbnMFCEmpIndi.SelectedValue == "2")//Sathish R
                    {
                        rfvEmployeeCode.Enabled = false;
                        lbl_EmployeeCode.CssClass = "styleDisplayLabel";
                        rfvDepartmentName.Enabled = false;
                        lbl_DepartmentName.CssClass = "styleDisplayLabel";
                        rfvPlaceofWork.Enabled = false;
                        lbl_PlaceofWork.CssClass = "styleDisplayLabel";
                        rfvDesignation.Enabled = false;
                        lbl_Designation.CssClass = "styleDisplayLabel";
                        rfvDesignation.Enabled = false;
                        lbl_Designation.CssClass = "styleDisplayLabel";
                        rfvDateOfJoin.Enabled = false;
                        lbl_DateOfJoin.CssClass = "styleDisplayLabel";
                        rfvBussinessFirm.Enabled = false;
                        lblBussinessFirm.CssClass = "styleDisplayLabel";
                        rfvCRNumber.Enabled = false;
                        rfvtxtCRNumber.Enabled = false;
                        lblCRNumber.CssClass = "styleDisplayLabel";
                        rfvMonBusIncome.Enabled = false;
                        lbl_MonthlyBusinessIncome.CssClass = "styleDisplayLabel";
                    }
                }
                else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BUSINESS")
                {
                    EnabledEmployedInd(false);
                }
                else
                {
                    EnabledEmployedInd(false);
                }
                rbnMFCEmpIndi.Focus();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void EnabledEmployedInd(Boolean strValue)
    {

        cmbEmployerName.Enabled = txtEmployeeCode.Enabled = txtDepartmentName.Enabled = txtDesignation.Enabled =
        txtPlaceofWork.Enabled = txtDateOfJoin.Enabled = strValue;
    }
    private void EnabledEmployeedBus(Boolean strValue)
    {
        txtBussinessFirm.Enabled = txtCRNumber.Enabled = txtMonBusIncome.Enabled = strValue;
    }

    private void EnabledEmployeedBusRFV(Boolean strValue)
    {
        rfvBussinessFirm.Enabled =
        rfvCRNumber.Enabled =
        rfvMonBusIncome.Enabled = strValue;
        if (strValue == true)
        {
            lblBussinessFirm.CssClass = lblCRNumber.CssClass = lbl_MonthlyBusinessIncome.CssClass = "styleReqFieldLabel";
        }
        else
        {
            lblBussinessFirm.CssClass = lblCRNumber.CssClass = lbl_MonthlyBusinessIncome.CssClass = "styleDisplayLabel";
        }
    }

    private void EnabledEmployedIndRFV(Boolean strValue)
    {
        rfvEmployerName.Enabled =
        rfvEmployeeCode.Enabled =
        rfvDepartmentName.Enabled =
        rfvDesignation.Enabled =
        rfvPlaceofWork.Enabled =
        rfvDateOfJoin.Enabled = strValue;
        if (strValue == true)
        {
            lbl_EmployerName.CssClass = lbl_EmployeeCode.CssClass = lbl_DepartmentName.CssClass = lbl_Designation.CssClass = lbl_PlaceofWork.CssClass = lbl_DateOfJoin.CssClass = "styleReqFieldLabel";
        }
        else
        {
            lbl_EmployerName.CssClass = lbl_EmployeeCode.CssClass = lbl_DepartmentName.CssClass = lbl_Designation.CssClass = lbl_PlaceofWork.CssClass = lbl_DateOfJoin.CssClass = "styleDisplayLabel";
        }
    }
    protected void ddlMaritalStatus_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearMaritalStatus();
            EnabledMarritalStatus(false);
            if (ddlMaritalStatus.SelectedIndex > 0)
            {
                txtTotalDependents.Enabled = true;
                if (ddlMaritalStatus.SelectedItem.Text.Trim().ToUpper() == "MARRIED")
                {
                    EnabledMarried(true);
                }
                else
                {
                    EnabledMarried(false);
                }
                txtTotalDependents.Focus();
            }
            else
            {
                ddlMaritalStatus.Focus();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void ClearMaritalStatus()
    {
        txtChildren.Text = txtSpouseName.Text = txtWeddingdate.Text = txtTotalDependents.Text = string.Empty;
    }
    private void EnabledMarried(Boolean strValue)
    {
        txtChildren.Enabled = strValue;
        txtSpouseName.Enabled = strValue;
        txtWeddingdate.Enabled = CalendarWeddingdate.Enabled = strValue;
    }

    private void EnabledMarritalStatus(Boolean strValue)
    {
        txtTotalDependents.Enabled = txtChildren.Enabled = txtSpouseName.Enabled = txtWeddingdate.Enabled = strValue;
    }
    protected void rbnOwn_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (rbnOwn.SelectedValue == "1")//Yes
            {
                txtCurrentMarketValue.Enabled = txtRemainingLoanValue.Enabled = txtTotNetWorth.Enabled = true;
                txtCurrentMarketValue.Text = txtRemainingLoanValue.Text = txtTotNetWorth.Text = string.Empty;
                rfvCurrentMarketValue.Enabled = true;
                txtCurrentMarketValue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Current Market Value");
                txtCurrentMarketValue.Focus();
            }
            else
            {
                txtCurrentMarketValue.Enabled = txtRemainingLoanValue.Enabled = txtTotNetWorth.Enabled = false;
                txtCurrentMarketValue.Text = txtRemainingLoanValue.Text = txtTotNetWorth.Text = string.Empty;
                rfvCurrentMarketValue.Enabled = false;
                rbnMFCEmpIndi.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void rbnFactoringApplicable_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ClearFactoringApplicable();
            if (rbnFactoringApplicable.SelectedValue == "1")//Yes
            {
                EnableFactoring(true);
                cmbFactoringType.Focus();
            }
            else
            {
                EnableFactoring(false);
                rbnCovenantApplicable.SelectedValue = "2";
                rbnAssignmentCollection.Focus();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void ClearFactoringApplicable()
    {
        cmbFactoringType.SelectedIndex = -1;
        txtFactoringLimit.Text = txtCovenantClause.Text;//=txtFacLimitExp.Text = string.Empty
        rbnCovenantApplicable.SelectedValue = "2";
    }
    private void EnableFactoring(Boolean strValue)
    {
        cmbFactoringType.Enabled = strValue;
        rfvFactoringType.Enabled = strValue;
        txtFactoringLimit.Text = string.Empty;
        txtFactoringLimit.Enabled = strValue;
        //rfvFactoringLimit.Enabled = strValue;
        rbnCovenantApplicable.Enabled = strValue;
        rfvCovenantApplicable.Enabled = strValue;
        //txtFacLimitExp.Enabled = strValue;
        //rfvFacLimitExp.Enabled = strValue;
        calFacLimitExp.Enabled = strValue;
        rbnCreditType.Enabled = strValue;
        //txtCovenantClause.Enabled = strValue;
        if (strMode == "C")
        {
            cmbFactoringType.SelectedIndex = -1;
            rbnCreditType.SelectedValue = "2";
        }
    }

    //protected void rbnCovenantApplicable_OnSelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (rbnCovenantApplicable.SelectedValue == "1")//Yes
    //        {
    //            EnableCovenant(true);
    //            txtCovenantClause.Focus();
    //        }
    //        else
    //        {
    //            EnableCovenant(false);
    //            txtFacLimitExp.Focus();
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //    }
    //}

    private void EnableCovenant(Boolean strValue)
    {
        txtCovenantClause.Text = string.Empty;
        txtCovenantClause.Enabled = strValue;
    }

    protected void rbnSenAppli_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (rbnSenAppli.SelectedValue == "1")//Yes
            {
                EnableSenMemberIndicator(true);
            }
            else
            {
                EnableSenMemberIndicator(false);
            }
            rbnSenAppli.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void EnableSenMemberIndicator(Boolean strValue)
    {
        rbnSenMemStatus.SelectedIndex = -1;
        rbnSenMemRelInd.SelectedIndex = -1;
        cmbSenMemProfession.SelectedIndex = -1;
        rbnSenMemStatus.Enabled = strValue;
        rbnSenMemRelInd.Enabled = strValue;
        cmbSenMemProfession.Enabled = strValue;
        rfvSenMemStatus.Enabled = strValue;
        rfvSenMemRelInd.Enabled = strValue;
    }

    private void EnableSeniorIndicator(Boolean strValue)
    {
        rbnSenAppli.Enabled = rbnSenMemStatus.Enabled = rbnSenMemRelInd.Enabled = cmbSenMemProfession.Enabled = strValue;
        rfvSenAppli.Enabled = rfvSenMemStatus.Enabled = rfvSenMemRelInd.Enabled = strValue;
        rfvSenMemStatus.Enabled = rfvSenMemRelInd.Enabled = strValue;
    }

    protected void cmbOccupation_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (cmbOccupation.SelectedIndex > 0)
            {
                ClearMFCIndicatorValue();
                if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BUSINESS")
                {
                    rbnMFCEmpIndi.Enabled = false;
                    txtMfcCode.Enabled = false;
                    rfvrbnMFCEmpIndi.Enabled = false;
                    EnabledEmployedInd(false);
                    EnabledEmployeedBus(true);
                    EnabledEmployeedBusRFV(true);
                    EnabledEmployedIndRFV(false);
                    rbnMFCEmpIndi.SelectedValue = "2";
                }
                else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "EMPLOYED")
                {
                    rbnMFCEmpIndi.SelectedIndex = -1;
                    rbnMFCEmpIndi.Enabled = true;
                    rfvrbnMFCEmpIndi.Enabled = true;
                    txtMfcCode.Enabled = false;
                    EnabledEmployedInd(true);
                    EnabledEmployedIndRFV(true);
                    EnabledEmployeedBus(false);
                    EnabledEmployeedBusRFV(false);
                }
                else if (cmbOccupation.SelectedItem.Text.Trim().ToUpper() == "BOTH")
                {
                    rbnMFCEmpIndi.SelectedIndex = -1;
                    rbnMFCEmpIndi.Enabled = true;
                    rfvrbnMFCEmpIndi.Enabled = true;
                    txtMfcCode.Enabled = false;
                    EnabledEmployedInd(true);
                    EnabledEmployedIndRFV(true);
                    EnabledEmployeedBus(true);
                    EnabledEmployeedBusRFV(true);
                }
                else
                {
                    rbnMFCEmpIndi.SelectedIndex = -1;
                    txtMfcCode.IsMandatory = false;
                    rbnMFCEmpIndi.Enabled = false;
                    rfvrbnMFCEmpIndi.Enabled = false;
                    txtMfcCode.Enabled = false;
                    EnabledEmployedInd(false);
                    EnabledEmployedIndRFV(false);
                    EnabledEmployeedBus(false);
                    EnabledEmployeedBusRFV(false);
                    cmEmpEcoCode.Enabled = false;
                }
            }
            txtQualification.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void ClearMFCIndicatorValue()
    {
        txtMfcCode.Clear();
        MFCEmployeeInd();
        txtEmployeeCode.Text = txtDepartmentName.Text = txtDesignation.Text = txtPlaceofWork.Text = txtDateOfJoin.Text = txtBussinessFirm.Text = txtCRNumber.Text = txtMonBusIncome.Text
        = string.Empty;
    }

    protected void txtMfcCode_OnItem_Selected(object sender, EventArgs e)
    {
        try
        {
            DisableEmployeedtl(true);
            if (txtMfcCode.SelectedValue != "0")
            {
                Dictionary<string, string> ProParm = new Dictionary<string, string>();
                ProParm.Add("@OPTION", "4");
                ProParm.Add("@Company_ID", Convert.ToString(intCompanyId));
                ProParm.Add("@CustomerId", txtMfcCode.SelectedValue);
                DataTable dt = Utility.GetDefaultData("S3G_OR_GET_CUSTOTHERS_DTLS", ProParm);
                if (dt.Rows.Count > 0)
                {
                    txtDepartmentName.Text = Convert.ToString(dt.Rows[0]["DEPARTMENT_NAME"]);
                    txtDesignation.Text = Convert.ToString(dt.Rows[0]["DESIGNATION_NAME"]);
                    txtDateOfJoin.Text = Convert.ToString(dt.Rows[0]["Date_Of_Join"]);
                    txtBussinessFirm.Text = Convert.ToString(dt.Rows[0]["COMPANY_NAME"]);
                    txtCRNumber.Text = Convert.ToString(dt.Rows[0]["CR_NUMBER"]);
                    txtPlaceofWork.Text = Convert.ToString(dt.Rows[0]["PLACE_OF_WORK"]);
                    cmbEmployerName.SelectedItem.Text = Convert.ToString(dt.Rows[0]["COMPANY_NAME"]);
                    txtEmployeeCode.Text = Convert.ToString(dt.Rows[0]["USER_CODE"]);
                    DisableEmployeedtl(false);
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void DisableEmployeedtl(Boolean strValue)
    {
        txtDesignation.Enabled = strValue;
        txtDateOfJoin.Enabled = strValue;
        txtDesignation.Enabled = strValue;
        txtBussinessFirm.Enabled = strValue;
        txtCRNumber.Enabled = strValue;
        txtPlaceofWork.Enabled = strValue;
        cmbEmployerName.Enabled = strValue;
        txtEmployeeCode.Enabled = strValue;
    }

    protected void chkGroupDet_CheckedChanged(object sender, EventArgs e)
    {
        txtGroupCode.Clear();
        if (chkGroupDet.Checked)
        {
            txtGroupCode.Enabled = false;
        }
        else
        {
            txtGroupCode.Enabled = true;
        }
    }

    protected void cmbPublic_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        EnabledClosely(true);
        EnabledCloselyRFV(false);
        if (cmbPublic.SelectedIndex > 0)
        {
            if (cmbPublic.SelectedItem.Text.Trim().ToUpper() == "PUBLIC" || cmbPublic.SelectedItem.Text.Trim().ToUpper() == "CLOSELY HELD")
            {
                EnabledCloselyRFV(true);
            }
            else
            {
                EnabledCloselyRFV(false);
            }
        }
        txtSE.Focus();
    }
    private void EnabledClosely(Boolean strValue)
    {
        txtSE.Text = txtPaidCapital.Text = txtfacevalue.Text = txtbookvalue.Text = string.Empty;
        txtSE.Enabled = txtPaidCapital.Enabled = txtfacevalue.Enabled = txtbookvalue.Enabled = strValue;
    }
    private void EnabledCloselyRFV(Boolean strValue)
    {
        rfvLimitedExchange.Enabled = rfvPaidCapital.Enabled = rfvfacevalue.Enabled = rfvbookvalue.Enabled = strValue;
    }

    protected void rbnSMEIndicator_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (rbnSMEIndicator.SelectedValue == "1")//Yes
            {
                if (txtNoOfEmployees.Text.Trim() != string.Empty && txtAnnualSales.Text.Trim() != string.Empty && txtTotalAssets.Text.Trim() != string.Empty)
                {
                    Dictionary<string, string> ProParm = new Dictionary<string, string>();
                    ProParm.Add("@Company_ID", Convert.ToString(intCompanyId));
                    ProParm.Add("@NO_OF_EMPLOYEE", txtNoOfEmployees.Text.Trim());
                    ProParm.Add("@TURN_OVER", txtAnnualSales.Text.Trim());
                    ProParm.Add("@TOTAL_ASSET", txtTotalAssets.Text.Trim());
                    DataTable dt = Utility.GetDefaultData("S3G_OR_GET_SME_VALIDATE", ProParm);
                    if (dt.Rows.Count > 0)
                    {
                        if (Convert.ToString(dt.Rows[0]["VALIDATE_MSG"]).Trim() != string.Empty)
                        {
                            //Utility.FunShowAlertMsg(this, Convert.ToString(dt.Rows[0]["VALIDATE_MSG"]).Trim());
                            lblSMEErrorMessage.Text = Convert.ToString(dt.Rows[0]["VALIDATE_MSG"]).Trim() + ". Are you sure want to continue?";
                            MPSMEIndicator.Show();
                        }
                        else
                        {
                            MPSMEIndicator.Hide();
                        }
                    }
                }
            }
            rbnSMEIndicator.Focus();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    /// <summary>
    /// To Get Additional Parameter Information using Constant Param Setup
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvAdditionalInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblParamName = (Label)e.Row.FindControl("lblParamName");
                Label lblParamType = (Label)e.Row.FindControl("lblParamType");
                Label lblLookupType = (Label)e.Row.FindControl("lblLookupType");
                Label lblParamSize = (Label)e.Row.FindControl("lblParamSize");
                TextBox txtValues = (TextBox)e.Row.FindControl("txtValues");
                DropDownList ddlValues = (DropDownList)e.Row.FindControl("ddlValues");
                AjaxControlToolkit.FilteredTextBoxExtender fteValues = (AjaxControlToolkit.FilteredTextBoxExtender)e.Row.FindControl("fteValues");
                AjaxControlToolkit.CalendarExtender calAddValues = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calAddValues");
                if (lblParamType.Text.Trim() == "5")//Lookup
                {
                    txtValues.Visible = false;
                    fteValues.Enabled = false;
                    calAddValues.Enabled = false;
                    ddlValues.Visible = true;
                    FunPriLoadLookupTypeData(ddlValues, lblLookupType.Text.Trim().ToUpper());
                    if (txtValues.Text.Trim() != string.Empty)
                    {
                        if (ddlValues.Items.Count > 0)
                        {
                            ddlValues.SelectedValue = txtValues.Text.Trim();
                        }
                    }
                }
                else
                {
                    txtValues.Visible = true;
                    ddlValues.Visible = false;
                    string[] strLength = lblParamSize.Text.Trim().Split(',');
                    txtValues.MaxLength = Convert.ToInt32(strLength[0]);
                    if (lblParamType.Text.Trim() == "4")//Date
                    {
                        calAddValues.Format = strDateFormat;
                        calAddValues.Enabled = true;
                        fteValues.ValidChars = "/-";
                        fteValues.FilterType = AjaxControlToolkit.FilterTypes.Custom | AjaxControlToolkit.FilterTypes.Numbers | AjaxControlToolkit.FilterTypes.LowercaseLetters | AjaxControlToolkit.FilterTypes.UppercaseLetters;
                    }
                    else
                    {
                        if (lblParamType.Text.Trim() == "1")//Number
                        {
                            fteValues.ValidChars = " .";
                            fteValues.FilterType = AjaxControlToolkit.FilterTypes.Numbers;
                        }
                        else
                        {
                            fteValues.ValidChars = " -.";
                            fteValues.FilterType = AjaxControlToolkit.FilterTypes.Custom | AjaxControlToolkit.FilterTypes.Numbers | AjaxControlToolkit.FilterTypes.LowercaseLetters | AjaxControlToolkit.FilterTypes.UppercaseLetters;
                        }
                        calAddValues.Enabled = false;
                    }
                }
                if (strMode == "Q")
                {
                    calAddValues.Enabled = false;
                    fteValues.Enabled = false;
                    txtValues.ReadOnly = true;
                    ddlValues.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void AdditionalInfor()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Program_ID", Convert.ToString(intProgramID));
            Procparam.Add("@TYPE", Convert.ToString(1));
            Procparam.Add("@TYPE_ID", ddlConstitutionName.SelectedValue);
            DataTable dtdata = Utility.GetDefaultData("S3G_GET_CONSTANT_PARAM_VAL", Procparam);
            if (dtdata.Rows.Count > 0)
            {
                grvAdditionalInfo.DataSource = dtdata;
                grvAdditionalInfo.DataBind();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void AdditionalInforFetch(int CustomerId)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@TRAN_ID", Convert.ToString(CustomerId));
            Procparam.Add("@PROGRAM_ID", Convert.ToString(intProgramID));
            Procparam.Add("@TYPE_ID", ddlConstitutionName.SelectedValue);
            DataTable dtdata = Utility.GetDefaultData("S3G_GET_CONSTANT_PARAMTRAN_VAL", Procparam);
            if (dtdata.Rows.Count > 0)
            {
                grvAdditionalInfo.DataSource = dtdata;
                grvAdditionalInfo.DataBind();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void FunPriLoadLookupTypeData(DropDownList ddlLookup, string strLookupType)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Lookup_Type", strLookupType);
            Procparam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlLookup.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void ClearNames()
    {
        //ucEntityNamesSetup.ClearControls();
        txt_CUSTOMER_NAME.Text = string.Empty;
    }

    private void NIDRIDCRValidate()
    {
        try
        {
            revCRNumber.Enabled = false;
            revCRNumber.ValidationExpression = string.Empty;
            // CR Number Validation
            if (ddlConstitutionName.SelectedValue != "0")
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Const_ID", ddlConstitutionName.SelectedValue);
                Procparam.Add("@company_id", intCompanyId.ToString());
                DataSet dtCR = Utility.GetDataset("S3G_CR_Number_Exp", Procparam);
                if (dtCR.Tables[0].Rows.Count > 0 && Convert.ToString(dtCR.Tables[0].Rows[0]["Return_String"]) != string.Empty)
                {
                    revCRNumber.Enabled = true;
                    revCRNumber.ValidationExpression = dtCR.Tables[0].Rows[0]["Return_String"].ToString();
                    revCRNumber.ErrorMessage = lblIdentityColumn.Text.Trim() + " Value Should be the Format: " + dtCR.Tables[1].Rows[0]["CR_NO_FORMAT"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    //private string GetAdditionalInfor()
    //{
    //    string str;
    //    foreach (GridViewRow grv in grvAdditionalInfo.Rows)
    //    {
    //        Label lblParamName = (Label)grv.FindControl("lblParamName");
    //        Label lblParamType = (Label)grv.FindControl("lblParamType");
    //        Label lblLookupType = (Label)grv.FindControl("lblLookupType");
    //        Label lblParamSize = (Label)grv.FindControl("lblParamSize");
    //        Label lblPARAM_ID = (Label)grv.FindControl("lblPARAM_ID");
    //        Label lblPARAM_DET_ID = (Label)grv.FindControl("lblPARAM_DET_ID");
    //        TextBox txtValues = (TextBox)grv.FindControl("txtValues");
    //        DropDownList ddlValues = (DropDownList)grv.FindControl("ddlValues");        

    //    }
    //    return str;
    //}

    private bool FunPriValidateDeDuplCustomerDet(int dedupe)
    {
        bool blnIsDuplicate = false;
        string strAlertMessage = string.Empty;
        string strAlertThird = string.Empty;
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@OPTION", "1");
            Procparam.Add("@Mode", strMode);
            Procparam.Add("@COMPANYID", intCompanyId.ToString());
            Procparam.Add("@PROGRAM_ID", Convert.ToString(intProgramID));
            if (strMode == "M")
            {
                Procparam.Add("@CUSTOMER_ID", Convert.ToString(intCustomerId));
            }
            if (ddlCustomerType.SelectedItem.Text.Trim().ToUpper() == "INDIVIDUAL")
            {
                Procparam.Add("@NID_RID_CRID_NUMBER", txtIdentityColumn.Text.Trim());
            }
            else
            {
                Procparam.Add("@CR_NUMBER", txtIdentityColumn.Text.Trim());
            }
            if (txtPassportNumber.Text.Trim() != string.Empty)
            {
                Procparam.Add("@PASSPORT_NUMBER", txtPassportNumber.Text.Trim());
            }
            if (txtNRID.Text.Trim() != string.Empty)
            {
                Procparam.Add("@NRID", txtNRID.Text.Trim());
            }
            if (txtLabourCardNo.Text.Trim() != string.Empty)
            {
                Procparam.Add("@LABOURCARD_NUMBER", txtLabourCardNo.Text.Trim());
            }
            if (txtDOB.Text.Trim() != string.Empty)
            {
                Procparam.Add("@DATE_OF_BIRTH", Utility.StringToDate(txtDOB.Text.Trim()).ToString());
            }
            if (ddlCustomerType.Text.Trim().ToUpper() == "INDIVIDUAL")
            {
                txt_CUSTOMER_NAME.Text = ucEntityNamesSetup.FirstName + " " + ucEntityNamesSetup.SecondName + " " + ucEntityNamesSetup.ThirdName + " " + ucEntityNamesSetup.FourthName + " " + ucEntityNamesSetup.FifthName + " " + ucEntityNamesSetup.SixthName;
            }
            if (txt_CUSTOMER_NAME.Text.Trim() != string.Empty)
            {
                Procparam.Add("@CUSTOMER_NAME", txt_CUSTOMER_NAME.Text.Trim());
            }
            Procparam.Add("@CUSTOMER_TYPE", ddlCustomerType.SelectedValue);
            DataTable dtdedupCheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
            if (Convert.ToInt32(dtdedupCheck.Rows[0]["IS_DUPE"]) > 0)
            {
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["NID"]) == 1)
                {
                    txtIdentityColumn.Focus();
                    //Utility.FunShowAlertMsg(this, "N.ID./R.ID Number has been duplicated");
                    strAlertMessage = lblIdentityColumn.Text.Trim() + " has been duplicated"; //N.ID./R.ID Number                   
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["NRID"]) == 1)
                {
                    txtNRID.Focus();
                    //Utility.FunShowAlertMsg(this, "NRID has been duplicated");
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "NRID has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "NRID has been duplicated";
                    }
                    //return true;
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PASSPORT"]) == 1)
                {
                    txtPassportNumber.Focus();
                    //Utility.FunShowAlertMsg(this, "Passport Number has been duplicated");
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Passport Number has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Passport Number has been duplicated";
                    }
                    //return true;
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["DOB"]) == 1)
                {
                    txtDOB.Focus();
                    //Utility.FunShowAlertMsg(this, "DOB has been duplicated");
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Date of Birth has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Date of Birth has been duplicated";
                    }
                    //return true;
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CRNO"]) == 1)
                {
                    if (!(ddlCustomerType.Text.Trim().ToUpper() == "INDIVIDUAL"))
                    {
                        txtIdentityColumn.Focus();
                        //Utility.FunShowAlertMsg(this, "CR Number has been duplicated");
                        if (strAlertMessage.Trim() != string.Empty)
                        {
                            strAlertMessage = strAlertMessage + "\\n" + "CR Number has been duplicated";
                        }
                        else
                        {
                            strAlertMessage = "CR Number has been duplicated";
                        }
                        //return true;
                    }
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["LABOURCARD"]) == 1)
                {
                    //txtLabourCardNo.Focus();
                    //Utility.FunShowAlertMsg(this, "Labour Card Number has been duplicated");
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Labour Card Number has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Labour Card Number has been duplicated";
                    }
                    //return true;
                }

                // Customer Name Check Against HOT/PEP/Terroist
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CUSTOMER_NAME"]) == 1)
                {
                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0)
                    {
                        if (ddlCustomerType.Text.Trim().ToUpper() == "INDIVIDUAL")
                        {
                            TextBox txtFirst_Name = ucEntityNamesSetup.FindControl("txtFirst_Name") as TextBox;
                            txtFirst_Name.Focus();
                        }
                        else
                        {
                            txt_CUSTOMER_NAME.Focus();
                        }
                        //Utility.FunShowAlertMsg(this, "Customer Name has been duplicated");
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Name has been Marked in Hot List";
                        }
                        else
                        {
                            strAlertThird = "Customer Name has been Marked in Hot List";
                        }
                    }

                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0)
                    {
                        if (ddlCustomerType.Text.Trim().ToUpper() == "INDIVIDUAL")
                        {
                            TextBox txtFirst_Name = ucEntityNamesSetup.FindControl("txtFirst_Name") as TextBox;
                            txtFirst_Name.Focus();
                        }
                        else
                        {
                            txt_CUSTOMER_NAME.Focus();
                        }
                        //Utility.FunShowAlertMsg(this, "Customer Name has been duplicated");
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Name has been Marked in Pep List";
                        }
                        else
                        {
                            strAlertThird = "Customer Name has been Marked in Pep List";
                        }
                    }
                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["TER_LIST"]) > 0)
                    {
                        if (ddlCustomerType.Text.Trim().ToUpper() == "INDIVIDUAL")
                        {
                            TextBox txtFirst_Name = ucEntityNamesSetup.FindControl("txtFirst_Name") as TextBox;
                            txtFirst_Name.Focus();
                        }
                        else
                        {
                            txt_CUSTOMER_NAME.Focus();
                        }
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Name has been Marked in Terrorist List";
                        }
                        else
                        {
                            strAlertThird = "Customer Name has been Marked in Terrorist List";
                        }
                    }
                    //return true;
                }

                // NID/RID/CR Number Check in PEP/Terrorist List    
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_NI_LIST"]) > 0)
                {
                    txtIdentityColumn.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblIdentityColumn.Text.Trim() + " has been Marked in Hot List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblIdentityColumn.Text.Trim() + " has been Marked in Hot List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_NI_LIST"]) > 0)
                {
                    txtIdentityColumn.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblIdentityColumn.Text.Trim() + " has been Marked in Pep List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblIdentityColumn.Text.Trim() + " has been Marked in Pep List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["TER_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["TER_NI_LIST"]) > 0)
                {
                    txtIdentityColumn.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblIdentityColumn.Text.Trim() + " has been Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblIdentityColumn.Text.Trim() + " has been Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                }

                // Check Passport Number in HOT/PEP/Terriost List                             
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_PS_LIST"]) > 0)
                {
                    txtPassportNumber.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblPassportNumber.Text.Trim() + " has been Marked in Pep List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblPassportNumber.Text.Trim() + " has been Marked in Pep List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_PS_LIST"]) > 0)
                {
                    txtPassportNumber.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblPassportNumber.Text.Trim() + " has been Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblPassportNumber.Text.Trim() + " has been Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["TER_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["TER_PS_LIST"]) > 0)
                {
                    txtPassportNumber.Focus();
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + lblPassportNumber.Text.Trim() + " has been Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = lblPassportNumber.Text.Trim() + " has been Mapped in Terrorist List"; //N.ID./R.ID Number   
                    }
                }
                if (strAlertThird.Trim() != string.Empty)
                {
                    lblDedupeErrorMsg.Text = strAlertThird.Trim();
                }

                if (strAlertMessage.Trim() != string.Empty)
                {
                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + strAlertThird;
                    }
                }
                else
                {
                    if (dedupe == 1)
                    {
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertMessage = strAlertThird;
                        }
                    }
                }
                if (strAlertMessage.Trim() != string.Empty)
                {
                    Utility.FunShowAlertMsg(this, strAlertMessage);
                    return true;
                }
                blnIsDuplicate = false;
            }
            else
            {
                blnIsDuplicate = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate Duplicate Documents");
        }
        return blnIsDuplicate;
    }
    protected void btndummy_Click(object sender, EventArgs e)
    {

    }
    private bool FunPriValidateAgeComplaince(int age)
    {
        bool blnIsDuplicate = false;
        try
        {
            //if (hdnCustAge.Value.Trim() == string.Empty)
            //{
            //    hdnCustAge.Value = "65";
            //}
            if (hdnCustAge.Value != null && hdnCustAge.Value != string.Empty)
            {
                if (!(Convert.ToInt32(hdnCustAge.Value) >= age))
                {
                    blnIsDuplicate = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate dedup Process");
        }
        return blnIsDuplicate;
    }

    protected void grvShars_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                TextBox txtFSHARE_HOLDER_PERC = e.Row.FindControl("txtFSHARE_HOLDER_PERC") as TextBox;
                txtFSHARE_HOLDER_PERC.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, 2, true, "Share Holder Percentage");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSHARE_HOLDER_PERC = e.Row.FindControl("lblSHARE_HOLDER_PERC") as Label;
                if (lblSHARE_HOLDER_PERC.Text.Trim() != string.Empty)
                {
                    lblSHARE_HOLDER_PERC.Text = Convert.ToDecimal(lblSHARE_HOLDER_PERC.Text.Trim()).ToString(FunsetsuffixPer());
                }
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvCustomerMaster.ErrorMessage = "Unable to Toggle the Values in Constitution Document Details";
            cvCustomerMaster.IsValid = false;
        }
    }
    #endregion

    #region Name Change Event
    protected void NameChange(object sender, EventArgs e)
    {
        try
        {
            if (ddlCustomerType.SelectedItem.Text.Trim().ToUpper() == "INDIVIDUAL")
            {
                txt_CUSTOMER_NAME.Text = ucEntityNamesSetup.FirstName + " " + ucEntityNamesSetup.SecondName + " " + ucEntityNamesSetup.ThirdName + " " + ucEntityNamesSetup.FourthName + " " + ucEntityNamesSetup.FifthName + " " + ucEntityNamesSetup.SixthName;
                //txtFamilyName.Text = ucEntityNamesSetup.FourthName;
                //TextBox txt = (TextBox)sender;
                //if (txt.ID == "txtFirst_Name")
                //{
                //    TextBox txtFirst_Name = (TextBox)ucEntityNamesSetup.FindControl("txtFirst_Name");
                //    txtFirst_Name.Focus();
                //}
                //if (txt.ID == "txtSecond_Name")
                //{
                //    TextBox txtSecond_Name = (TextBox)ucEntityNamesSetup.FindControl("txtSecond_Name");
                //    txtSecond_Name.Focus();
                //}
                //if (txt.ID == "txtThird_Name")
                //{
                //    TextBox txtThird_Name = (TextBox)ucEntityNamesSetup.FindControl("txtThird_Name");
                //    txtThird_Name.Focus();
                //}
                //if (txt.ID == "txtFourth_Name")
                //{
                //    TextBox txtFourth_Name = (TextBox)ucEntityNamesSetup.FindControl("txtFourth_Name");
                //    txtFourth_Name.Focus();
                //}
                //if (txt.ID == "txtFifth_Name")
                //{
                //    TextBox txtFifth_Name = (TextBox)ucEntityNamesSetup.FindControl("txtFifth_Name");
                //    txtFifth_Name.Focus();
                //}
                //if (txt.ID == "txtSixth_Name")
                //{
                //    TextBox txtSixth_Name = (TextBox)ucEntityNamesSetup.FindControl("txtSixth_Name");
                //    txtSixth_Name.Focus();
                //}
                txtIdentityColumn.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    #endregion

    protected void btnOk_Click(object sender, EventArgs e)
    {
        rbnSMEIndicator.SelectedValue = "1";
        MPSMEIndicator.Hide();
        chkIS_SME_FORCED.Checked = true;
        rbnSMEIndicator.Focus();
    }


    protected void btnSMECancel_Click(object sender, EventArgs e)
    {
        rbnSMEIndicator.SelectedValue = "2";
        MPSMEIndicator.Hide();
        rbnSMEIndicator.Focus();
        chkIS_SME_FORCED.Checked = false;
    }

    protected void btnSaveOk_Click(object sender, EventArgs e)
    {
        mpeHotList.Hide();
        lblDedupeErrorMsg.Text = string.Empty;
        FunPriSaveAfterCustomer();
    }

    protected void btnSaveCancel_Click(object sender, EventArgs e)
    {
        mpeHotList.Hide();
        btnSave.Focus();
        lblDedupeErrorMsg.Text = string.Empty;
    }

    private bool FunPriValidateLimitDet()
    {
        bool blnIsDuplicate = false;
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@OPTION", "3");
            Procparam.Add("@Mode", strMode);
            Procparam.Add("@COMPANYID", intCompanyId.ToString());
            Procparam.Add("@PROGRAM_ID", Convert.ToString(intProgramID));
            Procparam.Add("@CUSTOMER_ID", Convert.ToString(intCustomerId));
            Procparam.Add("@CUSTOMER_TYPE", ddlCustomerType.SelectedValue);
            if (txtFactoringLimit.Text.Trim() != string.Empty)
            {
                Procparam.Add("@Factoring_Limit", txtFactoringLimit.Text.Trim());
            }
            if (txtMaxLenLimit.Text.Trim() != string.Empty)
            {
                Procparam.Add("@Max_Len_Limit", txtMaxLenLimit.Text.Trim());
            }
            DataTable dtdedupCheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
            if (Convert.ToInt32(dtdedupCheck.Rows[0]["IS_VALIDATE"]) > 0)
            {
                if (rbnFactoringApplicable.SelectedValue == "1")
                {
                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["IS_VALIDATE"]) == 1)
                    {
                        txtFactoringLimit.Focus();
                        Utility.FunShowAlertMsg(this, Convert.ToString(dtdedupCheck.Rows[0]["ERROR_MSG"]));
                        return true;
                    }
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["IS_VALIDATE"]) == 1)
                {
                    txtMaxLenLimit.Focus();
                    Utility.FunShowAlertMsg(this, Convert.ToString(dtdedupCheck.Rows[0]["ERROR_MSG"]));
                    return true;
                }
                blnIsDuplicate = false;
            }
            else
            {
                blnIsDuplicate = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate Duplicate Documents");
        }
        return blnIsDuplicate;
    }

    private void ConstReqFieldValidate(Boolean Value)
    {
        rfvKeyDecisionMaker.Enabled = Value;
        rfvDirectors.Enabled = Value;
        rfvFinancialRequired.Enabled = Value;
        rfvFinancialReceived.Enabled = Value;
        //rfvIndustryType.Enabled = Value;
        rfvBussinessActivity.Enabled = Value;
        rfvAuditorName.Enabled = Value;
        rfvFactoringApplicable.Enabled = Value;
        //rfvFactoringType.Enabled = Value;
        //rfvSenAppli.Enabled = Value;
        //rfvSenMemStatus.Enabled = Value;
        //rfvSenMemRelInd.Enabled = Value;
        rfvRelaPartyind.Enabled = Value;
    }

    private void OtherConstReqFieldValidate(Boolean Value)
    {
        rfvAnnualSales.Enabled = Value;
        rfvTotalAssets.Enabled = Value;
        rfvNoOfEmployees.Enabled = Value;
        rfvSMEIndicator.Enabled = Value;
    }
    private void ConsultancyReqFieldValidate(Boolean Value)
    {
        rfvNonMoci.Enabled = Value;
    }
    private void ConstitutionValueChange()
    {
        string strCode = string.Empty;
        try
        {
            ConstReqFieldValidate(true);
            ConsultancyReqFieldValidate(true);
            OtherConstReqFieldValidate(true);
            if (ddlConstitutionName.SelectedValue != "0")
            {
                ConstReqFieldValidate(false);
                ConsultancyReqFieldValidate(false);
                OtherConstReqFieldValidate(false);
                string[] strCustomerDetails = ddlConstitutionName.SelectedItem.Text.Trim().Split('-');
                if (strCustomerDetails[0].Trim() == "2" || strCustomerDetails[0].Trim() == "3" || strCustomerDetails[0].Trim() == "4" || strCustomerDetails[0].Trim() == "70" || strCustomerDetails[0].Trim() == "72")
                {

                    if (strCustomerDetails[0].Trim() == "2" || strCustomerDetails[0].Trim() == "72")//S.A.O.G,CONSULTANCY
                    {
                        ConstReqFieldValidate(true);
                        if (strCustomerDetails[0].Trim() == "72")
                        {
                            ConsultancyReqFieldValidate(true);
                        }
                        else
                        {
                            ConsultancyReqFieldValidate(false);
                        }
                    }
                    if (strCustomerDetails[0].Trim() == "3" || strCustomerDetails[0].Trim() == "4" || strCustomerDetails[0].Trim() == "70")//S.A.O.G,CONSULTANCY
                    {
                        ConstReqFieldValidate(true);
                        OtherConstReqFieldValidate(true);
                    }
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    [System.Web.Services.WebMethod]
    public static string[] GetAddressPostalCodeList(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        Procparam.Add("@Company_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@Type", "1");
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_GET_ADD_SETUP_LOOKUP", Procparam));
        return suggetions.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetAddressArea_SheikList(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        Procparam.Add("@Company_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@Type", "2");
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_GET_ADD_SETUP_LOOKUP", Procparam));
        return suggetions.ToArray();

    }

    [System.Web.Services.WebMethod]
    public static string[] GetUserList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@Program_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoProgramID"]));
        Procparam.Add("@OPTION", "1");
        if (System.Web.HttpContext.Current.Session["AutoStrMode"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["AutoStrMode"]) != string.Empty)
            Procparam.Add("@MODE", Convert.ToString(System.Web.HttpContext.Current.Session["AutoStrMode"]));
        Procparam.Add("@Prefix", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_Get_User_List, Procparam));
        return suggestions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetBankList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@Program_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoProgramID"]));
        Procparam.Add("@OPTION", "2");
        if (System.Web.HttpContext.Current.Session["AutoStrMode"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["AutoStrMode"]) != string.Empty)
            Procparam.Add("@MODE", Convert.ToString(System.Web.HttpContext.Current.Session["AutoStrMode"]));
        Procparam.Add("@Prefix", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_Get_User_List, Procparam));
        return suggestions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetNationalList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@COMPANY_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@PREFIXTEXT", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_NATIONALITY_LIST", Procparam));
        return suggestions.ToArray();
    }

    protected void ddlValues_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int intRowIndex = Utility.FunPubGetGridRowID("grvAdditionalInfo", ((DropDownList)sender).ClientID);
            DropDownList ddlValues = (DropDownList)grvAdditionalInfo.Rows[intRowIndex].FindControl("ddlValues");
            TextBox txtValues = (TextBox)grvAdditionalInfo.Rows[intRowIndex].FindControl("txtValues");
            txtValues.Text = ddlValues.SelectedValue;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private string Funsetsuffix()
    {
        int suffix = 1;
        suffix = ObjS3GSession.ProGpsSuffixRW;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }
    private string FunsetsuffixPer()
    {
        int suffix = 1;
        suffix = 2;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }
    protected void rbnFinancialRequired_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            cmbFinancialReceived.SelectedIndex = -1;
            cmbFinancialReceived.Enabled = false;
            rfvFinancialReceived.Enabled = false;
            rfvAnnualSales.Enabled = false;
            txtAnnualSales.Enabled = false;
            if (rbnFinancialRequired.SelectedValue == "1")//Yes
            {
                funPriLoadNonIndividualLoad();
                cmbFinancialReceived.Enabled = true;
                rfvFinancialReceived.Enabled = true;
                rfvAnnualSales.Enabled = true;
                txtAnnualSales.Enabled = true;
                cmbFinancialReceived.Focus();
            }
            else
            {
                txtAnnualSales.Text = string.Empty;
                txtSE.Focus();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void rbnCovenantApplicable_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txtCovenantClause.Enabled = false;
            if (rbnCovenantApplicable.SelectedValue == "1")//Yes
            {
                txtCovenantClause.Enabled = true;
                txtCovenantClause.Text = string.Empty;
                txtCovenantClause.Focus();
            }
            else
            {
                txtCovenantClause.Text = string.Empty;
                txtCovenantClause.Enabled = false;
                //txtFacLimitExp.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtBankName_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            if (txtBankName.SelectedValue != "0")
            {
                PopulateBankBranchList(txtBankName.SelectedValue);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private void ClearAllIndControls()
    {
        txtPassportNumber.Text = txtPassportIssueDate.Text = txtPassportExpDate.Text = txtDrivingNumber.Text = txtVisaNo.Text = txtLabourCardNo.Text = txtLaborExpDate.Text = txtLabourCardDate.Text =
        txtDesignation.Text = txtPlaceofWork.Text = txtDateOfJoin.Text = txtBussinessFirm.Text = txtCRNumber.Text = txtMonBusIncome.Text = txtNonMoci.Text = txtNRID.Text =
        txtMaxLenLimit.Text = txtMaxLenLimiExpDate.Text = txtEmployeeCode.Text = txtFamilyName.Text = string.Empty;
        rbnOwn.SelectedIndex = -1;
        txtCurrentMarketValue.Enabled = txtRemainingLoanValue.Enabled = txtRemainingAmount.Enabled = false;
        rbnRelaPartyind.SelectedIndex = -1;
        rbnLanCollateral.SelectedIndex = -1;
        rbnAssignmentCollection.SelectedIndex = -1;
        rbnMFCEmpIndi.SelectedIndex = -1;
        ddlVIP.SelectedIndex = -1;
        cmbIndustryType.SelectedIndex = -1;
        txtMfcCode.Clear();
    }

    private void ClearAllNonControls()
    {
        txtKeyDecisionMaker.Text = txtNoOfEmployees.Text = txtAnnualSales.Text = txtTotalAssets.Text = txtTotalDependents.Text = txtBussinessActivity.Text = txtAuditorName.Text = txtOCCIExpiryDate.Text = txtOCCIIssueDate.Text =
            txtCovenantClause.Text  = txtFactoringLimit.Text = string.Empty;//txtFacLimitExp.Text
        rbnFactoringApplicable.SelectedValue = "2";
        rbnFactoringApplicable_OnSelectedIndexChanged(null, null);
        cmbFactoringType.Enabled = false;
        rbnCovenantApplicable.SelectedIndex = -1;
        rbnFinancialRequired.SelectedIndex = -1;
        cmbFinancialReceived.Enabled = false;
    }


    private void EnabledNationality(Boolean strValue)
    {
        rfvLabourCardNo.Enabled = rfvLabourCardDate.Enabled = rfvLaborExpDate.Enabled = rfvPassportNumber.Enabled = rfvPassportIssueDate.Enabled
         = rfvPassportExpDate.Enabled = strValue;
        if (strValue)
        {
            lblPassportNumber.CssClass = lblPassportIssueDate.CssClass = lblPassportExpDate.CssClass = lbl_LaborCardNo.CssClass =
            lbl_LaborCardIssueDate.CssClass = lbl_LaborCardExpiryDate.CssClass = lblVisaNumber.CssClass = "styleDisplayLabel";
        }
        else
        {
            lblPassportNumber.CssClass = lblPassportIssueDate.CssClass = lblPassportExpDate.CssClass = lbl_LaborCardNo.CssClass =
            lbl_LaborCardIssueDate.CssClass = lbl_LaborCardExpiryDate.CssClass = lblVisaNumber.CssClass = "styleDisplayLabel";
        }
    }

    #region TO Get Branch List
    private void PopulateBankBranchList(string strBankID)
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@OPTION", "3");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@PROGRAM_ID", Convert.ToString(intProgramID));
            Procparam.Add("@DESIGNATION_ID", strBankID.Trim());
            ddlBankBranch.ClearSelection();
            ddlBankBranch.BindDataTable("S3G_GET_USERLIST_AGT", Procparam, new string[] { "LOCATION_ID", "LOCATION_NAME" });
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    #endregion

    private void AgeCalculation(string strDOB)
    {
        try
        {
            DateTime dob = Utility.StringToDate(strDOB);
            int monthDiff = GetMonthDifference(dob, DateTime.Now.Date);
            // SSL Age Difference discussed on 25-01-2019
            txtAge.Text = Math.Round((Convert.ToDecimal(monthDiff) / Convert.ToDecimal(12)), 0).ToString();  //Convert.ToString(monthDiff / 12);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    //public static int Age(DateTime birthDate)
    //{
    //    string s = txtDOB.;
    //    DateTime dob = Convert.ToDateTime(s);
    //    DateTime currentdate = Convert.ToDateTime(DateTime.Now);
    //    TimeSpan time = currentdate.Subtract(dob);
    //    int total = (time.Days) / 365;
    //    txtAge.Text = total.ToString();
    //    return total;
    //    //int years, months, days;
    //    //DateDiff(DateTime.Now, birthDate, out years, out months, out days);
    //    //return years;
    //}        
    protected void txtIdentityIssueDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtIdentityIssueDate.Text.Trim() != string.Empty)
            {
                if (ddlCustomerType.SelectedItem.Text.Trim().ToLower() == "non individual")
                {
                    int noOfmonth = 0;
                    if (hdnExpiryMonth.Value != string.Empty)
                    {
                        noOfmonth = Convert.ToInt32(hdnExpiryMonth.Value);
                    }
                    txtIdentityExpiredate.Text = (Utility.StringToDate(txtIdentityIssueDate.Text.Trim()).AddMonths(noOfmonth)).ToString(strDateFormat);
                    txtIdentityExpiredate.Focus();
                }
                if (ddlCustomerType.SelectedItem.Text.Trim().ToLower() == "individual")
                {
                    if (txtDOB.Text.Trim() != string.Empty && txtIdentityIssueDate.Text.Trim() != string.Empty)
                    {
                        if ((Utility.StringToDate(txtIdentityIssueDate.Text.Trim()) < Utility.StringToDate(txtDOB.Text.Trim())))
                        {
                            Utility.FunShowAlertMsg(this, lblIdentityIssueDate.Text.Trim() + " Cannot Be Less Than or equal to Date Of Birth");
                            txtIdentityIssueDate.Text = string.Empty;
                            txtIdentityIssueDate.Focus();
                            return;
                        }
                    }
                    txtIdentityExpiredate.Focus();
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }
    protected void btnDeDup_Click(object sender, EventArgs e)
    {
        try
        {
            if (FunPriValidateDeDuplCustomerDet(1))
            {
                return;
            }
            else
            {
                Utility.FunShowAlertMsg(this, "De dupe not found");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnLimitHistory_Click(object sender, EventArgs e)
    {
        try
        {
            int chkLimit = 0;
            Procparam = new Dictionary<string, string>();
            Procparam.Clear();
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@OPTION", "1");
            Procparam.Add("@PROGRAM_ID", "45");
            Procparam.Add("@CUSTOMER_ID", Convert.ToString(intCustomerId));
            DataTable dsContractNos = Utility.GetDefaultData("S3G_GET_CUST_LIMIT_HIS", Procparam);
            if (dsContractNos.Rows.Count > 0)
            {

                if (dsContractNos.Rows.Count > 0)
                {
                    chkLimit = 1;
                    pnlMaxLimitHis.Visible = true;
                    grvMaximumLimitHis.DataSource = dsContractNos;
                    grvMaximumLimitHis.DataBind();
                    pnlFactoingLimitHis.Visible = false;
                    mpeCreditLimithis.Show();
                }

                //if (dsContractNos.Tables[0].Rows.Count > 0)
                //{
                //    chkLimit = 1;
                //    pnlFactoingLimitHis.Visible = true;
                //    grvFacLimit.DataSource = dsContractNos.Tables[0];
                //    grvFacLimit.DataBind();
                //}
                //else
                //{
                //    pnlFactoingLimitHis.Visible = false;
                //}
                //if (dsContractNos.Tables[1].Rows.Count > 0)
                //{
                //    chkLimit = 1;
                //    pnlMaxLimitHis.Visible = true;
                //    grvMaximumLimitHis.DataSource = dsContractNos.Tables[1];
                //    grvMaximumLimitHis.DataBind();
                //}
                //else
                //{
                //    pnlMaxLimitHis.Visible = false;
                //}
                //if (chkLimit == 0)
                //{
                //    Utility.FunShowAlertMsg(this, "Limit History details not found");
                //    return;
                //}
               
            }
            else
            {
                Utility.FunShowAlertMsg(this, "Limit History details not found");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnHistoryCancel_Click(object sender, EventArgs e)
    {
        mpeCreditLimithis.Hide();
        btnHistoryCancel.Focus();
    }

    private void SMECheck()
    {
        try
        {
            if (txtNoOfEmployees.Text.Trim() != string.Empty || txtAnnualSales.Text.Trim() != string.Empty || txtTotalAssets.Text.Trim() != string.Empty)
            {
                Dictionary<string, string> ProParm = new Dictionary<string, string>();
                ProParm.Add("@Company_ID", Convert.ToString(intCompanyId));
                ProParm.Add("@NO_OF_EMPLOYEE", txtNoOfEmployees.Text.Trim());
                ProParm.Add("@TURN_OVER", txtAnnualSales.Text.Trim());
                ProParm.Add("@TOTAL_ASSET", txtTotalAssets.Text.Trim());
                DataTable dt = Utility.GetDefaultData("S3G_OR_GET_SME_VALIDATE", ProParm);
                if (dt.Rows.Count > 0)
                {
                    if (Convert.ToString(dt.Rows[0]["VALIDATE_MSG"]).Trim() == string.Empty)
                    {
                        rbnSMEIndicator.SelectedValue = "1";
                        //rbnSMEIndicator.Enabled = false;
                    }
                    else
                    {
                        rbnSMEIndicator.Enabled = true;
                        rbnSMEIndicator.SelectedValue = "2";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtPercentageStake_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtPercentageStake.Text.Trim() != string.Empty)
            {
                SMECheck();
            }
            txtJVPartnerStake.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtJVPartnerStake_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtJVPartnerStake.Text.Trim() != string.Empty)
            {
                SMECheck();
            }
            txtAnnualSales.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtAnnualSales_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtAnnualSales.Text.Trim() != string.Empty)
            {
                SMECheck();
            }
            txtTotalAssets.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtTotalAssets_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtTotalAssets.Text.Trim() != string.Empty)
            {
                SMECheck();
            }
            txtBussinessActivity.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private bool UserFunctionCheck(string strFunctionCode)
    {
        bool blnRights = false;
        try
        {

            Dictionary<string, string> ProParm = new Dictionary<string, string>();
            ProParm.Add("@Company_Id", Convert.ToString(intCompanyId));
            ProParm.Add("@USER_ID", Convert.ToString(intUserId));
            ProParm.Add("@PGM_CODE", strFunctionCode);
            DataTable dt = Utility.GetDefaultData("S3G_SA_GET_SCREEN_ACCESS", ProParm);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToInt32(dt.Rows[0]["COUNT"]) > 0)
                {
                    blnRights = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        return blnRights;
    }

    public static int GetMonthDifference(DateTime startDate, DateTime endDate)
    {
        int monthsApart = 12 * (startDate.Year - endDate.Year) + startDate.Month - endDate.Month;
        return Math.Abs(monthsApart);
    }

    protected void txtDateOfJoin_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtDateOfJoin.Text.Trim() != string.Empty && txtDOB.Text.Trim() != string.Empty)
            {
                if (!(Utility.StringToDate(txtDOB.Text.Trim()) < Utility.StringToDate(txtDateOfJoin.Text.Trim())))
                {
                    Utility.FunShowAlertMsg(this, "Date OF Joining Should Be Between Date Of Birth And Current Date");
                    txtDateOfJoin.Text = string.Empty;
                    txtDateOfJoin.Focus();
                    return;
                }
            }
            txtDateOfJoin.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void txtIdentityColumn_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlCustomerType.SelectedItem.Text.Trim().ToLower() == "individual")
            {
                if (txtIdentityColumn.Text.Trim() != string.Empty)
                {
                    string[] strCustomerDetails = ddlNationality.SelectedText.Trim().Split('-');
                    if (strCustomerDetails[0].Trim() == "419" || strCustomerDetails[0].Trim() == "443"
                    || strCustomerDetails[0].Trim() == "453" || strCustomerDetails[0].Trim() == "456")//Oman//ddlNationality.SelectedText.Trim().ToUpper().ToUpper().Contains("OMAN") || Bahrain,Kuwait,Qatar,ARABIA
                    {
                        txtNRID.Text = txtIdentityColumn.Text.Trim();
                    }
                }
                txtIdentityIssueDate.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="strFromDate"></param>
    /// <param name="strToDate"></param>
    /// <returns></returns>
    private bool DOBFunctionCheck(string strFromDate, string strToDate)
    {
        bool blnRights = false;
        try
        {
            if (strFromDate.Trim() != string.Empty && strToDate.Trim() != string.Empty)
            {
                if (!(Utility.StringToDate(strFromDate.Trim()) < Utility.StringToDate(strToDate.Trim())))
                {
                    blnRights = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        return blnRights;
    }

    private bool DOBFunctionCheckEnd(string strFromDate, string strToDate)
    {
        bool blnRights = false;
        try
        {
            if (strFromDate.Trim() != string.Empty && strToDate.Trim() != string.Empty)
            {
                if (!(Utility.StringToDate(strFromDate.Trim()) <= Utility.StringToDate(strToDate.Trim())))
                {
                    blnRights = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        return blnRights;
    }

    protected void txtOCCIExpiryDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtOCCIExpiryDate.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtOCCIExpiryDate.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "OCCI Expiry Date Should Be Less Than Implementation End Date");
                    txtOCCIExpiryDate.Text = string.Empty;
                    txtOCCIExpiryDate.Focus();
                    return;
                }
            }

            if (txtOCCIExpiryDate.Text.Trim() != string.Empty && txtOCCIIssueDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtOCCIIssueDate.Text.Trim(), txtOCCIExpiryDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "OCCI Expiry Date should be greater than OCCI Issue Date");
                    txtOCCIExpiryDate.Text = string.Empty;
                    txtOCCIExpiryDate.Focus();
                    return;
                }
            }
            txtNonMoci.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void txtOCCIIssueDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtOCCIExpiryDate.Text.Trim() != string.Empty && txtOCCIIssueDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtOCCIIssueDate.Text.Trim(), txtOCCIExpiryDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "OCCI Issue Date Cannot Be Less Than or equal to OCCI Expiry Date");
                    txtOCCIIssueDate.Text = string.Empty;
                    txtOCCIIssueDate.Focus();
                    return;
                }
            }
            txtOCCIExpiryDate.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void txtPassportExpDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtPassportExpDate.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtPassportExpDate.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Passport Expiry Date Should Be Less Than Implementation End Date");
                    txtPassportExpDate.Text = string.Empty;
                    txtPassportExpDate.Focus();
                    return;
                }
            }

            if (txtPassportExpDate.Text.Trim() != string.Empty && txtPassportIssueDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtPassportIssueDate.Text.Trim(), txtPassportExpDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Passport Expiry Cannot Be Less Than Or Equal To  Passport Issue Date");
                    txtPassportExpDate.Text = string.Empty;
                    txtPassportExpDate.Focus();
                    return;
                }
            }
            txtProfession.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtLaborExpDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtLaborExpDate.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtLaborExpDate.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Labour Card Expiry Date Should Be Less Than Implementation End Date");
                    txtLaborExpDate.Text = string.Empty;
                    txtLaborExpDate.Focus();
                    return;
                }
            }

            if (txtLaborExpDate.Text.Trim() != string.Empty && txtLabourCardDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtLabourCardDate.Text.Trim(), txtLaborExpDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Labour Card Expiry Date should be greater than Labour Card Issue Date");
                    txtLaborExpDate.Text = string.Empty;
                    txtLaborExpDate.Focus();
                    return;
                }
            }
            cmbOccupation.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtIdentityExpiredate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtIdentityExpiredate.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtIdentityExpiredate.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, lblIdentityExpiredate.Text.Trim() + " Should Be Less Than Implementation End Date");
                    txtIdentityExpiredate.Text = string.Empty;
                    txtIdentityExpiredate.Focus();
                    return;
                }
            }

            if (txtIdentityExpiredate.Text.Trim() != string.Empty && txtIdentityIssueDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtIdentityIssueDate.Text.Trim(), txtIdentityExpiredate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, lblIdentityExpiredate.Text.Trim() + " should be greater than " + lblIdentityIssueDate.Text.Trim());
                    txtIdentityExpiredate.Text = string.Empty;
                    txtIdentityExpiredate.Focus();
                    return;
                }
            }
            ddlTitle.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void txtPassportIssueDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Issue Date with Date Of Birth
            if (txtPassportIssueDate.Text.Trim() != string.Empty && txtDOB.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtDOB.Text.Trim(), txtPassportIssueDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Passport Issue Date Cannot Be Less Than or equal to Date Of Birth");
                    txtPassportIssueDate.Text = string.Empty;
                    txtPassportIssueDate.Focus();
                    return;
                }
            }
            // To Check Expiry Date with Issue Date
            if (txtPassportExpDate.Text.Trim() != string.Empty && txtPassportIssueDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtPassportIssueDate.Text.Trim(), txtPassportExpDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Passport Issue Date Should Be greater than Passport Expiry Date");
                    txtPassportIssueDate.Text = string.Empty;
                    txtPassportIssueDate.Focus();
                    return;
                }
            }
            txtPassportExpDate.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void txtLabourCardDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Labour Issue Date with Date Of Birth
            if (txtLabourCardDate.Text.Trim() != string.Empty && txtDOB.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtDOB.Text.Trim(), txtLabourCardDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Labour Card Issue Date Cannot Be Less Than or equal to Date Of Birth");
                    txtLabourCardDate.Text = string.Empty;
                    txtLabourCardDate.Focus();
                    return;
                }
            }
            // To Check Labour Expiry Date with Issue Date
            if (txtLaborExpDate.Text.Trim() != string.Empty && txtLabourCardDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheck(txtLabourCardDate.Text.Trim(), txtLaborExpDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Labour Card Issue Date Should Be greater than Labour Card Expiry Date");
                    txtLabourCardDate.Text = string.Empty;
                    txtLabourCardDate.Focus();
                    return;
                }
            }
            txtLaborExpDate.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void FunBind_Effective_To()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "793");
            Procparam.Add("@Param1", Convert.ToString(intCompanyId));
            DataTable dtdata = Utility.GetDefaultData("S3G_ORG_GetCustomerLookUp", Procparam);
            if (dtdata.Rows.Count > 0)
            {
                txtEffectiveToDate.Text = dtdata.Rows[0][0].ToString();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void txtMaxLenLimiExpDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtMaxLenLimiExpDate.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtMaxLenLimiExpDate.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Maximum Lending Limit Expiry Date Should Be Less Than Implementation End Date");
                    txtMaxLenLimiExpDate.Text = string.Empty;
                    txtMaxLenLimiExpDate.Focus();
                    return;
                }
            }
            rbnLanCollateral.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void txtFacLimitExp_TextChanged(object sender, EventArgs e)
    {
        try
        {
            // To Check Date Of End 
            if (txtFacLimitExp.Text.Trim() != string.Empty && txtEffectiveToDate.Text.Trim() != string.Empty)
            {
                if (DOBFunctionCheckEnd(txtFacLimitExp.Text.Trim(), txtEffectiveToDate.Text.Trim()))
                {
                    Utility.FunShowAlertMsg(this, "Factoring Limit Expiry Date Should Be Less Than Implementation End Date");
                    txtFacLimitExp.Text = string.Empty;
                    txtFacLimitExp.Focus();
                    return;
                }
            }
            rbnAssignmentCollection.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }


    protected void txtResidenceOmanSince_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtResidenceOmanSince.Text.Trim() != string.Empty && txtDOB.Text.Trim() != string.Empty)
            {
                if (!(Utility.StringToDate(txtDOB.Text.Trim()) < Utility.StringToDate(txtResidenceOmanSince.Text.Trim())))
                {
                    Utility.FunShowAlertMsg(this, "Resident In Oman Since Should Be Between Date Of Birth And Current Date");
                    txtResidenceOmanSince.Text = string.Empty;
                    txtResidenceOmanSince.Focus();
                    return;
                }
            }
            txtPassportNumber.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void EnableCustomerControl()
    {
        rfvTitle.Enabled = false;
        rfvIndustryCode.Enabled = false;
        rfvcmbsub.Enabled = false;
        rfvddlBranchList.Enabled = false;
        rfvResidenceOmanSince.Enabled = false;
        rfvPassportIssueDate.Enabled = false;
        rfvPassportExpDate.Enabled = false;
        //rfvProfession.Enabled = false;
        //rfvVisaNo.Enabled = false;
        rfvLabourCardNo.Enabled = false;
        rfvLabourCardDate.Enabled = false;
        txtLaborExpDate.Enabled = false;
        rfvOccupation.Enabled = false;
        //rfvQualification.Enabled = false;
        rfvIdentityColumn.Enabled = false;
        rfvVIP.Enabled = false;
        RevIdentityColumn.Enabled = false;
        //rfvIndustryType.Enabled = false;
        rfvSenAppli.Enabled = false;
        rfvSenMemStatus.Enabled = false;
        rfvSenMemRelInd.Enabled = false;
        rfvRelaPartyind.Enabled = false;
        //rfvMaxLenLimiExpDate.Enabled = false;
        //rfvMaxLenLimiExpDate.Enabled = false;
        rfvLaborExpDate.Enabled = false;
        RevCRNUMBERVal.Enabled = false;
        RevIdentityColumn.Enabled = false;
        //rfvMaxLenLimiExpDate.Enabled = false;
        RevCRNUMBERVal.Enabled = false;
        RevCRNUMBERVal.Enabled = false;
        txtCRNumber.Enabled = false;
        txtNRID.Enabled = false;
        RegularExpressionValidator1.Enabled = false;
        rfvtxtCRNumber.Enabled = false;
        rfvCRNumber.Enabled = false;
        //rfvMaxLenLimiExpDate.Enabled = false;
        rfvMaxLenLimit.Enabled = false;
    }

    protected void txtWeddingdate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtWeddingdate.Text.Trim() != string.Empty && txtDOB.Text.Trim() != string.Empty)
            {
                if (!(Utility.StringToDate(txtDOB.Text.Trim()) < Utility.StringToDate(txtWeddingdate.Text.Trim())))
                {
                    Utility.FunShowAlertMsg(this, "Wedding Date Should Be Between Date Of Birth And Current Date");
                    txtWeddingdate.Text = string.Empty;
                    txtWeddingdate.Focus();
                    return;
                }
            }
            txtResidenceOmanSince.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void BindNonIndTypes()
    {
        if (strMode == "C" || strMode==string.Empty)
        {
            ddlNationality.SelectedValue = "100";
            ddlNationality.SelectedText = "100-SULTANATE OF OMAN";
            ddlNationality_OnSelectedIndexChanged(null, null);
            ddlTitle.SelectedValue = "5005"; // MS
            ddlConstitutionName.Focus();
        }
    }
    protected void ddlTAXApplicable_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTAXApplicable.SelectedValue == "1")
        {
            divTIN.Visible = true;
        }
        else
            divTIN.Visible = false;
    }
}

