#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Collection
/// Screen Name         :   Transaction Lander
/// Created By          :   Vijaya Kumar
/// Created Date        :   05-Oct-2010
/// Purpose             :   This is the landing screen for all the other Collection Screens
/// Last Updated By		:   Chandra Sekhar
/// Last Updated Date   :   20-Sep-2013
/// Reason              :   Auto Suggest
/// <Program Summary>
#endregion

#region How to use this
/*
   1)	Search for the word "Add Here" and add your code respectively  there...
 * 2)   Use the same stored procedure S3G_CLN_TransLander, the return table should have the first column named "ID" - to use it as the RowCommandValue
            SP return table Rule
                1)  First Column should be "ID" - which will be used as a row command
                2)  Second Column should be "Created_By" - which will be the created_By column
                3)  third should be the "User_Level_ID" - which will be the createdBy user's level id.            
            The second and third should was used to check the user authorization.
            Take latest code from - App_Code\Utility.cs
 * 3)  Add your page Program ID as a parameter (@DocumentNumber)
   4)  If you want to send any other special parameters to your SP, then you can send it – through Dictionary – ProcParam. 
   5)  Also add it – to the Common SP – Commented with your program ID
   6)  The Query String can accept 6 Parameters, 
        a) Create – (Optional)
        b) Query – (Optional)
        c) Modify – (Optional)
        d) MultipleDNC - (Optional)  - If the user wants to select the Document Number Control dynamically.
        e) DNCOption - (Optional) - If the Enduser have more than one option for the selected DNC - eg: approved,unapproved - etc.
        f) Code – (Mandatory)
            ex: 
                S3GORGTransLander.aspx?Code=FEIR	
                S3GORGTransLander.aspx?Code=SNQ&Create=0&Query=1&Modify=0
                S3GORGTransLander.aspx?Code=SNQ&Query=0
                S3GORGTransLander.aspx?Code=SNQ& Modify=0
                S3GORGTransLander.aspx?Code=CRPT&MultipleDNC=1&DNCOption=1
   7) If you use the Query string "MultipleDNC" then you want to pass the parameter "@MultipleDNC_ID" to "[S3G_ORG_Get_TransLander]" SP
   8) If you use the Query string "DNCOption" then you want to pass the parameter "@MultipleOption_ID" to "[S3G_ORG_Get_TransLander]" SP 

  */
#endregion

# region NameSpaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Globalization;
using System.Collections;
using System.Resources;
using System.ServiceModel;
using System.Text;
using System.Configuration;
using System.Web.Security;
using S3GBusEntity.Origination;
using Resources;
using System.IO;
using System.Globalization;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using iTextSharp.text.html;
using System.Web.Security;
using System.Diagnostics;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
#endregion

public partial class CLN_S3gCLNTransLander : ApplyThemeForProject
{
    # region Programs Code
    string ProgramCodeToCompare = "";                                           // this is to hold the Program Code of your web page
    public string strQueryString = "";
    // Add here - Add your Program Code Here - refer to the SQL table Program Master.
    //const string strMarketValueEntry = "CMV";
    const string strMarketValueEntry = "CLNMVE";
    const string strMarketValueEntryGL = "CLNMVGL";
    const string strMemoMaster = "CMM";
    const string strAppropriationLogic = "CAL";
    const string strFollowUp = "CFP";
    const string strDelinquentParameters = "CDL";
    const string strDealerCommissionRateParameters = "DCRMSTR";

    const string strDebtCollectorMaster = "CLNDCM";
    const string strDebtCollectorRuleCard = "CLNDCR";
    const string strManualBucketClassification = "CBC";
    const string strDemandProcessing = "CDP";
    const string strChallanGeneration = "CCG";
    const string strBucketParameter = "CBP";  // Bucket Parameter
    const string strChequeReturn = "CHR";
    const string strECSFormat = "CEC";
    const string strReceiptProcessing = "CRP";
    const string strTempReceiptProcessing = "CTR";
    const string strUTPAReceiptProcessing = "UTPAR";
    const string strECSProcess = "CEM";
    const string strECSAuthorization = "CEA";
    const string strDelinquencySpooling = "CDS";
    const string strLoanToValueSpooling = "CLV";
    const string strChequeReturnAuthorization = "CHA";
    const string strChallanRuleCreation = "CCR";
    const string strMemorandumBooking = "CMB";
    const string strIncentiveProcessing = "CDI";
    const string strPDCModule = "CPM";   // PDC Module
    const string strPDCMaintenance = "PDCM";   // PDC Maintenance
    const string strPDCReceiptProcess = "CBR";   // PDC Bulk Receipt Process   
    const string strIncomeRecognition = "CIR";
    const string strReceiptApproval = "CLNRAPL";
    public string strAutoSuggestProcName = "";
    public string strProgramId = "";
    const string strChequeReturnexcel = "CHQE"; //Added for Cheque Return Through Excel by Palani Kumar.A on 07/12/2013
    const string strECSFlatFileGen = "CEF"; //Added for Flat File Generation by Palani Kumar.A on 25/03/2014
    const string strPDCBranchAllocation = "CPBAL";
    const string strPDCPicklist = "CPPCL";
    const string strDCRemarks = "CDCRE";
    const string strDealerSalesCommissionMst = "DSEIM";
    static bool IsApprovalNeed;
    // Program Code for Enquiry Customer Appraisal
    #endregion

    #region Common Variables
    int intCreate = -1;                                                         // intCreate = 1 then display the create button, else invisible
    int intQuery = -1;                                                          // intQuery = 1 then display the Query button, else invisible
    int intModify = -1;                                                         // intModify = 1 then display the Modify button, else invisible
    int intMultipleDNC = -1;                                                    // Allow the user to select the DNC dynamically.
    int intDNCOption = -1;                                                      // Allow the user to select the further option depend on the DNC - eg: approved,unapproved etc...
    Dictionary<int, string> dictMultipleDNC = null;                             // collection for Multiple DNC - DDL
    Dictionary<int, string> dictDNCOption = null;                               // Collection for DNCOption.
    string strProcName = "S3G_CLN_TransLander";                             // this is the Stored procedure to get call                     
    string ProgramCode;                                                         // To maintain the ProgramID
    UserInfo ObjUserInfo;                                                       // to maintain the user information      
    public string strDateFormat;                                                // to maintain the standard format
    string strRedirectPage = "";                                                // page to redirect to the page in query mode
    string strRedirectCreatePage = "";                                          // page to redirect to the page in Create mode
    Dictionary<string, string> Procparam = null;                                // Dictionary to send our procedure's Parameters
    int intUserID = 0;                                                          // user who signed in
    int intCompanyID = 0;                                                       // conpany of the user who signed in   
    PagingValues ObjPaging = new PagingValues();                                // grid paging
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    bool isQueryColumnVisible;                                                  // To change the Query Column visibility - depend on the user autherization 
    bool isEditColumnVisible;                                                  // To change the Edit Column visibility - depend on the user autherization 
    string[] strLOBCodeToFilter;                                       // give the selective lob code 
    public static CLN_S3gCLNTransLander obj_TransLander = null;
    DataTable dtrecpdf = new DataTable();

    #region User Rights Access
    public static DataTable dtUserRights;
    #endregion

    static string strPageName = "Collection Translander";

    #region  User Authorization
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    #endregion


    public int ProPageNumRW                                                     // to retain the current page size and number
    {
        get;
        set;
    }
    public int ProPageSizeRW
    {
        get;
        set;
    }
    #endregion

    #region Page Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj_TransLander = this;

            #region Application Standard Date Format
            S3GSession ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;                              // to get the standard date format of the Application
            CalendarExtenderEndDateSearch.Format = strDateFormat;                       // assigning the first textbox with the End date
            CalendarExtenderStartDateSearch.Format = strDateFormat;                     // assigning the first textbox with the start date
            #endregion

            #region Common Session Values
            if (ComboBoxLOBSearch.SelectedValue != "")
            {
                System.Web.HttpContext.Current.Session["LOBAutoSuggestValue"] = ComboBoxLOBSearch.SelectedValue;
                System.Web.HttpContext.Current.Session["LOBAutoSuggestText"] = ComboBoxLOBSearch.SelectedItem.Text;
            }
            else
            {
                System.Web.HttpContext.Current.Session["LOBAutoSuggestValue"] = null;
            }
            if (hdnBranchID.Value != string.Empty)
                System.Web.HttpContext.Current.Session["BranchAutoSuggestValue"] = hdnBranchID.Value;
            else
                System.Web.HttpContext.Current.Session["BranchAutoSuggestValue"] = null;

            if (txtStartDateSearch.Text != string.Empty)
                System.Web.HttpContext.Current.Session["StartDateAutoSuggestValue"] = Utility.StringToDate(txtStartDateSearch.Text).ToString();
            else
                System.Web.HttpContext.Current.Session["StartDateAutoSuggestValue"] = null;

            if (txtEndDateSearch.Text != string.Empty)
                System.Web.HttpContext.Current.Session["EndDateAutoSuggestValue"] = Utility.StringToDate(txtEndDateSearch.Text).ToString();
            else
                System.Web.HttpContext.Current.Session["EndDateAutoSuggestValue"] = null;
            if (ddlMultipleDNC.SelectedValue != "0")
            {
                System.Web.HttpContext.Current.Session["MultipleDNCAutoSuggestValue"] = ddlMultipleDNC.SelectedValue;
            }
            else
            {
                System.Web.HttpContext.Current.Session["MultipleDNCAutoSuggestValue"] = null;
            }
            #endregion

            #region Grid Paging Config
            ProPageNumRW = 1;                                                           // to set the default page number
            TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
            if (txtPageSize.Text != "")
                ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            else
                ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
            PageAssignValue obj = new PageAssignValue(this.AssignValue);
            ucCustomPaging.callback = obj;
            ucCustomPaging.ProPageNumRW = ProPageNumRW;
            ucCustomPaging.ProPageSizeRW = ProPageSizeRW;
            #endregion

            # region User Information
            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;                                  // current user's company ID.
            intUserID = ObjUserInfo.ProUserIdRW;                                        // current user's ID
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();
            System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = intUserID.ToString();
            #region  User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bIsActive = ObjUserInfo.ProIsActiveRW;
            #endregion
            #endregion

            #region Initialize page
            bool IsQueryStringChanged = false;
            if (!(string.IsNullOrEmpty(Request.QueryString["Code"])))                   // reading the query string
            {
                // to do  : want to decrypt this code in the URL
                FunPriGetQueryStrings();
                FunPriTransactionActionButtons();
                InitPage();
                System.Web.HttpContext.Current.Session["ProgramId"] = strProgramId;
                System.Web.HttpContext.Current.Session["PageUserType"] = strUTPAReceiptProcessing;
                System.Web.HttpContext.Current.Session["ProgramCode"] = ProgramCode;
                FunPriUIVisibility();
                if (ViewState["ProgramCode"] == null)                                   // Added viewstate for the program code - to refresh the page - when the query string of the URL varys. - It will assign the program code to the view state - for the very first time the page loads.
                    ViewState["ProgramCode"] = ProgramCode;
                else                                                                    // If the program code in the URL changes then - it mean the user clicked on some other menu - so it need to refresh the page accordingly.
                {
                    if (string.Compare(ViewState["ProgramCode"].ToString(), ProgramCode) != 0)
                    {
                        IsQueryStringChanged = true;                                    // If the page changed from the current page.
                    }
                }
            }
            #endregion

            #region User Access Rights
            dtUserRights = Utility.UserAccess(0, 0, intUserID, Convert.ToInt32(strProgramId), intCompanyID);

            #region !IsPostBack or QueryString changed.
            if ((!IsPostBack) || (IsQueryStringChanged))                                // refresh the page even if the query string of the URL varys - it mean the user navigates to some other page.
            {
                ddlDocumentNumb.Clear();
                IsApprovalNeed = false;
                RFVComboLOB.ErrorMessage = ValidationMsgs.S3G_ValMsg_LOB;
                RFVComboBranch.ErrorMessage = ValidationMsgs.S3G_ValMsg_Branch;

                ViewState["ProgramCode"] = ProgramCode;
                IsQueryStringChanged = false;

                txtEndDateSearch.Attributes.Add("onchange", "fnDoDate(this,'" + txtEndDateSearch.ClientID + "','" + strDateFormat + "',false,  false);");
                txtStartDateSearch.Attributes.Add("onchange", "fnDoDate(this,'" + txtStartDateSearch.ClientID + "','" + strDateFormat + "',false,  false);");

                FunProLoadCombos();                                                     // loading the combos - LOB and Branch
                grvTransLander.Visible =
                ucCustomPaging.Visible = false;
                if (ComboBoxLOBSearch != null && ComboBoxLOBSearch.Items.Count > 0)    // to set to the default position
                    ComboBoxLOBSearch.SelectedIndex = 0;
                ddlBranch.SelectedIndex = -1;
                hdnBranchID.Value = string.Empty;

                #region  User Authorization
                if (!btnCreate.Disabled)                                                  // if the user can view the create button - depends on the query string
                {

                    //User Authorization
                    if (!bIsActive)
                    {
                        grvTransLander.Columns[1].Visible = false;
                        grvTransLander.Columns[0].Visible = false;
                        btnCreate.Enabled_False();
                        return;
                    }
                    if (!bModify)
                    {
                        grvTransLander.Columns[1].Visible = false;
                    }
                    if (!bQuery)
                    {
                        grvTransLander.Columns[0].Visible = false;
                    }
                    //Authorization Code end
                }
                #endregion
                if (ProgramCode == strChallanGeneration)
                {
                    PopulateDepositBank();
                }

                if (ProgramCode == strReceiptProcessing)
                {
                    FunPriBindReceiptTo();
                }

                ComboBoxLOBSearch.Focus();//Added by Suseela

                if (IsUserAccessChecker(1))
                {
                    btnCreate.Enabled_True();
                }
                else
                {
                    btnCreate.Enabled_False();
                }

                //if (!bCreate)
                //{
                //    btnCreate.Enabled_False();
                //}
            #endregion
                if (strProgramId == "110")
                {
                    txtStartDateSearch.Text = txtEndDateSearch.Text = DateTime.Now.Date.ToString(strDateFormat);
                }
            }
            #endregion
            ViewState["EnquiryorCustomer"] = string.Empty;

            //Customer  Code Popup Start

            ucCustomerCodeLov.strControlID = Convert.ToString(ucCustomerCodeLov.ClientID);
            TextBox txtCustItemNumber = ((TextBox)ucCustomerCodeLov.FindControl("txtItemName"));
            txtCustItemNumber.Style["display"] = "block";
            txtCustItemNumber.Attributes.Add("onfocus", "fnLoadCust()");
            txtCustItemNumber.Attributes.Add("readonly", "false");
            txtCustItemNumber.Width = 0;
            txtCustItemNumber.TabIndex = -1;
            txtCustItemNumber.BorderStyle = BorderStyle.None;
            //Customer Code Popup End

            //Account Code Popup Start
            ucAccountLov.strControlID = ucAccountLov.ClientID.ToString();
            TextBox txtAccItemNumber = ((TextBox)ucAccountLov.FindControl("txtItemName"));
            //txtAccItemNumber.Text = string.Empty;
            txtAccItemNumber.Style["display"] = "block";
            txtAccItemNumber.Attributes.Add("onfocus", "fnLoadAccount()");
            txtAccItemNumber.Attributes.Add("readonly", "false");
            txtAccItemNumber.Width = 0;
            txtAccItemNumber.TabIndex = -1;
            txtAccItemNumber.BorderStyle = BorderStyle.None;
            //Code end  


            //Added by Thangam M on 28-Sep-2013 for Row lock
            if (Session["RemoveLock"] != null)
            {
                Utility.FunPriRemoveLockedRow(intUserID, "0", "0");
                Session.Remove("RemoveLock");
            }
            if (ProgramCode == "PDCM")
            {
                btnCreate.Visible = false;
            }
            //End here
            if (ProgramCode == strDemandProcessing)
            {
                btnCreate.Visible = false;
            }
            TextBox ucCustomerCodeLov2 = ((TextBox)ucCustomerCodeLov.FindControl("TxtName"));
            ucCustomerCodeLov2.Attributes.Add("onchange", "fnTrashCommonSuggest('" + ucCustomerCodeLov.ClientID + "');");

            TextBox txtAccountNumberSuggest = ((TextBox)ucAccountLov.FindControl("TxtName"));
            txtAccountNumberSuggest.Attributes.Add("onchange", "fnTrashAccountCommonSuggest('" + ucAccountLov.ClientID + "');");

            TextBox txtDocumentNumber = ((TextBox)ddlDocumentNumb.FindControl("txtItemName"));
            txtDocumentNumber.Attributes.Add("onchange", "fnTrashSuggest('" + ddlDocumentNumb.ClientID + "')");
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    #endregion

    #region UserDefined Events
    /// <summary>
    /// To change the visibility - according to the Query String
    /// </summary>
    private void FunPriUIVisibility()
    {
        //(btnCreate.Enabled) = (intCreate == 0) ? false : true;
        if (!btnCreate.Disabled)
        {
            if (intCreate == 0)
                btnCreate.Enabled_False();
            else
                btnCreate.Enabled_True();
        }
    }

    /// <summary>
    /// To Enable/Disable your transaction page Action Buttons
    /// </summary>
    private void FunPriTransactionActionButtons()
    {

        // Add here
        switch (ProgramCode)
        {
            case strMarketValueEntry:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strMarketValueEntryGL:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strAppropriationLogic:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strFollowUp:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strMemoMaster:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strDelinquentParameters:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strDealerCommissionRateParameters:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strDebtCollectorMaster:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strDebtCollectorRuleCard:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strManualBucketClassification:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strChallanGeneration:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strBucketParameter:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strChequeReturn:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;

            case strECSFormat:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;

            case strECSProcess:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;
            case strECSFlatFileGen:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;

            case strECSAuthorization:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;

            case strDelinquencySpooling:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strLoanToValueSpooling:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strChequeReturnAuthorization:
                FunPriEnableActionButtons(true, false, true, false, false, false);
                break;
            default:
                FunPriEnableActionButtons(false, false, false, false, false, false);
                break;
            case strChallanRuleCreation:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strMemorandumBooking:
                FunPriEnableActionButtons(true, true, true, false, true, false);
                break;
            case strIncentiveProcessing:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;
            case strPDCModule:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strPDCMaintenance:
                FunPriEnableActionButtons(false, true, true, false, false, false);

                break;
            case strPDCReceiptProcess:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;

            case strIncomeRecognition:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
            case strReceiptProcessing:
                FunPriEnableActionButtons(true, true, true, true, false, false);
                break;
            case strTempReceiptProcessing:
                FunPriEnableActionButtons(true, true, true, true, false, false);
                break;
            case strUTPAReceiptProcessing:
                FunPriEnableActionButtons(true, true, true, true, false, false);
                break;
            case strDemandProcessing:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;

            case strReceiptApproval:
                FunPriEnableActionButtons(true, true, false, false, false, true);
                break;

            case strChequeReturnexcel:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;

            case strPDCBranchAllocation:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;
            case strPDCPicklist:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;
            case strDCRemarks:
                FunPriEnableActionButtons(true, true, false, false, false, false);
                break;
            case strDealerSalesCommissionMst:
                FunPriEnableActionButtons(true, true, true, false, false, false);
                break;
        }
    }

    /// <summary>
    /// This method will decide to make the Action Buttons Enable/Disable - Depending to your transaction Page.
    /// </summary>
    /// <param name="blnCreate">true to enable create button</param>
    /// <param name="blnQuery">true to enable Query Mode</param>
    /// <param name="blnModify">true to enable Modify Mode</param>
    /// <param name="blnMultipleDNC">true to enable Multiple DNC</param>
    /// <param name="blnDNCOption">true to maintain the DNC Option</param>
    private void FunPriEnableActionButtons(bool blnCreate, bool blnQuery, bool blnModify, bool blnMultipleDNC, bool blnDNCOption, bool isApprovalNeed)
    {

        intCreate = (bCreate) ? Convert.ToInt32(blnCreate) : 0; // checking user access
        intModify = (bModify) ? Convert.ToInt32(blnModify) : 0; // checking user access
        intQuery = (bQuery) ? Convert.ToInt32(blnQuery) : 0; // checking user access

        intMultipleDNC = Convert.ToInt32(blnMultipleDNC);
        intDNCOption = Convert.ToInt32(blnDNCOption);
        IsApprovalNeed = isApprovalNeed;

    }

    /// <summary>
    /// To read the values from the querystring
    /// </summary>
    private void FunPriGetQueryStrings()
    {
        if (Request.QueryString.Get("Code") != null)
            ProgramCode = (Request.QueryString.Get("Code"));
    }


    /// <summary>
    /// This is an optional dropdown box - if the user want to 
    /// display multiple DNC - then he can make use of this method.
    /// </summary>
    private void FunPriLoadMultiDNCCombo()
    {
        if (intMultipleDNC == 1)
        {
            FunPriMakeMultipleDNCVisible(lblMultipleDNC, ddlMultipleDNC, true);
            // lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = false;

            // Add here case statement here - to load the Multiple DNC DropDown.
            switch (ProgramCode)
            {
                case strReceiptProcessing:
                    FunPriLoadCombo_ReceiptMode();
                    break;
                case strTempReceiptProcessing:
                    FunPriLoadCombo_ReceiptStatus();
                    break;
                case strUTPAReceiptProcessing:
                    FunPriLoadCombo_ReceiptMode();
                    break;
                default:
                    break;
            }
        }
        else
        {
            // lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = true;
            FunPriMakeMultipleDNCVisible(lblMultipleDNC, ddlMultipleDNC, false);
        }

        if (intDNCOption == 1)
        {
            dictDNCOption = new Dictionary<int, string>();
            // Add here case statement here - to load the Multiple DNC option.
            switch (ProgramCode)
            {
                // Sample
                //case strReceiptProcessing:
                //    FunpriBindMultipleDNC(new string[] { "-- Select --", "Approved", "Unapproved" }, ddlDNCOption);
                //    break;               
            }

            FunPriMakeMultipleDNCVisible(lblDNCOption, ddlDNCOption, true);
        }
        else
        {
            FunPriMakeMultipleDNCVisible(lblDNCOption, ddlDNCOption, false);
        }

    }

    private void FunPriLoadCombo_ReceiptStatus()
    {
        if (Procparam != null)
            Procparam.Clear();
        Procparam.Add("@Option", "32");
        if (ProgramCode == strTempReceiptProcessing)
        {
            Procparam.Add("@TYPE", "1");
        }
        ddlMultipleDNC.BindDataTable("S3G_CLN_LOADLOV", Procparam, true, "-- Select --", new string[] { "LOOKUP_CODE", "LOOKUP_DESCRIPTION" });
    }

    /// <summary>
    /// This is to load the specified Dropdown list box
    /// </summary>
    /// <param name="transactions"> strings to load the dropdown </param>
    /// <param name="ddl"> target to load the dropdown list boxes </param>
    /// <param name="dict"> dictionary as a source to load the dropdown </param>
    private void FunpriBindMultipleDNC(string[] transactions, DropDownList ddl)
    {
        Dictionary<int, string> dict = new Dictionary<int, string>();
        ddl.Items.Clear();
        for (int i_value = 0; i_value < transactions.Length; i_value++)
        {
            dict.Add(i_value, transactions[i_value].ToString());
        }

        ddl.DataSource = dict;
        ddl.DataTextField = "Value";
        ddl.DataValueField = "Key";
        ddl.DataBind();
    }


    /// <summary>
    /// To change the Multiple DNC option Visibility.
    /// </summary>
    /// <param name="lMultipleDNC"> Label to change its visibility </param>
    /// <param name="dDNCOption"> dropdown to change its visibility </param>
    /// <param name="blnMakeVisible">boolean - to set the visibility</param>
    private void FunPriMakeMultipleDNCVisible(Label lMultipleDNC, DropDownList dDNCOption, bool blnMakeVisible)
    {
        //dDNCOption.Visible =
        //lMultipleDNC.Visible = blnMakeVisible;
        divDNCOption.Visible = blnMakeVisible;
        divMultipleDocNo.Visible = blnMakeVisible;
        if (strProgramId == "100")
        {
            divMultipleDocNo.Visible = false;
        }
        if (strProgramId == "110")
        {
            divMultipleDocNo.Visible = true;
        }
    }

    /// <summary>
    /// This method will Initialize the page depend on the document Number Code passed.
    /// </summary>
    protected void InitPage()
    {
        // Add here - your case condition - with respect to you program Code 
        // only If you're not passing the MultipleDNC Query String.
        // if you want to pass the LOB and branch as a query string - then make a call to FunPriQueryString();
        btnCreate.Visible = true;

        //cmbCustomerCode.Visible = false;
        //ucCustomerCodeLov.Visible = false;
        //lblCustomerCode.Visible = false;
        divCustomerCode.Visible = divAccountLOV.Visible = false;



        // lblDNCOption.Visible = ddlDNCOption.Visible = false;
        divDNCOption.Visible = false;
        dvDepositBank.Visible = false;

        ComboBoxLOBSearch.Enabled = ddlBranch.Enabled = true;
        //ComboBoxBranchSearch.Enabled = true;
        ddlBranch.Enabled = true;
        lblEndDateSearch.Text = "End Date";// Declared in common for all other screens
        lblStartDateSearch.Text = "Start Date";
        RFVStartDate.ErrorMessage = "Enter Start Date";
        RFVEndDate.ErrorMessage = "Enter End Date";
        switch (ProgramCode)
        {

            case strMarketValueEntry:
                strProgramId = "89";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strMarketValueEntry;
                this.Title = "S3G - Market Value Entry";
                lblProgramIDSearch.Text = "MV Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnMarketValueEntry.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetMVNumber_AGT";
                break;
            case strMarketValueEntryGL:
                strProgramId = "257";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strMarketValueEntryGL;
                this.Title = "S3G - Market Value Entry";
                lblProgramIDSearch.Text = "MV Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnMarketValueEntry_GL.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetMVNumber_AGT";
                break;
            case strAppropriationLogic:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strAppropriationLogic;
                this.Title = "S3G - Appropriation Logic";
                lblProgramIDSearch.Text = "Appropriation ID";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnAppropriationLogic.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strFollowUp:
                strProgramId = "118";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strFollowUp;
                this.Title = "S3G - Follow Up Process";
                lblProgramIDSearch.Text = "FollowUp No";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnFollowUpInstructions.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetFollowUpId_AGT";
                break;

            case strMemoMaster:
                FunPubIsVisible(true, false, false);
                //FunPubIsMandatory(true, true, false, false);
                FunPubIsMandatory(false, false, true, true);
                ProgramCodeToCompare = strMemoMaster;
                this.Title = "S3G - Memo Master";
                //lblProgramIDSearch.Text = "Memo Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GCLNMemoDetails_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strECSFormat:
                FunPubIsVisible(true, true, false);
                FunPubIsMandatory(true, true, false, false);
                ProgramCodeToCompare = strECSFormat;
                this.Title = "S3G - ECS Spool Format Details";
                //lblProgramIDSearch.Text = "MV Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnECSSpoolFormatDetails_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strECSProcess:
                strProgramId = "111";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strECSProcess;
                this.Title = "S3G - ECS Process";
                lblProgramIDSearch.Text = "ECS Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnECSProcess.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetECSNo_AGT";
                break;

            case strECSFlatFileGen:
                strProgramId = "112";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strECSFlatFileGen;
                this.Title = "S3G - ECS Flat File Generation";
                lblProgramIDSearch.Text = "ECS Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnECSFlatFileGeneration.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetECSFlatFileGenNo_AGT";
                break;

            case strECSAuthorization:
                strProgramId = "116";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strECSAuthorization;
                this.Title = "S3G - ECS Authorization";
                lblProgramIDSearch.Text = "ECS Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnECSAuthorization.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetECSNo_AGT";
                break;

            case strDelinquencySpooling:
                strProgramId = "101";
                FunPubIsVisible(true, true, false);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDelinquencySpooling;
                this.Title = "S3G - Delinquency Spooling";
                lblProgramIDSearch.Text = "";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnDelinquencySpooling_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                btnCreate.Visible = false;
                break;

            case strDelinquentParameters:
                strProgramId = "90";
                FunPubIsVisible(true, false, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDelinquentParameters;
                //ComboBoxBranchSearch.Enabled = false;
                ddlBranch.Enabled = false;
                this.Title = "S3G - Delinquency Parameter";
                lblProgramIDSearch.Text = ddlDocumentNumb.ToolTip = "Delinquency Number";
                strRedirectPage = "~/PDC Module/S3GClnDelinquent_Parameter_Add.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetDelinquents_AGT";
                break;

            case strDealerCommissionRateParameters:
                strProgramId = "550";
                FunPubIsVisible(true, false, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDealerCommissionRateParameters;
                //ComboBoxBranchSearch.Enabled = false;
                ddlBranch.Enabled = false;
                this.Title = "S3G - Dealer Commission Rate Master";
                lblProgramIDSearch.Text = "Dealer Commission Rate Master";
                strRedirectPage = "~/PDC Module/S3GDealerCommissionRateMaster.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetDelinquents_AGT";
                //  grvTransLander.Rows[0].Visible = false;
                break;

            case strDebtCollectorMaster:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDebtCollectorMaster;
                this.Title = "S3G - Debt Collector Master";
                lblProgramIDSearch.Text = "Debt Collector";
                strRedirectPage = "~/PDC Module/S3GClnDebtCollector_Add.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strDebtCollectorRuleCard:
                strProgramId = "94";
                FunPubIsMandatory(false, false, false, false);
                FunPubIsVisible(true, true, true);
                ProgramCodeToCompare = strDebtCollectorRuleCard;
                this.Title = "S3G - Debt Collector RuleCard";
                lblProgramIDSearch.Text = "Debt Collector Rule Card";
                strRedirectPage = "~/PDC Module/S3GClnDebtCollectorRuleCard_Add.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetDebtCollectorRuleCard_Code";
                break;

            case strManualBucketClassification:

                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, true, true);
                ProgramCodeToCompare = strManualBucketClassification;
                this.Title = "S3G - Manual Bucket Classification";
                lblProgramIDSearch.Text = "Debt Collector Code";
                strRedirectPage = "~/PDC Module/S3GClnManualBucketClassification.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=M";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                lblEndDateSearch.Text = "Period End To";// Declared For Manual Bucket Classification
                lblStartDateSearch.Text = "Period Start From";
                RFVStartDate.ErrorMessage = "Enter  Period Start from";
                RFVEndDate.ErrorMessage = "Enter  Period End To";
                btnCreate.Visible = false;
                strAutoSuggestProcName = "S3G_CLN_GetDebtCollectorCodecombo_AGT";
                break;

            case strReceiptProcessing:
                strProgramId = "110";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strReceiptProcessing;
                this.Title = "S3G - Receipt Processing";
                lblProgramIDSearch.Text = "Receipt No.";                                         // This is to display on the Document Number Label                
                //Chandu On 3-Sep-2013
                //lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = true;
                lblProgramIDSearch.Visible = ddlDocumentNumb.Visible = true;
                //Chandu
                lblMultipleDNC.Text = "Mode";
                divMultipleDocNo.Visible = true;
                strRedirectPage = "~/PDC Module/S3GClnReceiptProcessing.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C"; ;        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "s3g_cln_LoadReceiptNo_AGT";
                //SEARCH OPTIONS ADDED By Arunkumar K on 24-Sep-2016
                lblStatusSearch.Text = "Customer Name ";
                ddlStatus.Visible = lblStatusSearch.Visible = false;
                divAccountLOV.Visible = divCustomerCode.Visible = divReceiptTo.Visible = true;
                //SEARCH OPTIONS ADDED By Arunkumar K on 24-Sep-2016
                ucAccountLov.strLOV_Code = "ACC_ACCPKL";
                break;

            case strTempReceiptProcessing:
                strProgramId = "135";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strTempReceiptProcessing;
                this.Title = "S3G - Temp Receipt Processing";
                lblProgramIDSearch.Text = "Temp Receipt No.";
                //Chandu On 3-Sep-2013
                //lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = true; // This is to display on the Document Number Label                
                lblProgramIDSearch.Visible = ddlDocumentNumb.Visible = true;
                //Chandu

                strRedirectPage = "~/PDC Module/S3GClnTempReceiptProcessing.aspx";        // page to redirect to the page in edit mode
                lblMultipleDNC.Text = "Status";
                strRedirectCreatePage = strRedirectPage;        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "s3g_cln_LoadTempReceiptNo_AGT";
                break;
            case strUTPAReceiptProcessing:
                strProgramId = "196";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strUTPAReceiptProcessing;
                this.Title = "S3G - UTPA Receipt Processing";
                lblProgramIDSearch.Text = "UTPA Receipt No.";
                //Chandu On 3-Sep-2013
                //lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = true; // This is to display on the Document Number Label                
                lblProgramIDSearch.Visible = ddlDocumentNumb.Visible = true;
                //Chandu
                lblMultipleDNC.Text = "Mode";
                strRedirectPage = "~/PDC Module/S3GClnUTPAReceiptProcessing.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage;        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "s3g_cln_LoadUTPAReceiptNo_AGT";
                break;
            case strChallanGeneration:
                strProgramId = "96";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strChallanGeneration;
                this.Title = "S3G - Deposit slip Generation";
                lblProgramIDSearch.Text = "Deposit slip Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnChallanGeneration.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_CHALLANGENNO_AGT";
                dvDepositBank.Visible = true;
                break;
            // Bucket Parameter --Irsathameen
            case strBucketParameter:
                strProgramId = "92";
                FunPubIsVisible(true, true, false);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strBucketParameter;
                this.Title = "S3G - Bucket Parameter";
                lblProgramIDSearch.Text = "Bucket Parameter Number";                                         // This is to display on the Document Number Label                                
                strRedirectPage = "~/PDC Module/S3GClnBucketParameter.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetBucketparameterID_AGT";
                break;

            case strChequeReturn:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strChequeReturn;
                strProgramId = "98";
                this.Title = "S3G - Cheque Return";
                lblProgramIDSearch.Text = "Cheque Number - Receipt Number";
                strRedirectPage = "~/PDC Module/S3GClnChequeReturn_Add.aspx";
                //strRedirectPage = "~/PDC Module/S3GClnChequeReturn_Mlti.aspx";
                //strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                strRedirectCreatePage = "~/PDC Module/S3GClnChequeReturn_Mlti.aspx" + "?qsMode=C";
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strAutoSuggestProcName = "S3G_CLN_GetChequesReturned_AGT";
                divCustomerCode.Visible = divAccountLOV.Visible = true;
                ucAccountLov.strLOV_Code = "ACC_ACCPKL";
                break;

            case strLoanToValueSpooling:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(true, false, false, false);
                ProgramCodeToCompare = strLoanToValueSpooling;
                this.Title = "S3G - Loan To Value Spooling";
                lblProgramIDSearch.Text = "Loan To Value Spooling";
                strRedirectPage = "~/PDC Module/S3gClnLoanToValueSpooling.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strChequeReturnAuthorization:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(true, true, false, false);
                ProgramCodeToCompare = strChequeReturnAuthorization;
                this.Title = "S3G - Cheque Return Authorization";
                lblProgramIDSearch.Text = "Cheque Return Number";
                strRedirectPage = "~/PDC Module/S3GClnChequeReturn_Authorization.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strAutoSuggestProcName = "S3G_CLN_GetChequesReturned_AGT";

                break;

            // Challan Rule Creation --Irsathameen
            case strChallanRuleCreation:
                strProgramId = "105";
                FunPubIsVisible(true, true, false);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strChallanRuleCreation;
                this.Title = "S3G - Challan Rule Creation";
                lblProgramIDSearch.Text = "Challan Rule Number";                                         // This is to display on the Document Number Label                                
                strRedirectPage = "~/PDC Module/S3GClnChallanRuleCreation.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strMemorandumBooking:
                strProgramId = "100";
                divMultipleDocNo.Visible = false;
                FunPubIsVisible(true, true, false);
                //ucCustomerCodeLov.Visible = true;
                //lblCustomerCode.Visible = true;
                divCustomerCode.Visible = true;
                //cmbCustomerCode.Visible = true;

                lblDNCOption.Visible = ddlDNCOption.Visible = true;
                divDNCOption.Visible = true;
                ucCustomerCodeLov.strLOV_Code = "CUS_MEMO_TL";
                lblDNCOption.Text = "Memo Type";
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strMemorandumBooking;
                this.Title = "S3G - Memorandum Booking";
                lblProgramIDSearch.Text = "Memorandum Booking";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnMemorandumBooking_Add.aspx";                    // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";                                  // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                divCustomerCode.Visible = divAccountLOV.Visible = true;
                ucAccountLov.strLOV_Code = "ACC_MEMO_TL";
                break;

            case strIncentiveProcessing:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, true, true);
                ProgramCodeToCompare = strIncentiveProcessing;
                this.Title = "S3G - Debt Collection Incentive Processing";
                lblProgramIDSearch.Text = "Debt Collector Code";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnDCIncentive_Processing.aspx";                    // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                lblEndDateSearch.Text = "Period End To";// Declared For Manual Bucket Classification
                lblStartDateSearch.Text = "Period Start From";// page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetDebtCollectorCodecombo_AGT";
                break;

            // PDC Module 
            case strPDCModule:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                strProgramId = "106";
                ProgramCodeToCompare = strPDCModule;
                this.Title = "S3G - PDC Entry";
                lblProgramIDSearch.Text = "PDC Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strRedirectPage = "~/PDC Module/S3GClnPDCEntry.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GetPDCModuleID_AGT";
                divCustomerCode.Visible = divAccountLOV.Visible = true;
                ucAccountLov.strLOV_Code = "ACC_ACCPKL";
                break;


            // PDC Maintenance
            case strPDCMaintenance:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                strProgramId = "321";
                ProgramCodeToCompare = strPDCMaintenance;
                this.Title = "S3G - PDC Maintenance";
                lblProgramIDSearch.Text = "PDC Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strRedirectPage = "~/PDC Module/S3G_CLN_PDCMaintenance.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GetPDCModuleID_AGT";
                divCustomerCode.Visible = divAccountLOV.Visible = true;
                ucAccountLov.strLOV_Code = "ACC_ACCPKL";
                break;

            // PDC Receipt Processing
            case strPDCReceiptProcess:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strPDCReceiptProcess;
                strProgramId = "109";
                this.Title = "S3G - PDC Bulk Receipt Process ";
                lblProgramIDSearch.Text = "Picklist Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strRedirectPage = "~/PDC Module/S3GClnBulkReceiptProcessing_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GET_PDCPIKLISTNO_AGT";
                divCustomerCode.Visible = divAccountLOV.Visible = true;
                ucAccountLov.strLOV_Code = "ACC_ACCPKL";
                break;

            case strDemandProcessing:
                strProgramId = "108";
                FunPubIsVisible(true, false, false);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDemandProcessing;
                this.Title = "S3G - Demand Processing";
                lblProgramIDSearch.Text = "Demand Processing Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnDemandProcessing.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                break;

            case strReceiptApproval:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strReceiptApproval;
                this.Title = "S3G - Receipt Approval";
                lblProgramIDSearch.Text = "Receipt Number";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3GClnReceiptApproval.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GetReceiptNo";
                break;

            case strChequeReturnexcel:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                strProgramId = "260";
                ProgramCodeToCompare = strChequeReturnexcel;
                this.Title = "S3G - Cheque Returns Through Excel";
                lblProgramIDSearch.Text = "Upload File Name";                                         // This is to display on the Document Number Label                
                strRedirectPage = "~/PDC Module/S3G_Cln_ChequeReturnUpload.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";        // page to redirect to the page in edit mode                
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                strAutoSuggestProcName = "S3G_CLN_GETCHQRTNUPLD_AGT";
                //lob.Visible = lob1.Visible = location.Visible = location1.Visible = false;
                //ComboBoxLOBSearch.Enabled = ddlBranch.Enabled = lblLOBSearch.Enabled = lblBranchSearch.Enabled = false;
                break;
            case strPDCBranchAllocation:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strPDCBranchAllocation;
                strProgramId = "575";
                this.Title = "S3G - PDC Branch Allocation";
                lblProgramIDSearch.Text = "Receipt Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = "PDC Branch Allocation - Details";
                strRedirectPage = "~/PDC Module/S3GClnPDCBulkAllocation_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GetPDCReceiptProcessID_AGT";
                break;
            case strPDCPicklist:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strPDCPicklist;
                strProgramId = "576";
                this.Title = "S3G - PDC Picklist for check return";
                lblProgramIDSearch.Text = "Receipt Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = "PDC Picklist for check return - Details";
                strRedirectPage = "~/PDC Module/S3GClnPDCPickList_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GET_PDCPIKLISTNO_AGT";
                break;
            case strDCRemarks:
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDCRemarks;
                strProgramId = "577";
                this.Title = "S3G - Debt Collector Diary & Remarks Entry";
                lblProgramIDSearch.Text = "Remark Number";                      // This is to display on the Document Number Label                
                lblHeading.Text = "Debt Collector Diary & Remarks Entry - Details";
                strRedirectPage = "~/PDC Module/S3GClnDCRemarks_Add.aspx";        // page to redirect to the page in edit mode
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";       // page to redirect to the page in edit mode                                
                strAutoSuggestProcName = "S3G_CLN_GetPDCReceiptProcessID_AGT";
                break;
            case strDealerSalesCommissionMst:
                strProgramId = "584";
                FunPubIsVisible(true, true, true);
                FunPubIsMandatory(false, false, false, false);
                ProgramCodeToCompare = strDealerSalesCommissionMst;
                this.Title = "S3G - Dealer Sales Commission Master";
                lblHeading.Text = FunPriSetProgramName() + " - Details";
                lblProgramIDSearch.Text = "Slab Code";
                strRedirectPage = "~/PDC Module/S3GDealerSalesCommissionRateMaster.aspx";
                strRedirectCreatePage = strRedirectPage + "?qsMode=C";
                //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                strAutoSuggestProcName = "S3G_CLN_GET_DSCMASTER_AGT";
                break;
        }

    }


    private void FunPriFilterAndLoadLOB()
    {

        if (ComboBoxLOBSearch != null && ComboBoxLOBSearch.DataSource != null)
        {
            DataTable dtLOB = (DataTable)ComboBoxLOBSearch.DataSource;
            if (dtLOB != null && dtLOB.Rows.Count > 0)
            {
                StringBuilder strddlItem = new StringBuilder();
                for (int i_lob = 0; i_lob < strLOBCodeToFilter.Length; i_lob++)
                {
                    strddlItem.Append(" LOB_Code like '" + strLOBCodeToFilter[i_lob] + "' or ");
                }
                strddlItem.Append(" LOB_Code like '" + strLOBCodeToFilter[0] + "'");

                dtLOB.DefaultView.RowFilter = strddlItem.ToString();

                ComboBoxLOBSearch.Items.Clear();

                //dtLOB.Columns.Add("DataText", typeof(string), "LOB_Code+'  -  '+LOB_Name");

                ComboBoxLOBSearch.DataValueField = "LOB_ID";
                ComboBoxLOBSearch.DataTextField = "DataText";

                ComboBoxLOBSearch.DataSource = dtLOB;

                ComboBoxLOBSearch.DataBind();

                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                ComboBoxLOBSearch.Items.Insert(0, liSelect);

            }

        }

    }


    /// <summary>
    /// To set the LOB and Branch Mandatory/NonMandatory
    /// </summary>
    /// <param name="isLOBMandatory">true to set the LOB DDL Mandatory</param>
    /// <param name="isBranchMandatory">true to set the Branch DDL Mandatory</param>
    private void FunPubIsMandatory(bool isLOBMandatory, bool isBranchMandatory, bool isStartDateMandatory, bool isEndDateMandatory)
    {
        // To make the LOB and Branch Non-Mandatory
        RFVComboBranch.Enabled = isBranchMandatory;
        RFVComboLOB.Enabled = isLOBMandatory;
        RFVStartDate.Enabled = isStartDateMandatory;
        RFVEndDate.Enabled = isEndDateMandatory;
        // To change the Label style to Non mandatory
        lblLOBSearch.CssClass = (isLOBMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
        lblBranchSearch.CssClass = (isBranchMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel"; ;
        lblStartDateSearch.CssClass = (isStartDateMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
        lblEndDateSearch.CssClass = (isEndDateMandatory) ? "styleReqFieldLabel" : "styleDisplayLabel";
    }

    /// <summary>
    /// To set the LOB and Branch visible/NonVisible
    /// </summary>
    /// <param name="isLOBMandatory">true to set the LOB DDL Mandatory</param>
    /// <param name="isBranchMandatory">true to set the Branch DDL Mandatory</param>
    private void FunPubIsVisible(bool isLOB, bool isBranch, bool isMultipleDNC)
    {
        // To make the LOB and Branch Non-Mandatory
        RFVComboBranch.Enabled = isBranch;
        RFVComboLOB.Enabled = isLOB;
        // To change the Label style to Non mandatory
        lblLOBSearch.CssClass = (isLOB) ? "styleReqFieldLabel" : "styleDisplayLabel";
        ComboBoxLOBSearch.Visible = lblLOBSearch.Visible = isLOB;

        lblBranchSearch.CssClass = (isBranch) ? "styleReqFieldLabel" : "styleDisplayLabel"; ;
        //ComboBoxBranchSearch.Visible = lblBranchSearch.Visible = isBranch;
        //ddlBranch.Visible = lblBranchSearch.Visible = isBranch;
        divBranch.Visible = lblBranchSearch.Visible = isBranch;


        //Chandu On 3-Sep-2013
        //lblProgramIDSearch.Visible = cmbDocumentNumberSearch.Visible = isMultipleDNC;
        lblProgramIDSearch.Visible = ddlDocumentNumb.Visible = isMultipleDNC;
        //Chandu


    }

    /// <summary>
    /// To Bind the Landing Grid
    /// </summary>
    /// <param name="intPageNum"> Current Page Number of the grid </param>
    /// <param name="intPageSize"> Current Page size of the grid </param>
    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;              // To set the page Number
        ProPageSizeRW = intPageSize;            // To set the page size    
        FunPriBindGrid();                       // Binding the Landing grid
    }

    /// <summary>
    /// This is tp load the combo(s) in the page.
    /// </summary>
    protected void FunProLoadCombos()
    {
        Procparam = new Dictionary<string, string>();

        // LOB ComboBoxLOBSearch
        if (Procparam != null)
            Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        Procparam.Add("@User_ID", Convert.ToString(intUserID));
        Procparam.Add("@Program_ID", strProgramId);
        // Procparam.Add("@Is_Active", "1");    //Modified by tamilselvan on 21/06/2011 for translender screen All active and Inactive LOB sholud come
        if (ProgramCode == strMarketValueEntry || ProgramCode == strMarketValueEntryGL)  ///Added by Manikandan. R on 28/12/2011 for fetching the Market Value Entry
            Procparam.Add("@FilterOption", "'HP','LN','FL'");
        //if (ProgramCode == strPDCModule)
        //{
        //    Procparam.Add("@FilterOption", "'FL','HP','LN','OL','TE','TL'");
        //}
        if (ProgramCode == strDelinquencySpooling)
        {
            Procparam.Add("@FilterOption", "'TL' ,'FL', 'OL', 'TE', 'LN', 'HP'");
        }

        if (ProgramCode == strReceiptProcessing)
        {
            Procparam.Add("@Is_Active", "1");
        }

        if (ProgramCode == strDemandProcessing)
        {
            ComboBoxLOBSearch.BindDataTable("S3G_Cln_GetDemandLOB", Procparam, true, "-- Select --", new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
        }
        else if (ProgramCode == strECSProcess || ProgramCode == strECSAuthorization || ProgramCode == strECSFlatFileGen)
        {
            ComboBoxLOBSearch.BindDataTable("S3G_CLN_GetECS_LOB", Procparam, true, "-- Select --", new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
        }
        else if (ProgramCode == strUTPAReceiptProcessing)
        {
            //Changed By Thangam M on 22/Mar/2012 to fix bug id - 6058
            // LOB ComboBoxLOBSearch For UTPA Login
            Procparam.Clear();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@UTPA_ID", intUserID.ToString());
            Procparam.Add("@Program_ID", strProgramId);
            ComboBoxLOBSearch.BindDataTable("S3G_Get_UTPA_LOB_LIST", Procparam, true, "-- Select --", new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });

            //Procparam.Remove("@Program_ID");
            //Procparam.Add("@option", "1");
            //ComboBoxLOBSearch.BindDataTable("s3g_cln_utpatransLov", Procparam, true, "-- Select --", new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
        }
        else if (ProgramCode == strBucketParameter)
        {
            Procparam.Add("@Is_Active", "1");
            ComboBoxLOBSearch.BindDataTable(SPNames.LOBMaster, Procparam, true, "-- ALL --", new string[] { "LOB_ID", "LOB_Name" });
        }
        else if (ProgramCode == strDelinquentParameters || ProgramCode == strChallanGeneration)
        {
            Procparam.Add("@Is_Active", "1");
            ComboBoxLOBSearch.BindDataTable(SPNames.LOBMaster, Procparam, true, "-- ALL --", new string[] { "LOB_ID", "LOB_Name" });
        }
        else
            ComboBoxLOBSearch.BindDataTable(SPNames.LOBMaster, Procparam, true, "-- Select --", new string[] { "LOB_ID", "LOB_Name" });

        // branch
        //FunPriLoadLocationCombo();

        // Loading Multiple DNC

        FunPriLoadMultiDNCCombo();

        FunPriLoadDNCCombo();

        //binding Location start

        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        Procparam.Add("@User_ID", Convert.ToString(intUserID));
        Procparam.Add("@Option", "1");
        //Procparam.Add("@IS_ACTIVE", "1");
        Procparam.Add("@Program_ID", strProgramId);
        if (ProgramCode == strBucketParameter)
            ddlBranch.BindDataTable("S3G_GET_LOCATION", Procparam, true, "--ALL--", new string[] { "BRANCH_ID", "BRANCH" });
        else
            ddlBranch.BindDataTable("S3G_GET_LOCATION", Procparam, true, "--Select--", new string[] { "BRANCH_ID", "BRANCH" });

        //binding Location end

        switch (ProgramCode)
        {
            case "1": // temp., remove this while adding your first case....
                break;


            default:
                break;
        }



    }


    //private void FunPriLoadLocationCombo()
    //{
    //    // branch
    //    Procparam = new Dictionary<string, string>();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    Procparam.Add("@Program_ID", strProgramId);
    //    if (ProgramCode == strUTPAReceiptProcessing)
    //    {
    //        //Changed By Thangam M on 22/Mar/2012 to fix bug id - 6058
    //        Procparam.Clear();
    //        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //        Procparam.Add("@UTPA_ID", Convert.ToString(intUserID));
    //        Procparam.Add("@Is_Active", "1");
    //        Procparam.Add("@Program_ID", strProgramId);
    //        if (ComboBoxLOBSearch.SelectedValue != "0")
    //        {
    //            Procparam.Add("@LOB_ID", ComboBoxLOBSearch.SelectedValue.ToString());
    //        }
    //        else
    //        {
    //            Procparam.Add("@LOB_ID", "0");
    //        }
    //        ComboBoxBranchSearch.BindDataTable("S3G_Get_UTPA_Branch_List", Procparam, true, "-- Select --", new string[] { "Location_Id", "Location" });

    //        //Procparam.Remove("@Program_ID");
    //        //Procparam.Add("@option", "2");
    //        //ComboBoxBranchSearch.BindDataTable("s3g_cln_utpatransLov", Procparam, true, "-- Select --", new string[] { "Location_Id", "Location" });
    //    }
    //    else
    //    {
    //        //Procparam.Add("@Is_Active", "1");    //Modified by tamilselvan on 21/06/2011 for translender screen All active and Inactive Branch sholud come
    //        ComboBoxBranchSearch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, true, "-- Select --", new string[] { "Location_Id", "Location" });
    //    }
    //}


    /// <summary>
    /// Will load the DNC Combo
    /// </summary>
    //private void FunPriLoadDNCCombo()
    //{
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    else
    //        Procparam = new Dictionary<string, string>();

    //    // Add Here - your case statement blow if needed
    //    // Document Number Combo - Before add your code check if the common Function was available.       
    //    switch (ProgramCode)
    //    {
    //        case strMarketValueEntry:                         // Market Value Entry
    //            FunPriLoadCombo_MarketValueNumber();
    //            break;

    //        case strAppropriationLogic:                         // Appropriate Logic
    //            FunPriLoadCombo_AppropriateNumber();
    //            break;
    //        case strFollowUp:                         // Appropriate Logic
    //            FunPriLoadCombo_FollowUp();
    //            break;
    //        case strDelinquentParameters:
    //            FunPriLoadCombo_Delinquency();
    //            break;
    //        case strDebtCollectorMaster:
    //            FunPriLoadCombo_DebtCollector();
    //            break;
    //        case strDebtCollectorRuleCard:
    //            FunPriLoadCombo_DebtCollectorRuleCard();
    //            break;
    //        case strManualBucketClassification:
    //            FunPriLoadCombo_ManualBucketClassification();
    //            break;
    //        case strChallanGeneration:
    //            FunPriLoadCombo_ChallanGeneration();
    //            break;
    //        case strBucketParameter:
    //            FunPriLoadCombo_BucketParameter();
    //            break;
    //        case strECSProcess:
    //            FunPriLoadCombo_ECSProcess();
    //            break;
    //        case strECSAuthorization:
    //            FunPriLoadCombo_ECSAuthorization();
    //            break;
    //        case strDelinquencySpooling:
    //            //FunPriLoadCombo_ECSProcess();
    //            break;
    //        case strChequeReturn:
    //            FunPriLoadCombo_ChequesReturned();
    //            break;
    //        case strChallanRuleCreation:
    //            FunPriLoadCombo_ChallanRuleCreation();
    //            break;
    //        case strMemorandumBooking:
    //            FunPriLoadCustomer_MemorandumBooking();
    //            break;
    //        case strIncentiveProcessing:
    //            FunPriLoadCombo_DebtCollectorCode();
    //            break;
    //        case strPDCModule:
    //            FunPriLoadCombo_PDCModuleCreation();
    //            break;
    //        case strPDCReceiptProcess:
    //            FunPriLoadCombo_PDCReceiptProcess();
    //            break;
    //        case strIncomeRecognition:
    //            FunPriLoadCombo_FrequencyType();
    //            break;
    //        case strReceiptApproval:
    //            FunPriLoadCombo_ReceiptApproval();
    //            break;
    //        case strReceiptProcessing:
    //            FunPriLoadCombo_ReceiptNo();
    //            break;
    //        case strTempReceiptProcessing:
    //            FunPriLoadCombo_TempReceiptNo();
    //            break;
    //        case strUTPAReceiptProcessing:
    //            FunPriLoadCombo_UTPAReceiptNo();
    //            break;
    //        default:
    //            // to do: disable the page 
    //            break;
    //    }
    //}
    private void FunPriLoadDNCCombo()
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();

        // Add Here - your case statement blow if needed
        // Document Number Combo - Before add your code check if the common Function was available.       
        switch (ProgramCode)
        {
            case strDebtCollectorMaster:
                FunPriLoadCombo_DebtCollector();
                break;
            case strMemorandumBooking:
                FunPriLoadCustomer_MemorandumBooking();
                break;
            default:
                // to do: disable the page 
                break;
        }
    }
    //private void FunPriLoadCombo_UTPAReceiptNo()
    //{
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    // if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    if (ddlMultipleDNC.SelectedValue != "0") Procparam.Add("@PaymentMode", ddlMultipleDNC.SelectedValue);
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("s3g_cln_LoadUTPAReceiptNo", Procparam, true, "-- Select --", new string[] { "ID", "Receipt_No" });

    //}



    /// <summary>
    ///  Load the Document Number Combo Box with Market Value Number
    /// </summary>
    /// 

    //private void FunPriLoadCombo_Delinquency()
    //{
    //    //throw new NotImplementedException();
    //    try
    //    {
    //        if (Procparam != null)
    //            Procparam.Clear();
    //        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //        Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //        if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //            Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //        if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //            Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //        if (ComboBoxLOBSearch.SelectedIndex > 0)
    //            Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //        //Chandu 3-Sep-2013
    //        //cmbDocumentNumberSearch.BindDataTable(SPNames.S3G_CLN_GetDelinquents, Procparam, true, "--Select--", new string[] { "ID", "Delinquent_No" });
    //    }
    //    catch (Exception ex)
    //    {

    //    }

    //}

    //private void FunPriLoadCombo_ChequesReturned()
    //{
    //    //throw new NotImplementedException();
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    //Sourse Modified by Tamilselvan.S on 18/01/2011 column name changed ChequeReturn_No to Cheque_Return_Advice_No
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable(SPNames.S3G_CLN_GetChequesReturned, Procparam, true, "--Select--", new string[] { "ID", "Cheque_Return_Advice_No" });

    //}

    //private void FunPriLoadCombo_MarketValueNumber()
    //{


    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //    {
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    }
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //{
    //    //    Procparam.Add("@Location", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    //}
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //    {
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    }
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //    {
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    }

    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable(SPNames.S3G_CLN_GetMVNumber, Procparam, true, "-- Select --", new string[] { "Market_Value_ID", "Market_Value_ID" });


    //}

    /// <summary>
    ///  Load the Document Number Combo Box with ECS Number
    /// </summary>
    //private void FunPriLoadCombo_ECSProcess()
    //{
    //    //FunPri_LOB_Branch();
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    Procparam.Add("@Program_ID", strProgramId);
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    // if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetECSNo", Procparam, true, "-- Select --", new string[] { "ID", "ECS_No" });

    //}
    private void FunPriLoadCombo_ReceiptMode()
    {
        //FunPri_LOB_Branch();
        if (Procparam != null)
            Procparam.Clear();
        Procparam.Add("@Option", "8");
        //if (ProgramCode == strReceiptProcessing)
        //{
        //    Procparam.Add("@TYPE", "1");
        //}
        ddlMultipleDNC.BindDataTable("S3G_CLN_LOADLOV", Procparam, true, "-- Select --", new string[] { "LOOKUP_CODE", "LOOKUP_DESCRIPTION" });

    }

    //private void FunPriLoadCombo_ReceiptNo()
    //{
    //    //FunPri_LOB_Branch();
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    if (ddlMultipleDNC.SelectedValue != "0") Procparam.Add("@PaymentMode", ddlMultipleDNC.SelectedValue);
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("s3g_cln_LoadReceiptNo", Procparam, true, "-- Select --", new string[] { "ID", "Receipt_No" });

    //}
    //private void FunPriLoadCombo_TempReceiptNo()
    //{
    //    //FunPri_LOB_Branch();
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    if (ddlMultipleDNC.SelectedValue != "0") Procparam.Add("@MULTIPLEDNC_ID", ddlMultipleDNC.SelectedValue);
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("s3g_cln_LoadTempReceiptNo", Procparam, true, "-- Select --", new string[] { "ID", "Receipt_No" });

    //}


    //private void FunPriLoadCombo_ECSAuthorization()
    //{
    //    if (Procparam != null)
    //        Procparam.Clear();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    Procparam.Add("@Program_ID", strProgramId);
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@OPTION", "Authorize");
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetECSNo", Procparam, true, "-- Select --", new string[] { "ID", "ECS_No" });
    //}


    /// <summary>
    ///  Load the Document Number Combo Box with Appropriate Number
    /// </summary>
    //private void FunPriLoadCombo_AppropriateNumber()
    //{
    //    //FunPri_LOB_Branch();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable(SPNames.S3G_CLN_GetAppropriateNumber, Procparam, true, "-- Select --", new string[] { "ID", "Appropriation_ID" });
    //}

    /// <summary>
    ///  Load the Document Number Combo Box with Follow Up Id
    /// </summary>
    //private void FunPriLoadCombo_FollowUp()
    //{
    //    //FunPri_LOB_Branch();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (ComboBoxLOBSearch.SelectedValue != "0") Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedValue != "0") Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetFollowUpId", Procparam, true, "-- Select --", new string[] { "ID", "FollowUp_No" });
    //}


    /// <summary>
    ///  Load the Document Number Combo Box with Challan Number
    /// </summary>
    //private void FunPriLoadCombo_ChallanGeneration()
    //{
    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@stDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@endDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@User_ID", ObjUserInfo.ProUserIdRW.ToString());
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_CHALLANGERNERATEDNO", Procparam, true, "-- Select --", new string[] { "ID", "Challan_No" });
    //}
    //private void FunPriLoadCombo_BucketParameter()
    //{
    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    Procparam.Add("@Branch_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@stDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@endDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetBucketparameterID", Procparam, true, "--Select--", new string[] { "ID", "ID" });
    //}


    private void FunPriLoadCombo_MemoValueNumber()
    {
        //FunPri_LOB_Branch();
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
        //Chandu 3-Sep-2013
        //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetMemNo", Procparam, true, "-- Select --", new string[] { "ID", "Memo_ID" });
    }


    #region To populate Drawee Bank
    private void PopulateDepositBank()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Location_ID", ddlBranch.SelectedValue.ToString());
            Procparam.Add("@LOB_ID", ComboBoxLOBSearch.SelectedValue.ToString());
            ddlDepositBank.BindDataTable("S3G_CLN_GetDepositBank", Procparam, new string[] { "Bank_ID", "BankName" });
            ddlDepositBank.AddItemToolTip();
        }
        //catch (FaultException<AccountMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    Utility.FunShowAlertMsg(this, objFaultExp.Message);
        //    throw objFaultExp;
        //}
        catch (Exception ex)
        {
            Utility.FunShowAlertMsg(this, ex.Message);
            throw ex;
        }
    }
    #endregion



    //  Already Commented By Saran Challan Rule Creation Chandu Commenting the Routine
    //private void FunPriLoadCombo_ChallanRuleCreation()
    //{
    //    //changed by saran for uat fix on 1-Nov-2011
    //    /*if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    if (ComboBoxBranchSearch.SelectedIndex > 0)
    //        Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@stDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@endDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetChallanRuleID", Procparam, true, "--Select--", new string[] { "ID", "ID" });*/
    //}
    // PDC Module
    //private void FunPriLoadCombo_PDCModuleCreation()
    //{
    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@stDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@endDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetPDCModuleID", Procparam, true, "--Select--", new string[] { "ID", "ID" });
    //}
    // PDC Bulk Receipt Process
    //private void FunPriLoadCombo_PDCReceiptProcess()
    //{
    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    Procparam.Add("@Location_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Location_ID", Convert.ToString(hdnBranchID.Value));
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //        Procparam.Add("@stDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //        Procparam.Add("@endDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetPDCReceiptProcessID", Procparam, true, "--Select--", new string[] { "ID", "Receipt_No" });
    //}

    //private void FunPriLoadCombo_FrequencyType()
    //{
    //    Procparam = new Dictionary<string, string>();
    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    Procparam.Add("@LookupType_Code", "8");
    //    //Chandu 3-Sep-2013
    //    //cmbDocumentNumberSearch.BindDataTable(SPNames.S3G_LOANAD_GetLookUpValues, Procparam, true, "--Select--", new string[] { "Lookup_Code", "Lookup_Description" });
    //}


    //private void FunPriLoadCombo_ReceiptApproval()
    //{
    //    //Chandu 3-Sep-2013 Un Comment Once to get Previous Code

    //    //if (ComboBoxLOBSearch.SelectedValue != "0") //Modified by Tamilselvan.S on 5/03/2011
    //    //    Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    ////if (ComboBoxBranchSearch.SelectedValue != "0")
    //    ////    Procparam.Add("@Branch_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    //if (ddlBranch.Text != string.Empty) Procparam.Add("@Branch_ID", Convert.ToString(hdnBranchID.Value));
    //    //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    //Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //Procparam.Add("@ProcessScreen", "RCPAUTH");  //For Only get Authorized receipt
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetReceiptNo", Procparam, true, "-- Select --", new string[] { "ID", "Receipt_No" });
    //}

    /// <summary>
    /// 
    /// </summary>
    private void FunPriLoadCombo_DebtCollector()
    {
    }
    //private void FunPriLoadCombo_DebtCollectorRuleCard()
    //{
    //    //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
    //    //if (ComboBoxLOBSearch.SelectedIndex > 0)
    //    //{
    //    //    Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //}
    //    ////if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    ////{
    //    ////    Procparam.Add("@Branch_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    ////}
    //    //if (ddlBranch.Text != string.Empty) Procparam.Add("@Branch_ID", Convert.ToString(hdnBranchID.Value));
    //    //if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //    //{
    //    //    Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    //}
    //    //if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //    //{
    //    //    Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    //}
    //    //Procparam.Add("@Program_ID", strProgramId);
    //    //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    //Procparam.Add("@User_ID", Convert.ToString(intUserID));
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetDebtCollectorRuleCard_Code", Procparam, true, "--Select--", new string[] { "DebtCollectorRuleCard_ID", "DebtCollectorRuleCard_ID" });

    //}
    //private void FunPriLoadCombo_ManualBucketClassification()
    //{
    //    //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
    //    //try
    //    //{
    //    //    if (Procparam != null)
    //    //        Procparam.Clear();
    //    //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    //    if (ComboBoxLOBSearch.SelectedIndex > 0)
    //    //    {
    //    //        Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //    }
    //    //    //if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    //    //{
    //    //    //    Procparam.Add("@Branch_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    //    //}
    //    //    if (ddlBranch.Text != string.Empty) Procparam.Add("@Branch_ID", Convert.ToString(hdnBranchID.Value));
    //    //    if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //    //    {
    //    //        Procparam.Add("@Fromdate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    //    }
    //    //    if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //    //    {
    //    //        Procparam.Add("@Todate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    //    }
    //    //    cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetDebtCollectorCodecombo", Procparam, true, "--Select--", new string[] { "DebtCollector_code", "DebtCollector_code" });
    //    //}
    //    //catch (FaultException<UserMgtServicesReference.IUserMgtServices> objFaultExp)
    //    //{
    //    //    // lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
    //    //}
    //    //catch (Exception ex)
    //    //{

    //    //}
    //}

    private void FunPriLoadCustomer_MemorandumBooking()
    {
        ViewState["Land_CustomerID"] = "";
        Session.Remove("Land_CustomerDT");

        Procparam.Add("@LOB_ID", ComboBoxLOBSearch.SelectedValue);
        if (ddlBranch.SelectedValue != "0") Procparam.Add("@Branch_ID", Convert.ToString(ddlBranch.SelectedValue));
        Procparam.Add("@Company_ID", intCompanyID.ToString());

        Procparam.Clear();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@LookupType_Code", "36");
        ddlDNCOption.BindDataTable("S3G_LOANAD_GetLookUpValues", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });
        //ddlDNCOption.SelectedValue = "0";
    }
    //private void FunPriLoadCombo_DebtCollectorCode()
    //{
    //    //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
    //    //if (Procparam != null)
    //    //    Procparam.Clear();
    //    //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //    //if (ComboBoxLOBSearch.SelectedIndex > 0)
    //    //{
    //    //    Procparam.Add("@LOB_ID", Convert.ToString(ComboBoxLOBSearch.SelectedValue));
    //    //}
    //    ////if (ComboBoxBranchSearch.SelectedIndex > 0)
    //    ////{
    //    ////    Procparam.Add("@Branch_ID", Convert.ToString(ComboBoxBranchSearch.SelectedValue));
    //    ////}
    //    //if (ddlBranch.Text != string.Empty) Procparam.Add("@Branch_ID", Convert.ToString(hdnBranchID.Value));
    //    //if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
    //    //{
    //    //    Procparam.Add("@Fromdate", Utility.StringToDate(txtStartDateSearch.Text).ToString());
    //    //}
    //    //if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
    //    //{
    //    //    Procparam.Add("@Todate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    //    //}
    //    //cmbDocumentNumberSearch.BindDataTable("S3G_CLN_GetDebtCollectorCodecombo", Procparam, true, "--Select--", new string[] { "DebtCollector_code", "DebtCollector_code" });
    //}

    /// <summary>
    /// Bind the Landing Grid.
    /// </summary>
    private void FunPriBindGrid()
    {
        try
        {
            FunPriAddCommonParameters();                                                        // Adding the Common parameters to the dictionary            
            // Passing DNC ddl value to the SP
            //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
            //if (cmbDocumentNumberSearch != null && cmbDocumentNumberSearch.SelectedIndex > 0)   // General document no of your page (ex)FIR Number,Enquiry No,App Processing No,
            //{
            //    Procparam.Add("@DocumentNumber", cmbDocumentNumberSearch.SelectedValue);
            //}
            if (ddlDocumentNumb != null && ddlDocumentNumb.SelectedText.Trim() != String.Empty)   // General document no of your page (ex)FIR Number,Enquiry No,App Processing No,
            {
                if (ProgramCode == strTempReceiptProcessing || ProgramCode == strReceiptProcessing || ProgramCode == strPDCReceiptProcess || ProgramCode == strDelinquentParameters
                    || ProgramCode == strDealerSalesCommissionMst || ProgramCode == strPDCModule || ProgramCode == strPDCMaintenance)
                {
                    Procparam.Add("@DocumentNumber", ddlDocumentNumb.SelectedValue);
                }
                else
                {
                    Procparam.Add("@DocumentNumber", ddlDocumentNumb.SelectedText);
                }
            }
            //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
            // Passing Multiple DNC ddl value to the SP
            //if (ddlMultipleDNC != null && ddlMultipleDNC.Visible && ddlMultipleDNC.SelectedIndex > 0)
            if (ddlMultipleDNC != null && divMultipleDocNo.Visible && ddlMultipleDNC.SelectedIndex > 0)
            {
                Procparam.Add("@MultipleDNC_ID", ddlMultipleDNC.SelectedValue);
            }
            // Passing Multiple DNC option ddl value to the SP
            // if (ddlDNCOption != null && ddlDNCOption.Visible && ddlDNCOption.SelectedIndex > 0)
            if (ddlDNCOption != null && divDNCOption.Visible && ddlDNCOption.SelectedIndex > 0)
            {
                Procparam.Add("@MultipleOption_ID", ddlDNCOption.SelectedValue);
            }
            //Chandu 3-Sep-2013 Un Comment Once to get Previous Code
            //if ((cmbDocumentNumberSearch != null && cmbDocumentNumberSearch.SelectedIndex > 0) && IsApprovalNeed)   // using for approval screen purpose
            //{
            //    Procparam.Add("@Task_Number_ID", cmbDocumentNumberSearch.SelectedValue);
            //}

            if ((ddlDocumentNumb != null && ddlDocumentNumb.SelectedText.Trim() != String.Empty) && IsApprovalNeed)   // using for approval screen purpose
            {
                Procparam.Add("@Task_Number_ID", ddlDocumentNumb.SelectedText);
            }
            //Chandu 3-Sep-2013 Un Comment Once to get Previous Code

            if (ProgramCodeToCompare == strPDCMaintenance)
            {
                Procparam.Add("@ProgramCode", strPDCModule.ToString());                     // using for approval screen purpose
            }
            else
            {
                Procparam.Add("@ProgramCode", ProgramCodeToCompare.ToString());
            }

            if (ProgramCodeToCompare == strChallanGeneration)
            {
                Procparam.Add("@Deposit_BankCode", ddlDepositBank.SelectedValue.ToString());
            }

            //Add here - add your extra SP parameters - if required... in the below switch case (also Add the same to the common SP - with your program Code Commented).

            //Added on 08Nov2018 starts here

            //Customer Search
            if (ProgramCodeToCompare == strPDCMaintenance || ProgramCodeToCompare == strPDCModule || ProgramCodeToCompare == strChequeReturn || ProgramCodeToCompare == strPDCReceiptProcess || ProgramCodeToCompare == strReceiptProcessing)
            {
                if (Convert.ToString(ucCustomerCodeLov.SelectedText) != "" && Convert.ToInt32(ucCustomerCodeLov.SelectedValue) > 0)
                    Procparam.Add("@CUSTOMER_ID", Convert.ToString(ucCustomerCodeLov.SelectedValue));
            }

            //Account Search
            if (ProgramCodeToCompare == strPDCMaintenance || ProgramCodeToCompare == strPDCModule || ProgramCodeToCompare == strChequeReturn || ProgramCodeToCompare == strPDCReceiptProcess || ProgramCodeToCompare == strReceiptProcessing)
            {
                if (Convert.ToString(ucAccountLov.SelectedText) != "" && Convert.ToInt32(ucAccountLov.SelectedValue) > 0)
                    Procparam.Add("@Account_PASAREF_ID", Convert.ToString(ucAccountLov.SelectedValue));
                else if (Convert.ToString(ucAccountLov.SelectedText) != "" && Convert.ToInt32(ucAccountLov.SelectedValue) == 0)
                    Procparam.Add("@PANUM", Convert.ToString(ucAccountLov.SelectedText));
            }

            //Added on 08Nov2018 ends here

            //Account Search
            if (ProgramCodeToCompare == strMemorandumBooking || ProgramCodeToCompare == strMemorandumBooking)
            {

                if (Convert.ToString(ucAccountLov.SelectedText) != "" && ucAccountLov.SelectedValue != "0")
                    Procparam.Add("@PANUM", Convert.ToString(ucAccountLov.SelectedText));
                else if (Convert.ToString(ucAccountLov.SelectedText) != "" && Convert.ToInt32(ucAccountLov.SelectedValue) == 0)
                    Procparam.Add("@Account_PASAREF_ID", Convert.ToString(ucAccountLov.SelectedValue));

            }
            if (ProgramCodeToCompare == strReceiptProcessing || ProgramCodeToCompare == strReceiptApproval)
            {
                if (ddlReceiptTo.SelectedValue != "0")
                {
                    Procparam.Add("@TASK_TYPE", Convert.ToString(ddlReceiptTo.SelectedValue));
                }
            }

            //Added on 08Nov2018 ends here

            switch (ProgramCode)
            {
                case strMemorandumBooking:
                    TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
                    TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
                    HiddenField hdnCustomerId = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                    hdnCustomerId.Value = ucCustomerCodeLov.SelectedValue;
                    ucCustomerCodeLov.SelectedText = TxtAccNumber.Text;
                    if (!string.IsNullOrEmpty(TxtAccNumber.Text))
                    {
                        Procparam.Add("@Customer_ID", hdnCustomerId.Value);
                    }
                    break;
                case strReceiptProcessing:
                    if (ddlStatus.SelectedText != "")
                    {
                        Procparam.Add("@Customer_Name", ddlStatus.SelectedValue);
                    }
                    break;
                //    //sample 
                //case strFieldInformationReportCode:
                //    break;
                //case strAssetVerification:
                //    break;
                //case strAssetIdentification:
                //    break;
                //case strOperaingDepreciation:
                //    break;
                //case strAccountClosure:
                //    break;
                //case strAccountActivation:
                //    break;

                //case strDebtCollectorMaster:
                //    break;
                //case strDebtCollectorRuleCard:
                //break


            }

            FunPriBindGridWithFooter();                                                                   // Binding the grid.

        }
        catch (FaultException<UserMgtServicesReference.IUserMgtServices> objFaultExp)
        {
            // lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    /// <summary>
    /// Will bind the grid view 
    /// </summary>
    private void FunPriBindGridWithFooter()
    {
        int intTotalRecords = 0;
        bool bIsNewRow = false;
        grvTransLander.BindGridView(strProcName, Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

        //This is to hide first row if grid is empty
        if (bIsNewRow)
        {
            grvTransLander.Rows[0].Visible = false;
        }
        //if (ProgramCodeToCompare == strPaymentApproval || ProgramCodeToCompare == strLeaseAssetSaleApproval || ProgramCodeToCompare == strAccountclosureApproval || ProgramCodeToCompare == strTopupApproval || ProgramCodeToCompare == strSpecificRevisionApproval || ProgramCodeToCompare == strManualJournalApproval || ProgramCodeToCompare == strPrematureClosureApproval || ProgramCodeToCompare == strConsolidationApproval || ProgramCodeToCompare == strSplitApproval)
        if (IsApprovalNeed)
        {
            grvTransLander.Columns[1].Visible = false;
        }
        ucCustomPaging.Visible = true;
        ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
        ucCustomPaging.setPageSize(ProPageSizeRW);
        lblErrorMessage.Text = "";
        if (ProgramCode == "DCRMSTR")
        {
            grvTransLander.Rows[0].Visible = false;
        }

    }

    /// <summary>
    /// Will add the common parameters to the Dictionary - to pass it to the Common SP.
    /// </summary>
    private void FunPriAddCommonParameters()
    {
        //Paging Properties set  
        int intTotalRecords = 0;
        ObjPaging.ProCompany_ID = intCompanyID;
        ObjPaging.ProUser_ID = intUserID;
        ObjPaging.ProTotalRecords = intTotalRecords;
        ObjPaging.ProCurrentPage = ProPageNumRW;
        ObjPaging.ProPageSize = ProPageSizeRW;
        ObjPaging.ProSearchValue = hdnSearch.Value;
        ObjPaging.ProOrderBy = hdnOrderBy.Value;

        Procparam = new Dictionary<string, string>();
        if (Procparam != null)
        {
            Procparam.Clear();
        }
        if (ComboBoxLOBSearch.SelectedIndex > 0)
        {
            Procparam.Add("@LOB_ID", ComboBoxLOBSearch.SelectedValue.ToString());
        }
        //if (ComboBoxBranchSearch.SelectedIndex > 0)
        //{
        //    Procparam.Add("@Branch", ComboBoxBranchSearch.SelectedValue.ToString());
        //}
        // if (txtBranchSearch.Text != null && txtBranchSearch.Text != string.Empty)
        if (ddlBranch.SelectedValue != "0")
        {
            Procparam.Add("@Branch", hdnBranchID.Value.ToString());
        }
        if (!(string.IsNullOrEmpty(txtStartDateSearch.Text)))
            Procparam.Add("@StartDate", Utility.StringToDate(txtStartDateSearch.Text).ToString());


        if (!(string.IsNullOrEmpty(txtEndDateSearch.Text)))
            Procparam.Add("@EndDate", Utility.StringToDate(txtEndDateSearch.Text).ToString());
    }

    /// <summary>
    /// This is the get the datatype of the string passed
    /// </summary>
    /// <param name="val">string</param>
    /// <returns>   
    ///             1 for int, 
    ///             2 for datetime, 
    ///             3 for string
    /// </returns>
    private Int32 FunPriTypeCast(string val)
    {
        try                                                         // casting - to use proper align       
        {
            //Changed by tamilselvan.S for Int32 to int64
            Int64 tempint = Convert.ToInt64(Convert.ToDecimal(val));                   // Try int     
            return 1;
        }
        catch (Exception ex)
        {
            try
            {
                DateTime tempdatetime = Convert.ToDateTime(val);    // try datetime
                return 2;
            }
            catch (Exception ex1)
            {
                return 3;                                           // try String
            }
        }


    }

    /// <summary>
    /// This method will validate the from and to date - entered by the user.
    /// </summary>
    private void FunPriValidateFromEndDate()
    {
        DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
        dtformat.ShortDatePattern = "MM/dd/yy";

        //if ((!(string.IsNullOrEmpty(DateTime.Parse(txtStartDateSearch.Text, dtformat).ToString()))) &&
        if ((!(string.IsNullOrEmpty(txtStartDateSearch.Text))) &&
           (!(string.IsNullOrEmpty(txtEndDateSearch.Text))))                                   // If start and end date is not empty
        {
            //if (Convert.ToDateTime(DateTime.Parse(txtStartDateSearch.Text, dtformat).ToString()) > Convert.ToDateTime(DateTime.Parse(txtEndDateSearch.Text, dtformat))) // start date should be less than or equal to the enddate
            if (Utility.StringToDate(txtStartDateSearch.Text) > Utility.StringToDate(txtEndDateSearch.Text)) // start date should be less than or equal to the enddate
            {
                //Utility.FunShowAlertMsg(this, "Start Date should be lesser than or equal to the End Date");
                if (hidDate.Value.ToUpper() == "START")
                    Utility.FunShowAlertMsg(this, "Start Date should be less than or equal to End Date");
                else
                    Utility.FunShowAlertMsg(this, "End date should be greater than or equal to Start Date");

                grvTransLander.DataSource = null;
                grvTransLander.Visible = false;
                ucCustomPaging.Visible = false;

                return;
            }
        }
        /*
        if ((!(string.IsNullOrEmpty(txtStartDateSearch.Text))) &&
           ((string.IsNullOrEmpty(txtEndDateSearch.Text))))
        {
            txtEndDateSearch.Text = DateTime.Parse(DateTime.Now.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);

        }
        if (((string.IsNullOrEmpty(txtStartDateSearch.Text))) &&
            (!(string.IsNullOrEmpty(txtEndDateSearch.Text))))
        {
            txtStartDateSearch.Text = txtEndDateSearch.Text;

        }
         */

        FunPriBindGrid();
    }

    private string FunPriSetProgramName()
    {
        string strProgramName = string.Empty;
        try
        {
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Program_ID", Convert.ToString(strProgramId));
            DataTable dtProgram = Utility.GetDefaultData("S3G_GET_PROGRAM_NAME", strProparm);
            if (dtProgram.Rows.Count > 0)
            {
                strProgramName = dtProgram.Rows[0]["NAME"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return strProgramName;
    }

    #endregion

    #region Control Events
    /// <summary>
    /// Will bind the grid and validate the from and to date.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        #region  User Authorization
        if (!bIsActive)
        {
            isEditColumnVisible =
            isQueryColumnVisible = false;
        }
        if ((!bModify) || (intModify == 0))
        {
            isEditColumnVisible = false;

        }
        if ((!bQuery) || (intModify == 0))
        {
            isQueryColumnVisible = false;
        }
        #endregion

        grvTransLander.Visible = true;
        FunPriValidateFromEndDate();
        btnSearch.Focus();//Added by Suseela

    }

    /// <summary>
    /// Will set the Grid Style and Alignment of the string dynamically depend on the data types of the cell
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvTransLander_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)                 // if header - then set the style dynamically.
        {
            for (int i_cellVal = 2; i_cellVal < e.Row.Cells.Count; i_cellVal++)
            {
                e.Row.Cells[i_cellVal].CssClass = "styleGridHeader";
            }
            if (ProgramCode == strECSFlatFileGen)
            {
                Label lblPrint = (Label)e.Row.FindControl("lblPrint");
                lblPrint.Text = "Download";
                //e.Row.Cells[12].Visible = false;
            }
            //if (ProgramCode == strECSProcess || ProgramCode == strECSAuthorization)
            //    e.Row.Cells[1].Visible = false;
        }
        if (e.Row.RowType == DataControlRowType.Header || e.Row.RowType == DataControlRowType.DataRow) // to hide the "ID" column
        {
            e.Row.Cells[3].Visible = false;                             // ID Column - always invisible
            e.Row.Cells[4].Visible = false;                             // User ID Column - always invisible
            e.Row.Cells[5].Visible = false;                             // User Level ID Column - always invisible
            e.Row.Cells[6].Visible = false;
            if (ProgramCode == strReceiptProcessing)
            {
                e.Row.Cells[16].Visible = false;
            }
        }
        if (e.Row.RowType == DataControlRowType.DataRow)                // If data Row then check the data type and set the style - Alignment.
        {

            #region User Authorization
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            ImageButton imgbtnPrint = e.Row.FindControl("imgbtnPrint") as ImageButton;
            ImageButton imgbtnQuery = (ImageButton)e.Row.FindControl("imgbtnQuery");
            //Label lblPrint=(Label)e.Row.FindControl("lblPrint");
            //  if ((intModify != 0) && ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text)))))
            if ((intModify != 0))
            {
                imgbtnEdit.Enabled = true;
            }
            else if (ProgramCode != strMemorandumBooking && ProgramCode != strUTPAReceiptProcessing)
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
            }
            if (intQuery != 0)
            {
                if (ProgramCode == strECSFlatFileGen)
                {
                    imgbtnPrint.ImageUrl = "~/Images/notepad1.png";
                }
                imgbtnQuery.Enabled = true;
            }
            else
            {
                imgbtnQuery.Enabled = false;
                imgbtnQuery.CssClass = "styleGridQueryDisabled";
            }

            #endregion
            if (ProgramCode == strReceiptProcessing)
            {
                e.Row.Cells[16].Visible = false;
            }
            //to disable Modify if Pricing and application is approved,rejected,Cancelled
            if (ProgramCode == strTempReceiptProcessing)
            {
                if (e.Row.Cells[11].Text.ToUpper() == "PROCESSED")
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
                else if (e.Row.Cells[11].Text.ToUpper() == "CANCELLED")
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                    e.Row.CssClass = "styleGridCancelStatus";
                }
            }

            if (ProgramCode == strECSFlatFileGen)
            {
                if (e.Row.Cells[11].Text == "Process")
                {
                    imgbtnQuery.Enabled = imgbtnEdit.Enabled = imgbtnPrint.Enabled = false;
                    imgbtnQuery.CssClass = imgbtnEdit.CssClass = imgbtnPrint.CssClass = "styleGridEditDisabled";
                    e.Row.CssClass = "styleGridCancelStatus";
                }
            }
            for (int i_cellVal = 3; i_cellVal < e.Row.Cells.Count; i_cellVal++)
            {
                try
                {
                    Int32 type = 0;       // 1 = int, 2 = datetime, 3 = string

                    type = FunPriTypeCast(e.Row.Cells[i_cellVal].Text);
                    switch (type)
                    {
                        case 1:  // int - right to left
                            e.Row.Cells[i_cellVal].HorizontalAlign = HorizontalAlign.Right;
                            break;
                        case 3:  // string - do nothing - left align(default)
                            e.Row.Cells[i_cellVal].HorizontalAlign = HorizontalAlign.Left;
                            break;
                    }
                }
                catch (Exception ex)
                {
                    //continue;
                }
            }

            //Added on 16-Oct-2018 Starts here
            //if (ProgramCode == strPDCMaintenance)
            //{
            if (IsUserAccessChecker(2)) //Modify Access
            {
                imgbtnEdit.Enabled = true;
            }
            else
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
            }
            if (IsUserAccessChecker(4))// Query Access
            {
                imgbtnQuery.Enabled = true;
            }
            else
            {
                imgbtnQuery.Enabled = false;
                imgbtnQuery.CssClass = "styleGridEditDisabled";
            }
            if (ProgramCode == strChallanGeneration)
            {
                if (e.Row.Cells[12].Text.ToUpper() == "APPROVED"
                    || e.Row.Cells[12].Text.ToUpper() == "CANCELLED"
                    || e.Row.Cells[12].Text.ToUpper() == "UNDER PROCESS"
                    || e.Row.Cells[12].Text.ToUpper() == "SCHEDULED")
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
            }
            if (ProgramCode == strDemandProcessing)
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
            }

            //to disable Modify if Pricing and application is approved,rejected,Cancelled

            if (ProgramCode == strReceiptProcessing)
            {
                imgbtnEdit.CssClass = "styleGridEdit";
                imgbtnQuery.Enabled = true;
                imgbtnQuery.CssClass = "styleGridQuery";

                if (e.Row.Cells[11].Text.ToUpper() == "ECS" || e.Row.Cells[14].Text.ToUpper() == "CANCELLED")
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
                else if (e.Row.Cells[13].Text.Trim() != "&nbsp;")
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
                if (e.Row.Cells[14].Text.ToUpper() == "CANCELLED")
                {
                    imgbtnPrint.Enabled = false;
                    imgbtnPrint.CssClass = "styleGridEditDisabled";
                    imgbtnPrint.ImageUrl = "~/Images/pdf_disabled.png";
                }
                else if (e.Row.Cells[14].Text.ToUpper() == "PENDING")
                {
                    imgbtnPrint.Enabled = false;
                    imgbtnPrint.CssClass = "styleGridEditDisabled";
                    imgbtnPrint.ImageUrl = "~/Images/pdf_disabled.png";
                }
                if (e.Row.Cells[11].Text.ToUpper() == "ECS" || e.Row.Cells[11].Text.ToUpper() == "CDM" || e.Row.Cells[11].Text.ToUpper() == "PAYMENT GATEWAY" || e.Row.Cells[11].Text.ToUpper() == "THAWANI PAY" || e.Row.Cells[11].Text.ToUpper().Contains("SALARY"))
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";

                    if (e.Row.Cells[11].Text.ToUpper().Contains("SALARY"))
                    {
                        imgbtnPrint.Enabled = true;
                        imgbtnPrint.CssClass = "styleGridEdit";
                        imgbtnPrint.ImageUrl = "~/Images/Pdf_img.png";
                    }
                    else
                    {
                        imgbtnPrint.Enabled = false;
                        imgbtnPrint.CssClass = "styleGridEditDisabled";
                        imgbtnPrint.ImageUrl = "~/Images/pdf_disabled.png";
                    }

                }
            }

            switch (ProgramCodeToCompare)
            {
                case strChequeReturnexcel:
                    if (Convert.ToString(e.Row.Cells[e.Row.Cells.Count - 1].Text).ToLower() == "false")
                    {
                        imgbtnEdit.Enabled = false;
                        imgbtnEdit.CssClass = "styleGridEditDisabled";
                    }
                    break;
                case strChequeReturn:
                    if (Convert.ToString(e.Row.Cells[e.Row.Cells.Count - 1].Text).ToLower() == "false")
                    {
                        imgbtnEdit.Enabled = false;
                        imgbtnEdit.CssClass = "styleGridEditDisabled";
                    }
                    break;
                default:
                    break;
            }

        }
        //Thangam M on 15/Mov/2012 for Delinq Spooling 
        if (ProgramCodeToCompare == strPDCReceiptProcess || // Modify Mode not applicable
        ProgramCodeToCompare == strPDCModule || ProgramCodeToCompare == strECSProcess || ProgramCodeToCompare == strECSAuthorization || ProgramCodeToCompare == strDelinquencySpooling)
        {
            e.Row.Cells[1].Visible = false;
        }
        else
        {
            e.Row.Cells[1].Visible = true;
        }

        if (ProgramCode == strReceiptProcessing)
        {
            e.Row.Cells[2].Visible = true;
            if (e.Row.Cells[14].Text.ToUpper() == "CANCELLED" || e.Row.Cells[14].Text.ToUpper() == "PENDING")
            {
                if (e.Row.Cells[16].Text.Trim() == "4" && e.Row.Cells[14].Text.ToUpper() == "PENDING")
                {
                    ImageButton imgbtnPrint = (ImageButton)e.Row.Cells[2].Controls[1];                   
                    imgbtnPrint.Enabled = true;
                    imgbtnPrint.CssClass = "styleGridEdit";
                    imgbtnPrint.ImageUrl = "~/Images/Pdf_img.png";
                }
                else
                {
                    ImageButton imgbtnPrint = (ImageButton)e.Row.Cells[2].Controls[1];
                    imgbtnPrint.ImageUrl = "~/Images/pdf_disabled.png";
                    imgbtnPrint.Enabled = false;
                }
                
            }
        }
        else
        {
            if (ProgramCode == strECSFlatFileGen)
            {
                e.Row.Cells[2].Visible = true;
                if (e.Row.Cells[11].Text == "Process")
                {
                    ImageButton imgbtnPrint = (ImageButton)e.Row.Cells[2].Controls[1];
                    imgbtnPrint.ImageUrl = "~/Images/Notepad_Dis.png";
                    imgbtnPrint.Enabled = false;
                }
            }
            else
                e.Row.Cells[2].Visible = false;
        }

        //Added on 07-Nov-2018 Starts here
        //Query Mode not applicable hence its visible false
        switch (ProgramCodeToCompare)
        {
            case strPDCMaintenance:
                e.Row.Cells[0].Visible = false;
                break;
            case strChequeReturn:
                e.Row.Cells[e.Row.Cells.Count - 1].Visible = false;
                break;
            case strChequeReturnexcel:
                e.Row.Cells[e.Row.Cells.Count - 1].Visible = false;
                break;
        }
        //Added on 07-Nov-2018 Ends here


    }




    /// <summary>
    /// It will redirect the page from LAnding to Document Number Page.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void grvTransLander_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);

        if (strRedirectPage.Contains('?'))
            strRedirectPage += "&";
        else
            strRedirectPage += "?";
        //if (ProgramCode == strAccountCreation)
        //{
        //    strQueryString = Convert.ToString(ViewState["AccountCreation"]);
        //}

        Session.Remove("Land_CustomerDT");

        switch (e.CommandName.ToLower())
        {
            case "modify":
                //Added by Thangam M on 28-Sep-2013 for Row lock
                string strUserRowLocked = Utility.FunPriCheckRowConcurrency(intUserID, ProgramCodeToCompare, e.CommandArgument.ToString(), Session.SessionID);
                if (strUserRowLocked != "0")
                {
                    Utility.FunShowAlertMsg(this, strUserRowLocked);
                    return;
                }

                Session["RemoveLock"] = "1";

                Response.Redirect(strRedirectPage + "qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                break;
            case "query":
                Response.Redirect(strRedirectPage + "qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                break;
            case "print":
                if (ProgramCode == strECSFlatFileGen)
                {
                    FunOpenNotePad(e.CommandArgument.ToString());
                }
                else
                {
                    //FunOpenPDF(e.CommandArgument.ToString());
                    FunOpenRecPDF(e.CommandArgument.ToString());
                    //SavePDFPrint(e.CommandArgument.ToString());
                }
                break;

        }

    }

    private void SavePDFPrint(string ReferenceNumber)
    {
        try
        {
            int intTemplateType = 0;
            String strHTML = String.Empty;
            string strReportType = string.Empty;
            var filepaths = new List<string>();
            var outputfilepaths = new List<string>();
            string FileName = "";
            string FilePath = "";
            string DownFile = "";

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANYID", intCompanyID.ToString());
            Procparam.Add("@User_Id", intUserID.ToString());
            Procparam.Add("@RECEIPTID", ReferenceNumber);
            Procparam.Add("@Is_Print", "1");
            Procparam.Add("@Is_Duplicate", "0");
            DataSet dsrecpdf = Utility.GetDataset("CN_Get_RcptDtlRpt", Procparam);
            DataSet ds = new DataSet();
            Session["ReceiptDetails"] = dsrecpdf;
            int i = 0;
            for (int j = 1; j < 3; j++)
            {
                strHTML = string.Empty;
                intTemplateType = 103;
                strHTML = PDFPageSetup.FunPubGetTemplateContent(intCompanyID, 110, 1 /*English*/, intTemplateType, ReferenceNumber);//FunPubGetTemplateContent(intCompanyID, ddlLOB.SelectedValue, ddlBranch.SelectedValue, 58, strChallanID);
                if (strHTML == "")
                {
                    Utility.FunShowAlertMsg(this.Page, ValidationMsgs.PMTPRT1);//59
                    return;
                }
                FileName = PDFPageSetup.FunPubGetFileName(ReferenceNumber + intUserID + DateTime.Now.ToString("ddMMMyyyyHHmmss"));
                FilePath = Server.MapPath(".") + "\\PDF Files\\";
                DownFile = FilePath + FileName + ".pdf";
                SaveNewDocument(strHTML, ReferenceNumber, FilePath, FileName, j);
                filepaths.Add(DownFile);
                WaterMarkPages((1).ToString(), DownFile, DownFile, "");
                i++;
            }

            FilePath = FilePath + intUserID + DateTime.Now.ToString("ddMMMyyyyHHmmss") + ".pdf";
            if (!File.Exists(DownFile))
            {
                Utility.FunShowAlertMsg(this, "File not exists");
                return;
            }
            Utility.FunPriGenerateFilesCheckList(filepaths, FilePath, "P");
            FunPriDownloadFile(FilePath, FileName);
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException);
            Utility.FunShowAlertMsg(this, "File Not Exists");
            return;
        }
    }

    private void FunPriDownloadFile(string OutputFile, string FileName)
    {
        string strnewFile = OutputFile;
        MyIframeOpenFile.Visible = true;
        Response.AppendHeader("content-disposition", "attachment; filename=Receipt_" + FileName + ".pdf");
        Response.ContentType = "application/pdf";
        Response.WriteFile(OutputFile);
    }



    protected void SaveNewDocument(string strHTML, string ReferenceNumber, string FilePath, string FileName, int i)
    {
        try
        {
            DataSet dsrecpdf = (DataSet)Session["ReceiptDetails"];

            if (dsrecpdf.Tables[0].Rows.Count > 0)
            {
                if (i == 2)
                {
                    strHTML = strHTML.Replace("Customer Copy", "Company Copy");
                }
                strHTML = PDFPageSetup.FunPubBindCommonVariables(strHTML, dsrecpdf.Tables[0]);
                Session["Random_Num"] = Convert.ToString(dsrecpdf.Tables[0].Rows[0]["Rcpt_Rndnm"]); ;
            }

            if (dsrecpdf.Tables[1].Rows.Count > 0)
            {
                if (strHTML.Contains("~tbAsset~"))
                    strHTML = PDFPageSetup.FunPubBindTable("~tbAsset~", strHTML, dsrecpdf.Tables[1]);
            }
            List<string> listImageName = new List<string>();
            listImageName.Add("~CompanyLogo~");
            List<string> listImagePath = new List<string>();
            listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/CompanyLogo.png"));

            strHTML = PDFPageSetup.FunPubBindImages(listImageName, listImagePath, strHTML.TrimEnd());
            PDFPageSetup.FunPubSaveDocument(strHTML.Trim(), FilePath, FileName, "P", 1, strDateFormat);
        }
        catch (Exception ex)
        {

            return;
        }
    }


    protected void FunOpenNotePad(string strECSNo)
    {
        try
        {
            string strFilePath = string.Empty;
            DataTable dtDocPath = new DataTable();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@ECS_NO", strECSNo);
            Procparam.Add("@Option", "1");
            dtDocPath = Utility.GetDefaultData("S3G_ORG_GetDocPathforECSFile", Procparam);
            if (dtDocPath != null && dtDocPath.Rows.Count > 0)
            {
                strFilePath = dtDocPath.Rows[0]["FILE_PATH"].ToString();
                if (!string.IsNullOrEmpty(strFilePath))
                {
                    string strnewFile = strFilePath + "\\\\" + strECSNo.Replace("/", "-") + ".txt";
                    try
                    {
                        if (File.Exists(strnewFile) == true)
                        {
                            string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "', 'newwindow','toolbar=no,location=no,menubar=no,width=900,height=600,resizable=yes,scrollbars=no,top=50,left=50');";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "TXT", strScipt, true);
                        }
                        else
                        {
                            Utility.FunShowAlertMsg(this, "File not Present, Re-generate the ECS Flat File through Modify.");
                            return;
                        }
                    }
                    catch (Exception ex)
                    {
                        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "ECS File Format");
                        System.Diagnostics.Process.Start(strnewFile);
                    }
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "Still not Generate the ECS Flat File Generation, Use Create Mode");
                    return;
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "ECS File Format");
        }
    }

    protected void FunOpenRecPDF(string strReceiptProcessID)
    {
        //try
        //{
        //    Procparam = new Dictionary<string, string>();
        //    Procparam.Add("@COMPANYID", intCompanyID.ToString());
        //    Procparam.Add("@RECEIPTID", strReceiptProcessID);
        //    Procparam.Add("@Is_Print", "1");
        //    Procparam.Add("@Is_Duplicate", "0");
        //    DataSet dsrecpdf = Utility.GetDataset("CN_Get_RcptDtlRpt", Procparam);
        //    DataRow drHDR = dsrecpdf.Tables[0].Rows[0];
        //    DataTable dtrecept = dsrecpdf.Tables[1];


        //    // Session["Receipt_Amount"] = Convert.ToDecimal(drHDR["TOTAL_RECEIPT_AMOUNT"].ToString());
        //    Session["Random_Num"] = Convert.ToString(drHDR["Rcpt_Rndnm"]);


        //    Guid objGuid;
        //    objGuid = Guid.NewGuid();
        //    ReportDocument rpd = new ReportDocument();
        //    rpd.Load(Server.MapPath("~/PDC Module/ReceiptProc.rpt"));
        //    rpd.SetDataSource(dsrecpdf.Tables[0]);

        //    if (dsrecpdf.Tables.Count >= 1)
        //    {
        //        if (dsrecpdf.Tables[1].Rows.Count > 0)
        //        {
        //            //rpd.ReportDefinition.Sections[1].SectionFormat.EnableSuppress = false;
        //            rpd.Subreports[0].SetDataSource(dtrecept);
        //        }
        //        else
        //        {
        //            rpd.ReportDefinition.Sections[1].SectionFormat.EnableSuppress = true;
        //        }
        //    }

        //    else
        //    {
        //        rpd.ReportDefinition.Sections[1].SectionFormat.EnableSuppress = true;
        //    }

        //    //TextObject txttot = (TextObject)rpd.Subreports["ReceiptProc.rpt"].ReportDefinition.Sections["DetailSection1"].ReportObjects["txttot"];            
        //    //txttot.Text = Session["Receipt_Amount"].ToString();

        //    //TextObject txtrndm = (TextObject)rpd.ReportDefinition.Sections["Section3"].ReportObjects["txtrndm"];
        //    //txtrndm.Text = Session["Random_Num"].ToString();

        //    string strFolder = (Server.MapPath(".") + "\\PDF Files\\");
        //    string strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + "Receipt" + ".pdf");

        //    if (!(System.IO.Directory.Exists(strFolder)))
        //    {
        //        DirectoryInfo di = Directory.CreateDirectory(strFolder);
        //    }

        //    if (dsrecpdf.Tables[1].Rows.Count > 0)
        //    {
        //        rpd.ExportToDisk(ExportFormatType.PortableDocFormat, strnewFile);
        //        string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Receipt", strScipt, true);

        //    }
        //    else
        //    {
        //        Utility.FunShowAlertMsg(this, "Cannot Generate Receipt");
        //        return;
        //    }
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}

        try
        {
            String strHTML = String.Empty;

            strHTML = FunPubGetTemplateContent(intCompanyID, "110", null, null, 103, strReceiptProcessID);


            if (strHTML == "")
            {
                Utility.FunShowAlertMsg(this, "Template Master not defined");
                return;
            }

            string FileName = PDFPageSetup.FunPubGetFileName(strReceiptProcessID + intUserID + DateTime.Now.ToString("ddMMMyyyyHHmmss"));

            string FilePath = Server.MapPath(".") + "\\PDF Files\\";
            string DownFile = FilePath + FileName + ".pdf";
            SaveDocument(strHTML, strReceiptProcessID, FilePath, FileName);
            if (!File.Exists(DownFile))
            {
                Utility.FunShowAlertMsg(this, "File not exists");
                return;
            }
            WaterMarkPages((1).ToString(), DownFile, DownFile, "");
            Response.AppendHeader("content-disposition", "attachment; filename=Receipt_" + FileName + ".pdf");
            Response.ContentType = "application/pdf";
            Response.WriteFile(DownFile);
        }
        catch (Exception objException)
        {

        }
    }

    protected void SaveDocument(string strHTML, string ReferenceNumber, string FilePath, string FileName)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANYID", intCompanyID.ToString());
            Procparam.Add("@User_Id", intUserID.ToString());
            Procparam.Add("@RECEIPTID", ReferenceNumber);
            Procparam.Add("@Is_Print", "1");
            Procparam.Add("@Is_Duplicate", "0");
            DataSet dsrecpdf = Utility.GetDataset("CN_Get_RcptDtlRpt", Procparam);

            if (dsrecpdf.Tables[0].Rows.Count > 0)
            {
                strHTML = PDFPageSetup.FunPubBindCommonVariables(strHTML, dsrecpdf.Tables[0]);
                Session["Random_Num"] = Convert.ToString(dsrecpdf.Tables[0].Rows[0]["Rcpt_Rndnm"]); ;
            }

            if (dsrecpdf.Tables[1].Rows.Count > 0)
            {
                if (strHTML.Contains("~tbAsset~"))
                {
                    if (dsrecpdf.Tables[0].Rows.Count > 0)
                    {
                        if (dsrecpdf.Tables[0].Rows[0]["LOB_ID"].ToString() == "4" || dsrecpdf.Tables[0].Rows[0]["LOB_ID"].ToString() == "5")
                        {
                            strHTML = strHTML.Replace("Installment", "Invoice Ref No.");
                        }
                    }
                    strHTML = PDFPageSetup.FunPubBindTable("~tbAsset~", strHTML, dsrecpdf.Tables[1]);
                }
            }
            if (dsrecpdf.Tables[1].Rows.Count > 0)
            {
                if (strHTML.Contains("~tbAssetCompanyCopy~")) // Newly Added
                    strHTML = PDFPageSetup.FunPubBindTable("~tbAssetCompanyCopy~", strHTML, dsrecpdf.Tables[1]);
            }

            List<string> listImageName = new List<string>();
            listImageName.Add("~CompanyLogo~");
            List<string> listImagePath = new List<string>();
            listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/CompanyLogo.png"));

            strHTML = PDFPageSetup.FunPubBindImages(listImageName, listImagePath, strHTML.TrimEnd());
            PDFPageSetup.FunPubSaveDocument(strHTML.Trim(), FilePath, FileName, "P", 1, strDateFormat);
        }
        catch (Exception ex)
        {

            return;
        }
    }

    public string FunPubBindTable(string strtblName, string strHTML, DataTable dtHeader)
    {
        try
        {
            string row = "";
            string newtr = String.Empty;
            var startTag = "";
            var endTag = "";
            int startIndex = 0;
            int endIndex = 0;
            string strrow = "";
            string strTable;

            startTag = strtblName;
            endTag = "</table>";
            startIndex = strHTML.LastIndexOf("<table", strHTML.IndexOf(startTag) + startTag.Length);
            endIndex = strHTML.IndexOf(endTag, startIndex) + endTag.Length;
            strTable = strHTML.Substring(startIndex, endIndex - startIndex);
            string strtempTable = strTable;


            startTag = "<tr";
            endTag = "</tr>";
            startIndex = strtempTable.IndexOf(startTag);
            endIndex = strtempTable.IndexOf(endTag, startIndex) + endTag.Length;
            strrow = strtempTable.Substring(startIndex, endIndex - startIndex);
            strtempTable = strtempTable.Replace(strrow, "");
            strHTML = strHTML.Replace(strTable, strtempTable);

            startTag = "<tr";
            endTag = "</tr>";
            startIndex = strtempTable.IndexOf(startTag);
            endIndex = strtempTable.IndexOf(endTag, startIndex) + endTag.Length;
            strrow = strtempTable.Substring(startIndex, endIndex - startIndex);
            strtempTable = strtempTable.Replace(strrow, "");

            startTag = "<tr";
            endTag = "</tr>";
            startIndex = strtempTable.IndexOf(startTag);
            endIndex = strtempTable.IndexOf(endTag, startIndex) + endTag.Length;
            row = strtempTable.Substring(startIndex, endIndex - startIndex);

            for (int i = 0; i < dtHeader.Rows.Count; i++)
            {

                string tr = row;
                DataRow dr = dtHeader.NewRow();
                foreach (DataColumn dcol in dtHeader.Columns)
                {
                    dr = dtHeader.Rows[i];
                    string ColName1 = string.Empty;
                    ColName1 = "~" + dcol.ColumnName + "~";
                    if (tr.Contains(ColName1))
                        tr = tr.Replace(ColName1, dr[dcol].ToString());
                }
                newtr = newtr + " " + tr;


            }
            strHTML = strHTML.Replace(row, newtr);
            return strHTML;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    private string FunPubGetTemplateContent(int CompanyID, string Program_ID, string LocationID, string intSubLocationId, int TemplateTypeCode, string Reference_ID)
    {
        try
        {
            DataTable dt = new DataTable();
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", CompanyID.ToString());
            Procparam.Add("@Program_ID", Program_ID.ToString());
            Procparam.Add("@template_type_code", TemplateTypeCode.ToString());
            Procparam.Add("@language", "1");
            Procparam.Add("@Tran_ID", Reference_ID);
            dt = Utility.GetDefaultData("S3G_GET_TEMPLATECONTENT", Procparam);
            if (dt.Rows.Count == 0)
            {
                return "";
            }
            else
                return "<META content='text/html; charset=utf-8' http-equiv='Content-Type'> <table><tr><td>" + dt.Rows[0]["Template_Content"].ToString() + "</td></tr></table> </html>";
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    protected void FunOpenPDF(string strReceiptProcessID)
    {
        string strHTML = FunGetHTMLForRECP(strReceiptProcessID);

        // System.Guid  objGuid = new System.Guid();
        string objGuid = System.Guid.NewGuid().ToString();

        //string strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + objGuid.ToString() + "Receipt.pdf");
        string strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + strReceiptProcessID + "_" + DateTime.Now.ToString("ddMMMyyyyHHmmss") + ".pdf");
        string strnewFile1 = strReceiptProcessID + "_" + DateTime.Now.ToString("ddMMMyyyyHHmmss") + ".pdf";
        //string strFileName = "/PDC Module/PDF Files/Receipt.pdf";
        try
        {
            if (File.Exists(strnewFile) == true)
            {
                File.Delete(strnewFile);
            }

            Document doc = new Document();

            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(strnewFile, FileMode.Create));

            doc.AddCreator("Sundaram Infotech Solutions");
            doc.AddTitle("Receipt");
            doc.Open();
            List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(strHTML), null);
            for (int k = 0; k < htmlarraylist.Count; k++)
            {
                doc.Add((IElement)htmlarraylist[k]);
            }
            doc.AddAuthor("S3G Team");
            doc.Close();

            string strScipt = "window.open('../Common/S3GShowPDF.aspx?qsFileName=" + strnewFile1 + "', 'newwindow','toolbar=no,location=no,menubar=no,width=900,height=600,resizable=yes,scrollbars=no,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PDF", strScipt, true);

            //System.Diagnostics.Process.Start(strnewFile);
            //Process Prc = new Process();
            //Prc.StartInfo.Verb = "open";
            //Prc.StartInfo.CreateNoWindow = false;
            //Prc.StartInfo.FileName = strnewFile;
            //Prc.StartInfo.WindowStyle = ProcessWindowStyle.Normal;
            //Prc.Start();
            //Prc.CloseMainWindow();
            //Prc.Close();




        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Receipt");
            System.Diagnostics.Process.Start(strnewFile);
        }


        //Prc.Kill();

        //string strScipt = "window.open('../Common/S3GDownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "PDF", strScipt, true);
    }

    protected string FunGetHTMLForRECP(string strReceiptProcessID)
    {
        StringBuilder strHTML = new StringBuilder();
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@COMPANYID", intCompanyID.ToString());
        Procparam.Add("@RECEIPTID", strReceiptProcessID);
        Procparam.Add("@Is_Print", "1");
        DataSet dsRECP = Utility.GetDataset("S3G_CLN_GETRECEIPTDETAILS", Procparam);

        DataTable dtHDR = dsRECP.Tables[0];

        if (dtHDR.Rows.Count > 0)
        {
            DataRow drHDR = dtHDR.Rows[0];

            strHTML.Append(" <font size=\"1\"  color=\"black\" face=\"verdana\">" +
        "<table width=\"85%\">" +
        "<tr>" +
        "<td width=\"100%\">" +
            "<table border=\"0\" width=\"100%\">" +
                "<tr>" +
                    "<td align=\"center\">" +
                       "<b>" + drHDR["COMPANY_NAME"].ToString() + "</b>" +
                    "</td>" +
                "</tr>" +
                "<tr>" +
                    "<td align=\"center\">" +
                        "<b>" + drHDR["Address"] + "</b>" +
                        "<br />" +
                    "</td>" +
                "</tr>" +
                "<tr>" +
                    "<td align=\"center\">" +
                        "<b> ");

            if (drHDR["Print_Count"].ToString() == "0")
            {
                strHTML.Append("RECEIPT");
            }
            else
            {
                strHTML.Append("RECEIPT - Duplicate Copy");
            }
            strHTML.Append("</b>" +
                "</td>" +
            "</tr>" +
        "</table>" +
    "</td>" +
"</tr>" +
"<tr>" +
    "<td>" +
        "<table width=\"100%\">" +
            "<tr>" +
                "<td align=\"left\" valign=\"top\">" +
                  "<table align=\"left\" valign=\"top\" cellpadding=\"0\" cellspacing=\"0\">" +
                     "<tr>" +
                        "<td>" +
                            drHDR["CUSTOMER_NAME"].ToString() + " (" + drHDR["CUSTOMER_CODE"].ToString() + ")" +
                        "</td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td>" +
                            drHDR["COMM_ADDRESS1"].ToString() +
                        "</td>" +
                   " </tr>" +
                    "<tr>" +
                        "<td>" +
                            drHDR["COMM_ADDRESS2"].ToString() +
                        "</td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td>" +
                            drHDR["COMM_CITY"].ToString() +
                        "</td>" +
                    "</tr>" +
                    "<tr>" +
                        "<td>" +
                            drHDR["STATECODE"].ToString() +
                        "</td>" +
                    "</tr>" +
                    "</table>" +
                  "</td>" +
                  "<td>" +
                   "<table width=\"100%\" align=\"right\" cellpadding=\"0\" cellspacing=\"0\">" +
                      "<tr>" +
                             "<td align=\"left\">" +
                                "Location Name" +
                             "</td>" +
                             "<td align=\"center\">" +
                                ":" +
                             "</td>" +
                             "<td align=\"left\">" + //drHDR["LOCATION_CODE"].ToString() + " - " + 
                               drHDR["LOCATION_NAME"].ToString() +
                             "</td>" +
                     "</tr>" +
                     "<tr>" +
                           "<td align=\"left\">" +
                             "Receipt No." +
                           "</td>" +
                           "<td align=\"center\">" +
                             ":" +
                           "</td>" +
                           "<td align=\"left\">" +
                            drHDR["RECEIPT_NO"].ToString() +
                           "</td>" +
                    "</tr>" +
                    "<tr>" +
                          "<td align=\"left\">" +
                            "Date" +
                          "</td>" +
                          "<td align=\"center\">" +
                            ":" +
                          "</td>" +
                          "<td align=\"left\">" +
                            drHDR["VALUE_DATE"].ToString() +
                          "</td>" +
                  "</tr>" +
                  "<tr>" +
                        "<td align=\"left\">" +
                            "Page" +
                        "</td>" +
                        "<td align=\"center\">" +
                            ":" +
                       " </td>" +
                        "<td align=\"left\">" +
                            "1 of 1" +
                        "</td>" +
                 "</tr>" +
                 "<tr>" +
                        "<td align=\"left\">" +
                            "Line of Business" +
                        "</td>" +
                        "<td align=\"center\">" +
                           " :" +
                        "</td>" +
                        "<td align=\"left\">" +
                           drHDR["LOB_Name"].ToString() +
                        "</td>" +
                "</tr>" +
           "</table>" +
       " </td>" +
      "</tr>" +
    "</table>" +
  " </td>" +
"</tr>" +
"<tr>" +
    "<td>" +
        "<table width=\"100%\">" +
            "<tr>" +
                "<td>" +
                    "Received with thanks from " + drHDR["CUSTOMER_NAME"].ToString() +
                    " a sum of " + drHDR["CURRENCY"].ToString() + " " + drHDR["TOTAL_RECEIPT_AMOUNT"].ToString() + "  (" + Convert.ToDecimal(drHDR["TOTAL_RECEIPT_AMOUNT"].ToString()).GetAmountInWords() + ") " +
                    " by " + drHDR["PAYMENT_MODE_DESC1"].ToString());

            if (!string.IsNullOrEmpty(drHDR["INSTRUMENT_NO"].ToString()))
            {
                strHTML.Append(" number " + drHDR["INSTRUMENT_NO"].ToString());
            }
            if (!string.IsNullOrEmpty(drHDR["INSTRUMENT_DATE"].ToString()))
            {
                strHTML.Append(" dated " + drHDR["INSTRUMENT_DATE"].ToString() + " drawn on " + drHDR["DRAWEE_BANK_Name"].ToString() +
                 " " + drHDR["DRAWEE_BANK_LOCATION"].ToString());
            }
            strHTML.Append(" towards the below account(s)." +

                "</td>" +
            "</tr>" +
        "</table>" +
    "</td>" +
"</tr>");




            strHTML.Append(
                  "<tr>" +
  "<td>" +
      "<table width=\"100%\" style=\"border-color: Black;\" border=\"1\" cellpadding=\"4\" cellspacing=\"0\">" +
      "<tr>" +
              "<td align=\"center\" >" +
                  "<font face=\"verdana\" size=\"1\"><b>Sl.No </b></font>" +
              "</td>" +
              "<td align=\"center\">" +
                  "<font face=\"verdana\" size=\"1\"><b>Prime Account</b></font>" +
              "</td>" +
              "<td align=\"center\">" +
                  "<font face=\"verdana\" size=\"1\"><b>Sub Account</b></font>" +
              "</td>" +
              "<td align=\"center\" colspan=\"2\">" +
                   "<font face=\"verdana\" size=\"1\"><b>Particulars</b></font>" + /* Changed by PSK on 19-Jan-2011 - For UAT Issue No.RCT_006 */
              "</td>" +
              "<td align=\"center\">" +
                  "<font face=\"verdana\" size=\"1\"><b>Amount</b></font>" +
              "</td>" +
                  "</tr>");


            DataTable dtGridTbl = dsRECP.Tables[1];

            for (int i = 0; i <= dtGridTbl.Rows.Count - 1; i++)
            {
                string strSubAccount = dtGridTbl.Rows[i]["SubAccountNo"].ToString().ToLower();
                if (strSubAccount == dtGridTbl.Rows[i]["PrimeAccountNo"].ToString().ToLower() + "dummy")
                {
                    strSubAccount = "";
                }

                strHTML.Append("<tr>" +
                        "<td align=\"center\">" +
                            (i + 1).ToString() +
                        "</td>" +
                        "<td>" +
                            dtGridTbl.Rows[i]["PrimeAccountNo"].ToString() +
                        "</td>" +
                        "<td>" +
                            strSubAccount +
                        "</td>" +
                        "<td colspan=\"2\">" +
                            dtGridTbl.Rows[i]["AccountDescription"].ToString() +
                        "</td>" +
                        "<td align=\"right\">" +
                            dtGridTbl.Rows[i]["Amount"].ToString() +
                        "</td>" +
                    "</tr>");
            }



            DataTable dtGridTblAddLess = dsRECP.Tables[2];

            if (dtGridTblAddLess.Rows.Count > 0)
            {
                strHTML.Append(
                  "</table>" +
"</td>" +
"</tr>");
                strHTML.Append(
                        "<tr>" +
      "<td>Add/Less details : </td></tr>" +

                      "<tr>" +
      "<td>" +
          "<table width=\"100%\" style=\"border-color: Black;\" border=\"1\" cellpadding=\"4\" cellspacing=\"0\">" +
           "<tr>" +
                  "<td align=\"center\" >" +
                      "<font face=\"verdana\" size=\"1\"><b>Sl.No </b></font>" +
                  "</td>" +
                    "<td align=\"center\" >" +
                      "<font face=\"verdana\" size=\"1\"><b>Add or Less</b></font>" +
                  "</td>" +
                  "<td align=\"center\">" +
                      "<font face=\"verdana\" size=\"1\"><b>Prime Account</b></font>" +
                  "</td>" +
                  "<td align=\"center\">" +
                      "<font face=\"verdana\" size=\"1\"><b>Sub Account</b></font>" +
                  "</td>" +
                  "<td align=\"center\" colspan=\"2\">" +
                       "<font face=\"verdana\" size=\"1\"><b>Particulars</b></font>" +
                  "</td>" +
                  "<td align=\"center\">" +
                      "<font face=\"verdana\" size=\"1\"><b>Amount</b></font>" +
                  "</td>" +
                      "</tr>");



                for (int i = 0; i <= dtGridTblAddLess.Rows.Count - 1; i++)
                {

                    string strSubAccount = dtGridTblAddLess.Rows[i]["SubAccountNo"].ToString().ToLower();
                    if (strSubAccount == dtGridTblAddLess.Rows[i]["PrimeAccountNo"].ToString().ToLower() + "dummy")
                    {
                        strSubAccount = "";
                    }

                    strHTML.Append("<tr>" +
                       "<td align=\"center\">" +
                           (i + 1).ToString() +
                       "</td>" +
                        "<td>" +
                           dtGridTblAddLess.Rows[i]["ADDLESS"].ToString() +
                       "</td>" +
                       "<td>" +
                           dtGridTblAddLess.Rows[i]["PrimeAccountNo"].ToString() +
                       "</td>" +
                       "<td>" +
                           strSubAccount +
                       "</td>" +
                       "<td colspan=\"2\">" +
                           dtGridTblAddLess.Rows[i]["TAXTYPE"].ToString() +
                       "</td>" +
                       "<td align=\"right\">" +
                           dtGridTblAddLess.Rows[i]["AMOUNT"].ToString() +
                       "</td>" +
                   "</tr>");
                }

                strHTML.Append(
                "<tr>" +
                    "<td>" +
                    "</td>" +
                    "<td>" +
                    "</td>" +
                    "<td>" +
                    "</td>" +
                     "<td>" +
                    "</td>" +
                    "<td colspan=\"2\">" +
                        "Total Amount" +
                    "</td>" +
                    "<td align=\"right\">" +
                        drHDR["TOTAL_RECEIPT_AMOUNT"].ToString() +
                    "</td>" +
                "</tr>" +
            "</table>" +
        "</td>" +
    "</tr>");

            }
            else
            {
                strHTML.Append(
                "<tr>" +
                    "<td>" +
                    "</td>" +
                    "<td>" +
                    "</td>" +
                    "<td>" +
                    "</td>" +
                    "<td colspan=\"2\">" +
                        "Total Amount" +
                    "</td>" +
                    "<td align=\"right\">" +
                        drHDR["TOTAL_RECEIPT_AMOUNT"].ToString() +
                    "</td>" +
                "</tr>" +
            "</table>" +
        "</td>" +
    "</tr>");
            }




            if (!string.IsNullOrEmpty(drHDR["INSTRUMENT_NO"].ToString()))
            {
                strHTML.Append("<tr>" + "<td>" +
                        "*Local / Outstation cheques are subject to realization." +

                    "</td>" +
                "</tr>");
            }
            strHTML.Append(
            "<tr>" +
                "<td>" +
                    "<table width=\"100%\">" +
                        "<tr>" +
                            "<td>" +
                                ObjUserInfo.ProUserNameRW.ToString() + "<br />" +
                                DateTime.Now.ToString(strDateFormat) + " " + DateTime.Now.ToString("hh:mm tt") +
                            "</td>" +
                            "<td width=\"60%\">" +
                            "</td>" +
                            "<td align=\"center\">" +
                                "For " + drHDR["COMPANY_NAME"].ToString() +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td>" +
                //DateTime.Now.ToString(strDateFormat) + " " + DateTime.Now.ToString("hh:mm tt") +
                            "</td>" +
                            "<td width=\"60%\">" +
                            "</td>" +
                            "<td>" +
                            "</td>" +
                        "</tr>" +
                        "<tr>" +
                            "<td>" +
                            "</td>" +
                            "<td widh=\"60%\">" +
                            "</td>" +
                            "<td align=\"center\">" +
                                "AUTHORISED SIGNATORY" +
                            "</td>" +
                        "</tr>" +
                    "</table>" +
                "</td>" +
            "</tr>" +
        "</table> </font>");
        }

        //strHTML.Append(strHTML);

        return strHTML.ToString();
    }

    //public static string GetAmountInWordsDec(decimal dcmlVal)
    //{
    //    try
    //    {
    //        string[] strarr = dcmlVal.ToString().Split('.');
    //        string strAmt = "";
    //        //if (strarr[0] != null)
    //        //{
    //        //    strAmt += FunGetAmountInWordsDecimal(dcmlVal);
    //        //}
    //        if (strarr.Length > 1)
    //        {
    //            if (strarr[0] != null && Convert.ToInt32(strarr[0]) > 0)
    //            {
    //                strAmt += " and " + FunGetAmountInWordsDecimal(dcmlVal);
    //            }
    //        }
    //        return strAmt + " only";
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //        throw ex;
    //    }
    //}

    //public static string FunGetAmountInWordsDecimal(decimal number)
    //{
    //    try
    //    {
    //        if (number == 0) return "Zero";
    //        decimal[] num = new decimal[4];
    //        int first = 0;
    //        decimal u, h, t;
    //        System.Text.StringBuilder sb = new System.Text.StringBuilder();
    //        if (number < 0)
    //        {
    //            sb.Append("Minus ");
    //            number = -number;
    //        }
    //        string[] words0 = { "", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine " };
    //        string[] words1 = { "Ten ", "Eleven ", "Twelve ", "Thirteen ", "Fourteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen " };
    //        string[] words2 = { "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety " };
    //        string[] words3 = { "Thousand ", "Lakh ", "Crore " };
    //        num[0] = Math.Floor(number % 1000); // units  
    //        num[1] = Math.Floor(number / 1000);
    //        num[2] = Math.Floor(number / 100000);
    //        num[1] = Math.Floor(num[1] - 100 * num[2]); // thousands  
    //        num[3] = Math.Floor(number / 10000000); // crores  
    //        num[2] = Math.Floor(num[2] - 100 * num[3]); // lakhs  
    //        for (int i = 3; i > 0; i--)
    //        {
    //            if (num[i] != 0)
    //            {
    //                first = i;
    //                break;
    //            }
    //        }
    //        for (int i = first; i >= 0; i--)
    //        {
    //            if (num[i] == 0) continue;
    //            u = num[i] % 10; // ones  
    //            t = num[i] / 10;
    //            h = num[i] / 100; // hundreds  
    //            t = t - 10 * h; // tens  
    //            if (h > 0) sb.Append(words0[Convert.ToInt64(h)] + "Hundred ");
    //            if (u > 0 || t > 0)
    //            {
    //                //if (h > 0 || i == 0) sb.Append("and "); 
    //                if (t == 0)
    //                    sb.Append(words0[Convert.ToInt64(u)]);
    //                else if (t == 1)
    //                    sb.Append(words1[Convert.ToInt64(u)]);
    //                else
    //                    sb.Append(words2[Convert.ToInt64(t) - 2] + words0[Convert.ToInt64(u)]);
    //            }
    //            if (i != 0) sb.Append(words3[i - 1]);
    //        }
    //        return sb.ToString().TrimEnd();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //        throw ex;
    //    }
    //}

    /// <summary>
    /// This is to add the LOB and Branch as a Query String to your - redirect page
    /// </summary>
    private string FunPriAddLOBBranchQueryString(string strTargetURL)
    {
        //if (ComboBoxBranchSearch != null && ComboBoxBranchSearch.Items.Count > 0 && ComboBoxBranchSearch.SelectedIndex > 0)
        //{
        //    if (strTargetURL.Contains('?'))
        //        strTargetURL += "&Branch=" + ComboBoxBranchSearch.SelectedValue.ToString();
        //    else
        //        strTargetURL += "?Branch=" + ComboBoxBranchSearch.SelectedValue.ToString();
        //}
        if (hdnBranchID.Value != null && hdnBranchID.Value != string.Empty)
        {
            if (strTargetURL.Contains('?'))
                strTargetURL += "&Branch=" + hdnBranchID.Value;
            else
                strTargetURL += "?Branch=" + hdnBranchID.Value;
        }
        if (ComboBoxLOBSearch != null && ComboBoxLOBSearch.Items.Count > 0 && ComboBoxLOBSearch.SelectedIndex > 0)
            if (strTargetURL.Contains('?'))
                strTargetURL += "&LOB=" + ComboBoxLOBSearch.SelectedValue.ToString();
            else
                strTargetURL += "?LOB=" + ComboBoxLOBSearch.SelectedValue.ToString();
        return strTargetURL;
    }



    /// <summary>
    /// Will call create Page - depend on the Program ID passed.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(strRedirectCreatePage))
        {
            Utility.FunShowAlertMsg(this, "Target page not found");
            return;
        }

        Session.Remove("Land_CustomerDT");

        // to get the S3G_LOANAD_GetProgram_Ref_No
        #region To maintain Program_Ref_No in session
        DataTable dt_Program_Ref_No = Utility.FunGetProgramDetailsByProgramCode(ProgramCode);
        if (dt_Program_Ref_No != null && dt_Program_Ref_No.Rows.Count > 0)
        {
            Session["Program_Ref_No"] = dt_Program_Ref_No.Rows[0]["Program_Ref_No"].ToString();
        }
        else
        {
            Session["Program_Ref_No"] = null;
        }
        #endregion

        Response.Redirect(strRedirectCreatePage);
        btnCreate.Focus();//Added by Suseela
    }

    /// <summary>
    /// Will clear the controls
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            //if (ddlMultipleDNC != null && ddlMultipleDNC.Visible && ddlMultipleDNC.Items.Count > 0)
            if (ddlMultipleDNC != null && divMultipleDocNo.Visible && ddlMultipleDNC.Items.Count > 0)
                ddlMultipleDNC.SelectedIndex = 0;
            //if (ddlDNCOption != null && ddlDNCOption.Visible && ddlDNCOption.Items.Count > 0)
            if (ddlDNCOption != null && divDNCOption.Visible && ddlDNCOption.Items.Count > 0)
                ddlDNCOption.SelectedIndex = 0;

            grvTransLander.DataSource = null;
            grvTransLander.Visible = false;
            ucCustomPaging.Visible = false;
            lblErrorMessage.Text =
            txtStartDateSearch.Text =
            txtEndDateSearch.Text = "";
            if (strProgramId == "110")
            {
                txtStartDateSearch.Text = txtEndDateSearch.Text = DateTime.Now.Date.ToString(strDateFormat);
            }
            //Chandu 3-Sep-2013
            //cmbDocumentNumberSearch.SelectedIndex = -1;
            //
            ddlDocumentNumb.SelectedText = String.Empty;
            ComboBoxLOBSearch.SelectedIndex = 0;
            //ComboBoxBranchSearch.SelectedIndex = 0;
            if (ddlDepositBank.SelectedIndex != -1)
                ddlDepositBank.SelectedIndex = 0;
            ddlStatus.SelectedText = "";
            //txtBranchSearch.Text = string.Empty;
            hdnBranchID.Value = string.Empty;
            ViewState["Land_CustomerID"] = "";
            //            cmbCustomerCode.Text = "";
            ucCustomerCodeLov.FunPubClearControlValue();
            ucAccountLov.FunPubClearControlValue();
            txtAccountCode.Text = txtCustomerCodeLease.Text = string.Empty;
            ddlBranch.SelectedIndex = -1;
            FunPriLoadDNCCombo();
            FunPriLoadDNCCombo();


            btnClear.Focus();//Added by Suseela
            ComboBoxLOBSearch.Focus();
            ucAccountLov.Clear();
            TextBox TxtAccNumber = (TextBox)ucAccountLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucAccountLov.FindControl("txtItemName");
            TxtAccNumber.Text = string.Empty;
            txtAccItemNumber.Text = string.Empty;
            HiddenField hdnCID = (HiddenField)ucAccountLov.FindControl("hdnID");
            hdnCID.Value = string.Empty;
        }
        catch (Exception ex)
        {

        }
    }

    /// <summary>
    /// If there is more than one Document Number - then use this DDL
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlMultipleDNC_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlMultipleDNC.SelectedIndex > 0)
        {
            //Chandu on 3-Sep-2013
            //cmbDocumentNumberSearch.Visible =
            ddlDocumentNumb.Visible =
            lblProgramIDSearch.Visible = true;
            if (ProgramCode != "CRP")
                lblProgramIDSearch.Text = ddlMultipleDNC.SelectedItem.ToString();
        }
        else if (ddlMultipleDNC.SelectedIndex == 0)
        {
            if (ProgramCode != "CRP" && ProgramCode != "UTPAR" && ProgramCode != "CTR")
            {
                //Chandu on 3-Sep-2013
                //cmbDocumentNumberSearch.Visible =
                ddlDocumentNumb.Visible =
                lblProgramIDSearch.Visible = false;
            }
        }
        //if (Procparam == null)
        //    Procparam = new Dictionary<string, string>();
        //Procparam.Clear();




        // Add here case statement here - to load document number, and document number label.
        // Add your code here if you are passing the MultipleDNC Query String.
        //switch (ProgramCode)
        //{
        //    //    //sample 
        //    case strReceiptProcessing:
        //        FunPriLoadCombo_ReceiptNo();
        //        break;
        //    case strUTPAReceiptProcessing:
        //        FunPriLoadCombo_UTPAReceiptNo();
        //        break;
        //    case strTempReceiptProcessing:
        //        FunPriLoadCombo_TempReceiptNo();
        //        break;
        //    //    ProgramCodeToCompare = strCreditParameterTransactionCode;
        //    //    strRedirectPage = "~/Origination/S3G_ORG_CreditParameterTransaction.aspx";     // page to redirect to the page                                                                  
        //    //    Procparam.Add("@Company_ID", intCompanyID.ToString());
        //    //    switch (Convert.ToInt32(ddlMultipleDNC.SelectedValue))
        //    //    {

        //    //        case 1:         // Customer Code                           
        //    //            FunPriLoadCombo_CustomerCode_CPT();
        //    //            break;
        //    //        case 2:         // Enquiry Number                            
        //    //            FunPriLoadCombo_EnquiryNo_CPT();
        //    //            break;
        //    //    }
        //    //    break;               

        //}
        ddlMultipleDNC.Focus();//Added by Suseela

    }

    /// <summary>
    /// If there is any specific option releated to the Multiple DNC - then use this method.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlDNCOption_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDNCOption.Focus();//Added by Suseela
    }

    protected void ddlReceiptTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ucCustomerCodeLov.ButtonEnabled = true;
            TextBox txtCode = ucCustomerCodeLov.FindControl("txtName") as TextBox;
            txtCode.Text = "";
            ViewState["hdnCustorEntityID"] = null;
            System.Web.HttpContext.Current.Session["hdnCustorEntityID"] = null;
            lblCustomerCode.Text = lblCustomerCode.ToolTip = "Customer/Entity";
            ucCustomerCodeLov.ClearAddressControls();
            if (ddlReceiptTo != null && ddlReceiptTo.SelectedValue != "0")
            {
                System.Web.HttpContext.Current.Session["Pay_To"] = ddlReceiptTo.SelectedValue;

                if (ddlReceiptTo.SelectedValue == "1")//Customer
                {
                    if (ComboBoxLOBSearch.SelectedValue == "FT")
                    {
                        lblCustomerCode.Text = lblCustomerCode.ToolTip = "Client Code / Name";
                    }
                    else
                    {
                        lblCustomerCode.Text = lblCustomerCode.ToolTip = "Customer Code / Name";
                    }
                    ucCustomerCodeLov.ServiceMethod = "GetCustomerList";
                }
                else if (ddlReceiptTo.SelectedValue == "2")//Dealer Sales Person
                {
                    lblCustomerCode.Text = lblCustomerCode.ToolTip = "Dealer Sales Person / Code";
                    ucCustomerCodeLov.ServiceMethod = "GetVendorsList";
                }
                else if (ddlReceiptTo.SelectedValue == "11")//Insurance Company
                {
                    lblCustomerCode.Text = lblCustomerCode.ToolTip = "Insurance Company / Code";
                    ucCustomerCodeLov.ServiceMethod = "GetVendorsList";
                    ucCustomerCodeLov.ValidationGroup = "Save";
                }
                else if (ddlReceiptTo.SelectedValue == "51")//Life Insurance Company
                {
                    lblCustomerCode.Text = lblCustomerCode.ToolTip = "Life Insurance Company / Code";
                    ucCustomerCodeLov.ServiceMethod = "GetVendorsList";
                }
                else
                {
                    ucCustomerCodeLov.ValidationGroup = "Save";
                    String tmp = ddlReceiptTo.SelectedItem.Text.Trim().ToLower();
                    lblCustomerCode.Text = lblCustomerCode.ToolTip = Char.ToUpperInvariant(tmp[0]) + tmp.Substring(1) + " Code / Name";
                    ucCustomerCodeLov.ServiceMethod = "GetVendorsList";
                }
                UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLov.FindControl("S3GCustomerAddress1");
                Label lblCustomerCodes = (Label)CustomerDetails1.FindControl("lblCustomerCode");
                Label lblCustomerNames = (Label)CustomerDetails1.FindControl("lblCustomerName");
                Label lblCustomerCode1 = (Label)CustomerDetails1.FindControl("lblCustomerCode1");
                Label lblCustomerName1 = (Label)CustomerDetails1.FindControl("lblCustomerName1");
                if (ddlReceiptTo.SelectedValue != "0")
                {
                    lblCustomerCodes.Text = lblCustomerCode1.Text = ddlReceiptTo.SelectedItem.Text.Trim() + " Code";
                    lblCustomerNames.Text = lblCustomerName1.Text = ddlReceiptTo.SelectedItem.Text.Trim() + " Name";
                }
            }

            FunLoadPayToDetails();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    private void FunPriBindReceiptTo()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "41");
            Procparam.Add("@PROGRAMID", "110");
            Procparam.Add("@COMPANYID", Convert.ToString(intCompanyID));
            ddlReceiptTo.BindDataTable("S3G_CLN_LOADLOV", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }
    /// <summary>
    /// To load the DNC combo according to this field get change 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ComboBoxLOBSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ComboBoxLOBSearch.SelectedIndex > 0)
        //{
        //    Procparam = new Dictionary<string, string>();
        //    Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        //    Procparam.Add("@User_ID", Convert.ToString(intUserID));

        //    if (ProgramCode == strUTPAReceiptProcessing)
        //    {
        //        FunPriLoadLocationCombo();
        //        //Procparam.Add("@option", "2");
        //        //ComboBoxBranchSearch.BindDataTable("s3g_cln_utpatransLov", Procparam, true, "-- Select --", new string[] { "Location_Id", "Location" });
        //    }
        //    else
        //    {
        //        Procparam.Add("@Program_ID", strProgramId);
        //        Procparam.Add("@LOB_ID", ComboBoxLOBSearch.SelectedValue.ToString());
        //        ComboBoxBranchSearch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, true, "-- Select --", new string[] { "Location_Id", "Location" });
        //    }
        //}
        ddlDocumentNumb.SelectedText = "";
        ddlDocumentNumb.SelectedValue = "";
        FunPriLoadDNCCombo();                               // to load DNC
        ddlMultipleDNC_SelectedIndexChanged(sender, e);     // to Load Multiple DNC
        ComboBoxLOBSearch.Focus();//Added by Suseela
    }


    /// <summary>
    /// To load the DNC combo according to this field get change 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>    
    protected void ComboBoxBranchSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (ProgramCode)
        {
            //    // sample
            //case strCreditGuideTransaction:
            //    break;
            default:
                FunPriLoadDNCCombo();                               // To load DNC
                ddlMultipleDNC_SelectedIndexChanged(sender, e);     // To load Multiple DNC    
                break;
        }
    }
    #endregion

    private void FunPriQueryString()
    {
        // Add here: if you want to pass the LOB and Branch as  a query string then - use the following case
        // pass you raw - URL string.
        switch (ProgramCode)
        {
            //    // sample 
            //case strApplicationApproval:
            //    strRedirectPage = FunPriAddLOBBranchQueryString("~/Origination/S3GORGApplicationApproval_Add.aspx");
            //    break;
            default:
                break;
        }
    }

    #region Customer Search
    /// <summary>
    /// To load the Customer according to this field get change 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>    
    /// 

    protected void btnLoadCust_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            txtCustomerCodeLease.Text = TxtAccNumber.Text = txtAccItemNumber.Text;
            ucCustomerCodeLov.SelectedValue = hdnCID.Value;
            btnLoadCust.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void ucCustomerCodeLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            TextBox txtCustomerName = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtCustomerItemName = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            if (txtCustomerItemName.Text != "")
                txtCustomerCodeLease.Text = txtCustomerName.Text = txtCustomerItemName.Text;
            else
                txtCustomerCodeLease.Text = txtCustomerName.Text;
            hdnCID.Value = ucCustomerCodeLov.SelectedValue;

            Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            btnLoadCust.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #region "Account Search"

    protected void btnLoadAccount_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TxtAccNumber = (TextBox)ucAccountLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucAccountLov.FindControl("txtItemName");

            HiddenField hdnCID = (HiddenField)ucAccountLov.FindControl("hdnID");
            Button btnLoadAccount = (Button)ucAccountLov.FindControl("btnGetLOV");
            btnLoadAccount.Focus();

            if (ProgramCodeToCompare == strPDCModule || ProgramCodeToCompare == strPDCMaintenance || ProgramCodeToCompare == strPDCReceiptProcess || ProgramCodeToCompare == strChequeReturn || ProgramCodeToCompare == strReceiptProcessing)
            {
                ucAccountLov.SelectedValue = hdnCID.Value;
                ucAccountLov.SelectedText = TxtAccNumber.Text = txtAccountCode.Text = txtAccItemNumber.Text;
            }
            else
            {
                TxtAccNumber.Text = txtAccountCode.Text = txtAccItemNumber.Text = hdnCID.Value;
                ucAccountLov.SelectedValue = hdnCID.Value;
                ucAccountLov.SelectedText = hdnCID.Value;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void ucAccountLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            TextBox txtAccountNumber = (TextBox)ucAccountLov.FindControl("TxtName");
            TextBox AccountNumberItem = (TextBox)ucAccountLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucAccountLov.FindControl("hdnID");
            if (AccountNumberItem.Text == string.Empty)
            {
                txtAccountCode.Text = txtAccountNumber.Text;
            }
            else
            {
                txtAccountCode.Text = txtAccountNumber.Text = AccountNumberItem.Text;
            }
            hdnCID.Value = ucAccountLov.SelectedValue;
            //ucAccountLov.SelectedValue = hdnCID.Value;
            //ucAccountLov.SelectedText = txtCustomerCodeLease.Text;
            Button btnLoadAccount = (Button)ucAccountLov.FindControl("btnGetLOV");
            btnLoadAccount.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    public void FunLoadPayToDetails()
    {
        try
        {
            if (ddlReceiptTo.SelectedIndex > 0)
            {
                switch (ddlReceiptTo.SelectedValue)
                {
                    case "1"://Customer
                        ucCustomerCodeLov.strLOV_Code = "CUS_ACCA";//Customer-"CMD"
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "CUS_ACCA";
                        break;
                    case "2"://Dealer Sales Person
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENDSA";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENDSA";
                        System.Web.HttpContext.Current.Session["Entity_Type"] = "DSP";
                        break;
                    case "3":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENFIA";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENFIA";
                        break;
                    case "4":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENDMA";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENDMA";
                        break;
                    case "5":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENDBTCOLL";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENDBTCOLL";
                        break;
                    case "6":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENVENDOR";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENVENDOR";
                        break;
                    case "7":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENSUNDRY";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENSUNDRY";
                        break;
                    case "8"://Dealer
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENDEALER";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENDEALER";
                        System.Web.HttpContext.Current.Session["Entity_Type"] = "DLR";
                        break;
                    case "9":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENBROK";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENBROK";
                        break;
                    case "10":
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENEMP";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENEMP";
                        break;
                    case "11"://Insurance Company
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENINS";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENINS";
                        System.Web.HttpContext.Current.Session["Entity_Type"] = "INC";
                        break;
                    case "12":
                        ucCustomerCodeLov.strLOV_Code = "ENT_FACT";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_FACT";
                        break;
                    case "51"://Life Insurance Company
                        ucCustomerCodeLov.strLOV_Code = "ENT_ENLINS";
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "ENT_ENLINS";
                        System.Web.HttpContext.Current.Session["Entity_Type"] = "LIP";
                        break;
                    default:
                        ucCustomerCodeLov.strLOV_Code = "CUS_ACCA";//Customer-"CMD"
                        System.Web.HttpContext.Current.Session["LOV_Code"] = "CUS_ACCA";
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }

    }

    #endregion

    protected void txtStartDateSearch_TextChanged(object sender, EventArgs e)
    {
        hidDate.Value = "Start";
        FunPriLoadDNCCombo();
        txtStartDateSearch.Focus();//Added by Suseela
    }

    protected void txtEndDateSearch_TextChanged(object sender, EventArgs e)
    {
        hidDate.Value = "End";
        FunPriLoadDNCCombo();
        txtEndDateSearch.Focus();//Added by Suseela
    }

    // Created By: Anbuvel
    // Created Date: 09-01-2012
    // Descrition: To Bind Location Value

    /// <summary>
    /// GetCompletionList
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


        // branch
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserID"].ToString());
        Procparam.Add("@Program_ID", System.Web.HttpContext.Current.Session["ProgramId"].ToString());
        Procparam.Add("@Type", "GEN");
        Procparam.Add("@PrefixText", prefixText);
        if (System.Web.HttpContext.Current.Session["ProgramCode"] == System.Web.HttpContext.Current.Session["PageUserType"].ToString())
        {
            //Changed By Thangam M on 22/Mar/2012 to fix bug id - 6058
            Procparam.Clear();
            Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
            Procparam.Add("@Type", "UTPA");
            Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Program_ID", System.Web.HttpContext.Current.Session["ProgramId"].ToString());
            if (System.Web.HttpContext.Current.Session["LOBAutoSuggestValue"] != null)
            {
                if (System.Web.HttpContext.Current.Session["LOBAutoSuggestValue"].ToString() != "0")
                    Procparam.Add("@LOB_ID", System.Web.HttpContext.Current.Session["LOBAutoSuggestValue"].ToString());
                else
                    Procparam.Add("@LOB_ID", "0");
            }
            else
            {
                Procparam.Add("@LOB_ID", "0");
            }
            Procparam.Add("@PrefixText", prefixText);
            suggetions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_SA_GET_BRANCHLIST, Procparam));
        }
        else
        {
            suggetions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_SA_GET_BRANCHLIST, Procparam));
        }
        return suggetions.ToArray();
    }

    private Dictionary<string, string> GetDefaultParams()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        if (obj_TransLander.ComboBoxLOBSearch.SelectedIndex > 0)
        {
            Procparam.Add("@LOB_ID", Convert.ToString(obj_TransLander.ComboBoxLOBSearch.SelectedValue));
        }
        //if (obj_TransLander.ddlBranch.Text != string.Empty)
        if (obj_TransLander.ddlBranch.SelectedValue != string.Empty && obj_TransLander.hdnBranchID.Value != string.Empty)
        {
            Procparam.Add("@Location_ID", Convert.ToString(obj_TransLander.hdnBranchID.Value));
        }
        if (!(string.IsNullOrEmpty(obj_TransLander.txtStartDateSearch.Text)))
        {
            Procparam.Add("@StartDate", Utility.StringToDate(obj_TransLander.txtStartDateSearch.Text).ToString());
        }
        if (!(string.IsNullOrEmpty(obj_TransLander.txtEndDateSearch.Text)))
        {
            Procparam.Add("@EndDate", Utility.StringToDate(obj_TransLander.txtEndDateSearch.Text).ToString());
        }
        Procparam.Add("@Company_ID", Convert.ToString(obj_TransLander.intCompanyID));
        Procparam.Add("@User_ID", Convert.ToString(obj_TransLander.intUserID));
        return Procparam;
    }

    [System.Web.Services.WebMethod]
    public static string[] GetDocumentNumberList(String prefixText, int count)
    {
        List<String> suggetions = new List<String>();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam = obj_TransLander.GetDefaultParams();
        Procparam.Add("@SearchText", prefixText);
        string ProcedureName = obj_TransLander.strAutoSuggestProcName;
        switch (obj_TransLander.ProgramCode)
        {
            case strECSProcess:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                break;
            case strECSAuthorization:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                Procparam.Add("@OPTION", "Authorize");
                break;
            case strReceiptProcessing:
                if (obj_TransLander.ddlMultipleDNC.SelectedValue != "0")
                {
                    Procparam.Add("@SearchOption", "1");
                    Procparam.Add("@PaymentMode", obj_TransLander.ddlMultipleDNC.SelectedValue);
                }
                else
                {
                    Procparam.Add("@SearchOption", "1");
                }
                break;
            case strTempReceiptProcessing:
                if (obj_TransLander.ddlMultipleDNC.SelectedValue != "0")
                {
                    Procparam.Add("@MULTIPLEDNC_ID", obj_TransLander.ddlMultipleDNC.SelectedValue);
                }
                break;
            case strECSFlatFileGen:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                break;
            case strDealerSalesCommissionMst:
                Procparam = Utility.FunPubClearDictParam(Procparam);
                Procparam.Add("@COMPANY_ID", Convert.ToString(obj_TransLander.intCompanyID));
                Procparam.Add("@USER_ID", Convert.ToString(obj_TransLander.intUserID));
                Procparam.Add("@PREFIXTEXT", prefixText);
                break;
        }
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData(ProcedureName, Procparam));
        return suggetions.ToArray();
    }

    protected void txtBranchSearch_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            string strhdnValue = hdnBranchID.Value;
            if (strhdnValue == "-1" || strhdnValue == string.Empty)
            {
                txtBranchSearch.Text = string.Empty;
                hdnBranchID.Value = string.Empty;
            }
            txtBranchSearch.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Translander - Collection");
        }
    }
    //Start By Praba on 17-07-2018
    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string strhdnValue = hdnBranchID.Value;
            if (strhdnValue == "-1" || strhdnValue == string.Empty)
            {
                //ddlBranch.ClearSelection();
                hdnBranchID.Value = string.Empty;
            }

            if (ProgramCode == strChallanGeneration)
            {
                PopulateDepositBank();
            }

            hdnBranchID.Value = ddlBranch.SelectedValue;
            ddlBranch.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Translander - Collection");
        }
    }

    public bool IsUserAccessChecker(int Option)
    {
        bool blnRslt = false;
        try
        {
            object count = null;
            int rcount = 0;
            if (dtUserRights.Rows.Count > 0)
            {
                if (Option == 1)//Create
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "ADDACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 2)//Modify
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "MODIFYACESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                if (Option == 3)//Delete
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "DELETEACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 4)//View/Querry
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "VIEWACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
            }
        }
        catch
        {
            blnRslt = false;
        }
        return blnRslt;
    }

    //End By Praba on 17-07-2018
    //SEARCH OPTIONS ADDED By Arunkumar K on 24-Sep-2016
    [System.Web.Services.WebMethod]
    public static string[] GetSearchOptionList(String prefixText, int count)
    {
        List<String> suggetions = new List<String>();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam = obj_TransLander.GetDefaultParams();
        Procparam.Add("@SearchText", prefixText);
        string ProcedureName = obj_TransLander.strAutoSuggestProcName;
        switch (obj_TransLander.ProgramCode)
        {
            case strECSProcess:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                break;
            case strECSAuthorization:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                Procparam.Add("@OPTION", "Authorize");
                break;
            case strReceiptProcessing:
                if (obj_TransLander.ddlMultipleDNC.SelectedValue != "0")
                {
                    Procparam.Add("@SearchOption", "2");
                    Procparam.Add("@PaymentMode", obj_TransLander.ddlMultipleDNC.SelectedValue);
                }
                else
                {
                    Procparam.Add("@SearchOption", "2");
                }
                break;
            case strTempReceiptProcessing:
                if (obj_TransLander.ddlMultipleDNC.SelectedValue != "0")
                {
                    Procparam.Add("@MULTIPLEDNC_ID", obj_TransLander.ddlMultipleDNC.SelectedValue);
                }
                break;
            case strECSFlatFileGen:
                Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
                break;
            case strPDCModule:
                Procparam.Add("@SearchOption", "2");
                break;
            case strPDCReceiptProcess:
                Procparam.Add("@SearchOption", "2");
                break;
            case strChequeReturn:
                Procparam.Add("@SearchOption", "2");
                break;
            case strChallanGeneration:
                Procparam.Add("@SearchOption", "2");
                break;
        }
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData(ProcedureName, Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetSearchOptionListReceipt(String prefixText, int count)
    {
        List<String> suggetions = new List<String>();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Clear();
        Procparam = obj_TransLander.GetDefaultParams();
        Procparam.Add("@SearchText", prefixText);
        string ProcedureName = obj_TransLander.strAutoSuggestProcName;
        switch (obj_TransLander.ProgramCode)
        {
            case strPDCReceiptProcess:
                Procparam.Add("@SearchOption", "3");
                break;
            case strChallanGeneration:
                Procparam.Add("@SearchOption", "1");
                break;
            case strChequeReturn:
                Procparam.Add("@SearchOption", "3");
                break;


        }
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData(ProcedureName, Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        UserInfo Uinfo = new UserInfo();
        Procparam.Add("@COMPANY_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@User_ID", Uinfo.ProUserIdRW.ToString());
        Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
        if (System.Web.HttpContext.Current.Session["LOV_Code"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["LOV_Code"]) != string.Empty)
        {
            Procparam.Add("@LOV", Convert.ToString(System.Web.HttpContext.Current.Session["LOV_Code"]));
        }
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));

        return suggetions.ToArray();

    }

    [System.Web.Services.WebMethod]
    public static string[] GetAccountList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        UserInfo Uinfo = new UserInfo();
        Procparam.Add("@Company_ID", Uinfo.ProCompanyIdRW.ToString());
        Procparam.Add("@User_ID", Uinfo.ProUserIdRW.ToString());
        Procparam.Add("@Program_ID", obj_TransLander.strProgramId);
        Procparam.Add("@PrefixText", prefixText);

        //Customer Search
        if (obj_TransLander.ProgramCodeToCompare == strPDCMaintenance || obj_TransLander.ProgramCodeToCompare == strPDCModule || obj_TransLander.ProgramCodeToCompare == strChequeReturn
            || obj_TransLander.ProgramCodeToCompare == strMemorandumBooking || obj_TransLander.ProgramCodeToCompare == strPDCReceiptProcess)
        {
            if (Convert.ToString(obj_TransLander.ucCustomerCodeLov.SelectedText) != "" && Convert.ToInt32(obj_TransLander.ucCustomerCodeLov.SelectedValue) > 0)
                Procparam.Add("@CUSTOMER_ID", Convert.ToString(obj_TransLander.ucCustomerCodeLov.SelectedValue));
        }

        ////Account Search
        //if (obj_TransLander.ProgramCodeToCompare == strPDCMaintenance || obj_TransLander.ProgramCodeToCompare == strPDCModule)
        //{
        //    if (Convert.ToString(obj_TransLander.ucAccountLov.SelectedText) != "" && Convert.ToInt32(obj_TransLander.ucAccountLov.SelectedValue) > 0)
        //        Procparam.Add("@Account_PASAREF_ID", Convert.ToString(obj_TransLander.ucAccountLov.SelectedValue));
        //}       

        if (obj_TransLander.ddlBranch.SelectedValue != "0" && !obj_TransLander.ddlBranch.SelectedItem.Text.Contains("SELECT"))
            Procparam.Add("@Location_ID", Convert.ToString(obj_TransLander.ddlBranch.SelectedValue));

        if (obj_TransLander.ComboBoxLOBSearch.SelectedValue != "0" && !obj_TransLander.ComboBoxLOBSearch.SelectedItem.Text.Contains("SELECT"))
            Procparam.Add("@LOB_ID", Convert.ToString(obj_TransLander.ComboBoxLOBSearch.SelectedValue));

        if (obj_TransLander.strProgramId == "321" || obj_TransLander.strProgramId == "106" || obj_TransLander.strProgramId == "98" || obj_TransLander.strProgramId == "109" || obj_TransLander.strProgramId == "110")
        {
            Procparam.Add("@OPTION", "2");
        }
        else if (obj_TransLander.strProgramId == "100")
        {
            Procparam.Add("@OPTION", "12");
        }
        else
        {
            Procparam.Add("@OPTION", "1");
        }

        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_Account_AGT", Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetVendorsList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@Company_ID", Convert.ToString(HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@USERID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestUserID"]));
        Procparam.Add("@Entity_Type", Convert.ToString(System.Web.HttpContext.Current.Session["Entity_Type"]));//Life Insurance
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "110");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_Agt", Procparam));
        return suggetions.ToArray();
    }

    //[System.Web.Services.WebMethod]
    //public static string[] GetCustomerList(String prefixText, int count)
    //{
    //    Dictionary<string, string> Procparam;
    //    Procparam = new Dictionary<string, string>();
    //    List<String> suggetions = new List<String>();
    //    DataTable dtCommon = new DataTable();
    //    DataSet Ds = new DataSet();

    //    Procparam.Clear();
    //    Procparam.Add("@COMPANY_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
    //    if (System.Web.HttpContext.Current.Session["LOV_Code"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["LOV_Code"]) != string.Empty)
    //    {
    //        Procparam.Add("@LOV", Convert.ToString(System.Web.HttpContext.Current.Session["LOV_Code"]));
    //    }
    //    if (System.Web.HttpContext.Current.Session["AutoSuggestUserID"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestUserID"]) != string.Empty)
    //    {
    //        Procparam.Add("@User_Id", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestUserID"]));
    //    }
    //    Procparam.Add("@PrefixText", prefixText);
    //    suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));
    //    return suggetions.ToArray();
    //}

    public void WaterMarkPages(string pageRange, string SourcePdfPath, string OutputPdfPath, string str)
    {
        List<int> pagesToDelete = new List<int>();
        Document doc = new Document();
        PdfReader reader = new PdfReader(SourcePdfPath, new System.Text.ASCIIEncoding().GetBytes(""));
        using (MemoryStream memoryStream = new MemoryStream())
        {
            PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);
            if (Session["Random_Num"] != null && Convert.ToString(Session["Random_Num"]) != string.Empty)
            {
                writer.PageEvent = new PdfWriterEvents(Convert.ToString(Session["Random_Num"]));
            }
            doc.Open();
            doc.AddDocListener(writer);


            for (int p = 1; p <= reader.NumberOfPages; p++)
            {
                if (pagesToDelete.FindIndex(s => s == p) != -1)
                {
                    continue;
                }
                doc.SetPageSize(reader.GetPageSize(p));
                if (p > 1)
                {
                    doc.NewPage();
                }
                PdfContentByte cb = writer.DirectContent;
                PdfImportedPage pageImport = writer.GetImportedPage(reader, p);
                int rot = reader.GetPageRotation(p);
                if (rot == 90 || rot == 270)
                    cb.AddTemplate(pageImport, 0, -1.0F, 1.0F, 0, 0, reader.GetPageSizeWithRotation(p).Height);
                else
                    cb.AddTemplate(pageImport, 1.0F, 0, 0, 1.0F, 0, 0);
            }
            reader.Close();
            doc.Close();
            File.WriteAllBytes(OutputPdfPath, memoryStream.ToArray());
        }
    }

}

public class PdfWriterEvents : IPdfPageEvent
{
    string watermarkText = string.Empty;

    public PdfWriterEvents(string watermark)
    {
        watermarkText = watermark;
    }
    public void OnStartPage(PdfWriter writer, Document document)
    {
        float fontSize = 50;
        float xPosition = 300;
        float yPosition = 600;
        float angle = 45;
        try
        {
            PdfContentByte under = writer.DirectContentUnder;
            BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.WINANSI, BaseFont.EMBEDDED);
            under.BeginText();
            under.SetColorFill(iTextSharp.text.pdf.CMYKColor.LIGHT_GRAY);
            under.SetFontAndSize(baseFont, fontSize);
            under.ShowTextAligned(PdfContentByte.ALIGN_CENTER, watermarkText, xPosition, yPosition, angle);
            under.EndText();
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine(ex.Message);
        }
    }
    public void OnEndPage(PdfWriter writer, Document document) { }
    public void OnParagraph(PdfWriter writer, Document document, float paragraphPosition) { }
    public void OnParagraphEnd(PdfWriter writer, Document document, float paragraphPosition) { }
    public void OnChapter(PdfWriter writer, Document document, float paragraphPosition, Paragraph title) { }
    public void OnChapterEnd(PdfWriter writer, Document document, float paragraphPosition) { }
    public void OnSection(PdfWriter writer, Document document, float paragraphPosition, int depth, Paragraph title) { }
    public void OnSectionEnd(PdfWriter writer, Document document, float paragraphPosition) { }
    public void OnGenericTag(PdfWriter writer, Document document, Rectangle rect, String text) { }
    public void OnOpenDocument(PdfWriter writer, Document document) { }
    public void OnCloseDocument(PdfWriter writer, Document document) { }
}

