#region Page Headerd
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Check List for Deal Processing
/// Created By			: Sathish R
/// Created Date		: 24-May-2018
/// <Program Summary>
#endregion

#region NameSpaces
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Globalization;
using System.Data;
using S3GBusEntity.Origination;
using System.Web.Security;
using System.Configuration;
using System.Web.Security;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Text.RegularExpressions;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using ReportAccountsMgtServicesReference;
using S3GBusEntity;
using S3GBusEntity.Reports;
using System.Web.UI.HtmlControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using iTextSharp.text.html;
using System.Collections;
using System.Net.Mail;
#endregion

public partial class Origination_S3gOrgPricing_Add : ApplyThemeForProject
{

    #region Variable declaration
    UserInfo ObjUserInfo;
    S3GSession ObjS3GSession = new S3GSession();
    Dictionary<string, string> Procparam;
    string _Add = "1", _Edit = "2", _Query = "3";
    int _SlNo = 0;
    // bool PaintBG = false;
    int intCompany_Id, intEnqNewCustomerId;
    int intUserId;
    int intResult;
    int intPricingId;
    static string strCurrentFilePath;
    int intProdcutSet = 0;

    string strMode;
    string strErrorMessagePrefix = @"Correct the following validation(s): </br></br>   ";
    DataTable dtAstChk = new DataTable();
    DataTable DtAlertDetails = new DataTable();
    DataTable DtFollowUp = new DataTable();
    DataTable DtCashFlow = new DataTable();
    DataTable DtCashFlowOut = new DataTable();
    DataTable DtRepayGrid = new DataTable();
    DataTable dtWorkFlow = new DataTable();
    int IDocumentCount = 0;

    static DataTable ObjDTAssetDetail;

    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bClearList = false;


    double intAssetamount = 0;
    public string strDateFormat;
    public string strCustomer_Id = string.Empty;
    public string strCustomer_Value = string.Empty;
    public string strCustomer_Name = string.Empty;
    public int intProgramId = 42;
    static string strDocpath;
    static int intRowIndex;
    string strSecondHandDealer = string.Empty;

    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";

    string strRedirectPageView = "window.location.href='../Marketing/S3GORGTransLander.aspx?Code=ORPRC';";
    string strRedirectPageAdd = "window.location.href='../Marketing/S3GOrgPricing_Add.aspx?qsMode=C';";
    string strRedirectPage = "~/Marketing/SS3GORGTransLander.aspx?Code=ORPRC";
    string strRedirectHomePage = "window.location.href='../Common/HomePage.aspx';";
    bool blnIsWorkflowApplicable = Convert.ToBoolean(ConfigurationManager.AppSettings["IsWorkflowApplicable"]);
    PricingMgtServicesReference.PricingMgtServicesClient ObjPricingMgtServices;
    PricingMgtServices.S3G_ORG_PricingDataTable ObjS3G_ORG_Pricing;
    OrgMasterMgtServicesReference.OrgMasterMgtServicesClient ObjCustomerService;
    //string strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //string strNewWin_Repay = "window.showModalDialog('../Origination/S3GORGRepaymentDetails_Add.aspx?IsFrom=Pricing', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');return false;";
    string strPageName = "Pricing";
    //ReportDocument rpd = new ReportDocument();
    public static Origination_S3gOrgPricing_Add obj_PageValue;
    ReportAccountsMgtServicesClient objSerClient;
    S3GAdminServicesReference.S3GAdminServicesClient objS3GAdminServicesClient;
    OrgMasterMgtServicesReference.OrgMasterMgtServicesClient ObjOrgMasterMgtServicesClient;
    static int iCheckDocument = 0;
    bool IsImageUploaded;

    #endregion

    #region Page Load

    PagingValues ObjPaging = new PagingValues();                                // grid paging
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
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




    Dictionary<string, string> strProParmAsset = new Dictionary<string, string>();
    Dictionary<string, string> strProParmDoc = new Dictionary<string, string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            // WF Implementation
            ProgramCode = "042";
            obj_PageValue = this;
            ObjUserInfo = new UserInfo();
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            if (Request.QueryString["qsMode"] != null)
                strMode = Request.QueryString["qsMode"];

            if (Request.QueryString.Get("qsViewId") != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
                intPricingId = Convert.ToInt32(fromTicket.Name);

            }
            strSecondHandDealer = "6227";
            obj_PageValue.intCompany_Id = ObjUserInfo.ProCompanyIdRW;
            intCompany_Id = ObjUserInfo.ProCompanyIdRW;
            intUserId = ObjUserInfo.ProUserIdRW;
            HttpContext.Current.Session["Company_Id"] = intCompany_Id;
            System.Web.HttpContext.Current.Session["MODE"] = strMode;
            Session["Date"] = DateTime.Now.ToString(strDateFormat) + " " + DateTime.Now.ToString().Split(' ')[1].ToString() + " " + DateTime.Now.ToString().Split(' ')[2].ToString();
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
            //txtRequiredFromDate.Attributes.Add("readonly", "readonly");
            //txtTotalAssetValue.Attributes.Add("readonly", "readonly");
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            //txtOfferDate.Text = DateTime.Now.ToString(strDateFormat);
            //ucCustomerCodeLov.strControlID = ucCustomerCodeLov.ClientID.ToString();
            //TextBox txtUserName = ((TextBox)ucCustomerCodeLov.FindControl("txtName"));
            //txtUserName.ToolTip = txtUserName.Text;

            ucCustomerCodeLov.strControlID = ucCustomerCodeLov.ClientID.ToString();
            TextBox txtCustItemNumber = ((TextBox)ucCustomerCodeLov.FindControl("txtItemName"));
            txtCustItemNumber.Style["display"] = "block";
            txtCustItemNumber.Attributes.Add("onfocus", "fnLoadCustomer()");
            txtCustItemNumber.Attributes.Add("readonly", "false");
            txtCustItemNumber.Width = 0;
            txtCustItemNumber.TabIndex = -1;
            txtCustItemNumber.BorderStyle = BorderStyle.None;

            //ucCopyProfileLov.strControlID = ucCopyProfileLov.ClientID.ToString();
            //TextBox txtCopyProfile = ((TextBox)ucCopyProfileLov.FindControl("txtName"));
            //txtCopyProfile.ToolTip = txtCopyProfile.Text;
            //txtCopyProfile.Attributes.Add("onfocus", "fnLoadCustomerCopyProfile()");

            txtSellerCode.Attributes.Add("onchange", "funtrimspace('" + txtSellerCode.ClientID + "');");
            txtSellerName.Attributes.Add("onchange", "funtrimspace('" + txtSellerName.ClientID + "');");
            txtGeneralRemarks.Attributes.Add("onchange", "funtrimspace('" + txtGeneralRemarks.ClientID + "');");
            txtInsuranceRemarks.Attributes.Add("onchange", "funtrimspace('" + txtInsuranceRemarks.ClientID + "');");
            txtInsurancePolicyNo.Attributes.Add("onchange", "funtrimspace('" + txtInsurancePolicyNo.ClientID + "');");


            TextBox txtItemName = ((TextBox)ddlProposalCopy.FindControl("txtItemName"));
            txtItemName.Attributes.Add("onchange", "fnTrashSuggest()");

            TextBox txtItemNameddlDealerName = ((TextBox)ddlDealerName.FindControl("txtItemName"));
            txtItemNameddlDealerName.Attributes.Add("onchange", "fnTrashSuggest('" + ddlDealerName.ClientID + "');");

            TextBox txtItemNameddlSalePersonCodeList = ((TextBox)ddlSalePersonCodeList.FindControl("txtItemName"));
            txtItemNameddlSalePersonCodeList.Attributes.Add("onchange", "fnTrashSuggest('" + ddlSalePersonCodeList.ClientID + "');");

            TextBox txtItemNameddlddlSalePersonCodeList = ((TextBox)ddlSalePersonCodeList.FindControl("txtItemName"));
            txtItemNameddlddlSalePersonCodeList.Attributes.Add("onchange", "fnTrashSuggest('" + ddlSalePersonCodeList.ClientID + "');");

            //TextBox txtItemNameddldealerSalesPerson = ((TextBox)ddldealerSalesPerson.FindControl("txtItemName"));
            //txtItemNameddldealerSalesPerson.Attributes.Add("onchange", "fnTrashSuggest('" + ddldealerSalesPerson.ClientID + "');");

            TextBox txtItemNameddlddlAssetCodeList1 = ((TextBox)ddlAssetCodeList1.FindControl("txtItemName"));
            txtItemNameddlddlAssetCodeList1.Attributes.Add("onchange", "fnTrashSuggest('" + ddlAssetCodeList1.ClientID + "');");


            TextBox txtItemNameddlddlEntityNameList = ((TextBox)ddlEntityNameList.FindControl("txtItemName"));
            txtItemNameddlddlEntityNameList.Attributes.Add("onchange", "fnTrashSuggest('" + ddlEntityNameList.ClientID + "');");

            TextBox ucCustomerCodeLov2 = ((TextBox)ucCustomerCodeLov.FindControl("TxtName"));
            ucCustomerCodeLov2.Attributes.Add("onchange", "fnTrashCommonSuggest('" + ucCustomerCodeLov.ClientID + "');");

            TextBox ucCheckListFromDMSlist = ((TextBox)ucCheckListFromDMS.FindControl("txtItemName"));
            ucCheckListFromDMSlist.Attributes.Add("onchange", "fnTrashSuggest('" + ucCheckListFromDMS.ClientID + "');");

            ucProposalFromDMS.strControlID = ucProposalFromDMS.ClientID.ToString();
            TextBox txtucProposalFromDMS = ((TextBox)ucProposalFromDMS.FindControl("txtName"));
            txtucProposalFromDMS.Style["display"] = "block";
            txtucProposalFromDMS.ToolTip = txtucProposalFromDMS.Text;
            txtucProposalFromDMS.Attributes.Add("onfocus", "fnLoadProposalFromDMS()");
            txtucProposalFromDMS.CssClass = "md-form-control form-control login_form_content_input requires_false";
            txtucProposalFromDMS.Attributes.Add("style", "width:100% !important");

            //txtSecAmount.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Sec.Amount");


            #region Grid Paging Config
            ProPageNumRW = 1;                                                           // to set the default page number
            //TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
            //if (txtPageSize.Text != "")
            //    ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            //else
            //    ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
            ProPageSizeRW = 100;
            PageAssignValue obj = new PageAssignValue(this.AssignValue);
            ucCustomPaging.callback = obj;
            ucCustomPaging.ProPageNumRW = ProPageNumRW;
            ucCustomPaging.ProPageSizeRW = ProPageSizeRW;
            #endregion

            #region Grid PagingDoc Config
            ProPageNumRW = 1;                                                           // to set the default page number
            //TextBox txtPageSize2 = (TextBox)ucCustomPagingDoc.FindControl("txtPageSize");
            //if (txtPageSize2.Text != "")
            //    ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            //else
            //    ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
            ProPageSizeRW = 100;
            PageAssignValue obj2 = new PageAssignValue(this.AssignValueDoc);
            ucCustomPagingDoc.callback = obj2;
            ucCustomPagingDoc.ProPageNumRW = ProPageNumRW;
            ucCustomPagingDoc.ProPageSizeRW = ProPageSizeRW;
            #endregion



            if (!IsPostBack)
            {
                hdnPostback.Value = "0";
                FunPriInitiateFileUploadPopUpGrid();
                funPriLoadDocumentPath();
                if (PageMode == PageModes.Create)
                {
                    //btnchklist.Enabled = false;
                }
                //Page.MaintainScrollPositionOnPostBack = true;
                //ddlLob.Focus();
                //txtProposalNumber.Focus();


                hdnUserId.Value = ObjUserInfo.ProUserIdRW.ToString();
                hdnUserIdName.Value = ObjUserInfo.ProUserNameRW;

                funPriClearCustomerHoverInfo();
                //txtOfferDate.Text = DateTime.Now.ToString(strDateFormat);
                txtOfferDate.Enabled = false;
                HttpContext.Current.Session["Company_Id"] = intCompany_Id.ToString();
                CalendarExtenderSD_RequiredFromDate.Format = strDateFormat;
                CEtxtNoPDC.Format = strDateFormat;
                calCollectedDateffer.Format = strDateFormat;
                calExeOfferValidTill.Format = strDateFormat;
                txtPDCstDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtPDCstDate.ClientID + "','" + strDateFormat + "',false,  false);");//Future Date False,Back Date False
                txtOfferDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOfferDate.ClientID + "','" + strDateFormat + "',false,  false);");//Future Date False,Back Date False
                txtOfferValidTill.Attributes.Add("onblur", "fnDoDate(this,'" + txtOfferValidTill.ClientID + "','" + strDateFormat + "',false,  false);");//Future Date False,Back Date False
                txtRequiredFromDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRequiredFromDate.ClientID + "','" + strDateFormat + "',true,  false);");
                FunGetScreenModifyAccess();
                FunPriLoadPage();
                //funPriLoadSetUnitTestValues();
                tcPricing.ActiveTabIndex = 0;
                hdnSetForceValues.Value = "0";
                txtMarginAmountAsset.Attributes.Add("readonly", "readonly");
                txtMarginPercentage.Attributes.Add("readonly", "readonly");
                txtTotalAssetValue.Attributes.Add("readonly", "readonly");
                txtBookDepreciationPerc.Attributes.Add("readonly", "readonly");
                txtLpoAssetAmount.Attributes.Add("readonly", "readonly");

                //btnAddNew.ToolTip = "Add [Alt+C]";
                FunBind_Effective_To();
                txtCustomerFocus.Attributes.Add("onfocus", "fnLoadCustomerMaster()");
                txtCustomerFocus.Width = 0;
                txtCustomerFocus.TabIndex = -1;
                txtCustomerFocus.BorderStyle = BorderStyle.None;
                //btnUpdateDocumentsDealer.Enabled_False();
                if (PageMode == PageModes.WorkFlow)
                {
                    ViewState["PageMode"] = PageModes.WorkFlow;
                }
                //txtUserName.Attributes.Add("onfocus", "fnLoadCustomer()");
                // WORK FLOW IMPLEMENTATION
                if (ViewState["PageMode"] != null && ViewState["PageMode"].ToString() == PageModes.WorkFlow.ToString())
                {
                    PreparePageForWFLoad();
                }

                #region Setting New Customer Created Form Popup
                if (Session["EnqNewCustomerId"] != null)
                {
                    intEnqNewCustomerId = Convert.ToInt32(Utility.Load("EnqNewCustomerId", ""));
                    HiddenField hdnCustomerId = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    if (hdnCustomerId != null)
                    {
                        hdnCustomerId.Value = hdnCustID.Value = intEnqNewCustomerId.ToString();
                        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                        hdnCID.Value = hdnCID.Value;
                        btnLoadCustomer_Click(null, null);
                    }


                    //if (intEnqNewCustomerId > 0)
                    //{
                    //    FunPriLoadCustomerCode();
                    //    if (Session["EnquiryValue"] != null)
                    //    {
                    //    }
                    //    FunPriLoadCustDetails(intEnqNewCustomerId.ToString(), "2");
                    //    Session["EnqNewCustomerId"] = null;
                    //    Session["EnquiryValue"] = null;
                    //}
                }
                //txtProposalNumber.Focus();
                #endregion


                btnNextTab.Width = 0;
                btnNextTab.BorderStyle = BorderStyle.None;
                btnPrevTab.Width = 0;
                btnPrevTab.BorderStyle = BorderStyle.None;

                //funPriSendEmail();

            }
            else
            {
                hdnPostback.Value = "1";
            }
            //FunPriLoadFileNameInPRDDT();
            MyIframeOpenFile.Src = null;
            FunPriSetMaxLength();
            if (ViewState["PageMode"] != null && ViewState["PageMode"].ToString() == PageModes.WorkFlow.ToString())
            {
                if (ViewState["intPricingId"] != null)
                    intPricingId = Convert.ToInt32(ViewState["intPricingId"]);
            }


            if (ddlLob.SelectedValue == "1" || ddlLob.SelectedValue == "3" || ddlLob.SelectedValue == "5" || ddlLob.SelectedValue == "6")
            {
                ucCustomerCodeLov.strLOV_Code = "CUS_HPV";
            }
            if (ddlLob.SelectedValue == "2")
            {
                ucCustomerCodeLov.strLOV_Code = "CUS_HPNV";
            }
            if (ddlLob.SelectedValue == "4")
            {
                ucCustomerCodeLov.strLOV_Code = "CUS_FAC";
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Due to Data Problem, Unable to Load the CheckList Details";
            cvPricing.IsValid = false;
        }
    }

    public void funCheckGPSMonth()
    {
        try
        {
            DataTable dtCheckPrevMonthClose = new DataTable();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_Id.ToString());
            Procparam.Add("@LOB_ID", ddlLob.SelectedValue);
            Procparam.Add("@Location_Id", cmbLocation.SelectedValue);
            //Procparam.Add("@CLOSURE_DATE", Utility.StringToDate(txtOfferDate.Text).ToString());
            Procparam.Add("@User_ID", intUserId.ToString());
            dtCheckPrevMonthClose = Utility.GetDefaultData("LA_VALI_MTH_CLOSR_APP", Procparam);
            if (dtCheckPrevMonthClose.Rows.Count > 0)
            {
                txtOfferDate.Text = dtCheckPrevMonthClose.Rows[0]["APPLICATION_DATE"].ToString();
                //txtOfferValidTill.Text = DateTime.Now.AddDays(Convert.ToInt32(ViewState["Offer_Validity"].ToString())).ToString(strDateFormat);
                txtOfferValidTill.Text = Utility.StringToDate(dtCheckPrevMonthClose.Rows[0]["APPLICATION_DATE"].ToString()).AddDays(Convert.ToInt32(ViewState["Offer_Validity"])).ToString(strDateFormat);
            }
            funPriAdditionalInfor(ddlLob.SelectedValue, txtOfferDate.Text);
            if (ddlLob.SelectedValue == "6")
            {
                txtOfferDate.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }


    }

    protected void AssignValue(int intPageNum, int intPageSize)
    {
        try
        {
            ProPageNumRW = intPageNum;              // To set the page Number
            ProPageSizeRW = intPageSize;            // To set the page size    
            ViewState["intPageNum"] = intPageNum;
            ViewState["intPageSize"] = intPageSize;
            funPriBindAssetGridViewPaging();                       // Binding the Landing grid

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void AssignValueDoc(int intPageNum, int intPageSize)
    {
        try
        {
            ProPageNumRW = intPageNum;              // To set the page Number
            ProPageSizeRW = intPageSize;            // To set the page size    
            ViewState["intPageNumDoc"] = intPageNum;
            ViewState["intPageSizeDoc"] = intPageSize;
            //if (hdnSetForceValues.Value == "1")
            //{
            //    Utility.FunShowAlertMsg(this, "Update the Documents in Documents Tab");
            //    return;
            //}

            funPriBindDocGridViewPaging();                       // Binding the Landing grid
            if (strMode == "Q")
            {
                if (gvPRDDT.FooterRow != null)
                {
                    gvPRDDT.FooterRow.Visible = false;
                }
                foreach (GridViewRow grv in gvPRDDT.Rows)
                {
                    //DropDownList ddlPriority = grv.FindControl("ddlPriority") as DropDownList;
                    //TextBox txtPRDDCTypeF = grv.FindControl("txtPRDDCTypeF") as TextBox;
                    DropDownList ddlRequired = grv.FindControl("ddlRequired") as DropDownList;
                    DropDownList ddlReceived = grv.FindControl("ddlReceived") as DropDownList;
                    //DropDownList ddlCollectedBy = grv.FindControl("ddlReceivedF") as DropDownList;
                    CheckBox CbxCheck = grv.FindControl("CbxCheck") as CheckBox;
                    TextBox txtCollectedDate = grv.FindControl("txtCollectedDate") as TextBox;
                    AjaxControlToolkit.CalendarExtender calCollectedDate = grv.FindControl("calCollectedDate") as AjaxControlToolkit.CalendarExtender;
                    TextBox txtCADVerifiedDate = grv.FindControl("txtCADVerifiedDate") as TextBox;
                    TextBox txtCADVerifierRemarks = grv.FindControl("txtCADVerifierRemarks") as TextBox;
                    TextBox txtCADReceived = grv.FindControl("txtCADReceived") as TextBox;
                    TextBox txtCADReceiverRemarks = grv.FindControl("txtCADReceiverRemarks") as TextBox;
                    DropDownList ddlScannedBy = grv.FindControl("ddlScannedBy") as DropDownList;
                    TextBox txtScannedDate = grv.FindControl("txtScannedDate") as TextBox;
                    FileUpload flUploadI = grv.FindControl("flUploadI") as FileUpload;
                    TextBox txtScan = grv.FindControl("txtScan") as TextBox;
                    LinkButton hyplnkView = grv.FindControl("hyplnkView") as LinkButton;
                    TextBox txtRemarks = grv.FindControl("txtRemarks") as TextBox;
                    TextBox txtCADValue = grv.FindControl("txtCADValue") as TextBox;
                    CheckBox CbxIsscanned = grv.FindControl("CbxIsscanned") as CheckBox;
                    //CheckBox chkSel = grv.FindControl("chkSel") as CheckBox;
                    LinkButton lnkRemovePRDDC = grv.FindControl("lnkRemovePRDDC") as LinkButton;
                    // LinkButton lnkUpdateDocuments = grv.FindControl("lnkUpdateDocuments") as LinkButton;


                    ddlRequired.Enabled = ddlReceived.Enabled =
                     CbxCheck.Enabled = calCollectedDate.Enabled = txtCADVerifiedDate.Enabled =
                    txtCADVerifierRemarks.Enabled = txtCADVerifierRemarks.Enabled = txtCADReceived.Enabled = txtCADReceiverRemarks.Enabled =
                    ddlScannedBy.Enabled = txtScannedDate.Enabled = flUploadI.Enabled = txtScan.Enabled = txtRemarks.Enabled =
                    txtCADValue.Enabled = CbxIsscanned.Enabled = lnkRemovePRDDC.Enabled = false;
                    lnkUpdateDocuments.Enabled_False();
                    txtCollectedDate.Enabled = false;




                }
            }



        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    //protected void Page_UnLoad(object sender, EventArgs e)
    //{
    //    if (rpd != null)
    //    {
    //        rpd.Close();p
    //        rpd.Dispose();
    //    }
    //}




    private void PreparePageForWFLoad()
    {
        WorkflowMgtServiceReference.WorkflowMgtServiceClient objWorkflowToDoClient = new
            WorkflowMgtServiceReference.WorkflowMgtServiceClient();

        try
        {

            //if (Session["Program_Ref_No"] != null)
            //{
            //    if (Convert.ToString(Session["Program_Ref_No"]).EndsWith("0"))
            //    {
            //        FunPriLoadPage();

            //    }
            //    else
            //    {
            WorkFlowSession WFSessionValues = new WorkFlowSession();

            FunProPageLoad(_Add);
            //FunPriPricingControlStatus(0);
            //WorkflowMgtServiceReference.WorkflowMgtServiceClient objWorkflowToDoClient = new WorkflowMgtServiceReference.WorkflowMgtServiceClient();
            byte[] bytePricing = objWorkflowToDoClient.FunPubLoadPricing(WFSessionValues.WorkFlowDocumentNo, int.Parse(CompanyId), WFSessionValues.Document_Type);
            DataSet dsEnquiryAppraisal = (DataSet)ClsPubSerialize.DeSerialize(bytePricing, SerializationMode.Binary, typeof(DataSet));


            if (dsEnquiryAppraisal.Tables.Count > 1)
            {
                if (dsEnquiryAppraisal.Tables[1].Rows.Count > 0)
                {
                    intPricingId = Convert.ToInt32(dsEnquiryAppraisal.Tables[1].Rows[0]["Doc_Id"].ToString());
                    ViewState["intPricingId"] = intPricingId;
                    FunAssetPanelVisible(true);
                    //FunPriGetPricingDetails(intPricingId);
                    //FunPriPricingControlStatus(1);

                }
            }
            else
            {
                if (dsEnquiryAppraisal.Tables[0].Rows.Count > 0)
                {
                    //cmbCustomerCode.Text = Convert.ToString(dsEnquiryAppraisal.Tables[0].Rows[0]["Customer_Id"]);
                    // strCustomer_Id = Convert.ToString(dsEnquiryAppraisal.Tables[0].Rows[0]["Customer_Id"]);
                    //ddlEnquiryNumber.SelectedValue = Convert.ToString(dsEnquiryAppraisal.Tables[0].Rows[0]["Enquiry_Response_ID"]);
                    //ddlSanctionNumber.SelectedValue = Convert.ToString(dsEnquiryAppraisal.Tables[0].Rows[0]["Santion_Number"]);
                    //txtSanctionDate.Text = DateTime.Parse(Convert.ToString(dsEnquiryAppraisal.Tables[0].Rows[0]["Sanction_Date"]), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                    FunPriShowCustomerDetails();
                    //FunPriLoadDetailsFromEnquiry(ddlEnquiryNumber.SelectedValue, "Enqr");
                }
            }


            //btnClear.Enabled = false;
            btnClear.Enabled_False();
            //btnClear.Attributes.Add("disabled", "disabled");  // enable false
            //btnClear.Attributes.Add("class", "css_btn_disabled");  // enable false css
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable Load Pricing page");
        }
        finally
        {
            objWorkflowToDoClient.Close();
        }

    }
    //    }
    //}


    private void FunPriLoadPage()
    {
        try
        {
            if (intPricingId == 0)
            {
                intProdcutSet = 0;
                FunProPageLoad(_Add);
            }
            if (intPricingId > 0)
            {
                intProdcutSet = 1;
                FunProLoadCheckListDetails(intCompany_Id);

                //FunPubLoadAssetCategories(intCompany_Id, null, null, "Class Code");
                //funPriVoidLoadAssetCategory();
                //funPriLoadCommonLookup();
                //funPriVoidLoadAssetModalDetails();
                //S3GCustomerCommAddress.BindAddressSetupDetails(1);
                FunPriLoadTenureType();
                //funPriLoadProduct(1);
                //FunPriLoad_AssetDetails(_Add);
                FunPriFill_Alert_Tab(_Add);
                funPrivLoadPDCGrid();
                ddlCustomerType_SelectedIndexChanged(null, null);
                FunPriGetPricingDetails(intPricingId);
                ddlPayTo_SelectedIndexChanged(null, null);
                if (strMode == "M")
                {
                    //FunPriGetTemplateNames();
                    FunPriPricingControlStatus(1);
                    //btnCopyProfile.Enabled_False_Asp();
                    btnCopyProfile.Enabled_False();
                    funPriDisableFTControlsActions();
                }
                if (strMode == "Q")
                {
                    FunPriPricingControlStatus(-1);
                    //btnCopyProfile.Enabled_False_Asp();
                    btnCopyProfile.Enabled_False();
                    funPriDisableFTControlsActions();
                }
            }
            else
            {
                //btnCopyProfile.Enabled_True_Asp();
                btnCopyProfile.Enabled_True();
                FunPriPricingControlStatus(0);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable Load Pricing page");
        }
    }

    private void FunPriLoadMarginResidual()
    {
        if (ViewState["ROIRules"] != null)
        {

        }
    }

    #endregion

    #region Page Events
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtDateofBirth.ToolTip = "Date of Birth";
            lblDateofBirth.Text = "Date of Birth";

            ucCustomerCodeLov.ToolTip = string.Empty;
            FunPriResetValues();
            funPriClearCustomerHoverInfo();
            if (ViewState["CHK_CPYPR"] != null)
            {
                if (Convert.ToString(ViewState["CHK_CPYPR"]) == "1")
                {
                    //btnCopyProfile.Enabled_True_Asp();
                    btnCopyProfile.Enabled_True();
                    //btnCopyProfile.ToolTip = "Copy Profile";
                }
            }
            hdnIsLoad.Value = "0";
            txtOfferDate.Text = string.Empty;
            txtOfferValidTill.Text = string.Empty;
            FunPriFill_Alert_Tab(_Add);
            ddlLob_SelectedIndexChanged(null, null);
            hdnIsLoad.Value = "0";
            tcPricing.ActiveTabIndex = 0;

            grvAdditionalInfo.DataSource = null;
            grvAdditionalInfo.DataBind();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = "Error in clearing values";
            cvPricing.IsValid = false;
        }
    }

    //protected void btnCreateCustomer_Click(object sender, EventArgs e)
    //{

    //    try
    //    {
    //        string strNewWin = string.Empty;
    //        if (ddlEnquiryNumber.SelectedValue != "0")
    //        {
    //            Session["EnquiryValue"] = ddlEnquiryNumber.SelectedValue;
    //            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes&NewCustomerID=0 &CR_VALUE=" + ViewState["CR_VALUE"].ToString() + " &qsMode=C&EnquiryID=" + ddlEnquiryNumber.SelectedValue + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //        }
    //        else if (Request.QueryString.Get("qsCRMID") != null)
    //        {
    //            FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsCRMID"));
    //            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes&qsMode=C&NewCustomerID=0&CRM_ID=" + Convert.ToString(fromTicket.Name) + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //        }
    //        else
    //        {
    //            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes& qsMode=C&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //        }

    //        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
    //        this.Focus();
    //        return;
    //    }
    //    catch (Exception ae)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ae, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to create new customer";
    //        cvPricing.IsValid = false;
    //    }
    //}

    //protected void ddlSanctionNumber_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        if (ddlSanctionNumber.SelectedIndex > 0)
    //        {
    //            //LoadDetailsFromSanction(ddlSanctionNumber.SelectedValue, hdnCustID.Value);
    //            FunPriOLRelatedChanges();
    //        }
    //        else
    //        {
    //            //FunPriResetValues();
    //            // txtSanctionDate.Text = "";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Sanction number details";
    //        cvPricing.IsValid = false;
    //    }

    //}

    protected void ddlEnquiryNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //if (ddlEnquiryNumber.SelectedIndex > 0)
            //{

            //    //FunPriLoadDetailsFromEnquiry(ddlEnquiryNumber.SelectedValue, "Enqr");
            //    FunPriOLRelatedChanges();
            //}
            //else
            //{
            //    //FunPriResetValues();
            //    //  txtEnquiryDate.Text = "";
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Enquiry number details";
            cvPricing.IsValid = false;
        }
    }

    protected void ddlLob_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            funPriClearLobBasedControls();
            ddlCustomerType_SelectedIndexChanged(null, null);
            txtFacilityAmt.Text = string.Empty;
            txtDateofBirth.ToolTip = "Date of Birth";
            lblDateofBirth.Text = "Date of Birth";
            if (ViewState["CHK_CPYPR"] != null)
            {
                if (Convert.ToString(ViewState["CHK_CPYPR"]) == "1")
                {
                    //btnCopyProfile.Enabled_True_Asp();
                    //btnCopyProfile.ToolTip = "Copy Profile";
                    btnCopyProfile.Enabled_True();
                }
            }
            ucCustomerCodeLov.ToolTip = string.Empty;
            DataTable dt = (DataTable)ViewState["LOB"];
            //ddlLOB_SelectedItem_Text.Value 
            DataRow[] dr = dt.Select("LOB_ID='" + ddlLob.SelectedValue + "'");
            if (dr.Length > 0)
            {
                hdnLobCode.Value = dr[0]["LOB_CODE"].ToString();
            }

            if (hdnLobCode.Value.ToUpper() == "HP")
            {
                tcPricing.Tabs[1].Enabled = true;
                txtFacilityAmt.Enabled = false;
                rfvLPOAmount.Enabled = false;
                lblFacilityAmt.CssClass = "styleDisplayLabel";

                ddlDealerName.IsMandatory = true;
                lblDealerName.CssClass = "styleReqFieldLabel";
                //rfvSellerCode.Enabled = true;
                //rfvSellerName.Enabled = true;
                lblSellerName.CssClass = "styleReqFieldLabel";
                lblSellerCode.CssClass = "styleReqFieldLabel";
            }
            else
            {
                tcPricing.Tabs[1].Enabled = false;
                txtFacilityAmt.Enabled = true;
                rfvLPOAmount.Enabled = true;
                lblFacilityAmt.CssClass = "styleReqFieldLabel";

                ddlDealerName.IsMandatory = false;
                lblDealerName.CssClass = "styleDisplayLabel";
                //rfvSellerCode.Enabled = false;
                //rfvSellerName.Enabled = false;
                lblSellerName.CssClass = "styleDisplayLabel";
                lblSellerCode.CssClass = "styleDisplayLabel";

            }
            FunPriLoadLocation(intCompany_Id, intUserId, intProgramId, Convert.ToInt32(ddlLob.SelectedValue));
            funPriLoadProduct();
            funPriDisableFTControlsActions();
            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            txtName.Text = string.Empty;
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            ucCustomerCodeLov.Clear();
            hdnCID.Value = string.Empty;
            hdnSetForceValues.Value = "0";
            ddlLob.Focus();


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }
    private void funPriDisableFTControlsActions()
    {
        try
        {
            if (hdnLobCode.Value.ToUpper() == "TL")
            {
                divddlContType.Style.Add("display", "none");
                divddlDealerName.Style.Add("display", "none");
                divtxtSellerName.Style.Add("display", "none");
                divtxtSellerCode.Style.Add("display", "none");
                divddldealerSalesPerson.Style.Add("display", "none");
                divddlInsuranceby.Style.Add("display", "none");
                divddlInsuranceCoverage.Style.Add("display", "none");
                divtxtInsuranceRemarks.Style.Add("display", "none");
                divtxtInsurancePolicyNo.Style.Add("display", "none");

                rfvToolTip.Enabled = false;
                rfvDealType.Enabled = false;
                pnlDealerDocuments.Style.Add("display", "none");
                divddlDealType.Style.Add("display", "none");

                

                //ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
                //AjaxControlToolkit.TabContainer tcPrice = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcPricing");
                //AjaxControlToolkit.TabPanel tpAsset = (AjaxControlToolkit.TabPanel)tcPrice.FindControl("TabAssetDetails");
                //tpAsset.Visible = false;
            }

            else if (hdnLobCode.Value.ToUpper() == "FT")
            {
                pnlPdcHdr.Visible = false;
                pnlPdcdtl.Visible = false;
                divddlContType.Style.Add("display", "none");
                divddlDealerName.Style.Add("display", "none");
                divtxtSellerName.Style.Add("display", "none");
                divtxtSellerCode.Style.Add("display", "none");
                divddldealerSalesPerson.Style.Add("display", "none");
                lblFacilityAmt.Text = "Prepayment Limit";
                divtxtOfferDate.Style.Add("display", "none");
                divtxtOfferValidTill.Style.Add("display", "none");
                divtxtTenure.Style.Add("display", "none");

                divddlInsuranceby.Style.Add("display", "none");
                divddlInsuranceCoverage.Style.Add("display", "none");
                divtxtInsuranceRemarks.Style.Add("display", "none");
                divtxtInsurancePolicyNo.Style.Add("display", "none");

                rfvToolTip.Enabled = false;
                rfvDealType.Enabled = false;
                //rfvSellerName.Enabled = false;
                //rfvSellerCode.Enabled = false;
                rfvLPOAmount.Enabled = false;
                rfvTenure.Enabled = false;
                rfvTenureType.Enabled = false;
                pnlDealerDocuments.Style.Add("display", "none");
            }
            else
            {
                pnlPdcHdr.Visible = true;
                pnlPdcdtl.Visible = true;
                divddlContType.Style.Add("display", "block");
                divddlDealerName.Style.Add("display", "block");
                divtxtSellerName.Style.Add("display", "block");
                divtxtSellerCode.Style.Add("display", "block");
                divddldealerSalesPerson.Style.Add("display", "block");
                lblFacilityAmt.Text = "Finanace Amount";
                divtxtOfferDate.Style.Add("display", "block");
                divtxtOfferValidTill.Style.Add("display", "block");
                divtxtTenure.Style.Add("display", "block");

                divddlInsuranceby.Style.Add("display", "block");
                divddlInsuranceCoverage.Style.Add("display", "block");
                divtxtInsuranceRemarks.Style.Add("display", "block");
                divtxtInsurancePolicyNo.Style.Add("display", "block");


                rfvToolTip.Enabled = true;
                rfvDealType.Enabled = true;
                //rfvSellerName.Enabled = true;
                //rfvSellerCode.Enabled = true;
                rfvLPOAmount.Enabled = false;
                rfvTenure.Enabled = true;
                rfvTenureType.Enabled = true;
                pnlDealerDocuments.Style.Add("display", "block");

                if (ddlContType.SelectedValue == "1")//New
                {
                    //lblSellerName.CssClass = "styleDisplayLabel";
                    //lblSellerCode.CssClass = "styleDisplayLabel";
                    //rfvSellerName.Enabled = false;
                    //rfvSellerCode.Enabled = false;
                    txtSellerCode.Enabled = false;
                    txtSellerName.Enabled = false;

                }
                else
                {
                    //lblSellerName.CssClass = "styleReqFieldLabel";
                    //lblSellerCode.CssClass = "styleReqFieldLabel";
                    //rfvSellerName.Enabled = true;
                    //rfvSellerCode.Enabled = true;
                    txtSellerCode.Enabled = true;
                    txtSellerName.Enabled = true;
                }
            }
            if (hdnLobCode.Value.ToUpper() == "WC" || hdnLobCode.Value.ToUpper() == "FT")
            {
                divtxtTenure.Style.Add("display", "none");
                rfvTenure.Enabled = false;
                rfvTenureType.Enabled = false;
                pnlPdcHdr.Visible = false;
                pnlPdcdtl.Visible = false;
                //rfvSellerName.Enabled = false;
                //rfvSellerCode.Enabled = false;
            }
            else
            {
                divtxtTenure.Style.Add("display", "block");
                rfvTenure.Enabled = true;
                rfvTenureType.Enabled = true;
                pnlPdcHdr.Visible = true;
                pnlPdcdtl.Visible = true;
            }
            if (hdnLobCode.Value.ToUpper() == "TL")
            {
                pnlDealerDocuments.Style.Add("display", "none");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriClearLobBasedControls()
    {
        try
        {
            funPriClearCustomerHoverInfo();
            funPriClearAssetValues();
            ddlLob.Focus();
            hdnIsLoad.Value = "1";
            ddlDealerName.Clear();
            ddldealerSalesPerson.Clear();
            ddlSalePersonCodeList.Clear();
            ddlCustomerType.ClearSelection();
            txtDateofBirth.Text = string.Empty;
            ddlContType.ClearSelection();
            ddlDealType.ClearSelection();
            txtOfferDate.Text = string.Empty;
            txtOfferValidTill.Text = string.Empty;
            txtSellerCode.Text = string.Empty;
            txtSellerName.Text = string.Empty;
            ddlSalePersonCodeList.Clear();
            ddlProduct.ClearSelection();
            txtLpoAssetAmount.Text = string.Empty;
            txtTenure.Text = string.Empty;
            ddlInsuranceby.ClearSelection();
            ddlInsuranceCoverage.ClearSelection();
            txtInsuranceRemarks.Text = string.Empty;
            txtCustomerNameLease.Text = string.Empty;




        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void cmbLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        FunPriLoadSubLocation(intCompany_Id, intUserId, cmbLocation.SelectedValue, 1);
        funCheckGPSMonth();
        cmbLocation.Focus();
    }
    private void FunPriLoadSubLocation(int CompanyId, int UserId, string Region_Id, int Is_active)
    {
        try
        {
            DataTable dt = new DataTable();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@COMPANY_ID", HttpContext.Current.Session["Company_Id"].ToString());
            strProParm.Add("@USER_ID", intUserId.ToString());
            strProParm.Add("@REGION_ID", cmbLocation.SelectedValue);
            strProParm.Add("@IS_ACTIVE", "1");
            dt = Utility.GetDefaultData("S3G_ORG_LOAD_SUBLOAC", strProParm);
            cmbSubLocation.FillDataTable(dt, "BRANCH_ID", "BRANCH");
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {

        }
    }

    protected void FunProLoadSanctionDetails()
    {
        //if (ddlSanctionNumber.SelectedIndex > 0)
        //{
        //    if (ddlLob.SelectedValue != "0" && ddlProduct.SelectedValue != "0")
        //    {
        //        Procparam = new Dictionary<string, string>();
        //        Procparam.Add("@LOB_ID", ddlLob.SelectedValue);
        //        Procparam.Add("@Product_ID", ddlProduct.SelectedValue);
        //        Procparam.Add("@Sanction_Id", ddlSanctionNumber.SelectedValue.Split(',')[0].ToString());
        //        Procparam.Add("@Option", "24");
        //        DataTable dtSanctionAmount = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);
        //        if (dtSanctionAmount.Rows.Count > 0)
        //        {
        //            //txtSanctionDate.Text = Utility.StringToDate(dtSanctionAmount.Rows[0]["Approved_Date"].ToString()).ToString(strDateFormat);
        //            //txtFacilityAmt.Text = Math.Round(Convert.ToDecimal(dtSanctionAmount.Rows[0]["Final_Sanctioned_Limit"].ToString()), 0).ToString();
        //        }
        //        else
        //        {
        //            Utility.FunShowAlertMsg(this, "Sanction details not available for selected Line of Bussiness and Product");
        //            //txtSanctionDate.Text = txtFacilityAmt.Text = "";
        //            ddlProduct.SelectedValue = "0";
        //            return;

        //        }
        //        //txtFacilityAmt.ReadOnly = true;
        //    }
        //    else
        //    {
        //        //txtSanctionDate.Text = txtFacilityAmt.Text = "";
        //    }
        //}
    }

    //Code added by Saran on 25-Nov-2011 for the observation raised by RS.-start
    //protected void ddlCollectedBy_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int intCurrentRow = ((GridViewRow)((Button)sender).Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent).RowIndex;
    //    UserControls_S3GAutoSuggest ddlCollectedBy = gvPRDDT.Rows[intCurrentRow].FindControl("ddlCollectedBy") as UserControls_S3GAutoSuggest;
    //    if (ddlCollectedBy.SelectedValue != "0")
    //    {
    //        Label lblCollectedBy = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblCollectedBy");
    //        lblCollectedBy.Text = ddlCollectedBy.SelectedValue;
    //    }

    //}

    //protected void ddlCADVerifiedBy_Item_Selected(object Sender, EventArgs e)
    //{
    //    int intCurrentRow = ((GridViewRow)((Button)Sender).Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent).RowIndex;
    //    UserControls_S3GAutoSuggest ddlCADVerifiedBy = gvPRDDT.Rows[intCurrentRow].FindControl("ddlCADVerifiedBy") as UserControls_S3GAutoSuggest;
    //    if (ddlCADVerifiedBy.SelectedValue != "0")
    //    {
    //        Label lblCADVerifiedById = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblCADVerifiedById");
    //        lblCADVerifiedById.Text = ddlCADVerifiedBy.SelectedValue;
    //    }
    //}
    //protected void ddlCADReceivedBy_Item_Selected(object Sender, EventArgs e)
    //{
    //    int intCurrentRow = ((GridViewRow)((Button)Sender).Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent).RowIndex;
    //    UserControls_S3GAutoSuggest ddlCADReceivedBy = gvPRDDT.Rows[intCurrentRow].FindControl("ddlCADReceivedBy") as UserControls_S3GAutoSuggest;
    //    if (ddlCADReceivedBy.SelectedValue != "0")
    //    {
    //        Label lblCADReceivedById = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblCADReceivedById");
    //        lblCADReceivedById.Text = ddlCADReceivedBy.SelectedValue;
    //    }
    //}
    //protected void ddlScannedBy_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //DropDownList ddlScannedBy = sender as DropDownList;
    //if (ddlScannedBy.SelectedIndex > 0)
    //{
    //    int intCurrentRow = ((GridViewRow)ddlScannedBy.Parent.Parent).RowIndex;
    //    Label lblScannedBy = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblScannedBy");
    //    lblScannedBy.Text = ddlScannedBy.SelectedValue;
    //}
    //}
    //Code added by Saran on 25-Nov-2011 for the observation raised by RS.-end

    //protected void ddlRequired_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddlRequired = sender as DropDownList;
    //    if (ddlRequired.SelectedIndex > 0)
    //    {
    //        int intCurrentRow = ((GridViewRow)ddlRequired.Parent.Parent).RowIndex;
    //        Label lblDocRequired = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblDocRequired");
    //        lblDocRequired.Text = ddlRequired.SelectedValue;
    //    }
    //}
    //protected void ddlReceived_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DropDownList ddlReceived = sender as DropDownList;
    //    if (ddlReceived.SelectedIndex > 0)
    //    {
    //        int intCurrentRow = ((GridViewRow)ddlReceived.Parent.Parent).RowIndex;
    //        Label lblDocReceived = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblDocReceived");
    //        lblDocReceived.Text = ddlReceived.SelectedValue;
    //    }
    //}
    protected void rdnlAssetType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            //txtBookDepreciationPerc.Text = "";
            //txtBlockDepreciationPerc.Text = "";

            //if (rdnlAssetType.SelectedValue == "1")
            //{
            //    FunProLoadAssetValue("OLD");
            //    FunPriLANNumVisble(true);
            //    lblRequiredFromDate.CssClass = "styleReqFieldLabel";
            //    CalendarExtenderSD_RequiredFromDate.Enabled = true;
            //    //FunPriOLRelatedChanges();//ol related changes on 27-07-2011.
            //    txtUnitValue.ReadOnly = true;
            //}
            //else
            //{
            //    FunProLoadAssetValue("NEW");
            //    FunPriLANNumVisble(false);
            //    lblStatus.Visible = false;
            //    txtStatus.Visible = false;
            //    lblRequiredFromDate.CssClass = "styleDisplayLabel";
            //    CalendarExtenderSD_RequiredFromDate.Enabled = false;
            //    //FunPriOLRelatedChanges();//ol related changes on 27-07-2011.
            //    txtUnitValue.ReadOnly = false;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            //if (rdnlAssetType.SelectedValue == "1")
            //{
            //    cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Lease Asset Numbers";
            //}
            //else
            //{
            //    cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Asset Codes";
            //}
            cvPricing.IsValid = false;
        }
    }

    private void FunProLoadAssetValue(string StrAssetType)
    {
        DataTable DtRate = new DataTable();
        Dictionary<string, string> dictParam = new Dictionary<string, string>();

        if (StrAssetType.ToUpper() == "NEW")
            dictParam.Add("@OPTION", "2");
        else
            dictParam.Add("@OPTION", "6");

        dictParam.Add("@COMPANYID", intCompany_Id.ToString());
        DtRate = Utility.GetDataset("S3G_ORG_GETAPPLICATIONASSET", dictParam).Tables[0];
        //ddlAssetCodeList.DataSource = DtRate;
        //ddlAssetCodeList.DataTextField = "Asset_Code";
        //ddlAssetCodeList.DataValueField = "Asset_ID";
        //ddlAssetCodeList.DataBind();
        //ddlAssetCodeList.Items.Insert(0, new ListItem("--Select--", "0"));
        //ddlAssetCodeList.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
        ViewState["RateDt1"] = DtRate;

        if (ddlPayTo.SelectedItem.Text.ToUpper() == "ENTITY")
        {
            FunToggleEntityControls(true);
        }
        else if (ddlPayTo.SelectedItem.Text.ToUpper() == "CUSTOMER")
        {
            FunToggleEntityControls(false);
        }
    }

    //To Load Asset through Auto Suggest
    #region Service Methods
    [System.Web.Services.WebMethod]
    public static string[] GetAsset(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@COMPANYID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Contract_Type", "3");
        Procparam.Add("@LOB_ID", obj_PageValue.ddlLob.SelectedValue);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ASSETPRI", Procparam), true);
        //if (suggetions.Count > 0)
        //{
        //    obj_PageValue.FunAssetchanges();
        //}
        return suggetions.ToArray();

    }
    #endregion

    protected void FunAssetchanges()
    {
        //lblStatus.Visible = false;
        //txtStatus.Visible = false;
        //txtBookDepreciationPerc.Text = "";
        //txtBlockDepreciationPerc.Text = "";
        txtUnitValue.Text = "";
        txtTotalAssetValue.Text = "";
        txtMarginPercentage.Text = "";
        txtMarginAmountAsset.Text = "";
        //FunPriFillDepreciationRate();
        // ddlAssetCodeList.ToolTip = ddlAssetCodeList.SelectedItem.Text;
    }

    private void FunPriOLRelatedChanges()
    {
        //OL related changes on 27-07-2011.
        //ViewState["OlExistingAsset"] = AssetType;
        //string strType;
        //strType = ddlLob.SelectedItem.Text.ToLower().Split('-')[0].Trim();
        //if (strType == "ol")
        //{
        //    gvOutFlow.Enabled = false;
        //    ddlPaymentRuleList.SelectedIndex = -1;
        //    rfvddlPaymentRuleList.Enabled = false;
        //    lblPaymentRuleList.CssClass = "styleDisplayLabel";
        //    ddlPaymentRuleList.Enabled = false;
        //    btnFetchPayment.Enabled = false;
        //    hdnPayment.Value = "";
        //    gvPaymentRuleDetails.DataSource = null;
        //    gvPaymentRuleDetails.DataBind();
        //    rfvFacilityAmount.Enabled = false;
        //    lblFacilityAmt.CssClass = "styleDisplayLabel";
        //}
        //else
        //{
        //    rfvddlPaymentRuleList.Enabled = true;
        //    lblRequiredFromDate.CssClass = "styleReqFieldLabel";
        //    ddlPaymentRuleList.Enabled = true;
        //    btnFetchPayment.Enabled = true;
        //    gvOutFlow.Enabled = true;
        //    rfvFacilityAmount.Enabled = true;
        //    lblFacilityAmt.CssClass = "styleReqFieldLabel";
        //}
    }

    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //ddlPaymentRuleList.Items.Clear();
            //div8.Visible = false;
            //if (ddlProduct.SelectedIndex > 0)
            //{
            //    //Procparam = new Dictionary<string, string>();
            //    //Procparam.Add("@Is_Active", "1");
            //    //Procparam.Add("@Company_ID", intCompany_Id.ToString());
            //    ////Procparam.Add("@LOB_ID", ddlLob.SelectedItem.Value);
            //    //Procparam.Add("@Product_ID", ddlProduct.SelectedItem.Value);
            //    //Procparam.Add("@Option", "8");
            //    //ddlPaymentRuleList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "Payment_RuleCard_ID", "Payment_Rule_Number" });

            //    //hdnPayment.Value = "";
            //}
            //FunProLoadSanctionDetails();
            //FunPriLoadPreDisbursementDocument();
            //ddlProduct.Focus();
            hdnIsLoad.Value = "1";
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load product based details";
            cvPricing.IsValid = false;
        }

    }

    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    // Added By Shibu 17-Sep-2013 Branch List 
    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_PageValue.intCompany_Id.ToString());
        Procparam.Add("@Type", "GEN");
        Procparam.Add("@User_ID", obj_PageValue.intUserId.ToString());
        Procparam.Add("@Program_Id", "042");
        //Procparam.Add("@Lob_Id", obj_PageValue.ddlLob.SelectedValue);
        Procparam.Add("@Is_Active", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_SA_GET_BRANCHLIST, Procparam));

        return suggestions.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetSaleAlertUser(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_PageValue.intCompany_Id.ToString());
        Procparam.Add("@Prefix", prefixText);
        //Procparam.Add("@DESIGNATION_ID", "8");//MO

        //Procparam.Add("@User_Id", obj_Page.intUserId.ToString());
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_USERLIST_AGT_ALERT", Procparam));

        return suggestions.ToArray();
    }
    // Added By Shibu 17-Sep-2013 User List (Auto Suggestion)
    [System.Web.Services.WebMethod]
    public static string[] GetUserList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_PageValue.intCompany_Id.ToString());
        Procparam.Add("@Prefix", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_Get_User_List, Procparam));

        return suggestions.ToArray();
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        Page.Form.Attributes.Add("enctype", "multipart/form-data");
    }
    private void funPriUpdateDocuments()
    {
        funPriInsertTempDocTable("2");

    }
    private void funComplianceAge()
    {
        hdnCustAge.Value = string.Empty;
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "2");
        Procparam.Add("@Companyid", Convert.ToString(intCompany_Id));
        Procparam.Add("@PROGRAM_ID", Convert.ToString(45));
        Procparam.Add("@TRAN_DATE", Utility.StringToDate(txtOfferDate.Text).ToString());


        DataTable dtcheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
        if (dtcheck.Rows.Count > 0)
        {
            if (Convert.ToInt32(dtcheck.Rows[0]["CHECK_AGE"]) > 0)
            {
                hdnCustAge.Value = Convert.ToString(dtcheck.Rows[0]["CHECK_AGE"]);
            }
        }
    }
    public bool funPriChecCustomerAge()
    {
        bool bReturn = true;
        try
        {

            if (!string.IsNullOrEmpty(txtDateofBirth.Text))
            {
                int intDOBYear = Utility.StringToDate(txtDateofBirth.Text).Year;
                hdnAge.Value = ((DateTime.Now.Year - intDOBYear)).ToString();
                if (hdnAge.Value.Trim() != string.Empty)
                {
                    if (Convert.ToInt32(hdnAge.Value) < 18)
                    {
                        Utility.FunShowAlertMsg(this, "Customer Age Should be Between 18 And 65");
                        hdnAge.Value = string.Empty;
                        bReturn = false;

                    }
                    else
                    {
                        if (FunPriValidateAgeComplaince(Convert.ToInt32(hdnAge.Value)))
                        {
                            Utility.FunShowAlertMsg(this, "Customer as Maximum Age borrower");

                            bReturn = false;
                        }

                    }
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        return bReturn;
    }

    private bool FunPriValidateAgeComplaince(int age)
    {
        bool blnIsDuplicate = false;
        try
        {
            if (hdnCustAge.Value != null && hdnCustAge.Value != string.Empty)
            {
                if (!(Convert.ToInt32(hdnCustAge.Value) > age))
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


    private void funPriTriggerCustomerLimits()
    {
        try
        {
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            DataSet ds;
            Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
            objProcedureParameters.Add("@Option", "1");
            objProcedureParameters.Add("@COMPANY_ID", intCompany_Id.ToString());
            objProcedureParameters.Add("@CustomerId", hdnCID.Value);
            ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", objProcedureParameters);
            if (ds.Tables[3].Rows.Count > 0)
            {
                //txtCreditLimit.Text = ds.Tables[2].Rows[0]["MAX_LEND_AMOUNT"].ToString();
                //txtConstitution.Text = ds.Tables[2].Rows[0]["Constitution"].ToString();
                ViewState["Occupation"] = ds.Tables[3].Rows[0]["Occupation"].ToString();
                ViewState["CUSTOMER_TYPE_ID"] = ds.Tables[3].Rows[0]["CUSTOMER_TYPE_ID"].ToString();
                ViewState["Max_Lend_Amount"] = ds.Tables[3].Rows[0]["Max_Lend_Amount"].ToString();
                ViewState["Max_Lend_Limit_Exp"] = ds.Tables[3].Rows[0]["Max_Lend_Limit_Exp"].ToString();
                ViewState["FAC_APPLICABLE"] = ds.Tables[3].Rows[0]["FAC_APPLICABLE"].ToString();
                ViewState["FAC_LIMIT"] = ds.Tables[3].Rows[0]["FAC_LIMIT"].ToString();
                ViewState["FACT_LIMIT_EXP_DATE"] = ds.Tables[3].Rows[0]["FACT_LIMIT_EXP_DATE"].ToString();


            }
        }
        finally
        {

        }
    }
    protected void btnUploadROPDocuments_ServerClick(object sender, EventArgs e)
    {
        try
        {
            txtFileRemarks.Text = string.Empty;
            if (ViewState["UploadedFiles"] != null)
            {
                DataTable dt = (DataTable)ViewState["UploadedFiles"];
                if (dt.Rows.Count > 0)
                {
                    grvUploadedFiles.DataSource = dt;
                    grvUploadedFiles.DataBind();
                    ViewState["UploadedFiles"] = dt;
                }
                else
                {
                    grvUploadedFiles.DataSource = dt;
                    grvUploadedFiles.EmptyDataText = "No Records Found..";
                    grvUploadedFiles.DataBind();
                }
            }
            MPUploadFiles.Show();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    private void FunPriInitiatePopUpGrid()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SNo");
        dt.Columns.Add("Serial_No");
        dt.Columns.Add("FileName");
        dt.Columns.Add("Scanned_Ref_No");
        dt.Columns.Add("Remarks");
        //dt.Columns.Add("Cust_Constitution_Docs_ID");
        //dt.Columns.Add("ConstitutionDocuments_ID");
        //dt.Columns.Add("Cust_Constitution_Docs_Upload_ID");
        ViewState["UploadedFiles"] = dt;
    }

    private void funPriLoadDocumentPath()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompany_Id));
            Procparam.Add("@LOB_ID", ddlLob.SelectedValue);
            Procparam.Add("@Program_Id", intProgramId.ToString());
            Procparam.Add("@Is_Active", "1");
            DataTable dtDocPath = Utility.GetDefaultData("S3G_OR_Get_DocPathforLOB", Procparam);
            if (dtDocPath.Rows.Count > 0)
            {
                if (dtDocPath.Rows[0]["Path"].ToString() == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Document Path not Defined");
                    return;
                }
            }
            else
            {
                Utility.FunShowAlertMsg(this, "Document Path not Defined");
                return;
            }
            ViewState["ConsDocPath"] = dtDocPath.Rows[0]["Path"];
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            System.Web.HttpFileCollection hfc = Request.Files;
            if (fuOtherFiles.HasFile)
            {

                string strCurrentSerialNo = lblCurerntSNo.Text;

                if (lblCurerntSNo.Text == string.Empty)
                {
                    strCurrentSerialNo = "0";
                }

                string strPath = string.Empty;
                DataTable dt = (DataTable)ViewState["UploadedFiles"];

                int intFilePosition = 0;

                string fileExtension = Path.GetExtension(fuOtherFiles.FileName);
                if (fileExtension != "" && fileExtension.ToLower() != ".bmp" && fileExtension.ToLower() != ".jpeg" && fileExtension.ToLower() != ".jpg" && fileExtension.ToLower() != ".gif" && fileExtension.ToLower() != ".png" && fileExtension.ToLower() != ".pdf" && fileExtension.ToLower() != ".BMP")
                {
                    Utility.FunShowAlertMsg(this, "File extension not supported, only image & pdf files should be uploaded.");
                    MPUploadFiles.Show();
                    return;
                }
                if (ViewState["ConsDocPath"] == null)
                {
                    Utility.FunShowAlertMsg(this, "Document Path not Defined");
                    MPUploadFiles.Show();
                    return;
                }

                if (ViewState["ConsDocPath"].ToString() != string.Empty || ViewState["ConsDocPath"].ToString() != "")
                {
                    strPath = Path.Combine(ViewState["ConsDocPath"].ToString(), "COMPANY" + intCompany_Id.ToString() + "/" + "CUSTDOC-" + strCurrentSerialNo.ToString());

                    if (!Directory.Exists(strPath))
                    {
                        Directory.CreateDirectory(strPath);
                    }

                    strPath = strPath + "/" + fuOtherFiles.FileName;
                }

                FileInfo f1 = new FileInfo(strPath);
                if (f1.Exists == true)
                {
                    f1.Delete();
                }
                fuOtherFiles.SaveAs(strPath);
                int intSerial_No = 0;

                DataRow dRRow = dt.NewRow();
                dRRow["SNo"] = strCurrentSerialNo;
                dRRow["Serial_No"] = intFilePosition;
                dRRow["FileName"] = fuOtherFiles.FileName;
                dRRow["Scanned_Ref_No"] = strPath;
                dRRow["Remarks"] = txtFileRemarks.Text;
                dt.Rows.Add(dRRow);
                IsImageUploaded = true;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
                grvUploadedFiles.DataSource = dt;
                grvUploadedFiles.DataBind();
                MPUploadFiles.Show();
                txtFileRemarks.Text = string.Empty;
            }
            else
            {
                Utility.FunShowAlertMsg(this, "Choose the File for Upload");
                MPUploadFiles.Show();
                return;
            }
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            iCheckDocument = 0;
            lnkUpdateDocuments_Click(null, null);
            //return;
            if (hdnSetForceValuesDealer.Value == "1")
            {
                Utility.FunShowAlertMsg(this, "Dealer Document Details Modified Update and Continue");
                return;
            }

            //Added on 23-Feb-2019 Starts Here
            //To Check Documents are collected
            if (iCheckDocument > 0)
            {
                return;
            }
            //Added on 23-Feb-2019 Ends Here

            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");

            if (hdnIsDMS.Value != "1")
            {
                if (txtName.Text == string.Empty || hdnCID.Value == "0")
                {
                    Utility.FunShowAlertMsg(this, "Select an existing customer or create a new customer");
                    return;
                }
            }

            //if (hdnSetForceValues.Value == "1")
            //{
            //    Utility.FunShowAlertMsg(this, "Update the Documents in Documents Tab");
            //    return;
            //}

            //ViewState["Max_Lend_Amount"] = ds.Tables[3].Rows[0]["Max_Lend_Amount"].ToString();
            //ViewState["Max_Lend_Limit_Exp"] = ds.Tables[3].Rows[0]["Max_Lend_Limit_Exp"].ToString();


            // if(Convert.ToDecimal( txtFacilityAmt.Text)<Convert.ToDecimal(txtcr))

            //if (ddlDealerName.SelectedText == string.Empty)
            //{
            //    Utility.FunShowAlertMsg(this, "Select an Dealer Name");
            //    return;
            //}
            if (ddlSalePersonCodeList.SelectedText == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Sales Person");
                return;
            }


            if (hdnLobCode.Value == "HP")
            {
                if (gvAssetDetails.Rows.Count == 0)
                {
                    //dtAstChk = new DataTable();
                    //Procparam = new Dictionary<string, string>();
                    //Procparam.Add("@Company_ID", intCompany_Id.ToString());
                    //Procparam.Add("@LOB_ID", ddlLob.SelectedItem.Value);
                    //Procparam.Add("@Product_ID", ddlProduct.SelectedItem.Value);
                    //dtAstChk = Utility.GetDefaultData("S3G_SYSAD_GET_PRODASTCHK", Procparam);
                    //if (dtAstChk.Rows[0]["ACTCHK"].ToString() == "1")
                    //{
                    //    if (dtAstChk.Rows[0]["ASTCHK"].ToString() == "1")
                    //    {
                    //        //Utility.FunShowAlertMsg(this.Page, "Asset is mandatory for the selected LOB and Product");
                    //        Utility.FunShowValidationMsg(this.Page, "ORG_PRI", 3);
                    //        return;
                    //    }
                    //}
                    //Utility.FunShowValidationMsg(this.Page, "ORG_PRI", 3);
                    Utility.FunShowAlertMsg(this.Page, "Asset is mandatory for the Selected Line of Business");
                    return;
                }
            }
            //cvPricing.ValidationGroup = "btnSave";
            if (FunPriCheckIsPageValid())
            {
                //return;


                //funPriTriggerCustomerLimits();
                //if (ViewState["CUSTOMER_TYPE_ID"] != null)
                //{
                //    if (ViewState["CUSTOMER_TYPE_ID"].ToString() == "1")
                //    {
                //        if (!funPriChecCustomerAge())
                //        {
                //            return;
                //        }


                //    }
                //}
                //if (ViewState["Max_Lend_Amount"] != null)
                //{
                //    if (Convert.ToDecimal(ViewState["Max_Lend_Amount"]) < Convert.ToDecimal(txtFacilityAmt.Text))
                //    {
                //        Utility.FunShowAlertMsg(this, "Customer Credit Limit Exceeded");
                //        return;
                //    }
                //}
                //if (ViewState["Max_Lend_Limit_Exp"] != null)
                //{
                //    if (ViewState["Max_Lend_Limit_Exp"].ToString() == "TRUE")
                //    {
                //        Utility.FunShowAlertMsg(this, "Customer Credit Limit Expired");
                //        return;
                //    }
                //}
                //if (ViewState["FAC_APPLICABLE"] != null)
                //{
                //    if (ViewState["FAC_APPLICABLE"].ToString() == "1")
                //    {

                //        if (hdnLobCode.Value.ToUpper() == "FT" || hdnLobCode.Value.ToUpper() == "WC")
                //        {
                //            if (ViewState["FAC_LIMIT"] != null)
                //            {
                //                if (Convert.ToDecimal(ViewState["FAC_LIMIT"]) < Convert.ToDecimal(txtFacilityAmt.Text))
                //                {
                //                    Utility.FunShowAlertMsg(this, "Factoring Limit Exceeded");
                //                    return;
                //                }
                //            }
                //            if (ViewState["FACT_LIMIT_EXP_DATE"] != null)
                //            {
                //                if (ViewState["FACT_LIMIT_EXP_DATE"].ToString() == "TRUE")
                //                {
                //                    Utility.FunShowAlertMsg(this, "Factoring Limit Expired");
                //                    return;
                //                }
                //            }
                //        }
                //    }
                //}

                FunPubPricingSave();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to save pricing details";
            cvPricing.IsValid = false;
        }
        finally
        {
            if (ObjPricingMgtServices != null)
                ObjPricingMgtServices.Close();

        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriFill_Repayment_Tab(_Add);
            //FunPriIRRReset();
            //gvRepaymentSummary.ClearGrid();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to reset the values";
            cvPricing.IsValid = false;
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        intPricingId = 0;
        if (Request.QueryString["qsCRMID"] != null)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "window.close();", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "window.parent.document.getElementById('ctl00_ContentPlaceHolder1_btnFrameCancel').click()", true);

            //FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(hdnCustID.Value, false, 0);
            ////Response.Redirect("S3GOrgCRM.aspx?qsCustomer=" + FormsAuthentication.Encrypt(Ticket));
            //Response.Redirect("~/Origination/S3GOrgCRM_View.aspx?Code=CRM", false);
        }
        else if (Request.QueryString["Popup"] != null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Close", "window.close();", true);
        }
        else if (PageMode == PageModes.WorkFlow)
        {
            ReturnToWFHome();
        }
        else
        {
            Response.Redirect("~/Marketing/S3GORGTransLander.aspx?Code=ORPRC");
        }
    }



    protected void cmbCustomerCode_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            //string[] strcustCode = cmbCustomerCode.Text.Split(new string[] { "--" }, StringSplitOptions.RemoveEmptyEntries);
            //if (strcustCode.Length > 1)
            //{
            //    FunPriLoadCustDetails(strcustCode[1].ToString().Trim(), "1");
            //}
            //else if (strcustCode.Length > 0)
            //{
            //    FunPriLoadCustDetails(strcustCode[0].ToString().Trim(), "1");
            //}
            //else
            //{
            //    if (cmbCustomerCode.Text != "")
            //    {
            //        Utility.FunShowAlertMsg(this, "Select a valid customer");
            //        return;
            //    }
            //    else
            //    {
            //        FunPriLoadCustDetails("", "1");
            //    }
            //}

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Customer details";
            cvPricing.IsValid = false;
        }
    }

    protected void btnCalIRR_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    if (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddlLob.SelectedItem.Text.ToUpper().Split('-')[0].Trim() != "FT")
        //    {
        //        if (gvRepaymentDetails.Rows.Count > 0)
        //        {
        //            FunPriCalculateIRR(1);

        //            if (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL") && ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "TERM LOAN")
        //            {
        //                FunPriInsertUMFC();
        //            }
        //            if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper() != "PRODUCT"))
        //            {
        //                grvRepayStructure.Columns[5].Visible = false;
        //                //grvRepayStructure.Columns[6].Visible = true;
        //                //grvRepayStructure.Columns[7].Visible = true;
        //            }
        //            else
        //            {
        //                grvRepayStructure.Columns[5].Visible = true;
        //                grvRepayStructure.Columns[6].Visible = false;
        //                grvRepayStructure.Columns[7].Visible = false;
        //            }

        //        }
        //        else
        //        {
        //            Utility.FunShowAlertMsg(this, "Add atleast one repayment details");
        //        }
        //    }

        //}
        //catch (Exception ex)
        //{
        //    Utility.FunShowAlertMsg(this, ex.Message);
        //    ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        //    cvPricing.IsValid = false;
        //    cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
        //}

    }

    #region Offer Tab

    #region Cash In Flows Grid
    //protected void CashInflow_AddRow_OnClick(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DtCashFlow = (DataTable)ViewState["DtCashFlow"];
    //        //Code Modified by nataraj
    //        TextBox txtDate_GridInflow1 = gvInflow.FooterRow.FindControl("txtDate_GridInflow") as TextBox;
    //        DropDownList ddlInflowDesc1 = gvInflow.FooterRow.FindControl("ddlInflowDesc") as DropDownList;
    //        //DropDownList ddlEntityName_InFlow1 = gvInflow.FooterRow.FindControl("ddlEntityName_InFlow") as DropDownList;
    //        UserControls_S3GAutoSuggest ddlEntityName_InFlow1 = gvInflow.FooterRow.FindControl("ddlEntityName_InFlow") as UserControls_S3GAutoSuggest;
    //        DropDownList ddlEntityName_InFlowFrom = gvInflow.FooterRow.FindControl("ddlEntityName_InFlowFrom") as DropDownList;
    //        TextBox txtAmount_Inflow1 = gvInflow.FooterRow.FindControl("txtAmount_Inflow") as TextBox;


    //        DataRow dr = DtCashFlow.NewRow();
    //        DtCashFlow.PrimaryKey = new DataColumn[] { DtCashFlow.Columns["Date"], DtCashFlow.Columns["CashInFlowID"], DtCashFlow.Columns["InflowFromId"], DtCashFlow.Columns["EntityID"] };
    //        dr["Date"] = Utility.StringToDate(txtDate_GridInflow1.Text);
    //        //if (txtEnquiryDate.Text != "")
    //        //{
    //        //    if (Utility.CompareDates(txtEnquiryDate.Text, txtDate_GridInflow1.Text) == -1)
    //        //    {
    //        //        Utility.FunShowAlertMsg(this, "Inflow date cannot be less than enquiry date");
    //        //        return;
    //        //    }
    //        //}
    //        //else
    //        //{
    //        //    if (txtSanctionDate.Text != "")
    //        //    {
    //        //        if (Utility.CompareDates(txtSanctionDate.Text, txtDate_GridInflow1.Text) == -1)
    //        //        {
    //        //            Utility.FunShowAlertMsg(this, "Inflow date cannot be less than Sanction date");
    //        //            return;
    //        //        }
    //        //    }
    //        //}
    //        string[] strArrayIds = ddlInflowDesc1.SelectedValue.Split(',');

    //        if (DtCashFlow.Rows.Count > 0)
    //        {
    //            DataRow[] drDupCashFlow = DtCashFlow.Select(" Date ='"
    //                + Utility.StringToDate(txtDate_GridInflow1.Text)
    //                + "' and CashFlow_Flag_ID = " + strArrayIds[4]
    //                + " and InflowFromId = " + ddlEntityName_InFlowFrom.SelectedValue
    //                + " and EntityID = " + ddlEntityName_InFlow1.SelectedValue);

    //            if (drDupCashFlow.Count() > 0)
    //            {
    //                Utility.FunShowAlertMsg(this, "Cannot add duplicate Cash inflow");
    //                return;
    //            }
    //        }

    //        dr["CashInFlowID"] = strArrayIds[0];
    //        dr["Accounting_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[1]));
    //        dr["Business_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[2]));
    //        dr["Company_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[3]));
    //        dr["CashFlow_Flag_ID"] = strArrayIds[4];
    //        dr["CashInFlow"] = ddlInflowDesc1.SelectedItem;
    //        dr["EntityID"] = ddlEntityName_InFlow1.SelectedValue;
    //        dr["Entity"] = ddlEntityName_InFlow1.SelectedText;
    //        dr["InflowFromId"] = ddlEntityName_InFlowFrom.SelectedValue;
    //        dr["InflowFrom"] = ddlEntityName_InFlowFrom.SelectedItem;
    //        dr["Amount"] = txtAmount_Inflow1.Text;

    //        DtCashFlow.Rows.Add(dr);

    //        gvInflow.DataSource = DtCashFlow;
    //        gvInflow.DataBind();

    //        ViewState["DtCashFlow"] = DtCashFlow;
    //        FunPriFillCashInflow_ViewState();
    //        FunPriIRRReset();
    //        FunPriSetMaxLength_gvInflow();
    //    }
    //    catch (Exception ex)
    //    {
    //        if (ex.Message.Contains("Column 'CashInFlowID, Date' is constrained to be unique."))
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Cash Outflow", "alert('Cash flow cannot be repeted for the same date');", true);
    //        }
    //        else
    //        {
    //            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in adding Inflow details";
    //            cvPricing.IsValid = false;
    //        }
    //    }
    //}

    //protected void gvInflow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    try
    //    {
    //        DtCashFlow = (DataTable)ViewState["DtCashFlow"];
    //        if (DtCashFlow.Rows.Count > 0)
    //        {
    //            //txtAccIRR.Text = txtAccountIRR_Repay.Text = txtBusinessIRR.Text = txtBusinessIRR_Repay.Text =
    //            //txtCompanyIRR.Text = txtCompanyIRR_Repay.Text = "";
    //            grvRepayStructure.ClearGrid();
    //            DtCashFlow.Rows.RemoveAt(e.RowIndex);
    //            ViewState["DtCashFlow"] = DtCashFlow;
    //            if (DtCashFlow.Rows.Count == 0)
    //            {
    //                FunPriFill_CashInFlow(_Add);
    //            }
    //            else
    //            {
    //                gvInflow.DataSource = DtCashFlow;
    //                gvInflow.DataBind();
    //                FunPriFillCashInflow_ViewState();
    //            }
    //        }
    //        FunPriSetMaxLength_gvInflow();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting Inflow details";
    //        cvPricing.IsValid = false;
    //    }
    //}

    //protected void gvInflow_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.Footer)
    //    {
    //        TextBox txtDate_GridInflow1 = e.Row.FindControl("txtDate_GridInflow") as TextBox;
    //        txtDate_GridInflow1.Attributes.Add("readonly", "readonly");
    //        AjaxControlToolkit.CalendarExtender CalendarExtenderSD_InflowDate1 = e.Row.FindControl("CalendarExtenderSD_InflowDate") as AjaxControlToolkit.CalendarExtender;
    //        CalendarExtenderSD_InflowDate1.Format = ObjS3GSession.ProDateFormatRW;
    //    }
    //}

    //protected void ddlEntityName_InFlowFrom_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        //DropDownList ddlEntityName_InFlow = gvInflow.FooterRow.FindControl("ddlEntityName_InFlow") as DropDownList;
    //        UserControls_S3GAutoSuggest ddlEntityName_InFlow = gvInflow.FooterRow.FindControl("ddlEntityName_InFlow") as UserControls_S3GAutoSuggest;
    //        DropDownList ddlEntityName_InFlowFrom = gvInflow.FooterRow.FindControl("ddlEntityName_InFlowFrom") as DropDownList;


    //        Label lblHeading = gvInflow.HeaderRow.FindControl("lblHeading") as Label;
    //        Procparam = new Dictionary<string, string>();
    //        if (ddlEntityName_InFlowFrom.SelectedItem.Text.ToUpper() == "CUSTOMER")
    //        {

    //            if (cmbCustomerCode.Text != string.Empty) //SelectedIndex > 0)
    //            {
    //                //ddlEntityName_InFlow.Items.Clear();
    //                //System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(cmbCustomerCode.Text, hdnCustID.Value);
    //                //ddlEntityName_InFlow.Items.Add(lstItem);
    //                ddlEntityName_InFlow.Clear();
    //                ddlEntityName_InFlow.SelectedValue = hdnCustID.Value;
    //                ddlEntityName_InFlow.SelectedText = cmbCustomerCode.Text;
    //                ddlEntityName_InFlow.ReadOnly = true;

    //            }
    //            //else
    //            //{
    //            //    ddlEntityName_InFlowFrom.SelectedIndex = 1;
    //            //}

    //        }
    //        else
    //        {
    //            lblHeading.Text = "Entity Name";

    //            ddlEntityName_InFlow.ReadOnly = false;
    //            ddlEntityName_InFlow.Clear();

    //            //Procparam.Add("@Option", "11");
    //            //Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //            //ddlEntityName_InFlow.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, true, new string[] { "Entity_ID", "Entity_Code", "Entity_Name" });

    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Enity/Customer Code";
    //        cvPricing.IsValid = false;
    //    }
    //}

    #endregion

    #region Cash Out Flow Grid
    //protected void gvOutFlow_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    try
    //    {
    //        DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
    //        if (DtCashFlowOut.Rows.Count > 0)
    //        {
    //            DtCashFlowOut.Rows.RemoveAt(e.RowIndex);
    //            ViewState["DtCashFlowOut"] = DtCashFlowOut;
    //            if (DtCashFlowOut.Rows.Count == 0)
    //            {
    //                FunPriFill_CashOutFlow(_Add);
    //                //lblTotalOutFlowAmount.Text = "0";
    //                FunPriIRRReset();
    //            }
    //            else
    //            {

    //                FunProBindCashFlow();
    //            }
    //        }
    //        FunPriSetMaxLength_gvOutFlow();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting Outflow details";
    //        cvPricing.IsValid = false;
    //    }
    //}

    //protected void CashOutflow_AddRow_OnClick(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DataTable dtAcctype = ((DataTable)ViewState["PaymentRules"]);
    //        if (dtAcctype != null && dtAcctype.Rows.Count > 0)
    //        {
    //            DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];

    //            TextBox txtDate_GridOutflow = gvOutFlow.FooterRow.FindControl("txtDate_GridOutflow") as TextBox;
    //            DropDownList ddlOutflowDesc = gvOutFlow.FooterRow.FindControl("ddlOutflowDesc") as DropDownList;
    //            DropDownList ddlPaymentto_OutFlow = gvOutFlow.FooterRow.FindControl("ddlPaymentto_OutFlow") as DropDownList;
    //            //DropDownList ddlEntityName_OutFlow = gvOutFlow.FooterRow.FindControl("ddlEntityName_OutFlow") as DropDownList;
    //            UserControls_S3GAutoSuggest ddlEntityName_OutFlow = gvOutFlow.FooterRow.FindControl("ddlEntityName_OutFlow") as UserControls_S3GAutoSuggest;
    //            TextBox txtAmount_Outflow = gvOutFlow.FooterRow.FindControl("txtAmount_Outflow") as TextBox;

    //            DataRow dr = DtCashFlowOut.NewRow();

    //            dtAcctype.DefaultView.RowFilter = " FieldName = 'AccountType'";

    //            //if (dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString() == "Normal Payment")
    //            //{
    //            //    DtCashFlowOut.PrimaryKey = new DataColumn[] { DtCashFlowOut.Columns["CashOutFlowID"], DtCashFlowOut.Columns["Date"], DtCashFlowOut.Columns["EntityID"] };
    //            //}
    //            DtCashFlowOut.PrimaryKey = new DataColumn[] { DtCashFlowOut.Columns["Date"], DtCashFlowOut.Columns["CashOutFlowID"], DtCashFlowOut.Columns["OutflowFromId"], DtCashFlowOut.Columns["EntityID"] };

    //            dr["Date"] = Utility.StringToDate(txtDate_GridOutflow.Text);
    //            string[] strArrayIds = ddlOutflowDesc.SelectedValue.Split(',');
    //            //if (Utility.CompareDates(txtEnquiryDate.Text, txtDate_GridOutflow.Text) == -1)
    //            //{
    //            //    Utility.FunShowAlertMsg(this, "Outflow date cannot be less than enquiry date");
    //            //    return;
    //            //}

    //            if (strArrayIds[4] == "41")
    //            {
    //                if (dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString().ToUpper() == "DEFERRED PAYMENT")
    //                {
    //                    //if (Utility.CompareDates(txtOfferDate.Text, txtDate_GridOutflow.Text) != 0 && Utility.CompareDates(txtOfferDate.Text, txtDate_GridOutflow.Text) != 1)
    //                    //{
    //                    //    Utility.FunShowAlertMsg(this, "Outflow date should be greater than or Equal to Offer date for Deferred Payment");
    //                    //    return;
    //                    //}

    //                    if (((DataTable)ViewState["DtCashFlowOut"]).Rows.Count > 0)
    //                    {
    //                        if (!string.IsNullOrEmpty(Convert.ToString(((DataTable)ViewState["DtCashFlowOut"]).
    //                            Compute("Count(CashFlow_Flag_ID)", "CashFlow_Flag_ID = 41 and " +
    //                            " Date <> #" + Utility.StringToDate(txtDate_GridOutflow.Text.Trim()) + "#"))))
    //                        {
    //                            Int32 IntTotalOutflow = (Int32)((DataTable)ViewState["DtCashFlowOut"]).
    //                                Compute("Count(CashFlow_Flag_ID)", "CashFlow_Flag_ID = 41 and " +
    //                                " Date <> #" + Utility.StringToDate(txtDate_GridOutflow.Text.Trim()) + "#");
    //                            if (IntTotalOutflow >= 1)
    //                            {
    //                                Utility.FunShowAlertMsg(this, "Finance amount Outflow date should " +
    //                                    "be the same for all entities (" +
    //                                    DateTime.Parse(((DataTable)ViewState["DtCashFlowOut"]).Rows[0]["Date"].ToString(),
    //                                    CultureInfo.CurrentCulture).ToString(strDateFormat) + ")");
    //                                return;
    //                            }
    //                        }
    //                    }

    //                }
    //                if (dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString() == "Trade Advance" || dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString() == "Normal Payment")
    //                {
    //                    //if (Utility.StringToDate(txtOfferDate.Text) != Utility.StringToDate(txtDate_GridOutflow.Text))
    //                    //{
    //                    //    Utility.FunShowAlertMsg(this, "Outflow date should be equal to Offer date for Normal Payment/Trade Advance");
    //                    //    return;
    //                    //}
    //                }
    //            }

    //            if (DtCashFlowOut.Rows.Count > 0)
    //            {
    //                DataRow[] drDupCashFlow = DtCashFlowOut.Select(" Date ='"
    //                    + Utility.StringToDate(txtDate_GridOutflow.Text)
    //                    + "' and CashFlow_Flag_ID = " + strArrayIds[4]
    //                    + " and OutflowFromId = " + ddlPaymentto_OutFlow.SelectedValue
    //                    + " and EntityID = " + ddlEntityName_OutFlow.SelectedValue);

    //                if (drDupCashFlow.Count() > 0)
    //                {
    //                    Utility.FunShowAlertMsg(this, "Cannot add duplicate Cash outflow");
    //                    return;
    //                }
    //            }

    //            dr["CashOutFlowID"] = strArrayIds[0];
    //            dr["Accounting_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[1]));
    //            dr["Business_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[2]));
    //            dr["Company_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[3]));
    //            dr["CashFlow_Flag_ID"] = strArrayIds[4];
    //            dr["CashOutFlow"] = ddlOutflowDesc.SelectedItem;
    //            dr["OutflowFrom"] = ddlPaymentto_OutFlow.SelectedItem;
    //            dr["OutflowFromId"] = ddlPaymentto_OutFlow.SelectedValue;
    //            dr["EntityID"] = ddlEntityName_OutFlow.SelectedValue;
    //            dr["Entity"] = ddlEntityName_OutFlow.SelectedText;
    //            dr["Amount"] = txtAmount_Outflow.Text;
    //            DtCashFlowOut.Rows.Add(dr);
    //            ViewState["DtCashFlowOut"] = DtCashFlowOut;
    //            //gvOutFlow.DataSource = DtCashFlowOut;
    //            //gvOutFlow.DataBind();
    //            //FunPriFillCashOutflow_ViewState();
    //            try
    //            {

    //                FunProBindCashFlow();
    //            }
    //            catch
    //            {
    //                Utility.FunShowAlertMsg(this, "Total finance amount in cashoutflow should be equal to amount financed with margin money");
    //                //cvPricing.ErrorMessage = strErrorMessagePrefix + "Total finance amount in cashoutflow should be equal to amount financed with margin money";
    //                //cvPricing.IsValid = false;
    //            }
    //        }
    //        else
    //        {
    //            Utility.FunShowAlertMsg(this, "Select a Payment Rule");
    //            //cvPricing.ErrorMessage = strErrorMessagePrefix + "Select a Payment Rule";
    //            //cvPricing.IsValid = false;
    //        }

    //        //if (ddlLob.SelectedItem.Text.ToUpper().Contains("WC") ||
    //        //    ddlLob.SelectedItem.Text.ToUpper().Contains("FT") ||
    //        //    ((ddlLob.SelectedItem.Text.ToUpper().StartsWith("TE") ||
    //        //    ddlLob.SelectedItem.Text.ToUpper().StartsWith("TL")) &&
    //        //    ddl_Repayment_Mode.SelectedItem.Text.ToUpper().StartsWith("PRO")))
    //        //{
    //        //    btnGenerateRepay_Click(sender, e);
    //        //    tcPricing.Tabs[3].Enabled = false;
    //        //}
    //        //else
    //        //    tcPricing.Tabs[3].Enabled = true;

    //        FunPriSetMaxLength_gvOutFlow();

    //    }
    //    catch (Exception ex)
    //    {


    //        if (ex.Message.Contains("Column 'CashOutFlowID, Date, EntityID' is constrained to be unique."))
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Cash Outflow", "alert('Cash flow cannot be repeted for the same date');", true);
    //        }
    //        else
    //        {
    //            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in adding Outflow details";
    //            cvPricing.IsValid = false;
    //        }
    //    }

    //}

    //hide the IRR panel visibility for WC,FT,TLE(Product) method as per Malolan raised on 23-feb-2012 start by saran

    //private void FunPriDisableIRRPanel()
    //{
    //    if (ddl_Repayment_Mode.SelectedIndex > 0)
    //    {
    //        if (Convert.ToInt32(ddl_Repayment_Mode.SelectedValue) > 0)
    //            if (Convert.ToInt32(ddl_Repayment_Mode.SelectedValue) >= 4)
    //            {
    //                FunPriDisableIRRPanel(false);
    //            }
    //            else
    //            {
    //                FunPriDisableIRRPanel(true);
    //            }
    //    }
    //    else
    //    {
    //        FunPriDisableIRRPanel(true);
    //    }
    //}

    private void FunPriDisableIRRPanel(bool bolStatus)
    {
        //lblAccIRR.Visible = bolStatus;
        //txtAccIRR.Visible = bolStatus;
        //lblBussinessIRR.Visible = bolStatus;
        //txtBusinessIRR.Visible = bolStatus;
        //lblCompanyIrr.Visible = bolStatus;
        //txtCompanyIRR.Visible = bolStatus;
    }

    //hide the IRR panel visibility for WC,FT,TLE(Product) method as per Malolan raised on 23-feb-2012 end by saran

    //protected void ddlPaymentto_OutFlow_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        //DropDownList ddlEntityName_InFlow = gvOutFlow.FooterRow.FindControl("ddlEntityName_OutFlow") as DropDownList;
    //        UserControls_S3GAutoSuggest ddlEntityName_InFlow = gvOutFlow.FooterRow.FindControl("ddlEntityName_OutFlow") as UserControls_S3GAutoSuggest;
    //        DropDownList ddlPaymentto_OutFlow = gvOutFlow.FooterRow.FindControl("ddlPaymentto_OutFlow") as DropDownList;
    //        Label lblHeading = gvOutFlow.HeaderRow.FindControl("lblHeading") as Label;
    //        Procparam = new Dictionary<string, string>();
    //        DropDownList ddlOutflowDesc = gvOutFlow.FooterRow.FindControl("ddlOutflowDesc") as DropDownList;

    //        string[] strArrayIds = ddlOutflowDesc.SelectedValue.Split(',');

    //        if (ddlPaymentto_OutFlow.SelectedItem.Text.ToUpper() == "CUSTOMER")
    //        {
    //            if (cmbCustomerCode.Text != string.Empty) //SelectedIndex > 0)
    //            {
    //                //ddlEntityName_InFlow.Items.Clear();
    //                //System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(cmbCustomerCode.Text, hdnCustID.Value);
    //                //ddlEntityName_InFlow.Items.Add(lstItem);
    //                ddlEntityName_InFlow.Clear();
    //                ddlEntityName_InFlow.SelectedValue = hdnCustID.Value;
    //                ddlEntityName_InFlow.SelectedText = cmbCustomerCode.Text;
    //                ddlEntityName_InFlow.ReadOnly = true;
    //            }


    //        }
    //        else
    //        {
    //            ddlEntityName_InFlow.ReadOnly = false;
    //            ddlEntityName_InFlow.Clear();

    //            lblHeading.Text = "Entity Name";
    //            //Procparam.Add("@Option", "11");
    //            //Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //            //if (strArrayIds.Length >= 4)
    //            //{
    //            //    if (strArrayIds[4].ToString() == "41")
    //            //    {
    //            //        Procparam.Add("@ID", "1");
    //            //    }
    //            //}
    //            //ddlEntityName_InFlow.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, true, new string[] { "Entity_ID", "Entity_Code", "Entity_Name" });

    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load Enity/Customer Code";
    //        cvPricing.IsValid = false;
    //    }
    //}

    [System.Web.Services.WebMethod]
    public static string[] GetVendors(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@Company_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@Entity_Type", "DLR");
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "42");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_Agt", Procparam));
        return suggetions.ToArray();

    }
    [System.Web.Services.WebMethod]
    public static string[] GetVendorsDoc(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@COMPANY_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@USERID", obj_PageValue.intUserId.ToString());
        Procparam.Add("@ENTITY_TYPE", "DLR");
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "42");
        if (System.Web.HttpContext.Current.Session["MODE"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["MODE"]) != string.Empty)
        {
            Procparam.Add("@MODE", Convert.ToString(System.Web.HttpContext.Current.Session["MODE"]));
        }
        else
            Procparam.Add("@MODE", "C");
        Procparam.Add("@PRICING_ID", obj_PageValue.intPricingId.ToString());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_AGT_DOC", Procparam));
        return suggetions.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetDealer(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@Company_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@Entity_Type", "DLR");
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "42");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_Agt", Procparam));
        return suggetions.ToArray();

    }
    [System.Web.Services.WebMethod]
    public static string[] GetVendorsSalesPerson(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@Company_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@Entity_Type", "DSP");//Dealer Sales Persion
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "42");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_Agt", Procparam));
        return suggetions.ToArray();

    }
    [System.Web.Services.WebMethod]
    public static string[] GetVendorsInsurar(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Add("@Company_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@Entity_Type", "11");//Insurance
        Procparam.Add("@PrefixText", prefixText);
        Procparam.Add("@Program_Id", "42");
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_Agt", Procparam));

        return suggetions.ToArray();

    }
    protected void gvOutFlow_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox txtDate_GridOutflow = e.Row.FindControl("txtDate_GridOutflow") as TextBox;
            txtDate_GridOutflow.Attributes.Add("readonly", "readonly");
            AjaxControlToolkit.CalendarExtender CalendarExtenderSD_OutflowDate = e.Row.FindControl("CalendarExtenderSD_OutflowDate") as AjaxControlToolkit.CalendarExtender;
            CalendarExtenderSD_OutflowDate.Format = ObjS3GSession.ProDateFormatRW;
        }

    }

    #endregion

    protected void ddlROIRuleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlROIRuleList.SelectedIndex > 0)
        //{
        //    if (hdnROIRule.Value != "")
        //    {
        //        strAlert = "All cashflow releated data will be reset";
        //        strAlert += @"\n\nWould you like to proceed?";
        //        strAlert = "if(confirm('" + strAlert + "')){ document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_btnFetchROI').click();}else{document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_ddlROIRuleList').value=document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_hdnROIRule').value;}";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "ROI Rule Card", strAlert, true);
        //    }
        //    else
        //    {
        //        strAlert = "document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_btnFetchROI').click()";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "New ROI Rule Card", strAlert, true);
        //    }
        //}

        //else
        //{
        //    div7.Visible = false;
        //}
    }

    //protected void btnFetchROI_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (ddlROIRuleList.SelectedIndex > 0)
    //        {
    //            FunPriLoad_ROIRule(_Add);
    //            div7.Visible = true;
    //            hdnROIRule.Value = ddlROIRuleList.SelectedValue;
    //            if (hdnROIRule.Value != "" || div7.Visible == false)
    //            {
    //                FunPriFill_Repayment_Tab(_Add);
    //                grvRepayStructure.ClearGrid();
    //                FunPriFill_CashOutFlow(_Add);
    //                FunPriFill_CashInFlow(_Add);
    //                ddlROIRuleList.ToolTip = ddlROIRuleList.SelectedItem.Text;
    //                FunPriIRRReset();
    //                FunPriSetRateMaxLength();
    //                //Making null to handle new ROI Rule Card and make Flate rate For IRR given as null
    //                ViewState["decRate"] = null;
    //                gvRepaymentSummary.ClearGrid();
    //            }
    //        }
    //        else
    //        {
    //            if (intPricingId == 0)
    //            {
    //                txt_ROI_Rule_Number.Text = "";
    //                FunPriFill_OfferTab(_Add);
    //                //FunPriFillROIDLL(strAddMode);
    //                txt_Model_Description.Text = "";
    //                txtRate.Text = "";
    //                txtRate.Enabled = false;
    //                txt_Recovery_Pattern_Year1.Text = "";
    //                txt_Recovery_Pattern_Year2.Text = "";
    //                txt_Recovery_Pattern_Year3.Text = "";
    //                txt_Recovery_Pattern_Rest.Text = "";
    //                hdnROIRule.Value = "";
    //            }
    //        }
    //        ddlROIRuleList.Focus();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load ROI Rule Details";
    //        cvPricing.IsValid = false;
    //        div7.Visible = false;
    //    }
    //}


    protected void ddlPaymentRuleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlPaymentRuleList.SelectedIndex > 0)
        //{
        //    if (hdnPayment.Value != "")
        //    {
        //        strAlert = "alert('__ALERT__');";
        //        strAlert = " All cashflow releated data will be reset";
        //        strAlert += @"\n\nWould you like to proceed?";
        //        strAlert = "if(confirm('" + strAlert + "')){ document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_btnFetchPayment').click();}else{document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_ddlPaymentRuleList').value=document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_hdnPayment').value;}";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "Payment Rule Card", strAlert, true);
        //    }
        //    else
        //    {
        //        strAlert = "document.getElementById('ctl00_ContentPlaceHolder1_tcPricing_TabOfferTerms_btnFetchPayment').click()";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "New Payment Rule Card", strAlert, true);
        //    }

        //}
        //else
        //{
        //    div8.Visible = false;
        //}

    }

    //protected void btnFetchPayment_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (ddlPaymentRuleList.SelectedIndex > 0)
    //        {
    //            FunPriLoad_PaymentRule();
    //            div8.Visible = true;
    //            hdnPayment.Value = ddlPaymentRuleList.SelectedValue;
    //            if (hdnPayment.Value != "")
    //            {
    //                FunPriFill_Repayment_Tab(_Add);
    //                ddlPaymentRuleList.ToolTip = ddlPaymentRuleList.SelectedItem.Text;
    //                FunPriFill_CashOutFlow(_Add);
    //                lblTotalOutFlowAmount.Text = "0";
    //                FunPriIRRReset();
    //                gvRepaymentSummary.ClearGrid();
    //            }
    //        }
    //        ddlPaymentRuleList.Focus();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to load payment rule card details";
    //        cvPricing.IsValid = false;
    //        div8.Visible = true;
    //    }
    //}

    //protected void txt_Margin_Percentage_TextChanged(object sender, EventArgs e)
    //{
    //    txtMarginMoneyPer_Cashflow.Text = txt_Margin_Percentage.Text;
    //    txtMarginMoneyPer_Cashflow.ReadOnly = true;
    //    txtMarginMoneyAmount_Cashflow.ReadOnly = true;
    //    txtMarginMoneyAmount_Cashflow.Text = FunPriGetMarginAmout().ToString();
    //    txt_Margin_Percentage.Focus();
    //}

    //protected void txtResidualValue_Cashflow_TextChanged(object sender, EventArgs e)
    //{
    //    if (txtResidualValue_Cashflow.Text != "")
    //    {
    //        //rfvResidualValue.Enabled = false;
    //        txtResidualAmt_Cashflow.ReadOnly = true;

    //        //if (txtFacilityAmt.Text != "")
    //        //{
    //        //    txtResidualAmt_Cashflow.Text =
    //        //        ((Convert.ToDecimal(txtResidualValue_Cashflow.Text) *
    //        //        Convert.ToDecimal(txtFacilityAmt.Text)) / 100).ToString();//5366
    //        //}

    //    }
    //    else
    //    {
    //        //rfvResidualValue.Enabled = true;
    //        txtResidualAmt_Cashflow.ReadOnly = false;
    //    }
    //    txtResidualValue_Cashflow.Focus();
    //}
    //protected void txtResidualAmt_Cashflow_TextChanged(object sender, EventArgs e)
    //{
    //    if (txtResidualAmt_Cashflow.Text.Trim() != "")
    //    {
    //        //if (Convert.ToDecimal(txtResidualAmt_Cashflow.Text.Trim()) >
    //        //    Convert.ToDecimal(txtFacilityAmt.Text.Trim())
    //        //    && (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL")))
    //        //{
    //        //    Utility.FunShowAlertMsg(this, "Residual amount should be less than or equal to facility amount");
    //        //    txtResidualAmt_Cashflow.Text = "";
    //        //    txtResidualValue_Cashflow.Text = "";
    //        //    txtResidualAmt_Cashflow.Focus();
    //        //}
    //        //else
    //        //{
    //        //    rfvResidualValue.Enabled = false;
    //        //    txtResidualValue_Cashflow.ReadOnly = true;
    //        //    txtResidualValue_Cashflow.Text = "";
    //        //}
    //    }
    //    else
    //    {
    //        txtResidualAmt_Cashflow.Text = "";
    //        rfvResidualValue.Enabled = true;
    //        txtResidualValue_Cashflow.ReadOnly = false;
    //    }
    //    txtResidualAmt_Cashflow.Focus();
    //}
    #endregion

    #region Asset Tab

    private string Funsetsuffix()
    {

        int suffix = 1;

        // S3GSession ObjS3GSession = new S3GSession();
        suffix = ObjS3GSession.ProGpsSuffixRW;
        // suffix = 0;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }


    private void FunAssetPanelVisible(bool BoolStatus)
    {
        ContentPlaceHolder CPH = (ContentPlaceHolder)Page.Master.FindControl("ContentPlaceHolder1");
        AjaxControlToolkit.TabContainer tcPrice = (AjaxControlToolkit.TabContainer)CPH.FindControl("tcPricing");
        AjaxControlToolkit.TabPanel tpAsset = (AjaxControlToolkit.TabPanel)tcPrice.FindControl("TabAssetDetails");

        ((Panel)tpAsset.FindControl("pnlAssetDtl")).Visible = BoolStatus;
        ((Label)tpAsset.FindControl("lblAssetAmt")).Visible = BoolStatus;
        ((Label)tpAsset.FindControl("lblTotalAssetAmount")).Visible = BoolStatus;
    }
    protected void ddlAssetCodeList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //lblStatus.Visible = false;
            //txtStatus.Visible = false;
            //txtBookDepreciationPerc.Text = "";
            //txtBlockDepreciationPerc.Text = "";
            txtUnitValue.Text = "";
            txtTotalAssetValue.Text = "";
            txtMarginPercentage.Text = "";
            txtMarginAmountAsset.Text = "";
            txtMargintoDealer.Text = "";
            txtMargintoMFC.Text = "";
            txtTradeIn.Text = "";
            txtDownPaymentReceipt.Text = "";
            ddlAssetType.ClearSelection();
            FunPriFillDepreciationRate();
            //ddlAssetCodeList1.ToolTip = ddlAssetCodeList1.SelectedText;
            ddlAssetCodeList1.Focus();

            ddlPayTo_SelectedIndexChanged(null, null);
            txtCustomerName.Text = string.Empty;
            txtLpoAssetAmount.Text = string.Empty;

            if (btnAddNew.Text == "Add")
            {

                txtUnitCount.Text = string.Empty;
                txtUnitCount.Enabled = true;
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            //cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in loading Depreciation rate";
            //cvPricing.IsValid = false;
        }
    }
    //protected void ddlAssetCodeList_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        lblStatus.Visible = false;
    //        txtStatus.Visible = false;
    //        txtBookDepreciationPerc.Text = "";
    //        txtBlockDepreciationPerc.Text = "";
    //        txtUnitValue.Text = "";
    //        txtTotalAssetValue.Text = "";
    //        txtMarginPercentage.Text = "";
    //        txtMarginAmountAsset.Text = "";
    //        if (ddlAssetCodeList.SelectedIndex > 0)
    //        {
    //            FunPriFillDepreciationRate((DataTable)ViewState["RateDt1"], ddlAssetCodeList);
    //            ddlAssetCodeList.ToolTip = ddlAssetCodeList.SelectedItem.Text;
    //            /* for OL change*/
    //            if (rdnlAssetType.SelectedValue == "1")
    //            {
    //                Dictionary<string, string> dictParam = new Dictionary<string, string>();
    //                dictParam.Add("@OPTION", "5");
    //                dictParam.Add("@COMPANYID", intCompany_Id.ToString());
    //                dictParam.Add("@AssetID", ddlAssetCodeList.SelectedValue);
    //                DataTable DtRate = Utility.GetDataset("S3G_ORG_GETAPPLICATIONASSET", dictParam).Tables[0];
    //                ViewState["RateDt2"] = DtRate;
    //                ddlLeaseAssetNo.DataSource = DtRate;
    //                ddlLeaseAssetNo.DataTextField = "LEASE_ASSET_NO";
    //                ddlLeaseAssetNo.DataValueField = "LEASE_ASSET_NO";
    //                ddlLeaseAssetNo.DataBind();
    //                ddlLeaseAssetNo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
    //            }
    //            /* for OL change*/
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in loading Depreciation rate";
    //        cvPricing.IsValid = false;
    //    }
    //}

    protected void ddlLeaseAssetNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //if (ddlLeaseAssetNo.SelectedIndex > 0)
            //{
            //    //Added by Saranya I
            //    lblStatus.Visible = true;
            //    txtStatus.Visible = true;
            //    gvAssetDetails.Columns[12].Visible = true;
            //    //End
            //    //FunPriFillDepreciationRate((DataTable)ViewState["RateDt2"], ddlLeaseAssetNo);

            //    DataTable RateDt = new DataTable();
            //    if (ViewState["RateDt2"] != null)
            //    {
            //        RateDt = (DataTable)ViewState["RateDt2"];
            //    }
            //    txtBookDepreciationPerc.Text = "";
            //    txtBlockDepreciationPerc.Text = "";
            //    txtUnitValue.Text = "";
            //    txtMarginPercentage.Text = "";
            //    DataRow[] DrRate = (RateDt.Select("LEASE_ASSET_NO = '" + ddlLeaseAssetNo.SelectedValue + "'"));

            //    if (DrRate.Length > 0)
            //    {
            //        txtBookDepreciationPerc.Text = DrRate[0]["Book_Depreciation_Rate"].ToString();
            //        txtBlockDepreciationPerc.Text = DrRate[0]["Block_Depreciation_Rate"].ToString();
            //        txtUnitValue.Text = DrRate[0]["Assetvalue"].ToString();
            //        txtTotalAssetValue.Text = DrRate[0]["Assetvalue"].ToString();
            //        //Added by Saranya I on 23-Feb-2012 to get Asset Status
            //        FunPriBindStatus();
            //        //End 
            //    }
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in loading Depreciation rate";
            cvPricing.IsValid = false;
        }
    }
    private void FunPriBindStatus()
    {
        try
        {

            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Lease_Asset_No", ddlLeaseAssetNo.SelectedItem.Text);
            //DataTable dtStatus = new DataTable();
            //dtStatus = Utility.GetDefaultData("S3G_ORG_GetAssetStatus", Procparam);
            //if (dtStatus != null)
            //{
            //    if (dtStatus.Rows.Count > 0)
            //    {
            //        txtStatus.Text = dtStatus.Rows[0]["status_Desc"].ToString();
            //        ViewState["Status_Code"] = dtStatus.Rows[0]["Status_Code"].ToString();
            //        ViewState["Status"] = dtStatus.Rows[0]["Status"].ToString();

            //    }
            //    else
            //    {
            //        lblStatus.Visible = false;
            //        txtStatus.Visible = false;
            //        ViewState["Status_Code"] = null;
            //        ViewState["Status"] = null;
            //        gvAssetDetails.Columns[12].Visible = false;
            //    }
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error filling Status");
        }
    }
    protected void gvAssetDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //DataTable dtDelete = (DataTable)ViewState["ObjDTAssetDetails"];
            //dtDelete.Rows.RemoveAt(e.RowIndex);


            //DataRow[] drAsset = ObjDTAssetDetail.Select("SL_NO = " + e.RowIndex);
            //drAsset[0].Delete();
            //dtDelete.Rows.RemoveAt(e.RowIndex);
            //dtDelete.AcceptChanges();
            //DataRow[] drSerialAsset = dtDelete.Select("SL_NO > " + e.RowIndex);
            //foreach (DataRow dr in drSerialAsset)
            //{
            //dr["SL_NO"] = Convert.ToInt32(dr["SL_NO"]) - 1;
            //dr.AcceptChanges();
            //}

            //ViewState["ObjDTAssetDetails"] = dtDelete;

            //FunProBindAssetGrid();
            //if (dtDelete.Rows.Count == 0)
            //{
            //    //FunPriLoad_AssetDetails(_Add);
            //    lblTotalAssetAmount.Text = "0";
            //    //rdnlAssetType.Enabled = true;
            //    FunAssetPanelVisible(false);
            //    FunPriResetAssetDetails();
            //}
            //else
            //{
            //    //rdnlAssetType.Enabled = false;
            //}

            //lblTotalOutFlowAmount.Text = "0";
            //FunPriIRRReset();
            //FunPriShowRepaymetDetails(0);
            //gvRepaymentSummary.ClearGrid();
            //gvRepaymentDetails.ClearGrid();

            //Utility.FunShowAlertMsg(this, "Asset Deleted Successfully");
            Label lblRecordSno = gvAssetDetails.Rows[e.RowIndex].FindControl("lblRecordSno") as Label;
            ViewState["EditSno"] = lblRecordSno.Text;
            funPriInsertTempAssetTable("3");
            btnAddNew.Text = "Add";
            Utility.FunShowValidationMsg(this, "ORG_PRI", 6);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting asset details";
            cvPricing.IsValid = false;
        }
    }

    protected void gvAssetDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblDate = e.Row.FindControl("lblReqFrm") as Label;
                if (!string.IsNullOrEmpty(lblDate.Text) && lblDate.Text != "&nbsp;")
                    lblDate.Text = DateTime.Parse(lblDate.Text, CultureInfo.CurrentCulture).ToString(strDateFormat);

                LinkButton LnkDelete = e.Row.FindControl("LnkDelete") as LinkButton;

                Label lblUnitVal = e.Row.FindControl("lblUnitVal") as Label;
                Label lblAssetVal = e.Row.FindControl("lblAssetVal") as Label;
                Label lblMargintoDealer = e.Row.FindControl("lblMargintoDealer") as Label;
                Label lblMargintoMFC = e.Row.FindControl("lblMargintoMFC") as Label;
                Label lblTradeIn = e.Row.FindControl("lblTradeIn") as Label;
                Label lblLpoAmount = e.Row.FindControl("lblLpoAmount") as Label;
                Label lblMarginAmt = e.Row.FindControl("lblMarginAmt") as Label;

                if (hdnIsDMS.Value == "1")
                {
                    LnkDelete.Enabled = false;
                }
                lblUnitVal.Text = Utility.funPubChangeCurrencyFormat(lblUnitVal.Text);
                lblAssetVal.Text = Utility.funPubChangeCurrencyFormat(lblAssetVal.Text);
                lblMargintoDealer.Text = Utility.funPubChangeCurrencyFormat(lblMargintoDealer.Text);
                lblMargintoMFC.Text = Utility.funPubChangeCurrencyFormat(lblMargintoMFC.Text);
                lblTradeIn.Text = Utility.funPubChangeCurrencyFormat(lblTradeIn.Text);
                lblLpoAmount.Text = Utility.funPubChangeCurrencyFormat(lblLpoAmount.Text);
                lblMarginAmt.Text = Utility.funPubChangeCurrencyFormat(lblMarginAmt.Text);
            }
        }
        catch (Exception ex)
        {

        }
    }


    #endregion

    #region Repayment Tab
    protected void Repayment_AddRow_OnClick(object sender, EventArgs e)
    {
        try
        {
            //FunPriAddRepaymentSchedule();
            //FunPriSetMaxLength();
        }
        catch (Exception ex)
        {
            cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
            cvPricing.IsValid = false;
        }

    }

    //protected void gvRepaymentDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    try
    //    {
    //        DtRepayGrid = (DataTable)ViewState["DtRepayGrid"];

    //        if (ViewState["DtRepayGrid_TL"] != null)
    //        {
    //            DataTable DtRepayGrid_TL = (DataTable)ViewState["DtRepayGrid_TL"];
    //            if (DtRepayGrid_TL.Rows.Count > 0)
    //            {
    //                DtRepayGrid_TL.Rows.RemoveAt(DtRepayGrid_TL.Rows.Count - 1);
    //            }
    //            //ViewState["DtRepayGrid_TL"] = DtRepayGrid_TL;
    //        }

    //        if (DtRepayGrid.Rows.Count > 0)
    //        {

    //            DtRepayGrid.Rows.RemoveAt(e.RowIndex);

    //            if (DtRepayGrid.Rows.Count == 0)
    //            {
    //                FunPriFill_Repayment_Tab(_Add);
    //                gvRepaymentSummary.ClearGrid();
    //            }
    //            else
    //            {
    //                gvRepaymentDetails.DataSource = DtRepayGrid;
    //                gvRepaymentDetails.DataBind();
    //                FunFillNextInstallmentDate();
    //                FunPriFillRepayment_ViewState();
    //                FunPriCalculateSummary(DtRepayGrid, "CashFlow", "TotalPeriodInstall");
    //                if (ddl_Repayment_Mode.SelectedValue != "2")
    //                {
    //                    Label lblCashFlowId = (Label)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lblCashFlow_Flag_ID");
    //                    if (lblCashFlowId.Text != "23")
    //                    {
    //                        ((LinkButton)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lnRemoveRepayment")).Visible = true;
    //                    }
    //                }
    //                else
    //                {
    //                    ((LinkButton)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lnRemoveRepayment")).Visible = true;
    //                }
    //            }
    //        }
    //        grvRepayStructure.ClearGrid();
    //        FunPriIRRReset();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting Repayment details";
    //        cvPricing.IsValid = false;
    //    }
    //}

    //protected void gvRepaymentDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    try
    //    {
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //            _SlNo += 1;
    //            e.Row.Cells[0].Text = _SlNo.ToString();

    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in binding Repayment details";
    //        cvPricing.IsValid = false;
    //    }
    //}

    //protected void gvRepaymentDetails_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.Footer)
    //    {
    //        TextBox txtfromdate_RepayTab = e.Row.FindControl("txtfromdate_RepayTab") as TextBox;
    //        txtfromdate_RepayTab.Attributes.Add("readonly", "readonly");
    //        AjaxControlToolkit.CalendarExtender CalendarExtenderSD_fromdate_RepayTab = e.Row.FindControl("CalendarExtenderSD_fromdate_RepayTab") as AjaxControlToolkit.CalendarExtender;
    //        CalendarExtenderSD_fromdate_RepayTab.Format = ObjS3GSession.ProDateFormatRW;


    //    }
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        AjaxControlToolkit.CalendarExtender calext_FromDate = e.Row.FindControl("calext_FromDate") as AjaxControlToolkit.CalendarExtender;
    //        calext_FromDate.Format = ObjS3GSession.ProDateFormatRW;
    //        TextBox txRepaymentFromDate = e.Row.FindControl("txRepaymentFromDate") as TextBox;
    //        txRepaymentFromDate.Attributes.Add("readonly", "readonly");
    //    }
    //}

    protected void btnGenerateRepay_Click(object sender, EventArgs e)
    {
        try
        {
            strMode = Request.QueryString["qsMode"];


            if (strMode != "Q")
            {
                ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
                //if (objRepaymentStructure.FunPubGetCashFlowDetails(intCompany_Id, Convert.ToInt32(ddlLob.SelectedValue)).Rows.Count == 0)
                //{
                //    Utility.FunShowAlertMsg(this, "Define Installment Flag in Cashflow Master for selected Line of Business");
                //    return;
                //}

                //if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && ddl_Repayment_Mode.SelectedValue != "5" && ddl_Return_Pattern.SelectedValue == "6")
                //{
                //    if (objRepaymentStructure.FunPubGetCashFlowDetails_TL_Princ(intCompany_Id, Convert.ToInt32(ddlLob.SelectedValue)).Rows.Count == 0)
                //    {
                //        Utility.FunShowAlertMsg(this, "Define Principal and Interest Flags in Cashflow Master for selected Line of Business");
                //        return;
                //    }
                //}
                //else
                //{
                //    if (objRepaymentStructure.FunPubGetCashFlowDetails(intCompany_Id, Convert.ToInt32(ddlLob.SelectedValue)).Rows.Count == 0)
                //    {
                //        Utility.FunShowAlertMsg(this, "Define Installment Flag in Cashflow Master for selected Line of Business");
                //        return;
                //    }
                //}

                //if (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL"))
                //{
                //    if (!string.IsNullOrEmpty(Convert.ToString(((DataTable)ViewState["DtCashFlowOut"]).Compute("Sum(Amount)", "CashFlow_Flag_ID = 41"))))
                //    {
                //        decimal decToatlFinanceAmt = (decimal)((DataTable)ViewState["DtCashFlowOut"]).Compute("Sum(Amount)", "CashFlow_Flag_ID = 41");

                //        if (decToatlFinanceAmt <= 0)
                //        {
                //            Utility.FunShowAlertMsg(this, "Add atleast one Finance Amount Cash flow in Outflow details");
                //            return;
                //        }
                //    }
                //    else
                //    {
                //        Utility.FunShowAlertMsg(this, "Add atleast one Finance Amount Cash flow in Outflow details");
                //        return;
                //    }
                //}
                //else
                //{
                //    if (((DataTable)ViewState["ObjDTAssetDetails"]).Rows.Count == 0)
                //    {
                //        Utility.FunShowAlertMsg(this, "Add atleast one asset details");
                //        return;
                //    }
                //}
                //FunPriIRRReset();
                //FunPriGenerateRepayment(Utility.StringToDate(txtOfferDate.Text));
                //FunPriLOBBasedvalidations(ddlLob.SelectedItem.Text);

                /*UMFC has been calculated automatically for other than Product & TermLoan Return Pattern 
             (Also applicable to HP,FL,LN,TE,TL) Updated on 28th Oct 2010*/
                //if (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL") && ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "TERM LOAN")
                //{
                //    FunPriInsertUMFC();
                //}
                //if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper() != "PRODUCT"))
                //{
                //    grvRepayStructure.Columns[5].Visible = false;
                //    //grvRepayStructure.Columns[6].Visible = true;
                //    //grvRepayStructure.Columns[7].Visible = true;
                //}
                //else
                //{
                //    grvRepayStructure.Columns[5].Visible = true;
                //    grvRepayStructure.Columns[6].Visible = false;
                //    grvRepayStructure.Columns[7].Visible = false;
                //}
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            if (!ex.Message.Contains("Object Reference"))
            {
                if ((ex.Message.Contains("IRR")) || ex.Message.Contains("Rate"))
                {
                    Utility.FunShowAlertMsg(this, ex.Message);
                }
                cvPricing.ValidationGroup = "TabRepayment";
                cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
            }
            else
            {
                cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in generating repayment structure";
            }
            cvPricing.IsValid = false;
        }
    }


    //private void FunPriInsertUMFC()
    //{
    //    try
    //    {

    //        Dictionary<string, string> dictParam = new Dictionary<string, string>();
    //        dictParam.Add("@CompanyId", intCompany_Id.ToString());
    //        //dictParam.Add("@LobId", ddlLob.SelectedValue);
    //        DataSet dsUMFC = Utility.GetDataset("s3g_org_loadInflowLov", dictParam);
    //        DtCashFlow = (DataTable)ViewState["DtCashFlow"];
    //        //DataSet dsUMFC = (DataSet)ViewState["InflowDDL"];
    //        DataRow dr = DtCashFlow.NewRow();
    //        DtCashFlow.PrimaryKey = new DataColumn[] { DtCashFlow.Columns["CashInFlowID"], DtCashFlow.Columns["Date"] };
    //        dr["Date"] = DateTime.Today.ToString();
    //        string[] strArrayIds = null;
    //        string cashflowdesc = "";
    //        foreach (DataRow drOut in dsUMFC.Tables[2].Rows)
    //        {
    //            string[] strCashflow = drOut["CashFlow_ID"].ToString().Split(',');
    //            if (strCashflow[4].ToString() == "34")
    //            {
    //                strArrayIds = strCashflow;
    //                cashflowdesc = drOut["CashFlow_Description"].ToString();
    //            }
    //        }
    //        if (strArrayIds == null)
    //        {
    //            Utility.FunShowAlertMsg(this, "Define the Cashflow for UMFC in Cashflow Master");
    //            return;
    //        }
    //        dr["CashInFlowID"] = strArrayIds[0];
    //        dr["Accounting_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[1]));
    //        dr["Business_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[2]));
    //        dr["Company_IRR"] = Convert.ToBoolean(Convert.ToByte(strArrayIds[3]));
    //        dr["CashFlow_Flag_ID"] = strArrayIds[4];
    //        dr["CashInFlow"] = cashflowdesc;
    //        dr["EntityID"] = hdnCustID.Value;
    //        dr["Entity"] = S3GCustomerCommAddress.CustomerName;
    //        dr["InflowFromId"] = "144";
    //        dr["InflowFrom"] = "Customer";
    //        if (ddl_Repayment_Mode.SelectedValue == "2")
    //        {
    //            if (ddl_Return_Pattern.SelectedIndex > 0 && Convert.ToInt32(ddl_Return_Pattern.SelectedValue) > 2)
    //            {
    //                dr["Amount"] = FunPriGetInterestAmount().ToString();
    //            }
    //            else
    //            {
    //                //dr["Amount"] = FunPriGetStructureAdhocInterestAmount().ToString();
    //            }
    //        }
    //        else
    //        {
    //            dr["Amount"] = FunPriGetInterestAmount().ToString();
    //        }

    //        DtCashFlow.Rows.Add(dr);

    //        gvInflow.DataSource = DtCashFlow;
    //        gvInflow.DataBind();

    //        ViewState["DtCashFlow"] = DtCashFlow;
    //        //FunPriGenerateNewInflow();
    //        FunPriFillCashInflow_ViewState();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
    //        cvPricing.IsValid = false;
    //    }
    //}


    protected void txRepaymentFromDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtBoxFromdate = (TextBox)sender;
            //FunPriGenerateRepayment(Utility.StringToDate(txtBoxFromdate.Text));
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
            cvPricing.IsValid = false;
        }
    }

    protected void ddlRepaymentCashFlow_RepayTab_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlCashFlowDesc = sender as DropDownList;
            //FunPriDoCashflowBasedValidation(ddlCashFlowDesc);
        }
        catch (Exception ex)
        {
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in fetching values based on cash flow details";
            cvPricing.IsValid = false;
        }

    }

    protected void btnShowRepayment_Click(object sender, EventArgs e)
    {
        //ModalPopupExtenderRepayDetails.Show();
        //PanRepay.Visible = true;
    }

    #endregion

    #region Alert Tab
    protected void Alert_AddRow_OnClick(object sender, EventArgs e)
    {
        try
        {
            DtAlertDetails = (DataTable)ViewState["DtAlertDetails"];
            DropDownList ddlAlert_Type = gvAlert.FooterRow.FindControl("ddlType_AlertTab") as DropDownList;
            //Removed By Shibu 18-Sep-2013



            UserControls_S3GAutoSuggest ObjddlContact_AlertTab = gvAlert.FooterRow.FindControl("ddlContact_AlertTab") as UserControls_S3GAutoSuggest;
            UserControls_S3GAutoSuggest ddlContact_AlertTab = gvAlert.FooterRow.FindControl("ddlContact_AlertTab") as UserControls_S3GAutoSuggest;
            CheckBox ChkAlertEmail = gvAlert.FooterRow.FindControl("ChkEmail") as CheckBox;
            CheckBox ChkAlertSMS = gvAlert.FooterRow.FindControl("ChkSMS") as CheckBox;

            if (ChkAlertEmail.Checked || ChkAlertSMS.Checked)
            {

                if (DtAlertDetails.Rows.Count > 0)
                {
                    foreach (DataRow dr2 in DtAlertDetails.Rows)
                    {
                        //Sathish R--16-OCT-2018

                        if ((dr2["TypeId"].ToString() == ddlAlert_Type.SelectedValue) &&
                            (dr2["UserContactId"].ToString() == ddlContact_AlertTab.SelectedValue))
                        {
                            Utility.FunShowAlertMsg(this, " Selected combination already exists");
                            return;
                        }

                        if (dr2["TypeId"].ToString() == "141")
                        {
                            Utility.FunShowAlertMsg(this, "All Type Exists Other Type not Allowed");
                            return;
                        }
                        if (dr2["TypeId"].ToString() != "141" && ddlAlert_Type.SelectedValue == "141")
                        {
                            Utility.FunShowAlertMsg(this, "Other Type Exists All Type not Allowed");
                            return;
                        }

                    }


                }

                DataRow dr = DtAlertDetails.NewRow();

                dr["TypeId"] = ddlAlert_Type.SelectedValue;
                dr["Type"] = ddlAlert_Type.SelectedItem;
                dr["UserContactId"] = ddlContact_AlertTab.SelectedValue.ToString();
                dr["UserContact"] = ddlContact_AlertTab.SelectedText;
                dr["EMail"] = ChkAlertEmail.Checked;
                dr["SMS"] = ChkAlertSMS.Checked;

                DtAlertDetails.Rows.Add(dr);

                gvAlert.DataSource = DtAlertDetails;
                gvAlert.DataBind();
                //gvAlert0.DataSource = DtAlertDetails;
                //gvAlert0.DataBind();
                ViewState["DtAlertDetails"] = DtAlertDetails;
                FunPriFillAlert_ViewState();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alert", "alert('Select Email or SMS');", true);
                //cv_TabMainPage.ErrorMessage = "Please select Email or SMS";
                //cv_TabMainPage.IsValid = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in adding alert details";
            cvPricing.IsValid = false;
        }
    }

    protected void gvAlert_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DtAlertDetails = (DataTable)ViewState["DtAlertDetails"];
            if (DtAlertDetails.Rows.Count > 0)
            {
                DtAlertDetails.Rows.RemoveAt(e.RowIndex);

                if (DtAlertDetails.Rows.Count == 0)
                {
                    FunPriFill_Alert_Tab(_Add);
                }
                else
                {
                    gvAlert.DataSource = DtAlertDetails;
                    gvAlert.DataBind();
                    FunPriFillAlert_ViewState();
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting Alert details";
            cvPricing.IsValid = false;
        }
    }
    #endregion

    #region Follow Up Tab

    protected void FollowUp_AddRow_OnClick(object sender, EventArgs e)
    {
        try
        {
            DtFollowUp = (DataTable)ViewState["DtFollowUp"];

            //TextBox txttxtDate_GridFollowup1 = gvFollowUp.FooterRow.FindControl("txtDate_GridFollowup") as TextBox;
            //Removed By Shibu 18-Sep-2013
            //DropDownList ddlfrom_GridFollowup = gvFollowUp.FooterRow.FindControl("ddlfrom_GridFollowup") as DropDownList;
            //DropDownList ddlTo_GridFollowup = gvFollowUp.FooterRow.FindControl("ddlTo_GridFollowup") as DropDownList;
            //UserControls_S3GAutoSuggest ddlfrom_GridFollowup1 = gvFollowUp.FooterRow.FindControl("ddlfrom_GridFollowup") as UserControls_S3GAutoSuggest;
            //UserControls_S3GAutoSuggest ddlTo_GridFollowup1 = gvFollowUp.FooterRow.FindControl("ddlTo_GridFollowup") as UserControls_S3GAutoSuggest;

            //TextBox txtAction_GridFollowup1 = gvFollowUp.FooterRow.FindControl("txtAction_GridFollowup") as TextBox;
            //TextBox txtActionDate_GridFollowup1 = gvFollowUp.FooterRow.FindControl("txtActionDate_GridFollowup") as TextBox;
            //TextBox txtCustomerResponse_GridFollowup1 = gvFollowUp.FooterRow.FindControl("txtCustomerResponse_GridFollowup") as TextBox;
            //TextBox txtRemarks_GridFollowup1 = gvFollowUp.FooterRow.FindControl("txtRemarks_GridFollowup") as TextBox;



            //DataRow dr = DtFollowUp.NewRow();
            //dr["Date"] = Utility.StringToDate(txttxtDate_GridFollowup1.Text);
            //dr["From"] = ddlfrom_GridFollowup1.SelectedText;
            //dr["FromUserId"] = ddlfrom_GridFollowup1.SelectedValue;
            //dr["To"] = ddlTo_GridFollowup1.SelectedText;
            //dr["ToUserId"] = ddlTo_GridFollowup1.SelectedValue;
            //dr["Action"] = txtAction_GridFollowup1.Text;
            //dr["ActionDate"] = Utility.StringToDate(txtActionDate_GridFollowup1.Text);
            //dr["CustomerResponse"] = txtCustomerResponse_GridFollowup1.Text;
            //dr["Remarks"] = txtRemarks_GridFollowup1.Text;
            //if (ddlfrom_GridFollowup1.SelectedValue == ddlTo_GridFollowup1.SelectedValue)
            //{
            //    Utility.FunShowAlertMsg(this, "From user and To user cannot be the same");
            //    return;
            //}
            //if (Utility.CompareDates(txttxtDate_GridFollowup1.Text, txtActionDate_GridFollowup1.Text) == -1)
            //{
            //    Utility.FunShowAlertMsg(this, "Action Date cannot be less than the Follow up date");
            //    return;
            //}
            //DtFollowUp.Rows.Add(dr);

            //gvFollowUp.DataSource = DtFollowUp;
            //gvFollowUp.DataBind();

            ViewState["DtFollowUp"] = DtFollowUp;
            FunPriFillFollowUp_ViewState();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in adding followup details";
            cvPricing.IsValid = false;
        }
    }

    protected void gvFollowUp_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DtFollowUp = (DataTable)ViewState["DtFollowUp"];
            if (DtFollowUp.Rows.Count > 0)
            {
                DtFollowUp.Rows.RemoveAt(e.RowIndex);

                if (DtFollowUp.Rows.Count == 0)
                {
                    FunPriFillFollowUp_Tab(_Add);
                }
                else
                {
                    //gvFollowUp.DataSource = DtFollowUp;
                    //gvFollowUp.DataBind();
                    FunPriFillFollowUp_ViewState();
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in deleting following details";
            cvPricing.IsValid = false;
        }
    }

    protected void gvFollowUp_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox txtDate_GridFollowup = e.Row.FindControl("txtDate_GridFollowup") as TextBox;
            txtDate_GridFollowup.Attributes.Add("readonly", "readonly");
            AjaxControlToolkit.CalendarExtender CalendarExtenderSD_FollowupDate = e.Row.FindControl("CalendarExtenderSD_FollowupDate") as AjaxControlToolkit.CalendarExtender;
            CalendarExtenderSD_FollowupDate.Format = ObjS3GSession.ProDateFormatRW;

            TextBox txtActionDate_GridFollowup = e.Row.FindControl("txtActionDate_GridFollowup") as TextBox;
            txtActionDate_GridFollowup.Attributes.Add("readonly", "readonly");
            AjaxControlToolkit.CalendarExtender CalendarExtenderSD_FollowupActionDate = e.Row.FindControl("CalendarExtenderSD_FollowupActionDate") as AjaxControlToolkit.CalendarExtender;
            CalendarExtenderSD_FollowupActionDate.Format = ObjS3GSession.ProDateFormatRW;
        }
    }
    #endregion

    #region Document Details
    protected void grvConsDocs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].Visible = false;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox txtValues = (TextBox)e.Row.FindControl("txtValues");
            CheckBox ObjchkIsMandatory = (CheckBox)e.Row.FindControl("chkIsMandatory");
            CheckBox ObjchkIsNeedImageCopy = (CheckBox)e.Row.FindControl("chkIsNeedImageCopy");

            ObjchkIsMandatory.Enabled = false;
            ObjchkIsNeedImageCopy.Enabled = false;
            CheckBox chkScanned = (CheckBox)e.Row.FindControl("chkScanned");
            LinkButton lnkScannedReference = (LinkButton)e.Row.FindControl("lnkScannedReference");

            if (ObjchkIsNeedImageCopy.Checked == true)
                chkScanned.Enabled = !chkScanned.Checked; //if yes then disabled
            else
                chkScanned.Enabled = false;

            lnkScannedReference.Enabled = chkScanned.Checked; // if yes then enabled


            if (e.Row.Cells[1].Text.Contains("CID"))
            {
                txtValues.Visible = true;
                txtValues.ReadOnly = false;
            }
            else
            {
                txtValues.Visible = false;
            }

            CheckBox chkCollected = (CheckBox)e.Row.FindControl("chkCollected");
            TextBox txtRemarks = (TextBox)e.Row.FindControl("txtRemark");

            if (chkCollected.Checked)
                chkCollected.Enabled = false;

            if (strMode == "Q")
            {
                chkCollected.Enabled = chkScanned.Enabled = false;
                txtValues.ReadOnly = txtRemarks.ReadOnly = true;
                txtRemarks.ToolTip = txtRemarks.Text;
            }

        }
    }

    protected void hlnkView_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriShowDocumentDet(sender);
        }
        catch (Exception ex)
        {
            cvPricing.ErrorMessage = ex.Message;
            cvPricing.IsValid = false;
        }
    }
    private void FunPriShowDocumentDet(object sender)
    {
        try
        {
            string strFieldAtt = ((LinkButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("grvConsDocuments", strFieldAtt);
            //Label lblPath = grvConsDocuments.Rows[gRowIndex].FindControl("lblDocumentPath") as Label;
            //string strFileName = lblPath.Text.Replace("\\", "/").Trim();
            //string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Due to Data Problem, Unable to View the Document");
        }
    }

    #region PRDT


    protected void hyplnkViewDealer_Click(object sender, EventArgs e)
    {
        try
        {
            //string strFieldAtt = ((LinkButton)sender).ClientID;
            //int gRowIndex = Utility.FunPubGetGridRowID("grvPRDDCDealer", strFieldAtt);
            //Label lblPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblPathDealer") as Label;
            //Label lblActualPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblActualPathIDealer") as Label;
            //if (lblPath.Text == "")
            //{
            //    Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            //    return;
            //}
            //string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            //string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);


            string strScipt = string.Empty;
            string strFieldAtt = ((LinkButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("grvPRDDCDealer", strFieldAtt);
            Label lblPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblPathDealer") as Label;
            Label lblActualPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblActualPathIDealer") as Label;
            if (lblPath.Text == "")
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
                return;
            }
            string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            string strFileName2 = Path.GetFileName(strFileName);
            List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
            string strPath = Server.MapPath("..\\PreDDImages\\");


            string strExtn = Path.GetExtension(strFileName2);
            if (!ValidateViewFileExtn(strExtn))
            {
                return;
            }


            if (strPath.EndsWith("\\"))
            {
                strPath = strPath.Remove(strPath.Length - 1);
            }
            Uri pathUri = new Uri(strPath, UriKind.Absolute);
            string strNewFilePath = Path.GetFullPath(strPath) + (strFileName2);
            Uri pathUri1 = new Uri(strNewFilePath, UriKind.Absolute);
            if (File.Exists(strNewFilePath))
            {
                File.Delete(strNewFilePath);
            }
            File.Copy(lblActualPath.Text, strNewFilePath);
            AjaxControlToolkit.Slide objItem = new AjaxControlToolkit.Slide();
            objItem.Name = Path.GetFileNameWithoutExtension(strFileName2);
            objItem.ImagePath = pathUri.MakeRelativeUri(pathUri1).ToString();
            objItem.Description = ucCustomerCodeLov.SelectedText;
            slides.Add(objItem);
            Session["SlideData"] = slides;
            strScipt = "window.open('..//../S3G_ORG_PRDDCDocViewer.aspx', 'newwindow','toolbar=no,location=no,menubar=no,width=800,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", strScipt, true);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to View the Document";
            cvPricing.IsValid = false;
        }
    }


    protected bool ValidateViewFileExtn(string strFileName)
    {

        string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "BMP", "GIF", "PNG", "JPG", "JPEG" };


        string ext = System.IO.Path.GetExtension(strFileName);

        bool isValidFile = false;

        for (int i = 0; i < validFileTypes.Length; i++)
        {

            if (ext == "." + validFileTypes[i])
            {

                isValidFile = true;

                break;

            }

        }

        if (!isValidFile)
        {
            Utility.FunShowAlertMsg(this, "View Allowed for Following File extensions only " + string.Join(",", validFileTypes));
        }
        else
        {
        }

        return isValidFile;

    }
    protected void hyplnkView_Click(object sender, EventArgs e)
    {
        try
        {
            //Old Download File Start
            //string strFieldAtt = ((LinkButton)sender).ClientID;
            //int gRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", strFieldAtt);
            //Label lblPath = gvPRDDT.Rows[gRowIndex].FindControl("lblPath") as Label;
            //Label lblActualPath = gvPRDDT.Rows[gRowIndex].FindControl("lblActualPathI") as Label;
            //if (lblPath.Text == "")
            //{
            //    Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            //    return;
            //}
            //string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            //string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
            //Old Download File End

            string strScipt = string.Empty;
            string strFieldAtt = ((LinkButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", strFieldAtt);
            Label lblPath = gvPRDDT.Rows[gRowIndex].FindControl("lblPath") as Label;
            Label lblActualPath = gvPRDDT.Rows[gRowIndex].FindControl("lblActualPathI") as Label;
            if (lblPath.Text == "")
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
                return;
            }
            string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            string strFileName2 = Path.GetFileName(strFileName);
            List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
            string strPath = Server.MapPath("..\\PreDDImages\\");


            string strExtn = Path.GetExtension(strFileName2);
            if (!ValidateViewFileExtn(strExtn))
            {
                return;
            }


            if (strPath.EndsWith("\\"))
            {
                strPath = strPath.Remove(strPath.Length - 1);
            }
            Uri pathUri = new Uri(strPath, UriKind.Absolute);
            string strNewFilePath = Path.GetFullPath(strPath) + (strFileName2);
            Uri pathUri1 = new Uri(strNewFilePath, UriKind.Absolute);
            if (File.Exists(strNewFilePath))
            {
                File.Delete(strNewFilePath);
            }
            File.Copy(lblActualPath.Text, strNewFilePath);
            AjaxControlToolkit.Slide objItem = new AjaxControlToolkit.Slide();
            objItem.Name = Path.GetFileNameWithoutExtension(strFileName2);
            objItem.ImagePath = pathUri.MakeRelativeUri(pathUri1).ToString();
            objItem.Description = ucCustomerCodeLov.SelectedText;
            slides.Add(objItem);
            Session["SlideData"] = slides;
            strScipt = "window.open('..//../S3G_ORG_PRDDCDocViewer.aspx', 'newwindow','toolbar=no,location=no,menubar=no,width=800,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", strScipt, true);



        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to View the Document";
            cvPricing.IsValid = false;
        }
    }
    protected void hyplnkView_ClickF(object sender, EventArgs e)
    {
        try
        {
            //Label lblPath = gvPRDDT.FooterRow.FindControl("lblPathF") as Label;
            //Label lblActualPath = gvPRDDT.FooterRow.FindControl("lblActualPath") as Label;
            //if (lblPath.Text == "")
            //{
            //    Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            //    return;
            //}
            //string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            //string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);

            string strScipt = string.Empty;
            Label lblPath = gvPRDDT.FooterRow.FindControl("lblPathF") as Label;
            Label lblActualPath = gvPRDDT.FooterRow.FindControl("lblActualPath") as Label;
            if (lblPath.Text == "")
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
                return;
            }
            string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
            string strFileName2 = Path.GetFileName(strFileName);
            List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
            string strPath = Server.MapPath("..\\PreDDImages\\");


            string strExtn = Path.GetExtension(strFileName2);
            if (!ValidateViewFileExtn(strExtn))
            {
                return;
            }


            if (strPath.EndsWith("\\"))
            {
                strPath = strPath.Remove(strPath.Length - 1);
            }
            Uri pathUri = new Uri(strPath, UriKind.Absolute);
            string strNewFilePath = Path.GetFullPath(strPath) + (strFileName2);
            Uri pathUri1 = new Uri(strNewFilePath, UriKind.Absolute);
            if (File.Exists(strNewFilePath))
            {
                File.Delete(strNewFilePath);
            }
            File.Copy(lblActualPath.Text, strNewFilePath);
            AjaxControlToolkit.Slide objItem = new AjaxControlToolkit.Slide();
            objItem.Name = Path.GetFileNameWithoutExtension(strFileName2);
            objItem.ImagePath = pathUri.MakeRelativeUri(pathUri1).ToString();
            objItem.Description = txtCustomerName.Text;
            slides.Add(objItem);
            Session["SlideData"] = slides;
            strScipt = "window.open('..//../S3G_ORG_PRDDCDocViewer.aspx', 'newwindow','toolbar=no,location=no,menubar=no,width=800,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", strScipt, true);




        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to View the Document";
            cvPricing.IsValid = false;
        }
    }
    //protected void ddlPRDDCType_OnSelectedIndexChanged(object sender, EventArgs e)
    //{
    //}
    protected void lnkRemovePRDDC_Click(object sender, EventArgs e)
    {

    }
    protected void lnkAAddPRDDCGrid_Click(object sender, EventArgs e)
    {
        funPriInsertTempDocTable("1");
    }

    protected void lnkRemovePRDDC_Click1(object sender, EventArgs e)
    {
        int intRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", ((LinkButton)sender).ClientID);

        Label lblPRICINGDOCID = (Label)gvPRDDT.Rows[intRowIndex].FindControl("lblPRICINGDOCID");
        ViewState["EditSno"] = lblPRICINGDOCID.Text;
        ViewState["AssetDeleteDoc"] = "1";
        funPriInsertTempDocTable("7");

    }

    protected void gvPRDDT_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {


        //DataTable dtPDDCustomer = (DataTable)ViewState["dtPDDCustomer"];
        //if (dtPDDCustomer.Rows.Count > 0)
        //{
        //    dtPDDCustomer.Rows.RemoveAt(e.RowIndex);
        //    dtPDDCustomer.AcceptChanges();

        //    if (dtPDDCustomer.Rows.Count == 0)
        //    {
        //        //funPrivLoadPDCGrid();
        //    }
        //    else
        //    {
        //        gvPRDDT.DataSource = dtPDDCustomer;
        //        gvPRDDT.DataBind();
        //        ViewState["dtPDDCustomer"] = dtPDDCustomer;

        //    }
        //}

    }
    protected void gvPRDDT_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                AjaxControlToolkit.CalendarExtender calCollectedDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCollectedDateF");
                //AjaxControlToolkit.CalendarExtender calCADReceivedF = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADReceivedF");
                //AjaxControlToolkit.CalendarExtender calCADVerifiedF = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADVerifiedF");
                TextBox txtCollectedDate = (TextBox)e.Row.FindControl("txtCollectedDateF");
                //TextBox txtCADReceived = (TextBox)e.Row.FindControl("txtCADReceivedF");
                //TextBox txtCADVerifiedDate = (TextBox)e.Row.FindControl("txtCADVerifiedDateF");
                txtCollectedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCollectedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADReceived.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADReceived.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADVerifiedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADVerifiedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //FileUpload flUpload = (FileUpload)e.Row.FindControl("flUpload");
                calCollectedDate.Format = strDateFormat;
                TextBox ddlCollectedBy = (TextBox)e.Row.FindControl("ddlCollectedByF") as TextBox;
                //TextBox ddlCADReceivedBy = (TextBox)e.Row.FindControl("ddlCADReceivedByF") as TextBox;
                //TextBox ddlCADVerifiedBy = (TextBox)e.Row.FindControl("ddlCADVerifiedByF") as TextBox;
                //Label lblPathF = e.Row.FindControl("lblPathF") as Label;
                //LinkButton hyplnkViewF = e.Row.FindControl("hyplnkViewF") as LinkButton;
                DropDownList ddlRequiredF = e.Row.FindControl("ddlRequiredF") as DropDownList;
                DropDownList ddlReceivedF = e.Row.FindControl("ddlReceivedF") as DropDownList;
                RequiredFieldValidator RfvddlReceivedF = e.Row.FindControl("RfvddlReceivedF") as RequiredFieldValidator;
                ddlCollectedBy.Text = ObjUserInfo.ProUserNameRW;
                //ddlCADReceivedBy.Text = ObjUserInfo.ProUserNameRW;
                //ddlCADVerifiedBy.Text = ObjUserInfo.ProUserNameRW;
                ddlCollectedBy.Enabled = false;
                //ddlCADReceivedBy.Enabled = false;
                //ddlCADVerifiedBy.Enabled = false;
                //if (lblPathF.Text == string.Empty)
                //{
                //    hyplnkViewF.Enabled_False_Link_Asp();
                //}
                //else
                //{
                //    hyplnkViewF.Enabled_True_Link_Asp();
                //}
                //flUpload.Attributes.Add("onchange", "fnLoadPath('" + btnBrowse.ClientID + "'); ");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                UserInfo ObjUserInfo = new UserInfo();
                TextBox ddlCollectedBy = (TextBox)e.Row.FindControl("ddlCollectedBy") as TextBox;
                CheckBox ChkCadI = (CheckBox)e.Row.FindControl("ChkCadI") as CheckBox;
                Label lblCADI = (Label)e.Row.FindControl("lblCADI") as Label;
                //TextBox ddlCADReceivedBy = (TextBox)e.Row.FindControl("ddlCADReceivedBy") as TextBox;
                //TextBox ddlCADVerifiedBy = (TextBox)e.Row.FindControl("ddlCADVerifiedBy") as TextBox;
                //Button btnBrowseI = (Button)e.Row.FindControl("btnBrowseI");
                //FileUpload flUploadI = (FileUpload)e.Row.FindControl("flUploadI");
                //flUploadI.Attributes.Add("onchange", "fnLoadPath('" + btnBrowseI.ClientID + "'); ");
                Label lblDocRequired = (Label)e.Row.FindControl("lblDocRequired");
                //Label lblPath = (Label)e.Row.FindControl("lblPath");
                DropDownList ddlRequired = (DropDownList)e.Row.FindControl("ddlRequired");
                Label lblDocReceived = (Label)e.Row.FindControl("lblDocReceived");
                DropDownList ddlReceived = (DropDownList)e.Row.FindControl("ddlReceived");
                Label lblIsAddtional = (Label)e.Row.FindControl("lblIsAddtional");
                LinkButton lnkRemovePRDDC = (LinkButton)e.Row.FindControl("lnkRemovePRDDC");
                HiddenField lblCollectedBy = (HiddenField)e.Row.FindControl("lblCollectedBy");
                //HiddenField lblCADVerifiedById = (HiddenField)e.Row.FindControl("lblCADVerifiedById");
                //HiddenField lblCADReceivedById = (HiddenField)e.Row.FindControl("lblCADReceivedById");
                TextBox txtCollectedDate = (TextBox)e.Row.FindControl("txtCollectedDate");
                //TextBox txtCADReceived = (TextBox)e.Row.FindControl("txtCADReceived");
                //TextBox txtCADVerifiedDate = (TextBox)e.Row.FindControl("txtCADVerifiedDate");
                TextBox txtRemarksMO = (TextBox)e.Row.FindControl("txtRemarks");
                //TextBox txtCADReceiverRemarks = (TextBox)e.Row.FindControl("txtCADReceiverRemarks");
                //TextBox txtCADVerifierRemarks = (TextBox)e.Row.FindControl("txtCADVerifierRemarks");
                //TextBox txtCADValue = (TextBox)e.Row.FindControl("txtCADValue");
                txtRemarksMO.Attributes.Add("onchange", "funtrimspace('" + txtRemarksMO.ClientID + "');");
                //txtCADReceiverRemarks.Attributes.Add("onchange", "funtrimspace('" + txtCADReceiverRemarks.ClientID + "');");
                //txtCADVerifierRemarks.Attributes.Add("onchange", "funtrimspace('" + txtCADVerifierRemarks.ClientID + "');");




                ddlRequired.SelectedValue = lblDocRequired.Text;
                ddlReceived.SelectedValue = lblDocReceived.Text;
                if (ddlRequired.SelectedValue == "0")
                {
                    ddlRequired.SelectedValue = "1";
                    ddlReceived.SelectedValue = "2";
                }

                if (lblCADI.Text == "1")
                {
                    ChkCadI.Checked = true;
                }
                else
                {
                    ChkCadI.Checked = false;
                }
                if (strMode == "Q")
                {
                    ChkCadI.Enabled = false;
                }

                //ddlRequired.Attributes.Add("onchange", "funSetValidationValuesRequired(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //ddlReceived.Attributes.Add("onchange", "funSetValidationValuesReceived(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //txtCollectedDate.Attributes.Add("onchange", "funSetValidationValuesCollectedDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                txtCollectedDate.Attributes.Add("onchange", "funSetValidationValuesCollectedDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");
                ddlRequired.Attributes.Add("onchange", "funSetValidationValuesRequired(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");
                ddlReceived.Attributes.Add("onchange", "funSetValidationValuesReceived(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");

                //txtCADVerifiedDate.Attributes.Add("onchange", "funSetValidationValuesVerDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //txtCADReceived.Attributes.Add("onchange", "funSetValidationValuesRecDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //txtCollectedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCollectedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADReceived.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADReceived.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADVerifiedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADVerifiedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //LinkButton Viewdoct = (LinkButton)e.Row.FindControl("hyplnkView");
                //ImageButton hyplnkViewDownLoadI = (ImageButton)e.Row.FindControl("hyplnkViewDownLoadI");
                if (lblIsAddtional.Text == "1")
                    lnkRemovePRDDC.Visible = true;
                else
                    lnkRemovePRDDC.Visible = false;
                //if (lblPath.Text == string.Empty)
                //{
                //    Viewdoct.Enabled_False_Link_Asp();
                //    hyplnkViewDownLoadI.ImageUrl = "~/Images/downloadFile_Disable.png";
                //    hyplnkViewDownLoadI.Enabled = false;
                //}
                //else
                //{
                //    Viewdoct.Enabled_True_Link_Asp();
                //    hyplnkViewDownLoadI.ImageUrl = "~/Images/downloadFile.png";
                //    hyplnkViewDownLoadI.Enabled = true;
                //}
                if (ViewState["ReqStatus"].ToString() == "1")
                {
                    ddlRequired.Enabled = true;
                }
                else
                {
                    ddlRequired.Enabled = false;
                }
                if (ViewState["RecStatus"].ToString() == "1")
                {
                    ddlReceived.Enabled = true;
                }
                else
                {
                    ddlReceived.Enabled = false;
                }
                //ddlCADReceivedBy.Enabled = false;
                //ddlCADVerifiedBy.Enabled = false;
                AjaxControlToolkit.CalendarExtender calCollectedDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCollectedDate");
                //AjaxControlToolkit.CalendarExtender calCADReceived = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADReceived");
                //AjaxControlToolkit.CalendarExtender calCADVerified = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADVerified");
                //calCADVerified.Format = calCADReceived.Format = calCollectedDate.Format = strDateFormat;
                calCollectedDate.Format = strDateFormat;
                TextBox txtColletedDate = (TextBox)e.Row.FindControl("txtCollectedDate");
                if (lblDocReceived.Text != string.Empty)
                {
                    if (lblDocReceived.Text == "1")
                    {
                    }
                }
                if (intPricingId >= 0)
                {
                }
                if (lblDocRequired.Text == "2")
                {
                }
                else
                {
                    if (ViewState["RecStatus"].ToString() == "1")
                    {
                        ddlReceived.Enabled = true;
                    }
                    else
                    {
                        ddlReceived.Enabled = false;
                    }
                }

                if (ViewState["ReqStatus"].ToString() == "0")
                {
                    ddlCollectedBy.Enabled = false;
                    txtCollectedDate.Enabled = false;
                    txtRemarksMO.Enabled = false;
                    //calCollectedDate.Enabled = false;
                }
                if (ViewState["CAD_REC_ACCESS"].ToString() == "0")
                {
                    //ddlCADReceivedBy.Enabled = false;
                    //txtCADReceived.Enabled = false;
                    //txtCADReceiverRemarks.Enabled = false;
                    //calCADReceived.Enabled = false;
                }
                if (ViewState["CAD_VER_ACCESS"].ToString() == "0")
                {
                    //ddlCADVerifiedBy.Enabled = false;
                    //txtCADVerifiedDate.Enabled = false;
                    //txtCADVerifierRemarks.Enabled = false;
                    //calCADVerified.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    protected void grvPRDDCDealer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {



            if (e.Row.RowType == DataControlRowType.Footer)
            {

                AjaxControlToolkit.CalendarExtender calCollectedDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCollectedDateF");
                //AjaxControlToolkit.CalendarExtender calCADReceivedF = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADReceivedF");
                //AjaxControlToolkit.CalendarExtender calCADVerifiedF = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADVerifiedF");


                TextBox txtCollectedDate = (TextBox)e.Row.FindControl("txtCollectedDateF");
                //TextBox txtCADReceived = (TextBox)e.Row.FindControl("txtCADReceivedF");
                //TextBox txtCADVerifiedDate = (TextBox)e.Row.FindControl("txtCADVerifiedDateF");


                txtCollectedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCollectedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADReceived.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADReceived.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADVerifiedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADVerifiedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False


                //FileUpload flUpload = (FileUpload)e.Row.FindControl("flUpload");


                calCollectedDate.Format = strDateFormat;

                TextBox ddlCollectedBy = (TextBox)e.Row.FindControl("ddlCollectedByF") as TextBox;
                //TextBox ddlCADReceivedBy = (TextBox)e.Row.FindControl("ddlCADReceivedByF") as TextBox;
                //TextBox ddlCADVerifiedBy = (TextBox)e.Row.FindControl("ddlCADVerifiedByF") as TextBox;

                //Label lblPathF = e.Row.FindControl("lblPathF") as Label;
                //LinkButton hyplnkViewF = e.Row.FindControl("hyplnkViewF") as LinkButton;

                DropDownList ddlRequiredF = e.Row.FindControl("ddlRequiredF") as DropDownList;
                DropDownList ddlReceivedF = e.Row.FindControl("ddlReceivedF") as DropDownList;
                RequiredFieldValidator RfvddlReceivedF = e.Row.FindControl("RfvddlReceivedF") as RequiredFieldValidator;

                //ddlRequiredF.Attributes.Add("onchange", "funSetValidationValuesRequiredFooter(this,'" + ddlRequiredF.ClientID + "','" + ddlReceivedF.ClientID + "','"+RfvddlReceivedF.ClientID+"');");//Future Date False,Back Date False








                //ddlCollectedBy.SelectedValue = ObjUserInfo.ProUserIdRW.ToString();
                ddlCollectedBy.Text = ObjUserInfo.ProUserNameRW;

                //ddlCADReceivedBy.SelectedValue = ObjUserInfo.ProUserIdRW.ToString();
                //ddlCADReceivedBy.Text = ObjUserInfo.ProUserNameRW;


                //ddlCADVerifiedBy.SelectedValue = ObjUserInfo.ProUserIdRW.ToString();
                //ddlCADVerifiedBy.Text = ObjUserInfo.ProUserNameRW;

                ddlCollectedBy.Enabled = false;
                //ddlCADReceivedBy.Enabled = false;
                //ddlCADVerifiedBy.Enabled = false;

                //if (lblPathF.Text == string.Empty)
                //{
                //    hyplnkViewF.Enabled_False_Link_Asp();
                //}
                //else
                //{
                //    hyplnkViewF.Enabled_True_Link_Asp();
                //}
                //flUpload.Attributes.Add("onchange", "fnLoadPath('" + btnBrowse.ClientID + "'); ");
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                UserInfo ObjUserInfo = new UserInfo();
                CheckBox ChkCadI = (CheckBox)e.Row.FindControl("ChkCadI") as CheckBox;
                Label lblCADI = (Label)e.Row.FindControl("lblCADI") as Label;
                TextBox ddlCollectedBy = (TextBox)e.Row.FindControl("ddlCollectedBy") as TextBox;
                //TextBox ddlCADReceivedBy = (TextBox)e.Row.FindControl("ddlCADReceivedBy") as TextBox;
                //TextBox ddlCADVerifiedBy = (TextBox)e.Row.FindControl("ddlCADVerifiedBy") as TextBox;
                //Button btnBrowseI = (Button)e.Row.FindControl("btnBrowseIDealer");
                //FileUpload flUploadI = (FileUpload)e.Row.FindControl("flUploadIDealer");
                //flUploadI.Attributes.Add("onchange", "fnLoadPath('" + btnBrowseI.ClientID + "'); ");
                Label lblDocRequired = (Label)e.Row.FindControl("lblDocRequired");
                //Label lblPath = (Label)e.Row.FindControl("lblPathDealer");
                DropDownList ddlRequired = (DropDownList)e.Row.FindControl("ddlRequired");
                Label lblDocReceived = (Label)e.Row.FindControl("lblDocReceived");
                DropDownList ddlReceived = (DropDownList)e.Row.FindControl("ddlReceived");
                Label lblIsAddtional = (Label)e.Row.FindControl("lblIsAddtional");
                LinkButton lnkRemovePRDDC = (LinkButton)e.Row.FindControl("lnkRemovePRDDC");
                HiddenField lblCollectedBy = (HiddenField)e.Row.FindControl("lblCollectedBy");
                //HiddenField lblCADVerifiedById = (HiddenField)e.Row.FindControl("lblCADVerifiedById");
                //HiddenField lblCADReceivedById = (HiddenField)e.Row.FindControl("lblCADReceivedById");
                TextBox txtCollectedDate = (TextBox)e.Row.FindControl("txtCollectedDate");
                //TextBox txtCADReceived = (TextBox)e.Row.FindControl("txtCADReceived");
                //TextBox txtCADVerifiedDate = (TextBox)e.Row.FindControl("txtCADVerifiedDate");
                TextBox txtRemarksMO = (TextBox)e.Row.FindControl("txtRemarks");
                //TextBox txtCADReceiverRemarks = (TextBox)e.Row.FindControl("txtCADReceiverRemarks");
                //TextBox txtCADVerifierRemarks = (TextBox)e.Row.FindControl("txtCADVerifierRemarks");
                //TextBox txtCADValue = (TextBox)e.Row.FindControl("txtCADValue");
                //LinkButton Viewdoct = (LinkButton)e.Row.FindControl("hyplnkView");
                //ImageButton hyplnkViewDownLoadIDealer = (ImageButton)e.Row.FindControl("hyplnkViewDownLoadIDealer");
                AjaxControlToolkit.CalendarExtender calCollectedDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCollectedDate");
                //AjaxControlToolkit.CalendarExtender calCADReceived = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADReceived");
                //AjaxControlToolkit.CalendarExtender calCADVerified = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("calCADVerified");
                calCollectedDate.Format = strDateFormat;
                TextBox txtColletedDate = (TextBox)e.Row.FindControl("txtCollectedDate");
                //calCADVerified.Format = calCADReceived.Format =
                txtRemarksMO.Attributes.Add("onchange", "funtrimspace('" + txtRemarksMO.ClientID + "');");
                //txtCADReceiverRemarks.Attributes.Add("onchange", "funtrimspace('" + txtCADReceiverRemarks.ClientID + "');");
                //txtCADVerifierRemarks.Attributes.Add("onchange", "funtrimspace('" + txtCADVerifierRemarks.ClientID + "');");
                ddlRequired.SelectedValue = lblDocRequired.Text;
                ddlReceived.SelectedValue = lblDocReceived.Text;
                //ddlRequired.Attributes.Add("onchange", "funSetValidationValuesRequired(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //ddlReceived.Attributes.Add("onchange", "funSetValidationValuesReceived(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //txtCollectedDate.Attributes.Add("onchange", "funSetValidationValuesCollectedDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");

                ddlRequired.Attributes.Add("onchange", "funSetValidationValuesRequired(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");
                ddlReceived.Attributes.Add("onchange", "funSetValidationValuesReceived(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");

                txtCollectedDate.Attributes.Add("onchange", "funSetValidationValuesCollectedDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "','" + null + "');");
                //txtCADVerifiedDate.Attributes.Add("onchange", "funSetValidationValuesVerDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                //txtCADReceived.Attributes.Add("onchange", "funSetValidationValuesRecDate(this,'" + ddlRequired.ClientID + "','" + ddlReceived.ClientID + "','" + ddlCollectedBy.ClientID + "','" + lblCollectedBy.ClientID + "','" + txtCollectedDate.ClientID + "','" + txtRemarksMO.ClientID + "','" + ddlCADVerifiedBy.ClientID + "','" + lblCADVerifiedById.ClientID + "','" + txtCADVerifiedDate.ClientID + "','" + txtCADVerifierRemarks.ClientID + "','" + ddlCADReceivedBy.ClientID + "','" + lblCADReceivedById.ClientID + "','" + txtCADReceived.ClientID + "','" + txtCADReceiverRemarks.ClientID + "');");
                txtCollectedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCollectedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADReceived.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADReceived.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False
                //txtCADVerifiedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCADVerifiedDate.ClientID + "','" + strDateFormat + "',true,  false);");//Future Date False,Back Date False

                //if (lblPath.Text == string.Empty)
                //{
                //    Viewdoct.Enabled_False_Link_Asp();
                //    hyplnkViewDownLoadIDealer.ImageUrl = "~/Images/downloadFile_Disable.png";
                //    hyplnkViewDownLoadIDealer.Enabled = false;
                //}
                //else
                //{
                //    Viewdoct.Enabled_True_Link_Asp();
                //    hyplnkViewDownLoadIDealer.ImageUrl = "~/Images/downloadFile.png";
                //    hyplnkViewDownLoadIDealer.Enabled = true;
                //}

                if (lblCADI.Text == "1")
                {
                    ChkCadI.Checked = true;
                }
                else
                {
                    ChkCadI.Checked = false;
                }
                if (strMode == "Q")
                {
                    ChkCadI.Enabled = false;
                }

                if (ViewState["ReqStatus"].ToString() == "1")
                {
                    ddlRequired.Enabled = true;
                }
                else
                {
                    ddlRequired.Enabled = false;
                }
                if (ViewState["RecStatus"].ToString() == "1")
                {
                    ddlReceived.Enabled = true;
                }
                else
                {
                    ddlReceived.Enabled = false;
                }
                //ddlCADReceivedBy.Enabled = false;
                //ddlCADVerifiedBy.Enabled = false;


                if (ddlRequired.SelectedValue == "0")
                {
                    ddlRequired.SelectedValue = "1";
                    ddlReceived.SelectedValue = "2";
                }


                if (lblDocReceived.Text != string.Empty)
                {
                    if (lblDocReceived.Text == "1")
                    {

                    }
                }
                if (intPricingId >= 0)
                {
                }
                if (lblDocRequired.Text == "2")
                {
                }
                else
                {
                    if (ViewState["RecStatus"].ToString() == "1")
                    {
                        ddlReceived.Enabled = true;
                    }
                    else
                    {
                        ddlReceived.Enabled = false;
                    }
                }
                if (ViewState["ReqStatus"].ToString() == "0")
                {
                    ddlCollectedBy.Enabled = false;
                    txtCollectedDate.Enabled = false;
                    txtRemarksMO.Enabled = false;
                    calCollectedDate.Enabled = false;
                }
                if (ViewState["CAD_REC_ACCESS"].ToString() == "0")
                {
                    //ddlCADReceivedBy.Enabled = false;
                    //txtCADReceived.Enabled = false;
                    //txtCADReceiverRemarks.Enabled = false;
                    //calCADReceived.Enabled = false;
                }
                if (ViewState["CAD_VER_ACCESS"].ToString() == "0")
                {
                    //ddlCADVerifiedBy.Enabled = false;
                    //txtCADVerifiedDate.Enabled = false;
                    //txtCADVerifierRemarks.Enabled = false;
                    //calCADVerified.Enabled = false;
                }

                if (strMode == "Q")
                {
                    //flUploadI.Enabled =ddlCADReceivedBy.Enabled = ddlCADVerifiedBy.Enabled = btnBrowseI.Enabled =lblPath.Enabled =txtCADReceiverRemarks.Enabled =txtCADVerifierRemarks.Enabled =
                    //txtCADReceived.Enabled = txtCADVerifiedDate.Enabled = txtCADValue.Enabled = Viewdoct.Enabled =calCADReceived.Enabled = calCADVerified.Enabled =
                    ddlCollectedBy.Enabled =
                    lblDocRequired.Enabled = ddlRequired.Enabled = lblDocReceived.Enabled = ddlReceived.Enabled = lblIsAddtional.Enabled = lnkRemovePRDDC.Enabled =
                    txtCollectedDate.Enabled = txtRemarksMO.Enabled =
                    calCollectedDate.Enabled = txtColletedDate.Enabled = false;
                    if (grvPRDDCDealer.FooterRow != null)
                    {
                        grvPRDDCDealer.ShowFooter = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void asyncFileUpload_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        string strPath = string.Empty;
        AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = sender as AjaxControlToolkit.AsyncFileUpload;
        int intRowIndex2 = Utility.FunPubGetGridRowID("gvPRDDT", ((AjaxControlToolkit.AsyncFileUpload)sender).ClientID);
        intRowIndex = intRowIndex2;

        Label lblPath = (Label)gvPRDDT.Rows[intRowIndex2].FindControl("lblPath");
        TextBox txOD = (TextBox)gvPRDDT.Rows[intRowIndex2].FindControl("txOD");
        LinkButton hyplnkView = (LinkButton)gvPRDDT.Rows[intRowIndex2].FindControl("hyplnkView");
        string strNewFileName = AsyncFileUpload1.FileName;
        if (AsyncFileUpload1.FileName != "")
        {
            if (strDocpath == string.Empty || strDocpath == null)
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
                return;
            }

            if (AsyncFileUpload1.HasFile)
            {
                if (strDocpath != "")
                {
                    strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-" + intRowIndex2.ToString());
                    if (Directory.Exists(strPath))
                    {
                        Directory.Delete(strPath, true);
                    }
                    Directory.CreateDirectory(strPath);
                    strPath = strPath + "/" + strNewFileName;
                }
                lblPath.Text = txOD.Text = strPath;
                strCurrentFilePath = lblPath.Text;

                FileInfo f1 = new FileInfo(strPath);

                if (f1.Exists == true)
                    f1.Delete();

                AsyncFileUpload1.SaveAs(strPath);
                hyplnkView.Enabled = true;
            }
        }
    }

    protected void btndoPostback_Click(object sender, EventArgs e)
    {

        Label lblPath = (Label)gvPRDDT.Rows[intRowIndex].FindControl("lblPath");
        lblPath.Text = strCurrentFilePath;
        strCurrentFilePath = string.Empty;
        intRowIndex = -1;
    }
    protected void btndoPostbackF_Click(object sender, EventArgs e)
    {

        Label lblPath = (Label)gvPRDDT.FooterRow.FindControl("lblPathF");
        lblPath.Text = strCurrentFilePath;
        strCurrentFilePath = string.Empty;
        //intRowIndex = -1;
    }
    //protected void asyncFileUpload_UploadedCompleteF(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    //{
    //DropDownList ddlScannedBy = sender as DropDownList;
    //if (ddlScannedBy.SelectedIndex > 0)

    //if (AsyncFileUploadImage.HasFile)
    //{
    //    Session["AsyncFileUploadPDF"] = AsyncFileUploadImage;
    //}
    //}

    #endregion

    #endregion

    protected void txtFacilityAmt_TextChanged(object sender, EventArgs e)
    {
        try
        {

            //FunPriFill_Repayment_Tab(_Add);
            //FunPriFill_CashOutFlow(_Add);
            //FunPriFill_CashInFlow(_Add);
            //lblTotalOutFlowAmount.Text = "0";
            //FunPriIRRReset();
            //txtFacilityAmt.Focus();
        }
        catch (Exception ex)
        {
            Utility.FunShowAlertMsg(this, ex.Message);
        }

    }

    //protected void chkDocwithRepaymentPrint_OnCheckedChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (chkDocwithRepaymentPrint.Checked == true)
    //        {
    //            String htmlText = GetHTMLText();
    //            Guid objGuid = new Guid();
    //            string path = (Server.MapPath(".") + "\\PDF Files\\" + objGuid + DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "") + ".pdf");
    //            string strFileName = "/Origination/PDF Files/" + objGuid + DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "") + ".pdf";
    //            Document doc = new Document();
    //            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(path, FileMode.Create));
    //            doc.AddCreator("Sundaram Infotech Solutions");
    //            doc.AddTitle("New PDF Document");
    //            doc.Open();
    //            List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(htmlText), null);
    //            for (int k = 0; k < htmlarraylist.Count; k++)
    //            {
    //                doc.Add((IElement)htmlarraylist[k]);
    //            }
    //            doc.AddAuthor("S3G Team");
    //            doc.Close();

    //            Session["strPath"] = path;
    //            string strScipt = "window.open('../Common/S3GDownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Utility.FunShowAlertMsg(this, ex.Message);
    //    }
    //}


    // Code changes by Santhosh.S on 14/05/2013 to display Crystal Report
    protected void chkDocwithRepaymentPrint_OnCheckedChanged(object sender, EventArgs e)
    {
        //try
        //{
        //if (chkDocwithRepaymentPrint.Checked == true)
        //{
        //    if (ddlTemp.SelectedValue == "0")
        //    {
        //        Utility.FunShowAlertMsg(this, "Select the template");
        //        return;
        //    }


        //if (chkDocwithRepaymentPrint.Checked == true)
        //{
        //    //hdnPrint.Value = "1";
        //    GetReportData();
        //    string strScipt = "window.open('../Reports/S3gOrgPricingReport.aspx', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pricing Report", strScipt, true);
        //}
        //        string Template = string.Empty;
        //        DataSet dss = new DataSet();
        //        DataTable dt = new DataTable();
        //        Procparam = new Dictionary<string, string>();
        //        Procparam.Add("@Company_Id", CompanyId.ToString());

        //        Procparam.Add("@Lob_Id", ddlLob.SelectedValue);
        //        Procparam.Add("@Location_ID", ddlBranch.SelectedValue);
        //        Procparam.Add("@Temp_Doc_ID", ddlTemp.SelectedValue);
        //        Procparam.Add("@Template_Type_Code", "1");
        //        dt = Utility.GetDefaultData("S3G_Get_PricingTemplateCont", Procparam);
        //        Template = dt.Rows[0]["Template_Content"].ToString();



        //        FunPriPricingDetails(Convert.ToInt32(CompanyId), ddlLob.SelectedValue, Template);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    Utility.FunShowAlertMsg(this, ex.Message);
        //}
    }


    #endregion

    #region Page Methods

    private void FunProLoadCombos(int intCompany_Id)
    {
        FunPriCheckPricingStart();
        FunPriLoadAllCombos("", "enq");
        FunPriLoadAllCombos("", "sanc");
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "22");
        //ddlTenureType.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, false, new string[] { "ID", "Name" });



    }

    private void Funproloadpaytype()
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
        ObjStatus.Option = 1;
        ObjStatus.Param1 = S3G_Statu_Lookup.PAY_TO.ToString();
        Utility.FillDLL(ddlPayTo, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));
    }

    private void FunPriShowCustomerDetails()
    {
        FunPriLoadAllCombos(strCustomer_Id, "Cust");
    }

    private void FunPriLoadCustomerCode()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Option", "1");
        Procparam.Add("@Company_ID", intCompany_Id.ToString());
        DataTable dt = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);// true, "--All Customers--", new string[] { "Customer_ID", "Customer_Code", "Customer_Name" });
        System.Web.HttpContext.Current.Session["CustomerDT"] = dt;
    }

    private void FunPriLoadAllCombos(string strCustomer_Id, string strOption)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Clear();
            switch (strOption.ToLower())
            {
                case "sanc":
                    //if (ddlSanctionNumber.SelectedIndex == 0 || ddlSanctionNumber.Items.Count == 0)
                    //{
                    Procparam.Add("@Option", "2");
                    Procparam.Add("@Company_ID", intCompany_Id.ToString());
                    if (strCustomer_Id != string.Empty)
                    {
                        Procparam.Add("@Customer_ID", strCustomer_Id);
                    }
                    //ddlSanctionNumber.Items.Clear();
                    //ddlSanctionNumber.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "ID", "SANTION_NUMBER" });
                    //if (strCustomer_Id != string.Empty)
                    //{
                    //    if (ddlSanctionNumber.Items.Count == 2)
                    //    {
                    //        ddlSanctionNumber.SelectedIndex = 1;
                    //        LoadDetailsFromSanction(ddlSanctionNumber.SelectedValue, strCustomer_Id);
                    //    }
                    //}
                    //}
                    break;
                case "enq":
                    Procparam.Add("@Option", "3");
                    Procparam.Add("@Company_ID", intCompany_Id.ToString());
                    if (strCustomer_Id != string.Empty)
                    {
                        Procparam.Add("@Customer_ID", strCustomer_Id);
                    }
                    //ddlEnquiryNumber.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, true, new string[] { "Enquiry_Response_ID", "Enquiry_No" });
                    if (strCustomer_Id != string.Empty)
                    {
                        //if (ddlEnquiryNumber.Items.Count == 2)
                        //{

                        //    Procparam.Clear();
                        //    Procparam.Add("@Option", "2");
                        //    Procparam.Add("@Company_ID", intCompany_Id.ToString());
                        //    if (strCustomer_Id != string.Empty)
                        //    {
                        //        Procparam.Add("@Customer_ID", strCustomer_Id);
                        //    }
                        //    ddlSanctionNumber.Items.Clear();
                        //    ddlSanctionNumber.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "ID", "Santion_Number" });
                        //    if (ddlSanctionNumber.Items.Count == 2)
                        //    {
                        //        ddlEnquiryNumber.SelectedIndex = 1;
                        //        ddlSanctionNumber.SelectedIndex = 1;
                        //        //FunPriLoadDetailsFromEnquiry(ddlEnquiryNumber.SelectedValue, "Enqr");
                        //    }
                        //}
                    }
                    break;
                case "cust":
                    Procparam.Add("@Option", "4");
                    Procparam.Add("@Company_ID", intCompany_Id.ToString());
                    Procparam.Add("@Customer_ID", strCustomer_Id);
                    DataTable dtCustDetails = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);
                    //cmbCustomerCode.Text = dtCustDetails.Rows[0]["Customer_Code"].ToString();
                    //S3GCustomerCommAddress.SetCustomerDetails(dtCustDetails.Rows[0], true);
                    // txtCustomerAddress.Text = dtCustDetails.Rows[0]["Customer_Address"].ToString();
                    //txtConstitutionCode.Text = dtCustDetails.Rows[0]["Consitution"].ToString();
                    ViewState["ConsitutionId"] = dtCustDetails.Rows[0]["Constitution_ID"].ToString();
                    //txtCustNameAdd_Followup.Text = cmbCustomerCode.Text + System.Environment.NewLine +
                    //dtCustDetails.Rows[0]["Comm_Address1"].ToString() + System.Environment.NewLine +
                    //dtCustDetails.Rows[0]["Comm_Address2"].ToString() + System.Environment.NewLine +
                    //dtCustDetails.Rows[0]["Comm_City"].ToString() + System.Environment.NewLine +
                    //dtCustDetails.Rows[0]["Comm_State"].ToString() + System.Environment.NewLine +
                    //dtCustDetails.Rows[0]["Comm_Country"].ToString() + "-" + dtCustDetails.Rows[0]["Comm_Pincode"].ToString();

                    FunPriGetConstitutionCodeDetails(strCustomer_Id);

                    // FunPriLoadPreDisbursementDocument();

                    break;

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in loading Combos");
        }

    }

    private bool FunPriCheckIsPageValid()
    {
        bool returnValue = true;
        try
        {
            if (hdnLobCode.Value.ToUpper() == "HP" || hdnLobCode.Value.ToUpper() == "TL")
            {

                if (((DataTable)ViewState["PDC"]).Rows.Count == 0 || ((DataTable)ViewState["PDC"]).Select("Sno=-1").ToArray().Length > 0)
                {
                    //Utility.FunShowAlertMsg(this, "PDC Deatils Mandatory");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 8);
                    //txtNoPDC.Focus();
                    return false;
                }
            }

            if (((DataTable)ViewState["PDC"]).Rows.Count > 0)
            {
                DataTable dt = ((DataTable)ViewState["PDC"]);
                DataRow[] dr = dt.Select("PDC_Type_Id=2");
                if (dr.Length > 0)
                {
                    if (txtNoPDC.Text == string.Empty)
                    {
                        Utility.FunShowAlertMsg(this, "Enter the No of PDC in Main Tab");
                        return false;
                    }
                    if (Convert.ToInt32(txtNoPDC.Text) == 0)
                    {
                        Utility.FunShowAlertMsg(this, "No of PDC Should be Greater Than Zero");
                        return false;
                    }

                    if (txtPDCstDate.Text == string.Empty)
                    {
                        Utility.FunShowAlertMsg(this, "Enter the PDC Start Date in Main Tab");
                        return false;
                    }

                    int imaxPdc = Convert.ToInt32(dr.CopyToDataTable().Compute("max(Ins_End)", "1=1"));
                    if (imaxPdc > 0)
                    {
                        if (imaxPdc != Convert.ToInt32(txtNoPDC.Text))
                        {
                            Utility.FunShowAlertMsg(this, "Installment breakup does not match with the no.of installments or number of PDC in main tab");
                            return false;
                        }
                    }
                    //if (Convert.ToInt32(txtNoPDC.Text) != Convert.ToInt32(txtTenure.Text))
                    //{
                    //    Utility.FunShowAlertMsg(this, "Count of PDC is not equal to tenure in main Tab");
                    //    return false;
                    //}
                }
            }



            //if (ddlStatus.SelectedValue == "7")
            //{

            if (ddlLob.SelectedItem.Text.Contains("HP"))
            {
                if (gvAssetDetails.Rows.Count == 0)
                {
                    //Utility.FunShowAlertMsg(this, "Asset Details Mandatory");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 9);
                    return false;
                }
                if (((DataTable)ViewState["DtAlertDetails"]).Rows.Count == 0)
                {
                    //Utility.FunShowAlertMsg(this, "Alert Details Mandatory");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 11);
                    return false;
                }
            }
            else
            {
                if (txtFacilityAmt.Text == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Enter the LPO Amount in Main Tab");
                    return false;
                }
                if (Convert.ToDecimal(txtFacilityAmt.Text) == 0)
                {
                    Utility.FunShowAlertMsg(this, "LPO Amount Should be greater than the zero in Main Tab");
                    return false;
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Due to Data Problem,Unable to Save";
            cvPricing.IsValid = false;
            returnValue = false;
            return false;

        }
        return returnValue;
    }


    private DataTable FunPriGetCheckListDetails()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_Id.ToString());
        Procparam.Add("@Pricing_ID", intPricingId.ToString());
        DataSet ds = Utility.GetDataset("S3G_LAD_GET_PRE_DOCS_RPT", Procparam);// true, "--All Customers--", new string[] { "Customer_ID", "Customer_Code", "Customer_Name" });

        DataTable dtCheckDetails = ds.Tables["ListTable"];

        return dtCheckDetails;


    }


    private DataTable FunPriGetChargeDetails()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_Id.ToString());
        Procparam.Add("@Pricing_ID", intPricingId.ToString());
        DataSet ds = Utility.GetDataset("S3G_ORG_GetPricing_Charges", Procparam);// true, "--All Customers--", new string[] { "Customer_ID", "Customer_Code", "Customer_Name" });

        DataTable dtAnyOtherCharges = ds.Tables["ListTable"];
        DataTable dtProcessingFee = ds.Tables["Table1"];

        decimal dcAnyOtherCharges = (dtAnyOtherCharges.Rows[0]["AnyOtherCharges_Dec"].ToString() == "") ? 0 : (Decimal)dtAnyOtherCharges.Rows[0]["AnyOtherCharges_Dec"];
        decimal dcProcessingFee = (dtProcessingFee.Rows[0]["ProcessingFee_Dec"].ToString() == "") ? 0 : (Decimal)dtProcessingFee.Rows[0]["ProcessingFee_Dec"];


        DataTable dtDecimal = new DataTable();
        dtDecimal.Columns.Add("AnyOtherCharges_Dec");
        dtDecimal.Columns.Add("ProcessingFee_Dec");

        DataRow dRow = dtDecimal.NewRow();
        dRow["AnyOtherCharges_Dec"] = dcAnyOtherCharges;
        dRow["ProcessingFee_Dec"] = dcProcessingFee;

        dtDecimal.Rows.Add(dRow);
        return dtDecimal;


    }


    //private decimal FunPriGetInterestAmount()
    //{
    /*decimal decFinAmount = FunPriGetAmountFinanced();
    decimal decRate = 0;

    switch (ddl_Return_Pattern.SelectedValue)
    {
        case "1":
            decRate = Convert.ToDecimal(txtRate.Text);
            break;
        case "2":
            if (ViewState["decRate"] != null)
            {
                decRate = Convert.ToDecimal(ViewState["decRate"].ToString());
            }
            break;
    }
    string strLOB = ddlLob.SelectedItem.Text.Split('-')[0].ToString().Trim().ToLower();
    switch (strLOB)
    {
        case "tl":
        case "te":
            if (ddl_Repayment_Mode.SelectedValue == "5")
            {
                decRate = 0;
            }
            break;
        case "ft":
        case "wc":
            decRate = 0;
            break;
    }

    return Math.Round(S3GBusEntity.CommonS3GBusLogic.FunPubInterestAmount(ddlTenureType.SelectedItem.Text.ToLower(), decFinAmount, decRate, int.Parse(txtTenure.Text)), 0);
     */
    //decimal decFinAmount = FunPriGetAmountFinanced();
    //decimal decUMFC = 0;
    //if (!string.IsNullOrEmpty(lblTotalAmount.Text))
    //{
    //    string strTotalAmount = (lblTotalAmount.Text.Split(':').Length > 1) ? lblTotalAmount.Text.Split(':')[1].Trim() : "";
    //    if (strTotalAmount != "")
    //    {
    //        decimal decTotalRepayable = Convert.ToDecimal(strTotalAmount);
    //        decUMFC = decTotalRepayable - decFinAmount;
    //    }
    //}
    // return decUMFC;
    // }
    //private decimal FunPriGetInterestAmountUMCVal()
    //{
    //    /*decimal decFinAmount = FunPriGetAmountFinanced();
    //    decimal decRate = 0;

    //    switch (ddl_Return_Pattern.SelectedValue)
    //    {
    //        case "1":
    //            decRate = Convert.ToDecimal(txtRate.Text);
    //            break;
    //        case "2":
    //            if (ViewState["decRate"] != null)
    //            {
    //                decRate = Convert.ToDecimal(ViewState["decRate"].ToString());
    //            }
    //            break;
    //    }
    //    string strLOB = ddlLob.SelectedItem.Text.Split('-')[0].ToString().Trim().ToLower();
    //    switch (strLOB)
    //    {
    //        case "tl":
    //        case "te":
    //            if (ddl_Repayment_Mode.SelectedValue == "5")
    //            {
    //                decRate = 0;
    //            }
    //            break;
    //        case "ft":
    //        case "wc":
    //            decRate = 0;
    //            break;
    //    }

    //    return Math.Round(S3GBusEntity.CommonS3GBusLogic.FunPubInterestAmount(ddlTenureType.SelectedItem.Text.ToLower(), decFinAmount, decRate, int.Parse(txtTenure.Text)), 0);
    //     */
    //    decimal decFinAmount = FunPriGetAmountFinanced();
    //    decimal decUMFC = 0;
    //    if (!string.IsNullOrEmpty(lblTotalAmount.Text))
    //    {
    //        string strTotalAmount = (lblTotalAmount.Text.Split(':').Length > 1) ? lblTotalAmount.Text.Split(':')[1].Trim() : "";
    //        if (strTotalAmount != "")
    //        {
    //            decimal decTotalRepayable = Convert.ToDecimal(strTotalAmount);
    //            decUMFC = decTotalRepayable - Math.Round(decFinAmount,0);
    //        }
    //    }
    //    return decUMFC;
    //}

    //private decimal FunPriGetStructureAdhocInterestAmount()
    //{
    //decimal decFinAmount = FunPriGetAmountFinanced();
    //decimal decRate = 0;
    //decRate = Convert.ToDecimal(txtRate.Text);

    //switch (ddl_Return_Pattern.SelectedValue)
    //{
    //    case "1":
    //        decRate = Convert.ToDecimal(txtRate.Text);
    //        break;
    //    case "2":
    //        if (ViewState["decRate"] != null)
    //        {
    //            decRate = Convert.ToDecimal(ViewState["decRate"].ToString());
    //        }
    //        break;
    //    case "3": //RepaymentType.PMPT:
    //        return ((Math.Round(((decFinAmount / 1000) * decRate) /
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString()), 0) *
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString())) *
    //            //int.Parse(txtTenure.Text)) - decFinAmount;
    //        break;
    //    case "4": //RepaymentType.PMPL:
    //        return ((Math.Round(((decFinAmount / 100000) * decRate) /
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString()), 0) *
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString())) *
    //            //int.Parse(txtTenure.Text)) - decFinAmount;
    //        break;
    //    case "5": //RepaymentType.PMPM:
    //        return ((Math.Round(((decFinAmount / 1000000) * decRate) /
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString()), 0) *
    //            Convert.ToDecimal(hdnRoundOff.Value.ToString())) *
    //            int.Parse(txtTenure.Text)) - decFinAmount;
    //        break;
    //    default:
    //        decRate = Convert.ToDecimal(txtRate.Text);
    //        break;
    //}
    //string strLOB = ddlLob.SelectedItem.Text.Split('-')[0].ToString().Trim().ToLower();
    //switch (strLOB)
    //{
    //    case "tl":
    //    case "te":
    //        if (ddl_Repayment_Mode.SelectedValue == "5")
    //        {
    //            decRate = 0;
    //        }
    //        break;
    //    case "ft":
    //    case "wc":
    //        decRate = 0;
    //        break;
    //}

    //return Math.Round(S3GBusEntity.CommonS3GBusLogic.FunPubInterestAmount(ddlTenureType.SelectedItem.Text.ToLower(), decFinAmount, decRate, int.Parse(txtTenure.Text)), 0);
    //}

    // Removed By Shibu 17-Sep-2013 Branch List 
    //private void FunPriLoadLObandBranch(int intUser_id, int intCompany_id)
    //{
    //    try
    //    {
    //        Dictionary<string, string> Procparam = new Dictionary<string, string>();
    //        Procparam.Clear();
    //        Procparam.Add("@Is_Active", "1");
    //        Procparam.Add("@User_Id", intUser_id.ToString());
    //        Procparam.Add("@Company_ID", intCompany_id.ToString());
    //        if (ViewState["ConsitutionId"] != null)
    //        {
    //            Procparam.Add("@Consitution_Id", ViewState["ConsitutionId"].ToString());
    //        }
    //        Procparam.Add("@Program_Id", "42");
    //        ddlLob.BindDataTable(SPNames.LOBMaster, Procparam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
    //        Procparam.Remove("@Consitution_Id");
    //        //  ddlBranch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, new string[] { "Branch_ID", "Branch_Code", "Branch_Name" });
    //        //FunpriloadLocation();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in loading Lob/Location");
    //    }
    //}
    // Removed By Shibu 17-Sep-2013 Branch List 
    //private void FunpriloadLocation()
    //{
    //    Dictionary<string, string> Procparam = new Dictionary<string, string>();
    //    Procparam.Clear();
    //    Procparam.Add("@Is_Active", "1");
    //    Procparam.Add("@User_Id", intUserId.ToString());
    //    Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //    if (ddlLob.SelectedIndex > 0)
    //        Procparam.Add("@Lob_Id", ddlLob.SelectedValue);
    //    Procparam.Add("@Program_Id", "42");
    //    //ddlBranch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, new string[] { "Location_ID", "Location" });
    //}

    private void FunProPageLoad(string strLoadMode)
    {

        if (intPricingId == 0)
        {
            hdnPricingId.Value = intPricingId.ToString();
            FunProLoadCheckListDetails(intCompany_Id);

            //FunPubLoadAssetCategories(intCompany_Id, null, null, "Class Code");
            //funPriVoidLoadAssetCategory();
            //funPriLoadCommonLookup();
            //funPriVoidLoadAssetModalDetails();
            //S3GCustomerCommAddress.BindAddressSetupDetails(1);
            FunPriLoadTenureType();
            funPriLoadProduct();
            //FunPriLoad_AssetDetails(_Add);
            FunPriFill_Alert_Tab(_Add);
            funPrivLoadPDCGrid();
            //funPrivLoadDownPaymentGrid();
            ddlPayTo_SelectedIndexChanged(null, null);
            if (Session["EnqNewCustomerId"] != null)
            {
                intEnqNewCustomerId = Convert.ToInt32(Utility.Load("EnqNewCustomerId", ""));
                //if (intEnqNewCustomerId > 0)
                //{
                //    FunPriLoadAddressDetails(intEnqNewCustomerId);
                //}

            }
            FunPriGetConstitutionCodeDetails(strCustomer_Id);


        }
    }
    protected void chkCategoryCode_CheckedChanged(object sender, EventArgs e)
    {
        //CheckBox chk = (CheckBox)sender;
        //if (ddlAssetType.SelectedValue == "0")
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Asset Type");
        //    ddlAssetType.Focus();
        //    chk.Checked = false;
        //    return;
        //}
        //if (ddlPurpose.SelectedValue == "0")
        //{
        //    Utility.FunShowAlertMsg(this, "Select the Purpose");
        //    ddlPurpose.Focus();
        //    chk.Checked = false;
        //    return;
        //}
        //string strFieldAtt = ((CheckBox)sender).ClientID;

        //if (((CheckBox)sender).Checked)
        //{
        //    if (strFieldAtt.Contains("grvAssetClassCodes"))
        //    {
        //        FunGridUncheckAll(grvAssetClassCodes);
        //    }
        //    if (strFieldAtt.Contains("grvAssetMakeCodes"))
        //    {
        //        FunGridUncheckAll(grvAssetMakeCodes);
        //    }
        //    if (strFieldAtt.Contains("grvAssetTypeCodes"))
        //    {
        //        FunGridUncheckAll(grvAssetTypeCodes);
        //    }
        //    if (strFieldAtt.Contains("grvAssetModelCodes"))
        //    {
        //        FunGridUncheckAll(grvAssetModelCodes);
        //    }
        //    ((CheckBox)sender).Checked = true;
        //    FunPriFormAssetCode(strFieldAtt);
        //    //ddlAssetType_SelectedIndexChanged(null, null);
        //}
        //else
        //{
        //    FunPriResetValues("0", strFieldAtt);
        //}
    }

    private void FunGridUncheckAll(GridView grv)
    {
        foreach (GridViewRow grvRow in grv.Rows)
        {
            CheckBox chkBox = (CheckBox)grvRow.FindControl("chkCategoryCode");
            chkBox.Checked = false;
        }
    }
    protected void ddlPurpose_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //FunPriGetAssetCode();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void funPriClearAssetValues()
    {
        try
        {
            DataSet dsGetCheckListDetails = new DataSet();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@OPTION", "8");
            strProParm.Add("@COMPANYID", intCompany_Id.ToString());
            strProParm.Add("@USERID", intUserId.ToString());
            strProParm.Add("@PROGRAMID", intProgramId.ToString());
            strProParm.Add("@Page_Mode", "C");
            strProParm.Add("@PRICING_ID", intPricingId.ToString());
            dsGetCheckListDetails = Utility.GetDataset("S3G_OR_LOAD_LOV", strProParm);
            funPriBindAssetGridViewPaging();
            funPriBindDocGridViewPaging();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void FunProLoadCheckListDetails(int intCompany_Id)
    {
        try
        {
            DataSet dsGetCheckListDetails = new DataSet();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@OPTION", "1");
            strProParm.Add("@COMPANYID", intCompany_Id.ToString());
            strProParm.Add("@USERID", intUserId.ToString());
            strProParm.Add("@PROGRAMID", intProgramId.ToString());
            strProParm.Add("@Page_Mode", "C");
            strProParm.Add("@PRICING_ID", intPricingId.ToString());
            dsGetCheckListDetails = Utility.GetDataset("S3G_OR_LOAD_LOV", strProParm);
            ViewState["OR_LOAD_LOV"] = dsGetCheckListDetails;
            if (dsGetCheckListDetails.Tables.Count > 0)
            {
                if (dsGetCheckListDetails.Tables[0].Rows.Count > 0)
                {
                    ddlLob.FillDataTable(dsGetCheckListDetails.Tables[0], "LOB_ID", "LOB_NAME");
                    ViewState["LOB"] = dsGetCheckListDetails.Tables[0];
                    ddlLob.ToUpper();
                    FunPriLoadLocation(intCompany_Id, intUserId, intProgramId, 0);
                    FunPriLoadSubLocation(intCompany_Id, intUserId, cmbLocation.SelectedValue, 1);
                }
                //if (dsGetCheckListDetails.Tables[1].Rows.Count > 0)
                //{
                //    ddlAppraisalType.FillDataTable(dsGetCheckListDetails.Tables[1], "VALUE", "NAME");
                //}
                if (dsGetCheckListDetails.Tables[2].Rows.Count > 0)
                {
                    ddlContType.FillDataTable(dsGetCheckListDetails.Tables[2], "VALUE", "NAME");
                }
                if (dsGetCheckListDetails.Tables[3].Rows.Count > 0)
                {
                    ddlDealType.FillDataTable(dsGetCheckListDetails.Tables[3], "VALUE", "NAME");
                }
                if (dsGetCheckListDetails.Tables[4].Rows.Count > 0)
                {
                    ViewState["PDCType"] = dsGetCheckListDetails.Tables[4];

                }
                if (dsGetCheckListDetails.Tables[5].Rows.Count > 0)
                {
                    //ddlBank.FillDataTable(dsGetCheckListDetails.Tables[5], "BANK_CODE", "BANK_NAME");
                    ViewState["Bank"] = dsGetCheckListDetails.Tables[5];
                }
                if (dsGetCheckListDetails.Tables[6].Rows.Count > 0)
                {
                    //ddlBankBranch.FillDataTable(dsGetCheckListDetails.Tables[6], "BANKBRANCH_CODE", "BANKBRANCH_NAME");
                    //ViewState["BankBranch"] = dsGetCheckListDetails.Tables[6];
                }
                if (dsGetCheckListDetails.Tables[7].Rows.Count > 0)
                {
                    ddlStatus.FillDataTable(dsGetCheckListDetails.Tables[7], "VALUE", "NAME");
                    if (intPricingId == 0)
                    {
                        ddlStatus.SelectedValue = "1";//In Pending
                        ddlStatus.Enabled = false;
                    }

                }
                if (dsGetCheckListDetails.Tables[8].Rows.Count > 0)
                {
                    ddlInsuranceby.Items.Clear();
                    ddlInsuranceby.FillDataTable(dsGetCheckListDetails.Tables[8], "VALUE", "NAME");

                }
                if (dsGetCheckListDetails.Tables[9].Rows.Count > 0)
                {
                    ddlInsuranceCoverage.FillDataTable(dsGetCheckListDetails.Tables[9], "VALUE", "NAME");

                }
                if (dsGetCheckListDetails.Tables[10].Rows.Count > 0)
                {
                    strDocpath = dsGetCheckListDetails.Tables[10].Rows[0]["DOCUMENT_PATH"].ToString();

                }
                if (dsGetCheckListDetails.Tables[11].Rows.Count > 0)
                {
                    ddlAssetType.FillDataTable(dsGetCheckListDetails.Tables[11], "VALUE", "NAME");
                }
                if (dsGetCheckListDetails.Tables[12].Rows.Count > 0)
                {
                    ddlLanguage.FillDataTable(dsGetCheckListDetails.Tables[12], "VALUE", "NAME");
                }
                if (dsGetCheckListDetails.Tables[13].Rows.Count > 0)
                {
                    ViewState["Offer_Validity"] = dsGetCheckListDetails.Tables[13].Rows[0]["OFFER_VALIDITY"].ToString();

                }
                else
                {
                    Utility.FunShowAlertMsg(this, "Set the Offer Validity in Orgination GPS");
                }
                if (dsGetCheckListDetails.Tables[14].Rows.Count > 0)
                {
                    ViewState["IMPLEMENTATIONDATE"] = dsGetCheckListDetails.Tables[14].Rows[0]["OD_DATE_OF_INCORPORATION"].ToString();

                }
                //ddlTemplateType_SelectedIndexChanged(null, null);
                //if (dsGetCheckListDetails.Tables[13].Rows.Count > 0)
                //{
                //    ddlTemplateType.FillDataTable(dsGetCheckListDetails.Tables[13], "VALUE", "NAME");
                //}

            }
            //txtStatus.Text = "Processing";
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    private object DeSerialize(byte[] byteObj)
    {
        return ClsPubSerialize.DeSerialize(byteObj, SerializationMode.Binary, null);
    }
    //public void FunPriLoadBranch(int CompanyId, int UserId, string Region_Id, bool Is_active)
    //{
    //    try
    //    {

    //        objSerClient = new ReportAccountsMgtServicesClient();
    //        string Region = string.Empty;
    //        cmbLocation.Items.Clear();
    //        if (cmbLocation.SelectedIndex != 0)
    //        {
    //            Region = cmbLocation.SelectedValue;
    //        }
    //        byte[] byteLobs = objSerClient.FunPubGetRegBranch(CompanyId, UserId, Region, true);
    //        List<ClsPubDropDownList> Branch = (List<ClsPubDropDownList>)DeSerialize(byteLobs);
    //        cmbLocation.DataSource = Branch;
    //        cmbLocation.DataTextField = "Description";
    //        cmbLocation.DataValueField = "ID";
    //        cmbLocation.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //    finally
    //    {
    //        objSerClient.Close();
    //    }
    //}


    private void FunPriLoadLocation(int CompanyId, int UserId, int ProgramId, int LobId)
    {
        try
        {

            DataTable dt = new DataTable();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@COMPANY_ID", intCompany_Id.ToString());
            strProParm.Add("@USER_ID", intUserId.ToString());
            strProParm.Add("@PROGRAM_ID", intProgramId.ToString());
            strProParm.Add("@LOB_ID", ddlLob.SelectedValue);
            strProParm.Add("@IS_ACTIVE", "1");
            strProParm.Add("@OPTION", "1");
            dt = Utility.GetDefaultData("S3G_GET_LOCATION ", strProParm);
            cmbLocation.FillDataTable(dt, "BRANCH_ID", "BRANCH");
            if (dt.Rows.Count == 1)
            {
                cmbLocation.SelectedValue = dt.Rows[0]["BRANCH_ID"].ToString();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {

        }
    }

    /// <summary>
    /// Get IRR Details From Global Paramater Setup
    /// </summary>
    //private void FunProGetIRRDetails()
    //{
    //    try
    //    {
    //        DataTable dtIRRDetails = Utility.FunPubGetGlobalIRRDetails(intCompany_Id, null);
    //        ViewState["IRRDetails"] = dtIRRDetails;
    //        if (dtIRRDetails.Rows.Count > 0)
    //        {
    //            //Added by Thangam on 19-Jun-2012 to solve modify mode round off issue
    //            ViewState["hdnRoundOff"] = dtIRRDetails.Rows[0]["Roundoff"].ToString();
    //            S3GBusEntity.CommonS3GBusLogic.GPSRoundOff = Convert.ToInt32(ViewState["hdnRoundOff"].ToString());

    //            if (dtIRRDetails.Rows[0]["IsIRRApplicable"].ToString() == "True")
    //            {
    //                txtAccIRR.Visible = true;
    //                lblAccIRR.Visible = true;
    //                txtCompanyIRR.Visible = true;
    //                lblCompanyIrr.Visible = true;

    //                txtCompanyIRR_Repay.Visible = true;
    //                lblCompanyIRR_Repay.Visible = true;
    //                rfvCompanyIRR.Enabled = true;
    //                txtAccountIRR_Repay.Visible = true;
    //                lblAccountIRR_Repay.Visible = true;
    //                rfvAccountingIRR.Enabled = true;
    //            }
    //            else
    //            {
    //                txtAccIRR.Visible = false;
    //                lblAccIRR.Visible = false;
    //                txtCompanyIRR.Visible = false;
    //                lblCompanyIrr.Visible = false;

    //                txtCompanyIRR_Repay.Visible = false;
    //                lblCompanyIRR_Repay.Visible = false;
    //                rfvCompanyIRR.Enabled = false;
    //                txtAccountIRR_Repay.Visible = false;
    //                lblAccountIRR_Repay.Visible = false;
    //                rfvAccountingIRR.Enabled = false;
    //            }
    //        }
    //        else
    //        {
    //            strAlert = strAlert.Replace("__ALERT__", "Define start up screen in GlobalParameter setup");
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
    //            return;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in fetching Global IRR Details");
    //    }
    //}

    //private void FunPriLoadDetailsFromEnquiry(string strEnquiryId, string type)
    //{
    //    try
    //    {
    //        Procparam = new Dictionary<string, string>();
    //        Procparam.Clear();
    //        Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //        Procparam.Add("@Enquiry_Response_ID", strEnquiryId);
    //        //if (Session["EnquiryNumber"] == null)
    //        //{
    //        Procparam.Add("@IsCheckRequired", "1");
    //        //}
    //        DataSet ds_EnqDetails = null;

    //        try
    //        {
    //            ds_EnqDetails = Utility.GetDataset("S3G_ORG_GetEnQuiryResponseDetails", Procparam);
    //            if (ds_EnqDetails.Tables.Count > 0)
    //            {
    //                if (ds_EnqDetails.Tables[0].Columns.Contains("No_Data_Found") == true && ds_EnqDetails.Tables[0].Rows[0]["No_Data_Found"].ToString() == "No_Data_Found" && Session["EnqNewCustomerId"] == null)
    //                {
    //                    Utility.FunShowAlertMsg(this, "Customer details not found.Map an existing customer or Create a new customer");
    //                    rfvCustomerCode.Enabled = false;
    //                    Session["EnquiryLoaded"] = true;
    //                    ViewState["CR_VALUE"] = ds_EnqDetails.Tables[0].Rows[0]["CR_VALUE"].ToString();

    //                }
    //                else
    //                {
    //                    rfvCustomerCode.Enabled = true;
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //            if (type == "Enqr")
    //            {
    //                cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message;
    //                cvPricing.IsValid = false;
    //            }
    //            else
    //            {
    //                cvPricing.ErrorMessage = strErrorMessagePrefix + ex.Message.Replace("Enquiry", "Sanction");
    //                cvPricing.IsValid = false;

    //            }
    //            return;
    //        }
    //        cmbCustomerCode.Attributes.Add("readonly", "readonly");
    //        btnCreateCustomer.Enabled = false;
    //        rfvCustomerCode.Enabled = false;
    //        if (type == "Sanc")
    //        {
    //            FunPriLoadAllCombos("", "enq");
    //            ddlEnquiryNumber.SelectedValue = strEnquiryId;
    //            ddlEnquiryNumber.Enabled = false;
    //        }
    //        if (type == "Enqr")
    //        {
    //            ddlSanctionNumber.Enabled = false;
    //        }

    //        Procparam = new Dictionary<string, string>();
    //        Procparam.Add("@Option", "21");
    //        Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //        bool blnCanChageROI = Convert.ToBoolean(Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam).Rows[0]["Is_Program"].ToString());

    //        txtConstitutionCode.Text = ds_EnqDetails.Tables[0].Rows[0]["Consitution"].ToString();
    //        if (ds_EnqDetails != null)
    //        {
    //            txtEnquiryDate.Text = Convert.ToDateTime(ds_EnqDetails.Tables[0].Rows[0]["Response_Date"].ToString()).ToString(strDateFormat);
    //            //txtEnquiry_Followup.Text = ds_EnqDetails.Tables[0].Rows[0]["Enquiry_No"].ToString();
    //            txtFacilityAmt.Text = Convert.ToDecimal(ds_EnqDetails.Tables[0].Rows[0]["Finance_Amount_Sought"].ToString()).ToString();//5366
    //            txtTenure.Text = ds_EnqDetails.Tables[0].Rows[0]["Tenure"].ToString();

    //            #region LOB/Product/Branch/Customer
    //            ddlLob.Items.Clear();
    //            System.Web.UI.WebControls.ListItem lstItem;
    //            lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[0].Rows[0]["LOB"].ToString(), ds_EnqDetails.Tables[0].Rows[0]["LOB_ID"].ToString());
    //            ddlLob.Items.Add(lstItem);

    //            ddlProduct.Items.Clear();
    //            lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[0].Rows[0]["PRODUCT"].ToString(), ds_EnqDetails.Tables[0].Rows[0]["PRODUCT_ID"].ToString());
    //            ddlProduct.Items.Add(lstItem);

    //            ddlBranch.Clear();
    //            // Removed By Shibu 17-Sep-2013 Branch List
    //            //lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[0].Rows[0]["Branch"].ToString(), ds_EnqDetails.Tables[0].Rows[0]["Branch_ID"].ToString());
    //            //lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[0].Rows[0]["Location"].ToString(), ds_EnqDetails.Tables[0].Rows[0]["Location_ID"].ToString());
    //            //ddlBranch.Items.Add(lstItem);
    //            // Added By Shibu 17-Sep-2013 Branch List(Auto Suggestion
    //            ddlBranch.SelectedValue = ds_EnqDetails.Tables[0].Rows[0]["Location_ID"].ToString();
    //            ddlBranch.SelectedText = ds_EnqDetails.Tables[0].Rows[0]["Location"].ToString();
    //            //txtBranch_Followup.Text = ds_EnqDetails.Tables[0].Rows[0]["Branch"].ToString();
    //            //txtBranch_Followup.Text = ds_EnqDetails.Tables[0].Rows[0]["Location"].ToString();

    //            //txtCustomerAddress.Text = ds_EnqDetails.Tables[0].Rows[0]["Customer_Address"].ToString();
    //            S3GCustomerCommAddress.SetCustomerDetails(ds_EnqDetails.Tables[0].Rows[0], true);

    //            cmbCustomerCode.Text = Convert.ToString(ds_EnqDetails.Tables[0].Rows[0]["Customer"].ToString());//+ ","+ ds_EnqDetails.Tables[0].Rows[0]["Customer_ID"].ToString());

    //            hdnCustID.Value = ds_EnqDetails.Tables[0].Rows[0]["Customer_Id"].ToString();

    //            txtAccIRR.Text = ds_EnqDetails.Tables[0].Rows[0]["Repay_Accounting_IRR"].ToString();
    //            txtBusinessIRR.Text = ds_EnqDetails.Tables[0].Rows[0]["Repay_Business_IRR"].ToString();
    //            txtCompanyIRR.Text = ds_EnqDetails.Tables[0].Rows[0]["Repay_Company_IRR"].ToString();
    //            #endregion

    //            ddlLob.Enabled = true;
    //            ddlBranch.Enabled = true;
    //            ddlProduct.Enabled = true;

    //            FunPriGetConstitutionCodeDetails(ds_EnqDetails.Tables[0].Rows[0]["Customer_Id"].ToString());



    //            #region ROI Rules
    //            ddlROIRuleList.Items.Clear();
    //            if (ds_EnqDetails.Tables[3].Rows.Count > 0)
    //            {
    //                if (blnCanChageROI)
    //                {
    //                    Procparam = new Dictionary<string, string>();
    //                    Procparam.Add("@Is_Active", "1");
    //                    Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //                    Procparam.Add("@LOB_ID", ds_EnqDetails.Tables[0].Rows[0]["LOB_ID"].ToString());
    //                    Procparam.Add("@Option", "7");
    //                    ddlROIRuleList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "ROI_Rules_ID", "ROI_Rule_Number", "Model_Description" });
    //                    //
    //                    //hdnROIRule.Value = ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString();
    //                    lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[3].Rows[0]["ROI_Number"].ToString(), ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString());
    //                    if (!ddlROIRuleList.Items.Contains(lstItem))
    //                    {
    //                        ddlROIRuleList.Items.Add(lstItem);
    //                    }
    //                    ddlROIRuleList.SelectedValue = ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString();
    //                    hdnROIRule.Value = ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString();
    //                    btnFetchROI.Visible = true;

    //                }
    //                else
    //                {
    //                    lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[3].Rows[0]["ROI_Number"].ToString(), ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString());
    //                    ddlROIRuleList.Items.Add(lstItem);
    //                    hdnROIRule.Value = ds_EnqDetails.Tables[3].Rows[0]["ROI_Rules_ID"].ToString();
    //                    btnFetchROI.Visible = false;
    //                }
    //                ViewState["ROIRules"] = ds_EnqDetails.Tables[3];
    //                FunPriFill_OfferTab(_Add);
    //                FunPriLoad_ROIRule(_Edit);
    //                div7.Visible = true;
    //            }
    //            else
    //            {
    //                if (blnCanChageROI)
    //                {
    //                    Procparam = new Dictionary<string, string>();
    //                    Procparam.Add("@Is_Active", "1");
    //                    Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //                    Procparam.Add("@LOB_ID", ds_EnqDetails.Tables[0].Rows[0]["LOB_ID"].ToString());
    //                    Procparam.Add("@Option", "7");
    //                    ddlROIRuleList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "ROI_Rules_ID", "ROI_Rule_Number", "Model_Description" });
    //                }
    //            }
    //            #endregion

    //            #region Payment Rules
    //            ddlPaymentRuleList.Items.Clear();
    //            if (ds_EnqDetails.Tables[4].Rows.Count > 0)
    //            {
    //                lstItem = new System.Web.UI.WebControls.ListItem(ds_EnqDetails.Tables[4].Rows[0]["Payment_Rule_Number"].ToString(), ds_EnqDetails.Tables[4].Rows[0]["Payment_RuleCard_ID"].ToString());
    //                ddlPaymentRuleList.Items.Add(lstItem);
    //                hdnPayment.Value = ds_EnqDetails.Tables[4].Rows[0]["Payment_RuleCard_ID"].ToString();
    //                FunPriLoad_PaymentRule();
    //                div7.Visible = true;
    //                div8.Visible = true;
    //                btnFetchPayment.Visible = false;
    //            }

    //            else
    //            {
    //                FunPriBindPaymentDDL("0");
    //            }

    //            #endregion

    //            #region Inflow Details
    //            if (ds_EnqDetails.Tables[1].Rows.Count > 0)
    //            {
    //                gvInflow.DataSource = ds_EnqDetails.Tables[1];
    //                gvInflow.DataBind();
    //                ViewState["DtCashFlow"] = ds_EnqDetails.Tables[1];
    //                FunPriFill_CashInFlow(_Edit);
    //            }
    //            #endregion

    //            #region Repayment Details
    //            if (ds_EnqDetails.Tables[5].Rows.Count > 0)
    //            {
    //                gvRepaymentDetails.DataSource = ds_EnqDetails.Tables[5];
    //                gvRepaymentDetails.DataBind();
    //                ((LinkButton)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lnRemoveRepayment")).Visible = true;
    //                TextBox txtFromInstallment_RepayTab1_upd = gvRepaymentDetails.FooterRow.FindControl("txtFromInstallment_RepayTab") as TextBox;
    //                Label lblToInstallment_Upd = (Label)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lblToInstallment_RepayTab");
    //                txtFromInstallment_RepayTab1_upd.Text = Convert.ToString(Convert.ToDecimal(lblToInstallment_Upd.Text.Trim()) + Convert.ToInt32("1"));

    //                ViewState["DtRepayGrid"] = ds_EnqDetails.Tables[5];
    //                FunPriFill_Repayment_Tab(_Edit);
    //            }
    //            #endregion

    //            #region Alert Details
    //            if (ds_EnqDetails.Tables[6].Rows.Count > 0)
    //            {
    //                gvAlert.DataSource = ds_EnqDetails.Tables[6];
    //                gvAlert.DataBind();
    //                ViewState["DtAlertDetails"] = ds_EnqDetails.Tables[6];
    //                FunPriFill_Alert_Tab(_Edit);
    //            }
    //            else
    //            {
    //                FunPriFill_Alert_Tab(_Add);
    //            }
    //            #endregion

    //            #region FollowUp
    //            //txtEnquiry_Followup.Text = ds_EnqDetails.Tables[7].Rows[0]["Enquiry_Number"].ToString();
    //            //txtOfferNo_Followup.Text = ds_EnqDetails.Tables[7].Rows[0]["Offer_Number"].ToString();
    //            //txtApplication_Followup.Text = ds_EnqDetails.Tables[7].Rows[0]["Application_Number"].ToString();
    //            //txtEnquiryDate_Followup.Text = Convert.ToDateTime(ds_EnqDetails.Tables[7].Rows[0]["Date"].ToString()).ToString(strDateFormat);
    //            //txtCustNameAdd_Followup.Text = Convert.ToString(ds_EnqDetails.Tables[0].Rows[0]["Customer"].ToString()) + System.Environment.NewLine + ds_EnqDetails.Tables[0].Rows[0]["Customer_Address"].ToString();
    //            //if (ds_EnqDetails.Tables[8].Rows.Count > 0)
    //            //{
    //            //    gvFollowUp.DataSource = ds_EnqDetails.Tables[8];
    //            //    gvFollowUp.DataBind();
    //            //    ViewState["DtFollowUp"] = ds_EnqDetails.Tables[8];
    //            //    FunPriFillFollowUp_Tab(_Edit);
    //            //}
    //            //else
    //            //{
    //            //    FunPriFillFollowUp_Tab(_Add);
    //            //}
    //            #endregion

    //            FunPriLOBBasedvalidations(ddlLob.SelectedItem.Text, ddlLob.SelectedItem.Value, _Edit);
    //            //txtFacilityAmt.ReadOnly = true;
    //            if (ds_EnqDetails.Tables[9].Rows.Count > 0)
    //            {
    //                lblTotalOutFlowAmount.Text = ds_EnqDetails.Tables[9].Rows[0].ItemArray[0].ToString();
    //            }

    //            if (type == "Enqr")
    //            {
    //                // ddlSanctionNumber.Items.Clear();
    //                if (ddlSanctionNumber.Items.Count > 0)
    //                {
    //                    //ddlSanctionNumber.SelectedValue = ds_EnqDetails.Tables[10].Rows[0].ItemArray[0].ToString();
    //                    //FunPriLoadSanctionBaseDetails();
    //                }
    //            }

    //            #region Outflow Details
    //            if (ds_EnqDetails.Tables[2].Rows.Count > 0)
    //            {
    //                ViewState["DtCashFlowOut"] = ds_EnqDetails.Tables[2];
    //                DataTable ObjDtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];

    //                if (!string.IsNullOrEmpty(Convert.ToString(ObjDtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID = 41"))))
    //                {
    //                    decimal decToatlFinanceAmt = (decimal)ObjDtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID = 41");

    //                    if (FunPriGetAmountFinanced() != decToatlFinanceAmt)
    //                    {
    //                        DataRow[] dtSuggestions = ObjDtCashFlowOut.Select("CashFlow_Flag_ID = 41");

    //                        foreach (DataRow dr in dtSuggestions)
    //                        {
    //                            dr.Delete();
    //                        }
    //                        ObjDtCashFlowOut.AcceptChanges();
    //                        ViewState["DtCashFlowOut"] = ObjDtCashFlowOut;
    //                    }
    //                }
    //                gvOutFlow.DataSource = ObjDtCashFlowOut;
    //                gvOutFlow.DataBind();
    //                if (strMode.ToUpper().Trim() == "C" || strMode.ToUpper().Trim() == "W")
    //                    FunPriFill_CashOutFlow(_Add);
    //                else
    //                    FunPriFill_CashOutFlow(_Edit);
    //                //if (ObjDtCashFlowOut.Rows.Count > 0)
    //                //{
    //                //    gvOutFlow.DataSource = ObjDtCashFlowOut;
    //                //    gvOutFlow.DataBind();
    //                //}

    //                if (!string.IsNullOrEmpty(Convert.ToString(ObjDtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID = 41"))))
    //                {
    //                    decimal decToatlOutflowAmt = (decimal)ObjDtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID > 0");
    //                    lblTotalOutFlowAmount.Text = decToatlOutflowAmt.ToString();
    //                }
    //                else
    //                {
    //                    lblTotalOutFlowAmount.Text = "0";
    //                }

    //            }
    //            #endregion

    //            if (ds_EnqDetails.Tables.Count > 11)
    //            {
    //                if (ds_EnqDetails.Tables[11].Rows.Count > 0)
    //                {
    //                    Panel8.Visible = true;
    //                    gvPRDDT.DataSource = ds_EnqDetails.Tables[11];
    //                    gvPRDDT.DataBind();
    //                }
    //            }
    //            if ((hdnCustID.Value == "" || hdnCustID.Value == "0") && ddlEnquiryNumber.SelectedValue != "0")
    //            {
    //                cmbCustomerCode.Enabled = true;
    //                cmbCustomerCode.ReadOnly = false;
    //                cmbCustomerCode.Attributes.Remove("readonly");
    //                btnCreateCustomer.Enabled = true;
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in loading data from Enquiry/Sanction Number");
    //        //cvPricing.ErrorMessage =strErrorMessagePrefix+ "Error in loading data from Enquiry/Sanction Number";
    //        //cvPricing.IsValid = false;
    //    }

    //}





    /// <summary>
    /// Function for LOB based validation 
    /// </summary>
    /// <param name="strLobName"></param>
    /// <param name="strLobId"></param>
    /// <param name="strMode"></param>
    //private void FunPriLOBBasedvalidations(string strLobName, string strLobId, string strMode)
    //{

    //    ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //    try
    //    {
    //        if (strMode == _Add)
    //        {
    //            Procparam = new Dictionary<string, string>();
    //            Procparam.Add("@Is_Active", "1");
    //            Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //            Procparam.Add("@LOB_ID", strLobId);
    //            ddlProduct.BindDataTable(SPNames.SYS_ProductMaster, Procparam, new string[] { "Product_ID", "Product_Code", "Product_Name" });
    //            Procparam.Add("@Option", "7");
    //            //ddlROIRuleList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "ROI_Rules_ID", "ROI_Rule_Number", "Model_Description" });
    //            //txtLOB_Followup.Text = strLobName;
    //        }
    //        if (strMode == _Edit)
    //        {


    //            Procparam = new Dictionary<string, string>();
    //            Procparam.Add("@Is_Active", "1");
    //            Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //            Procparam.Add("@LOB_ID", strLobId);
    //            Procparam.Add("@Option", "13");
    //            //ddlConstitutionCodeList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "Constitution_ID", "Constitution_Code", "Constitution_Name" });
    //            //txtLOB_Followup.Text = strLobName;

    //        }

    //        DataTable dtPLR = (DataTable)ViewState["IRRDetails"];
    //        dtPLR.DefaultView.RowFilter = "LOB_ID = " + strLobId;
    //        dtPLR = dtPLR.DefaultView.ToTable();
    //        //hdnRoundOff.Value = "2";
    //        //if (dtPLR.Rows.Count > 0)
    //        //{
    //        //    hdnCTR.Value = dtPLR.Rows[0]["Corporate_Tax_Rate"].ToString();
    //        //    hdnPLR.Value = dtPLR.Rows[0]["Prime_Lending_Rate"].ToString();
    //        //    hdnRoundOff.Value = dtPLR.Rows[0]["Roundoff"].ToString();
    //        //    ViewState["hdnRoundOff"] = dtPLR.Rows[0]["Roundoff"].ToString();
    //        //}

    //        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();


    //        ObjStatus.Option = 310;
    //        ObjStatus.Param1 = intCompany_Id.ToString();
    //        //ObjStatus.Param2 = ddlLob.SelectedValue;
    //        DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //        ViewState["CashInflowList"] = DtCashFlow;

    //        DropDownList ddlInflowDesc = gvInflow.FooterRow.FindControl("ddlInflowDesc") as DropDownList;
    //        if (ViewState["CashInflowList"] != null)
    //        {
    //            Utility.FillDLL(ddlInflowDesc, DtCashFlow, true);
    //        }

    //        ObjStatus.Option = 170;
    //        ObjStatus.Param1 = intCompany_Id.ToString();
    //        ObjStatus.Param2 = strLobId;
    //        DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //        ViewState["RepayCashInflowList"] = DtCashFlow;

    //        DropDownList ddlRepaymentCashFlow_RepayTab = gvRepaymentDetails.FooterRow.FindControl("ddlRepaymentCashFlow_RepayTab") as DropDownList;
    //        Utility.FillDLL(ddlRepaymentCashFlow_RepayTab, DtCashFlow, true);

    //        //FunPriLOBBasedvalidations(ddlLob.SelectedItem.Text);

    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Cannot Process for selected lob");
    //    }
    //    finally
    //    {
    //        //if (ObjCustomerService != null)
    //        ObjCustomerService.Close();
    //    }
    //}

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strType"></param>
    private void FunPriLOBBasedvalidations(string strType)
    {
        strType = strType.Split('-')[0].Trim();
        switch (strType.ToLower())
        {
            case "ol":  //Operating lease
                //tcPricing.Tabs[2].Visible = true;
                //rdnlAssetType.Visible = true;
                //FunPriLANNumVisble(false);
                //if (((DataTable)ViewState["ObjDTAssetDetails"]).Rows.Count > 0)
                //{
                //    rdnlAssetType.Enabled = false;
                //    if (rdnlAssetType.SelectedIndex == 1)
                //        FunPriLANNumVisble(true);
                //}
                //else
                //{
                //    rdnlAssetType.Enabled = true;
                //    rdnlAssetType.SelectedIndex = 0;
                //}
                //txtRequiredFromDate.Enabled = true;
                //lblRequiredFromDate.CssClass = "styleReqFieldLabel";
                //CalendarExtenderSD_RequiredFromDate.Enabled = true;

                break;


            case "te": //Term loan Extensible
            case "tl": //Term loan
            case "ft": //Factoring 
            case "wc":
                //tcPricing.Tabs[2].Visible = false;
                //lblRequiredFromDate.CssClass = "styleDisplayLabel";
                //UpdatePanel4.Update();
                //CalendarExtenderSD_RequiredFromDate.Enabled = false;
                //rdnlAssetType.Visible = false;
                //rdnlAssetType.SelectedIndex = 0;
                //rfvRequiredFromDate.Enabled = false;
                //txtRequiredFromDate.Enabled = false;
                break;

            default://for default case
                //tcPricing.Tabs[2].Visible = true;
                //rdnlAssetType.Visible = false;
                //lblRequiredFromDate.CssClass = "styleDisplayLabel";
                //CalendarExtenderSD_RequiredFromDate.Enabled = false;
                FunPriLANNumVisble(false);
                //rfvRequiredFromDate.Enabled = false;
                //txtRequiredFromDate.Enabled = false;
                break;
        }
        //FunPriLobbasedRoi(strType);
    }

    #region Offer Tab

    private void FunPriFill_OfferTab(string Mode)
    {
        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();

        try
        {
            //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            if (Mode == _Add)
            {

                //ObjStatus.Option = 44;
                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_RATE_TYPE.ToString();
                //Utility.FillDLL(ddl_Rate_Type, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_RETURN_PATTERN.ToString();
                //Utility.FillDLL(ddl_Return_Pattern, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_TIME_VALUE.ToString();
                //Utility.FillDLL(ddl_Time_Value, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_FREQUENCY.ToString();
                //Utility.FillDLL(ddl_Frequency, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_REPAYMENT_MODE.ToString();
                //Utility.FillDLL(ddl_Repayment_Mode, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                ////ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_RATE.ToString();
                ////Utility.FillDLL(ddl_Rate, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_IRR_REST.ToString();
                //Utility.FillDLL(ddl_IRR_Rest, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_FREQUENCY.ToString();
                //Utility.FillDLL(ddl_Interest_Calculation, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_FREQUENCY.ToString();
                //Utility.FillDLL(ddl_Interest_Levy, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                //ObjStatus.Param1 = S3G_Statu_Lookup.ORG_ROI_RULES_INSURANCE.ToString();
                //Utility.FillDLL(ddl_Insurance, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                Dictionary<string, string> objParameters = new Dictionary<string, string>();
                DataSet dsROILov = Utility.GetDataset("S3G_ORG_LOADROILOV", objParameters);
                //ddl_Rate_Type.BindDataTable(dsROILov.Tables[0]);
                //ddl_Return_Pattern.BindDataTable(dsROILov.Tables[1]);
                //ddl_Time_Value.BindDataTable(dsROILov.Tables[2]);
                //ddl_Frequency.BindDataTable(dsROILov.Tables[3]);
                //ddl_Repayment_Mode.BindDataTable(dsROILov.Tables[4]);
                //ddl_IRR_Rest.BindDataTable(dsROILov.Tables[5]);
                //ddl_Interest_Calculation.BindDataTable(dsROILov.Tables[3]);
                //ddl_Interest_Levy.BindDataTable(dsROILov.Tables[3]);
                //ddl_Insurance.BindDataTable(dsROILov.Tables[6]);

            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error filling offer terms tab");
        }
        //finally
        //{
        //    //if (ObjCustomerService != null)
        //        ObjCustomerService.Close();
        //}

    }

    //private void FunPriLoad_ROIRule(string Mode)
    //{
    //    ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();

    //    try
    //    {
    //        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
    //        DataTable ObjDTROI = new DataTable();
    //        if (Mode == _Add)
    //        {

    //            ObjStatus.Option = 40;
    //            //ObjStatus.Param1 = ddlROIRuleList.SelectedValue;
    //            ObjDTROI = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            ViewState["ROIRules"] = ObjDTROI;


    //        }
    //        if (Mode == _Edit)
    //        {
    //            //DataTable ObjDTROI;
    //            ObjDTROI = (DataTable)ViewState["ROIRules"];

    //        }
    //        string strRoirValue;
    //        //if (hdnROIRule.Value != "")
    //        //{
    //        //    strRoirValue = hdnROIRule.Value;
    //        //}
    //        //else
    //        //{
    //        //    strRoirValue = "0";
    //        //}
    //        switch (ObjDTROI.Rows[0]["Repayment_Mode"].ToString())
    //        {
    //            case "3":
    //                Dictionary<int, decimal> dictRecovery = new Dictionary<int, decimal>();
    //                if (!string.IsNullOrEmpty(ObjDTROI.Rows[0]["Recovery_Pattern_Year1"].ToString()) && Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year1"].ToString()) != 0)
    //                    dictRecovery.Add(1, Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year1"].ToString()));

    //                if (!string.IsNullOrEmpty(ObjDTROI.Rows[0]["Recovery_Pattern_Year2"].ToString()) && Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year2"].ToString()) != 0)
    //                    dictRecovery.Add(2, Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year2"].ToString()));

    //                if (!string.IsNullOrEmpty(ObjDTROI.Rows[0]["Recovery_Pattern_Year3"].ToString()) && Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year3"].ToString()) != 0)
    //                    dictRecovery.Add(3, Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Year3"].ToString()));

    //                if (!string.IsNullOrEmpty(ObjDTROI.Rows[0]["Recovery_Pattern_Rest"].ToString()) && Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Rest"].ToString()) != 0)
    //                    dictRecovery.Add(4, Convert.ToDecimal(ObjDTROI.Rows[0]["Recovery_Pattern_Rest"].ToString()));

    //                int inMax = dictRecovery.Keys.Max();
    //                //int intNoofYears = FunPriGetNoofYearsFromTenure();

    //                if (inMax != 4)
    //                {
    //                    //if (inMax != intNoofYears)
    //                    //{
    //                    //    div7.Visible = false;
    //                    //    ddlROIRuleList.SelectedValue = strRoirValue;
    //                    //    hdnROIRule.Value = "";
    //                    //    Utility.FunShowAlertMsg(this, "Tenure and Recovery Pattern are not matching");
    //                    //    return;
    //                    //}

    //                }
    //                else
    //                {
    //                    //if (intNoofYears < 4)
    //                    //{
    //                    //    div7.Visible = false;
    //                    //    ddlROIRuleList.SelectedValue = strRoirValue;
    //                    //    hdnROIRule.Value = "";
    //                    //    Utility.FunShowAlertMsg(this, "Tenure and Recovery Pattern are not matching");
    //                    //    return;
    //                    //}
    //                }
    //                break;
    //        }

    //        if (Convert.ToInt32(ObjDTROI.Rows[0]["Return_Pattern"].ToString()) > 2)
    //        {
    //            //if (ddlTenureType.SelectedItem.Text.Trim().ToUpper() != "MONTHS")
    //            //{
    //            //    Utility.FunShowAlertMsg(this, "Tenure type should be months for PTF/PLF/PMF");
    //            //    div7.Visible = false;
    //            //    ddlROIRuleList.SelectedValue = strRoirValue;
    //            //    hdnROIRule.Value = "";
    //            //    return;
    //            //}
    //        }

    //        //Ol realted changes on 29-7-2011.
    //        //if (txtResidualAmt_Cashflow.Text.Length > 0 || txtResidualValue_Cashflow.Text.Length > 0)
    //        //{
    //        //    if (ObjDTROI.Rows[0]["Residual_Value"].ToString() != "1")
    //        //    {
    //        //        ddlROIRuleList.SelectedValue = strRoirValue;
    //        //        Utility.FunShowAlertMsg(this, "Residual value is given.choose the ROI rule with residual value");
    //        //        if (strRoirValue != "0" && strRoirValue != string.Empty)
    //        //            div7.Visible = true;
    //        //        else
    //        //            div7.Visible = false;
    //        //        return;

    //        //    }
    //        //}

    //        //Dec rate 
    //        if (!string.IsNullOrEmpty(ObjDTROI.Rows[0]["IRR_Rate"].ToString()))
    //        {
    //            ViewState["decRate"] = ObjDTROI.Rows[0]["IRR_Rate"].ToString();
    //        }

    //        if (ObjDTROI.Rows.Count > 0)
    //        {
    //            //panROIRules.Visible = true;
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Serial_Number"], tr_lblSerial_Number, txt_Serial_Number, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Model_Description"], tr_lblModel_Description, txt_Model_Description, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Rate_Type"], tr_lblRate_Type, ddl_Rate_Type, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["ROI_Rule_Number"], tr_lblROI_Rule_Number, txt_ROI_Rule_Number, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Return_Pattern"], tr_lblReturn_Pattern, ddl_Return_Pattern, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Time_Value"], tr_lblTime_Value, ddl_Time_Value, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Frequency"], tr_lblFrequency, ddl_Frequency, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Repayment_Mode"], tr_lblRepayment_Mode, ddl_Repayment_Mode, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Rate"], tr_lblRate, txtRate, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["IRR_Rest"], tr_lblIRR_Rest, ddl_IRR_Rest, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Interest_Calculation"], tr_lblInterest_Calculation, ddl_Interest_Calculation, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Interest_Levy"], tr_lblInterest_Levy, ddl_Interest_Levy, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Recovery_Pattern_Year1"], tr_lblRecovery_Pattern_Year1, txt_Recovery_Pattern_Year1, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Recovery_Pattern_Year2"], tr_lblRecovery_Pattern_Year2, txt_Recovery_Pattern_Year2, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Recovery_Pattern_Year3"], tr_lblRecovery_Pattern_Year3, txt_Recovery_Pattern_Year3, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Recovery_Pattern_Rest"], tr_lblRecovery_Pattern_Rest, txt_Recovery_Pattern_Rest, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Insurance"], tr_lblInsurance, ddl_Insurance, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Residual_Value"], tr_lblResidual_Value, chk_lblResidual_Value, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Margin"], tr_lblMargin, chk_lblMargin, Mode);
    //            FunPriShow_ROI_Forms(ObjDTROI.Rows[0]["Margin_Percentage"], tr_lblMargin_Percentage, txt_Margin_Percentage, Mode);
    //            //Here
    //            //FunPriLoadMarginResidual();


    //            if (ObjDTROI.Rows[0]["Margin"].ToString() == "1")
    //            {
    //                txtMarginMoneyPer_Cashflow.Text = ObjDTROI.Rows[0]["Margin_Percentage"].ToString();
    //                txtMarginAmountAsset.ReadOnly = false;
    //                txtMarginMoneyPer_Cashflow.ReadOnly = true;
    //                txtMarginMoneyAmount_Cashflow.ReadOnly = true;

    //                txtMarginMoneyAmount_Cashflow.Text = FunPriGetMarginAmout().ToString();
    //                rfvMarginPercent.Enabled = true;
    //                txtMarginPercentage.ReadOnly = false;//Added for Margin field disable for margin not applicable
    //            }
    //            else
    //            {
    //                txtMarginMoneyPer_Cashflow.Text = "";
    //                txtMarginMoneyAmount_Cashflow.Text = "";
    //                txtMarginAmountAsset.ReadOnly = true;
    //                txtMarginMoneyPer_Cashflow.ReadOnly = true;
    //                txtMarginMoneyAmount_Cashflow.ReadOnly = true;
    //                rfvMarginPercent.Enabled = false;
    //                txtMarginPercentage.ReadOnly = true;//Added for Margin field disable for margin not applicable
    //            }
    //            if (ObjDTROI.Rows[0]["Residual_Value"].ToString() == "1")
    //            {
    //                txtResidualAmt_Cashflow.ReadOnly = false;
    //                txtResidualValue_Cashflow.ReadOnly = false;
    //                rfvResidualValue.Enabled = true;
    //            }
    //            else
    //            {
    //                rfvResidualValue.Enabled = false;
    //                txtResidualAmt_Cashflow.ReadOnly = true;
    //                txtResidualValue_Cashflow.ReadOnly = true;
    //                txtResidualAmt_Cashflow.Text = "";
    //                txtResidualValue_Cashflow.Text = "";
    //            }
    //            FunPriSetRateMaxLength();
    //            /*hide the IRR panel visibility for WC,FT,TLE(Product) method as per Malolan raised on 23-feb-2012 start*/
    //            FunPriDisableIRRPanel();
    //            /*hide the IRR panel visibility for WC,FT,TLE(Product) method as per Malolan raised on 23-feb-2012 End*/
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in loading ROI Rules");
    //    }
    //    finally
    //    {
    //        //if (ObjCustomerService != null)
    //        ObjCustomerService.Close();
    //    }
    //}

    //private void FunPriLoad_PaymentRule()
    //{
    //    ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //    try
    //    {
    //        DataTable ObjDTPayment = new DataTable();

    //        Procparam = new Dictionary<string, string>();
    //        Procparam.Add("@Is_Active", "1");
    //        Procparam.Add("@Rules_ID", ddlPaymentRuleList.SelectedItem.Value);
    //        Procparam.Add("@Option", "10");
    //        ObjDTPayment = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);
    //        string vendor = ObjDTPayment.Rows[0]["Entity_Type"].ToString().ToLower();
    //        ViewState["ObjDTPayment"] = ObjDTPayment;
    //        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();

    //        ObjStatus.Option = 1;
    //        ObjStatus.Param1 = S3G_Statu_Lookup.CASH_FLOW_FROM.ToString();


    //        DropDownList ddlEntityName_InFlowFrom = gvOutFlow.FooterRow.FindControl("ddlPaymentto_OutFlow") as DropDownList;
    //        DataTable dtCashFlowFrom = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

    //        switch (vendor)
    //        {
    //            case "vendor":
    //                dtCashFlowFrom.Rows.RemoveAt(0);
    //                break;
    //            case "customer":
    //                dtCashFlowFrom.Rows.RemoveAt(1);
    //                break;
    //        }
    //        ViewState["vendor"] = vendor;
    //        ViewState["CashFlowTo"] = dtCashFlowFrom;
    //        Utility.FillDLL(ddlEntityName_InFlowFrom, dtCashFlowFrom, true);
    //        DataTable ObjDTPaymentGen = new DataTable();
    //        DataColumn dc1 = new DataColumn("FieldName");
    //        DataColumn dc2 = new DataColumn("FieldValue");
    //        ObjDTPaymentGen.Columns.Add(dc1);
    //        ObjDTPaymentGen.Columns.Add(dc2);
    //        ViewState["PaymentRules"] = ObjDTPaymentGen;
    //        for (int i = 0; i < ObjDTPayment.Columns.Count; i++)
    //        {
    //            if (ObjDTPayment.Rows[0][i].ToString() != string.Empty)
    //            {
    //                DataRow dr = ObjDTPaymentGen.NewRow();
    //                dr[0] = ObjDTPayment.Columns[i].ColumnName.Replace("_", " ");
    //                if (ObjDTPayment.Rows.Count > 0) dr[1] = ObjDTPayment.Rows[0][i].ToString();
    //                else dr[1] = string.Empty;
    //                ObjDTPaymentGen.Rows.Add(dr);
    //            }
    //        }
    //        gvPaymentRuleDetails.DataSource = ObjDTPaymentGen;
    //        gvPaymentRuleDetails.DataBind();


    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in loading Payment rule card");
    //    }
    //    finally
    //    {
    //        ObjCustomerService.Close();
    //    }


    //}

    //private void FunPriUpdateROIRule()
    //{
    //    DataTable ObjDTROI;
    //    ObjDTROI = (DataTable)ViewState["ROIRules"];
    //    ObjDTROI.Rows[0]["Serial_Number"] = txt_Serial_Number.Text == "" ? 0 : Convert.ToInt64(txt_Serial_Number.Text);
    //    ObjDTROI.Rows[0]["Model_Description"] = txt_Model_Description.Text;
    //    ObjDTROI.Rows[0]["Rate_Type"] = ddl_Rate_Type.SelectedValue;
    //    ObjDTROI.Rows[0]["ROI_Rule_Number"] = txt_ROI_Rule_Number.Text;
    //    ObjDTROI.Rows[0]["Return_Pattern"] = ddl_Return_Pattern.SelectedValue;
    //    ObjDTROI.Rows[0]["Time_Value"] = ddl_Time_Value.SelectedValue;
    //    ObjDTROI.Rows[0]["Frequency"] = ddl_Frequency.SelectedValue;
    //    ObjDTROI.Rows[0]["Repayment_Mode"] = ddl_Repayment_Mode.SelectedValue;
    //    if (!string.IsNullOrEmpty(txtRate.Text))
    //        ObjDTROI.Rows[0]["Rate"] = txtRate.Text;
    //    ObjDTROI.Rows[0]["IRR_Rest"] = ddl_IRR_Rest.SelectedValue;
    //    ObjDTROI.Rows[0]["Interest_Calculation"] = ddl_Interest_Calculation.SelectedValue;
    //    ObjDTROI.Rows[0]["Interest_Levy"] = ddl_Interest_Levy.SelectedValue;
    //    ObjDTROI.Rows[0]["Recovery_Pattern_Year1"] = txt_Recovery_Pattern_Year1.Text;
    //    ObjDTROI.Rows[0]["Recovery_Pattern_Year2"] = txt_Recovery_Pattern_Year2.Text;
    //    ObjDTROI.Rows[0]["Recovery_Pattern_Year3"] = txt_Recovery_Pattern_Year3.Text;
    //    ObjDTROI.Rows[0]["Recovery_Pattern_Rest"] = txt_Recovery_Pattern_Rest.Text;
    //    ObjDTROI.Rows[0]["Insurance"] = ddl_Insurance.SelectedValue;
    //    ObjDTROI.Rows[0]["Residual_Value"] = chk_lblResidual_Value.Checked;
    //    ObjDTROI.Rows[0]["Margin"] = chk_lblMargin.Checked;
    //    ObjDTROI.Rows[0]["Margin_Percentage"] = txt_Margin_Percentage.Text == "" ? 0 : Convert.ToDecimal(txt_Margin_Percentage.Text);
    //    ObjDTROI.Rows[0].AcceptChanges();
    //    ViewState["ROIRules"] = ObjDTROI;
    //}

    private void FunPriShow_ROI_Forms(Object Data, System.Web.UI.HtmlControls.HtmlTableRow rRow, Object ObjCtl, string str_Mode)
    {
        try
        {
            bool blnIsRowEnable = false;
            if (!string.IsNullOrEmpty(Convert.ToString(Data)))
            {
                //if (PaintBG)
                //{
                //    if (this.Theme == "S3GTheme_Silver")
                //    {
                //        rRow.BgColor = "#d6d7e0";
                //    }
                //    else if (this.Theme == "S3GTheme_Blue")
                //    {
                //        rRow.BgColor = "aliceblue";
                //    }
                //    else
                //    {
                //        rRow.BgColor = "#f9f9f9";
                //    }
                //    PaintBG = false;

                //}
                //else
                //{
                //    PaintBG = true;
                //}
                rRow.Visible = true;

                if (ObjCtl.GetType().Name == "TextBox")
                {
                    TextBox txtBox = ((TextBox)ObjCtl);
                    txtBox.Text = Convert.ToString(Data);
                    if (txtBox.ID == "txtRate" || txtBox.ID == "txt_Margin_Percentage")
                        blnIsRowEnable = true;
                }
                if (ObjCtl.GetType().Name == "DropDownList")
                {
                    DropDownList DDL = new DropDownList();

                    DDL = ((DropDownList)ObjCtl);

                    if (DDL.ID == "ddl_Time_Value" || DDL.ID == "ddl_Frequency" || DDL.ID == "ddl_Insurance")
                        blnIsRowEnable = true;

                    if (DDL.Items.Count > 0)
                    {
                        if (Convert.ToString(Data) != "0")
                            DDL.SelectedValue = Convert.ToString(Data);
                    }
                }
                if (ObjCtl.GetType().Name == "CheckBox")
                {
                    ((CheckBox)ObjCtl).Checked = Convert.ToBoolean(Data);
                }

                //if (ddlROIRuleList.SelectedItem.Text.ToUpper().Contains("RRA"))//ROI Rule number selected in drop down
                //    //rRow.Disabled = true;
                //    ((WebControl)ObjCtl).Enabled = false;
                //else
                //{

                //    if (blnIsRowEnable)
                //        //rRow.Disabled = false;
                //        ((WebControl)ObjCtl).Enabled = true;
                //    else
                //        //rRow.Disabled = true;
                //        ((WebControl)ObjCtl).Enabled = false;

                //    if (Request.QueryString["qsMode"].ToString() == "Q")
                //        //    //rRow.Disabled = true;
                //        ((WebControl)ObjCtl).Enabled = false;
                //}

            }
            else
            {
                if (ObjCtl.GetType().Name == "DropDownList")
                {
                    ((DropDownList)ObjCtl).SelectedIndex = 0;
                }
                if (ObjCtl.GetType().Name == "TextBox")
                {
                    ((TextBox)ObjCtl).Text = "";
                }
                if (ObjCtl.GetType().Name == "CheckBox")
                {
                    ((CheckBox)ObjCtl).Checked = false;
                }
                rRow.Visible = false;
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in loding ROI Controls");
        }
    }

    #region Cash In Flows Grid

    //private void FunPriFill_CashInFlow(string Mode)
    //{
    //    ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //    try
    //    {

    //        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
    //        if (Mode == _Add)
    //        {
    //            gvInflow.ClearGrid();
    //            //ObjStatus.Option = 310;
    //            //ObjStatus.Param1 = intCompany_Id.ToString();
    //            //ObjStatus.Param2 = ddlLob.SelectedValue;
    //            //DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            //ViewState["CashInflowList"] = DtCashFlow;

    //            //ObjStatus.Option = 170;
    //            //ObjStatus.Param1 = intCompany_Id.ToString();
    //            //ObjStatus.Param2 = ddlLob.SelectedValue;
    //            //DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            //ViewState["RepayCashInflowList"] = DtCashFlow;
    //            //DtCashFlow.Dispose();

    //            ObjStatus.Option = 1;
    //            ObjStatus.Param1 = S3G_Statu_Lookup.CASH_FLOW_FROM.ToString();
    //            ViewState["CashFlowFrom"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

    //            ObjStatus.Option = 38;
    //            ObjStatus.Param1 = intCompany_Id.ToString();
    //            DtFollowUp = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            ViewState["EntityMasterList"] = DtFollowUp;


    //            //Code Modified by nataraj
    //            //ObjStatus.Option = 50;
    //            //ObjStatus.Param1 = null;
    //            //DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            DtCashFlow = new DataTable();
    //            DtCashFlow.Columns.Add("Date");
    //            DtCashFlow.Columns.Add("CashInFlowID");
    //            DtCashFlow.Columns.Add("CashInFlow");
    //            DtCashFlow.Columns.Add("EntityID");
    //            DtCashFlow.Columns.Add("Entity");
    //            DtCashFlow.Columns.Add("InflowFromId");
    //            DtCashFlow.Columns.Add("InflowFrom");
    //            DtCashFlow.Columns.Add("Amount", typeof(decimal));
    //            DtCashFlow.Columns.Add("Accounting_IRR");
    //            DtCashFlow.Columns.Add("Business_IRR");
    //            DtCashFlow.Columns.Add("Company_IRR");
    //            DtCashFlow.Columns.Add("CashFlow_Flag_ID", typeof(int));

    //            DataRow dr = DtCashFlow.NewRow();
    //            dr["Date"] = "01/01/1900";
    //            dr["CashInFlowID"] = "";
    //            dr["CashInFlow"] = "";
    //            dr["EntityID"] = "";
    //            dr["Entity"] = "";
    //            dr["InflowFromId"] = "";
    //            dr["InflowFrom"] = "";
    //            dr["Amount"] = 0;
    //            dr["Accounting_IRR"] = "";
    //            dr["Business_IRR"] = "";
    //            dr["Company_IRR"] = "";
    //            dr["CashFlow_Flag_ID"] = 0;
    //            DtCashFlow.Rows.Add(dr);
    //            //In flow grid




    //        }
    //        if (Mode == _Edit)
    //        {
    //            //ObjStatus.Option = 310;
    //            //ObjStatus.Param1 = intCompany_Id.ToString();
    //            //ObjStatus.Param2 = ddlLob.SelectedValue;
    //            //DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            //ViewState["CashInflowList"] = DtCashFlow;

    //            //ObjStatus.Option = 170;
    //            //ObjStatus.Param1 = intCompany_Id.ToString();
    //            //ObjStatus.Param2 = ddlLob.SelectedValue;
    //            //DtCashFlow = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            //ViewState["RepayCashInflowList"] = DtCashFlow;
    //            //DtCashFlow.Dispose();

    //            ObjStatus.Option = 1;
    //            ObjStatus.Param1 = S3G_Statu_Lookup.CASH_FLOW_FROM.ToString();
    //            ViewState["CashFlowFrom"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

    //            ObjStatus.Option = 38;
    //            ObjStatus.Param1 = intCompany_Id.ToString();
    //            DtFollowUp = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
    //            ViewState["EntityMasterList"] = DtFollowUp;

    //            if ((DataTable)ViewState["DtCashFlow"] != null)
    //                DtCashFlow = (DataTable)ViewState["DtCashFlow"];

    //        }

    //        gvInflow.DataSource = DtCashFlow;
    //        gvInflow.DataBind();
    //        if (Mode == _Add)
    //        {
    //            DtCashFlow.Rows.Clear();
    //            ViewState["DtCashFlow"] = DtCashFlow;
    //            DtCashFlow.Dispose();
    //            gvInflow.Rows[0].Cells.Clear();
    //            gvInflow.Rows[0].Visible = false;

    //        }

    //        FunPriFillCashInflow_ViewState();


    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in filling cash inflow details");
    //    }
    //    finally
    //    {
    //        //if (ObjCustomerService != null)
    //        ObjCustomerService.Close();
    //    }
    //}

    //private void FunPriFillCashInflow_ViewState()
    //{
    //    try
    //    {
    //        DropDownList ddlInflowDesc = gvInflow.FooterRow.FindControl("ddlInflowDesc") as DropDownList;
    //        // DropDownList ddlEntityName_InFlow = gvInflow.FooterRow.FindControl("ddlEntityName_InFlow") as DropDownList;
    //        DropDownList ddlEntityName_InFlowFrom = gvInflow.FooterRow.FindControl("ddlEntityName_InFlowFrom") as DropDownList;
    //        if (ViewState["CashInflowList"] != null)
    //        {
    //            Utility.FillDLL(ddlInflowDesc, ((DataTable)ViewState["CashInflowList"]), true);
    //        }
    //        Utility.FillDLL(ddlEntityName_InFlowFrom, ((DataTable)ViewState["CashFlowFrom"]), true);
    //        //SetWhiteSpaceDLL(ddlEntityName_InFlowFrom);
    //        ddlEntityName_InFlowFrom.SelectedIndex = 0;

    //        TextBox txtDate_GridInflow1 = gvInflow.FooterRow.FindControl("txtDate_GridInflow") as TextBox;
    //        txtDate_GridInflow1.Attributes.Add("readonly", "readonly");
    //        AjaxControlToolkit.CalendarExtender CalendarExtenderSD_InflowDate1 = gvInflow.FooterRow.FindControl("CalendarExtenderSD_InflowDate") as AjaxControlToolkit.CalendarExtender;
    //        CalendarExtenderSD_InflowDate1.Format = ObjS3GSession.ProDateFormatRW;


    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in filling cash inflow form viewstate");
    //    }
    //}

    #endregion

    #region Cash Out Flow Grid

    private void FunPriFill_CashOutFlow(string Mode)
    {
        ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            if (Mode == _Add)
            {
                ObjStatus.Option = 311;//171
                ObjStatus.Param1 = intCompany_Id.ToString();
                ObjStatus.Param2 = ddlLob.SelectedValue;
                ViewState["CashOutflowList"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                ObjStatus.Option = 1;
                ObjStatus.Param1 = S3G_Statu_Lookup.CASH_FLOW_FROM.ToString();
                if (ViewState["CashFlowTo"] != null)
                    ViewState["CashFlowTo"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);



                //Code modified by Nataraj Y
                //Out flow grid
                //ObjStatus.Option = 51;
                //DtCashFlowOut = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
                DtCashFlowOut = new DataTable();
                DtCashFlowOut.Columns.Add("Date");
                DtCashFlowOut.Columns.Add("CashOutFlowID");
                DtCashFlowOut.Columns.Add("CashOutFlow");
                DtCashFlowOut.Columns.Add("EntityID");
                DtCashFlowOut.Columns.Add("Entity");
                DtCashFlowOut.Columns.Add("OutflowFromId");
                DtCashFlowOut.Columns.Add("OutflowFrom");
                DtCashFlowOut.Columns.Add("Amount", typeof(decimal));
                DtCashFlowOut.Columns.Add("Accounting_IRR");
                DtCashFlowOut.Columns.Add("Business_IRR");
                DtCashFlowOut.Columns.Add("Company_IRR");
                DtCashFlowOut.Columns.Add("CashFlow_Flag_ID", typeof(int));
                DataRow dr_out = DtCashFlowOut.NewRow();
                dr_out["Date"] = "01/01/1900";
                dr_out["CashOutFlowID"] = "";
                dr_out["CashOutFlow"] = "";
                dr_out["EntityID"] = "";
                dr_out["Entity"] = "";
                dr_out["OutflowFromId"] = "";
                dr_out["OutflowFrom"] = "";
                dr_out["Amount"] = "0";
                dr_out["Accounting_IRR"] = "";
                dr_out["Business_IRR"] = "";
                dr_out["Company_IRR"] = "";
                dr_out["CashFlow_Flag_ID"] = 0;
                DtCashFlowOut.Rows.Add(dr_out);




            }
            if (Mode == _Edit)
            {
                ObjStatus.Option = 171;
                ObjStatus.Param1 = intCompany_Id.ToString();
                ObjStatus.Param2 = ddlLob.SelectedValue;
                ViewState["CashOutflowList"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                //ObjStatus.Option = 1;
                //ObjStatus.Param1 = S3G_Statu_Lookup.CASH_FLOW_FROM.ToString();
                //if (ViewState["CashFlowTo"] != null)
                //    ViewState["CashFlowTo"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                if ((DataTable)ViewState["DtCashFlowOut"] != null)
                    DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
            }

            //gvOutFlow.DataSource = DtCashFlowOut;
            //gvOutFlow.DataBind();

            if (Mode == _Add)
            {

                DtCashFlowOut.Rows.Clear();
                ViewState["DtCashFlowOut"] = DtCashFlowOut;
                DtCashFlowOut.Dispose();

                //gvOutFlow.Rows[0].Cells.Clear();
                //gvOutFlow.Rows[0].Visible = false;
            }
            //FunPriFillCashOutflow_ViewState();

            if (((DataTable)ViewState["DtCashFlowOut"]).Rows.Count > 0)
            {

                //lblTotalOutFlowAmount.Text = ((DataTable)ViewState["DtCashFlowOut"]).
                // Compute("sum(Amount)", "CashOutFlowID > 0").ToString();




            }
            //else
            // lblTotalOutFlowAmount.Text = "0";

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling cash outflow details");
        }
        finally
        {
            //if (ObjCustomerService != null)
            ObjCustomerService.Close();
        }
    }


    //private void FunPriFillCashOutflow_ViewState()
    //{
    //    try
    //    {
    //        DropDownList ddlInflowDesc = gvOutFlow.FooterRow.FindControl("ddlOutflowDesc") as DropDownList;
    //        Utility.FillDLL(ddlInflowDesc, ((DataTable)ViewState["CashOutflowList"]), true);

    //        DropDownList ddlEntityName_InFlowFrom = gvOutFlow.FooterRow.FindControl("ddlPaymentto_OutFlow") as DropDownList;
    //        if (ViewState["CashFlowTo"] != null)
    //        {
    //            DataTable dtCashFlowFrom = (DataTable)ViewState["CashFlowTo"];
    //            string vendor = (string)ViewState["vendor"];
    //            if (dtCashFlowFrom.Rows.Count > 1)
    //            {
    //                switch (vendor)
    //                {
    //                    case "vendor":
    //                        dtCashFlowFrom.Rows.RemoveAt(0);
    //                        break;
    //                    case "customer":
    //                        dtCashFlowFrom.Rows.RemoveAt(1);
    //                        break;
    //                }
    //                ViewState["CashFlowTo"] = dtCashFlowFrom;
    //            }
    //            Utility.FillDLL(ddlEntityName_InFlowFrom, dtCashFlowFrom, true);
    //        }



    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in filling cash outflow form viewstate");
    //    }
    //}

    //protected void FunProBindCashFlow()
    //{
    //    DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
    //    if (!string.IsNullOrEmpty(Convert.ToString(((DataTable)ViewState["DtCashFlowOut"]).Compute("Sum(Amount)", "CashFlow_Flag_ID = 41"))))
    //    {
    //        decimal decToatlFinanceAmt = (decimal)DtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID = 41");

    //        //if (FunPriGetAmountFinanced() < decToatlFinanceAmt)
    //        //{

    //        //    DtCashFlowOut.Rows.RemoveAt(DtCashFlowOut.Rows.Count - 1);
    //        //    ViewState["DtCashFlowOut"] = DtCashFlowOut;
    //        //    // cvPricing.ValidationGroup = "TabOfferTerms2";
    //        //    throw new ApplicationException("Total finance amount in cashoutflow should be equal to amount financed");
    //        //    //decToatlFinanceAmt = (decimal)DtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID = 41");
    //        //    //return;
    //        //}
    //    }

    //    if (DtCashFlowOut.Rows.Count > 0)
    //    {
    //        decimal decToatlOutflowAmt = (decimal)DtCashFlowOut.Compute("Sum(Amount)", "CashFlow_Flag_ID > 0");
    //        lblTotalOutFlowAmount.Text = decToatlOutflowAmt.ToString();
    //        gvOutFlow.DataSource = DtCashFlowOut;
    //        gvOutFlow.DataBind();
    //        FunPriFillCashOutflow_ViewState();
    //    }
    //    else
    //    {
    //        FunPriFill_CashOutFlow(_Add);
    //    }

    //    FunPriIRRReset();
    //}

    #endregion



    #endregion

    #region Asset Tab

    //private void FunPriLoad_AssetDetails(string Mode)
    //{
    //    ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //    try
    //    {
    //        DataTable ObjDTAssetDetails = new DataTable();
    //        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
    //        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
    //        ObjStatus.Option = 61;
    //        ObjStatus.Param1 = "0";
    //        ObjDTAssetDetails = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

    //        if (ObjDTAssetDetails.Rows.Count == 0)
    //        {
    //            ObjDTAssetDetails.Rows.Add();
    //            ObjDTAssetDetails.Columns.Add("AssetValue", typeof(decimal));
    //            ObjDTAssetDetails.Columns.Add("Margin_Dealer", typeof(decimal));
    //            ObjDTAssetDetails.Columns.Add("Margin_MFC", typeof(decimal));
    //            ObjDTAssetDetails.Columns.Add("Trade_In", typeof(decimal));
    //            ObjDTAssetDetails.Columns.Add("LPO_Amount", typeof(decimal));
    //            ObjDTAssetDetails.Columns.Add("Asset_Description", typeof(string));
    //            gvAssetDetails.DataSource = ObjDTAssetDetails;
    //            gvAssetDetails.DataBind();

    //            gvAssetDetails.Rows[0].Cells.Clear();
    //            gvAssetDetails.Rows[0].Visible = false;
    //            gvAssetDetails.Visible = false;
    //            ObjDTAssetDetails.Rows.Clear();
    //        }
    //        else
    //        {
    //            gvAssetDetails.DataSource = ObjDTAssetDetails;
    //            gvAssetDetails.DataBind();
    //            gvAssetDetails.Columns[1].Visible = false;
    //            gvAssetDetails.Columns[11].Visible = false;
    //        }

    //        ViewState["ObjDTAssetDetails"] = ObjDTAssetDetails;


    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in loading asset details");
    //    }
    //    finally
    //    {
    //        //if (ObjCustomerService != null)
    //        ObjCustomerService.Close();
    //    }
    //}

    private void FunPriFill_AssetTab(string Mode)
    {
        ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {
            //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            if (Mode == _Add)
            {
                //ObjStatus.Option = 30;
                //ObjStatus.Param1 = intCompany_Id.ToString();
                //Utility.FillDLL(ddlAssetCodeList, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

                FunProLoadAssetValue("NEW");

                //Dictionary<string, string> dictParam = new Dictionary<string, string>();
                //DataTable DtRate = new DataTable(); ;
                //dictParam.Add("@OPTION", "2");
                //dictParam.Add("@COMPANYID", intCompany_Id.ToString());
                //DtRate = Utility.GetDataset("S3G_ORG_GETAPPLICATIONASSET", dictParam).Tables[0];
                //ddlAssetCodeList.DataSource = DtRate;
                //ddlAssetCodeList.DataTextField = "Asset_Code";
                //ddlAssetCodeList.DataValueField = "Asset_ID";
                //ddlAssetCodeList.DataBind();
                //ddlAssetCodeList.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
                //ddlAssetCodeList.SelectedIndex = 0;
                //ViewState["RateDt1"] = DtRate;

                //dictParam = new Dictionary<string, string>();
                /* for OL change
                 
                dictParam.Add("@OPTION", "1");
                dictParam.Add("@COMPANYID", intCompany_Id.ToString());
                DtRate = Utility.GetDefaultData("S3G_ORG_GETAPPLICATIONASSET", dictParam);
                if (DtRate.Rows.Count > 0)
                {
                    ddlLeaseAssetNo.DataSource = DtRate;
                    ddlLeaseAssetNo.DataTextField = "Asset_Code";
                    ddlLeaseAssetNo.DataValueField = "Asset_ID";
                    ddlLeaseAssetNo.DataBind();
                    ViewState["RateDt2"] = DtRate;
                }
                ddlLeaseAssetNo.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "0"));
                 * 
                for OL change*/
                //ObjStatus.Option = 38;
                //ObjStatus.Param1 = intCompany_Id.ToString();
                //DtFollowUp = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
                //ViewState["EntityMasterList"] = DtFollowUp;

                //DtFollowUp.Dispose();
                //FunPriLoad_AssetDetails(Mode);
            }

            if (Mode == _Edit)
            {
                ObjStatus.Option = 30;
                ObjStatus.Param1 = intCompany_Id.ToString();
                //Utility.FillDLL(ddlAssetCodeList, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));

            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling Asset Tab");
        }
        finally
        {
            //if (ObjCustomerService != null)
            ObjCustomerService.Close();
        }

    }
    private void FunPriResetAssetDetails()
    {
        txtUnitCount.Text = "1";
        txtUnitValue.Text = "";
        txtTotalAssetValue.Text = "";
        txtMarginAmountAsset.Text = "";
        txtMarginPercentage.Text = "";
        txtLpoAssetAmount.Text = "";
        txtMargintoDealer.Text = "";
        txtMargintoMFC.Text = "";
        txtTradeIn.Text = "";
        ddlAssetType.SelectedValue = "0";
        //txtRequiredFromDate.Text = "";
        //txtBlockDepreciationPerc.Text = "";
        //txtBookDepreciationPerc.Text = "";
        //txtStatus.Text = "";
        ddlEntityNameList.Clear();
        ddlAssetCodeList1.Clear();
        txtDownPaymentReceipt.Text = string.Empty;
        txtCustomerName.Text = string.Empty;
    }
    protected void FunProBindAssetGrid()
    {
        DataTable ObjDTAssetDetail = new DataTable();
        if (ViewState["ObjDTAssetDetails"] != null)
            ObjDTAssetDetail = (DataTable)ViewState["ObjDTAssetDetails"];

        if (ObjDTAssetDetail.Rows.Count == 0)
            lblTotalAssetAmount.Text = "0";
        else
            //lblTotalAssetAmount.Text = ((decimal)ObjDTAssetDetail.Compute("Sum(LPO_Amount)", "LPO_Amount > 0")).ToString();


            //if (chk_lblMargin.Checked)
            //{
            //    txtMarginMoneyAmount_Cashflow.Text = FunPriGetMarginAmout().ToString();
            //}

            gvAssetDetails.DataSource = ObjDTAssetDetail;
        gvAssetDetails.DataBind();
        gvAssetDetails.Columns[1].Visible = false;
        //gvAssetDetails.Columns[11].Visible = false;
        pnlAssetDtl.Visible = true;
        //added by saranya
        //if (ObjDTAssetDetail.Rows.Count > 0)
        //{
        //    if (Convert.ToInt32(ObjDTAssetDetail.Rows[0]["Status_Code"].ToString()) != 0)
        //    {
        //        gvAssetDetails.Columns[12].Visible = true;
        //    }
        //}
        //end 
        gvAssetDetails.Visible = true;
        //if (ddlLob.SelectedItem.Text.Split('-')[0].ToLower().StartsWith("ol"))
        //{

        //    //txtFacilityAmt.Text = Convert.ToDecimal(lblTotalAssetAmount.Text).ToString();//5366

        //}
        //txtFacilityAmt.Text = Convert.ToDecimal(lblTotalAssetAmount.Text).ToString();//5366
        if (ObjDTAssetDetail.Rows.Count > 0)
        {
            lblTotalAssetAmount.Text = txtFacilityAmt.Text = ((decimal)ObjDTAssetDetail.Compute("Sum(LPO_Amount)", "LPO_Amount > 0")).ToString("#,##0.000");

        }
        else
        {
            txtFacilityAmt.Text = "0.000";
        }


    }

    private void FunPriFillDepreciationRate()
    {
        try
        {

            DataTable dsGetCheckListDetails = new DataTable();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@OPTION", "7");
            strProParm.Add("@COMPANYID", intCompany_Id.ToString());
            strProParm.Add("@USERID", intUserId.ToString());
            strProParm.Add("@PROGRAMID", intProgramId.ToString());
            strProParm.Add("@Page_Mode", "C");
            strProParm.Add("@ASSET_CATEGORY_ID", ddlAssetCodeList1.SelectedValue);
            dsGetCheckListDetails = Utility.GetDefaultData("S3G_OR_LOAD_LOV", strProParm);
            if (dsGetCheckListDetails.Rows.Count > 0)
            {
                txtBookDepreciationPerc.Text = dsGetCheckListDetails.Rows[0]["BOOK_DEPRECIATION_RATE"].ToString();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    #endregion

    #region Repayment Details Tab

    private void FunPriFill_Repayment_Tab(string Mode)
    {
        ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            if (Mode == _Add)
            {
                //gvRepaymentDetails.ClearGrid();
                ObjStatus.Option = 52;
                DtRepayGrid = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);


            }
            if (Mode == _Edit)
            {
                if ((DataTable)ViewState["DtRepayGrid"] != null)
                    DtRepayGrid = (DataTable)ViewState["DtRepayGrid"];

            }

            //gvRepaymentDetails.DataSource = DtRepayGrid;
            //gvRepaymentDetails.DataBind();

            if (Mode == _Add)
            {
                DtRepayGrid.Rows.Clear();
                ViewState["DtRepayGrid"] = DtRepayGrid;
                //For TL
                ViewState["DtRepayGrid_TL"] = null;
                //gvRepaymentDetails.Rows[0].Cells.Clear();
                //gvRepaymentDetails.Rows[0].Visible = false;

                //gvRepaymentSummary.ClearGrid();

            }

            FunPriFillRepayment_ViewState();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error filling Repayment Tab");
        }
        finally
        {
            //if (ObjCustomerService != null)
            ObjCustomerService.Close();
        }
    }

    private void FunPriFillRepayment_ViewState()
    {
        try
        {
            //DropDownList ddlRepaymentCashFlow_RepayTab = gvRepaymentDetails.FooterRow.FindControl("ddlRepaymentCashFlow_RepayTab") as DropDownList;
            //if (ViewState["RepayCashInflowList"] != null)
            //{
            //    Utility.FillDLL(ddlRepaymentCashFlow_RepayTab, ((DataTable)ViewState["RepayCashInflowList"]), true);

            //}

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in loading repayment details from viewstate");
        }
    }

    //private bool FunPriValidateTotalAmount(out decimal decActualAmount, out decimal decTotalAmount, string strOption)
    //{
    //    decimal decFinAmount = FunPriGetAmountFinanced();

    //    if (strOption != "3")
    //    {

    //        decTotalAmount = decFinAmount + FunPriGetInterestAmount();
    //    }
    //    else
    //    {
    //        decTotalAmount = decFinAmount;
    //    }
    //    decActualAmount = 0;
    //    if (((DataTable)ViewState["DtRepayGrid"]).Rows.Count <= 0)
    //    {
    //        cvPricing.ErrorMessage = strErrorMessagePrefix + "Correct the following validation(s): <br/><br/>  Add atleast one row Repayment details";
    //        cvPricing.IsValid = false;
    //        return false;
    //    }
    //    DtRepayGrid = (DataTable)ViewState["DtRepayGrid"];

    //    // decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID = 23"), 0);
    //    if (!((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))))
    //    {
    //        decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID = 23"), 0);
    //    }
    //    else
    //    {
    //        DataRow[] dr = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23");
    //        if (dr.Length > 0)
    //        {
    //            decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID = 23"), 0);
    //        }
    //        else
    //        {
    //            decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID IN(91,35)"), 0);
    //        }

    //    }

    //    if (strOption == "1")
    //    {
    //        if (decActualAmount > decTotalAmount)
    //        {
    //            return false;
    //        }
    //        else
    //        {
    //            return true;
    //        }
    //    }
    //    else if (strOption == "2")
    //    {
    //        if (decActualAmount == decTotalAmount)
    //        {
    //            return true;
    //        }
    //        else
    //        {
    //            return false;
    //        }
    //    }
    //    else if (strOption == "3")
    //    {
    //        if (decActualAmount >= decTotalAmount)
    //        {
    //            return true;
    //        }
    //        else
    //        {
    //            return false;
    //        }
    //    }
    //    else
    //    {
    //        return false;
    //    }
    //}

    private bool FunPriValidateTenurePeriod(DateTime dtStartDate, DateTime dtEndDate)
    {
        DateTime dateInterval = new DateTime();

        //switch (ddlTenureType.SelectedItem.Text.ToLower())
        //{
        //    case "months":
        //        dateInterval = dtStartDate.AddMonths(Convert.ToInt32(txtTenure.Text));
        //        break;
        //    case "weeks":

        //        int intAddweeks = Convert.ToInt32(txtTenure.Text) * 7;
        //        dateInterval = dtStartDate.AddDays(intAddweeks);
        //        break;
        //    case "days":
        //        dateInterval = dtStartDate.AddDays(Convert.ToInt32(txtTenure.Text));
        //        break;
        //}

        if (dtEndDate > dateInterval)
        {
            return false;
        }
        else
        {
            return true;
        }

    }

    //private bool FunPriValidateTenurePeriod(int intActualTenurePeriod)
    //{
    //if (intActualTenurePeriod == Convert.ToInt32(txtTenure.Text))
    //{
    //    return true;
    //}
    //else
    //{
    //    return false;
    //}

    //}

    private void FunPriCalculateSummary(DataTable objDataTable, string strGroupByField, string strSumField)
    {
        try
        {
            DataTable dtSummaryDetails = Utility.FunPriCalculateSumAmount(objDataTable, strGroupByField, strSumField);
            DataRow[] dr = dtSummaryDetails.Select("1=1");
            dr[0]["TotalPeriodInstall"] = Math.Round(Convert.ToDecimal(dr[0]["TotalPeriodInstall"]), 3);
            dtSummaryDetails.AcceptChanges();
            //gvRepaymentSummary.DataSource = dtSummaryDetails;
            //gvRepaymentSummary.DataBind();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in calculating Summary");
        }

    }

    //private void FunFillNextInstallmentDate()
    //{
    //    DataRow[] drIstallmentRow;// = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23", "ToInstall Desc");
    //    if (!((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))))
    //    {
    //        drIstallmentRow = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23", "ToInstall Desc");
    //    }
    //    else
    //    {
    //        DataRow[] dr = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23");
    //        if (dr.Length > 0)
    //        {
    //            drIstallmentRow = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23", "ToInstall Desc"); ;
    //        }
    //        else
    //        {
    //            drIstallmentRow = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID IN(91,35)", "ToInstall Desc"); ;
    //        }

    //    }


    //    if (drIstallmentRow.Count() > 0)
    //    {

    //        TextBox txtFromInstallment_RepayTab1_upd = gvRepaymentDetails.FooterRow.FindControl("txtFromInstallment_RepayTab") as TextBox;
    //        //txtFromInstallment_RepayTab1_upd.Text = drIstallmentRow[0][6].ToString();
    //        txtFromInstallment_RepayTab1_upd.Text = Convert.ToString(Convert.ToDecimal(drIstallmentRow[0][6].ToString()) + Convert.ToInt32("1"));
    //        TextBox txtfromdate_RepayTab1_Upd = gvRepaymentDetails.FooterRow.FindControl("txtfromdate_RepayTab") as TextBox;
    //        //txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(drIstallmentRow[0][8].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);

    //        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //        objRepaymentStructure.dtNextDate = S3GBusEntity.CommonS3GBusLogic.FunPubGetNextDate(ddl_Frequency.SelectedValue, Utility.StringToDate(Convert.ToDateTime(drIstallmentRow[0][8].ToString()).ToString(strDateFormat)));
    //        txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(objRepaymentStructure.dtNextDate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);

    //    }
    //}


    //private void FunPriDoCashflowBasedValidation(DropDownList ddlCashFlowDesc)
    //{
    //    try
    //    {
    //        if (ddlCashFlowDesc.SelectedIndex > 0)
    //        {
    //            string[] strvalues = ddlCashFlowDesc.SelectedValue.Split(',');
    //            DropDownList ddlRepaymentCashFlow_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("ddlRepaymentCashFlow_RepayTab") as DropDownList;
    //            TextBox txtFromInstallment_RepayTab1_upd = gvRepaymentDetails.FooterRow.FindControl("txtFromInstallment_RepayTab") as TextBox;
    //            TextBox txtfromdate_RepayTab1_Upd = gvRepaymentDetails.FooterRow.FindControl("txtfromdate_RepayTab") as TextBox;
    //            TextBox txtPerInstallmentAmount_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtPerInstallmentAmount_RepayTab") as TextBox;
    //            TextBox txtBreakup_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtBreakup_RepayTab") as TextBox;

    //            AjaxControlToolkit.CalendarExtender CalendarExtenderSD_ToDate_RepayTab = gvRepaymentDetails.FooterRow.FindControl("CalendarExtenderSD_ToDate_RepayTab") as AjaxControlToolkit.CalendarExtender;
    //            AjaxControlToolkit.CalendarExtender CalendarExtenderSD_fromdate_RepayTab = gvRepaymentDetails.FooterRow.FindControl("CalendarExtenderSD_fromdate_RepayTab") as AjaxControlToolkit.CalendarExtender;
    //            //!=23 for checking cash flows other than Installment.Since 23 is the cashflow flag for Installment

    //            CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //            txtfromdate_RepayTab1_Upd.Attributes.Add("readonly", "readonly");
    //            txtfromdate_RepayTab1_Upd.ReadOnly = true;

    //            if (!ddlLob.SelectedItem.Text.Contains("TL"))
    //            {
    //                if (strvalues[4].ToString() != "23")
    //                {
    //                    txtFromInstallment_RepayTab1_upd.Attributes.Remove("readonly");
    //                    txtFromInstallment_RepayTab1_upd.ReadOnly = false;
    //                    CalendarExtenderSD_ToDate_RepayTab.Enabled = false;
    //                    CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //                    txtfromdate_RepayTab1_Upd.Text = "";
    //                    txtBreakup_RepayTab1.Text = "";
    //                    txtBreakup_RepayTab1.Attributes.Add("readonly", "readonly");
    //                }
    //                else
    //                {
    //                    if (ddl_Time_Value.SelectedValue == "2" || ddl_Time_Value.SelectedValue == "4")
    //                    {
    //                        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //                        objRepaymentStructure.dtNextDate = S3GBusEntity.CommonS3GBusLogic.FunPubGetNextDate(ddl_Frequency.SelectedValue, Utility.StringToDate(DateTime.Now.ToString(strDateFormat)));
    //                        if (gvRepaymentDetails.Rows.Count > 0 && txtfromdate_RepayTab1_Upd.Text == "")  // 24 Jan 2012 By Rao. Fixed Observation- From Date Overlapping issue while selecting cashflow. 
    //                            txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(objRepaymentStructure.dtNextDate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
    //                    }
    //                    else
    //                    {
    //                        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //                        objRepaymentStructure.FunPubGetNextRepaydate((DataTable)ViewState["DtRepayGrid"], ddl_Frequency.SelectedValue);
    //                        txtFromInstallment_RepayTab1_upd.Text = Convert.ToString(objRepaymentStructure.intNextInstall + 1);
    //                        txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(objRepaymentStructure.dtNextDate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
    //                    }

    //                    if (ddl_Rate_Type.SelectedItem.Text.Trim().ToUpper() == "FLOATING")
    //                    {
    //                        if (((DataTable)ViewState["DtRepayGrid"]).Rows.Count == 0)
    //                        {
    //                            CalendarExtenderSD_fromdate_RepayTab.Enabled = true;
    //                            txtfromdate_RepayTab1_Upd.ReadOnly = false;
    //                        }
    //                        else
    //                        {
    //                            CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //                            txtfromdate_RepayTab1_Upd.ReadOnly = true;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //                        txtfromdate_RepayTab1_Upd.ReadOnly = true;
    //                    }

    //                    txtFromInstallment_RepayTab1_upd.Attributes.Add("readonly", "readonly");
    //                    txtBreakup_RepayTab1.Attributes.Remove("readonly");
    //                    txtFromInstallment_RepayTab1_upd.ReadOnly = true;

    //                    CalendarExtenderSD_ToDate_RepayTab.Enabled = true;
    //                    CalendarExtenderSD_ToDate_RepayTab.Format = ObjS3GSession.ProDateFormatRW;


    //                    CalendarExtenderSD_fromdate_RepayTab.Format = ObjS3GSession.ProDateFormatRW;
    //                }

    //            }
    //            else
    //            {
    //                if (strvalues[4].ToString() != "91")
    //                {
    //                    txtFromInstallment_RepayTab1_upd.Attributes.Remove("readonly");
    //                    txtFromInstallment_RepayTab1_upd.ReadOnly = false;
    //                    CalendarExtenderSD_ToDate_RepayTab.Enabled = false;
    //                    CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //                    txtfromdate_RepayTab1_Upd.Text = "";
    //                    txtBreakup_RepayTab1.Text = "";
    //                    txtBreakup_RepayTab1.Attributes.Add("readonly", "readonly");
    //                }
    //                else
    //                {
    //                    if (ddl_Time_Value.SelectedValue == "2" || ddl_Time_Value.SelectedValue == "4")
    //                    {
    //                        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //                        objRepaymentStructure.FunPubGetNextRepaydate((DataTable)ViewState["DtRepayGrid"], ddl_Frequency.SelectedValue);
    //                        //objRepaymentStructure.dtNextDate = S3GBusEntity.CommonS3GBusLogic.FunPubGetNextDate(ddl_Frequency.SelectedValue, Utility.StringToDate(DateTime.Now.ToString(strDateFormat)));
    //                        //if (gvRepaymentDetails.Rows.Count > 0 && txtfromdate_RepayTab1_Upd.Text == "")  // 24 Jan 2012 By Rao. Fixed Observation- From Date Overlapping issue while selecting cashflow. 
    //                        //    txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(objRepaymentStructure.dtNextDate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
    //                    }
    //                    else
    //                    {
    //                        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //                        objRepaymentStructure.FunPubGetNextRepaydateTL((DataTable)ViewState["DtRepayGrid"], ddl_Frequency.SelectedValue, ddlRepaymentCashFlow_RepayTab1.SelectedValue);
    //                        txtFromInstallment_RepayTab1_upd.Text = Convert.ToString(objRepaymentStructure.intNextInstall + 1);
    //                        txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(objRepaymentStructure.dtNextDate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
    //                    }

    //                    if (ddl_Rate_Type.SelectedItem.Text.Trim().ToUpper() == "FLOATING")
    //                    {
    //                        if (((DataTable)ViewState["DtRepayGrid"]).Rows.Count == 0)
    //                        {
    //                            CalendarExtenderSD_fromdate_RepayTab.Enabled = true;
    //                            txtfromdate_RepayTab1_Upd.ReadOnly = false;
    //                        }
    //                        else
    //                        {
    //                            CalendarExtenderSD_fromdate_RepayTab.Enabled = false;
    //                            txtfromdate_RepayTab1_Upd.ReadOnly = true;
    //                        }
    //                    }
    //                    else
    //                    {
    //                        CalendarExtenderSD_fromdate_RepayTab.Enabled = true;
    //                        txtfromdate_RepayTab1_Upd.ReadOnly = false;
    //                    }
    //                }

    //                //txtFromInstallment_RepayTab1_upd.Attributes.Add("readonly", "readonly");
    //                //txtBreakup_RepayTab1.Attributes.Remove("readonly");
    //                //txtFromInstallment_RepayTab1_upd.ReadOnly = true;

    //                CalendarExtenderSD_ToDate_RepayTab.Enabled = true;
    //                CalendarExtenderSD_ToDate_RepayTab.Format = ObjS3GSession.ProDateFormatRW;


    //                CalendarExtenderSD_fromdate_RepayTab.Format = ObjS3GSession.ProDateFormatRW;
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex);
    //        throw new ApplicationException(ex.Message);
    //    }
    //}

    //private void FunPriAddRepaymentSchedule()
    //{
    //    try
    //    {
    //        DtRepayGrid = (DataTable)ViewState["DtRepayGrid"];
    //        DateTime dtNextFromdate; DateTime dtStartdate;
    //        DropDownList ddlRepaymentCashFlow_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("ddlRepaymentCashFlow_RepayTab") as DropDownList;

    //        if (ddlRepaymentCashFlow_RepayTab1.SelectedValue == "-1")
    //        {
    //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Select the Repayment CashFlow');", true);
    //            ddlRepaymentCashFlow_RepayTab1.Focus();
    //            return;
    //        }

    //        TextBox txtAmountRepaymentCashFlow_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtAmountRepaymentCashFlow_RepayTab") as TextBox;
    //        TextBox txtPerInstallmentAmount_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtPerInstallmentAmount_RepayTab") as TextBox;
    //        TextBox txtBreakup_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtBreakup_RepayTab") as TextBox;
    //        TextBox txtFromInstallment_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtFromInstallment_RepayTab") as TextBox;
    //        TextBox txtToInstallment_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtToInstallment_RepayTab") as TextBox;
    //        TextBox txtfromdate_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtfromdate_RepayTab") as TextBox;
    //        TextBox txtToDate_RepayTab1 = gvRepaymentDetails.FooterRow.FindControl("txtToDate_RepayTab") as TextBox;
    //        string[] strIds = ddlRepaymentCashFlow_RepayTab1.SelectedValue.ToString().Split(',');

    //        //if (Convert.ToInt32(txtToInstallment_RepayTab1.Text) > Convert.ToInt32(txtTenure.Text))
    //        //{
    //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('To Installment should not exceed Tenure');", true);
    //        //    txtToInstallment_RepayTab1.Focus();
    //        //    return;
    //        //}
    //        //if (txtfromdate_RepayTab1.Text.Trim() != "" &&
    //        //   (Utility.StringToDate(txtfromdate_RepayTab1.Text.Trim()) < Utility.StringToDate(txtOfferDate.Text.Trim())))
    //        //{
    //        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('From Date should be greater than or Equal to Offer Date');", true);
    //        //    return;
    //        //}


    //        if (strIds[4] == "23") // Installment
    //        {
    //            if (DtRepayGrid.Rows.Count > 0)
    //            {
    //                FunPriGetNextRepaydate();
    //                if (Utility.StringToDate(txtfromdate_RepayTab1.Text) < dtNextDate)
    //                {
    //                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('From and To Installment should not be overlaped');", true);
    //                    txtToInstallment_RepayTab1.Focus();
    //                    return;
    //                }

    //            }
    //        }
    //        else
    //        {
    //            if (DtRepayGrid.Rows.Count > 0)
    //            {
    //                DataRow[] drRepayDetail = null;
    //                drRepayDetail = DtRepayGrid.Select(" CASHFLOW_FLAG_ID = " + strIds[4] +
    //                    " and (( " + txtFromInstallment_RepayTab1.Text.Trim() + " >= FROMINSTALL " +
    //                    " and " + txtFromInstallment_RepayTab1.Text.Trim() + " <= TOINSTALL ) or " +
    //                    " ( " + txtToInstallment_RepayTab1.Text.Trim() + " >= FROMINSTALL and " +
    //                    txtToInstallment_RepayTab1.Text.Trim() + " <= TOINSTALL) or " +
    //                    " ( FROMINSTALL >= " + txtFromInstallment_RepayTab1.Text.Trim() +
    //                    " and FROMINSTALL <= " + txtToInstallment_RepayTab1.Text.Trim() + " ))");
    //                if (drRepayDetail.Count() > 0)
    //                {
    //                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('From and To Installment should not be overlaped');", true);
    //                    txtToInstallment_RepayTab1.Focus();
    //                    return;
    //                }
    //            }
    //        }
    //        // Code Added By R. Mankandan 11 - MAR - 2015
    //        // To the Mail Raised by Vishal should not allow user to select the date exit the tenure
    //        if (DtRepayGrid.Rows.Count == 0)
    //        {
    //            //DateTime strRepaymentEndDate;
    //            //if (ddlTenureType.SelectedValue == "136")
    //            //    strRepaymentEndDate = (Utility.StringToDate(txtOfferDate.Text)).AddDays(Convert.ToInt32(txtTenure.Text));
    //            //else if (ddlTenureType.SelectedValue == "134")
    //            //    strRepaymentEndDate = (Utility.StringToDate(txtOfferDate.Text)).AddMonths(Convert.ToInt32(txtTenure.Text));
    //            //else
    //            //    strRepaymentEndDate = (Utility.StringToDate(txtOfferDate.Text)).AddDays(Convert.ToInt32(txtTenure.Text) * 7);
    //            //if (strRepaymentEndDate < Utility.StringToDate(txtfromdate_RepayTab1.Text))
    //            //{
    //            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Repayment From Date cannot exit the total tenure');", true);
    //            //    txtToInstallment_RepayTab1.Focus();
    //            //    return;
    //            //}
    //        }
    //        // code added by R. MAnikandan on 11-Mar-2015 End

    //        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //        Dictionary<string, string> objMethodParameters = new Dictionary<string, string>();
    //        objMethodParameters.Add("REPAYMODE", ddl_Repayment_Mode.SelectedItem.Text.ToString());
    //        objMethodParameters.Add("LOB", ddlLob.SelectedItem.Text.ToString());
    //        objMethodParameters.Add("CashFlow", ddlRepaymentCashFlow_RepayTab1.SelectedItem.Text);
    //        objMethodParameters.Add("CashFlowId", ddlRepaymentCashFlow_RepayTab1.SelectedValue);
    //        objMethodParameters.Add("PerInstall", txtPerInstallmentAmount_RepayTab1.Text);
    //        objMethodParameters.Add("Breakup", txtBreakup_RepayTab1.Text);
    //        objMethodParameters.Add("FromInstall", txtFromInstallment_RepayTab1.Text);
    //        objMethodParameters.Add("ToInstall", txtToInstallment_RepayTab1.Text);
    //        objMethodParameters.Add("FromDate", txtfromdate_RepayTab1.Text);
    //        objMethodParameters.Add("Frequency", ddl_Frequency.SelectedItem.Value);
    //        //objMethodParameters.Add("TenureType", ddlTenureType.SelectedItem.Text);
    //        //objMethodParameters.Add("Tenure", txtTenure.Text);
    //        // Modified By R. Manikandan to Validate First Repayment Date as 16 - Mar - 2015
    //        //objMethodParameters.Add("DocumentDate", txtOfferDate.Text);
    //        if (ddl_Repayment_Mode.SelectedValue == "2" && DtRepayGrid.Rows.Count > 0)
    //            objMethodParameters.Add("DocumentDate", DtRepayGrid.Rows[0]["fromdate"].ToString());
    //        else
    //        {
    //            if (txtfromdate_RepayTab1.Text.Trim() != string.Empty)
    //            {
    //                objMethodParameters.Add("DocumentDate", Utility.StringToDate(txtfromdate_RepayTab1.Text).ToString());
    //                //objMethodParameters.Add("DocumentDate", txtfromdate_RepayTab1.Text);
    //            }
    //            else
    //            {
    //                objMethodParameters.Add("DocumentDate", DtRepayGrid.Rows[0]["fromdate"].ToString());
    //            }
    //        }

    //        //dtStartdate = Utility.StringToDate(txtOfferDate.Text);
    //        string strErrorMessage = "";
    //        //objRepaymentStructure.FunPubAddRepayment(out dtNextFromdate, out strErrorMessage, out DtRepayGrid, DtRepayGrid, objMethodParameters);
    //        if (ddlLob.SelectedItem.Text.Contains("TL") || ddlLob.SelectedItem.Text.Contains("TE"))
    //        {
    //            //For TL
    //            objMethodParameters.Add("repayMode_id", ddl_Repayment_Mode.SelectedValue);
    //            objMethodParameters.Add("Levy", ddl_Interest_Levy.SelectedItem.Value);

    //            //Checking if other than normal payment , start date should be last payment date.
    //            if (ddl_Repayment_Mode.SelectedValue != "5" && ddl_Return_Pattern.SelectedValue == "6")
    //            {
    //                DataTable dtAcctype = ((DataTable)ViewState["PaymentRules"]);
    //                dtAcctype.DefaultView.RowFilter = " FieldName = 'AccountType'";
    //                string strAcctType = dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString().Trim().ToUpper();

    //                if (strAcctType == "PROJECT FINANCE" || strAcctType == "DEFERRED PAYMENT" || strAcctType == "DEFERRED STRUCTURED")
    //                {
    //                    DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
    //                    if (DtCashFlowOut.Rows.Count > 0)
    //                    {
    //                        DataRow drOutFlw = DtCashFlowOut.Select("CashFlow_Flag_ID=41").Last();
    //                        if (drOutFlw != null)
    //                        {
    //                            objMethodParameters.Remove("DocumentDate");
    //                            objMethodParameters.Add("DocumentDate", drOutFlw["Date"].ToString());
    //                            dtStartdate = Utility.StringToDate(drOutFlw["Date"].ToString());
    //                        }
    //                    }

    //                }
    //            }
    //            objRepaymentStructure.FunPubAddRepaymentforTL(out dtNextFromdate, out strErrorMessage, out DtRepayGrid, DtRepayGrid, objMethodParameters);
    //        }
    //        else
    //        {
    //            objRepaymentStructure.FunPubAddRepayment(out dtNextFromdate, out strErrorMessage, out DtRepayGrid, DtRepayGrid, objMethodParameters);
    //        }

    //        if (strErrorMessage != "")
    //        {
    //            Utility.FunShowAlertMsg(this, strErrorMessage);
    //            return;
    //        }

    //        if (strIds[4] == "23")
    //        {
    //            decimal decIRRActualAmount = 0;
    //            decimal decTotalAmount = 0;
    //            //if (!objRepaymentStructure.FunPubValidateTotalAmount(DtRepayGrid, txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedItem.Value, txtRate.Text, ddlTenureType.SelectedItem.Text, txtTenure.Text, out decIRRActualAmount, out decTotalAmount, "1", Convert.ToDecimal(hdnRoundOff.Value)))
    //            //{
    //            //    Utility.FunShowAlertMsg(this, "Total Amount Should be equal to facility amount + interest (" + decTotalAmount + ")");
    //            //    if (DtRepayGrid.Rows.Count > 0)
    //            //        DtRepayGrid.Rows.RemoveAt(DtRepayGrid.Rows.Count - 1);
    //            //    return;
    //            //}

    //            //if (!((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLOB.SelectedItem.Text.ToUpper().Contains("TE"))))
    //            //{
    //            //    decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID = 23"), 0);
    //            //}
    //            //else
    //            //{
    //            //    DataRow[] dr = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23");
    //            //    if (dr.Length > 0)
    //            //    {
    //            //        decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID = 23"), 0);
    //            //    }
    //            //    else
    //            //    {
    //            //        decActualAmount = Math.Round((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(TotalPeriodInstall)", "CashFlow_Flag_ID IN(91,35)"), 0);
    //            //    }

    //            //}
    //            if (!((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))))
    //            {
    //                if (((decimal)DtRepayGrid.Compute("Sum(Breakup)", "CashFlow_Flag_ID = 23")) > 100)
    //                {
    //                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Breakup Percentage cannot be greater that 100%');", true);
    //                    if (DtRepayGrid.Rows.Count > 0)
    //                        DtRepayGrid.Rows.RemoveAt(DtRepayGrid.Rows.Count - 1);
    //                    return;
    //                }
    //            }
    //            else
    //            {
    //                DataRow[] dr = DtRepayGrid.Select("CashFlow_Flag_ID = 23");
    //                if (dr.Length > 0)
    //                {
    //                    if (((decimal)DtRepayGrid.Compute("Sum(Breakup)", "CashFlow_Flag_ID = 23")) > 100)
    //                    {
    //                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Breakup Percentage cannot be greater that 100%');", true);
    //                        if (DtRepayGrid.Rows.Count > 0)
    //                            DtRepayGrid.Rows.RemoveAt(DtRepayGrid.Rows.Count - 1);
    //                        return;
    //                    }
    //                }
    //                else
    //                {
    //                    if (((decimal)DtRepayGrid.Compute("Sum(Breakup)", "CashFlow_Flag_ID = 23")) > 100)
    //                    {
    //                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Breakup Percentage cannot be greater that 100%');", true);
    //                        if (DtRepayGrid.Rows.Count > 0)
    //                            DtRepayGrid.Rows.RemoveAt(DtRepayGrid.Rows.Count - 1);
    //                        return;
    //                    }
    //                }

    //            }

    //        }

    //        gvRepaymentDetails.DataSource = DtRepayGrid;
    //        gvRepaymentDetails.DataBind();

    //        /*TextBox txtFromInstallment_RepayTab1_upd = gvRepaymentDetails.FooterRow.FindControl("txtFromInstallment_RepayTab") as TextBox;
    //        Label lblToInstallment_Upd = (Label)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lblToInstallment_RepayTab");
    //        txtFromInstallment_RepayTab1_upd.Text = Convert.ToString(Convert.ToDecimal(lblToInstallment_Upd.Text.Trim()) + Convert.ToInt32("1"));
    //        TextBox txtfromdate_RepayTab1_Upd = gvRepaymentDetails.FooterRow.FindControl("txtfromdate_RepayTab") as TextBox;
    //        txtfromdate_RepayTab1_Upd.Text = DateTime.Parse(dtNextFromdate.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
    //         */
    //        ViewState["DtRepayGrid"] = DtRepayGrid;

    //        if (ViewState["DtRepayGrid_TL"] != null)
    //        {
    //            DataTable DtRepayGrid_TL = (DataTable)ViewState["DtRepayGrid_TL"];
    //            DataRow drow = DtRepayGrid_TL.NewRow();

    //            for (int i = 0; i <= DtRepayGrid_TL.Columns.Count - 1; i++)
    //            {
    //                drow[i] = DtRepayGrid.Rows[DtRepayGrid.Rows.Count - 1][i].ToString();
    //            }

    //            DtRepayGrid_TL.Rows.Add(drow);
    //            ViewState["DtRepayGrid_TL"] = DtRepayGrid_TL;
    //        }


    //        FunFillNextInstallmentDate();
    //        FunPriFillRepayment_ViewState();
    //        FunPriIRRReset();
    //        FunPriCalculateSummary(DtRepayGrid, "CashFlow", "TotalPeriodInstall");
    //        ((LinkButton)gvRepaymentDetails.Rows[gvRepaymentDetails.Rows.Count - 1].FindControl("lnRemoveRepayment")).Visible = true;
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}

    #endregion

    #region Alert Tab

    private void FunPriFill_Alert_Tab(string Mode)
    {
        //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        try
        {

            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();

            Dictionary<string, string> objParameters = new Dictionary<string, string>();
            objParameters.Add("@CompanyId", intCompany_Id.ToString());
            objParameters.Add("@ProgramId", "42");
            DataSet dsAlert = Utility.GetDataset("s3g_org_loadAlertLov", objParameters);
            //added by saranya on 08-Mar-2012 based on sudarsan observation to add Programs in Type field
            //DataRow[] dr = dsAlert.Tables[0].Select("ID in(141,143,218,142,217)");
            DataTable dtAlert = dsAlert.Tables[0];
            ViewState["AlertDDL"] = dtAlert;
            ViewState["AlertUser"] = dsAlert;
            //End Here


            if (Mode == _Add)
            {

                //ObjStatus.Option = 1;
                //ObjStatus.Param1 = S3G_Statu_Lookup.ALERT_TYPE.ToString();
                //ViewState["Alert_Type"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                //ObjStatus.Option = 35;
                //ObjStatus.Param1 = intCompany_Id.ToString();
                //ViewState["UserList"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                DataTable ObjDT = new DataTable();
                //  ObjStatus.Option = 46;
                //ObjStatus.Param1 = null;
                // ObjDT = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
                ObjDT.Columns.Add("Type");
                ObjDT.Columns.Add("TypeID");
                ObjDT.Columns.Add("UserContact");
                ObjDT.Columns.Add("UserContactID");
                ObjDT.Columns.Add("EMail");
                ObjDT.Columns["Email"].DataType = typeof(Boolean);
                ObjDT.Columns.Add("SMS");
                ObjDT.Columns["SMS"].DataType = typeof(Boolean);
                DataRow dr_Alert = ObjDT.NewRow();
                dr_Alert["Type"] = "";
                dr_Alert["TypeID"] = "";
                dr_Alert["UserContact"] = "";
                dr_Alert["UserContactID"] = "";
                dr_Alert["EMail"] = "False";
                dr_Alert["SMS"] = "False";
                ObjDT.Rows.Add(dr_Alert);

                gvAlert.DataSource = ObjDT;
                gvAlert.DataBind();

                ObjDT.Rows.Clear();
                ViewState["DtAlertDetails"] = ObjDT;

                gvAlert.Rows[0].Cells.Clear();
                gvAlert.Rows[0].Visible = false;


            }
            FunPriFillAlert_ViewState();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling alert tab");
        }
        //finally
        //{
        //    //if (ObjCustomerService != null)
        //        ObjCustomerService.Close();
        //}
    }

    private void FunPriFillAlert_ViewState()
    {
        try
        {
            DropDownList ObjddlType_AlertTab = gvAlert.FooterRow.FindControl("ddlType_AlertTab") as DropDownList;
            //DropDownList ObjddlContact_AlertTab = gvAlert.FooterRow.FindControl("ddlContact_AlertTab") as DropDownList;

            Utility.FillDLL(ObjddlType_AlertTab, ((DataTable)ViewState["AlertDDL"]), true);
            //Utility.FillDLL(ObjddlContact_AlertTab, ((DataSet)ViewState["AlertUser"]).Tables[1], true);

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling alert tab from viewstate");
        }
    }

    #endregion

    #region Follow Up Tab

    private void FunPriFillFollowUp_Tab(string Mode)
    {
        ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();

        try
        {

            //ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
            S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();
            DataTable ObjDT = new DataTable();
            if (Mode == _Add)
            {

                ObjStatus.Option = 35;
                ObjStatus.Param1 = intCompany_Id.ToString();
                ViewState["UserListFolloup"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                ObjStatus.Option = 47;
                ObjStatus.Param1 = null;
                ObjDT = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);
                ObjDT.Columns.Add("FromUserId");
                ObjDT.Columns.Add("ToUserId");
                //ObjDT.Columns.Add("FromUserId");


            }
            if (Mode == _Edit)
            {
                ObjStatus.Option = 35;
                ObjStatus.Param1 = intCompany_Id.ToString();
                ViewState["UserListFolloup"] = ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus);

                if (((DataTable)ViewState["DtFollowUp"]) != null)
                    ObjDT = (DataTable)ViewState["DtFollowUp"];

            }


            //gvFollowUp.DataSource = ObjDT;
            //gvFollowUp.DataBind();

            if (Mode == _Add)
            {
                ObjDT.Rows.Clear();
                ViewState["DtFollowUp"] = ObjDT;
                //if (gvFollowUp.Rows.Count > 0)
                //{
                //    gvFollowUp.Rows[0].Cells.Clear();
                //    gvFollowUp.Rows[0].Visible = false;
                //}
            }
            FunPriFillFollowUp_ViewState();


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling followup tab");
        }
        finally
        {
            //if (ObjCustomerService != null)
            ObjCustomerService.Close();
        }

    }

    private void FunPriFillFollowUp_ViewState()
    {
        try
        {
            //Removed By Shibu 18-Sep-2013 Changed to (Auto Suggestion)
            //DropDownList ddlfrom_GridFollowup = gvFollowUp.FooterRow.FindControl("ddlfrom_GridFollowup") as DropDownList;
            //DropDownList ddlTo_GridFollowup = gvFollowUp.FooterRow.FindControl("ddlTo_GridFollowup") as DropDownList;

            //Utility.FillDLL(ddlfrom_GridFollowup, ((DataSet)ViewState["AlertUser"]).Tables[1], true);
            //Utility.FillDLL(ddlTo_GridFollowup, ((DataSet)ViewState["AlertUser"]).Tables[1], true);


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in filling followup tab from viewstate");
        }
    }


    #endregion

    #region Document Details

    private void FunPriGetConstitutionCodeDetails(string intCustID)
    {
        Procparam = new Dictionary<string, string>();
        try
        {
            Procparam.Add("@CompanyId", intCompany_Id.ToString());
            Procparam.Add("@IsActive", "1");
            Procparam.Add("@CustomerId", intCustID.ToString());
            DataTable dt = Utility.GetDefaultData("s3g_Org_GetConstitution_Customer", Procparam);
            if (dt.Rows.Count > 0)
            {
                ViewState["ConsitutionId"] = dt.Rows[0]["CONSTITUTION_ID"].ToString();
            }
            //grvConsDocuments.BindGridView("s3g_Org_GetConstitution_Customer", Procparam);

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Load the Constitution Documents");
        }
    }

    private void FunPriLoadPreDisbursementDocument()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANYID", intCompany_Id.ToString());
            Procparam.Add("@USERID", intUserId.ToString());
            Procparam.Add("@PROGRAMID", "42");
            if (ddlLob.SelectedValue != "0")
            {
                Procparam.Add("@LOBID", ddlLob.SelectedValue);
            }
            else
            {
                hdnSetForceValues.Value = "0";
                return;
            }

            if (ViewState["ConsitutionId"] != null)
            {
                Procparam.Add("@CONSTITUTIONID", Convert.ToString(ViewState["ConsitutionId"]));
            }
            if (ddlProduct.SelectedValue != "0")
            {
                Procparam.Add("@PRODUCTID", ddlProduct.SelectedValue);
            }
            Procparam.Add("@CONT_TYPE", ddlContType.SelectedValue);
            if (ViewState["Occupation"] != null)
            {
                Procparam.Add("@OCCUPATION_ID", ViewState["Occupation"].ToString());
            }
            //Start Afetr Interface Review Changes for DMS
            if (hdnIsDMS.Value == "1") // for DMS
            {
                Procparam.Add("@PRICING_ID", intPricingId.ToString());
                //Procparam.Add("@PRICING_ID", hdnPricing_ID.Value); As discussed hdnPricing_ID Commented Flag
            }
            //End Afetr Interface Review Changes for DMS
            else
            {
                Procparam.Add("@PRICING_ID", intPricingId.ToString());
            }
            //if (hdnIsDMS.Value != "1") // for DMS As discussed Commented Flag (hdnIsDMS.Value != "1") 
            //{
            DataSet dsPDDCustomer = Utility.GetDataset("S3G_OR_Get_LoadCustPDD", Procparam);
            funPriBindDocGridViewPaging();
            //}

            hdnIsLoad.Value = "0";

            //Panel8.Visible = true;
            //ViewState["dtPDDCustomer"] = dsPDDCustomer.Tables[0];
            //gvPRDDT.DataSource = dsPDDCustomer;
            //gvPRDDT.EmptyDataText = "Check List Documents not Defined in Pre Disbursemetn Document Master";
            //gvPRDDT.DataBind();


            //if (dsPDDCustomer.Tables[0].Rows.Count > 0)
            //{
            //    btnViewDocuments.Text = "Update Documents";
            //}
            //else
            //{
            //    btnViewDocuments.Text = "View Documents";
            //}

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Load Pre-Disbursement Documents");
        }
    }

    private bool FunPriIsValidConstitution()
    {
        bool blnIsValid = true;

        //foreach (GridViewRow gvRow in grvConsDocuments.Rows)
        //{

        //    CheckBox chkIsMandatory = (CheckBox)gvRow.FindControl("chkIsMandatory");
        //    CheckBox chkCollected = (CheckBox)gvRow.FindControl("chkCollected");
        //    TextBox txtDocValues = (TextBox)gvRow.FindControl("txtValues");
        //    if (chkCollected != null && chkIsMandatory != null)
        //    {
        //        if (chkIsMandatory.Checked && !chkCollected.Checked)
        //        {
        //            cvPricing.ErrorMessage = strErrorMessagePrefix + "Choose the Collected in Document Details";
        //            cvPricing.IsValid = false;
        //            return false;
        //        }

        //        if (chkCollected.Checked)
        //        {
        //            if (gvRow.Cells[1].Text.Trim().ToUpper().Contains("CID"))
        //            {
        //                if (txtDocValues.Text.Trim() == "")
        //                {
        //                    cvPricing.ErrorMessage = strErrorMessagePrefix + "Value cannot empty for collected document in Document Details";
        //                    cvPricing.IsValid = false;
        //                    return false;
        //                }
        //            }
        //        }
        //    }
        //    CheckBox chkIsNeedImageCopy = (CheckBox)gvRow.FindControl("chkIsNeedImageCopy");
        //    CheckBox chkScanned = (CheckBox)gvRow.FindControl("chkScanned");
        //    if (chkScanned != null && chkIsNeedImageCopy != null)
        //    {
        //        if (chkIsNeedImageCopy.Checked && !chkScanned.Checked)
        //        {
        //            cvPricing.ErrorMessage = strErrorMessagePrefix + "Choose the Scanned in Document Details";
        //            cvPricing.IsValid = false;
        //            //tcPricing.ActiveTabIndex = 6;
        //            return false;
        //        }
        //    }
        //}
        return blnIsValid;
    }

    //private bool FunPriValidateConsDoct(out string strErrorMode)
    //{
    //    bool blnIsValid = true;
    //    strErrorMode = "";
    //    foreach (GridViewRow gvRow in grvConsDocuments.Rows)
    //    {

    //        if (gvRow.Cells[1].Text.Trim().ToUpper().Contains("CID"))
    //        {
    //            CheckBox chkCollected = gvRow.FindControl("chkCollected");
    //            TextBox txtDocValues = gvRow.FindControl("txtValues");                
    //            if (chkCollected.Checked)
    //            {
    //                if (txtDocValues.Text.Trim() = "")
    //                {
    //                    blnIsValid = false;

    //                }
    //            }
    //        }
    //    }



    //    return blnIsValid;
    //}


    private bool FunPriValidatePRDt(out string strErrorMode)
    {
        bool blnIsValid = true;
        strErrorMode = "";
        foreach (GridViewRow gvRow in gvPRDDT.Rows)
        {
            CheckBox Cbx1 = gvRow.FindControl("CbxCheck") as CheckBox;
            Label lblScanned = gvRow.FindControl("lblScanned") as Label;
            TextBox txOD = gvRow.FindControl("txOD") as TextBox;
            if (Cbx1.Checked == false)
            {
                blnIsValid = false;
                strErrorMode = "Not Collected";
                break;
            }
            if (lblScanned.Text != "False")
            {
                if (txOD.Text == "")
                {
                    blnIsValid = false;
                    strErrorMode = "Not Scanned";
                    break;
                }
            }
        }
        return blnIsValid;
    }




    #endregion

    //private decimal FunPriGetMarginAmout()
    //{
    //    decimal decMarginAmount;

    //    if (((!ddlLob.SelectedItem.Text.ToUpper().StartsWith("FT")) && (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("WC"))))
    //    {
    //        if (txtMarginMoneyPer_Cashflow.Text != "")
    //        {
    //            decMarginAmount = (Convert.ToDecimal(lblTotalAssetAmount.Text) * (Convert.ToDecimal(txtMarginMoneyPer_Cashflow.Text) / 100));
    //        }
    //        else
    //        {
    //            decMarginAmount = 0;
    //        }
    //    }
    //    else
    //    {
    //        decMarginAmount = 0;
    //    }
    //    return Math.Round(decMarginAmount, 0);
    //}

    //private decimal FunPriGetResidualAmount()
    //{
    //    decimal decResidualAmount;


    //    if (txtResidualValue_Cashflow.Text != "")
    //    {
    //        //decResidualAmount = (Convert.ToDecimal(txtFacilityAmt.Text) * (Convert.ToDecimal(txtResidualValue_Cashflow.Text) / 100));
    //    }
    //    else if (txtResidualAmt_Cashflow.Text != "")
    //    {
    //        decResidualAmount = Convert.ToDecimal(txtResidualAmt_Cashflow);
    //    }
    //    else
    //    {
    //        decResidualAmount = 0;
    //    }


    //    return decResidualAmount;
    //}

    //private decimal FunPriGetAmountFinanced()
    //{
    //    try
    //    {
    //        decimal decFinanaceAmt;
    //        //decFinanaceAmt = Convert.ToDecimal(txtFacilityAmt.Text);//- FunPriGetMarginAmout() ;
    //        return decFinanaceAmt;//5366
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Error in getting facility amount");
    //    }
    //}

    private void FunPubPricingSave()
    {
        ObjPricingMgtServices = new PricingMgtServicesReference.PricingMgtServicesClient();

        try
        {

            string strOffer_No = string.Empty;
            int IntPricingIdOut = 0;
            ObjS3G_ORG_Pricing = new PricingMgtServices.S3G_ORG_PricingDataTable();
            PricingMgtServices.S3G_ORG_PricingRow ObjPricingRow;
            ObjPricingRow = ObjS3G_ORG_Pricing.NewS3G_ORG_PricingRow();
            ObjPricingRow.Company_ID = intCompany_Id;
            ObjPricingRow.Pricing_ID = intPricingId;
            if (ViewState["ConsitutionId"] != null)
                ObjPricingRow.Constitution_ID = Convert.ToInt32(ViewState["ConsitutionId"].ToString());
            if (hdnCustID.Value != string.Empty && hdnCustID.Value != "0")
                ObjPricingRow.Customer_ID = Convert.ToInt32(hdnCustID.Value);
            if (txtFacilityAmt.Text != string.Empty)
            {
                ObjPricingRow.Facility_Amount = Convert.ToDecimal(txtFacilityAmt.Text);
            }
            //For DMS
            if (hdnIsDMS.Value == "1" && (hdnPricing_ID.Value == null || hdnPricing_ID.Value == string.Empty || ucCheckListFromDMS.SelectedText == string.Empty))
            {
                Utility.FunShowAlertMsg(this, "Enter Valid Proposal From DMS(Proposal No/Name)");
                FunPriResetValues();
                return;
            }

            ObjPricingRow.Round_No = 0;//Hard coded and need to be changed
            ObjPricingRow.Lob_ID = Convert.ToInt32(ddlLob.SelectedValue);
            ObjPricingRow.Location_ID = Convert.ToInt32(cmbLocation.SelectedValue);
            if (cmbSubLocation.SelectedValue != string.Empty)
                ObjPricingRow.Sub_Location_Id = Convert.ToInt32(cmbSubLocation.SelectedValue);
            ObjPricingRow.Customer_Type = Convert.ToInt32(ddlCustomerType.SelectedValue);
            //ObjPricingRow.Appraisal_Type = Convert.ToInt32(ddlAppraisalType.SelectedValue);
            ObjPricingRow.Appraisal_Type = 0;
            ObjPricingRow.Contract_Type = Convert.ToInt32(ddlContType.SelectedValue);
            ObjPricingRow.Deal_Type = Convert.ToInt32(ddlDealType.SelectedValue);
            ObjPricingRow.Dealer_Id = Convert.ToInt32(ddlDealerName.SelectedValue);
            ObjPricingRow.Dob = txtDateofBirth.Text;
            ObjPricingRow.Sales_Person_Id = Convert.ToInt32(ddlSalePersonCodeList.SelectedValue);
            //if (ddldealerSalesPerson.SelectedValue == "")
            //{
            //    ObjPricingRow.Dealer_Sales_Person_Id = 0;
            //}
            //else
            //{
            //    ObjPricingRow.Dealer_Sales_Person_Id = Convert.ToInt32(ddldealerSalesPerson.SelectedValue);
            //}
            if (ddldealerSalesPerson.Text != string.Empty)
            {
                ObjPricingRow.Dealer_Sales_Person_Name = ddldealerSalesPerson.Text;

            }
            else
            {

            }
            ObjPricingRow.Dealer_Sales_Person_Id = 0;
            ObjPricingRow.Product_ID = Convert.ToInt32(ddlProduct.SelectedValue);
            ObjPricingRow.Offer_Date = Utility.StringToDate(txtOfferDate.Text);
            ObjPricingRow.Offer_Valid_Till = Utility.StringToDate(txtOfferValidTill.Text);
            if (hdnLobCode.Value.ToUpper() == "HP" || hdnLobCode.Value.ToUpper() == "TL")
            {
                ObjPricingRow.Tenure = Convert.ToInt32(txtTenure.Text);
                ObjPricingRow.Tenure_Type = Convert.ToInt32(ddlTenureType.SelectedValue);// 1;//ddlTenureType.SelectedItem.Text; //Need to be uncommented
            }
            else
            {
                ObjPricingRow.Tenure = 0;
                ObjPricingRow.Tenure_Type = 0;// 1;//ddlTenureType.SelectedItem.Text; //Need to be uncommented

            }

            //if (ddldealerSalesPerson.SelectedValue == "")
            //{
            //    ObjPricingRow.Dealer_Sales_Person_Id = 0;
            //}
            //else
            //{
            //    ObjPricingRow.Dealer_Sales_Person_Id = Convert.ToInt32(ddldealerSalesPerson.SelectedValue);
            //}
            ObjPricingRow.Seller_Name = txtSellerName.Text;
            ObjPricingRow.Seller_Code = txtSellerCode.Text;
            ObjPricingRow.Proposal_Status = Convert.ToInt32(ddlStatus.SelectedValue);
            if (hdnIsDMS.Value != null && hdnIsDMS.Value != "")
            {
                ObjPricingRow.Is_DMS = Convert.ToInt32(hdnIsDMS.Value);
            }
            else
            {
                ObjPricingRow.Is_DMS = 0;
            }
            ObjPricingRow.PDC_Type = Convert.ToInt32(0);
            if (txtNoPDC.Text != string.Empty)
                ObjPricingRow.No_of_Pdc = Convert.ToInt32(txtNoPDC.Text);
            if (txtPDCstDate.Text != string.Empty)
                ObjPricingRow.PDC_Start_Date = Utility.StringToDate(txtPDCstDate.Text);
            ObjPricingRow.Proposal_Number = txtProposalNumber.Text;
            ObjPricingRow.Account_Number = txtAccountNumber.Text;
            ObjPricingRow.Insurar_Id = Convert.ToInt32(0);
            ObjPricingRow.Insurance_Policy_Number = txtInsurancePolicyNo.Text;
            ObjPricingRow.Insurance_By = Convert.ToInt32(ddlInsuranceby.SelectedValue);
            ObjPricingRow.Insurance_Coverage = Convert.ToInt32(ddlInsuranceCoverage.SelectedValue);
            ObjPricingRow.Insurance_Remarks = txtInsuranceRemarks.Text;
            ObjPricingRow.Xml_Installment_PDC = ((DataTable)ViewState["PDC"]).FunPubFormXml();
            ObjPricingRow.General_Remarks = txtGeneralRemarks.Text;
            if (ddlTemplateType.SelectedValue != string.Empty)
                ObjPricingRow.Template_Language = Convert.ToInt32(ddlLanguage.SelectedValue);

            //if (((DataTable)ViewState["ObjDTAssetDetails"]).Rows.Count > 0)
            //    ObjPricingRow.XMLAsset = gvAssetDetails.FunPubFormXml();
            //else
            //    ObjPricingRow.XMLAsset = "<Root></Root>";
            ObjPricingRow.XMLAsset = "<Root></Root>";
            if (((DataTable)ViewState["DtAlertDetails"]).Rows.Count == 0)
                ObjPricingRow.XMLAlerts = "<Root></Root>";
            else
                ObjPricingRow.XMLAlerts = gvAlert.FunPubFormXml();
            if (ViewState["DOWNPAYRECEIPT"] != null)
            {
                DataTable dt = (DataTable)ViewState["DOWNPAYRECEIPT"];

                DataRow[] dr = dt.Select("Sno=-1");
                if (dr.Length > 0)
                {
                    foreach (DataRow dr2 in dr)
                    {
                        dr2.Delete();
                    }
                    dt.AcceptChanges();

                }
                ObjPricingRow.XML_DOWNPAYMENT_DTLS = ((DataTable)ViewState["DOWNPAYRECEIPT"]).FunPubFormXml();
            }
            //ObjPricingRow.XMLPDD = gvPRDDT.FunPubFormXml();
            ObjPricingRow.XMLPDD = "<Root></Root>";

            //return;
            ObjPricingRow.Created_By = intUserId;


            StringBuilder strAdditionalParmDet = new StringBuilder();
            strAdditionalParmDet.Append("<Root>");
            if (grvAdditionalInfo.Rows.Count > 0)
            {
                foreach (GridViewRow grvRow in grvAdditionalInfo.Rows)
                {
                    Label lblPARAM_ID = (Label)grvRow.FindControl("lblPARAM_ID");
                    Label lblPARAM_DET_ID = (Label)grvRow.FindControl("lblPARAM_DET_ID");
                    Label lblCONSTANT_TRAN_ID = (Label)grvRow.FindControl("lblCONSTANT_TRAN_ID");
                    Label lblLookupType = (Label)grvRow.FindControl("lblLookupType");
                    TextBox txtValues = (TextBox)grvRow.FindControl("txtValues");
                    DropDownList ddlValues = (DropDownList)grvRow.FindControl("ddlValues");

                    strAdditionalParmDet.Append("<Details  CONSTANT_TRAN_ID = '" + lblCONSTANT_TRAN_ID.Text + "'");
                    strAdditionalParmDet.Append(" PARAM_ID = '" + lblPARAM_ID.Text + "'");
                    strAdditionalParmDet.Append(" PARAM_DET_ID = '" + lblPARAM_DET_ID.Text + "'");

                    if (!string.IsNullOrEmpty(lblLookupType.Text))
                        strAdditionalParmDet.Append(" VALUES ='" + ddlValues.SelectedValue + "'/>");
                    else
                        strAdditionalParmDet.Append(" VALUES ='" + txtValues.Text + "'/>");
                }
            }
            strAdditionalParmDet.Append("</Root>");
            // Start Added on 14-09-2021 by Magesh
            if (gvAssetDetails != null)
            {
                if (gvAssetDetails.Rows.Count > 0)
                {
                    foreach (GridViewRow grvRow in gvAssetDetails.Rows)
                    {
                        Label lblMargintoDealer = (Label)grvRow.FindControl("lblMargintoDealer");
                        Label lblpayname = (Label)grvRow.FindControl("lblpayname");
                        Label lblpayid = (Label)grvRow.FindControl("lblpayid");
                        decimal decMargintoDealer = 0;

                        if (lblpayid.Text.ToString() == "6420") //  SUNDRY CREDITORS
                        {
                            if (!String.IsNullOrEmpty(lblMargintoDealer.Text))
                            {
                                decMargintoDealer = Convert.ToDecimal(lblMargintoDealer.Text);
                                if (decMargintoDealer > 0)
                                {
                                    Utility.FunShowAlertMsg(this, "Asset Dealer - " + lblpayname.Text + " , Margin To Dealer should be zero.");
                                    return;
                                }
                            }
                        }
                    }
                }
            }
            // End Added on 14-09-2021 by Magesh
            ObjPricingRow.XmlAdditionalInfo = strAdditionalParmDet.ToString();
            ObjPricingRow.Xml_ChekList_FileUpload = ((DataTable)ViewState["UploadedFiles"]).FunPubFormXml();

            ObjS3G_ORG_Pricing.AddS3G_ORG_PricingRow(ObjPricingRow);
            if (ObjS3G_ORG_Pricing.Rows.Count > 0)
            {
                SerializationMode SerMode = SerializationMode.Binary;
                byte[] ObjPricingDataTable = ClsPubSerialize.Serialize(ObjS3G_ORG_Pricing, SerMode);
                if (intPricingId > 0)
                {
                    intResult = ObjPricingMgtServices.FunPubModifyPricingInt(SerMode, ObjPricingDataTable);
                }
                else
                {
                    intResult = ObjPricingMgtServices.FunPubCreatePricingInt(out strOffer_No, out IntPricingIdOut, SerMode, ObjPricingDataTable);

                }

                if (intResult == 0)
                {
                    if (intPricingId > 0)
                    {
                        btnSave.Enabled_False();

                        //DataTable dtWorkFlow = new DataTable();
                        //int WFProgramId = 0;
                        ////if (ViewState["PageMode"] != null && ViewState["PageMode"].ToString() == PageModes.WorkFlow.ToString())  //if (isWorkFlowTraveler) 
                        ////{
                        //WorkFlowSession WFValues = new WorkFlowSession();
                        ////Utility.FunShowAlertMsg(this, strAlert);
                        //int intWorkflowStatus = 0;
                        //try
                        //{
                        //    intWorkflowStatus = UpdateWorkFlowTasks(CompanyId.ToString(), UserId.ToString(), WFValues.LOBId, WFValues.BranchID, strOffer_No, WFValues.WorkFlowProgramId, WFValues.WorkFlowStatusID.ToString(), WFValues.ProductId, WFValues.Document_Type);
                        //    strAlert = "";
                        //}
                        //catch (Exception ex)
                        //{
                        //    strAlert = "Work Flow not Assigned";
                        //}
                        //WFValues.LastDocumentNo = strOffer_No;
                        Utility.FunShowValidationMsg(this, "ORG_PRI", 24, strRedirectPageAdd, strRedirectPageView, "M", false, txtProposalNumber.Text, true);
                        if (ddlStatus.SelectedValue == "2") // Only Approved Case
                        {
                            FunPriGetPricingDetailsPrintOnSave(intPricingId);
                        }

                    }
                    else
                    {
                        btnSave.Enabled_False();
                        //Work Flow Start
                        int WFProgramId = 0;
                        if (CheckForWorkFlowConfiguration(ProgramCode, WFLOBId, WFProductId, out WFProgramId, out dtWorkFlow) > 0)
                        {
                            AssignNewWorkFlowValues(WFProgramId, int.Parse(ProgramCode), strOffer_No, WFBranchId, WFLOBId, WFProductId, "", dtWorkFlow);
                            try
                            {
                                int intWorkflowStatus = InsertWorkFlowTasks(CompanyId.ToString(), UserId.ToString(), WFLOBId, WFBranchId, strOffer_No, WFProgramId, WFProductId, 2);

                                //Added by Thangam M on 18/Oct/2012 to avoid double save click
                                // btnSave.Enabled = false;
                                //End here
                                strAlert = "";

                            }
                            catch (Exception ex)
                            {
                                strAlert = "Work Flow not Assigned";
                                ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
                            }
                            //  ShowWFAlertMessage(strOffer_No, ProgramCode, strAlert);
                        }
                        //Work Flow End

                        ddlLanguage.SelectedValue = "1";
                        FunPriGetPricingDetailsPrintOnSave(IntPricingIdOut);
                        ViewState["PricingId"] = IntPricingIdOut;
                        //funPrintCheckList(IntPricingIdOut);
                        //Utility.FunShowValidationMsg(this, "ORG_PRI", 23, strRedirectPageAdd, strRedirectPageView, "C", false, strOffer_No, true);

                        strAlert = "Deal \"" + strOffer_No + "\" Created Successfully";
                        strAlert += @"\n\nWould you like to Print the Check List Docments?";
                        strAlert = "if(confirm('" + strAlert + "')){ document.getElementById('" + btnPrintDocCreateModeDummy.ClientID + "').click();}else {if(confirm('" + (@"Would You Like to Add One More Deal?").Replace("\\n", "") + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}" + "}";
                        strRedirectPageView = "";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);

                    }
                }
                else if (intResult == -1)
                {
                    if (intPricingId == 0)
                    {
                        Utility.FunShowAlertMsg(this, Resources.LocalizationResources.DocNoNotDefined);
                        return;
                    }
                    strRedirectPageView = "";
                }
                else if (intResult == -2)
                {
                    if (intPricingId == 0)
                    {
                        Utility.FunShowAlertMsg(this, Resources.LocalizationResources.DocNoNotDefined);
                        return;
                    }
                    strRedirectPageView = "";
                }
                else if (intResult == 2)
                {
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 2);
                    return;
                }
                else if (intResult == 3)
                {
                    Utility.FunShowAlertMsg(this, "Required and Received Status Mandatory in Document Details Tab");
                    return;
                }
                else if (intResult == 5)
                {
                    Utility.FunShowAlertMsg(this, "Dealer/Secondary Documents are not Updated or not added Properly");
                    return;
                }

                else
                {
                    if (intPricingId > 0)
                    {
                        //strAlert = strAlert.Replace("__ALERT__", "Error in updating CheckList Deal Processing");
                        Utility.FunShowValidationMsg(this, "ORG_PRI", 25);
                        return;
                    }
                    else
                    {

                        //strAlert = strAlert.Replace("__ALERT__", "Error in creating CheckList Deal Processing");
                        Utility.FunShowValidationMsg(this, "ORG_PRI", 26);
                        return;

                    }
                    //strRedirectPageView = "";
                }

                //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            //throw new ApplicationException("Error in saving Pricing details");
        }
        finally
        {
            ObjPricingMgtServices.Close();
        }

    }


    private int WFLOBId { get { return int.Parse(ddlLob.SelectedValue); } }
    private int WFBranchId { get { return int.Parse(cmbLocation.SelectedValue); } }
    private int WFProductId { get { return int.Parse(ddlProduct.SelectedValue); } }

    //private void FunPriCalculateIRR(int intbtnclk)
    //{
    //    try
    //    {

    //        ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //        decimal decTotalAmount = 0;
    //        decimal decIRRActualAmount = 0;
    //        DataTable dtRepayDetails = new DataTable();
    //        //code added by saran in 3-Jul-2014 CR_SISSL12E046_018 start
    //        DataTable dtRepayDetailsOthers = new DataTable();
    //        //code added by saran in 3-Jul-2014 CR_SISSL12E046_018 end
    //        DataTable dtMoratorium = null;
    //        if (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddlLob.SelectedItem.Text.ToUpper().Split('-')[0].Trim() != "FT")
    //        {
    //            if (gvRepaymentDetails.Rows.Count == 0)
    //            {
    //                Utility.FunShowAlertMsg(this, "Add atleast one Repayment Details");
    //                return;
    //            }
    //        }

    //        decimal DecRoundOff;
    //        if (Convert.ToString(ViewState["hdnRoundOff"]) != "")
    //            DecRoundOff = Convert.ToDecimal(ViewState["hdnRoundOff"]);
    //        else
    //            DecRoundOff = 2;
    //        string strRate = txtRate.Text;

    //        switch (ddl_Return_Pattern.SelectedValue)
    //        {
    //            case "1":
    //                strRate = txtRate.Text;
    //                break;
    //            case "2":
    //                if (ViewState["decRate"] != null)
    //                {
    //                    strRate = ViewState["decRate"].ToString();
    //                }
    //                break;
    //        }

    //        //if (ViewState["decRate"] != null)
    //        //{

    //        //}
    //        //else
    //        //{
    //        //    strRate = txtRate.Text;
    //        //}
    //        //if (!objRepaymentStructure.FunPubValidateTotalAmount((DataTable)ViewState["DtRepayGrid"], txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedItem.Value, strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, out decIRRActualAmount, out decTotalAmount, "", Convert.ToDecimal(hdnRoundOff.Value)))
    //        //{
    //        //    Utility.FunShowAlertMsg(this, "Total Amount Should be equal to facility amount + interest (" + decTotalAmount + ")");
    //        //    return;
    //        //}
    //        decimal decBreakPercent;// = ((decimal)((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID = 23"));
    //        if ((ddlLob.SelectedItem.Text.ToUpper().Contains("TL") || ddlLob.SelectedItem.Text.ToUpper().Contains("TE")) && ddl_Repayment_Mode.SelectedValue == "2")//Only for structure adhoc
    //        {
    //            int intValidation = objRepaymentStructure.FunPubValidateTotalAmountTL((DataTable)ViewState["DtRepayGrid"], txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedValue, txtRate.Text, ddlTenureType.SelectedItem.Text, txtTenure.Text, out decIRRActualAmount, out decTotalAmount, "", DecRoundOff);
    //            if (intValidation == 1)
    //            {
    //                Utility.FunShowAlertMsg(this, "Total Amount Should be equal to finance amount + interest (" + decTotalAmount + ")");
    //                return;
    //            }
    //            else if (intValidation == 2)
    //            {
    //                Utility.FunShowAlertMsg(this, "Principal Amount Should be equal to finance amount (" + txtFacilityAmt.Text + ")");
    //                return;
    //            }
    //            else if (intValidation == 3)
    //            {
    //                Utility.FunShowAlertMsg(this, "Interest Amount Should be equal to  (" + (decTotalAmount - Convert.ToDecimal(txtFacilityAmt.Text)).ToString() + ")");
    //                return;
    //            }
    //            else if (intValidation == 6)
    //            {
    //                Utility.FunShowAlertMsg(this, "No Principal and Interest amount entered to calculate");
    //                return;
    //            }
    //            else if (intValidation == 4)
    //            {
    //                Utility.FunShowAlertMsg(this, "No Principal amount entered to calculate");
    //                return;
    //            }
    //            else if (intValidation == 5)
    //            {
    //                Utility.FunShowAlertMsg(this, "No Interest amount entered to calculate");
    //                return;
    //            }


    //            //DataRow[] dr = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23");
    //            //if (dr.Length > 0)
    //            //{
    //            //    decBreakPercent = Convert.ToDecimal(((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID in(23)"));
    //            //}
    //            //else
    //            //{
    //            //    decBreakPercent = Convert.ToDecimal(((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID in(35,91)"));
    //            //}
    //        }
    //        else if (!((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))))
    //        {
    //            if (!objRepaymentStructure.FunPubValidateTotalAmount((DataTable)ViewState["DtRepayGrid"], txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedValue, strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, out decIRRActualAmount, out decTotalAmount, "", Convert.ToDecimal(hdnRoundOff.Value)))
    //            {
    //                Utility.FunShowAlertMsg(this, "Total Amount Should be equal to finance amount + interest (" + decTotalAmount + ")");
    //                return;
    //            }
    //            decBreakPercent = Convert.ToDecimal(((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID = 23"));
    //        }


    //        DataRow[] dRows = ((DataTable)ViewState["DtRepayGrid"]).Select("CashFlow_Flag_ID = 23");
    //        if (dRows.Length > 0)
    //        {
    //            decBreakPercent = Convert.ToDecimal(((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID in(23)"));
    //        }
    //        else
    //        {
    //            decBreakPercent = Convert.ToDecimal(((DataTable)ViewState["DtRepayGrid"]).Compute("Sum(Breakup)", "CashFlow_Flag_ID in(35,91)"));
    //        }

    //        if (decBreakPercent != 0)
    //        {
    //            if (decBreakPercent != 100)
    //            {
    //                Utility.FunShowAlertMsg(this, "Total break up percentage should be equal to 100%");
    //                return;
    //            }
    //        }
    //        double douAccountingIRR = 0;
    //        double douBusinessIRR = 0;
    //        double douCompanyIRR = 0;
    //        DataTable dtRepaymentStructure = new DataTable();
    //        try
    //        {
    //            //string strStartDte = txtOfferDate.Text;
    //            int intDeffered = 0;


    //            //Checking if other than normal payment , start date should be last payment date.
    //            if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && ddl_Repayment_Mode.SelectedValue != "5" && ddl_Return_Pattern.SelectedValue == "6")
    //            {
    //                DataTable dtAcctype = ((DataTable)ViewState["PaymentRules"]);
    //                dtAcctype.DefaultView.RowFilter = " FieldName = 'AccountType'";
    //                string strAcctType = dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString().Trim().ToUpper();

    //                if (strAcctType == "PROJECT FINANCE" || strAcctType == "DEFERRED PAYMENT" || strAcctType == "DEFERRED STRUCTURED")
    //                {
    //                    intDeffered = 1;//Defferred Payment
    //                    DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
    //                    if (DtCashFlowOut.Rows.Count > 0)
    //                    {
    //                        DataRow drOutFlw = DtCashFlowOut.Select("CashFlow_Flag_ID=41").Last();
    //                        if (drOutFlw != null)
    //                        {
    //                            strStartDte = drOutFlw["Date"].ToString();
    //                        }
    //                    }

    //                }
    //            }



    //            //objRepaymentStructure.FunPubCalculateIRR(txtOfferDate.Text, hdnPLR.Value, ddl_Frequency.SelectedItem.Value, strDateFormat, txtResidualAmt_Cashflow.Text, txtResidualValue_Cashflow.Text, out douAccountingIRR, out douBusinessIRR, out douCompanyIRR
    //            //    , out dtRepaymentStructure, (DataTable)ViewState["DtRepayGrid"], (DataTable)ViewState["DtCashFlow"], (DataTable)ViewState["DtCashFlowOut"]
    //            //    , txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedItem.Value
    //            //    , strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, ddl_IRR_Rest.SelectedItem.Value,
    //            //    ddl_Time_Value.SelectedItem.Text, ddlLob.SelectedItem.Text, ddl_Repayment_Mode.SelectedValue, "", dtMoratorium);
    //            //if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper() != "PRODUCT") && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Contains("ADHOC")))
    //            if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper() != "PRODUCT") && (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Contains("ADHOC")))
    //            {
    //                objRepaymentStructure.FunPubCalculateIRRForTL(strStartDte, hdnPLR.Value, ddl_Frequency.SelectedValue, strDateFormat, txtResidualAmt_Cashflow.Text, txtResidualValue_Cashflow.Text, out douAccountingIRR, out douBusinessIRR, out douCompanyIRR
    //                 , out dtRepaymentStructure, (DataTable)ViewState["DtRepayGrid"], (DataTable)ViewState["DtCashFlow"], (DataTable)ViewState["DtCashFlowOut"]
    //                 , txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedValue
    //                 , strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, ddl_IRR_Rest.SelectedValue,
    //                 ddl_Time_Value.SelectedValue, ddlLob.SelectedItem.Text, ddl_Repayment_Mode.SelectedValue, "", dtMoratorium);
    //            }
    //            else if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Return_Pattern.SelectedValue == "6"))
    //            {
    //                DataTable dtREpay = new DataTable();
    //                if (!Convert.ToBoolean(intbtnclk))
    //                {
    //                    dtREpay = (DataTable)ViewState["DtRepayGrid"];
    //                }
    //                else
    //                {
    //                    if (ViewState["DtRepayGrid_TL"] != null)
    //                    {
    //                        dtREpay = (DataTable)ViewState["DtRepayGrid_TL"];
    //                    }
    //                    else
    //                    {
    //                        dtREpay = (DataTable)ViewState["DtRepayGrid"];
    //                    }
    //                }


    //                objRepaymentStructure.FunPubCalculateIRR(strStartDte, hdnPLR.Value, ddl_Frequency.SelectedValue, strDateFormat, txtResidualAmt_Cashflow.Text, txtResidualValue_Cashflow.Text, out douAccountingIRR, out douBusinessIRR, out douCompanyIRR
    //                        , out dtRepaymentStructure, out dtRepayDetails
    //                    //code added by saran in 2-Jul-2014 CR_SISSL12E046_018 start
    //                        , out dtRepayDetailsOthers
    //                    //code added by saran in 2-Jul-2014 CR_SISSL12E046_018 end
    //                        , dtREpay, (DataTable)ViewState["DtCashFlow"], (DataTable)ViewState["DtCashFlowOut"]
    //                        , txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedValue
    //                        , strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, ddl_IRR_Rest.SelectedValue,
    //                        ddl_Time_Value.SelectedValue, ddlLob.SelectedItem.Text, ddl_Repayment_Mode.SelectedValue, "", dtMoratorium, ddl_Interest_Levy.SelectedValue.ToString(), intDeffered, strStartDte);
    //                //intSlNo = 0;
    //                if (!Convert.ToBoolean(intbtnclk))
    //                {
    //                    _SlNo = 0;
    //                    gvRepaymentDetails.DataSource = dtRepayDetails;
    //                    gvRepaymentDetails.DataBind();
    //                    if (ViewState["DtRepayGrid_TL"] == null)
    //                        ViewState["DtRepayGrid_TL"] = ((DataTable)ViewState["DtRepayGrid"]).Copy();
    //                    ViewState["DtRepayGrid"] = dtRepayDetails;
    //                }
    //            }
    //            else
    //            {
    //                objRepaymentStructure.FunPubCalculateIRR(txtOfferDate.Text, hdnPLR.Value, ddl_Frequency.SelectedItem.Value, strDateFormat, txtResidualAmt_Cashflow.Text, txtResidualValue_Cashflow.Text, out douAccountingIRR, out douBusinessIRR, out douCompanyIRR
    //                             , out dtRepaymentStructure
    //                    //code added by saran in 2-Jul-2014 CR_SISSL12E046_018 start
    //                        , out dtRepayDetailsOthers
    //                    //code added by saran in 2-Jul-2014 CR_SISSL12E046_018 end
    //                             , (DataTable)ViewState["DtRepayGrid"], (DataTable)ViewState["DtCashFlow"], (DataTable)ViewState["DtCashFlowOut"]
    //                             , txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text, ddl_Return_Pattern.SelectedItem.Value
    //                             , strRate, ddlTenureType.SelectedItem.Text, txtTenure.Text, ddl_IRR_Rest.SelectedItem.Value,
    //                             ddl_Time_Value.SelectedItem.Text, ddlLob.SelectedItem.Text, ddl_Repayment_Mode.SelectedValue, "", dtMoratorium, txtOfferDate.Text, null);
    //            }
    //            grvRepayStructure.Visible = true;
    //            grvRepayStructure.DataSource = dtRepaymentStructure;
    //            grvRepayStructure.DataBind();

    //            ViewState["RepaymentStructure"] = dtRepaymentStructure;

    //            //code added by saran in 3-Jul-2014 CR_SISSL12E046_018 start
    //            if (dtRepayDetailsOthers != null)
    //                ViewState["dtRepayDetailsOthers"] = dtRepayDetailsOthers;
    //            //code added by saran in 3-Jul-2014 CR_SISSL12E046_018 end

    //            txtAccountIRR_Repay.Text = douAccountingIRR.ToString("0.0000");
    //            txtAccIRR.Text = douAccountingIRR.ToString("0.0000");

    //            txtBusinessIRR_Repay.Text = douBusinessIRR.ToString("0.0000");
    //            txtBusinessIRR.Text = douBusinessIRR.ToString("0.0000");

    //            txtCompanyIRR_Repay.Text = douCompanyIRR.ToString("0.0000");
    //            txtCompanyIRR.Text = douCompanyIRR.ToString("0.0000");





    //        }
    //        catch (Exception Ex1)
    //        {
    //            grvRepayStructure.DataSource = null;
    //            grvRepayStructure.DataBind();
    //            ViewState["RepaymentStructure"] = null;

    //            txtAccountIRR_Repay.Text = "";
    //            txtAccIRR.Text = "";
    //            txtBusinessIRR_Repay.Text = "";
    //            txtBusinessIRR.Text = "";
    //            txtCompanyIRR_Repay.Text = "";
    //            txtCompanyIRR.Text = "";
    //            Utility.FunShowAlertMsg(this, Ex1.Message);
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException(ex.Message);
    //    }
    //}
    private void FunPriGetPricingDetailsPrintOnSave(int intPricingId)
    {
        try
        {

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Pricing_ID", intPricingId.ToString());
            Procparam.Add("@COMPANY_ID", intCompany_Id.ToString());
            Procparam.Add("@Mode", strMode);
            DataSet ds_PricingDetails = Utility.GetDataset("S3G_OR_GET_PRICGDET", Procparam);
            // ViewState["checklist"] = ds_PricingDetails.Tables[17];
            if (ds_PricingDetails != null)
            {
                if (ds_PricingDetails.Tables[6].Rows.Count > 0)
                {
                    ViewState["ASSETPRINT"] = ds_PricingDetails.Tables[6];
                }
            }
            ViewState["PricingId"] = intPricingId;
            if (ddlStatus.SelectedValue == "2")//Approved
            {
                funPrintCheckLisTemp(intPricingId, ds_PricingDetails.Tables[0].Rows[0]["LOB_ID"].ToString(), ds_PricingDetails.Tables[0].Rows[0]["BUSINESS_OFFER_NUMBER"].ToString(), ds_PricingDetails.Tables[0].Rows[0]["LOB_Code"].ToString());
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in getting data from Checklist");
        }
    }
    private void FunPriGetPricingDetails(int intPricingId)
    {
        try
        {

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Pricing_ID", intPricingId.ToString());
            Procparam.Add("@COMPANY_ID", intCompany_Id.ToString());
            Procparam.Add("@Mode", strMode);
            DataSet ds_PricingDetails = Utility.GetDataset("S3G_OR_GET_PRICGDET", Procparam);
            // ViewState["checklist"] = ds_PricingDetails.Tables[17];
            if (ds_PricingDetails != null)
            {
                if (ds_PricingDetails.Tables[0].Rows.Count > 0)
                {
                    //ViewState["Docpath"] = ds_PricingDetails.Tables[0].Rows[0]["Business_Offer_Number"].ToString();
                    txtProposalNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["Business_Offer_Number"].ToString();
                    ddlLob.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["LOB_ID"].ToString();
                    ddlLob_SelectedIndexChanged(null, null);


                    cmbLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString();

                    if (cmbLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString()) != null)
                    {
                        cmbLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString()).Selected = true;
                    }
                    else
                    {
                        System.Web.UI.WebControls.ListItem lstitem;
                        lstitem = new System.Web.UI.WebControls.ListItem();
                        lstitem.Text = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Location"]);
                        lstitem.Value = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"]);
                        cmbLocation.Items.Add(lstitem);
                        cmbLocation.SelectedValue = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"]);
                    }


                    cmbLocation_SelectedIndexChanged(null, null);



                    cmbSubLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString();


                    txtGeneralRemarks.Text = ds_PricingDetails.Tables[0].Rows[0]["GEN_REMARKS"].ToString();

                    if (cmbSubLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString()) != null)
                    {
                        cmbSubLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString()).Selected = true;
                    }
                    else
                    {
                        System.Web.UI.WebControls.ListItem lstitem;
                        lstitem = new System.Web.UI.WebControls.ListItem();
                        lstitem.Text = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION"]);
                        lstitem.Value = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"]);
                        cmbSubLocation.Items.Add(lstitem);
                        cmbSubLocation.SelectedValue = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"]);
                    }





                    ddlCustomerType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CUSTOMER_TYPE"].ToString();
                    ddlAppraisalType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    HttpContext.Current.Session["ddlContType"] = ddlContType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    ddlContType_SelectedIndexChanged(null, null);
                    ddlDealType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEAL_TYPE"].ToString();
                    //ddlDealType_SelectedIndexChanged(null, null);
                    ddlDealerName.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_ID"].ToString();
                    ddlDealerName.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Name"].ToString();
                    txtDateofBirth.Text = ds_PricingDetails.Tables[0].Rows[0]["DATEOFBIRTH"].ToString();
                    ddlSalePersonCodeList.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SALES_PERSON_ID"].ToString();
                    ddlSalePersonCodeList.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Sales_Person_Name"].ToString();



                    ddlProduct.ClearSelection();
                    if (ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()) != null)
                    {
                        ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()).Selected = true;
                    }
                    else
                    {
                        System.Web.UI.WebControls.ListItem lstitem;
                        lstitem = new System.Web.UI.WebControls.ListItem();
                        lstitem.Text = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Product"]);
                        lstitem.Value = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"]);
                        ddlProduct.Items.Add(lstitem);
                        ddlProduct.SelectedValue = Convert.ToString(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"]);
                    }



                    txtOfferDate.Text = ds_PricingDetails.Tables[0].Rows[0]["Offer_Date"].ToString();
                    txtOfferValidTill.Text = ds_PricingDetails.Tables[0].Rows[0]["OFFER_VALID_TILL"].ToString();
                    txtFacilityAmt.Text = Convert.ToDecimal(ds_PricingDetails.Tables[0].Rows[0]["FACILITY_AMOUNT"].ToString()).ToString("#,##0.000");
                    txtTenure.Text = ds_PricingDetails.Tables[0].Rows[0]["Tenure"].ToString();
                    ddlTenureType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Tenure_Type"].ToString();
                    //ddldealerSalesPerson.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_SALESPERSON_ID"].ToString();
                    ddldealerSalesPerson.Text = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Sales_Persion"].ToString();

                    txtSellerName.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_NAME"].ToString();
                    txtSellerCode.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_ID"].ToString();
                    //ddlInsurar.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURER"].ToString();
                    //ddlInsurar.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["INSURER_NAME"].ToString();
                    txtInsurancePolicyNo.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_POLICYNO"].ToString();
                    ddlInsuranceby.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString();
                    ddlInsuranceCoverage.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_COVERAGE"].ToString();
                    txtInsuranceRemarks.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_REMARKS"].ToString();
                    TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
                    txtName.Text = ds_PricingDetails.Tables[0].Rows[0]["customer"].ToString();
                    HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    hdnCID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //FunPriLoadAddressDetails(Convert.ToInt32(ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString()));
                    txtNoPDC.Text = ds_PricingDetails.Tables[0].Rows[0]["NO_OF_PDC"].ToString();
                    txtPDCstDate.Text = ds_PricingDetails.Tables[0].Rows[0]["PDC_STARTDATE"].ToString();
                    txtAccountNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["AccountNumber"].ToString();
                    ddlStatus.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["STATUS_ID"].ToString();
                    hdnCustID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //ddlDealerName_Item_Selected(null, null);
                    btnLoadCustomer_Click(null, null);

                    ucCheckListFromDMS.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["BUSINESS_OFFER_NUMBER_DMS"].ToString();
                    ucCheckListFromDMS.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["BUSINESS_OFFER_NUMBER_DMS_ID"].ToString();
                    ViewState["DMSINSERTTYPE"] = ds_PricingDetails.Tables[0].Rows[0]["INSERT_TYPE"].ToString();
                    if (ucCheckListFromDMS.SelectedValue != string.Empty)
                    {
                        rfvtxtCustomerNameLease.Enabled = false;
                        ViewState["ConsitutionId"] = ds_PricingDetails.Tables[0].Rows[0]["CONSTITUTION_ID"].ToString();
                    }
                    if (ds_PricingDetails.Tables[0].Rows[0]["IS_DMS"].ToString() == "1")
                    {
                        funDisableForDMS();
                        hdnISDMSModify.Value = "1";
                    }
                    else
                    {
                        hdnISDMSModify.Value = "0";
                    }
                    //To Bind Default Dealer Values
                    DefaultDealerValue();
                }
    #endregion
                #region Document Details Tab
                //txtConstitutionCode.Text = ds_PricingDetails.Tables[0].Rows[0]["Consitution"].ToString();
                #endregion

                #region Asset Tab
                if (strMode == "Q")
                {
                    btnAddNew.Enabled_False_Asp();
                    //btnAddNew.Enabled_False();
                }




                if (ds_PricingDetails.Tables[1].Rows.Count > 0)
                {
                    gvAlert.DataSource = ds_PricingDetails.Tables[1];
                    gvAlert.DataBind();
                    ViewState["DtAlertDetails"] = ds_PricingDetails.Tables[1];
                    FunPriFill_Alert_Tab(_Edit);
                }
                else
                {
                    FunPriFill_Alert_Tab(_Add);
                }
                if (ds_PricingDetails.Tables[2].Rows.Count > 0)
                {
                    //ViewState["ObjDTAssetDetails"] = ds_PricingDetails.Tables[2];
                    //FunProBindAssetGrid();


                }
                if (ds_PricingDetails.Tables[3].Rows.Count > 0)
                {

                    //gvPRDDT.DataSource = ds_PricingDetails.Tables[3];
                    //gvPRDDT.DataBind();
                    //btnViewDocuments.Visible = false;
                    //btnViewDocuments.Text = "Update Documents";
                    //ViewState["dtPDDCustomer"] = ds_PricingDetails.Tables[3];
                }
                else
                {
                    //btnViewDocuments.Visible = false;
                }
                if (ds_PricingDetails.Tables[4].Rows.Count > 0)
                {
                    GRVPDCDetails.DataSource = ds_PricingDetails.Tables[4];
                    GRVPDCDetails.DataBind();

                    ViewState["PDC"] = ds_PricingDetails.Tables[4];
                    funPriControlPDCDelete();
                    funPriCalculateTotalPdc(ds_PricingDetails.Tables[4]);
                    //ddlPdcType.SelectedValue = ds_PricingDetails.Tables[4].Rows[0]["IS_SECURITY"].ToString();
                }
                if (ds_PricingDetails.Tables[5].Rows.Count > 0)
                {

                    //grvDownPaymentReceipt.DataSource = ds_PricingDetails.Tables[5];
                    //grvDownPaymentReceipt.DataBind();
                    //ViewState["DOWNPAYRECEIPT"] = ds_PricingDetails.Tables[5];
                }
                else
                {
                    // funPrivLoadDownPaymentGrid();
                }
                if (ds_PricingDetails.Tables[6].Rows.Count > 0)
                {
                    ViewState["ASSETPRINT"] = ds_PricingDetails.Tables[6];
                }

                funPriInsertTempAssetTable("4");
                funPriInsertTempDocTable("4");//Customer Wise Documents
                //funPriInsertTempDocTable("8");//Dealer Wise Documents
                AdditionalInforFetch(intPricingId);

                if (ddlDealerName.SelectedValue != string.Empty)
                {
                    ddlDealerDoc.SelectedValue = ddlDealerName.SelectedValue;
                    ddlDealerDoc.SelectedText = ddlDealerName.SelectedText;
                    btnGoDealerDoc_Click(null, null);
                }
                //btnGoDealerDoc_Click(null, null);
                btnUpdateDocumentsDealer.Enabled_True();

                if (ds_PricingDetails.Tables[7].Rows.Count > 0)
                {
                    grvUploadedFiles.DataSource = ds_PricingDetails.Tables[7];
                    grvUploadedFiles.DataBind();
                    ViewState["UploadedFiles"] = ds_PricingDetails.Tables[7];
                }
                //FunPriFill_AssetTab(_Edit);
                #endregion
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in getting data from Checklist");
        }
    }
    private void FunPriLoadCopyProfileDtls(int intPricingId)
    {
        try
        {
            intProdcutSet = 1;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Pricing_ID", intPricingId.ToString());
            Procparam.Add("@COMPANY_ID", intCompany_Id.ToString());
            Procparam.Add("@Mode", strMode);
            DataSet ds_PricingDetails = Utility.GetDataset("S3G_OR_GET_PRICGDET", Procparam);
            // ViewState["checklist"] = ds_PricingDetails.Tables[17];

            ViewState["intPricingIdCopyPrifile"] = intPricingId;
            if (ds_PricingDetails != null)
            {
                if (ds_PricingDetails.Tables[0].Rows.Count > 0)
                {

                    if ((ds_PricingDetails.Tables[0].Rows[0]["OFFER_VALID_TILL"]).ToString() != string.Empty)
                    {
                        //if (Utility.StringToDate((ds_PricingDetails.Tables[0].Rows[0]["OFFER_VALID_TILL"]).ToString()) < DateTime.Now)
                        //{
                        //    Utility.FunShowAlertMsg(this, "Profile Copy Allowed Only for Expired Proposal Number");
                        //    return;
                        //}
                    }


                    //ViewState["Docpath"] = ds_PricingDetails.Tables[0].Rows[0]["Business_Offer_Number"].ToString();
                    //txtProposalNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["Business_Offer_Number"].ToString();
                    ddlLob.ClearSelection();
                    ddlLob.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["LOB_ID"].ToString();
                    ddlLob_SelectedIndexChanged(null, null);
                    //cmbLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString();

                    if (cmbLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString()) != null)
                    {
                        cmbLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString()).Selected = true;
                    }


                    cmbLocation_SelectedIndexChanged(null, null);
                    if (cmbSubLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString()) != null)
                    {
                        cmbSubLocation.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString()).Selected = true;
                    }
                    //cmbSubLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString();
                    //ddlCustomerType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CUSTOMER_TYPE"].ToString();
                    ddlCustomerType.SelectedValue = "2";
                    ddlAppraisalType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    HttpContext.Current.Session["ddlContType"] = ddlContType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    ddlContType_SelectedIndexChanged(null, null);
                    ddlDealType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEAL_TYPE"].ToString();
                    //ddlDealType_SelectedIndexChanged(null, null);

                    txtDateofBirth.Text = ds_PricingDetails.Tables[0].Rows[0]["DATEOFBIRTH"].ToString();


                    if (ds_PricingDetails.Tables[0].Rows[0]["DEALER_NAME_EM_IS_ACTIVE"].ToString() == "1")
                    {
                        ddlDealerName.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_ID"].ToString();
                        ddlDealerName.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Name"].ToString();
                    }

                    if (ds_PricingDetails.Tables[0].Rows[0]["SALES_PERSON_NAME_IS_ACTIVE"].ToString() == "1")
                    {
                        ddlSalePersonCodeList.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Sales_Person_Name"].ToString();
                        ddlSalePersonCodeList.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SALES_PERSON_ID"].ToString();
                    }


                    if (ds_PricingDetails.Tables[0].Rows[0]["DEALER_SALES_PERSION_IS_ACTIVE"].ToString() == "1")
                    {
                        //ddldealerSalesPerson.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_SALESPERSON_ID"].ToString();
                        ddldealerSalesPerson.Text = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Sales_Persion"].ToString();
                    }


                    ddlProduct.ClearSelection();
                    if (ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()) != null)
                    {
                        ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()).Selected = true;
                    }
                    //ddlProduct.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString();
                    //txtOfferDate.Text = ds_PricingDetails.Tables[0].Rows[0]["Offer_Date"].ToString();
                    txtFacilityAmt.Text = Convert.ToDecimal(ds_PricingDetails.Tables[0].Rows[0]["FACILITY_AMOUNT"].ToString()).ToString("#,##0.000");
                    txtTenure.Text = ds_PricingDetails.Tables[0].Rows[0]["Tenure"].ToString();
                    ddlTenureType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Tenure_Type"].ToString();


                    txtSellerName.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_NAME"].ToString();
                    txtSellerCode.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_ID"].ToString();
                    //ddlInsurar.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURER"].ToString();
                    //ddlInsurar.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["INSURER_NAME"].ToString();
                    txtInsurancePolicyNo.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_POLICYNO"].ToString();

                    if (ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString() != null && ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString() != "")
                    {
                        ddlInsuranceby.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString();
                    }
                    if (ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_COVERAGE"].ToString() != string.Empty)
                    {
                        ddlInsuranceCoverage.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_COVERAGE"].ToString();
                    }
                    txtInsuranceRemarks.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_REMARKS"].ToString();
                    TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
                    txtName.Text = ds_PricingDetails.Tables[0].Rows[0]["customer"].ToString();
                    HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    hdnCID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //FunPriLoadAddressDetails(Convert.ToInt32(ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString()));
                    txtNoPDC.Text = ds_PricingDetails.Tables[0].Rows[0]["NO_OF_PDC"].ToString();
                    txtPDCstDate.Text = ds_PricingDetails.Tables[0].Rows[0]["PDC_STARTDATE"].ToString();
                    txtAccountNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["AccountNumber"].ToString();
                    //ddlStatus.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["STATUS_ID"].ToString();
                    hdnCustID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //ddlDealerName_Item_Selected(null, null);
                    btnLoadCustomer_Click(null, null);
                }
                else
                {
                    Utility.FunShowAlertMsg(this, "Deal Information Not Available");
                    return;
                }

                #region Document Details Tab
                //txtConstitutionCode.Text = ds_PricingDetails.Tables[0].Rows[0]["Consitution"].ToString();
                #endregion

                #region Asset Tab
                if (strMode == "Q")
                {
                    btnAddNew.Enabled_False_Asp();
                    //btnAddNew.Enabled_False();
                }




                if (ds_PricingDetails.Tables[1].Rows.Count > 0)
                {
                    gvAlert.DataSource = ds_PricingDetails.Tables[1];
                    gvAlert.DataBind();
                    ViewState["DtAlertDetails"] = ds_PricingDetails.Tables[1];
                    FunPriFill_Alert_Tab(_Edit);
                }
                else
                {
                    FunPriFill_Alert_Tab(_Add);
                }
                if (ds_PricingDetails.Tables[2].Rows.Count > 0)
                {
                    //ViewState["ObjDTAssetDetails"] = ds_PricingDetails.Tables[2];
                    //FunProBindAssetGrid();


                }
                if (ds_PricingDetails.Tables[3].Rows.Count > 0)
                {

                    //gvPRDDT.DataSource = ds_PricingDetails.Tables[3];
                    //gvPRDDT.DataBind();
                    //btnViewDocuments.Visible = false;
                    //btnViewDocuments.Text = "Update Documents";
                    //ViewState["dtPDDCustomer"] = ds_PricingDetails.Tables[3];
                }
                else
                {
                    //btnViewDocuments.Visible = false;
                }
                if (ds_PricingDetails.Tables[4].Rows.Count > 0)
                {
                    GRVPDCDetails.DataSource = ds_PricingDetails.Tables[4];
                    GRVPDCDetails.DataBind();

                    ViewState["PDC"] = ds_PricingDetails.Tables[4];
                    funPriControlPDCDelete();
                    funPriCalculateTotalPdc(ds_PricingDetails.Tables[4]);
                    //ddlPdcType.SelectedValue = ds_PricingDetails.Tables[4].Rows[0]["IS_SECURITY"].ToString();
                }
                if (ds_PricingDetails.Tables[5].Rows.Count > 0)
                {

                    //grvDownPaymentReceipt.DataSource = ds_PricingDetails.Tables[5];
                    //grvDownPaymentReceipt.DataBind();
                    //ViewState["DOWNPAYRECEIPT"] = ds_PricingDetails.Tables[5];
                }
                else
                {
                    // funPrivLoadDownPaymentGrid();
                }
                if (ds_PricingDetails.Tables[6].Rows.Count > 0)
                {
                    ViewState["ASSETPRINT"] = ds_PricingDetails.Tables[6];
                }

                funPriInsertTempAssetTable("5");
                funPriInsertTempDocTable("5");
                //AdditionalInforFetch(intPricingId);
                //FunPriFill_AssetTab(_Edit);
                #endregion
            }
            intProdcutSet = 0;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in getting data from Pricing");
        }
    }


    //private void FunPriBindPaymentDDL(string StrRuleID)
    //{
    //    try
    //    {
    //        Procparam = new Dictionary<string, string>();
    //        if (strMode.ToUpper().Trim() != "Q")
    //            Procparam.Add("@Is_Active", "1");

    //        if (strMode.ToUpper().Trim() == "M" && StrRuleID != "")
    //            Procparam.Add("@Rules_ID", StrRuleID);

    //        Procparam.Add("@Company_ID", intCompany_Id.ToString());
    //        Procparam.Add("@LOB_ID", ddlLob.SelectedItem.Value);
    //        Procparam.Add("@Product_ID", ddlProduct.SelectedItem.Value);
    //        Procparam.Add("@Option", "8");
    //        ddlPaymentRuleList.BindDataTable(SPNames.S3G_ORG_GetPricing_List, Procparam, new string[] { "Payment_RuleCard_ID", "Payment_Rule_Number" });
    //        hdnPayment.Value = "";
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw new ApplicationException("Unable to Load Payment Rule");
    //    }
    //}

    private void FunPriPricingControlStatus(int intModeID)
    {
        try
        {

            switch (intModeID)
            {
                case 0: // Create Mode
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    //btnCreateCustomer.Visible = true;
                    //txtMarginAmountAsset.ReadOnly = false;
                    //txtMarginPercentage.ReadOnly = false;
                    txtUnitValue.ReadOnly = false;
                    txtUnitCount.ReadOnly = false;
                    //btnPdf.Enabled_False_Asp();
                    btnPdf.Enabled_False();
                    ddlLanguage.Enabled = false;
                    btnEmail.Enabled_False();
                    btnCancelCheckList.Enabled_False();
                    //btnCancelCheckList.Attributes.Add("disabled", "disabled");  // enable false
                    //btnCancelCheckList.Attributes.Add("class", "cancel_btn fa fa-times");  // enable false css
                    ddlCustomerType_SelectedIndexChanged(null, null);



                    //btnViewDocuments.Visible = false;

                    break;
                case 1://Modify
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);

                    //btnClear.Attributes.Add("disabled", "disabled");  // enable false
                    //btnClear.Attributes.Add("class", "css_btn_disabled");  // enable false css
                    //CalendarExtenderSD_RequiredFromDate.Enabled = false;
                    btnClear.Enabled_False();
                    gvPRDDT.Enabled = true;
                    //btnCancelCheckList.Attributes.Add("disabled", "disabled");  // enable false
                    //btnCancelCheckList.Attributes.Add("class", "css_btn_disabled");  // enable false css
                    //btnViewDocuments.Visible = false;
                    //btnCancelCheckList.Enabled = true;

                    if (ViewState["WDRW_CHLST"] != null)
                    {
                        if (ViewState["WDRW_CHLST"].ToString() == "1")
                        {
                            btnCancelCheckList.Enabled_True();
                        }
                        else
                        {
                            btnCancelCheckList.Enabled_False();
                        }
                    }



                    btnEmail.Enabled_False();

                    ddlLob.ClearDropDownList();
                    cmbLocation.ClearDropDownList();
                    cmbSubLocation.ClearDropDownList();
                    ddlCustomerType.ClearDropDownList();
                    ucCustomerCodeLov.Enabled = false;
                    Button btnLoadAccount = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                    btnLoadAccount.Enabled = false;
                    //btnCreateCustomer.Enabled_False();
                    btnCreateCustomer.Attributes.Add("disabled", "disabled");
                    btnCreateCustomer.Attributes.Add("class", "btn_control_disable");  // enab
                    ddlProduct.ClearDropDownList();
                    if (ddlStatus.SelectedValue == "4" || ddlStatus.SelectedValue == "5")//Cancelled/Rejetced
                    {
                        ddlLanguage.Enabled = false;
                        //btnPdf.Enabled_False_Asp();
                        btnPdf.Enabled_False();
                    }
                    if (hdnCADRECACCESS.Value == "1" || hdnCADVERACCESS.Value == "1")
                    {
                        btnAddNew.Enabled_False_Asp();
                        foreach (GridViewRow grv in gvAssetDetails.Rows)
                        {
                            LinkButton lblAssetNo = grv.FindControl("lblAssetNo") as LinkButton;
                            LinkButton LnkDelete = grv.FindControl("LnkDelete") as LinkButton;

                            LnkDelete.Enabled = false;
                            LnkDelete.OnClientClick = null;


                            lblAssetNo.Enabled = false;
                            lblAssetNo.OnClientClick = null;
                        }

                        btnClear.Enabled_False();
                        //btnSave.Enabled_False();
                        txtMarginAmountAsset.Enabled = false;
                        txtUnitCount.Enabled = false;
                        txtUnitValue.Enabled = false;
                        txtTotalAssetValue.Enabled = false;
                        gvAlert.FooterRow.Visible = false;
                        gvAlert.Columns[6].Visible = false;
                        ddlAssetCodeList1.Enabled = false;
                        ddlLanguage.Enabled = true;
                        ddlInsuranceCoverage.Enabled = false;
                        ddlTenureType.Enabled = false;
                        txtGeneralRemarks.Enabled = false;
                        ddlProduct.Enabled = false;
                        //gvAssetDetails.FooterRow.Visible = false;
                        gvAssetDetails.Columns[gvAssetDetails.Columns.Count - 1].Visible = false;
                        CalendarExtenderSD_RequiredFromDate.Enabled = false;
                        //btnViewDocuments.Visible = false;
                        Button btnLoadAccount3 = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                        btnLoadAccount3.Enabled = false;
                        ucProposalFromDMS.ButtonEnabled = false;
                        ddlLob.ClearDropDownList();
                        cmbLocation.ClearDropDownList();
                        cmbSubLocation.ClearDropDownList();
                        ddlCustomerType.ClearDropDownList();
                        ddlContType.ClearDropDownList();

                        if (ViewState["CHK_BSMO"].ToString() == "1")
                        {
                            ddlDealType.Enabled = true;
                        }
                        else
                        {
                            ddlDealType.Enabled = false;
                            ddlDealType.ClearDropDownList();
                        }


                        ddlDealerName.Enabled = false;
                        ddlSalePersonCodeList.Enabled = false;
                        ddlProduct.ClearDropDownList();
                        txtOfferDate.Enabled = false;
                        txtOfferValidTill.Enabled = false;
                        calCollectedDateffer.Enabled = false;
                        txtTenure.ReadOnly = true;
                        ddlTenureType.ClearDropDownList();
                        if (ddlStatus.SelectedValue == "2")
                        {
                            ddldealerSalesPerson.ReadOnly = true;
                        }
                        else
                        {
                            ddldealerSalesPerson.ReadOnly = false;
                        }
                        txtSellerCode.Enabled = false;
                        txtSellerName.Enabled = false;
                        txtInsurancePolicyNo.Enabled = false;
                        ddlInsuranceby.ClearDropDownList();
                        ddlInsuranceCoverage.ClearDropDownList();
                        txtInsuranceRemarks.Enabled = false;
                        ucCheckListFromDMS.Enabled = false;
                        ucCheckListFromDMS.AutoPostBack = false;

                        Button btnPostbackDMS2 = ucCheckListFromDMS.FindControl("btnSelected") as Button;
                        btnPostbackDMS2.Enabled = false;

                        if (GRVPDCDetails.FooterRow != null)
                        {
                            GRVPDCDetails.FooterRow.Enabled = false;
                        }
                        //if (gvPRDDT.FooterRow != null)
                        //{
                        //    gvPRDDT.FooterRow.Visible = false;
                        //}

                        txtNoPDC.Enabled = false;
                        txtPDCstDate.Enabled = false;
                        GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = false;
                        gvPRDDT.Columns[gvPRDDT.Columns.Count - 1].Visible = false;
                        //grvDownPaymentReceipt.Columns[grvDownPaymentReceipt.Columns.Count - 1].Visible = false;
                        txtProposalNumber.Enabled = false;
                        txtAccountNumber.Enabled = false;
                        //btnCancelCheckList.Enabled_False();

                        btnEmail.Enabled_False();
                        btnAddNew.Enabled_False_Asp();
                        //btnAddNew.Enabled_False();

                        //btnCopyProfile.Enabled_False_Asp();
                        btnCopyProfile.Enabled_False();
                        txtTradeIn.Enabled = false;
                        txtMargintoMFC.Enabled = false;
                        txtMargintoDealer.Enabled = false;
                        ddlPayTo.Enabled = false;
                        ddlEntityNameList.Enabled = false;
                        ddlAssetType.Enabled = false;
                        txtDownPaymentReceipt.Enabled = false;
                        txtFacilityAmt.Enabled = false;
                        txtMarginPercentage.Enabled = false;
                        txtLpoAssetAmount.Enabled = false;
                        txtBookDepreciationPerc.Enabled = false;

                        hdnSetForceValues.Value = "0";
                        lnkUpdateDocuments.Enabled_False();
                        lnkUpdateDocuments.Attributes.Remove("onclick");
                        btnViewDocuments.Enabled = false;
                        btnViewDocuments.OnClientClick = null;
                        lnkUpdateDocuments.Disabled = true;
                        //btnViewPropect.Disabled = true;

                        //Alert Disable
                        //btnUpdateDocumentsDealer.Enabled_False();

                        foreach (GridViewRow grv in gvAlert.Rows)
                        {
                            CheckBox ChkEmail = grv.FindControl("ChkEmail") as CheckBox;
                            CheckBox ChkSMS = grv.FindControl("ChkSMS") as CheckBox;
                            if (ChkEmail != null && ChkSMS != null)
                            {
                                ChkSMS.Enabled = ChkEmail.Enabled = false;
                            }
                        }
                        rptimg.Enabled = false;
                        btnGoProfileCopy.Enabled = false;
                    }

                    rptimg.Enabled = false;
                    btnGoProfileCopy.Enabled = false;
                    ucCheckListFromDMS.Enabled = false;
                    ucCheckListFromDMS.AutoPostBack = false;

                    Button btnPostback = ucCheckListFromDMS.FindControl("btnSelected") as Button;
                    btnPostback.Enabled = false;



                    if (ViewState["CHK_BSMO"].ToString() == "1")
                    {
                        ddlDealType.Enabled = true;
                    }
                    else
                    {
                        ddlDealType.Enabled = false;
                    }

                    if (ViewState["CHK_MOFMO"].ToString() == "1")
                    {
                        ddlSalePersonCodeList.Enabled = true;
                    }
                    else
                    {
                        ddlSalePersonCodeList.Enabled = false;
                    }


                    if (ViewState["CHK_PDCSTR"].ToString() == "1")
                    {
                        GRVPDCDetails.FooterRow.Enabled = true;
                        txtNoPDC.Enabled = true;
                        txtPDCstDate.Enabled = true;
                        GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = true;
                    }
                    else
                    {
                        GRVPDCDetails.FooterRow.Enabled = false;
                        txtNoPDC.Enabled = false;
                        txtPDCstDate.Enabled = false;
                        GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = false;
                    }


                    if (ViewState["CHK_PDCOFR"].ToString() == "1")
                    {
                        txtOfferDate.Enabled = true;
                        rfvOfferDate.Enabled = true;
                        calCollectedDateffer.Enabled = true;
                    }
                    else
                    {
                        txtOfferDate.Enabled = false;
                        rfvOfferDate.Enabled = false;
                        calCollectedDateffer.Enabled = false;
                    }

                    if (ddlContType.SelectedValue == "2" || ddlContType.SelectedValue == "3")
                    {
                        //if (ddlDealerName.SelectedValue == strSecondHandDealer)//SecondDealer and Sales Back
                        if (ddlDealerName.SelectedValue == "6227" || ddlDealerName.SelectedValue == "6307" || ddlDealerName.SelectedValue == "6418" || ddlDealerName.SelectedValue == "6431")
                        {
                            txtSellerName.Enabled = true;
                            txtSellerCode.Enabled = true;
                            //lblSellerName.CssClass = "styleReqFieldLabel";
                            //lblSellerCode.CssClass = "styleReqFieldLabel";
                        }
                    }
                    else
                    {
                        txtSellerName.Enabled = false;
                        txtSellerCode.Enabled = false;
                        //lblSellerName.CssClass = "styleDisplayLabel";
                        //lblSellerCode.CssClass = "styleDisplayLabel";
                    }

                    btnUpdateDocumentsDealer.Enabled_True();
                    ddlLanguage.SelectedValue = "1";
                    //FunPriGetPricingDetailsPrintOnSave(intPricingId);
                    break;
                case -1://Query  
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    btnClear.Enabled_False();
                    btnSave.Enabled_False();
                    txtMarginAmountAsset.Enabled = false;
                    txtUnitCount.Enabled = false;
                    txtUnitValue.Enabled = false;
                    txtTotalAssetValue.Enabled = false;
                    gvAlert.FooterRow.Visible = false;
                    gvAlert.Columns[6].Visible = false;
                    ddlAssetCodeList1.Enabled = false;
                    ddlLanguage.Enabled = true;
                    ddlInsuranceCoverage.Enabled = false;
                    ddlTenureType.Enabled = false;
                    txtGeneralRemarks.Enabled = false;
                    ddlProduct.Enabled = false;
                    //gvAssetDetails.FooterRow.Visible = false;
                    gvAssetDetails.Columns[gvAssetDetails.Columns.Count - 1].Visible = false;
                    CalendarExtenderSD_RequiredFromDate.Enabled = false;
                    //btnViewDocuments.Visible = false;
                    Button btnLoadAccount2 = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                    btnLoadAccount2.Enabled = false;
                    ucProposalFromDMS.ButtonEnabled = false;
                    ddlLob.ClearDropDownList();
                    cmbLocation.ClearDropDownList();
                    cmbSubLocation.ClearDropDownList();
                    ddlCustomerType.ClearDropDownList();
                    ddlContType.ClearDropDownList();
                    ddlDealType.ClearDropDownList();
                    ddlDealerName.Enabled = false;
                    ddlSalePersonCodeList.Enabled = false;
                    ddlProduct.ClearDropDownList();
                    txtOfferDate.Enabled = false;
                    txtOfferValidTill.Enabled = false;
                    calCollectedDateffer.Enabled = false;
                    txtTenure.ReadOnly = true;
                    ddlTenureType.ClearDropDownList();
                    ddldealerSalesPerson.ReadOnly = true;
                    txtSellerCode.Enabled = false;
                    txtSellerName.Enabled = false;
                    txtInsurancePolicyNo.Enabled = false;
                    ddlInsuranceby.ClearDropDownList();
                    ddlInsuranceCoverage.ClearDropDownList();
                    txtInsuranceRemarks.Enabled = false;
                    ucCheckListFromDMS.Enabled = false;
                    ucCheckListFromDMS.AutoPostBack = false;

                    Button btnPostbackDMS = ucCheckListFromDMS.FindControl("btnSelected") as Button;
                    btnPostbackDMS.Enabled = false;

                    if (GRVPDCDetails.FooterRow != null)
                    {
                        GRVPDCDetails.FooterRow.Visible = false;
                    }
                    if (gvPRDDT.FooterRow != null)
                    {
                        gvPRDDT.FooterRow.Visible = false;
                    }

                    txtNoPDC.Enabled = false;
                    txtPDCstDate.Enabled = false;
                    GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = false;
                    gvPRDDT.Columns[gvPRDDT.Columns.Count - 1].Visible = false;
                    //grvDownPaymentReceipt.Columns[grvDownPaymentReceipt.Columns.Count - 1].Visible = false;
                    txtProposalNumber.Enabled = false;
                    txtAccountNumber.Enabled = false;
                    btnCancelCheckList.Enabled_False();
                    if (ddlStatus.SelectedValue == "4" || ddlStatus.SelectedValue == "5")//Cancelled/Rejetced
                    {
                        ddlLanguage.Enabled = false;
                        //btnPdf.Enabled_False_Asp();
                        btnPdf.Enabled_False();
                    }

                    btnEmail.Enabled_False();
                    btnAddNew.Enabled_False_Asp();
                    //btnAddNew.Enabled_False();

                    //btnCopyProfile.Enabled_False_Asp();
                    btnCopyProfile.Enabled_False();
                    txtTradeIn.Enabled = false;
                    txtMargintoMFC.Enabled = false;
                    txtMargintoDealer.Enabled = false;
                    ddlPayTo.Enabled = false;
                    ddlEntityNameList.Enabled = false;
                    ddlAssetType.Enabled = false;
                    txtDownPaymentReceipt.Enabled = false;
                    txtFacilityAmt.Enabled = false;
                    txtMarginPercentage.Enabled = false;
                    txtLpoAssetAmount.Enabled = false;
                    txtBookDepreciationPerc.Enabled = false;

                    foreach (GridViewRow grv in gvAssetDetails.Rows)
                    {
                        LinkButton lblAssetNo = grv.FindControl("lblAssetNo") as LinkButton;
                        lblAssetNo.Enabled = false;
                        lblAssetNo.OnClientClick = null;
                    }
                    if (gvPRDDT.FooterRow != null)
                    {
                        gvPRDDT.FooterRow.Visible = false;
                    }
                    hdnSetForceValues.Value = "0";
                    foreach (GridViewRow grv in gvPRDDT.Rows)
                    {
                        //DropDownList ddlPriority = grv.FindControl("ddlPriority") as DropDownList;
                        //TextBox txtPRDDCTypeF = grv.FindControl("txtPRDDCTypeF") as TextBox;
                        DropDownList ddlRequired = grv.FindControl("ddlRequired") as DropDownList;
                        DropDownList ddlReceived = grv.FindControl("ddlReceived") as DropDownList;
                        //DropDownList ddlCollectedBy = grv.FindControl("ddlReceivedF") as DropDownList;
                        //CheckBox CbxCheck = grv.FindControl("CbxCheck") as CheckBox;
                        TextBox txtCollectedDate = grv.FindControl("txtCollectedDate") as TextBox;
                        AjaxControlToolkit.CalendarExtender calCollectedDate = grv.FindControl("calCollectedDate") as AjaxControlToolkit.CalendarExtender;
                        //TextBox txtCADVerifiedDate = grv.FindControl("txtCADVerifiedDate") as TextBox;
                        //TextBox txtCADVerifierRemarks = grv.FindControl("txtCADVerifierRemarks") as TextBox;
                        //TextBox txtCADReceived = grv.FindControl("txtCADReceived") as TextBox;
                        //TextBox txtCADReceiverRemarks = grv.FindControl("txtCADReceiverRemarks") as TextBox;


                        //FileUpload flUploadI = grv.FindControl("flUploadI") as FileUpload;
                        //TextBox txtScan = grv.FindControl("txtScan") as TextBox;
                        //LinkButton hyplnkView = grv.FindControl("hyplnkView") as LinkButton;
                        TextBox txtRemarks = grv.FindControl("txtRemarks") as TextBox;
                        //TextBox txtCADValue = grv.FindControl("txtCADValue") as TextBox;

                        //CheckBox chkSel = grv.FindControl("chkSel") as CheckBox;
                        LinkButton lnkRemovePRDDC = grv.FindControl("lnkRemovePRDDC") as LinkButton;
                        // LinkButton lnkUpdateDocuments = grv.FindControl("lnkUpdateDocuments") as LinkButton;

                        //txtCADVerifiedDate.Enabled = txtCADVerifierRemarks.Enabled = txtCADVerifierRemarks.Enabled = txtCADReceived.Enabled = txtCADReceiverRemarks.Enabled = flUploadI.Enabled = txtScan.Enabled 
                        //txtCADValue.Enabled =
                        ddlRequired.Enabled = ddlReceived.Enabled =
                        calCollectedDate.Enabled =
                        txtRemarks.Enabled =
                        lnkRemovePRDDC.Enabled = false;
                        lnkUpdateDocuments.Enabled_False();
                        txtCollectedDate.Enabled = false;




                    }





                    hdnSetForceValues.Value = "0";
                    lnkUpdateDocuments.Enabled_False();
                    lnkUpdateDocuments.Attributes.Remove("onclick");
                    btnViewDocuments.Enabled = false;
                    btnViewDocuments.OnClientClick = null;
                    lnkUpdateDocuments.Disabled = true;
                    //btnViewPropect.Disabled = true;

                    //Alert Disable
                    btnUpdateDocumentsDealer.Enabled_False();

                    foreach (GridViewRow grv in gvAlert.Rows)
                    {
                        CheckBox ChkEmail = grv.FindControl("ChkEmail") as CheckBox;
                        CheckBox ChkSMS = grv.FindControl("ChkSMS") as CheckBox;
                        if (ChkEmail != null && ChkSMS != null)
                        {
                            ChkSMS.Enabled = ChkEmail.Enabled = false;
                        }
                    }
                    rptimg.Enabled = false;
                    btnGoProfileCopy.Enabled = false;
                    //btnCancelCheckList.Attributes.Add("disabled", "disabled");  // enable false
                    ddlLanguage.SelectedValue = "1";
                    fuOtherFiles.Enabled = false;
                    txtFileRemarks.Enabled = false;
                    btnUploadMulti.Enabled_False();
                    break;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Error Spot -Pricing Clear Error Method");
        }
    }

    //private void FunPriIRRReset()
    //{
    //    //txtAccIRR.Text = txtAccountIRR_Repay.Text = txtBusinessIRR.Text = txtBusinessIRR_Repay.Text =
    //    //txtCompanyIRR.Text = txtCompanyIRR_Repay.Text = "";
    //    grvRepayStructure.ClearGrid();
    //    if (ViewState["DtCashFlow"] != null)
    //    {
    //        DataTable DtCashFlow = (DataTable)ViewState["DtCashFlow"];
    //        if (DtCashFlow.Rows.Count > 0)
    //        {
    //            DataRow[] drUMFC = null;
    //            if (DtCashFlow.Columns.Contains("CashFlow_ID"))
    //            {
    //                drUMFC = DtCashFlow.Select("CashFlow_ID = 34");
    //            }
    //            else
    //            {
    //                drUMFC = DtCashFlow.Select("CashFlow_Flag_ID = 34");
    //            }
    //            if (drUMFC.Length > 0)
    //            {
    //                drUMFC[0].Delete();
    //                DtCashFlow.AcceptChanges();
    //                ViewState["DtCashFlow"] = DtCashFlow;
    //                if (DtCashFlow.Rows.Count > 0)
    //                {
    //                    FunPriFillCashInflow_ViewState();
    //                }
    //            }

    //        }
    //    }

    //}

    //private void FunPriSetRateMaxLength()
    //{

    //    if (ddl_Return_Pattern.SelectedIndex > 0)
    //    {
    //        if (ddl_Return_Pattern.SelectedValue == "1" || ddl_Return_Pattern.SelectedValue == "2")
    //        {
    //            txtRate.SetPercentagePrefixSuffix(2, 4, false, false, "Rate");
    //        }
    //        else
    //        {
    //            txtRate.SetDecimalPrefixSuffix(5, 4, false, false, "Rate");
    //        }
    //    }
    //    else
    //    {
    //        txtRate.SetPercentagePrefixSuffix(2, 4, false, false, "Rate");
    //    }
    //}


    #region GetCustomerCode
    /// <summary>
    /// GetCompletionList
    /// </summary>
    /// <param name="prefixText">search text</param>
    /// <param name="count">no of matches to display</param>
    /// <returns>string[] of matching names</returns>
    //[System.Web.Services.WebMethod]
    //public static string[] GetCustomerList(String prefixText, int count)
    //{
    //    DataTable dt1 = new DataTable();
    //    obj_PageValue.FunPriLoadCustomerCode();
    //    dt1 = (DataTable)System.Web.HttpContext.Current.Session["CustomerDT"];
    //    List<String> suggetions = GetSuggestions(prefixText, count, dt1);


    //    return suggetions.ToArray();
    //}



    #endregion

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


            string filterExpression = "Customer_Name like '" + key + "%'";
            DataRow[] dtSuggestions = dt1.Select(filterExpression);

            foreach (DataRow dr in dtSuggestions)
            {
                string suggestion = dr["Customer_Name"].ToString() + " -- " + dr["Customer_Code"].ToString();
                suggestions.Add(suggestion);
            }

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException);
            return suggestions;

            //   lblErrorMessage.Text = Resources.LocalizationResources.CustomerTypeChangeError;
        }

        return suggestions;
    }
    #endregion

    private void FunPriLoadCustDetails(string custCode, string mode)
    {
        try
        {
            if (custCode != "")
            {
                //if (ddlEnquiryNumber.SelectedValue != "0" || (hdnCustID.Value == "" || hdnCustID.Value == "0"))
                //{
                //}
                //else
                //{
                //    ddlEnquiryNumber.Items.Clear();
                //}
                //ddlSanctionNumber.Items.Clear();

                //txtCustomerAddress.Text = "";
                //S3GCustomerCommAddress.ClearCustomerDetails();
                //txtEnquiryDate.Text = "";
                //txtSanctionDate.Text = "";

                //DataTable dt = (DataTable)HttpContext.Current.Session["CustomerDT"];

                //if (dt.Rows.Count > 0)
                //{
                //    string filterExpression = "";
                //    if (mode == "1")
                //    {
                //        filterExpression = "Customer_Name = '" + custCode + "'";
                //    }
                //    else if (mode == "2")
                //    {
                //        filterExpression = "Customer_ID = '" + custCode + "'";
                //    }
                //    DataRow[] dtSuggestions = dt.Select(filterExpression);

                //    if (dtSuggestions.Length > 0)
                //    {

                //        strCustomer_Id = dtSuggestions[0]["Customer_ID"].ToString();
                //        hdnCustID.Value = dtSuggestions[0]["Customer_ID"].ToString();
                //        strCustomer_Value = dtSuggestions[0]["Customer_Code"].ToString();
                //        strCustomer_Name = dtSuggestions[0]["Customer_Name"].ToString();
                //        cmbCustomerCode.Text = dtSuggestions[0]["Customer_Name"].ToString() + " -- " + dtSuggestions[0]["Customer_Code"].ToString();
                //        Procparam = new Dictionary<string, string>();
                //        Procparam.Add("@Option", "20");
                //        Procparam.Add("@Company_ID", intCompany_Id.ToString());
                //        Procparam.Add("@Customer_ID", strCustomer_Id);
                //        DataTable dtPastOffer = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);
                //        grvPastOffers.DataSource = dtPastOffer;
                //        grvPastOffers.DataBind();
                //        hvPastoffers.Enabled = true;
                //        btnCreateCustomer.Enabled = false;
                //    }
                //    else
                //    {
                //        hvPastoffers.Enabled = false;
                //        Utility.FunShowAlertMsg(this, "Customer details not available in customer master");
                //        btnCreateCustomer.Enabled = true;
                //        FunPriLoadAllCombos("", "enq");
                //        FunPriLoadAllCombos("", "sanc");
                //        cmbCustomerCode.Text = "";
                //        return;
                //    }
                //}
                //Procparam = new Dictionary<string, string>();
                //Procparam.Add("@Option", "27");
                //if (mode == "1")
                //    Procparam.Add("@Customer_Code", Convert.ToString(custCode));
                //else if (mode == "2")
                //    Procparam.Add("@Customer_ID", Convert.ToString(custCode));
                //Procparam.Add("@Company_ID", intCompany_Id.ToString());
                //DataSet dtCustDtl = Utility.GetDataset("S3G_ORG_GetPricing_List", Procparam);

                //if (dtCustDtl != null && dtCustDtl.Tables[0].Rows.Count > 0)
                //{
                //    strCustomer_Id = Convert.ToString(dtCustDtl.Tables[0].Rows[0]["Customer_ID"]);
                //    hdnCustID.Value = Convert.ToString(dtCustDtl.Tables[0].Rows[0]["Customer_ID"]);
                //    strCustomer_Value = Convert.ToString(dtCustDtl.Tables[0].Rows[0]["Customer_Code"]);
                //    strCustomer_Name = Convert.ToString(dtCustDtl.Tables[0].Rows[0]["Customer_Name"]);
                //    cmbCustomerCode.Text = Convert.ToString(dtCustDtl.Tables[0].Rows[0]["Customer"]);
                //    grvPastOffers.DataSource = dtCustDtl.Tables[1];
                //    grvPastOffers.DataBind();
                //    grvConsDocuments.DataSource = dtCustDtl.Tables[2];
                //    grvConsDocuments.DataBind();
                //    grvConsDocuments.Visible = true;
                //    hvPastoffers.Enabled = true;
                //    btnCreateCustomer.Enabled = false;
                //}
                //else
                //{
                //    hvPastoffers.Enabled = false;
                //    Utility.FunShowAlertMsg(this, "Customer details not available in customer master");
                //    btnCreateCustomer.Enabled = true;
                //    FunPriLoadAllCombos("", "enq");
                //    FunPriLoadAllCombos("", "sanc");
                //    return;
                //}

                //FunPriShowCustomerDetails();
            }

            else
            {
                //txtCustomerAddress.Text = "";
                //hvPastoffers.Enabled = false;
                //S3GCustomerCommAddress.ClearCustomerDetails();
                //txtEnquiryDate.Text = "";
                //txtSanctionDate.Text = "";
                FunPriLoadAllCombos("", "enq");
                FunPriLoadAllCombos("", "sanc");
                //ddlEnquiryNumber.Enabled = true;
                //ddlSanctionNumber.Enabled = true;
                ddlLob.Items.Clear();
                //ddlBranch.Clear();
                //btnCreateCustomer.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in getting customer details");
        }
    }

    private void FunPriCheckPricingStart()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "19");
            Procparam.Add("@Company_ID", intCompany_Id.ToString());
            DataTable dtGlobalStartPoint = Utility.GetDefaultData(SPNames.S3G_ORG_GetPricing_List, Procparam);
            if (dtGlobalStartPoint.Rows.Count > 0)
            {
                bool blnIsStartUp = Convert.ToBoolean(dtGlobalStartPoint.Rows[0]["Offer_Number"].ToString());
                if (blnIsStartUp)
                {
                    FunPriLoadCustomerCode();
                    //btnCreateCustomer.Enabled = true;

                    //cmbCustomerCode.Enabled = true;
                    //cmbCustomerCode.Attributes.Remove("readonly");

                }
                else
                {
                    //cmbCustomerCode.Attributes.Add("readonly", "readonly");
                    //btnCreateCustomer.Enabled = false;
                    //btnCreateCustomer.Visible = false;
                }
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Define start up screen in GlobalParameter setup");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                return;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to check start up screen from global parameter setup");
        }
    }

    private void FunPriResetValues()
    {
        try
        {
            //Main Page Start
            ddlLob.ClearSelection();
            cmbLocation.ClearSelection();
            cmbSubLocation.ClearSelection();
            cmbSubLocation.Items.Clear();
            ucCheckListFromDMS.Clear();
            ucCheckListFromDMS.Enabled = true;
            hdnIsDMS.Value = string.Empty;
            hdnIsDMS.Value = "0";
            hdnISDMSModify.Value = "0";
            hdnIs_IS_NEW_CUSTOMER_FLAG.Value = string.Empty;
            hdnPricing_ID.Value = string.Empty;
            ddlCustomerType.ClearSelection();
            ddlDealType.ClearSelection();
            ddlDealerName.Clear();
            txtDateofBirth.Clear();
            ddlSalePersonCodeList.Clear();
            ddlProduct.ClearSelection();
            //txtOfferDate.Clear();
            txtFacilityAmt.Clear();
            txtTenure.Clear();
            ddlSalePersonCodeList.Clear();
            txtSellerCode.Clear();
            txtSellerName.Clear();
            //ddlStatus.ClearSelection();
            txtInsurancePolicyNo.Clear();
            ddlInsuranceby.ClearSelection();
            ddlInsuranceCoverage.ClearSelection();
            ddldealerSalesPerson.Clear();
            txtGeneralRemarks.Text = string.Empty;
            ddlContType.ClearSelection();
            txtInsuranceRemarks.Clear();
            txtNoPDC.Clear();
            txtPDCstDate.Clear();
            txtProposalNumber.Clear();
            txtAccountNumber.Clear();
            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            txtName.Text = string.Empty;
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            hdnCID.Value = string.Empty;
            funDisableForDMSClear();
            funPrivLoadPDCGrid();
            //funPrivLoadDownPaymentGrid();
            //FunPriLoad_AssetDetails(_Add);

            //Main Page End




        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    //private void FunPriLobReset()
    //{
    //    div7.Visible = false;
    //    div8.Visible = false;
    //    ddlROIRuleList.SelectedIndex = 0;
    //    if (ddlPaymentRuleList.Items.Count > 0)
    //    {
    //        ddlPaymentRuleList.SelectedIndex = 0;
    //    }
    //    //To fill Asset tab
    //    FunPriFill_AssetTab(_Add);
    //    FunPriFill_CashInFlow(_Add);
    //    FunPriFill_CashOutFlow(_Add);
    //    FunPriFill_OfferTab(_Add);
    //    FunPriFill_Repayment_Tab(_Add);
    //    hdnROIRule.Value = "";
    //    FunPriIRRReset();

    //}

    private void FunPriLANNumVisble(bool CanShow)
    {
        //ddlLeaseAssetNo.SelectedIndex = -1;
        //ddlAssetCodeList.SelectedIndex = -1;
        //lblLeaseAssetNo.Visible = CanShow;
        //ddlLeaseAssetNo.Visible = CanShow;
        //rfvLeastAssetCodeNo.Enabled = CanShow;

        //lblAssetCodeList.Visible = !CanShow;
        //ddlAssetCodeList.Visible = !CanShow;
        //rfvAssetCodeList.Enabled = !CanShow;

        //rfvRequiredFromDate.Enabled = CanShow;

    }

    private void FunPriGetNextRepaydate()
    {

        DtRepayGrid = (DataTable)ViewState["DtRepayGrid"];
        int intToInstall = 0;
        DateTime dtNextFromdate = DateTime.Now.Date;
        DataRow[] drRow = DtRepayGrid.Select("CashFlow_Flag_ID = 23", "ToInstall desc");
        if (drRow.Length > 0)
        {
            //dtNextDate = S3GBusEntity.CommonS3GBusLogic.FunPubGetNextDate(ddl_Frequency.SelectedItem.Value, Convert.ToDateTime(drRow[0]["ToDate"].ToString()));
            //intNextInstall = Convert.ToInt32(drRow[0]["ToInstall"].ToString());
        }
        else
        {
            dtNextDate = dtNextFromdate;
            intNextInstall = 0;
        }
    }

    //private void FunRepayClear(string StrErrorMsg)
    //{
    //    grvRepayStructure.DataSource = null;
    //    grvRepayStructure.DataBind();
    //    ViewState["RepaymentStructure"] = null;

    //    txtAccountIRR_Repay.Text = "";
    //    //txtAccIRR.Text = "";
    //    txtBusinessIRR_Repay.Text = "";
    //    //txtBusinessIRR.Text = "";
    //    txtCompanyIRR_Repay.Text = "";
    //    //txtCompanyIRR.Text = "";
    //    if (StrErrorMsg != "")
    //        Utility.FunShowAlertMsg(this, StrErrorMsg);
    //}

    //protected void FunPriGenerateRepayment(DateTime dtStartDate)
    //{
    //    ClsRepaymentStructure objRepaymentStructure = new ClsRepaymentStructure();
    //    try
    //    {
    //        if (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddlLob.SelectedItem.Text.ToUpper().Split('-')[0].Trim() != "FT")
    //        {
    //            if (!ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL"))
    //            {
    //                DataRow[] drFinanAmtRow = ((DataTable)ViewState["DtCashFlowOut"]).Select("CashFlow_Flag_ID = 41");
    //                if (drFinanAmtRow.Length > 0)
    //                {
    //                    decimal decToatlFinanceAmt = (decimal)((DataTable)ViewState["DtCashFlowOut"]).Compute("Sum(Amount)", "CashFlow_Flag_ID = 41");

    //                    //if (Convert.ToDecimal(txtFacilityAmt.Text) != decToatlFinanceAmt)
    //                    //{
    //                    //    Utility.FunShowAlertMsg(this, "Total amount financed in Cashoutflow should be equal to amount financed");
    //                    //    FunRepayClear("");
    //                    //    return;
    //                    //}
    //                }
    //            }

    //            Dictionary<string, string> objMethodParameters = new Dictionary<string, string>();
    //            DataSet dsRepayGrid = new DataSet();
    //            DataTable dtMoratorium = null;
    //            objMethodParameters.Add("LOB", ddlLob.SelectedItem.Text);
    //            //objMethodParameters.Add("Tenure", txtTenure.Text);
    //            //objMethodParameters.Add("TenureType", ddlTenureType.SelectedItem.Text);
    //            //objMethodParameters.Add("FinanceAmount", txtFacilityAmt.Text);
    //            objMethodParameters.Add("ReturnPattern", ddl_Return_Pattern.SelectedValue);
    //            objMethodParameters.Add("MarginPercentage", txtMarginMoneyPer_Cashflow.Text);
    //            objMethodParameters.Add("Rate", txtRate.Text);
    //            objMethodParameters.Add("TimeValue", ddl_Time_Value.SelectedValue);
    //            objMethodParameters.Add("RepaymentMode", ddl_Repayment_Mode.SelectedValue);
    //            objMethodParameters.Add("CompanyId", intCompany_Id.ToString());
    //            objMethodParameters.Add("LobId", ddlLob.SelectedValue);
    //            //objMethodParameters.Add("DocumentDate", txtOfferDate.Text);
    //            objMethodParameters.Add("Frequency", ddl_Frequency.SelectedValue);
    //            objMethodParameters.Add("RecoveryYear1", txt_Recovery_Pattern_Year1.Text);
    //            objMethodParameters.Add("RecoveryYear2", txt_Recovery_Pattern_Year2.Text);
    //            objMethodParameters.Add("RecoveryYear3", txt_Recovery_Pattern_Year3.Text);
    //            objMethodParameters.Add("RecoveryYear4", txt_Recovery_Pattern_Rest.Text);
    //            //objMethodParameters.Add("Roundoff", hdnRoundOff.Value);

    //            if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && ddl_Repayment_Mode.SelectedValue != "5" && ddl_Return_Pattern.SelectedValue == "6")
    //            {
    //                objMethodParameters.Add("PrincipalMethod", "1");
    //            }
    //            else
    //            {
    //                objMethodParameters.Add("PrincipalMethod", "0");
    //            }


    //            if (ViewState["hdnRoundOff"] != null)
    //            {
    //                if (Convert.ToString(ViewState["hdnRoundOff"]) != "")
    //                    objMethodParameters.Add("Roundoff", ViewState["hdnRoundOff"].ToString());
    //                else
    //                    objMethodParameters.Add("Roundoff", "2");
    //            }
    //            else
    //            {
    //                objMethodParameters.Add("Roundoff", "2");
    //            }

    //            //Ol related  changes on 27-07-2011.
    //            if (ddlLob.SelectedItem.Text.ToUpper().StartsWith("OL"))
    //            {
    //                DataTable dtoutflw = (DataTable)ViewState["DtCashFlowOut"];
    //                dtoutflw.Rows.Clear();
    //                if (dtoutflw.Rows.Count == 0)
    //                {
    //                    DataRow drOutflow = dtoutflw.NewRow();
    //                    drOutflow["Date"] = Utility.StringToDate(txtOfferDate.Text);
    //                    drOutflow["CashOutFlow"] = "Fin amount";
    //                    drOutflow["EntityID"] = strCustomer_Id;
    //                    drOutflow["Entity"] = S3GCustomerCommAddress.CustomerName;
    //                    drOutflow["OutflowFromId"] = "144";
    //                    drOutflow["OutflowFrom"] = "Customer";
    //                    DataTable dtAssetdetails = new DataTable();
    //                    /*if (ViewState["ObjDTAssetDetails"] != null)
    //                        dtAssetdetails = (DataTable)ViewState["ObjDTAssetDetails"];
    //                    decimal sumassetvalue = 0;
    //                    if (dtAssetdetails.Rows.Count > 0)
    //                    {
    //                        sumassetvalue = (decimal)(dtAssetdetails.Compute("Sum(AssetValue)", "Noof_Units > 0"));
    //                    }*/

    //                    //drOutflow["Amount"] = txtFacilityAmt.Text;
    //                    drOutflow["CashOutFlowID"] = "-1";
    //                    drOutflow["Accounting_IRR"] = true;
    //                    drOutflow["Business_IRR"] = true;
    //                    drOutflow["Company_IRR"] = true;
    //                    drOutflow["CashFlow_Flag_ID"] = "41";
    //                    dtoutflw.Rows.Add(drOutflow);
    //                }
    //                ViewState["DtCashFlowOut"] = dtoutflw;
    //            }
    //            //For TL
    //            ViewState["DtRepayGrid_TL"] = null;

    //            //Checking if other than normal payment , start date should be last payment date.
    //            if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && ddl_Repayment_Mode.SelectedValue != "5" && ddl_Return_Pattern.SelectedValue == "6")
    //            {
    //                DataTable dtAcctype = ((DataTable)ViewState["PaymentRules"]);
    //                dtAcctype.DefaultView.RowFilter = " FieldName = 'AccountType'";
    //                string strAcctType = dtAcctype.DefaultView.ToTable().Rows[0]["FieldValue"].ToString().Trim().ToUpper();

    //                if (strAcctType == "PROJECT FINANCE" || strAcctType == "DEFERRED PAYMENT" || strAcctType == "DEFERRED STRUCTURED")
    //                {
    //                    DtCashFlowOut = (DataTable)ViewState["DtCashFlowOut"];
    //                    if (DtCashFlowOut.Rows.Count > 0)
    //                    {
    //                        DataRow drOutFlw = DtCashFlowOut.Select("CashFlow_Flag_ID=41").Last();
    //                        if (drOutFlw != null)
    //                        {
    //                            objMethodParameters.Remove("DocumentDate");
    //                            objMethodParameters.Add("DocumentDate", drOutFlw["Date"].ToString());
    //                            dtStartDate = Utility.StringToDate(drOutFlw["Date"].ToString());
    //                        }
    //                    }

    //                }
    //            }


    //            if (ddl_Return_Pattern.SelectedValue == "2")
    //            {
    //                if (txtResidualAmt_Cashflow.Text.Trim() != "" && txtResidualAmt_Cashflow.Text.Trim() != "0")
    //                {
    //                    objMethodParameters.Add("decResidualAmount", txtResidualAmt_Cashflow.Text);
    //                }
    //                if (txtResidualValue_Cashflow.Text.Trim() != "" && txtResidualValue_Cashflow.Text.Trim() != "0")
    //                {
    //                    objMethodParameters.Add("decResidualValue", txtResidualValue_Cashflow.Text);
    //                }
    //                switch (ddl_IRR_Rest.SelectedValue)
    //                {
    //                    case "1":
    //                        objMethodParameters.Add("strIRRrest", "daily");
    //                        break;
    //                    case "2":
    //                        objMethodParameters.Add("strIRRrest", "monthly");
    //                        break;
    //                    default:
    //                        objMethodParameters.Add("strIRRrest", "daily");
    //                        break;

    //                }

    //                objMethodParameters.Add("decLimit", "0.10");
    //                decimal decRateOut = 0;
    //                dsRepayGrid = objRepaymentStructure.FunPubGenerateRepaymentSchedule(dtStartDate, (DataTable)ViewState["DtCashFlow"], (DataTable)ViewState["DtCashFlowOut"], objMethodParameters, dtMoratorium, out decRateOut);
    //                ViewState["decRate"] = Math.Round(Convert.ToDouble(decRateOut), 4);
    //            }
    //            else
    //            {
    //                dsRepayGrid = objRepaymentStructure.FunPubGenerateRepaymentSchedule(dtStartDate, objMethodParameters, dtMoratorium);
    //            }
    //            if (dsRepayGrid != null)
    //            {
    //                if (dsRepayGrid.Tables[0].Rows.Count > 0)
    //                {
    //                    DataTable ObjTempRepayTable = ((DataTable)ViewState["DtRepayGrid"]);
    //                    if (ObjTempRepayTable != null)
    //                    {
    //                        DataRow[] ObjDRArrayInstall = ObjTempRepayTable.Select("CASHFLOW_FLAG_ID = 23");
    //                        if (ObjDRArrayInstall.Length > 0)
    //                        {
    //                            foreach (DataRow ObjRow in ObjDRArrayInstall)
    //                            {
    //                                ObjRow.Delete();
    //                                ObjTempRepayTable.AcceptChanges();
    //                            }

    //                            foreach (DataRow ObjRow in ObjTempRepayTable.Rows)
    //                            {
    //                                dsRepayGrid.Tables[0].ImportRow(ObjRow);
    //                                dsRepayGrid.Tables[0].AcceptChanges();
    //                            }

    //                        }
    //                    }

    //                    DataTable dtRepaymentDec = new DataTable();
    //                    foreach (DataRow dr in dsRepayGrid.Tables[0].Rows)
    //                    {
    //                        dr["PerInstall"] = dr["PerInstall"].ToString()+".000"; //Added By Sathish 0n 28-Apr-2017
    //                    }
    //                    gvRepaymentDetails.DataSource = dsRepayGrid.Tables[0];
    //                    gvRepaymentDetails.DataBind();

    //                    ViewState["DtRepayGrid"] = dsRepayGrid.Tables[0];
    //                    DtRepayGrid = dsRepayGrid.Tables[0];
    //                    //if (ddl_Rate_Type.SelectedItem.Value == "2")
    //                    //{
    //                    //    ((TextBox)gvRepaymentDetails.Rows[0].FindControl("txRepaymentFromDate")).Visible = true;
    //                    //    ((Label)gvRepaymentDetails.Rows[0].FindControl("lblfromdate_RepayTab")).Visible = false;
    //                    //}
    //                    //else
    //                    //{
    //                    ((TextBox)gvRepaymentDetails.Rows[0].FindControl("txRepaymentFromDate")).Visible = false;
    //                    ((Label)gvRepaymentDetails.Rows[0].FindControl("lblfromdate_RepayTab")).Visible = true;
    //                    //}
    //                    btnReset.Enabled = false;
    //                    FunPriCalculateSummary(dsRepayGrid.Tables[0], "CashFlow", "TotalPeriodInstall");
    //                    FunPriCalculateIRR(0);
    //                    ////FunPriShowRepaymetDetails((decimal)DtRepayGrid.Compute("SUM(TotalPeriodInstall)", "CashFlow_Flag_ID =23"));
    //                    DataTable dtRepayDetails = (DataTable)ViewState["DtRepayGrid"];
    //                    if (dtRepayDetails.Rows.Count > 0)
    //                    {
    //                        if (((ddlLob.SelectedItem.Text.ToUpper().Contains("TL")) || (ddlLob.SelectedItem.Text.ToUpper().Contains("TE"))) && (ddl_Return_Pattern.SelectedValue == "6"))
    //                        {
    //                            FunPriShowRepaymetDetails((decimal)dtRepayDetails.Compute("SUM(TotalPeriodInstall)", "1=1"));
    //                            FunPriCalculateSummary(dtRepayDetails, "CashFlow", "TotalPeriodInstall");
    //                        }
    //                        else
    //                        {
    //                            FunPriShowRepaymetDetails((decimal)dsRepayGrid.Tables[0].Compute("SUM(TotalPeriodInstall)", "CashFlow_Flag_ID =23"));
    //                        }
    //                    }
    //                    else
    //                    {
    //                        gvRepaymentDetails.FooterRow.Visible = true;
    //                        btnReset.Enabled = true;
    //                        //decimal decFinAmount = objRepaymentStructure.FunPubGetAmountFinanced(txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text);
    //                        ///* It Calculates and displays the Repayment Details for ST-ADHOC */
    //                        //FunPriShowRepaymetDetails(decFinAmount + FunPriGetStructureAdhocInterestAmount());
    //                    }
    //                }
    //                else
    //                {
    //                    gvRepaymentDetails.FooterRow.Visible = true;
    //                    btnReset.Enabled = true;
    //                    /* It Calculates and displays the Repayment Details for ST-ADHOC */
    //                    decimal decFinAmount = objRepaymentStructure.FunPubGetAmountFinanced(txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text);
    //                    FunPriShowRepaymetDetails(decFinAmount + FunPriGetStructureAdhocInterestAmount());
    //                }
    //            }
    //            else
    //            {
    //                gvRepaymentDetails.FooterRow.Visible = true;
    //                btnReset.Enabled = true;
    //                /* It Calculates and displays the Repayment Details for ST-ADHOC */
    //                decimal decFinAmount = objRepaymentStructure.FunPubGetAmountFinanced(txtFacilityAmt.Text, txtMarginMoneyPer_Cashflow.Text);
    //                FunPriShowRepaymetDetails(decFinAmount + FunPriGetStructureAdhocInterestAmount());
    //            }

    //            FunPriFillRepayment_ViewState();
    //            FunPriUpdateROIRule();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}

    //private void FunPriShowRepaymetDetails(decimal decAmountRepayble)
    //{

    //    if (txtTenure.Text != "" || txtTenure.Text != string.Empty)
    //    {

    //        lblTotalAmount.Text = "Total Amount Repayable : " +Math.Round(decAmountRepayble,ObjS3GSession.ProGpsSuffixRW);//5366
    //        lblFrequency_Display.Text = "Tenure &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : " + txtTenure.Text + " " + ddlTenureType.SelectedItem.Text;
    //        if (txtRate.Text.Trim() != "")
    //        {
    //            if (ViewState["decRate"] != null)
    //            {
    //                lblMarginResidual.Text = "Rate &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : " + ViewState["decRate"].ToString();
    //            }
    //            else
    //            {
    //                lblMarginResidual.Text = "Rate &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : " + txtRate.Text;
    //            }
    //        }

    //    }
    //}

    //private void FunPriSetMaxLength_gvOutFlow()
    //{
    //    if (gvOutFlow.FooterRow != null)
    //    {
    //        TextBox txtAmountOutflow = gvOutFlow.FooterRow.FindControl("txtAmount_Outflow") as TextBox;
    //        //txtAmountOutflow.CheckGPSLength(true, "Outflow Amount",1);
    //        txtAmountOutflow.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Outflow Amount");//5366

    //        Button btnAdd_OutFlow = gvOutFlow.FooterRow.FindControl("btnAddOut") as Button;
    //        btnAdd_OutFlow.Attributes.Add("onclick", "FunChkAllFooterValues(" + gvOutFlow.ClientID + ");");
    //    }
    //}

    //private void FunPriSetMaxLength_gvInflow()
    //{
    //    if (gvInflow.FooterRow != null)
    //    {
    //        TextBox txtAmountInflow = gvInflow.FooterRow.FindControl("txtAmount_Inflow") as TextBox;
    //        txtAmountInflow.CheckGPSLength(false, "Inflow Amount");

    //        Button btnAdd_Inflow = gvInflow.FooterRow.FindControl("btnAdd") as Button;
    //        btnAdd_Inflow.Attributes.Add("onclick", "FunChkAllFooterValues(" + gvInflow.ClientID + ");");
    //    }
    //}

    //private void FunPriSetMaxLength_gvRepaymentDetails()
    //{
    //    if (gvRepaymentDetails.FooterRow != null)
    //    {
    //        TextBox txtPerInstall = gvRepaymentDetails.FooterRow.FindControl("txtPerInstallmentAmount_RepayTab") as TextBox;
    //        //txtPerInstall.CheckGPSLength(false, "Per Installment Amount");
    //        txtPerInstall.SetDecimalPrefixSuffix(12, 3, false, false, "Per Installment Amount");

    //        TextBox txtBreakPer = gvRepaymentDetails.FooterRow.FindControl("txtBreakup_RepayTab") as TextBox;
    //        txtBreakPer.SetDecimalPrefixSuffix(2, 3, false, false, "Break up Percentage");
    //    }
    //}

    private void FunPriSetMaxLength()
    {


        //txtMarginPercentage.SetDecimalPrefixSuffix(2, 0, false, false, "Margin %");
        //txtMarginAmountAsset.CheckGPSLength(false, "Margin Amount");
        //txtMarginAmountAsset.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Margin Amount %");
        txtMargintoDealer.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Margin to Dealer %");
        txtMargintoMFC.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Margin to MFC %");
        txtTradeIn.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Trade In");
        //txtLpoAssetAmount.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Margin to Dealer %");


        //txtFacilityAmt.CheckGPSLength(true, "Facility Amount",1);//5366
        txtFacilityAmt.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "LPO Amount");//5366
        txtUnitValue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, false, "Unit Value");
        //txtTotalAssetValue.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Total Asset Value");
        txtBookDepreciationPerc.SetDecimalPrefixSuffix(3, 3, false, "Book Depreciation %");
        //txtBlockDepreciationPerc.SetDecimalPrefixSuffix(10, 3, false, "Block Depreciation %");
        if (ObjS3GSession.ProGpsSuffixRW < 2)
            HdnGPSDecimal.Value = ObjS3GSession.ProGpsSuffixRW.ToString();
        else
            HdnGPSDecimal.Value = "2";

        //HiddenField hidThrobber = (HiddenField)grvData.FindControl("hidThrobber");
        //HdnGPSDecimal

        //txtCompanyIRR.SetDecimalPrefixSuffix(10, 4, true);
        //txtCompanyIRR_Repay.SetDecimalPrefixSuffix(10, 4, true);

        //txtBusinessIRR.SetDecimalPrefixSuffix(10, 4, true);
        //txtBusinessIRR_Repay.SetDecimalPrefixSuffix(10, 4, true);

        //txtAccIRR.SetDecimalPrefixSuffix(10, 4, true);
        //txtAccountIRR_Repay.SetDecimalPrefixSuffix(10, 4, true);

    }

    //private void FunPriShowRepaymentFooter()
    //{
    //    if (ddl_Repayment_Mode.SelectedItem.Text.ToUpper().Trim() != "PRODUCT" && ddlLob.SelectedItem.Text.ToUpper().Split('-')[0].Trim() != "FT")
    //    {
    //        if (ddl_Rate_Type.SelectedItem.Value == "2" && Request.QueryString["qsMode"].ToString() != "Q")
    //        {
    //            ((TextBox)gvRepaymentDetails.Rows[0].FindControl("txRepaymentFromDate")).Visible = true;
    //            ((Label)gvRepaymentDetails.Rows[0].FindControl("lblfromdate_RepayTab")).Visible = false;
    //        }
    //        else
    //        {
    //            ((TextBox)gvRepaymentDetails.Rows[0].FindControl("txRepaymentFromDate")).Visible = false;
    //            ((Label)gvRepaymentDetails.Rows[0].FindControl("lblfromdate_RepayTab")).Visible = true;
    //        }
    //    }
    //}

    //private int FunPriGetNoofYearsFromTenure()
    //{
    //    int intNoofYears = 0;
    //    if (txtTenure.Text != "")
    //    {
    //        switch (ddlTenureType.SelectedItem.Text.ToLower())
    //        {
    //            case "months":
    //                intNoofYears = (int)Math.Ceiling(Convert.ToDecimal(Convert.ToInt32(txtTenure.Text) / 12.00));
    //                break;
    //            case "weeks":
    //                intNoofYears = (int)Math.Ceiling(Convert.ToDecimal(Convert.ToInt32(txtTenure.Text) / 52.00));
    //                break;
    //            case "days":
    //                intNoofYears = (int)Math.Ceiling(Convert.ToDecimal(Convert.ToInt32(txtTenure.Text) / 365.00));
    //                break;
    //        }
    //    }
    //    return intNoofYears;
    //}


    private void GetReportData()
    {
        //string strLOB = "";
        //if (Convert.ToInt32(ddlLob.SelectedValue) > 0)
        //    strLOB = ddlLob.SelectedItem.ToString();

        //DataTable dt = new DataTable();

        //dt.Columns.Add("CompanyName");
        //dt.Columns.Add("OfferNo");
        //dt.Columns.Add("OfferDate");
        //dt.Columns.Add("CustomerCode");
        //dt.Columns.Add("CustomerName");
        //dt.Columns.Add("CustomerAddress");
        //dt.Columns.Add("LOB");
        //dt.Columns.Add("FinanceAmount");
        //dt.Columns.Add("RateOfInterest");
        //dt.Columns.Add("Tenure");
        //dt.Columns.Add("Advance_Arrears");
        //dt.Columns.Add("FinanceCharges");
        //dt.Columns.Add("IRR");
        //dt.Columns.Add("DealerCommission");
        //dt.Columns.Add("Subvention");
        //dt.Columns.Add("ProcessingFee");
        //dt.Columns.Add("SecurityDeposit");
        //dt.Columns.Add("AnyOtherCharges");


        //DataTable dtReport = new DataTable();
        //dtReport = FunPriGetChargeDetails();

        //DataTable dtCheckList = new DataTable(); // 2 b edited
        //dtCheckList = FunPriGetCheckListDetails(); // 2 b edited

        //DataRow dRow = dt.NewRow();

        //dRow["CompanyName"] = ObjUserInfo.ProCompanyNameRW;
        //dRow["OfferNo"] = txtOfferNo.Text;
        //dRow["OfferDate"] = txtOfferDate.Text;
        //dRow["CustomerCode"] = S3GCustomerCommAddress.CustomerCode;
        //dRow["CustomerName"] = S3GCustomerCommAddress.CustomerName;
        //dRow["CustomerAddress"] = S3GCustomerCommAddress.CustomerAddress;
        //dRow["LOB"] = strLOB;
        //dRow["FinanceAmount"] = txtFacilityAmt.Text;
        //dRow["RateOfInterest"] = txtRate.Text;
        //dRow["Tenure"] = txtTenure.Text + ' ' + ddlTenureType.SelectedItem.Text;
        //dRow["Advance_Arrears"] = ddl_Time_Value.SelectedItem.ToString();
        ////dRow["FinanceCharges"] = FunPriGetInterestAmount().ToString();
        //dRow["FinanceCharges"] = FunPriGetInterestAmount();
        //dRow["IRR"] = txtBusinessIRR.Text;
        //dRow["DealerCommission"] = 0;
        //dRow["Subvention"] = 0;
        //dRow["ProcessingFee"] = dtReport.Rows[0]["ProcessingFee_Dec"].ToString();
        //dRow["SecurityDeposit"] = 0;
        //dRow["AnyOtherCharges"] = dtReport.Rows[0]["AnyOtherCharges_Dec"].ToString();

        //dt.Rows.Add(dRow);

        //DataTable dtRepayment = new DataTable();
        //dtRepayment = (DataTable)ViewState["RepaymentStructure"];

        //Session["Report_Pricing"] = dt;
        //Session["CheckList"] = dtCheckList;
        //Session["Repayment_Structure"] = dtRepayment;

    }






    //private string GetHTMLText()
    //{
    //    StringBuilder strb = new StringBuilder();
    //    string strLOB = "";
    //    if (Convert.ToInt32(ddlLob.SelectedValue) > 0) strLOB = ddlLob.SelectedItem.ToString();

    //    strb.Append("<font size=\"2\"  color=\"black\" face=\"verdana\"> <table align=\"center\" width=\"100%\">");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"center\" > <font size=\"2\"  color=\"Black\" face=\"verdana\"> <u> <b>" + ObjUserInfo.ProCompanyNameRW + "</b> </u> </font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"center\" > <font size=\"2\"  color=\"Black\" face=\"verdana\"> <b>PRICING OFFER</b> </font>  </td>  </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" height=\"15px\"> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"2\" height=\"15px\"> </td> <td  align=\"left\"  valign=\"top\">Offer No: </td>  <td align=\"left\">" + txtOfferNo.Text + " </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"2\" height=\"15px\"> </td> <td  align=\"left\"  valign=\"top\">Offer Date: </td>  <td align=\"left\">" + txtOfferDate.Text + " </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\"> Customer Code:</td><td align=\"left\">" + S3GCustomerCommAddress.CustomerCode + " </td> <td colspan=\"2\" height=\"15px\"> </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\"> Customer Name:</td><td align=\"left\">" + S3GCustomerCommAddress.CustomerName + " </td> <td colspan=\"2\" height=\"15px\"> </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\"> Address:</td><td align=\"left\">" + S3GCustomerCommAddress.CustomerAddress + " </td> <td colspan=\"2\" height=\"15px\"> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">SUB : Business offer against your enquiry </font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">Dear Sir / Madam </font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">We thank for your enquiry and seeking finance for purchase of assets under " + strLOB + " .We are pleased to give our offer as under.</font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"2\" height=\"15px\" align=\"left\" valign=\"top\"> DETAILS: </td><td colspan=\"2\" height=\"15px\" align=\"left\" valign=\"top\">OTHER CHARGES:</td></tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\">Finance Amount:</td><td align=\"left\">" + txtFacilityAmt.Text + " </td><td  align=\"left\"  valign=\"top\"> Dealer commission:</td><td align=\"left\">" + 0 + " </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\">Rate of Interest:</td><td align=\"left\">" + txtRate.Text + " </td><td  align=\"left\"  valign=\"top\"> Subvention:</td><td align=\"left\">" + 0 + " </td></tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\">Tenure:</td><td align=\"left\">" + txtTenure.Text + "  " + ddlTenureType.SelectedItem.Text + " </td><td  align=\"left\"  valign=\"top\"> Processing fee:</td><td align=\"left\">" + 0 + " </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\">Advance/Arrears:</td><td align=\"left\">" + ddl_Time_Value.SelectedItem.ToString() + " </td><td  align=\"left\"  valign=\"top\"> Security Deposit:</td> <td align=\"left\">" + 0 + " </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\">Finance Charges:</td><td align=\"left\">" + FunPriGetInterestAmount().ToString() + " </td><td  align=\"left\"  valign=\"top\"> Any other charges:</td><td align=\"left\">" + 0 + " </td> </tr>");
    //    strb.Append("<tr> <td align=\"left\" valign=\"top\" >IRR:</td><td align=\"left\" >" + txtBusinessIRR.Text + " </td><td align=\"left\" > </td><td align=\"left\" > </td></tr>");
    //    //strb.Append("<tr> <td  align=\"left\"  valign=\"top\" colspan=\"4\"> E.M.I:</td></tr>" );
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">We look forward to your confirmation to proceed further on this. </font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">Yours truly <br> For  " + ObjUserInfo.ProCompanyNameRW + " </font> </td> </tr>");
    //    strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">AUTHORIZED SIGNATORY </font> </td> </tr>");
    //    //   strb.Append("<tr> <td colspan=\"4\" align=\"left\" > <font size=\"2\"  color=\"Black\" face=\"verdana\">Note: the respective currency code should be suffixed before all amount fields.</font> </td> </tr>");
    //    strb.Append("</table></font>");

    //    return strb.ToString();
    //}

    private void FunPriLoadFileNameInPRDDT()
    {
        foreach (GridViewRow grvData in gvPRDDT.Rows)
        {
            Label myThrobber = (Label)grvData.FindControl("myThrobber");
            HiddenField hidThrobber = (HiddenField)grvData.FindControl("hidThrobber");

            if (hidThrobber.Value != "")
            {
                myThrobber.Text = hidThrobber.Value;
            }
        }

    }

    void AssignNewWorkFlowValues(int SelecteDocument, int SelectedProgramId, string SelectedDocumentNo, int BranchID, int LOBId, int ProductId, string LasDocumentNo, DataTable WFSequence)
    {
        WorkFlowSession WFValues = new WorkFlowSession(SelecteDocument, SelectedProgramId, SelectedDocumentNo, BranchID, LOBId, ProductId, LasDocumentNo, 2);
        WFValues.WorkFlowScreens = WFSequence;
    }



    //private void FunPriUpdateROIRuleDecRate()//Added on 3/11/2011 by saran for UAT raised mail modify mode not allowing to save forr IRR to flat rate
    //{
    //    DataTable ObjDTROI = new DataTable(); ;
    //    ObjDTROI = (DataTable)ViewState["ROIRules"];
    //    decimal decRate = 0;
    //    switch (ddl_Return_Pattern.SelectedValue)
    //    {

    //        case "1":
    //            decRate = Convert.ToDecimal(txtRate.Text);
    //            break;
    //        case "2":
    //            //ObjCommonBusLogic.FunPubCalculateFlatRate(dtRepaymentTab, dtCashInflow, dtCashOutflow, ddl_Frequency.SelectedItem.Text, Convert.ToInt32(txtTenure.Text), ddlTenureType.SelectedItem.Text, strDateFormat, Convert.ToDecimal(txtFacilityAmt.Text), Convert.ToDouble(9.6365), strIrrRest, "Empty", strTimeval, Convert.ToDecimal(0.10), IRRType.Accounting_IRR, out decRate, Convert.ToDecimal(10.05), decPLR);
    //            if (ViewState["decRate"] != null)
    //            {
    //                decRate = Convert.ToDecimal(ViewState["decRate"].ToString());
    //            }//Hard Coded for testing IRR
    //            break;
    //    }
    //    ObjDTROI.Rows[0]["IRR_Rate"] = decRate;
    //    ObjDTROI.Rows[0].AcceptChanges();
    //    ViewState["ROIRules"] = ObjDTROI;
    //}

    private string FunPriTempPriDetails(string str, DataTable dtDetails)
    {
        try
        {
            int j = 1;
            string[] q = Regex.Split(str, "</TR>");
            string strHeader = q[0] + "</TR>";
            string strDetails = q[1] + "</TR>";
            string strDontChange = q[1] + "</TR>";

            string Output = string.Empty;

            if (dtDetails.Rows.Count == 0)
            {
                Output = "<TR>";
                foreach (DataColumn dcolsub1 in dtDetails.Columns)
                {

                    string strColnamesub = string.Empty;
                    strColnamesub = "~" + dcolsub1.ColumnName + "~";
                    if (strColnamesub == strColnamesub.ToUpper())
                    {

                        strDetails = strDetails.ToUpper();
                    }
                    if (strDetails.Contains(strColnamesub))
                    {
                        strDetails = strDetails.Replace(strColnamesub, "NIL");
                        Output = strDetails;
                    }

                }
                Output += "</TR>";
                Output = strHeader + Output + "</TBODY></TABLE>";
                return Output;
            }


            foreach (DataRow drsub1 in dtDetails.Rows)
            {
                strDetails = strDontChange;
                foreach (DataColumn dcolsub1 in dtDetails.Columns)
                {
                    string strColnamesub = string.Empty;
                    strColnamesub = "~" + dcolsub1.ColumnName + "~";
                    if (strColnamesub == strColnamesub.ToUpper())
                    {

                        strDetails = strDetails.ToUpper();
                    }
                    if (strDetails.Contains(strColnamesub))
                    {


                        if (strColnamesub == ("~" + "SlNo" + "~"))
                        {
                            strDetails = strDetails.Replace(strColnamesub, j.ToString());
                            j++;
                        }
                        strDetails = strDetails.Replace(strColnamesub, drsub1[dcolsub1].ToString());
                    }

                }
                Output += strDetails;
            }
            Output = strHeader + Output + "</TBODY></TABLE>";
            return Output;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private string FunPriHeadPriDetails(string str, DataTable dtHeader, DataRow dr)
    {
        try
        {
            foreach (DataColumn dcol in dtHeader.Columns)
            {


                string ColName1 = string.Empty;
                ColName1 = "~" + dcol.ColumnName + "~";
                if (ColName1 == ColName1.ToUpper())
                {
                    str = str.ToUpper();
                }
                if (str.Contains(ColName1))
                    str = str.Replace(ColName1, dr[dcol].ToString());
            }

            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriPricingDetails(int CompanyID, string LOB, string Template)
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", CompanyID.ToString());
            if (LOB != "")
                Procparam.Add("@Lob_Id", LOB);


            DataSet DS = new DataSet();

            DataTable dtHeader = new DataTable("Header");
            DataTable dtHeadDetails = new DataTable("Details");
            DataTable dtHeadSubDetails = new DataTable("Subdetails");


            DataTable dtDetails = new DataTable();



            string strHtml = string.Empty;
            string strHtml1 = string.Empty;
            string strHtml2 = string.Empty;
            DataSet dsTabs = new DataSet();
            DS = Utility.GetDataset("S3G_Sys_GetTmplPricingDetails", Procparam);
            if (DS != null)
            {
                if (DS.Tables[0].Rows.Count > 0)
                    dtHeader = DS.Tables[0];//.Copy();
                //if (DS.Tables[1].Rows.Count > 0)
                dtHeadDetails = DS.Tables[1].Copy();
                if (DS.Tables[2].Rows.Count > 0)
                    dtHeadSubDetails = DS.Tables[2];//.Copy();

                //dsTabs.Tables.Add(dtHeadDetails);
                //dsTabs.Tables.Add(dtHeadSubDetails);

            }

            if (dtHeader.Rows.Count == 0)
                return;

            strHtml = Template;
            string[] a = Regex.Split(strHtml, "<TBODY>");
            foreach (DataRow dr in dtHeader.Rows)
            {
                if (!strHtml.Contains("<TBODY>"))
                {
                    strHtml = FunPriHeadPriDetails(strHtml, dtHeader, dr);
                    FunPriGeneratePDF(strHtml, dr["Pricing_ID"].ToString());
                    return;
                }

                string strFinal = string.Empty;
                for (int i = 0; i < a.Length; i++)
                {
                    string str = a[i];
                    string strWithoutTable;
                    string strTable;

                    if (str.Contains("<TR>"))
                    {
                        string[] q = Regex.Split(str, "</TABLE>");
                        strTable = "<TBODY>" + q[0] + "</TABLE>";
                        strWithoutTable = q[1];
                        DataRow[] dtr = null;

                        string strWhichTable = FunPriCheckDatatable(strTable, DS);

                        if (strWhichTable == "Table2")
                        {

                            dtDetails = dtHeadSubDetails.Clone();
                            dtr = dtHeadSubDetails.Select("Pricing_ID=" + dr["Pricing_ID"]);

                        }
                        else if (strWhichTable == "Table1")
                        {
                            dtDetails = dtHeadDetails.Clone();
                            // dtDetails = dtHeadDetails.Copy();
                            dtr = dtHeadDetails.Select("Pricing_ID=" + dr["Pricing_ID"]);
                        }


                        if (dtr.Length > 0)
                        {
                            dtDetails = dtr.CopyToDataTable();
                        }
                        strTable = FunPriTempPriDetails(strTable, dtDetails);
                        strFinal += strTable + strWithoutTable;

                    }
                    else
                    {

                        strFinal += FunPriHeadPriDetails(str, dtHeader, dr);
                    }
                }

                FunPriGeneratePDF(strFinal, dr["Pricing_ID"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }



        //if (dtHeader.Rows.Count > 0)
        //{

        //    foreach (DataRow dr in dtHeader.Rows)
        //    {

        //        strHtml1 = FTBTemplate.Text;
        //        string[] a = Regex.Split(strHtml1, "</TBODY>");
        //        strHtml1 = a[0].ToString();

        //        if (!(a.Length > 1))
        //            if (!(a[0].Contains("<TABLE>")))
        //            {

        //                //if (!(a[1].Contains("</TABLE>")))
        //                //{
        //                foreach (DataColumn dcol in dtHeader.Columns)
        //                {
        //                    string ColName1 = string.Empty;
        //                    ColName1 = "~" + dcol.ColumnName + "~";
        //                    if (strHtml1.Contains(ColName1))
        //                        strHtml1 = strHtml1.Replace(ColName1, dr[dcol].ToString());
        //                }
        //                FunPriGeneratePDF(strHtml1, dr["Pricing_ID"].ToString());
        //                return;


        //            }
        //        foreach (DataColumn dcol in dtHeader.Columns)
        //        {
        //            string ColName1 = string.Empty;
        //            ColName1 = "~" + dcol.ColumnName + "~";
        //            if (strHtml1.Contains(ColName1))
        //                strHtml1 = strHtml1.Replace(ColName1, dr[dcol].ToString());
        //        }
        //        DataRow[] drCustDetails = dtHeadDetails.Select("Customer_ID = " + dr["Customer_ID"].ToString());
        //        if (drCustDetails != null)
        //        {
        //            if (drCustDetails.Length > 0)
        //            {
        //                dtDetails = drCustDetails.CopyToDataTable();
        //            }
        //        }

        //        //string[] stringSeparators = new string[] { "<TD>~" };

        //        //string[] strColumn = strNewHTML.Split(stringSeparators, StringSplitOptions.None);
        //        strHtml1 += "</TBODY>";
        //        int intstartindex = 0;
        //        int intEndindex = 0;

        //        int inttbodysize = 0;
        //        if (strHtml1.Contains("<TBODY>"))
        //            intstartindex = strHtml1.IndexOf("<TBODY>");
        //        if (strHtml1.Contains("</TBODY>"))
        //        {
        //            intEndindex = strHtml1.IndexOf("</TBODY>");
        //            inttbodysize = 8;
        //        }


        //        string strCutString = strHtml1.Substring(intstartindex, intEndindex - intstartindex + inttbodysize);
        //        string strCutStringTD = string.Empty;
        //        string[] stringSeparators1 = new string[] { "<TR>" };

        //        string[] strCutSplit = strCutString.Split(stringSeparators1, StringSplitOptions.None);

        //        if (strCutSplit.Length > 2)
        //        {
        //            int intEndindx = strCutSplit[2].IndexOf("</TR>");
        //            strCutStringTD = "<TR>" + strCutSplit[2].Substring(0, intEndindx) + "</TR>";
        //        }

        //        if (dtDetails.Rows.Count == 0)
        //        {
        //            int j = 0;
        //            string strColnamesub = string.Empty;
        //            string strSubHTml = "<TR>";
        //            foreach (DataColumn dcolsub1 in dtHeadDetails.Columns)
        //            {
        //                if (j != 0 && j != 1) {
        //                    strSubHTml += "<TD>Nil</TD>";
        //                }
        //                j++;
        //            }
        //            strSubHTml += "</TR>";
        //            if ((!string.IsNullOrEmpty(strCutStringTD)) && (!string.IsNullOrEmpty(strSubHTml)))
        //                strHtml1 = strHtml1.Replace(strCutStringTD, strSubHTml);
        //        }

        //        if (dtDetails.Rows.Count > 0)
        //        {
        //            int i = 1;
        //            int j = 1;
        //            string strSubHTml = string.Empty;
        //            foreach (DataRow drsub in dtDetails.Rows)
        //            {
        //                strSubHTml += strCutStringTD.Replace("~", i + "~");
        //                ++i;
        //            }



        //            foreach (DataRow drsub1 in dtDetails.Rows)
        //            {

        //                foreach (DataColumn dcolsub1 in dtDetails.Columns)
        //                {
        //                    string strColnamesub = string.Empty;
        //                    strColnamesub = j.ToString() + "~" + dcolsub1.ColumnName + j.ToString() + "~";
        //                    if (strSubHTml.Contains(strColnamesub))
        //                    {
        //                        if (strColnamesub == (j.ToString() + "~" + "SlNo" + j.ToString() + "~"))
        //                        {


        //                                strSubHTml = strSubHTml.Replace(strColnamesub, j.ToString());

        //                        }

        //                        strSubHTml = strSubHTml.Replace(strColnamesub, drsub1[dcolsub1].ToString());
        //                    }
        //                }
        //                j++;

        //            }
        //            if ((!string.IsNullOrEmpty(strCutStringTD)) && (!string.IsNullOrEmpty(strSubHTml)))
        //                strHtml1 = strHtml1.Replace(strCutStringTD, strSubHTml);
        //        }
        //        if (a[1].Contains("<TBODY>"))
        //        {
        //            strHtml2 = a[1].ToString();
        //            DataRow[] drCust = dtHeadSubDetails.Select("Pricing_ID =" + dr["Pricing_ID"].ToString());

        //            if (drCust != null)
        //            {
        //                if (drCust.Length > 0)
        //                {
        //                    dtSubDetails = drCust.CopyToDataTable();
        //                }
        //            }
        //            strHtml2 += "</TBODY>";


        //            //strHtml1 = a[1].ToString();
        //            //string q = strHtml1.Substring(intstartindex + intEndindex );
        //            int intstartindex1 = 0;
        //            int intEndindex1 = 0;

        //            int inttbodysize1 = 0;
        //            if (strHtml2.Contains("<TBODY>"))
        //                intstartindex1 = strHtml2.IndexOf("<TBODY>");
        //            if (strHtml2.Contains("</TBODY>"))
        //            {
        //                intEndindex1 = strHtml2.IndexOf("</TBODY>");
        //                inttbodysize = 8;
        //            }


        //            string strCutString1 = strHtml2.Substring(intstartindex1, intEndindex1 - intstartindex1 + inttbodysize);
        //            string strCutStringTD1 = string.Empty;
        //            string[] stringSeparators2 = new string[] { "<TR>" };

        //            string[] strCutSplit1 = strCutString1.Split(stringSeparators2, StringSplitOptions.None);

        //            if (strCutSplit1.Length > 2)
        //            {
        //                int intEndindx = strCutSplit1[2].IndexOf("</TR>");
        //                strCutStringTD1 = "<TR>" + strCutSplit1[2].Substring(0, intEndindx) + "</TR>";
        //            }
        //            if (dtSubDetails.Rows.Count > 0)
        //            {
        //                int i = 1;
        //                int j = 1;
        //                string strSubHTml = string.Empty;
        //                foreach (DataRow drsub in dtSubDetails.Rows)
        //                {
        //                    strSubHTml += strCutStringTD1.Replace("~", i + "~");
        //                    ++i;
        //                }



        //                foreach (DataRow drsub1 in dtSubDetails.Rows)
        //                {
        //                    foreach (DataColumn dcolsub1 in dtSubDetails.Columns)
        //                    {
        //                        string strColnamesub = string.Empty;
        //                        strColnamesub = j.ToString() + "~" + dcolsub1.ColumnName + j.ToString() + "~";
        //                        if (strSubHTml.Contains(strColnamesub))
        //                        {
        //                            strSubHTml = strSubHTml.Replace(strColnamesub, drsub1[dcolsub1].ToString());
        //                        }
        //                    }
        //                    j++;
        //                }

        //                strHtml1 += strHtml2;



        //                if ((!string.IsNullOrEmpty(strCutStringTD1)) && (!string.IsNullOrEmpty(strSubHTml)))
        //                    strHtml1 = strHtml1.Replace(strCutStringTD1, strSubHTml);
        //                strHtml1 += "</TABLE>";
        //            }
        //        }
        //        else
        //        {


        //            strHtml1 += "</TABLE>";
        //        }


        //        FunPriGeneratePDF(strHtml1, dr["Pricing_ID"].ToString());
        //    }

        //}

    }

    private string FunPriCheckDatatable(string strTable, DataSet ds)
    {
        string Table = string.Empty;

        DataTable dt;


        for (int i = 0; i < ds.Tables.Count; i++)
        {
            dt = ds.Tables[i].Copy();
            foreach (DataColumn dcol in dt.Columns)
            {
                string ColName1 = string.Empty;
                ColName1 = "~" + dcol.ColumnName + "~";
                if (ColName1 == ColName1.ToUpper())
                {
                    strTable = strTable.ToUpper();
                }
                if (ColName1 != "~SlNo~")
                {
                    if (strTable.Contains(ColName1))
                    {
                        return dt.TableName;
                    }

                }

            }
        }



        return Table;
    }

    private void FunPriGeneratePDF(string strNewHTML, string FileName)
    {
        if (strNewHTML.Contains("&NBSP;"))
        {
            strNewHTML = strNewHTML.Replace("&NBSP;", "<BR>");
        }
        if (strNewHTML.Contains("&nbsp;"))
        {
            strNewHTML = strNewHTML.Replace("&nbsp;", "<BR>");

        }
        String htmlText = strNewHTML.Replace("</P>", "</P></BR>");

        htmlText = htmlText.Replace("<HR>", "<HR width=\"100\">");
        string strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + FileName + ".pdf");
        string strFileName = "/Origination/PDF Files/" + FileName + ".pdf";
        Document doc = new Document();
        PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(strnewFile, FileMode.Create));
        doc.AddCreator("Sundaram Infotech Solutions Limited");
        doc.AddTitle("Dunning Letter_" + FileName);
        doc.Open();
        List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(htmlText), null);
        for (int k = 0; k < htmlarraylist.Count; k++)
        { doc.Add((IElement)htmlarraylist[k]); }
        doc.AddAuthor("S3G Team");
        doc.Close();
        //System.Diagnostics.Process.Start(strnewFile);
        string strScipt = "window.open('../Common/S3GDownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    }

    //private void FunPriGetTemplateNames()
    //{
    //    Dictionary<string, string> dictparam = new Dictionary<string, string>();
    //    dictparam.Add("@Company_ID", intCompany_Id.ToString());
    //    dictparam.Add("@LOB_Id", ddlLob.SelectedValue);
    //    dictparam.Add("@Loc_ID", ddlBranch.SelectedValue);

    //    ddlTemp.BindDataTable("S3G_Org_GetPricingTemplName", dictparam, new string[] { "ID", "Name" });
    //}
    //#endregion
    //To print Check list
    //protected void btnchklist_Click(object sender, EventArgs e)
    //{
    //    DataSet datachklist = new DataSet();
    //    datachklist = (DataSet)ViewState["checklist"];
    //    if (datachklist.Tables[0].Rows.Count > 0)
    //    {
    //        if (Convert.ToInt32(datachklist.Tables[0].Rows[0]["doc_count"].ToString()) <= 0)
    //        {
    //            Utility.FunShowAlertMsg(this.Page, "Predisbursement Documents Not Available for this pricing Number");
    //        }
    //        else
    //        {
    //            FunCrstalReportGeneration();
    //        }
    //    }
    //}
    //private void FunCrstalReportGeneration()
    //{
    //    try
    //    {
    //        Guid objGuid;
    //        objGuid = Guid.NewGuid();
    //        DataSet datachklist = new DataSet();
    //        datachklist = (DataSet)ViewState["checklist"];
    //        rpd.Load(Server.MapPath("Check_list.rpt"));
    //        rpd.SetDataSource(datachklist.Tables[0]);
    //        rpd.Subreports["dealer.rpt"].SetDataSource(datachklist.Tables[1]);
    //        //string strFileName = Server.MapPath(".") + "\\PDF Files\\" + txtOfferNo.Text.Replace("/", "") + objGuid.ToString() + ".pdf";
    //        string strFolder = Server.MapPath(".") + "\\PDF Files";
    //        if (!(System.IO.Directory.Exists(strFolder)))
    //        {
    //            DirectoryInfo di = Directory.CreateDirectory(strFolder);
    //        }
    //        string strScipt = "";
    //        //rpd.ExportToDisk(ExportFormatType.PortableDocFormat, strFileName);
    //        //strScipt = "window.open('../Common/S3GDownloadPage.aspx?qsFileName=/Origination/PDF Files/" + txtOfferNo.Text.Replace("/", "") + objGuid.ToString() + ".pdf', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
    //        //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    //    }
    //    catch (System.IO.IOException ex)
    //    {
    //        Utility.FunShowAlertMsg(this.Page, "Error: Unable to Generate Check List");
    //    }
    //    catch (Exception objException)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
    //    }
    //}
    #region Properties
    protected DateTime dtNextDate { get; set; }
    protected int intNextInstall { get; set; }
    #endregion

    //Start to provide Entity Details with Asset

    protected void ddlPayTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlPayTo.SelectedItem.ToString().ToLower() == "entity")
        {
            FunToggleEntityControls(true);
            ddlEntityNameList.SelectedText = ddlDealerName.SelectedText;
            ddlEntityNameList.SelectedValue = ddlDealerName.SelectedValue;

        }
        else if (ddlPayTo.SelectedItem.ToString().ToLower() == "customer")
        {
            FunToggleEntityControls(false);
            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            if (txtName != null)
            {
                txtCustomerName.Text = txtName.Text;

            }
        }
        else
        {
            txtCustomerName.Text = "";

        }
        //ddlPayTo.Focus();
    }
    protected void FunToggleEntityControls(bool CanShow)
    {
        txtCustomerName.Text = "";
        ddlEntityNameList.Visible = ddlEntityNameList.IsMandatory = CanShow;
        lblEntityNameList.Visible = CanShow;
        txtCustomerName.Visible = !CanShow;
        lblCustomerName.Visible = !CanShow;
        rfvCustomerName.Enabled = !CanShow;

    }


    //End to provide Entity Details with Asset

    protected void btnAssetGO_Click(object sender, EventArgs e)
    {

    }
    //Modal Popup
    protected void tcPricing_ActiveTabChanged(object sender, EventArgs e)
    {
        try
        {
            if (tcPricing.ActiveTabIndex == 1)
            {
                //ModalPopupExtenderAssetList.Show();
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
    protected void btnModalCancel_Click(object sender, EventArgs e)
    {
        //ModalPopupExtenderAssetList.Hide();

    }

    protected void btnPDCGo_Click(object sender, EventArgs e)
    {
        try
        {
            funPrivLoadPDCGrid();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }

    private void funPrivLoadPDCGrid()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Sno", typeof(int));
            dt.Columns.Add("BankId", typeof(string));
            dt.Columns.Add("Bank", typeof(string));
            dt.Columns.Add("BankPlace_Id", typeof(string));
            dt.Columns.Add("BankPlace", typeof(string));
            dt.Columns.Add("Ins_Start", typeof(int));
            dt.Columns.Add("Ins_End", typeof(int));
            dt.Columns.Add("Total_Amount", typeof(decimal));
            dt.Columns.Add("PDC_Type_Id", typeof(int));
            dt.Columns.Add("PDC_Type", typeof(string));
            DataRow dr = dt.NewRow();
            dr[0] = -1;
            dt.Rows.Add(dr);

            GRVPDCDetails.DataSource = dt;
            GRVPDCDetails.DataBind();

            ViewState["PDC"] = dt;
            funPriControlPDCDelete();
            funPriCalculateTotalPdc(dt);
            GRVPDCDetails.Rows[0].Visible = false;
            TextBox txtInsStart = GRVPDCDetails.FooterRow.FindControl("txtInsStart") as TextBox;
            txtInsStart.Text = "1";

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }


    protected void txtAssetCode_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btnLoadAssets_Click(object sender, EventArgs e)
    {
        try
        {
            if (tcPricing.ActiveTabIndex == 1)
            {
                //ModalPopupExtenderAssetList.Show();
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











    protected void lnkAssetCode_Click(object sender, EventArgs e)
    {
        try
        {

            LinkButton lnkAssetCode = (LinkButton)sender;
            ddlAssetCodeList1.SelectedText = lnkAssetCode.Text;
            //ModalPopupExtenderAssetList.Hide();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    protected void ChkNew_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            string strNewWin = string.Empty;

            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes& qsMode=C&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
            this.Focus();
            return;

            //Temp

            //FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket("254", false, 0);
            //strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes&qsMode=M&qsCustomerId=" + FormsAuthentication.Encrypt(Ticket) + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
            //this.Focus();
            //return;

        }
        catch (Exception ae)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ae, strPageName);
        }
    }
    private void FunPriLoadAddressDetails(string strDATEOFBIRTH, string strName)
    {
        try
        {
            txtDateofBirth.Text = strDATEOFBIRTH;
            lblDateofBirth.Text = strName;
            txtDateofBirth.ToolTip = strName;


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ChkExistingCustomer_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            string strLOV = "CMD";
            string strControlId = "ctl00_ContentPlaceHolder1_tcPricing_TabMainPage_ucCustomerCodeLov";
            string strDisplayName = "Name";
            string strQuery = "window.open('../common/GetLOV.aspx?LOV_Code=" + strLOV + "&ControlID=" + strControlId + "&LOBID=" + null + "&RegionID=" + null + "&BranchID=" + null + "&ConstitutionID=" + null + "&DispCont=" + strDisplayName + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=500,height=330,resizable=no,scrollbars=yes,top=50,left=150');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strQuery, true);
            //ddlCustomerType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {

        }
    }

    //protected void btnLoadCustomer_OnClick(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
    //        if (hdnCID != null && hdnCID.Value != "")
    //        {
    //            hdnCustID.Value = hdnCID.Value;
    //            //FunPriLoadAddressDetails(Convert.ToInt32(hdnCID.Value));
    //            FunPriGetConstitutionCodeDetails(hdnCID.Value);
    //            FunPriLoadPreDisbursementDocument();
    //            ddlCustomerType.Focus();

    //        }
    //        else
    //        {
    //            txtNoPDC.Focus();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //    }
    //}

    protected void btnCreateCust_Click(object sender, EventArgs e)
    {
        try
        {
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            if (hdnCID.Value == string.Empty)
            {
                string strNewWin = string.Empty;
                strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes& qsMode=C&NewCustomerID=" + ucCheckListFromDMS.SelectedText + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
                this.Focus();
                return;
            }
            else
            {

                string strNewWin = string.Empty;
                strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes& qsMode=C&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
                this.Focus();
                return;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void btnLoadCustomerCopyProfile_OnClick(object sender, EventArgs e)
    {
        try
        {

            btnCancel.Disabled = true;
            btnPrevTab.Enabled = false;
            btnNextTab.Enabled = false;
            btnClear.Disabled = true;

            rptimg.Enabled = true;
            btnGoProfileCopy.Enabled = true;

            //btnCancelCheckList.Attributes.Remove("");
            ddlProposalCopy.Clear();
            mpeProShow.Show();
            //HiddenField hdnCID = (HiddenField)ucCopyProfileLov.FindControl("hdnID");
            //if (hdnCID != null && hdnCID.Value != "")
            //{
            //    intPricingId = Convert.ToInt32(hdnCID.Value);
            //    FunPriLoadPage();

            //}
            //ddlContType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnLoadCProposalfromDMS_OnClick(object sender, EventArgs e)
    {
        try
        {
            //HiddenField hdnCID = (HiddenField)ucCopyProfileLov.FindControl("hdnID");
            //if (hdnCID != null && hdnCID.Value != "")
            //{
            //    intPricingId = Convert.ToInt32(hdnCID.Value);
            //    FunPriLoadPage();

            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlDraweeBankG_SelectedIndexChanged(object sender, EventArgs e)
    {
        funPriLoadDraweeBankPlace(sender, e);
        //DataTable dtBankBranch = (DataTable)ViewState["BankBranch"];
        //DataRow[] dr = dtBankBranch.Select("DRAWEEBANKMASTER_ID='" + ddlDraweeBankG.SelectedValue + "'");
        //if (dr.Length > 0)
        //{
        //    ddlDraweeBankGPlace.FillDataTable(dr.CopyToDataTable(), "BANKBRANCH_CODE", "BANKBRANCH_NAME");
        //}
        //else
        //{
        //    ddlDraweeBankGPlace.ClearDropDownList();
        //}

    }
    private void funPriLoadDraweeBankPlace(object sender, EventArgs e)
    {
        DropDownList ddlDraweeBankG = (DropDownList)sender;
        DropDownList ddlDraweeBankGPlace = (DropDownList)GRVPDCDetails.FooterRow.FindControl("ddlDraweeBankGPlace");

        DataSet dsGetCheckListDetails = new DataSet();
        Dictionary<string, string> strProParm = new Dictionary<string, string>();
        strProParm.Add("@OPTION", "4");
        strProParm.Add("@COMPANYID", intCompany_Id.ToString());
        strProParm.Add("@USERID", intUserId.ToString());
        strProParm.Add("@PROGRAMID", intProgramId.ToString());
        strProParm.Add("@Page_Mode", "C");
        strProParm.Add("@DRAWEEBANKMASTER_ID", ddlDraweeBankG.SelectedValue);
        ddlDraweeBankGPlace.BindDataTable("S3G_OR_LOAD_LOV", strProParm, "BANKBRANCH_CODE", "BANKBRANCH_NAME");
        ddlDraweeBankG.Focus();
    }

    //private void funPrivLoadDownPaymentGrid()
    //{
    //    try
    //    {
    //        DataTable dt = new DataTable();
    //        dt.Columns.Add("Sno", typeof(int));
    //        dt.Columns.Add("DownPayAmount", typeof(string));
    //        dt.Columns.Add("DownPayReceipt", typeof(string));
    //        DataRow dr = dt.NewRow();
    //        dr[0] = -1;
    //        dt.Rows.Add(dr);

    //        grvDownPaymentReceipt.DataSource = dt;
    //        grvDownPaymentReceipt.DataBind();
    //        ViewState["DOWNPAYRECEIPT"] = dt;
    //        grvDownPaymentReceipt.Rows[0].Visible = false;


    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
    //    }
    //    finally
    //    {

    //    }
    //}
    //protected void grvDownPaymentReceipt_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        Label txtdownPaymentAmount = (Label)e.Row.FindControl("txtdownPaymentAmount");
    //        txtdownPaymentAmount.ReadOnly = true;
    //        txtdownPaymentAmount.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Down Payment Amount");
    //    }
    //    if (e.Row.RowType == DataControlRowType.Footer)
    //    {
    //        TextBox txtdownPaymentAmount = (TextBox)e.Row.FindControl("txtdownPaymentAmount");
    //        txtdownPaymentAmount.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Down Payment Amount");
    //    }
    //}

    //protected void grvDownPaymentReceipt_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    DataTable DOWNPAYRECEIPT = (DataTable)ViewState["DOWNPAYRECEIPT"];
    //    if (DOWNPAYRECEIPT.Rows.Count > 0)
    //    {
    //        DOWNPAYRECEIPT.Rows.RemoveAt(e.RowIndex);
    //        DOWNPAYRECEIPT.AcceptChanges();

    //        if (DOWNPAYRECEIPT.Rows.Count == 0)
    //        {
    //            funPrivLoadDownPaymentGrid();
    //            TextBox t = (TextBox)(grvDownPaymentReceipt.FooterRow.Cells[1].FindControl("txtdownPaymentAmount"));
    //            t.Focus();


    //        }
    //        else
    //        {
    //            //grvDownPaymentReceipt.DataSource = DOWNPAYRECEIPT;
    //            //grvDownPaymentReceipt.DataBind();
    //            //ViewState["DOWNPAYRECEIPT"] = DOWNPAYRECEIPT;

    //        }
    //    }
    //}
    //protected void grvDownPaymentReceipt_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    TextBox txtdownPaymentAmount = grvDownPaymentReceipt.FooterRow.FindControl("txtdownPaymentAmount") as TextBox;
    //    TextBox txtddownPaymentReceipt = grvDownPaymentReceipt.FooterRow.FindControl("txtddownPaymentReceipt") as TextBox;
    //    if (e.CommandName == "Addnew")
    //    {
    //        var VSo = 0;
    //        if (ViewState["DOWNPAYRECEIPT"] != null)
    //        {
    //            DataTable dt = (DataTable)ViewState["DOWNPAYRECEIPT"];

    //            DataRow[] dr = dt.Select("Sno=-1");
    //            if (dr.Length > 0)
    //            {
    //                foreach (DataRow dr2 in dr)
    //                {
    //                    dr2.Delete();
    //                }
    //                dt.AcceptChanges();

    //            }
    //            else
    //            {
    //                if (dt.Rows.Count > 0)
    //                {
    //                    VSo = Convert.ToInt32(dt.Compute("max(Sno)", "1=1"));
    //                }
    //                else
    //                {
    //                    VSo = 0;
    //                }
    //            }

    //            DataRow dr3 = dt.NewRow();
    //            dr3["Sno"] = VSo + 1;
    //            dr3["DownPayAmount"] = txtdownPaymentAmount.Text;
    //            dr3["DownPayReceipt"] = txtddownPaymentReceipt.Text;
    //            dt.Rows.Add(dr3);
    //            grvDownPaymentReceipt.DataSource = dt;
    //            grvDownPaymentReceipt.DataBind();
    //            ViewState["DOWNPAYRECEIPT"] = dt;
    //        }
    //    }
    //    txtdownPaymentAmount.Focus();
    //}


    protected void GRVPDCDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblPDCTypeID = (Label)e.Row.FindControl("lblPDCTypeID");
                Label lblAmount = (Label)e.Row.FindControl("lblAmount");
                if (lblPDCTypeID.Text == "1")
                {
                    Label txtInsStart = (Label)e.Row.FindControl("lblInsStartI");
                    Label txtInsEnd = (Label)e.Row.FindControl("lblInsEndI");
                    txtInsStart.Text = "";
                    txtInsEnd.Text = "";
                    txtInsStart.Enabled = false;
                    txtInsEnd.Enabled = false;
                }
                lblAmount.Text = Convert.ToDecimal(lblAmount.Text).ToString("#,##0.000");
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlBank = (DropDownList)e.Row.FindControl("ddlDraweeBankG");
                DropDownList ddlDraweeBankGPlace = (DropDownList)e.Row.FindControl("ddlDraweeBankGPlace");
                DropDownList ddlPdcType = (DropDownList)e.Row.FindControl("ddlPdcType");
                TextBox txtInsStart = (TextBox)e.Row.FindControl("txtInsStart");
                TextBox txtInsEnd = (TextBox)e.Row.FindControl("txtInsEnd");
                TextBox txtAmountF = (TextBox)e.Row.FindControl("txtAmountF");
                //txtInsStart.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Ins.Start");
                //txtInsEnd.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, true, "Ins.End");
                txtAmountF.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, false, "Amount");

                if (ViewState["Bank"] != null)
                {
                    ddlBank.FillDataTable((DataTable)ViewState["Bank"], "BANK_CODE", "BANK_NAME");
                }
                //if (ViewState["BankBranch"] != null)
                //{
                //    ddlDraweeBankGPlace.FillDataTable((DataTable)ViewState["BankBranch"], "BANKBRANCH_CODE", "BANKBRANCH_NAME");
                //}
                if (ViewState["PDCType"] != null)
                {
                    ddlPdcType.FillDataTable((DataTable)ViewState["PDCType"], "VALUE", "NAME");
                }


            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {

        }
    }

    protected void GRVPDCDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

            //txtNoPDC.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void GRVPDCDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtPDC = (DataTable)ViewState["PDC"];
            if (dtPDC.Rows.Count > 0)
            {
                dtPDC.Rows.RemoveAt(e.RowIndex);
                dtPDC.AcceptChanges();

                if (dtPDC.Rows.Count == 0)
                {
                    funPrivLoadPDCGrid();
                }
                else
                {
                    GRVPDCDetails.DataSource = dtPDC;
                    GRVPDCDetails.DataBind();

                    ViewState["PDC"] = dtPDC;
                    funPriControlPDCDelete();
                    funPriCalculateTotalPdc(dtPDC);

                }
            }
            DropDownList t = (DropDownList)(GRVPDCDetails.FooterRow.Cells[1].FindControl("ddlPdcType"));
            t.Focus();
            if (dtPDC.Rows.Count > 0)
            {

                // lblTotalPdcAmount.Text = Convert.ToDecimal(dtPDC.Compute("sum(Total_Amount)", "1 = 1").ToString()).ToString("#,##0.000");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    [System.Web.Services.WebMethod]
    public static string[] GetSalePersonList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@Company_ID", obj_PageValue.intCompany_Id.ToString());
        Procparam.Add("@Prefix", prefixText);
        Procparam.Add("@Dealer_Id", obj_PageValue.ddlDealerName.SelectedValue);//M
        //Procparam.Add("@User_Id", obj_PageValue.intUserId.ToString());
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_USERLIST_AGT", Procparam));

        return suggestions.ToArray();
    }

    protected void ddlCustomerType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlLob.SelectedValue == "0")
            {
                //Utility.FunShowAlertMsg(this, rfvddlLob.ErrorMessage);
                //ddlCustomerType.SelectedValue = "0";
                //return;
            }


            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            Button btnLoadAccount = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            ucCustomerCodeLov.ShowHideAddressImageButton = false;
            txtCustomerNameLease.Text = string.Empty;
            hdnCID.Value = string.Empty;
            txtName.Text = string.Empty;
            ViewState["ConsitutionId"] = null;
            ViewState["Occupation"] = null;
            ucCustomerCodeLov.Clear();
            txtDateofBirth.Text = string.Empty;

            if (ddlCustomerType.SelectedValue == "1")
            {
                btnCreateCustomer.Attributes.Remove("disabled");
                btnCreateCustomer.Attributes.Add("class", "btn_control");  // enab
                btnLoadAccount.Enabled = false;
                ucCustomerCodeLov.Enabled = false;

            }
            else if (ddlCustomerType.SelectedValue == "2")
            {
                btnCreateCustomer.Attributes.Add("disabled", "disabled");
                btnCreateCustomer.Attributes.Add("class", "btn_control_disable");  // enab
                btnLoadAccount.Enabled = true;
                ucCustomerCodeLov.Enabled = true;
            }
            else if (ddlCustomerType.SelectedValue == "0")
            {
                btnCreateCustomer.Attributes.Add("disabled", "disabled");
                btnCreateCustomer.Attributes.Add("class", "btn_control_disable");  // enab
                btnLoadAccount.Enabled = false;
                ucCustomerCodeLov.Enabled = false;
            }

            ddlCustomerType.Focus();
            //ddlCustomerType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    private void FunPriLoadTenureType()
    {
        OrgMasterMgtServicesReference.OrgMasterMgtServicesClient ObjCustomerService = new OrgMasterMgtServicesReference.OrgMasterMgtServicesClient();
        S3GBusEntity.S3G_Status_Parameters ObjStatus = new S3G_Status_Parameters();

        try
        {
            ObjStatus.Option = 1;
            ObjStatus.Param1 = S3G_Statu_Lookup.TENURE_TYPE.ToString();
            Utility.FillDLL(ddlTenureType, ObjCustomerService.FunPub_GetS3GStatusLookUp(ObjStatus));
            ddlTenureType.SelectedValue = "134";
            ddlTenureType.ClearDropDownList();


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            ObjCustomerService.Close();
        }
    }
    private void funPriLoadProduct()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (intPricingId == 0 && hdnIsDMS.Value != "1")
                Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Company_ID", intCompany_Id.ToString());
            Procparam.Add("@LOB_ID", ddlLob.SelectedValue);
            if (hdnIsDMS.Value != "1" || hdnIsDMS.Value == null)
            {
                DataTable dt = Utility.GetDefaultData(SPNames.SYS_ProductMaster, Procparam);
                Utility.FillDataTable(ddlProduct, dt, "Product_ID", "Product_Name");
                if (dt.Rows.Count > 0)
                {
                    DataRow[] dr = dt.Select("Product_Code='" + hdnLobCode.Value.Trim() + ddlLob.SelectedItem.Text.Substring(0, 1).Trim() + "'");
                    if (dr.Length > 0)
                    {
                        if (intPricingId == 0)
                        {
                            ddlProduct.SelectedValue = dr.CopyToDataTable().Rows[0]["Product_ID"].ToString();
                        }
                    }
                    //DataRow[] dr = dt.Select("Product_Code in('HPN','HPV','HPH')");
                    //if (dr.Length > 0)
                    //{
                    //    ddlProduct.SelectedValue = dr.CopyToDataTable().Rows[0]["Product_ID"].ToString();
                    //    //ddlProduct_SelectedIndexChanged(null, null);
                    //}

                }
            }
            else
            {
                DataTable dt = Utility.GetDefaultData("S3G_SA_GET_PRODLSTDMS", Procparam);
                Utility.FillDataTable(ddlProduct, dt, "Product_ID", "Product_Name");
                if (dt.Rows.Count > 0)
                {
                    DataRow[] dr = dt.Select("Product_Code='" + hdnLobCode.Value.Trim() + ddlLob.SelectedItem.Text.Substring(0, 1).Trim() + "'");
                    if (dr.Length > 0)
                    {
                        if (intPricingId == 0)
                        {
                            ddlProduct.SelectedValue = dr.CopyToDataTable().Rows[0]["Product_ID"].ToString();
                        }
                    }
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    private void funPriLoadSetUnitTestValues()
    {
        ddlLob.SelectedValue = "2";
        FunPriLoadLocation(1, 1, 42, 2);
        cmbLocation.SelectedValue = "8";
        FunPriLoadSubLocation(1, 1, "8", 1);
        cmbSubLocation.SelectedValue = "9";
        ddlCustomerType.SelectedIndex = 1;
        ddlAppraisalType.SelectedIndex = 1;
        ddlContType.SelectedIndex = 1;
        ddlDealType.SelectedIndex = 1;
        ddlDealerName.SelectedText = "test";
        ddlDealerName.SelectedValue = "94";
        txtDateofBirth.Text = "25-May-2018";
        ddlSalePersonCodeList.SelectedText = "Test";
        ddlSalePersonCodeList.SelectedValue = "Test";
        funPriLoadProduct();
        ddlProduct.SelectedIndex = 1;
        txtOfferDate.Text = "25-May-2018";
        txtFacilityAmt.Text = "50000";
        txtTenure.Text = "12";
        ddlTenureType.SelectedIndex = 1;
        //ddldealerSalesPerson.SelectedText = "test";
        //ddldealerSalesPerson.SelectedValue = "3";
        ddlSalePersonCodeList.SelectedValue = "test";
        txtSellerName.Text = "test";
        txtSellerCode.Text = "test";
        //ddlPurpose.SelectedIndex = 1;
        //ddlInsurar.SelectedText = "test";
        //ddlInsurar.SelectedValue = "94";
        txtInsurancePolicyNo.Text = "345";
        ddlInsuranceby.SelectedValue = "1";
        ddlInsuranceCoverage.SelectedValue = "1";
        txtInsuranceRemarks.Text = "test";
        //ddlBank.SelectedIndex = 1;
        //ddlBankBranch.SelectedIndex = 1;
        //txtSecAmount.Text = "500";
        TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
        txtName.Text = "sathish";


        //Asset 
        ddlAssetCodeList1.SelectedText = "hi";
        txtRequiredFromDate.Text = "25-May-2018";
        txtUnitCount.Text = "1";
        txtUnitValue.Text = "5000";
        txtTotalAssetValue.Text = "5000";
        txtMarginPercentage.Text = "2";
        txtMarginAmountAsset.Text = "2000";
        ddlPayTo.SelectedIndex = 1;
        txtCustomerName.Text = "testcustomer";
        txtMargintoMFC.Text = "700";
        txtMargintoDealer.Text = "600";
        txtTradeIn.Text = "200";
        //ddlProduct_SelectedIndexChanged(null, null);
        //Panel8.Visible = true;
        //FunPriLoadAddressDetails(Convert.ToInt32(35));
        //ddlPdcType.SelectedValue = "1";
        txtNoPDC.Text = "20";
        txtPDCstDate.Text = "26-May-2018";
        txtProposalNumber.Text = "PRO001";
        txtAccountNumber.Text = "PAN/1";
        ddlStatus.SelectedIndex = 1;
        hdnCustID.Value = "254";
        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
        hdnCID.Value = "254";
        btnAddAsset_OnClick(null, null);
        btnPDCGo_Click(null, null);
        FunPriLoadPreDisbursementDocument();



    }

    protected void ddlProposalFromDMS_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }
    protected void ddlPdcType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlPdcType = (DropDownList)sender;
            TextBox txtInstart = (TextBox)GRVPDCDetails.FooterRow.FindControl("txtInsStart");
            TextBox txtInsEnd = (TextBox)GRVPDCDetails.FooterRow.FindControl("txtInsEnd");
            TextBox txtAmountF = (TextBox)GRVPDCDetails.FooterRow.FindControl("txtAmountF");
            RequiredFieldValidator rfvInsStart = (RequiredFieldValidator)GRVPDCDetails.FooterRow.FindControl("rfvInsStart");
            RequiredFieldValidator rfvInsEnd = (RequiredFieldValidator)GRVPDCDetails.FooterRow.FindControl("rfvInsEnd");

            DropDownList ddlDraweeBankG = (DropDownList)GRVPDCDetails.FooterRow.FindControl("ddlDraweeBankG");
            txtAmountF.Text = txtInstart.Text = txtInsEnd.Text = string.Empty;
            if (ddlPdcType.SelectedValue == "1")
            {

                txtInstart.Enabled = false;
                txtInsEnd.Enabled = false;
                rfvInsStart.Enabled = false;
                rfvInsEnd.Enabled = false;
                txtInstart.Text = "";


            }
            else
            {
                txtInstart.Enabled = false;
                txtInsEnd.Enabled = true;
                rfvInsStart.Enabled = true;
                rfvInsEnd.Enabled = true;
                string InsNo = (((DataTable)ViewState["PDC"]).Compute("Max(Ins_End)", "Ins_End is not null")).ToString();
                if (InsNo == null || InsNo == string.Empty)
                    InsNo = "0";
                txtInstart.Text = (Convert.ToInt32(InsNo) + 1).ToString();
            }
            ddlPdcType.Focus();
            //ddlDraweeBankG.Focus();
        }
        catch (Exception ex)
        {

            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }

    }
    protected void ddlContType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txtSellerCode.Text = string.Empty;
            txtSellerName.Text = string.Empty;
            if (ddlContType.SelectedValue == "1")//New
            {
                //lblSellerName.CssClass = "styleDisplayLabel";
                //lblSellerCode.CssClass = "styleDisplayLabel";
                //rfvSellerName.Enabled = false;
                //rfvSellerCode.Enabled = false;
                txtSellerCode.Enabled = false;
                txtSellerName.Enabled = false;

            }
            else
            {
                //lblSellerName.CssClass = "styleReqFieldLabel";
                //lblSellerCode.CssClass = "styleReqFieldLabel";
                //rfvSellerName.Enabled = true;
                //rfvSellerCode.Enabled = true;
                txtSellerCode.Enabled = true;
                txtSellerName.Enabled = true;
            }
            HttpContext.Current.Session["ddlContType"] = ddlContType.SelectedValue;
            //FunPriLoadPreDisbursementDocument();
            //ddlContType.Focus();
            hdnIsLoad.Value = "1";
            ddlContType.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    //protected void ddlDealType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (ddlDealType.SelectedValue == "1")//Dealer
    //        {
    //            HttpContext.Current.Session["DealType"] = "DLR";
    //            ddlDealerName.Enabled = true;
    //            ddlDealerName.IsMandatory = true;
    //            lblDealerName.CssClass = "styleReqFieldLabel";

    //            ddldealerSalesPerson.IsMandatory = true;
    //            ddldealerSalesPerson.Enabled = true;
    //            lblDealerSalesPerson.CssClass = "styleReqFieldLabel";
    //        }
    //        else
    //        {
    //            ddlDealerName.IsMandatory = false;
    //            ddlDealerName.Enabled = false;
    //            ddlDealerName.Clear();
    //            lblDealerName.CssClass = "styleDisplayLabel";

    //            ddldealerSalesPerson.IsMandatory = false;
    //            ddldealerSalesPerson.Enabled = false;
    //            ddldealerSalesPerson.Clear();
    //            lblDealerSalesPerson.CssClass = "styleDisplayLabel";

    //            HttpContext.Current.Session["DealType"] = " ";
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
    //    }
    //    ddlDealType.Focus();
    //}
    protected void txtInsuranceRemarks_TextChanged(object sender, EventArgs e)
    {
        //txtNoPDC.Focus();
    }
    protected void ddlDealerName_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            //ddlPayTo.SelectedValue = "0";
            //ddlPayTo_SelectedIndexChanged(null, null);
            ddlEntityNameList.SelectedText = ddlDealerName.SelectedText;
            ddlEntityNameList.SelectedValue = ddlDealerName.SelectedValue;
            //ddlPayTo.ClearDropDownList();

        }
        catch (Exception ex)
        {

        }
    }
    protected void CbxReceivedStatus_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox CbxReceivedStatus = sender as CheckBox;
        int intCurrentRow = ((GridViewRow)CbxReceivedStatus.Parent.Parent).RowIndex;
        Label lblReceivedStatus = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblReceivedStatus");
        if (CbxReceivedStatus.Checked)
        {

            lblReceivedStatus.Text = "1";
        }
        else
        {
            lblReceivedStatus.Text = "0";
        }
    }
    //protected void CbxIsscanned_CheckedChanged(object sender, EventArgs e)
    //{
    //    CheckBox CbxIsscanned = sender as CheckBox;
    //    int intCurrentRow = ((GridViewRow)CbxIsscanned.Parent.Parent).RowIndex;
    //    Label lblScanned = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblScanned");
    //    if (CbxIsscanned.Checked)
    //    {

    //        lblScanned.Text = "1";
    //    }
    //    else
    //    {
    //        lblScanned.Text = "0";
    //    }
    //}
    //protected void CbxMandatory_CheckedChanged(object sender, EventArgs e)
    //{
    //CheckBox CbxMandatory = sender as CheckBox;
    //int intCurrentRow = ((GridViewRow)CbxMandatory.Parent.Parent).RowIndex;
    //Label lblMandatory = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblMandatory");
    //if (CbxMandatory.Checked)
    //{

    //    lblMandatory.Text = "1";
    //}
    //else
    //{
    //    lblMandatory.Text = "0";
    //}
    //}
    //protected void CbxCheck_CheckedChanged(object sender, EventArgs e)
    //{
    //    CheckBox CbxCheckCollected = sender as CheckBox;
    //    int intCurrentRow = ((GridViewRow)CbxCheckCollected.Parent.Parent).RowIndex;
    //    Label lblCollected = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblCollected");
    //    if (CbxCheckCollected.Checked)
    //    {

    //        lblCollected.Text = "1";
    //    }
    //    else
    //    {
    //        lblCollected.Text = "0";
    //    }
    //}
    //protected void CbxCheck_CheckedChangedF(object sender, EventArgs e)
    //{
    //CheckBox CbxCheckCollected = sender as CheckBox;
    //int intCurrentRow = ((GridViewRow)CbxCheckCollected.Parent.Parent).RowIndex;
    //Label lblCollected = (Label)gvPRDDT.Rows[intCurrentRow].FindControl("lblCollected");
    //if (CbxCheckCollected.Checked)
    //{

    //    lblCollected.Text = "1";
    //}
    //else
    //{
    //    lblCollected.Text = "0";
    //}
    //}
    //Template Part

    private void funPriSendEmail(DataTable dtBaseInfor, string strFileName, string strEntityId)
    {
        try
        {
            string strMAILHTML = string.Empty;
            string strREMAINDER_OUTPUT = string.Empty;
            string strTo_User = string.Empty;


            System.Data.DataTable dt = new System.Data.DataTable();
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompany_Id.ToString());
            Procparam.Add("@Lob_Id", ddlLob.SelectedValue);
            Procparam.Add("@Location_ID", cmbLocation.SelectedValue);
            Procparam.Add("@language", "1");
            Procparam.Add("@Template_Type_Code", "112");
            dt = Utility.GetDefaultData("S3G_Get_TemplateCont", Procparam);







            DataTable dtUsermailAddress;
            Dictionary<string, string> Procparammail2;
            Procparammail2 = new Dictionary<string, string>();
            Procparammail2.Add("@Company_Id", intCompany_Id.ToString());
            Procparammail2.Add("@USER_ID", intUserId.ToString());
            Procparammail2.Add("@PROGRAM_ID", intProgramId.ToString());
            Procparammail2.Add("@USER_TYPE_ID", "2");//Entity
            Procparammail2.Add("@ALERTS_USERCONTACT", strEntityId);
            Procparammail2.Add("@Template_Type_Code", "104");
            dtUsermailAddress = Utility.GetDefaultData("CMN_GET_USER_MAILADDRESS", Procparammail2);

            if (dtUsermailAddress.Rows.Count > 0)
            {
                strTo_User = dtUsermailAddress.Rows[0]["USER_MAIL"].ToString();
            }


            strMAILHTML = dt.Rows[0]["Template_Content"].ToString();
            strMAILHTML = PDFPageSetup.FunPubBindCommonVariables(strMAILHTML, dtUsermailAddress);
            string strImagePath = String.Empty;
            if (strMAILHTML.Contains("~CompanyLogo~"))
            {
                strImagePath = Server.MapPath("../Images/TemplateImages/CompanyLogo.png");
                strMAILHTML = PDFPageSetup.FunPubBindImages("~CompanyLogo~", strImagePath, strMAILHTML);
            }



            //Get Mail Setup
            System.Data.DataTable dtmaiisetup = new System.Data.DataTable();
            Dictionary<string, string> Procparammail;
            Procparammail = new Dictionary<string, string>();
            Procparammail.Add("@Company_Id", intCompany_Id.ToString());
            Procparammail.Add("@USER_ID", intUserId.ToString());
            Procparammail.Add("@PROGRAM_ID", intProgramId.ToString());
            Procparammail.Add("@Template_Type_Code", "112");
            dtmaiisetup = Utility.GetDefaultData("CMN_GET_MAILDETAILS", Procparammail);
            if (dtmaiisetup.Rows.Count > 0)
            {
                //strTo_User = dtmaiisetup.Rows[0]["USER_MAIL"].ToString();
            }


            //Assign Mail setup in variables
            string strFrom_User = dtmaiisetup.Rows[0]["FROM_MAIL"].ToString();
            string strTo_User_From_SetupTable = dtmaiisetup.Rows[0]["TO_MAIL"].ToString();
            string strCC_User = dtmaiisetup.Rows[0]["CC_MAIL"].ToString();
            string strBCC_User = dtmaiisetup.Rows[0]["BCC_MAIL"].ToString();
            string strSubject = dtmaiisetup.Rows[0]["SUBJECT"].ToString();
            string strDisplayName = dtmaiisetup.Rows[0]["DISPLAY_NAME"].ToString();
            string strSchedueType = dtmaiisetup.Rows[0]["SCHEDULE_TYPE"].ToString();
            string strConfigType = dtmaiisetup.Rows[0]["CONFIG_TYPE"].ToString();


            string strACCOUNT_INS_DETAILS_ID = intPricingId.ToString();
            string strAttachment_Path = string.Empty;
            string strPathwithFile = string.Empty;
            if (strFileName != null)
            {
                strAttachment_Path = strFileName.ToString();
                strPathwithFile = strAttachment_Path + "\\" + strREMAINDER_OUTPUT;
            }
            string strCUST_EMAIL = strTo_User;
            if (strConfigType == "1") // 1 - Actual
            {
                strTo_User = strCUST_EMAIL.ToString() + "," + strTo_User_From_SetupTable;
            }
            else
            {
                strTo_User = strTo_User_From_SetupTable.ToString();
            }

            //Attachement
            if (strFileName != null)
            {
                strREMAINDER_OUTPUT = strFileName.ToString();
            }

            //Send Mail
            if (strSchedueType.ToString() == "1" && strTo_User != "" && strTo_User != string.Empty) //  1 - Immediate; 
            {
                StringBuilder strBody = new StringBuilder();
                Dictionary<string, string> dictMail = new Dictionary<string, string>();
                //dictMail.Add("FromMail", "sflcasarray.sundaramfinance.in");
                dictMail.Add("FromMail", strFrom_User.ToString());
                dictMail.Add("ToMail", strTo_User);
                dictMail.Add("ToCC", strCC_User);
                dictMail.Add("ToBCC", strBCC_User);
                dictMail.Add("Subject", strSubject.ToString());
                dictMail.Add("DisplayName", strDisplayName.ToString());
                ArrayList arrMailAttachement = new ArrayList();
                if (strFileName != null)
                {

                    arrMailAttachement.Add(strFileName);
                }
                strBody.Append(strMAILHTML);
                Utility.FunPubSentMail(dictMail, arrMailAttachement, strBody);
            }


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }


    protected void btnCheckListPrint(object sender, EventArgs e)
    {
        try
        {
            if (strMode == "C")
            {
                btnSave.Enabled_False();
            }
            funPrintCheckList(intPricingId);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Check List", strRedirectPageView, true);
        }
        catch (Exception ex)
        {

            Utility.FunShowAlertMsg(this, ex.ToString());
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            return;
        }
    }

    private void funPrintCheckList(int intPricingId)
    {
        try
        {
            if (intPricingId == 0)
            {
                if (ViewState["PricingId"] != null)
                {
                    intPricingId = Convert.ToInt32(ViewState["PricingId"]);
                }
            }

            if (ddlLanguage.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Language");
                return;
            }

            var filepaths = new List<string>();
            string OutputFile = Server.MapPath(".") + "\\PDF Files\\" + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss");
            //string FilePath = Server.MapPath(".") + "\\PDF Files\\";
            if (hdnLobCode.Value.ToString().ToUpper() == "FT" || hdnLobCode.Value.ToString().ToUpper() == "TL" || hdnLobCode.Value.ToString().ToUpper() == "WC")
            {

                String strHTML = String.Empty;
                strHTML = FunPubGetTemplateContent(intCompany_Id, ddlLob.SelectedValue, cmbLocation.SelectedValue, cmbSubLocation.SelectedValue, 9, intPricingId.ToString());

                if (strHTML == "")
                {
                    //Utility.FunShowAlertMsg(this, "(" + ddlLob.SelectedItem.Text + ") CheckList Format or Template not defined in Template Master ");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 12);
                    return;
                }
                string FileName = PDFPageSetup.FunPubGetFileName(txtProposalNumber.Text + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss"));

                //if (chkPDF.Checked)
                //{
                string FilePath = Server.MapPath(".") + "\\PDF Files\\";
                string DownFile = FilePath + FileName + ".pdf";

                SaveDocument(strHTML, txtProposalNumber.Text, FilePath, FileName, "0", "0", "0", intPricingId);
                if (!File.Exists(DownFile))
                {
                    //Utility.FunShowAlertMsg(this, "File not exists");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 13);
                    return;
                }
                filepaths.Add(DownFile);

                DeletePages((1).ToString(), DownFile, DownFile, "");
                Utility.FunPriGenerateFilesCheckList(filepaths, OutputFile, "P");
                FunPriDownloadFile(OutputFile);





                //Response.AppendHeader("content-disposition", "attachment; filename=CheckList.pdf");
                //Response.ContentType = "application/pdf";
                //Response.WriteFile(DownFile);




            }
            else
            {
                if (ViewState["ASSETPRINT"] == null)
                {
                    Utility.FunShowAlertMsg(this, "Asset Details Not Available");
                    return;
                }
                int iRowCount = 0;
                if (ViewState["ASSETPRINT"] != null)
                {
                    DataTable dtASSETPRINT = (DataTable)ViewState["ASSETPRINT"];
                    iRowCount = dtASSETPRINT.Rows.Count;
                    if (dtASSETPRINT.Rows.Count > 0)
                    {
                        string strDownLoadFile3 = string.Empty;

                        foreach (DataRow dr in dtASSETPRINT.Rows)
                        {

                            String strHTML = String.Empty;
                            strHTML = FunPubGetTemplateContent(intCompany_Id, ddlLob.SelectedValue, cmbLocation.SelectedValue, cmbSubLocation.SelectedValue, 9, intPricingId.ToString());

                            if (strHTML == "")
                            {
                                //Utility.FunShowAlertMsg(this, "(" + ddlLob.SelectedItem.Text + ") CheckList Format or Template not defined in Template Master ");
                                Utility.FunShowValidationMsg(this, "ORG_PRI", 12);
                                return;
                            }
                            string FileName = PDFPageSetup.FunPubGetFileName(txtProposalNumber.Text + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss"));

                            //if (chkPDF.Checked)
                            //{
                            string FilePath = Server.MapPath(".") + "\\PDF Files\\";
                            string DownFile = FilePath + FileName + ".pdf";


                            SaveDocument(strHTML, txtProposalNumber.Text, FilePath, FileName, dr["entity_id"].ToString(), dr["no_of_units"].ToString(), dr["PAY_TO"].ToString(), intPricingId);

                            if (Convert.ToInt32(ViewState["DocumentCuount"]) == 1)
                            {

                                //strDownLoadFile3 = DownFile;
                                //Single File
                                //if (strMode == "C")
                                //{
                                //string strFileEmail = FileName + "Email";
                                //string DownFile2 = FilePath + strFileEmail + ".pdf";
                                //SaveDocument(strHTML, txtProposalNumber.Text, FilePath, strFileEmail, dr["entity_id"].ToString(), dr["no_of_units"].ToString(), dr["PAY_TO"].ToString(), intPricingId);

                                //if (!File.Exists(DownFile2))
                                //{
                                //    DownFile2 = null;
                                //}
                                //funPriSendEmail(dtASSETPRINT, DownFile2, dtASSETPRINT.Rows[0]["ENTITY_ID"].ToString());

                                //}


                                if (!File.Exists(DownFile))
                                {

                                    //Utility.FunShowAlertMsg(this, "File not exists");
                                    Utility.FunShowValidationMsg(this, "ORG_PRI", 13);
                                    return;
                                }
                                filepaths.Add(DownFile);
                                DeletePages((iRowCount + 1).ToString(), DownFile, DownFile, "");










                                //removeBlankPdfPages(DownFile, DownFile, true);
                                //PDFPageSetup.RemoveBlankPage(DownFile);
                                //Response.AppendHeader("content-disposition", "attachment; filename=CheckList.pdf");
                                //Response.ContentType = "application/pdf";
                                //Response.WriteFile(DownFile);
                                //}
                                //else if (chkEmial.Checked)
                                //{
                                //    string FilePath = Server.MapPath(".") + "\\PDF Files\\";
                                //    SaveDocument(strHTML, txtProposalNumber.Text, FilePath, FileName);
                                //    string DownFile = FilePath + FileName + ".doc";
                                //    if (!File.Exists(DownFile))
                                //    {
                                //        Utility.FunShowAlertMsg(this, "File not exists");
                                //        return;
                                //    }
                                //    Response.AppendHeader("content-disposition", "attachment; filename=PurchaseOrder.doc");
                                //    Response.ContentType = "application/vnd.ms-word";
                                //    Response.WriteFile(DownFile);
                                //}
                            }
                        }
                    }
                    else
                    {
                        //Utility.FunShowAlertMsg(this, "Asset Details not Available unnable to Print Checklist");
                        Utility.FunShowValidationMsg(this, "ORG_PRI", 14);
                        return;
                    }
                    if (filepaths.Count == 0)
                    {
                        Utility.FunShowAlertMsg(this.Page, "CheckList Documents Detail Not Exists");
                        //Utility.FunShowValidationMsg(this, "ORG_PRI", 15);
                        return;
                    }
                    else
                    {
                        Utility.FunPriGenerateFilesCheckList(filepaths, OutputFile, "P");
                        FunPriDownloadFile(OutputFile);
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



    public void DeletePages(string pageRange, string SourcePdfPath, string OutputPdfPath, string str)
    {

        List<int> pagesToDelete = new List<int>();
        // check for non-consecutive ranges
        if (pageRange.IndexOf(",") != -1)
        {
            string[] tmpHold = pageRange.Split(',');
            foreach (string nonconseq in tmpHold)
            {
                // check for ranges
                if (nonconseq.IndexOf("-") != -1)
                {
                    string[] rangeHold = nonconseq.Split('-');
                    for (int i = Convert.ToInt32(rangeHold[0]); i <= Convert.ToInt32(rangeHold[1]); i++)
                    {
                        pagesToDelete.Add(i);
                    }
                }
                else
                {
                    pagesToDelete.Add(Convert.ToInt32(nonconseq));
                }
            }
        }
        else
        {
            // check for ranges
            if (pageRange.IndexOf("-") != -1)
            {
                string[] rangeHold = pageRange.Split('-');
                for (int i = Convert.ToInt32(rangeHold[0]); i <= Convert.ToInt32(rangeHold[1]); i++)
                {
                    pagesToDelete.Add(i);
                }
            }
            else
            {
                if (IDocumentCount <= 18)
                {
                    //pagesToDelete.Add(Convert.ToInt32(pageRange));
                }
            }
        }




        Document doc = new Document();
        PdfReader reader = new PdfReader(SourcePdfPath, new System.Text.ASCIIEncoding().GetBytes(""));





        using (MemoryStream memoryStream = new MemoryStream())
        {
            PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);


            //PdfWriter pdfWriter = PdfWriter.GetInstance(doc, memoryStream);
            writer.PageEvent = new PdfWriterEvents(ddlStatus.SelectedItem.Text);

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





    public static void removeBlankPdfPages(string pdfSourceFile, string pdfDestinationFile, bool debug)
    {

        string result = Path.GetFileNameWithoutExtension(pdfSourceFile);
        result = result + "Des.pdf";
        string strFilePath = Path.GetDirectoryName(pdfSourceFile);

        string DecFile = Path.Combine(strFilePath, result);
        // step 0: set minimum page size
        const int blankPdfsize = 20;

        // step 1: create new reader
        var r = new PdfReader(pdfSourceFile);
        var raf = new RandomAccessFileOrArray(pdfSourceFile);
        var document = new Document(r.GetPageSizeWithRotation(1));

        // step 2: create a writer that listens to the document
        var writer = new PdfCopy(document, new FileStream(DecFile, FileMode.Create));

        // step 3: we open the document
        document.Open();

        // step 4: we add content
        PdfImportedPage page = null;

        //loop through each page and if the bs is larger than 20 than we know it is not blank.
        //if it is less than 20 than we don't include that blank page.
        for (var i = 1; i <= r.NumberOfPages; i++)
        {
            //get the page content
            byte[] bContent = r.GetPageContent(i, raf);
            var bs = new MemoryStream();

            //write the content to an output stream
            bs.Write(bContent, 0, bContent.Length);
            Console.WriteLine("page content length of page {0} = {1}", i, bs.Length);

            //add the page to the new pdf
            if (bs.Length > blankPdfsize)
            {
                page = writer.GetImportedPage(r, i);
                writer.AddPage(page);
            }
            bs.Close();
        }
        //close everything
        document.Close();
        writer.Close();
        raf.Close();
        r.Close();
    }

    private void FunPriDownloadFile(string OutputFile)
    {
        string strnewFile = OutputFile;
        MyIframeOpenFile.Visible = true;
        //string strScipt = "window.open('../Common/S3GViewFileCheckList.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        MyIframeOpenFile.Src = "~/Common/S3GViewFileCheckList.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "CheckList", strScipt, true);
    }
    private string FunPubDeleteTable(string strtblName, string strHTML)
    {
        try
        {
            string newtr = String.Empty;
            var startTag = "";
            var endTag = "";
            int startIndex = 0;
            int endIndex = 0;
            string strTable;

            startTag = strtblName;
            endTag = "</table>";
            startIndex = strHTML.LastIndexOf("<table", strHTML.IndexOf(startTag) + startTag.Length);
            endIndex = strHTML.IndexOf(endTag, startIndex) + endTag.Length;
            strTable = strHTML.Substring(startIndex, endIndex - startIndex);

            strHTML = strHTML.Replace(strTable, "");
            return strHTML;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }
    //public override void VerifyRenderingInServerForm(Control control)
    //{
    //    //base.VerifyRenderingInServerForm(control);
    //    //control.Focus();

    //}
    protected void SaveDocument(string strHTML, string ReferenceNumber, string FilePath, string FileName, string strEntityId, string strNooUnits, string strEntityType, int intPricingId)
    {
        try
        {
            Dictionary<string, string> dictParam;
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@COMPANY_ID", intCompany_Id.ToString());
            dictParam.Add("@pricing_id", intPricingId.ToString());
            dictParam.Add("@User_ID", intUserId.ToString());
            dictParam.Add("@EntityId", strEntityId);
            dictParam.Add("@NooUnits", strNooUnits);
            dictParam.Add("@mode", "M");
            dictParam.Add("@Lob_Code", hdnLobCode.Value);
            dictParam.Add("@EntityType", strEntityType);

            DataSet dsHeader = new DataSet();
            dsHeader = Utility.GetDataset("S3G_OR_GET_PRICGDET_PRINT", dictParam);




            if (dsHeader.Tables[3].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[3].Rows.Count;
                if (strHTML.Contains("~tbdocuments~"))
                    strHTML = FunPubBindTable("~tbdocuments~", strHTML, dsHeader.Tables[3]);
                ViewState["DocumentCuount"] = 1;
            }
            else
            {
                //Utility.FunShowAlertMsg(this, "CheckList Documents Detail Not Exists");
                ViewState["DocumentCuount"] = 0;
                return;

            }

            if (dsHeader.Tables[2].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[2].Rows.Count;
                if (strHTML.Contains("~tbAsset~"))
                    strHTML = FunPubBindTable("~tbAsset~", strHTML, dsHeader.Tables[2]);
            }
            else
            {
                if (hdnLobCode.Value.ToString().ToUpper() == "FT" || hdnLobCode.Value.ToString().ToUpper() == "TL" || hdnLobCode.Value.ToString().ToUpper() == "WC")
                {

                }
                else
                {
                    strHTML = FunPubDeleteTable("~tbAsset~", strHTML);
                }
            }

            if (dsHeader.Tables[4].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[4].Rows.Count;
                if (strHTML.Contains("~pdc~"))
                    strHTML = FunPubBindTable("~pdc~", strHTML, dsHeader.Tables[4]);
            }
            else
            {
                strHTML = FunPubDeleteTable("~pdc~", strHTML);
            }


            if (dsHeader.Tables[0].Rows.Count > 0)
                strHTML = PDFPageSetup.FunPubBindCommonVariables(strHTML, dsHeader.Tables[0]);

            List<string> listImageName = new List<string>();
            listImageName.Add("~CompanyLogo~");
            //listImageName.Add("~InvoiceSignStamp~");
            //listImageName.Add("~POSignStamp~");
            List<string> listImagePath = new List<string>();
            listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/CompanyLogo.png"));
            //listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/InvoiceSignStamp.png"));
            //listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/POSignStamp.png"));

            strHTML = PDFPageSetup.FunPubBindImages(listImageName, listImagePath, strHTML.TrimEnd());
            PDFPageSetup.FunPubSaveDocument(strHTML.Trim(), FilePath, FileName, "P", 1, ObjS3GSession.ProDateFormatRW);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;

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

    private string FunPubGetTemplateContent(int CompanyID, string LobID, string LocationID, string intSubLocationId, int TemplateTypeCode, string Reference_ID)
    {
        try
        {
            DataTable dt = new DataTable();
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", CompanyID.ToString());
            Procparam.Add("@LOB_ID", LobID.ToString());
            Procparam.Add("@Template_Type_Code", TemplateTypeCode.ToString());
            Procparam.Add("@LANGUAGE", ddlLanguage.SelectedValue);
            Procparam.Add("@Reference_ID", Reference_ID);
            dt = Utility.GetDefaultData("S3G_GET_TEMPLATECONT_PRI", Procparam);
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
    protected void btnLoadCustomer_Click(object sender, EventArgs e)
    {
        try
        {
            string strCustomerAddress = string.Empty;
            StringBuilder strFormAddress = new StringBuilder();
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
            funPriClearCustomerHoverInfo();
            if (hdnCID != null && hdnCID.Value != "")
            {
                ucCustomerCodeLov.ShowHideAddressImageButton = true;
                hdnCustID.Value = hdnCID.Value;
                DataSet ds = new DataSet();
                Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
                objProcedureParameters.Add("@Option", "1");
                objProcedureParameters.Add("@COMPANY_ID", intCompany_Id.ToString());
                objProcedureParameters.Add("@CustomerId", hdnCID.Value);
                ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", objProcedureParameters);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                    {
                        strFormAddress.Append(Environment.NewLine);
                        strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + ds.Tables[0].Rows[0][i].ToString());

                    }
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                        {
                            strFormAddress.Replace(ds.Tables[1].Rows[i]["COLUMN_NAME"].ToString().ToUpper(), ds.Tables[1].Rows[i]["DISPLAY_TEXT"].ToString());
                        }
                    }
                    funPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucCustomerCodeLov);
                }
                if (ds.Tables[2].Rows.Count > 0)
                {
                    //txtCreditLimit.Text = ds.Tables[2].Rows[0]["MAX_LEND_AMOUNT"].ToString();
                    //txtConstitution.Text = ds.Tables[2].Rows[0]["Constitution"].ToString();
                    ViewState["ConsitutionId"] = ds.Tables[2].Rows[0]["CONSTITUTION_CODE"].ToString();
                    txtName.Text = txtCustomerNameLease.Text = ds.Tables[2].Rows[0]["customer_name"].ToString();
                    ucCustomerCodeLov.SelectedValue = hdnCID.Value;
                    ucCustomerCodeLov.ToolTip = ucCustomerCodeLov.SelectedText = ds.Tables[2].Rows[0]["customer_name"].ToString();

                }
                if (ds.Tables[3].Rows.Count > 0)
                {
                    //txtCreditLimit.Text = ds.Tables[2].Rows[0]["MAX_LEND_AMOUNT"].ToString();
                    //txtConstitution.Text = ds.Tables[2].Rows[0]["Constitution"].ToString();
                    ViewState["Occupation"] = ds.Tables[3].Rows[0]["Occupation"].ToString();
                    ViewState["CUSTOMER_TYPE_ID"] = ds.Tables[3].Rows[0]["CUSTOMER_TYPE_ID"].ToString();
                    ViewState["Max_Lend_Amount"] = ds.Tables[3].Rows[0]["Max_Lend_Amount"].ToString();
                    ViewState["Max_Lend_Limit_Exp"] = ds.Tables[3].Rows[0]["Max_Lend_Limit_Exp"].ToString();
                    ViewState["FAC_APPLICABLE"] = ds.Tables[3].Rows[0]["FAC_APPLICABLE"].ToString();
                    ViewState["FAC_LIMIT"] = ds.Tables[3].Rows[0]["FAC_LIMIT"].ToString();
                    ViewState["FACT_LIMIT_EXP_DATE"] = ds.Tables[3].Rows[0]["FACT_LIMIT_EXP_DATE"].ToString();

                    ViewState["NID_CR_RID_NUMBER"] = ds.Tables[3].Rows[0]["NID_CR_RID_NUMBER"].ToString();
                    ViewState["PASSPORT_NUMBER"] = ds.Tables[3].Rows[0]["PASSPORT_NUMBER"].ToString();
                    ViewState["NRID_NUMBER"] = ds.Tables[3].Rows[0]["NRID_NUMBER"].ToString();
                    ViewState["DATEOFBIRTH"] = ds.Tables[3].Rows[0]["DATEOFBIRTH"].ToString();
                    ViewState["CUSTOMER_NAME"] = ds.Tables[3].Rows[0]["CUSTOMER_NAME"].ToString();
                    ViewState["CUST_DATA_EXCEPTION"] = ds.Tables[3].Rows[0]["CUST_DATA_EXCEPTION"].ToString();


                }
                FunPriLoadAddressDetails(ds.Tables[4].Rows[0]["DATEOFBIRTH"].ToString(), ds.Tables[4].Rows[0]["NAME"].ToString());
            }
            Button btnLoadAccount = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            btnLoadAccount.Focus();
            //FunPriLoadPreDisbursementDocument();
            //ddlCustomerType.Focus();
            hdnIsLoad.Value = "1";
            if (intPricingId == 0)
            {
                //if (ViewState["Is_From_CopyProfile"] != null)
                //{
                //    if (ViewState["Is_From_CopyProfile"].ToString() == "1")
                //    {
                //        return;
                //    }
                //}

                funComplianceAge();
                if (ViewState["CUSTOMER_TYPE_ID"] != null)
                {
                    if (ViewState["CUSTOMER_TYPE_ID"].ToString() == "1")

                        if (!funPriChecCustomerAge())
                        {
                            TextBox txtName2 = (TextBox)ucCustomerCodeLov.FindControl("txtName");
                            HiddenField hdnCID2 = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                            txtName2.Text = string.Empty;
                            hdnCID2.Value = "0";
                            ucCustomerCodeLov.Clear();
                            funPriClearCustomerHoverInfo();
                            txtCustomerNameLease.Text = string.Empty;
                            ViewState["CUSTOMER_TYPE_ID"] = null;
                            ViewState["ConsitutionId"] = null;
                            ViewState["Occupation"] = null;
                            txtDateofBirth.Text = string.Empty;
                            ucCustomerCodeLov.ToolTip = string.Empty;

                        }
                    if (strMode != "Q")
                    {
                        if (FunPriValidateDeDuplCustomerDet(Convert.ToInt32(hdnCID.Value), ViewState["CUSTOMER_TYPE_ID"].ToString(), ViewState["NID_CR_RID_NUMBER"].ToString(), ViewState["PASSPORT_NUMBER"].ToString(), ViewState["NRID_NUMBER"].ToString(), "", ViewState["DATEOFBIRTH"].ToString(), ViewState["CUSTOMER_NAME"].ToString()))
                        {
                            TextBox txtName2 = (TextBox)ucCustomerCodeLov.FindControl("txtName");
                            HiddenField hdnCID2 = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                            txtName2.Text = string.Empty;
                            hdnCID2.Value = "0";
                            ucCustomerCodeLov.Clear();
                            funPriClearCustomerHoverInfo();
                            ViewState["CUSTOMER_TYPE_ID"] = null;
                            ViewState["ConsitutionId"] = null;
                            ViewState["Occupation"] = null;
                            ViewState["Date_of_Birth"] = null;
                            ucCustomerCodeLov.ToolTip = string.Empty;

                            return;
                        }
                    }

                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    private bool FunPriValidateDeDuplCustomerDet(int ICustomer_Id, string strCustomerType, string strIdenticolumn, string strPassportNumber, string strNID, string strLabourCardNumber, string strDOB, string strCustomerName)
    {
        bool blnIsDuplicate = false;
        string strAlertMessage = string.Empty;
        string strAlertThird = string.Empty;
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@OPTION", "1");
            Procparam.Add("@Mode", strMode);
            Procparam.Add("@COMPANYID", intCompany_Id.ToString());
            Procparam.Add("@PROGRAM_ID", "45");//Customer Master

            Procparam.Add("@CUSTOMER_ID", Convert.ToString(ICustomer_Id));
            if (strCustomerType.ToUpper() == "1")
            {
                Procparam.Add("@NID_RID_CRID_NUMBER", strIdenticolumn);
            }
            else
            {
                Procparam.Add("@CR_NUMBER", strIdenticolumn);
            }
            if (strPassportNumber != string.Empty)
            {
                Procparam.Add("@PASSPORT_NUMBER", strPassportNumber.Trim());
            }
            if (strNID.Trim() != string.Empty)
            {
                Procparam.Add("@NRID", strNID.Trim());
            }
            if (strLabourCardNumber.Trim() != string.Empty)
            {
                Procparam.Add("@LABOURCARD_NUMBER", strLabourCardNumber.Trim());
            }
            if (strDOB.Trim() != string.Empty)
            {
                Procparam.Add("@DATE_OF_BIRTH", strDOB);
            }

            if (strCustomerName.Trim() != string.Empty)
            {
                Procparam.Add("@CUSTOMER_NAME", strCustomerName.Trim());
            }
            Procparam.Add("@CUSTOMER_TYPE", strCustomerType);
            DataTable dtdedupCheck = Utility.GetDefaultData("S3G_OR_GET_DEDUP_CHECK", Procparam);
            if (Convert.ToInt32(dtdedupCheck.Rows[0]["IS_DUPE"]) > 0)
            {
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["NID"]) == 1)
                {
                    strAlertMessage = "NID" + " has been duplicated"; //N.ID./R.ID Number                   
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["NRID"]) == 1)
                {

                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = "\\n" + "NRID has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "NRID has been duplicated";
                    }
                    //return true;
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PASSPORT"]) == 1)
                {

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
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CUSTOMER_NAME"]) == 1)
                {

                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Customer Name has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Customer Name has been duplicated";
                    }
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["DOB"]) == 1)
                {
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Date of Birth has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Date of Birth has been duplicated";
                    }
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CRNO"]) == 1)
                {
                    if (!(strCustomerType.Trim().ToUpper() == "1"))
                    {

                        if (strAlertMessage.Trim() != string.Empty)
                        {
                            strAlertMessage = strAlertMessage + "\\n" + "CR Number has been duplicated";
                        }
                        else
                        {
                            strAlertMessage = "CR Number has been duplicated";
                        }
                    }
                }
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["LABOURCARD"]) == 1)
                {
                    if (strAlertMessage.Trim() != string.Empty)
                    {
                        strAlertMessage = strAlertMessage + "\\n" + "Labour Card Number has been duplicated";
                    }
                    else
                    {
                        strAlertMessage = "Labour Card Number has been duplicated";
                    }
                }





                // Customer Name Check Against HOT/PEP/Terroist
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CUSTOMER_NAME"]) == 1)
                {
                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0)
                    {
                        //Utility.FunShowAlertMsg(this, "Customer Name has been duplicated");
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Marked in Hot List";
                        }
                        else
                        {
                            strAlertThird = "Customer Marked in Hot List";
                        }
                    }

                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0)
                    {

                        //Utility.FunShowAlertMsg(this, "Customer Name has been duplicated");
                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Marked in Pep List";
                        }
                        else
                        {
                            strAlertThird = "Customer Marked in Pep List";
                        }
                    }
                    if (Convert.ToInt32(dtdedupCheck.Rows[0]["TER_LIST"]) > 0)
                    {

                        if (strAlertThird.Trim() != string.Empty)
                        {
                            strAlertThird = strAlertThird + "\\n" + "Customer Marked in Terrorist List";
                        }
                        else
                        {
                            strAlertThird = "Customer Marked in Terrorist List";
                        }
                    }
                    //return true;
                }

                // NID/RID/CR Number Check in PEP/Terrorist List    
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_NI_LIST"]) > 0)
                {

                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + " Customer Marked in Hot List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = " Customer Marked in Hot List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_NI_LIST"]) > 0)
                {

                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + "Customer Marked in Pep List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = " Customer Marked in Pep List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["TER_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["TER_NI_LIST"]) > 0)
                {

                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + " Customer Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = " Customer Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                }

                // Check Passport Number in HOT/PEP/Terriost List                             
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["HOT_PS_LIST"]) > 0)
                {

                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + " Customer Marked in Pep List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = " Customer Marked in Pep List"; //N.ID./R.ID Number   
                    }
                }

                if (Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_LIST"]) > 0 && Convert.ToInt32(dtdedupCheck.Rows[0]["PEP_PS_LIST"]) > 0)
                {

                    if (strAlertThird.Trim() != string.Empty)
                    {
                        strAlertThird = strAlertThird + "\\n" + " Customer Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                    else
                    {
                        strAlertThird = "Customer Marked in Terrorist List"; //N.ID./R.ID Number   
                    }
                }




                if (strAlertThird.Trim() != string.Empty)
                {
                    Utility.FunShowAlertMsg(this, strAlertThird);
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
    private void funPriClearCustomerHoverInfo()
    {
        try
        {
            UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLov.FindControl("S3GCustomerAddress1");
            TextBox txtCustomerCode = (TextBox)CustomerDetails1.FindControl("txtCustomerCode");
            TextBox txtCustomerCode1 = (TextBox)CustomerDetails1.FindControl("txtCustomerCode1");
            TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");
            TextBox txtCustomerName1 = (TextBox)CustomerDetails1.FindControl("txtCustomerName1");
            TextBox txtMobile = (TextBox)CustomerDetails1.FindControl("txtMobile");
            TextBox txtMobile1 = (TextBox)CustomerDetails1.FindControl("txtMobile1");
            TextBox txtPhone = (TextBox)CustomerDetails1.FindControl("txtPhone");
            TextBox txtPhone1 = (TextBox)CustomerDetails1.FindControl("txtPhone1");
            TextBox txtEmail = (TextBox)CustomerDetails1.FindControl("txtEmail");
            TextBox txtEmail1 = (TextBox)CustomerDetails1.FindControl("txtEmail1");
            TextBox txtWebSite = (TextBox)CustomerDetails1.FindControl("txtWebSite");
            TextBox txtWebSite1 = (TextBox)CustomerDetails1.FindControl("txtWebSite1");
            TextBox txtCusAddress = (TextBox)CustomerDetails1.FindControl("txtCusAddress");
            TextBox txtCusAddress1 = (TextBox)CustomerDetails1.FindControl("txtCusAddress1");
            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            txtCustomerCode.Text = txtCustomerCode1.Text = txtCustomerName.Text
            = txtCustomerName1.Text = txtMobile.Text = txtMobile1.Text =
            txtPhone.Text = txtPhone1.Text = txtEmail.Text = txtEmail1.Text = txtWebSite.Text = txtWebSite1.Text
            = txtCusAddress.Text = txtCusAddress1.Text = string.Empty;


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }



    }

    private void funPriSetCustomerAddress(DataTable dtCustomer, StringBuilder strAddress, UserControl ucCustomerCodeLovDyn)
    {
        try
        {

            DataRow dtrCustomer;
            dtrCustomer = dtCustomer.Rows[0];
            UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLovDyn.FindControl("S3GCustomerAddress1");
            TextBox txtCustomerCode = (TextBox)CustomerDetails1.FindControl("txtCustomerCode");
            TextBox txtCustomerCode1 = (TextBox)CustomerDetails1.FindControl("txtCustomerCode1");
            TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");
            TextBox txtCustomerName1 = (TextBox)CustomerDetails1.FindControl("txtCustomerName1");
            TextBox txtMobile = (TextBox)CustomerDetails1.FindControl("txtMobile");
            TextBox txtMobile1 = (TextBox)CustomerDetails1.FindControl("txtMobile1");
            TextBox txtPhone = (TextBox)CustomerDetails1.FindControl("txtPhone");
            TextBox txtPhone1 = (TextBox)CustomerDetails1.FindControl("txtPhone1");
            TextBox txtEmail = (TextBox)CustomerDetails1.FindControl("txtEmail");
            TextBox txtEmail1 = (TextBox)CustomerDetails1.FindControl("txtEmail1");
            TextBox txtWebSite = (TextBox)CustomerDetails1.FindControl("txtWebSite");
            TextBox txtWebSite1 = (TextBox)CustomerDetails1.FindControl("txtWebSite1");
            TextBox txtCusAddress = (TextBox)CustomerDetails1.FindControl("txtCusAddress");
            TextBox txtCusAddress1 = (TextBox)CustomerDetails1.FindControl("txtCusAddress1");

            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");

            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");

            txtAccItemNumber.Text = hdnCID.Value;
            TxtAccNumber.Text = hdnCID.Value;


            if (dtrCustomer != null)
            {
                if (dtrCustomer.Table.Columns["Customer_Code"] != null)
                    txtCustomerNameLease.Text = txtCustomerCode1.Text = txtCustomerCode.Text = dtrCustomer["Customer_Code"].ToString();
                if (dtrCustomer.Table.Columns["Title"] != null)
                    TxtAccNumber.Text = txtAccItemNumber.Text = txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Title"].ToString() + " " + dtrCustomer["Customer_Name"].ToString();
                else
                    TxtAccNumber.Text = txtAccItemNumber.Text = txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Customer_Name"].ToString();
                if (dtrCustomer.Table.Columns["MOB_PHONE_NO"] != null) txtMobile.Text = txtMobile1.Text = dtrCustomer["MOB_PHONE_NO"].ToString();
                if (dtrCustomer.Table.Columns.Contains("OFF_PHONE_NO"))
                {
                    txtPhone.Text = txtPhone1.Text = dtrCustomer["OFF_PHONE_NO"].ToString();
                }
                if (dtrCustomer.Table.Columns["CUST_EMAIL"] != null) txtEmail.Text = txtEmail1.Text = dtrCustomer["CUST_EMAIL"].ToString();
                if (dtrCustomer.Table.Columns["Comm_WebSite"] != null) txtWebSite.Text = txtWebSite1.Text = dtrCustomer["Comm_WebSite"].ToString();
                txtCusAddress.Text = txtCusAddress1.Text = strAddress.ToString();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void btnCreateApplicant_Click(object sender, EventArgs e)
    {
        try
        {
            string strNewWin = string.Empty;
            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry=Yes& qsMode=C&NewCustomerID=0', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
            this.Focus();
            return;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void btnViewDocuments_Click(object sender, EventArgs e)
    {
        //if (btnViewDocuments.Text == "View Documents")
        //{
        //    FunPriLoadPreDisbursementDocument();
        //    //btnViewDocuments.Text = "Update Documents";
        //}
        //else
        //{
        //    funPriUpdateDocuments();
        //    //Utility.FunShowAlertMsg(this, "Documents Updated Successfully");
        //    Utility.FunShowValidationMsg(this, "ORG_PRI", 16);
        //}
        //hdnSetForceValues.Value = "0";





        FunPriLoadPreDisbursementDocument();
    }
    protected void lnkUpdateDocuments_Click(object sender, EventArgs e)
    {
        try
        {
            //int intRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", ((LinkButton)sender).ClientID);
            //ViewState["EditSno"] = intRowIndex;

            //if (hdnSetForceValues.Value == "0")
            //{
            //    Utility.FunShowAlertMsg(this, "Document Details not modified");
            //    {
            //        return;
            //    }
            //}

            ViewState["AssetAddDoc"] = "1";

            foreach (GridViewRow grv in gvPRDDT.Rows)
            {


                DropDownList ddlRequiredF = (DropDownList)grv.FindControl("ddlRequired");
                DropDownList ddlReceivedF = (DropDownList)grv.FindControl("ddlReceived");

                TextBox txtCollectedDateF = (TextBox)grv.FindControl("txtCollectedDate");
                //TextBox txtCADVerifiedDateF = (TextBox)grv.FindControl("txtCADVerifiedDate");
                //TextBox txtCADReceivedF = (TextBox)grv.FindControl("txtCADReceived");


                if (ddlRequiredF.SelectedValue == "1")
                {
                    //if (ddlReceivedF.SelectedValue == "0")
                    //{
                    //    iCheckDocument = 1;
                    //    Utility.FunShowAlertMsg(this, "Received Status Mandatory");
                    //    return;
                    //}
                }

                //if (txtCollectedDateF.Text == string.Empty || txtCADVerifiedDateF.Text == string.Empty || txtCADReceivedF.Text == string.Empty)
                //{
                //    Utility.FunShowAlertMsg(this, "Collected/CAD Verified/CAD Received Dates Mandatory for all Documents");
                //    return;
                //}

                //if (txtCollectedDateF.Text != string.Empty && txtCADVerifiedDateF.Text != string.Empty && txtCADReceivedF.Text != string.Empty)
                //{
                //    if (hdnReqAccess.Value == "1")
                //    {
                //        if (Utility.StringToDate(txtCollectedDateF.Text) < Utility.StringToDate(txtOfferDate.Text))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "Collected Date should be greater than or equal to Offer Date");
                //            return;
                //        }
                //    }

                //    if (hdnCADRECACCESS.Value == "1")
                //    {
                //        if (Utility.StringToDate(txtCADReceivedF.Text) < Utility.StringToDate(txtCollectedDateF.Text))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Received Date should be greater than or equal to Collected Date");
                //            return;
                //        }
                //    }
                //    if (hdnCADVERACCESS.Value == "1")
                //    {
                //        if (Utility.StringToDate(txtCADVerifiedDateF.Text) < Utility.StringToDate(txtCollectedDateF.Text))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Verified Date should be greater than or equal to Collected Date");
                //            return;
                //        }
                //    }
                //}

                //if (hdnReqAccess.Value == "1")
                //{

                //    if (txtCollectedDateF.Text != string.Empty)
                //    {
                //        if (Utility.StringToDate(txtCollectedDateF.Text) > Utility.StringToDate(ViewState["Effective_To"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "Colleted Date should be less than or equal to " + ViewState["Effective_To"].ToString());
                //            txtCollectedDateF.Text = string.Empty;
                //            return;
                //        }

                //        if (Utility.StringToDate(txtCollectedDateF.Text) < Utility.StringToDate(ViewState["IMPLEMENTATIONDATE"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "Colleted Date should be greater than or Equal to " + ViewState["Effective_To"].ToString());
                //            txtCollectedDateF.Text = string.Empty;
                //            return;
                //        }
                //    }
                //}

                //if (hdnCADRECACCESS.Value == "1")
                //{
                //    if (txtCADReceivedF.Text != string.Empty)
                //    {
                //        if (Utility.StringToDate(txtCADReceivedF.Text) > Utility.StringToDate(ViewState["Effective_To"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Received Date should be less than or equal to " + ViewState["Effective_To"].ToString());
                //            txtCADReceivedF.Text = string.Empty;
                //            return;
                //        }

                //        if (Utility.StringToDate(txtCADReceivedF.Text) < Utility.StringToDate(ViewState["IMPLEMENTATIONDATE"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Received should be greater than or Equal to " + ViewState["Effective_To"].ToString());
                //            txtCADReceivedF.Text = string.Empty;
                //            return;
                //        }
                //    }
                //}

                //if (hdnCADVERACCESS.Value == "1")
                //{
                //    if (txtCADVerifiedDateF.Text != string.Empty)
                //    {
                //        if (Utility.StringToDate(txtCADVerifiedDateF.Text) > Utility.StringToDate(ViewState["Effective_To"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Verified Date should be less than or equal to " + ViewState["Effective_To"].ToString());
                //            txtCADVerifiedDateF.Text = string.Empty;
                //            return;
                //        }

                //        if (Utility.StringToDate(txtCADVerifiedDateF.Text) < Utility.StringToDate(ViewState["IMPLEMENTATIONDATE"].ToString()))
                //        {
                //            iCheckDocument = 1;
                //            Utility.FunShowAlertMsg(this, "CAD Verified should be greater than or Equal to " + ViewState["Effective_To"].ToString());
                //            txtCADVerifiedDateF.Text = string.Empty;
                //            return;
                //        }
                //    }
                //}


            }

            funPriUpdateDocuments();
            //Utility.FunShowValidationMsg(this, "ORG_PRI", 16);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void ucAccountLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            //Button btnLoadAccount = (Button)ucAccountLov.FindControl("btnGetLOV");
            //btnLoadAccount.Focus();
            //FunPriClear();
            //DataSet ObjDTPayment = new DataSet();
            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Company_ID", intCompanyID.ToString());
            //Procparam.Add("@LOB_ID", Convert.ToString(ddllob.SelectedValue));
            //Procparam.Add("@Location_ID ", Convert.ToString(ddlBranch.SelectedValue));
            //Procparam.Add("@Acc_No", Convert.ToString(ucAccountLov.SelectedValue));
            ////ddlMLA.BindDataTable("LA_GET_MLA_Assignment", Procparam, new string[] { "PANum", "PANum" });

            //ObjDTPayment = Utility.GetDataset("LA_GET_MLA_Assignment", Procparam);
            //if (ObjDTPayment.Tables[0].Rows.Count > 0)
            //{
            //    hdnAccount_ID.Value = ObjDTPayment.Tables[0].Rows[0]["ID"].ToString();
            //    hdnPANum_Customer_ID.Value = ObjDTPayment.Tables[0].Rows[0]["customer_id"].ToString();
            //    hdnPasa_Detail_ID.Value = ObjDTPayment.Tables[0].Rows[0]["PASA_Detail_ID"].ToString();
            //    //txtAssignorName_Code.Text = ObjDTPayment.Tables[0].Rows[0]["customer_name"].ToString();
            //    //txtFinanceAmount.Text = ObjDTPayment.Tables[0].Rows[0]["finance_amount"].ToString();
            //    //txtInstallmentStartDate.Text = ObjDTPayment.Tables[0].Rows[0]["installmentdate"].ToString();
            //    //btnViewAccountDetails.Enabled = true;
            //}
            //if (ObjDTPayment.Tables[1].Rows.Count > 0)
            //{
            //    //pnlAssignorGuarantorDetails.Visible = true;
            //    ViewState["vs_Guarantor"] = ObjDTPayment.Tables[1];
            //    ViewState["vs_Guarantor1"] = ObjDTPayment.Tables[1];
            //    gvGuarantorsDetails.DataSource = ObjDTPayment.Tables[1];
            //    gvGuarantorsDetails.DataBind();
            //}
            //FunLoadEmptyGuarantorDetails();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw;
        }
    }

    protected void ucCustomerCodeLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {


            Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            btnLoadCust.Focus();
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            hdnCID.Value = ucCustomerCodeLov.SelectedValue;
            btnLoadCustomer_Click(null, null);
            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TxtAccNumber.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    [System.Web.Services.WebMethod]
    public static string[] GetCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@COMPANY_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));

        return suggetions.ToArray();

    }
    [System.Web.Services.WebMethod]
    public static string[] GetAccuntNoList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@COMPANY_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_Account_AGT", Procparam));

        return suggetions.ToArray();
    }

    //Start Customer Code Popup Start
    //protected void btnLoadCust_Click(object sender, EventArgs e)
    //{
    //    TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
    //    TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
    //    HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
    //    Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
    //    //txtAccItemNumber.Text = hdnCID.Value;
    //    TxtAccNumber.Text = txtAccItemNumber.Text;
    //    btnLoadCust.Focus();
    //}
    //End Account Code Popup Start

    protected void btnAddAsset_OnClick(object sender, EventArgs e)
    {
        try
        {
            //if (txtMarginAmountAsset.Text != string.Empty)
            //{
            //    if ((Convert.ToDecimal(txtMarginAmountAsset.Text) > Convert.ToDecimal(txtLpoAssetAmount.Text)))
            //    {
            //        Utility.FunShowAlertMsg(this, "Total Margin Amount should not exceed the LPO Asset Amount");
            //        txtLpoAssetAmount.Text = "0";
            //        return;
            //    }
            //}
            //if (txtMarginAmountAsset.Text == string.Empty)
            //{
            //    txtMarginAmountAsset.Text = "0.000";
            //}
            //if (Convert.ToDecimal(txtUnitValue.Text) != Convert.ToDecimal(txtLpoAssetAmount.Text) - (Convert.ToDecimal(txtMarginAmountAsset.Text)))
            //{
            //    Utility.FunShowAlertMsg(this,"Per Unti Value Should Match With Margin Amount+LPO Amount Per Unit");
            //    return;
            //}


            DataTable dtAssetCount;
            Dictionary<string, string> dictParm = new Dictionary<string, string>();
            dictParm.Add("@session_user_id", intUserId.ToString());
            dictParm.Add("@pricing_id", intPricingId.ToString());
            dtAssetCount = Utility.GetDefaultData("S3G_OR_LOAD_TMPASTDTLS_DPCK", dictParm);
            if (dtAssetCount.Rows.Count > 0)
            {
                if (btnAddNew.Text == "Add")
                {
                    if (dtAssetCount.Rows[0]["asset_count"].ToString() != string.Empty)
                    {
                        if (Convert.ToDecimal(dtAssetCount.Rows[0]["asset_count"].ToString()) + Convert.ToDecimal(txtUnitCount.Text) > 500)
                        {
                            Utility.FunShowAlertMsg(this, "Asset Line Item Count should not exceed the 500");
                            return;
                        }
                    }
                }
            }





            if (ddlAssetCodeList1.SelectedText == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Asset");
                return;
            }

            if (ddlPayTo.SelectedValue == "0")
            {
                if (ddlEntityNameList.SelectedText == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Select the Entity Name");
                    return;
                }
            }
            if (ddlPayTo.SelectedValue == "1")
            {
                if (txtCustomerName.Text == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Enter Customer Name");
                    return;
                }
            }


            if (txtLpoAssetAmount.Text != "0")
            {
                if (Convert.ToDecimal(txtLpoAssetAmount.Text) <= 0)
                {
                    Utility.FunShowAlertMsg(this, "LPO Asset Amount should be greater than the Zero");
                    txtLpoAssetAmount.Text = "0";
                    return;
                }
            }
            else
            {
                Utility.FunShowAlertMsg(this, "LPO Asset Amount Mandatory");
                txtLpoAssetAmount.Text = "0";
            }
            //if (!funPriValidateDownPaymentRecipt())
            //{
            //    return;
            //}

            if (btnAddNew.Text == "Edit")
            {

                btnModify_Click(null, null);
                txtUnitCount.Enabled = true;
                return;
            }
            else
            {
                //txtUnitCount.Enabled = true;
                funPriAddAssetGrid();
                return;
            }

        }
        catch (Exception ex)
        {
            //if (ex.Message.Contains("Column 'Asset_ID' is constrained to be unique"))
            //{
            //    Utility.FunShowAlertMsg(this, "Asset Code cannot be duplicated");
            //}
            //else
            //{
            //    ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            //    cvPricing.ErrorMessage = strErrorMessagePrefix + "Error in adding asset details";
            //    cvPricing.IsValid = false;
            //}
            //cv_TabAssetDetails.ErrorMessage = ex.Message;
            //cv_TabAssetDetails.IsValid = false;
        }

    }
    //private void funPriLoadAssetTable()
    //{
    //    Dictionary<string, string> strProParm = new Dictionary<string, string>();
    //    strProParm.Add("Company_Id", intCompany_Id.ToString());
    //    //ObjDTAssetDetail = Utility.GetDefaultData("S3G_OR_LOAD_TMPASTDTLS", strProParm);


    //}
    //private void funPriLoadTempDocuments()
    //{

    //}
    private void funPriInsertTempDocTable(string strAction)
    {
        try
        {

            if (strAction == "1")//AddGrid
            {
                ViewState["AssetAddDoc"] = 1;
                TextBox txtPRDDCTypeF = (TextBox)gvPRDDT.FooterRow.FindControl("txtPRDDCTypeF");
                DropDownList ddlRequiredF = (DropDownList)gvPRDDT.FooterRow.FindControl("ddlRequiredF");
                DropDownList ddlReceivedF = (DropDownList)gvPRDDT.FooterRow.FindControl("ddlReceivedF");
                DropDownList ddlPRDDCType = (DropDownList)gvPRDDT.FooterRow.FindControl("ddlPRDDCType");
                TextBox txtCollectedDateF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCollectedDateF");
                TextBox txtCADVerifiedDateF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCADVerifiedDateF");
                TextBox txtCADReceivedF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCADReceivedF");
                TextBox txtCADReceiverRemarksF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCADReceiverRemarksF");
                DropDownList ddlScannedByF = (DropDownList)gvPRDDT.FooterRow.FindControl("ddlScannedByF");
                TextBox txtScannedDateF = (TextBox)gvPRDDT.FooterRow.FindControl("txtScannedDateF");
                TextBox txtScanF = (TextBox)gvPRDDT.FooterRow.FindControl("txtScanF");
                TextBox txtRemarksMOF = (TextBox)gvPRDDT.FooterRow.FindControl("txtRemarksMOF");
                TextBox txtCADVerifierRemarksF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCADVerifierRemarksF");
                TextBox txtCADValueF = (TextBox)gvPRDDT.FooterRow.FindControl("txtCADValueF");
                CheckBox CbxCheckF = (CheckBox)gvPRDDT.FooterRow.FindControl("CbxCheckF");
                CheckBox CbxIsscannedF = (CheckBox)gvPRDDT.FooterRow.FindControl("CbxIsscannedF");
                Label lblPathF = (Label)gvPRDDT.FooterRow.FindControl("lblPathF");
                TextBox ddlCollectedByF = (TextBox)gvPRDDT.FooterRow.FindControl("ddlCollectedByF") as TextBox;
                TextBox ddlCADReceivedByF = (TextBox)gvPRDDT.FooterRow.FindControl("ddlCADReceivedByF") as TextBox;
                TextBox ddlCADVerifiedByF = (TextBox)gvPRDDT.FooterRow.FindControl("ddlCADVerifiedByF") as TextBox;
                DropDownList ddlPriority = (DropDownList)gvPRDDT.FooterRow.FindControl("ddlPriority");
                Label lblActualPath = (Label)gvPRDDT.FooterRow.FindControl("lblActualPath");


                if (ddlRequiredF.SelectedValue == "1")
                {
                }
                if (ddlRequiredF.SelectedValue == "2")
                {
                }
                Dictionary<string, string> dicProParm = new Dictionary<string, string>();
                dicProParm.Add("@OPTION", "1");
                dicProParm.Add("@PRICING_ASSET_ID", "1");
                dicProParm.Add("@PRDDD_DESC", txtPRDDCTypeF.Text.Trim());
                dicProParm.Add("@USER_ID", obj_PageValue.UserId.ToString());
                dicProParm.Add("@PRICING_ID", intPricingId.ToString());
                dicProParm.Add("@COMPANYID", intCompany_Id.ToString());



                DataTable dt2 = Utility.GetDefaultData("S3G_OR_LOAD_TMPPRIDOCDT_CHKDUP", dicProParm);
                if (dt2.Rows.Count > 0)
                {
                    iCheckDocument = 1;
                    Utility.FunShowAlertMsg(this, "Particulars or Additional Document Description Exists");
                    return;
                }
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());

                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                strProParmDoc.Add("@PRDDC_Doc_Cat_ID", "99");
                strProParmDoc.Add("@PRDDC_Doc_Type", "99");
                strProParmDoc.Add("@PRDDC_Doc_Description", txtPRDDCTypeF.Text.Trim());
                strProParmDoc.Add("@IS_Received", ddlReceivedF.SelectedValue);
                strProParmDoc.Add("@Collected_By_Id", ObjUserInfo.ProUserIdRW.ToString());
                strProParmDoc.Add("@CollectedBy", ObjUserInfo.ProUserNameRW.ToString());
                strProParmDoc.Add("@Remarks_MO", txtRemarksMOF.Text);
                strProParmDoc.Add("@txtCADValue", txtCADValueF.Text);
                strProParmDoc.Add("@Doc_Required", ddlRequiredF.SelectedValue);
                strProParmDoc.Add("@Doc_Received", ddlReceivedF.SelectedValue);
                strProParmDoc.Add("@Is_Addtional", "1");
                strProParmDoc.Add("@Priority", ddlPriority.SelectedValue);
                strProParmDoc.Add("@REMARKS_FileName", lblPathF.Text);
                strProParmDoc.Add("@REMARKS_Scanned_Ref_No", lblActualPath.Text);
                strProParmDoc.Add("@Col_Date", Utility.StringToDate(txtCollectedDateF.Text).ToString());
                funPriBindDocGridViewPaging();
            }
            if (strAction == "9")//Insert Dealer Base Documents Start
            {
                Dictionary<string, string> strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", "10");
                strProParmDoc.Add("@entity_id", ddlDealerDoc.SelectedValue);
                strProParmDoc.Add("@USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                Utility.GetDefaultData("S3G_OR_LOAD_TMPPRIDOCDT_UP_DLR", strProParmDoc);
                strProParmDoc.Clear();

                foreach (GridViewRow grv in grvPRDDCDealer.Rows)
                {

                    Label lblSno = (Label)grv.FindControl("lblSno");
                    Label lblTDocType = (Label)grv.FindControl("lblTDocType");
                    TextBox txtPRDDCTypeF = (TextBox)grv.FindControl("txtPRDDCType");
                    DropDownList ddlRequiredF = (DropDownList)grv.FindControl("ddlRequired");
                    DropDownList ddlReceivedF = (DropDownList)grv.FindControl("ddlReceived");
                    DropDownList ddlPRDDCType = (DropDownList)grv.FindControl("ddlPRDDCType");
                    TextBox txtCollectedDateF = (TextBox)grv.FindControl("txtCollectedDate");
                    //TextBox txtCADVerifiedDateF = (TextBox)grv.FindControl("txtCADVerifiedDate");
                    //TextBox txtCADReceivedF = (TextBox)grv.FindControl("txtCADReceived");
                    //TextBox txtCADReceiverRemarksF = (TextBox)grv.FindControl("txtCADReceiverRemarks");
                    //TextBox txtScanF = (TextBox)grv.FindControl("txtScan");
                    TextBox txtRemarksMOF = (TextBox)grv.FindControl("txtRemarks");
                    //TextBox txtCADVerifierRemarksF = (TextBox)grv.FindControl("txtCADVerifierRemarks");
                    //TextBox txtCADValueF = (TextBox)grv.FindControl("txtCADValue");
                    //Label lblPathF = (Label)grv.FindControl("lblPathDealer");
                    //Label lblActualPathIDealer = (Label)grv.FindControl("lblActualPathIDealer");
                    TextBox ddlCollectedByF = (TextBox)grv.FindControl("ddlCollectedBy") as TextBox;
                    //TextBox ddlCADReceivedByF = (TextBox)grv.FindControl("ddlCADReceivedBy") as TextBox;
                    //TextBox ddlCADVerifiedByF = (TextBox)grv.FindControl("ddlCADVerifiedBy") as TextBox;

                    Label lblPRICINGDOCID = (Label)grv.FindControl("lblPRICINGDOCID");
                    HiddenField lblCollectedBy = (HiddenField)grv.FindControl("lblCollectedBy");
                    //HiddenField lblCADVerifiedById = (HiddenField)grv.FindControl("lblCADVerifiedById");
                    //HiddenField lblCADReceivedById = (HiddenField)grv.FindControl("lblCADReceivedById");

                    Label lblDocDesc = (Label)grv.FindControl("lblDesc");
                    Label lblPRIORITYTYPE = (Label)grv.FindControl("lblPRIORITYTYPE");
                    CheckBox ChkCadI = (CheckBox)grv.FindControl("ChkCadI") as CheckBox;


                    strProParmDoc = new Dictionary<string, string>();
                    strProParmDoc.Add("@OPTION", strAction);


                    if (ChkCadI.Checked)
                    {
                        strProParmDoc.Add("@Scanned_By_Id", "1");
                        strProParmDoc.Add("@CADVerifiedById", ObjUserInfo.ProUserIdRW.ToString());
                    }
                    else
                    {
                        strProParmDoc.Add("@Scanned_By_Id", "0");
                    }

                    strProParmDoc.Add("@PRICING_ASSET_ID", lblPRICINGDOCID.Text);
                    strProParmDoc.Add("@PAGE_SNO", lblSno.Text);
                    strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                    strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                    strProParmDoc.Add("@USER_ID", intUserId.ToString());
                    strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                    strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                    strProParmDoc.Add("@PRDDC_Doc_Cat_ID", lblTDocType.Text);
                    strProParmDoc.Add("@PRDDC_Doc_Type", "99");
                    strProParmDoc.Add("@IS_Received", ddlRequiredF.SelectedValue);
                    strProParmDoc.Add("@Collected_By_Id", lblCollectedBy.Value);
                    strProParmDoc.Add("@CollectedBy", ddlCollectedByF.Text);
                    //strProParmDoc.Add("@CADVerifiedById", lblCADVerifiedById.Value);
                    //strProParmDoc.Add("@CADVerifiedBy", ddlCADVerifiedByF.Text);
                    //strProParmDoc.Add("@CADReceivedById", lblCADReceivedById.Value);
                    //strProParmDoc.Add("@CADReceivedBy", ddlCADReceivedByF.Text);
                    if (txtCollectedDateF.Text != string.Empty)
                        strProParmDoc.Add("@Col_Date", Utility.StringToDate(txtCollectedDateF.Text).ToString());
                    //if (txtCADVerifiedDateF.Text != string.Empty)
                    //    strProParmDoc.Add("@Ver_Date", Utility.StringToDate(txtCADVerifiedDateF.Text).ToString());
                    //if (txtCADReceivedF.Text != string.Empty)
                    //    strProParmDoc.Add("@Rec_Date", Utility.StringToDate(txtCADReceivedF.Text).ToString());
                    //strProParmDoc.Add("@CADReceiverRemarks", txtCADReceiverRemarksF.Text);
                    //strProParmDoc.Add("@CADVerifierRemarks", txtCADVerifierRemarksF.Text);
                    strProParmDoc.Add("@Remarks_MO", txtRemarksMOF.Text);
                    //strProParmDoc.Add("@REMARKS_FileName", lblPathF.Text);//File Name 
                    //strProParmDoc.Add("@REMARKS_Scanned_Ref_No", lblActualPathIDealer.Text);//File Path
                    //strProParmDoc.Add("@txtCADValue", txtCADValueF.Text);
                    strProParmDoc.Add("@Doc_Required", ddlRequiredF.SelectedValue);
                    strProParmDoc.Add("@Doc_Received", ddlReceivedF.SelectedValue);
                    strProParmDoc.Add("@Is_Addtional", "0");
                    strProParmDoc.Add("@doc_clasiffication", "2");
                    strProParmDoc.Add("@entity_id", ddlDealerDoc.SelectedValue);
                    strProParmDoc.Add("@PRDDC_Doc_Description", lblDocDesc.Text.Trim());
                    strProParmDoc.Add("@PRIORITY_TYPE", lblPRIORITYTYPE.Text.Trim());


                    Utility.GetDefaultData("S3G_OR_LOAD_TMPPRIDOCDT_UP_DLR", strProParmDoc);

                }
                if (strProParmDoc.ContainsKey("@USER_ID"))
                {
                    strProParmDoc.Remove("@USER_ID");
                }
                hdnSetForceValuesDealer.Value = "0";
                funPriBindDocGridViewPagingDealer("12");
            }//Insert Dealer Base Documents End

            if (strAction == "4")//ModifyModeRead
            {
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                strProParmDoc.Add("@DOC_CLASIFFICATION", "1");
                funPriBindDocGridViewPaging();
            }
            if (strAction == "8")//ModifyModeRead DealerDocuments
            {
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", "");
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                strProParmDoc.Add("@DOC_CLASIFFICATION", "2");
                funPriBindDocGridViewPagingDealer("");
            }
            if (strAction == "5")//ModifyModeRead CopyProfile
            {
                int intPricingIdCopyProfile = 0;
                if (ViewState["intPricingIdCopyPrifile"] != null)
                {
                    intPricingIdCopyProfile = Convert.ToInt32(ViewState["intPricingIdCopyPrifile"].ToString());
                }
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", intPricingIdCopyProfile.ToString());
                funPriBindDocGridViewPaging();
            }

            if (strAction == "2")//Edit Grid
            {
                foreach (GridViewRow grv in gvPRDDT.Rows)
                {

                    Label lblSno = (Label)grv.FindControl("lblSno");
                    Label lblTDocType = (Label)grv.FindControl("lblTDocType");
                    //TextBox txtPRDDCTypeF = (TextBox)grv.FindControl("txtPRDDCType");
                    DropDownList ddlRequiredF = (DropDownList)grv.FindControl("ddlRequired");
                    DropDownList ddlReceivedF = (DropDownList)grv.FindControl("ddlReceived");
                    DropDownList ddlPRDDCType = (DropDownList)grv.FindControl("ddlPRDDCType");
                    TextBox txtCollectedDateF = (TextBox)grv.FindControl("txtCollectedDate");
                    //TextBox txtCADVerifiedDateF = (TextBox)grv.FindControl("txtCADVerifiedDate");
                    //TextBox txtCADReceivedF = (TextBox)grv.FindControl("txtCADReceived");
                    //TextBox txtCADReceiverRemarksF = (TextBox)grv.FindControl("txtCADReceiverRemarks");




                    //TextBox txtScanF = (TextBox)grv.FindControl("txtScan");
                    TextBox txtRemarksMOF = (TextBox)grv.FindControl("txtRemarks");
                    //TextBox txtCADVerifierRemarksF = (TextBox)grv.FindControl("txtCADVerifierRemarks");
                    //TextBox txtCADValueF = (TextBox)grv.FindControl("txtCADValue");
                    //Label lblPathF = (Label)grv.FindControl("lblPath");
                    //Label lblActualPathI = (Label)grv.FindControl("lblActualPathI");
                    TextBox ddlCollectedByF = (TextBox)grv.FindControl("ddlCollectedBy") as TextBox;
                    //TextBox ddlCADReceivedByF = (TextBox)grv.FindControl("ddlCADReceivedBy") as TextBox;
                    //TextBox ddlCADVerifiedByF = (TextBox)grv.FindControl("ddlCADVerifiedBy") as TextBox;

                    Label lblPRICINGDOCID = (Label)grv.FindControl("lblPRICINGDOCID");

                    HiddenField lblCollectedBy = (HiddenField)grv.FindControl("lblCollectedBy");
                    //HiddenField lblCADVerifiedById = (HiddenField)grv.FindControl("lblCADVerifiedById");
                    //HiddenField lblCADReceivedById = (HiddenField)grv.FindControl("lblCADReceivedById");

                    CheckBox ChkCadI = (CheckBox)grv.FindControl("ChkCadI") as CheckBox;



                    strProParmDoc = new Dictionary<string, string>();
                    strProParmDoc.Add("@OPTION", strAction);
                    if (ChkCadI.Checked)
                    {
                        strProParmDoc.Add("@IS_SCANNED", "1");//CAD Verified CheckBox
                        strProParmDoc.Add("@CADVerifiedById", ObjUserInfo.ProUserIdRW.ToString());
                    }
                    else
                        strProParmDoc.Add("@IS_SCANNED", "0");//CAD Verified CheckBox

                    strProParmDoc.Add("@PRICING_ASSET_ID", lblPRICINGDOCID.Text);
                    strProParmDoc.Add("@PAGE_SNO", lblSno.Text);
                    strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                    strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                    strProParmDoc.Add("@USER_ID", intUserId.ToString());
                    strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                    strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                    strProParmDoc.Add("@PRDDC_Doc_Cat_ID", lblTDocType.Text);
                    strProParmDoc.Add("@PRDDC_Doc_Type", "99");

                    strProParmDoc.Add("@IS_Received", ddlRequiredF.SelectedValue);

                    strProParmDoc.Add("@Collected_By_Id", lblCollectedBy.Value);
                    strProParmDoc.Add("@CollectedBy", ddlCollectedByF.Text);
                    //strProParmDoc.Add("@CADVerifiedById", lblCADVerifiedById.Value);
                    //strProParmDoc.Add("@CADVerifiedBy", ddlCADVerifiedByF.Text);
                    //strProParmDoc.Add("@CADReceivedById", lblCADReceivedById.Value);
                    //strProParmDoc.Add("@CADReceivedBy", ddlCADReceivedByF.Text);

                    if (txtCollectedDateF.Text != string.Empty)
                        strProParmDoc.Add("@Col_Date", Utility.StringToDate(txtCollectedDateF.Text).ToString());
                    //if (txtCADVerifiedDateF.Text != string.Empty)
                    //    strProParmDoc.Add("@Ver_Date", Utility.StringToDate(txtCADVerifiedDateF.Text).ToString());
                    //if (txtCADReceivedF.Text != string.Empty)
                    //    strProParmDoc.Add("@Rec_Date", Utility.StringToDate(txtCADReceivedF.Text).ToString());


                    //strProParmDoc.Add("@CADReceiverRemarks", txtCADReceiverRemarksF.Text);
                    //strProParmDoc.Add("@CADVerifierRemarks", txtCADVerifierRemarksF.Text);
                    strProParmDoc.Add("@Remarks_MO", txtRemarksMOF.Text);
                    //strProParmDoc.Add("@REMARKS_FileName", lblPathF.Text);//File Name 
                    //strProParmDoc.Add("@REMARKS_Scanned_Ref_No", lblActualPathI.Text);//File Path



                    //strProParmDoc.Add("@txtCADValue", txtCADValueF.Text);
                    strProParmDoc.Add("@Doc_Required", ddlRequiredF.SelectedValue);
                    strProParmDoc.Add("@Doc_Received", ddlReceivedF.SelectedValue);
                    strProParmDoc.Add("@Is_Addtional", "0");

                    Utility.GetDefaultData("S3G_OR_LOAD_TMPPRIDOCDT_UP", strProParmDoc);

                }
                if (strProParmDoc.ContainsKey("@USER_ID"))
                {
                    strProParmDoc.Remove("@USER_ID");
                }
                hdnSetForceValues.Value = "0";
                funPriBindDocGridViewPaging();
            }
            if (strAction == "6")//For DMS
            {
                int intPricingIdCopyProfile = 0;
                if (ViewState["intPricingIdCopyPrifile"] != null)
                {
                    intPricingIdCopyProfile = Convert.ToInt32(ViewState["intPricingIdCopyPrifile"].ToString());
                }
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", hdnPricing_ID.Value);
                funPriBindDocGridViewPaging();
            }
            if (strAction == "7")//Additional Document Deletion
            {
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                funPriBindDocGridViewPaging();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            //funPriSetModalErrorMessege(ex.ToString());
        }
    }
    private void funPriInsertTempAssetTable(string strAction)
    {
        try
        {
            if (strAction == "1")
            {


                int iUnitCount = Convert.ToInt32(txtUnitCount.Text);
                decimal decLPOAmount = 0;



                strProParmAsset.Add("@OPTION", strAction);
                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmAsset.Add("@ASSET_CODE", ddlAssetCodeList1.SelectedText.Split('-')[0].ToString());
                strProParmAsset.Add("@ASSET_DESC", ddlAssetCodeList1.SelectedText.Split('-')[1].ToString());
                strProParmAsset.Add("@ASSET_ID", ddlAssetCodeList1.SelectedValue);
                //strProParmAsset.Add("@ENTITY_ID", ddlEntityNameList.SelectedValue);

                //if (Convert.ToDecimal(txtUnitValue.Text) < (Convert.ToDecimal(txtMargintoDealer.Text) + Convert.ToDecimal(txtMargintoMFC.Text) + Convert.ToDecimal(txtTradeIn.Text)))
                //{
                //    Utility.FunShowAlertMsg(this,"Total Margin Amount Should not Exceed the Unit Value");
                //    return;
                //}


                if (txtMargintoMFC.Text == string.Empty)
                {
                    txtMargintoMFC.Text = "0";
                }



                //decLPOAmount = Convert.ToDecimal(txtUnitValue.Text) - (Convert.ToDecimal(txtMargintoDealer.Text) + Convert.ToDecimal(txtMargintoMFC.Text) + Convert.ToDecimal(txtTradeIn.Text));
                //if (decLPOAmount > 0)
                //    strProParmAsset.Add("@FINANCE_AMOUNT", decLPOAmount.ToString());
                //else
                //    strProParmAsset.Add("@FINANCE_AMOUNT", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMarginAmountAsset.Text))
                    strProParmAsset.Add("@MARGIN_AMOUNT", Convert.ToDecimal(txtMarginAmountAsset.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_AMOUNT", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMarginPercentage.Text))
                    strProParmAsset.Add("@MARGIN_PERCENTAGE", txtMarginPercentage.Text);
                else
                    strProParmAsset.Add("@MARGIN_PERCENTAGE", Funsetsuffix());


                if (!string.IsNullOrEmpty(txtMargintoMFC.Text))
                    strProParmAsset.Add("@MARGIN_TO_COMPANY", Convert.ToDecimal(txtMargintoMFC.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_TO_COMPANY", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMargintoDealer.Text))
                    strProParmAsset.Add("@MARGIN_TO_DEALER", Convert.ToDecimal(txtMargintoDealer.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_TO_DEALER", Funsetsuffix());

                strProParmAsset.Add("@NO_OF_UNITS", txtUnitCount.Text);


                if (ddlPayTo.SelectedValue == "0")
                {
                    strProParmAsset.Add("@PAY_NAME", ddlEntityNameList.SelectedText);
                    strProParmAsset.Add("@ENTITY_ID", ddlEntityNameList.SelectedValue);
                }
                else
                {
                    strProParmAsset.Add("@PAY_NAME", txtCustomerName.Text);
                    strProParmAsset.Add("@ENTITY_ID", ucCustomerCodeLov.SelectedValue);
                }
                strProParmAsset.Add("@PAY_TO", ddlPayTo.SelectedValue);

                strProParmAsset.Add("@PAY_TYPE", ddlPayTo.SelectedItem.Text);
                strProParmAsset.Add("@PRICING_ASSET_ID", "1");
                strProParmAsset.Add("@PRICING_ID", intPricingId.ToString());
                if (ViewState["RECEIPTID"] != null)
                    strProParmAsset.Add("@Receipt_Id", Convert.ToInt32(ViewState["RECEIPTID"]).ToString());
                strProParmAsset.Add("@Receipt_No", txtDownPaymentReceipt.Text);
                if (!string.IsNullOrEmpty(txtTradeIn.Text))
                    strProParmAsset.Add("@TRADE_IN", Convert.ToDecimal(txtTradeIn.Text).ToString());
                else
                    strProParmAsset.Add("@TRADE_IN", Funsetsuffix());
                if (!string.IsNullOrEmpty(txtUnitValue.Text))
                    strProParmAsset.Add("@UNIT_VALUE", Convert.ToDecimal(txtUnitValue.Text).ToString());

                strProParmAsset.Add("@ASSET_TYPE", ddlAssetType.SelectedValue);



                //strProParmAsset.Add("@TOTALRECORDS", "1");
                //DataTable ObjDTAssetDetail = Utility.GetDefaultData("S3G_OR_LOAD_TMPASTDTLS", strProParmAsset);
                //strProParmAsset.Remove("@TOTALRECORDS");
                //}
                funPriBindAssetGridViewPaging();
            }
            else if (strAction == "2")
            {
                ViewState["AssetDelete"] = 1;
                strProParmAsset = new Dictionary<string, string>();
                strProParmAsset.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());

                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PAGE_SNO", ViewState["EditSno"].ToString());

                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmAsset.Add("@ASSET_CODE", ddlAssetCodeList1.SelectedText.Split('-')[0].ToString());
                strProParmAsset.Add("@ASSET_DESC", ddlAssetCodeList1.SelectedText.Split('-')[1].ToString());
                strProParmAsset.Add("@ASSET_ID", ddlAssetCodeList1.SelectedValue);


                if (!string.IsNullOrEmpty(txtLpoAssetAmount.Text))
                    strProParmAsset.Add("@FINANCE_AMOUNT", Convert.ToDecimal(txtLpoAssetAmount.Text).ToString());
                else
                    strProParmAsset.Add("@FINANCE_AMOUNT", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMarginAmountAsset.Text))
                    strProParmAsset.Add("@MARGIN_AMOUNT", Convert.ToDecimal(txtMarginAmountAsset.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_AMOUNT", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMarginPercentage.Text))
                    strProParmAsset.Add("@MARGIN_PERCENTAGE", txtMarginPercentage.Text);
                else
                    strProParmAsset.Add("@MARGIN_PERCENTAGE", Funsetsuffix());


                if (!string.IsNullOrEmpty(txtMargintoMFC.Text))
                    strProParmAsset.Add("@MARGIN_TO_COMPANY", Convert.ToDecimal(txtMargintoMFC.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_TO_COMPANY", Funsetsuffix());

                if (!string.IsNullOrEmpty(txtMargintoDealer.Text))
                    strProParmAsset.Add("@MARGIN_TO_DEALER", Convert.ToDecimal(txtMargintoDealer.Text).ToString());
                else
                    strProParmAsset.Add("@MARGIN_TO_DEALER", Funsetsuffix());

                strProParmAsset.Add("@NO_OF_UNITS", "1");

                if (ddlPayTo.SelectedValue == "0")
                {
                    strProParmAsset.Add("@PAY_NAME", ddlEntityNameList.SelectedText);
                    strProParmAsset.Add("@ENTITY_ID", ddlEntityNameList.SelectedValue);
                }
                else
                {
                    strProParmAsset.Add("@PAY_NAME", txtCustomerName.Text);
                    strProParmAsset.Add("@ENTITY_ID", ucCustomerCodeLov.SelectedValue);
                }
                strProParmAsset.Add("@PAY_TO", ddlPayTo.SelectedValue);


                strProParmAsset.Add("@PAY_TYPE", ddlPayTo.SelectedItem.Text);
                strProParmAsset.Add("@PRICING_ID", intPricingId.ToString());
                if (!string.IsNullOrEmpty(txtTradeIn.Text))
                    strProParmAsset.Add("@TRADE_IN", Convert.ToDecimal(txtTradeIn.Text).ToString());
                else
                    strProParmAsset.Add("@TRADE_IN", Funsetsuffix());
                if (!string.IsNullOrEmpty(txtUnitValue.Text))
                    strProParmAsset.Add("@UNIT_VALUE", Convert.ToDecimal(txtUnitValue.Text).ToString());
                strProParmAsset.Add("@ASSET_TYPE", ddlAssetType.SelectedValue);


                if (ViewState["RECEIPTID"] != null && ViewState["RECEIPTID"].ToString() != "")
                    strProParmAsset.Add("@Receipt_Id", Convert.ToInt32(ViewState["RECEIPTID"]).ToString());
                strProParmAsset.Add("@Receipt_No", txtDownPaymentReceipt.Text);

                //ObjDTAssetDetail = Utility.GetDefaultData("S3G_OR_LOAD_TMPASTDTLS", strProParm);
                funPriBindAssetGridViewPaging();



            }
            else if (strAction == "3")
            {
                ViewState["AssetDelete"] = 1;
                strProParmAsset = new Dictionary<string, string>();
                strProParmAsset.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PAGE_SNO", ViewState["EditSno"].ToString());
                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@PRICING_ID", intPricingId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                funPriBindAssetGridViewPaging();
            }
            else if (strAction == "4")//Modify Mode
            {

                strProParmAsset = new Dictionary<string, string>();
                strProParmAsset.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmAsset.Add("@PRICING_ID", intPricingId.ToString());
                funPriBindAssetGridViewPaging();
            }
            else if (strAction == "5")//Modify Mode CopyProfile
            {
                int intPricingIdCopyProfile = 0;
                if (ViewState["intPricingIdCopyPrifile"] != null)
                {
                    intPricingIdCopyProfile = Convert.ToInt32(ViewState["intPricingIdCopyPrifile"].ToString());
                }
                strProParmAsset = new Dictionary<string, string>();
                strProParmAsset.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmAsset.Add("@PRICING_ID", intPricingIdCopyProfile.ToString());
                funPriBindAssetGridViewPaging();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }


    }


    private void funPriRemoveDicKey(Dictionary<string, string> strPropArm, string strRemoveKey)
    {
        try
        {
            strPropArm.Remove(strRemoveKey);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriAddCommonPagingParm()
    {
        int intTotalRecords = 0;
        ObjPaging.ProCompany_ID = intCompany_Id;
        ObjPaging.ProUser_ID = intUserId;
        ObjPaging.ProTotalRecords = intTotalRecords;
        ObjPaging.ProCurrentPage = ProPageNumRW;
        ObjPaging.ProPageSize = ProPageSizeRW;
        ObjPaging.ProSearchValue = hdnSearch.Value;
        ObjPaging.ProOrderBy = hdnOrderBy.Value;
    }

    private void funPriBindAssetGridViewPaging()
    {
        try
        {

            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompany_Id;
            ObjPaging.ProUser_ID = intUserId;
            ObjPaging.ProTotalRecords = intTotalRecords;
            if (ViewState["AssetDelete"] != null)
            {
                if (ViewState["intPageNum"] != null)
                {
                    if (gvAssetDetails.Rows.Count == 1)
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNum"].ToString()) - 1;
                        ViewState["intPageNum"] = ProPageNumRW;
                    }
                    else
                    {
                        if (Convert.ToInt32(ViewState["intPageNum"].ToString()) == 0)
                        {
                            ObjPaging.ProCurrentPage = ProPageNumRW = 1;
                        }
                        else
                        {

                            ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNum"].ToString());
                        }
                    }
                }
                else
                    ObjPaging.ProCurrentPage = ProPageNumRW;
                if (ViewState["intPageSize"] != null)
                    ObjPaging.ProPageSize = Convert.ToInt32(ViewState["intPageSize"].ToString());
                else
                    ObjPaging.ProPageSize = ProPageSizeRW;

                ViewState["AssetDelete"] = null;
            }
            else
            {
                ObjPaging.ProCurrentPage = ProPageNumRW;
                ObjPaging.ProPageSize = ProPageSizeRW;
            }

            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;
            if (!strProParmAsset.ContainsKey("@PRICING_ID"))
            {
                strProParmAsset.Add("@PRICING_ID", intPricingId.ToString());
            }
            if (!strProParmAsset.ContainsKey("@SESSION_USER_ID"))
            {
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
            }


            bool bIsNewRow = false;
            if (hdnIsDMS.Value == "1") // for DMS
            {
                gvAssetDetails.BindGridView("S3G_OR_LOAD_TMPASTDTLSDMS", strProParmAsset, out intTotalRecords, ObjPaging, out bIsNewRow, false);
                foreach (GridViewRow grvRow in gvAssetDetails.Rows)
                {
                    LinkButton lblAssetNo = (LinkButton)grvRow.FindControl("lblAssetNo");
                    LinkButton LnkDelete = (LinkButton)grvRow.FindControl("LnkDelete");
                    lblAssetNo.OnClientClick = null;
                    lblAssetNo.Enabled = false;
                    LnkDelete.OnClientClick = null;
                    LnkDelete.Enabled = false;
                }
                //gvAssetDetails.FooterRow.Enabled = false;
            }
            else
            {
                gvAssetDetails.BindGridView("S3G_OR_LOAD_TMPASTDTLS", strProParmAsset, out intTotalRecords, ObjPaging, out bIsNewRow, false);
            }
            ucCustomPaging.Visible = true;
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);
            lblErrorMessage.Text = "";
            pnlAssetDtl.Visible = true;
            funPriSetTotalLpoValue();
            if (hdnISDMSModify.Value == "1")
            {
                foreach (GridViewRow grvRow in gvAssetDetails.Rows)
                {
                    LinkButton LnkDelete = (LinkButton)grvRow.FindControl("LnkDelete");
                    LnkDelete.Enabled = false;
                    LnkDelete.OnClientClick = null;
                    LnkDelete.CssClass = "grid_btn_delete_disabled";
                }
            }
            //if (hdnIsDMS.Value != "1")
            //{
            //    funPriControlAssetDelete();
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
        }
    }
    private void funPriBindDocGridViewPaging()
    {
        try
        {

            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompany_Id;
            ObjPaging.ProUser_ID = intUserId;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = 5;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;
            //if (hdnSetForceValues.Value == "1")
            //{
            //    Utility.FunShowAlertMsg(this, "Update the Documents in Documents Tab");
            //    return;
            //}

            if (ViewState["AssetDeleteDoc"] != null)
            {
                if (ViewState["intPageNumDoc"] != null)
                {
                    if (gvPRDDT.Rows.Count == 1)
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString()) - 1;
                        ViewState["intPageNumDoc"] = ProPageNumRW;
                    }
                    else
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString());
                    }
                }
                else
                    ObjPaging.ProCurrentPage = ProPageNumRW;
                if (ViewState["intPageSizeDoc"] != null)
                    ObjPaging.ProPageSize = Convert.ToInt32(ViewState["intPageSizeDoc"].ToString());
                else
                    ObjPaging.ProPageSize = ProPageSizeRW;

                ViewState["AssetDeleteDoc"] = null;
            }
            else
            {
                ObjPaging.ProCurrentPage = ProPageNumRW;
                ObjPaging.ProPageSize = ProPageSizeRW;
            }

            //


            if (ViewState["AssetAddDoc"] != null)
            {
                if (ViewState["intPageNumDoc"] != null)
                {
                    if (gvPRDDT.Rows.Count == 1)
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString()) - 1;
                        ViewState["intPageNumDoc"] = ProPageNumRW;
                    }
                    else
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString());
                    }
                }
                else
                {
                    ObjPaging.ProCurrentPage = ProPageNumRW;
                }
                if (ViewState["intPageSizeDoc"] != null)
                {
                    ObjPaging.ProPageSize = Convert.ToInt32(ViewState["intPageSizeDoc"].ToString());
                }
                else
                {
                    ObjPaging.ProPageSize = ProPageSizeRW;
                }

                ViewState["AssetAddDoc"] = null;
            }
            else
            {
                ObjPaging.ProCurrentPage = ProPageNumRW;
                ObjPaging.ProPageSize = ProPageSizeRW;
            }























            //if (!strProParmDoc.ContainsKey("@PRICING_ID"))
            //{
            //    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
            //}
            if (hdnIsDMS.Value != "1") // for DMS
            {
                if (!strProParmDoc.ContainsKey("@PRICING_ID"))
                {
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                }
            }
            //Start Afetr Interface Review Changes for DMS
            else
            {
                if (!strProParmDoc.ContainsKey("@PRICING_ID"))
                {
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                    //strProParmDoc.Add("@PRICING_ID", hdnPricing_ID.Value);
                }
            }
            //End Afetr Interface Review Changes for DMS
            if (strProParmDoc.ContainsKey("@TOTALRECORDS"))
            {
                strProParmDoc.Remove("@TOTALRECORDS");
            }
            bool bIsNewRow = false;


            if (strProParmDoc.ContainsKey("@DOC_CLASIFFICATION"))
            {
                strProParmDoc.Remove("@DOC_CLASIFFICATION");
            }

            strProParmDoc.Add("@DOC_CLASIFFICATION", "1");
            //Start Afetr Interface Review Changes for DMS Document not available in Staging Table
            //if (hdnIsDMS.Value == "1") // for DMS
            //{
            //    gvPRDDT.BindGridView("S3G_OR_LOAD_TMPPRIDOCDTDMS", strProParmDoc, out intTotalRecords, ObjPaging, out bIsNewRow, false);
            //    //gvPRDDT.Enabled = false;
            //    foreach (GridViewRow grvRow in gvPRDDT.Rows)
            //    {
            //        LinkButton lnkRemovePRDDC = (LinkButton)grvRow.FindControl("lnkRemovePRDDC");
            //        //LinkButton lnkUpdateDocuments = (LinkButton)grvRow.FindControl("lnkUpdateDocuments");
            //        FileUpload flUploadI = (FileUpload)grvRow.FindControl("flUploadI");
            //        Button btnBrowseI = (Button)grvRow.FindControl("btnBrowseI");
            //        Label lblActualPathI = (Label)grvRow.FindControl("lblActualPathI");
            //        TextBox txtFileupldI = (TextBox)grvRow.FindControl("txtFileupldI");
            //        TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");
            //        TextBox txtCADValue = (TextBox)grvRow.FindControl("txtCADValue");
            //        TextBox txtCollectedDate = (TextBox)grvRow.FindControl("txtCollectedDate");
            //        TextBox txtCADVerifiedDate = (TextBox)grvRow.FindControl("txtCADVerifiedDate");
            //        TextBox txtCADReceiverRemarks = (TextBox)grvRow.FindControl("txtCADReceiverRemarks");
            //        TextBox txtCADVerifierRemarks = (TextBox)grvRow.FindControl("txtCADVerifierRemarks");
            //        TextBox txtCADReceived = (TextBox)grvRow.FindControl("txtCADReceived");
            //        DropDownList ddlRequired = (DropDownList)grvRow.FindControl("ddlRequired");
            //        DropDownList ddlReceived = (DropDownList)grvRow.FindControl("ddlReceived");
            //        TextBox ddlCollectedBy = (TextBox)grvRow.FindControl("ddlCollectedBy");

            //        lnkRemovePRDDC.Enabled = false;
            //        //lnkUpdateDocuments.Enabled = false;
            //        //lnkUpdateDocuments.OnClientClick = null;
            //        btnBrowseI.Enabled = false;
            //        flUploadI.Enabled = false;
            //        txtFileupldI.Enabled = false;
            //        lblActualPathI.Enabled = true;
            //        txtRemarks.Enabled = false;
            //        txtCADValue.Enabled = false;
            //        txtCollectedDate.Enabled = false;
            //        txtCADVerifiedDate.Enabled = false;
            //        txtCADReceiverRemarks.Enabled = false;
            //        txtCADVerifierRemarks.Enabled = false;
            //        txtCADReceived.Enabled = false;
            //        ddlRequired.Enabled = false;
            //        ddlReceived.Enabled = false;
            //        ddlCollectedBy.Enabled = false;
            //    }
            //    gvPRDDT.FooterRow.Visible = false;

            //}
            //else
            //{
            //    //End Afetr Interface Review Changes for DMS Document not available in Staging Table


            gvPRDDT.BindGridView("S3G_OR_LOAD_TMPPRIDOCDT", strProParmDoc, out intTotalRecords, ObjPaging, out bIsNewRow, false);

            //if (ViewState["ReqStatus"].ToString() == "0")
            //{
            //    gvPRDDT.Columns[9].Visible = false;
            //    gvPRDDT.Columns[10].Visible = false;
            //    gvPRDDT.Columns[11].Visible = false;
            //}
            //if (ViewState["ReqStatus"].ToString() == "1")
            //{
            //    if (ViewState["CAD_VER_ACCESS"].ToString() == "0")
            //    {

            //        gvPRDDT.Columns[12].Visible = false;
            //        gvPRDDT.Columns[13].Visible = false;
            //        gvPRDDT.Columns[14].Visible = false;



            //    }
            //}
            //if (ViewState["CAD_REC_ACCESS"].ToString() == "0")
            //{
            //    gvPRDDT.Columns[15].Visible = false;
            //    gvPRDDT.Columns[16].Visible = false;
            //    gvPRDDT.Columns[17].Visible = false;



            //}


            if (intTotalRecords > 0)
            {
                //lnkUpdateDocuments.Enabled_True_Asp();
                //lnkUpdateDocuments.OnClientClick = "";

                if (strMode != "Q")
                {
                    lnkUpdateDocuments.Enabled_True();
                    lnkUpdateDocuments.Disabled = false;
                }
            }
            else
            {
                //lnkUpdateDocuments.Enabled = false;
                //lnkUpdateDocuments.Enabled_False_Asp();
                //lnkUpdateDocuments.OnClientClick = null;
                lnkUpdateDocuments.Enabled_False();
                lnkUpdateDocuments.Disabled = true;
            }
            //} // Commonted for DMS Document Flag Document not available in Staging Table
            ucCustomPagingDoc.Visible = true;
            ucCustomPagingDoc.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPagingDoc.setPageSize(ProPageSizeRW);

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
        }
    }

    private void funPriBindDocGridViewPagingDealer(string strOption)
    {
        try
        {

            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompany_Id;
            ObjPaging.ProUser_ID = intUserId;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = 5;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            if (ViewState["AssetDeleteDoc"] != null)
            {
                if (ViewState["intPageNumDoc"] != null)
                {
                    if (grvPRDDCDealer.Rows.Count == 1)
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString()) - 1;
                        ViewState["intPageNumDoc"] = ProPageNumRW;
                    }
                    else
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString());
                    }
                }
                else
                    ObjPaging.ProCurrentPage = ProPageNumRW;
                if (ViewState["intPageSizeDoc"] != null)
                    ObjPaging.ProPageSize = Convert.ToInt32(ViewState["intPageSizeDoc"].ToString());
                else
                    ObjPaging.ProPageSize = ProPageSizeRW;

                ViewState["AssetDeleteDoc"] = null;
            }
            else
            {
                ObjPaging.ProCurrentPage = ProPageNumRW;
                ObjPaging.ProPageSize = ProPageSizeRW;
            }
            if (ViewState["AssetAddDoc"] != null)
            {
                if (ViewState["intPageNumDoc"] != null)
                {
                    if (grvPRDDCDealer.Rows.Count == 1)
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString()) - 1;
                        ViewState["intPageNumDoc"] = ProPageNumRW;
                    }
                    else
                    {
                        ObjPaging.ProCurrentPage = ProPageNumRW = Convert.ToInt32(ViewState["intPageNumDoc"].ToString());
                    }
                }
                else
                {
                    ObjPaging.ProCurrentPage = ProPageNumRW;
                }
                if (ViewState["intPageSizeDoc"] != null)
                {
                    ObjPaging.ProPageSize = Convert.ToInt32(ViewState["intPageSizeDoc"].ToString());
                }
                else
                {
                    ObjPaging.ProPageSize = ProPageSizeRW;
                }

                ViewState["AssetAddDoc"] = null;
            }
            else
            {
                ObjPaging.ProCurrentPage = ProPageNumRW;
                ObjPaging.ProPageSize = ProPageSizeRW;
            }
            if (hdnIsDMS.Value != "1") // for DMS
            {
                if (!strProParmDoc.ContainsKey("@PRICING_ID"))
                {
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                }
            }
            //Start Afetr Interface Review Changes for DMS
            else
            {
                if (!strProParmDoc.ContainsKey("@PRICING_ID"))
                {
                    strProParmDoc.Add("@PRICING_ID", intPricingId.ToString());
                }
            }
            //End Afetr Interface Review Changes for DMS
            if (strProParmDoc.ContainsKey("@TOTALRECORDS"))
            {
                strProParmDoc.Remove("@TOTALRECORDS");
            }

            if (strProParmDoc.ContainsKey("@OPTION"))
            {
                strProParmDoc.Remove("@OPTION");
            }
            if (strOption == string.Empty)
            {
                if (strMode == "C")
                {
                    strProParmDoc.Add("@OPTION", "11");//All Entity Based
                    strProParmDoc.Add("@entity_id", ddlDealerDoc.SelectedValue);
                }
                else
                {
                    if (intPricingId == 0)
                    {
                        strProParmDoc.Add("@OPTION", "12");//Only Entity Based
                        strProParmDoc.Add("@entity_id", ddlDealerDoc.SelectedValue);
                    }
                    else
                    {
                        strProParmDoc.Add("@OPTION", "13");//Only Entity Based
                        strProParmDoc.Add("@entity_id", ddlDealerName.SelectedValue);
                    }
                }

            }
            else
            {
                strProParmDoc.Add("@OPTION", "12");//Only Entity Based
                strProParmDoc.Add("@entity_id", ddlDealerDoc.SelectedValue);
            }

            bool bIsNewRow = false;


            grvPRDDCDealer.BindGridView("S3G_OR_LOAD_TMPPRIDOCDT_UP_DLR", strProParmDoc, out intTotalRecords, ObjPaging, out bIsNewRow, false);
            if (intTotalRecords > 0)
            {
                if (strMode != "Q")
                {
                    lnkUpdateDocuments.Enabled_True();
                    lnkUpdateDocuments.Disabled = false;
                }
            }
            else
            {
                lnkUpdateDocuments.Enabled_False();
                lnkUpdateDocuments.Disabled = true;
            }
            ucCustomPagingDoc.Visible = true;
            ucCustomPagingDoc.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPagingDoc.setPageSize(ProPageSizeRW);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
        }
    }
    private void funPriSetTotalLpoValue()
    {
        try
        {
            //decimal decTotalAssetAmoumnt = 0;
            //foreach (GridViewRow grv in gvAssetDetails.Rows)
            //{
            //    Label lblLpoAmount = grv.FindControl("lblLpoAmount") as Label;
            //    decTotalAssetAmoumnt = decTotalAssetAmoumnt + Convert.ToDecimal(lblLpoAmount.Text);
            //}
            if (hdnLobCode.Value == "HP")
            {
                Label lblLpoAmount = gvAssetDetails.Rows[0].FindControl("lblTotalLpoAmount") as Label;
                Label lblTotalFinAmount = gvAssetDetails.Rows[0].FindControl("lblTotalFinAmount") as Label;
                if (gvAssetDetails.Rows.Count > 0)
                {

                    txtFacilityAmt.Text = Convert.ToDecimal(lblTotalFinAmount.Text).ToString("#,##0.000");
                    lblTotalAssetAmount.Text = Convert.ToDecimal(lblLpoAmount.Text).ToString("#,##0.000");

                }
                else
                {
                    txtFacilityAmt.Text = "0.000";
                    lblTotalAssetAmount.Text = "0.000";
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriAddAssetGrid()
    {
        try
        {
            funPriInsertTempAssetTable("1");
            FunPriResetAssetDetails();
            Utility.FunShowValidationMsg(this, "ORG_PRI", 22);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        try
        {
            funPriInsertTempAssetTable("2");
            //DataTable ObjDTAssetDetails;
            //ObjDTAssetDetails = (DataTable)ViewState["ObjDTAssetDetails"];
            //DataRow drow = ObjDTAssetDetails.Rows[Convert.ToInt32(Convert.ToInt32(ViewState["intRowEditIndex"]))];

            //drow["Asset_Code"] = ddlAssetCodeList1.SelectedValue;
            //drow["ASSET_DESCRIPTION"] = ddlAssetCodeList1.SelectedText;
            //drow["Noof_Units"] = txtUnitCount.Text;
            //drow["Unit_Value"] = txtUnitValue.Text;
            //drow["AssetValue"] = txtTotalAssetValue.Text;
            //if (!string.IsNullOrEmpty(txtMarginPercentage.Text))
            //    drow["Margin_Percentage"] = txtMarginPercentage.Text;
            //if (!string.IsNullOrEmpty(txtMarginAmountAsset.Text))
            //    drow["Margin_Amount"] = txtMarginAmountAsset.Text;
            //if (!string.IsNullOrEmpty(txtBookDepreciationPerc.Text))
            //    drow["Book_Depreciation_Percentage"] = txtBookDepreciationPerc.Text;

            //drow["pay_to"] = ddlPayTo.SelectedValue;
            //drow["pay_id"] = ddlEntityNameList.SelectedValue;
            //drow["payname"] = ddlEntityNameList.SelectedText;
            //if (!string.IsNullOrEmpty(txtMargintoDealer.Text))
            //    drow["Margin_Dealer"] = txtMargintoDealer.Text;
            //if (!string.IsNullOrEmpty(txtMargintoMFC.Text))
            //    drow["Margin_MFC"] = txtMargintoMFC.Text;
            //if (!string.IsNullOrEmpty(txtTradeIn.Text))
            //    drow["Trade_In"] = txtTradeIn.Text;
            //if (!string.IsNullOrEmpty(txtLpoAssetAmount.Text))
            //    drow["LPO_Amount"] = Convert.ToDecimal(txtUnitValue.Text) - (Convert.ToDecimal(txtMargintoDealer.Text) + Convert.ToDecimal(txtMargintoMFC.Text) + Convert.ToDecimal(txtTradeIn.Text));

            //FunProBindAssetGrid();
            btnAddNew.Text = "Add";
            //btnAddNew.ToolTip = "Add [Alt+C]";
            //Utility.FunShowAlertMsg(this, "Asset Modified Successfully");
            Utility.FunShowValidationMsg(this, "ORG_PRI", 17);
            FunPriResetAssetDetails();

        }
        catch (Exception ex)
        {

        }
    }


    protected void gvAssetDetails_SelectedIndexChanged(object sender, EventArgs e)
    {


        ViewState["EditSno"] = Convert.ToString(gvAssetDetails.SelectedRow.Cells[2].Text.Replace("&nbsp;", ""));

        btnAddNew.Text = "Edit";
        //btnAddNew.ToolTip = "Edit [Alt+C]";
        int intRowIndex = Utility.FunPubGetGridRowID("gvAssetDetails", ((LinkButton)sender).ClientID);
        LinkButton lblAssetNo = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetNo") as LinkButton;
        DataRow[] drow = ObjDTAssetDetail.Select("Sl_No='" + lblAssetNo.Text + "'");

        if (drow.Length > 0)
        {
            ViewState["EditSno"] = lblAssetNo.Text;
            ddlAssetCodeList1.SelectedValue = drow[0]["Asset_Code"].ToString();
            ddlAssetCodeList1.SelectedText = drow[0]["ASSET_DESCRIPTION"].ToString();
            txtUnitCount.Text = drow[0]["Noof_Units"].ToString();
            txtUnitValue.Text = drow[0]["Unit_Value"].ToString();
            txtTotalAssetValue.Text = drow[0]["AssetValue"].ToString();
            txtMarginPercentage.Text = drow[0]["Margin_Percentage"].ToString();
            txtMarginAmountAsset.Text = drow[0]["Margin_Amount"].ToString();
            txtBookDepreciationPerc.Text = drow[0]["Book_Depreciation_Percentage"].ToString();
            ddlPayTo.SelectedValue = drow[0]["pay_to"].ToString();
            ddlEntityNameList.SelectedValue = drow[0]["pay_id"].ToString();
            ddlEntityNameList.SelectedText = drow[0]["payname"].ToString();
            txtMargintoDealer.Text = drow[0]["Margin_Dealer"].ToString();
            txtMargintoMFC.Text = drow[0]["Margin_MFC"].ToString();
            txtTradeIn.Text = drow[0]["Trade_In"].ToString();
            txtLpoAssetAmount.Text = drow[0]["LPO_Amount"].ToString();
        }
    }
    protected void lblAssetNo_Click(object sender, EventArgs e)
    {
        try
        {

            txtUnitCount.Enabled = false;
            btnAddNew.Text = "Edit";
            //btnAddNew.ToolTip = "Edit [Alt+C]";
            int intRowIndex = Utility.FunPubGetGridRowID("gvAssetDetails", ((LinkButton)sender).ClientID);
            LinkButton lblAssetNo = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetNo") as LinkButton;
            Label lblAssetCode = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetCode") as Label;
            Label lblAssetDescription = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetDescription") as Label;
            Label lblUnitCount = gvAssetDetails.Rows[intRowIndex].FindControl("lblUnitCount") as Label;
            Label lblUnitVal = gvAssetDetails.Rows[intRowIndex].FindControl("lblUnitVal") as Label;
            Label lblAssetVal = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetVal") as Label;
            Label lblBookRate = gvAssetDetails.Rows[intRowIndex].FindControl("lblBookRate") as Label;
            Label lblpayto = gvAssetDetails.Rows[intRowIndex].FindControl("lblpayto") as Label;
            Label lblpayid = gvAssetDetails.Rows[intRowIndex].FindControl("lblpayid") as Label;
            Label lblpayname = gvAssetDetails.Rows[intRowIndex].FindControl("lblpayname") as Label;
            Label lblMargintoDealer = gvAssetDetails.Rows[intRowIndex].FindControl("lblMargintoDealer") as Label;
            Label lblMargintoMFC = gvAssetDetails.Rows[intRowIndex].FindControl("lblMargintoMFC") as Label;
            Label lblTradeIn = gvAssetDetails.Rows[intRowIndex].FindControl("lblTradeIn") as Label;
            Label lblLpoAmount = gvAssetDetails.Rows[intRowIndex].FindControl("lblLpoAmount") as Label;
            Label lblAssetTypeId = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetTypeId") as Label;
            Label lblReceiptNo = gvAssetDetails.Rows[intRowIndex].FindControl("lblReceiptNo") as Label;
            Label lblReceiptID = gvAssetDetails.Rows[intRowIndex].FindControl("lblReceiptID") as Label;

            Label lblRecordSno = gvAssetDetails.Rows[intRowIndex].FindControl("lblRecordSno") as Label;
            Label lblAssetId = gvAssetDetails.Rows[intRowIndex].FindControl("lblAssetId") as Label;

            if (lblMargintoDealer.Text == string.Empty)
            {
                lblMargintoDealer.Text = "0";
            }
            if (lblMargintoMFC.Text == string.Empty)
            {
                lblMargintoMFC.Text = "0";
            }
            if (lblTradeIn.Text == string.Empty)
            {
                lblTradeIn.Text = "0";
            }


            ViewState["EditSno"] = lblRecordSno.Text;
            ddlAssetCodeList1.SelectedValue = lblAssetId.Text;
            ddlAssetCodeList1.SelectedText = lblAssetCode.Text + "-" + lblAssetDescription.Text;
            txtUnitCount.Text = lblUnitCount.Text;
            txtUnitValue.Text = lblUnitVal.Text;
            txtTotalAssetValue.Text = lblAssetVal.Text;
            txtMarginPercentage.Text = "";
            txtMarginAmountAsset.Text = (Convert.ToDecimal(lblMargintoDealer.Text) + Convert.ToDecimal(lblMargintoMFC.Text) + Convert.ToDecimal(lblTradeIn.Text)).ToString();
            txtBookDepreciationPerc.Text = lblBookRate.Text;
            ddlPayTo.SelectedValue = lblpayto.Text;
            txtMarginAmountAsset.funPubChangeCurrencyFormat();
            if (ddlPayTo.SelectedValue == "0")
            {
                ddlEntityNameList.SelectedValue = lblpayid.Text;
                ddlEntityNameList.SelectedText = lblpayname.Text;
            }
            else
            {
                txtCustomerName.Text = lblpayname.Text;
            }
            txtMargintoDealer.Text = lblMargintoDealer.Text;
            txtMargintoMFC.Text = lblMargintoMFC.Text;
            txtTradeIn.Text = lblTradeIn.Text;
            txtLpoAssetAmount.Text = lblLpoAmount.Text;
            ddlAssetType.SelectedValue = lblAssetTypeId.Text;
            txtDownPaymentReceipt.Text = lblReceiptNo.Text;
            ViewState["RECEIPTID"] = lblReceiptID.Text;

            //if (lblAssetType.Text.ToUpper() == "NEW")
            //    ddlAssetType.SelectedValue = "1";
            //else if (lblAssetType.Text.ToUpper() == "USED")
            //    ddlAssetType.SelectedValue = "2";
            //else
            //    ddlAssetType.SelectedValue = "0";


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    protected void divrProimg_Click(object sender, EventArgs e)
    {
        try
        {
            mpeProShow.Hide();
            btnCancel.Disabled = false;
            btnPrevTab.Enabled = true;
            btnNextTab.Enabled = true;
            btnClear.Disabled = false;

            rptimg.Enabled = false;
            btnGoProfileCopy.Enabled = false;

            //CopyProfileClear();
            //rbtYears_SelectedIndexChanged(null, null);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }
    //protected void dvFileUploadProImage_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        string strPath = string.Empty;
    //        string strNewFileName = string.Empty;

    //        //ModalFileUpload.Hide();
    //        Label lblPathF = (Label)gvPRDDT.FooterRow.FindControl("lblPathF");


    //        //HttpPostedFile myFile = docFileUpload.PostedFile;

    //        //if (docFileUpload.HasFile)
    //        //{
    //        //    if (strDocpath == string.Empty || strDocpath == null)
    //        //    {
    //        //        Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
    //        //        return;
    //        //    }

    //        //    strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-" + 1.ToString());
    //        //    if (Directory.Exists(strPath))
    //        //    {
    //        //        Directory.Delete(strPath, true);
    //        //    }
    //        //    Directory.CreateDirectory(strPath);
    //        //    strPath = strPath + "/" + strNewFileName;

    //        //    lblPathF.Text = strPath;
    //        //    strCurrentFilePath = lblPathF.Text;
    //        //    docFileUpload.ToolTip = strCurrentFilePath;

    //        //    FileInfo f1 = new FileInfo(strPath);

    //        //    if (f1.Exists == true)
    //        //        f1.Delete();

    //        //    docFileUpload.SaveAs(strPath);

    //        //}




    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLog.CustomErrorRoutine(ex);
    //    }
    //}


    [System.Web.Services.WebMethod]
    public static string[] GetProposalCopy(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@OPTION", "3");
        Procparam.Add("@COMPANYID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_LOAD_LOV", Procparam));

        return suggetions.ToArray();
    }



    protected void ddlProposal_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            rptimg.Enabled = false;
            btnGoProfileCopy.Enabled = false;
            ViewState["Is_From_CopyProfile"] = "1";
            if (ddlProposalCopy.SelectedValue == "0" || ddlProposalCopy.SelectedText == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Proposal No");
                mpeProShow.Show();
                return;
            }
            FunPriLoadCopyProfileDtls(Convert.ToInt32(ddlProposalCopy.SelectedValue));
            txtPDCstDate.Text = DateTime.Now.ToString(strDateFormat);
            //btnCancelCheckList.Enabled_False();
            mpeProShow.Hide();

            btnCancel.Disabled = false;
            btnPrevTab.Enabled = true;
            btnNextTab.Enabled = true;
            btnClear.Disabled = false;
            ViewState["Is_From_CopyProfile"] = "0";

            //btnCopyProfile.Enabled_False_Asp();
            //btnCopyProfile.ToolTip = "Profile Copy Already Done for This Proposal Number";

            btnCopyProfile.Enabled_False();


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnCancelCheckList_Click(object sender, EventArgs e)
    {
        ObjPricingMgtServices = new PricingMgtServicesReference.PricingMgtServicesClient();
        try
        {
            //ObjPricingMgtServices = new PricingMgtServicesReference.PricingMgtServicesClient();



            int intErrorCode = 0;
            intErrorCode = ObjPricingMgtServices.FunPubWithDrawPricingInt(intPricingId, intCompany_Id, intUserId);
            if (intErrorCode == 0)
            {
                if (ViewState["DMSINSERTTYPE"] != null)
                {
                    if (ViewState["DMSINSERTTYPE"].ToString() == "R")
                    {
                        strAlert = strAlert.Replace("__ALERT__", "Deal " + txtProposalNumber.Text + " Revised Successfully");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    }
                    else
                    {
                        strAlert = strAlert.Replace("__ALERT__", "Deal " + txtProposalNumber.Text + " Cancelled Successfully");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    }
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Deal " + txtProposalNumber.Text + " Cancelled Successfully");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            else if (intErrorCode == 2)
            {
                Utility.FunShowAlertMsg(this, "Proposal not Revised in Sub System");
                return;
            }
            else if (intErrorCode == 3)
            {
                Utility.FunShowAlertMsg(this, "Application Processed Proposal Revision not allowed");
                return;
            }
            else
            {
                //Utility.FunShowAlertMsg(this, "Error in Deal offer " + txtProposalNumber.Text);
                Utility.FunShowValidationMsg(this, "ORG_PRI", 18);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvPricing.ErrorMessage = strErrorMessagePrefix + "Unable to cancell the Deal";
            cvPricing.IsValid = false;
        }
        finally
        {
            ObjPricingMgtServices.Close();
        }
    }

    protected void FunGetScreenModifyAccess()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompany_Id));
            Procparam.Add("@User_ID", Convert.ToString(intUserId));
            DataTable dt = Utility.GetDefaultData("S3G_SA_GET_USER_FUN_ACCESS", Procparam);
            ViewState["ReqStatus"] = "0";
            ViewState["RecStatus"] = "0";
            ViewState["CAD_VER_ACCESS"] = "0";
            ViewState["CAD_REC_ACCESS"] = "0";
            ViewState["WDRW_CHLST"] = "0";

            hdnCADVERACCESS.Value = "0";
            hdnCADRECACCESS.Value = "0";
            hdnReqAccess.Value = "0";
            hdnRecAccess.Value = "0";

            //btnCopyProfile.Enabled_False_Asp();
            //btnCopyProfile.TabIndex = -1;

            btnCopyProfile.Enabled_False();
            btnCancelCheckList.Enabled_False();

            ViewState["CHK_BSMO"] = "0";//Checklist Business Source Modification
            ViewState["CHK_MOFMO"] = "0";//Checklist Marketing Officer Modification
            ViewState["CHK_PDCSTR"] = "0";//Checklist PDC Structure Modification
            ViewState["CHK_PDCOFR"] = "0";//Checklist PDC Offer Date Modification
            ViewState["CHK_APPDT"] = "0";//Application Process Application Date Modification


            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["USER_FUNCTION"].ToString() == "CHK_CPYPR") //No Modify Access
                    {
                        if (intPricingId == 0)
                        {
                            ViewState["CHK_CPYPR"] = "1";
                            //btnCopyProfile.Enabled_True_Asp();

                            btnCopyProfile.Enabled_True();
                        }

                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_REQ") //No Modify Access
                    {
                        ViewState["ReqStatus"] = "1";
                        hdnReqAccess.Value = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_REC") //No Modify Access
                    {
                        ViewState["RecStatus"] = "1";
                        hdnRecAccess.Value = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CAD_VER_AC") //No Modify Access
                    {
                        ViewState["CAD_VER_ACCESS"] = "1";
                        hdnCADVERACCESS.Value = "1";

                    }
                    if (dr["USER_FUNCTION"].ToString() == "CAD_REC_AC") //No Modify Access
                    {
                        ViewState["CAD_REC_ACCESS"] = "1";
                        hdnCADRECACCESS.Value = "1";
                    }

                    if (dr["USER_FUNCTION"].ToString() == "WDRW_CHLST") //No Modify Access
                    {
                        ViewState["WDRW_CHLST"] = "1";

                    }

                    //Live Change on 27-June-2019

                    if (dr["USER_FUNCTION"].ToString() == "CHK_BSMO") //Checklist Business Source Modification
                    {
                        ViewState["CHK_BSMO"] = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_MOFMO") //Checklist Marketing Officer Modification
                    {
                        ViewState["CHK_MOFMO"] = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_PDCSTR") //Checklist PDC Structure Modification
                    {
                        ViewState["CHK_PDCSTR"] = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_PDCOFR") //Checklist PDC Offer Date Modification
                    {
                        ViewState["CHK_PDCOFR"] = "1";
                    }
                    if (dr["USER_FUNCTION"].ToString() == "CHK_APPDT") //Application Date Modification
                    {
                        ViewState["CHK_APPDT"] = "1";
                    }

                }
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    //protected void btnAdDPRow_Click(object sender, EventArgs e)
    //{
    //    TextBox txtdownPaymentAmount = grvDownPaymentReceipt.FooterRow.FindControl("txtdownPaymentAmount") as TextBox;
    //    TextBox txtddownPaymentReceipt = grvDownPaymentReceipt.FooterRow.FindControl("txtddownPaymentReceipt") as TextBox;

    //    var VSo = 0;
    //    if (ViewState["DOWNPAYRECEIPT"] != null)
    //    {
    //        DataTable dt = (DataTable)ViewState["DOWNPAYRECEIPT"];

    //        DataRow[] dr = dt.Select("Sno=-1");
    //        if (dr.Length > 0)
    //        {
    //            foreach (DataRow dr2 in dr)
    //            {
    //                dr2.Delete();
    //            }
    //            dt.AcceptChanges();

    //        }
    //        else
    //        {
    //            if (dt.Rows.Count > 0)
    //            {
    //                VSo = Convert.ToInt32(dt.Compute("max(Sno)", "1=1"));
    //            }
    //            else
    //            {
    //                VSo = 0;
    //            }
    //        }

    //        DataRow dr3 = dt.NewRow();
    //        dr3["Sno"] = VSo + 1;
    //        dr3["DownPayAmount"] = txtdownPaymentAmount.Text;
    //        dr3["DownPayReceipt"] = txtddownPaymentReceipt.Text;
    //        dt.Rows.Add(dr3);
    //        grvDownPaymentReceipt.DataSource = dt;
    //        grvDownPaymentReceipt.DataBind();
    //        ViewState["DOWNPAYRECEIPT"] = dt;
    //    }

    //    TextBox t = (TextBox)(grvDownPaymentReceipt.FooterRow.Cells[1].FindControl("txtdownPaymentAmount"));
    //    t.Focus();
    //}

    protected void btnAddrowDays_Click(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlDraweeBankG = GRVPDCDetails.FooterRow.FindControl("ddlDraweeBankG") as DropDownList;
            DropDownList ddlDraweeBankGPlace = GRVPDCDetails.FooterRow.FindControl("ddlDraweeBankGPlace") as DropDownList;
            DropDownList ddlPdcType = GRVPDCDetails.FooterRow.FindControl("ddlPdcType") as DropDownList;
            TextBox txtInsStart = GRVPDCDetails.FooterRow.FindControl("txtInsStart") as TextBox;
            TextBox txtInsEnd = GRVPDCDetails.FooterRow.FindControl("txtInsEnd") as TextBox;
            TextBox txtAmountF = GRVPDCDetails.FooterRow.FindControl("txtAmountF") as TextBox;


            if (Convert.ToDecimal(txtAmountF.Text) <= 0)
            {
                Utility.FunShowAlertMsg(this, "Amount Should be Greater than Zero");

                return;
            }

            if (ddlPdcType.SelectedValue == "2")
            {
                if (txtNoPDC.Text == string.Empty)
                {
                    //Utility.FunShowAlertMsg(this, "Enter the No of PDC");
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 20);
                    return;
                }
                if (txtTenure.Text == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Enter the Tenure");
                    return;
                }


                if (Convert.ToInt32(txtInsEnd.Text) < Convert.ToInt32(txtInsStart.Text))
                {
                    //Utility.FunShowAlertMsg(this, "Ins End should be greater than or equal to Ins Start");
                    Utility.FunShowAlertMsg(this, "From Installment Must be Lesser  Than The To Installment");
                    //Utility.FunShowValidationMsg(this, "ORG_PRI", 21);
                    //txtInsStart.Focus();
                    return;
                }
                if (Convert.ToInt32(txtInsEnd.Text) > Convert.ToInt32(txtNoPDC.Text))
                {
                    Utility.FunShowAlertMsg(this, "Installment End should not be Greater than the No of PDC");
                    //Utility.FunShowValidationMsg(this, "ORG_PRI", 21);
                    //txtInsEnd.Focus();
                    return;
                }

            }
            var VSo = 0;
            if (ViewState["PDC"] != null)
            {
                DataTable dt = (DataTable)ViewState["PDC"];

                DataRow[] dr = dt.Select("Sno=-1");
                if (dr.Length > 0)
                {
                    foreach (DataRow dr2 in dr)
                    {
                        dr2.Delete();
                    }
                    dt.AcceptChanges();

                }
                else
                {
                    if (dt.Rows.Count > 0)
                    {
                        VSo = Convert.ToInt32(dt.Compute("max(Sno)", "1=1"));
                    }
                    else
                    {
                        VSo = 0;
                    }
                }
                if (ddlPdcType.SelectedValue == "1")
                {
                    DataRow[] dr4 = dt.Select("PDC_Type_Id=1");
                    if (dr4.Length > 0)
                    {
                        Utility.FunShowAlertMsg(this, "Security Cheque exists");
                        return;
                    }
                }


                DataRow dr3 = dt.NewRow();
                dr3["Sno"] = VSo + 1;
                dr3["Bank"] = ddlDraweeBankG.SelectedItem.Text;
                dr3["BankId"] = ddlDraweeBankG.SelectedValue;
                dr3["BankPlace"] = ddlDraweeBankGPlace.SelectedItem.Text;
                dr3["BankPlace_Id"] = ddlDraweeBankGPlace.SelectedValue;
                if (ddlPdcType.SelectedValue == "1")
                {
                    dr3["Ins_Start"] = 0;
                    dr3["Ins_End"] = 0;
                }
                else
                {
                    dr3["Ins_Start"] = Convert.ToInt32(txtInsStart.Text);
                    dr3["Ins_End"] = Convert.ToInt32(txtInsEnd.Text);
                }
                dr3["Total_Amount"] = Convert.ToDecimal(txtAmountF.Text);
                dr3["PDC_Type_ID"] = Convert.ToDecimal(ddlPdcType.SelectedValue);
                dr3["PDC_Type"] = ddlPdcType.SelectedItem.Text;
                dt.Rows.Add(dr3);
                GRVPDCDetails.DataSource = dt;
                GRVPDCDetails.DataBind();
                funPriControlPDCDelete();
                ViewState["PDC"] = dt;
                //TextBox txtInsStart2 = GRVPDCDetails.FooterRow.FindControl("txtInsStart") as TextBox;
                //txtInsStart2.Text = txtInsEnd.Text;
                funPriCalculateTotalPdc(dt);



            }
            DropDownList t = (DropDownList)(GRVPDCDetails.FooterRow.Cells[1].FindControl("ddlPdcType"));
            t.Focus();
        }
        catch (Exception ex)
        {

        }

        //ddlPdcType.Focus();
    }
    private void funPriCalculateTotalPdc(DataTable dt)
    {
        decimal decAmount = 0;
        int InsStart = 0;
        int InsEnd = 0;
        decimal TotalAmount = 0;


        foreach (DataRow dr in dt.Rows)
        {

            // Changed by Boobalan on 28-Jan-2021 - Live call calculation issue fixing
            if (dr["Ins_Start"].ToString() != string.Empty && dr["Ins_End"].ToString() != string.Empty && dr["Total_Amount"].ToString() != string.Empty)
            {
                InsStart = Convert.ToInt32(dr["Ins_Start"].ToString());
                InsEnd = Convert.ToInt32(dr["Ins_End"].ToString());
                TotalAmount = Convert.ToDecimal(dr["Total_Amount"].ToString());
                decAmount = decAmount + ((InsEnd - InsStart + 1) * TotalAmount);
            }

            //    if (dr["Total_Amount"].ToString()!=string.Empty)
            //decAmount = decAmount + Convert.ToDecimal(dr["Total_Amount"].ToString());
        }
        lblTotalPdcAmount.Text = decAmount.ToString("#,##0.000");
        //lblTotalPdcAmount.Text = Convert.ToDecimal(dt.Compute("sum((Ins_End-Ins_Start+1)*Total_Amount)", "1 = 1").ToString()).ToString("#,##0.000");

    }
    private void funPriControlPDCDelete()
    {
        int iRowDeleteControl = 1;

        for (int i = 0; i <= GRVPDCDetails.Rows.Count - 1; i++)
        {
            if (i != GRVPDCDetails.Rows.Count - 1)
            {
                Button btnRemoveDays = GRVPDCDetails.Rows[i].FindControl("btnRemoveDays") as Button;
                Label lblPDCTypeID = GRVPDCDetails.Rows[i].FindControl("lblPDCTypeID") as Label;
                if (lblPDCTypeID != null)
                {
                    if (lblPDCTypeID.Text == "2")
                    {
                        if (((DataTable)ViewState["PDC"]).Rows.Count > 0)
                        {
                            DataTable dt = ((DataTable)ViewState["PDC"]);
                            DataRow[] dr = dt.Select("PDC_Type_Id=2");

                            if (dr.Length > 1)
                            {

                                if (iRowDeleteControl != dr.Length)
                                {
                                    btnRemoveDays.Enabled = false;
                                    btnRemoveDays.CssClass = "grid_btn_delete_disabled";
                                    iRowDeleteControl = iRowDeleteControl + 1;
                                }
                            }
                        }
                    }
                }

            }
        }
    }
    private void funPriControlAssetDelete()
    {
        for (int i = 0; i <= gvAssetDetails.Rows.Count - 1; i++)
        {
            if (i != gvAssetDetails.Rows.Count - 1)
            {
                LinkButton LnkDelete = gvAssetDetails.Rows[i].FindControl("LnkDelete") as LinkButton;
                LnkDelete.Enabled = false;
                LnkDelete.OnClientClick = null;
                LnkDelete.CssClass = "grid_btn_delete_disabled";

            }
        }
    }
    protected void asyncFileUpload_UploadedCompleteF(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
    {
        string strPath = string.Empty;
        //AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = sender as AjaxControlToolkit.AsyncFileUpload;
        //int intRowIndex2 = Utility.FunPubGetGridRowID("gvPRDDT", ((AjaxControlToolkit.AsyncFileUpload)sender).ClientID);
        //intRowIndex = intRowIndex2;

        AjaxControlToolkit.AsyncFileUpload AsyncFileUpload1 = (AjaxControlToolkit.AsyncFileUpload)gvPRDDT.FooterRow.FindControl("asyFileUploadF");
        Label lblPath = (Label)gvPRDDT.FooterRow.FindControl("lblPathF");
        Label txOD = (Label)gvPRDDT.FooterRow.FindControl("txODF");
        LinkButton hyplnkView = (LinkButton)gvPRDDT.FooterRow.FindControl("hyplnkViewF");
        string strNewFileName = AsyncFileUpload1.FileName;
        if (AsyncFileUpload1.FileName != "")
        {
            if (strDocpath == string.Empty || strDocpath == null)
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
                return;
            }

            if (AsyncFileUpload1.HasFile)
            {
                if (strDocpath != "")
                {
                    strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-" + 1.ToString());
                    if (Directory.Exists(strPath))
                    {
                        Directory.Delete(strPath, true);
                    }
                    Directory.CreateDirectory(strPath);
                    strPath = strPath + "/" + strNewFileName;
                }
                lblPath.Text = txOD.Text = strPath;
                strCurrentFilePath = lblPath.Text;

                FileInfo f1 = new FileInfo(strPath);

                if (f1.Exists == true)
                    f1.Delete();

                AsyncFileUpload1.SaveAs(strPath);
                hyplnkView.Enabled = true;
            }
        }
    }

    protected bool ValidateFileExtn(string strFileName)
    {

        string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "doc", "xls", "BMP", "GIF", "PNG", "JPG", "JPEG", "DOC", "XLS" };
        string[] validFileTypes2 = { "bmp", "gif", "png", "jpg", "jpeg", "doc", "xls" };

        string ext = System.IO.Path.GetExtension(strFileName);

        bool isValidFile = false;

        for (int i = 0; i < validFileTypes.Length; i++)
        {

            if (ext == "." + validFileTypes[i])
            {

                isValidFile = true;

                break;

            }

        }

        if (!isValidFile)
        {
            Utility.FunShowAlertMsg(this, "Invalid File. Please upload a File with extension " + string.Join(",", validFileTypes2));
        }
        else
        {
        }

        return isValidFile;

    }


    protected void btnBrowseIDealer_OnClick(object sender, EventArgs e)
    {


        int intRowIndex = Utility.FunPubGetGridRowID("grvPRDDCDealer", ((Button)sender).ClientID);

        string strPath = string.Empty;
        string strNewFileName = string.Empty;
        FileUpload flUpload2 = (FileUpload)grvPRDDCDealer.Rows[intRowIndex].FindControl("flUploadIDealer");
        TextBox txtFileupld = (TextBox)grvPRDDCDealer.Rows[intRowIndex].FindControl("txtFileupldIDealer");
        Label lblActualPath = (Label)grvPRDDCDealer.Rows[intRowIndex].FindControl("lblActualPathIDealer");
        Label lblPathF = (Label)grvPRDDCDealer.Rows[intRowIndex].FindControl("lblPathDealer");
        LinkButton hyplnkView = (LinkButton)grvPRDDCDealer.Rows[intRowIndex].FindControl("hyplnkView");
        ImageButton hyplnkViewDownLoadIDealer = (ImageButton)grvPRDDCDealer.Rows[intRowIndex].FindControl("hyplnkViewDownLoadIDealer");



        Label lblSno = (Label)grvPRDDCDealer.Rows[intRowIndex].FindControl("lblSno");
        lblPathF.Text = string.Empty;
        lblActualPath.Text = string.Empty;
        if (strDocpath == string.Empty || strDocpath == null)
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
            return;
        }
        if (flUpload2.HasFile)
        {
            strNewFileName = flUpload2.FileName;
            if (!ValidateFileExtn(strNewFileName))
            {
                return;
            }
            lblPathF.Text = txtFileupld.Text = flUpload2.FileName;
            flUpload2.ToolTip = lblPathF.Text;
            if (strDocpath != "")
            {
                strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-" + System.DateTime.Now.ToString("_ddMMyyhhmmss") + lblSno.Text);
                if (Directory.Exists(strPath))
                {
                    Directory.Delete(strPath, true);
                }
                Directory.CreateDirectory(strPath);
                strPath = strPath + "/" + strNewFileName;
            }
            strCurrentFilePath = lblActualPath.Text = strPath;


            FileInfo f1 = new FileInfo(strPath);
            if (f1.Exists == true)
                f1.Delete();
            flUpload2.SaveAs(strPath);
            FileUpload t = (FileUpload)(grvPRDDCDealer.Rows[intRowIndex].Cells[1].FindControl("flUploadIDealer"));
            if (lblPathF.Text == string.Empty)
            {
                hyplnkView.Enabled_False_Link_Asp();
                hyplnkViewDownLoadIDealer.Enabled = false;
                hyplnkViewDownLoadIDealer.ImageUrl = "~/Images/downloadFile_Disable.png";
            }
            else
            {
                hyplnkView.Enabled_True_Link_Asp();
                hyplnkViewDownLoadIDealer.Enabled = true;
                hyplnkViewDownLoadIDealer.ImageUrl = "~/Images/downloadFile.png";
            }

            hdnSetForceValues.Value = "1";
        }
        else
        {
            Utility.FunShowAlertMsg(this, "No HashFile");
        }

    }

    protected void btnBrowseI_OnClick(object sender, EventArgs e)
    {


        int intRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", ((Button)sender).ClientID);

        string strPath = string.Empty;
        string strNewFileName = string.Empty;
        FileUpload flUpload2 = (FileUpload)gvPRDDT.Rows[intRowIndex].FindControl("flUploadI");
        TextBox txtFileupld = (TextBox)gvPRDDT.Rows[intRowIndex].FindControl("txtFileupldI");
        Label lblActualPath = (Label)gvPRDDT.Rows[intRowIndex].FindControl("lblActualPathI");
        Label lblPathF = (Label)gvPRDDT.Rows[intRowIndex].FindControl("lblPath");
        LinkButton hyplnkView = (LinkButton)gvPRDDT.Rows[intRowIndex].FindControl("hyplnkView");
        ImageButton hyplnkViewDownLoadI = (ImageButton)gvPRDDT.Rows[intRowIndex].FindControl("hyplnkViewDownLoadI");



        Label lblSno = (Label)gvPRDDT.Rows[intRowIndex].FindControl("lblSno");

        lblPathF.Text = string.Empty;
        lblActualPath.Text = string.Empty;

        if (strDocpath == string.Empty || strDocpath == null)
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
            return;
        }

        if (flUpload2.HasFile)
        {
            strNewFileName = flUpload2.FileName;

            if (!ValidateFileExtn(strNewFileName))
            {

                return;
            }
            lblPathF.Text = txtFileupld.Text = flUpload2.FileName;
            flUpload2.ToolTip = lblPathF.Text;

            if (strDocpath != "")
            {
                strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-" + System.DateTime.Now.ToString("_ddMMyyhhmmss") + lblSno.Text);
                if (Directory.Exists(strPath))
                {
                    Directory.Delete(strPath, true);
                }
                Directory.CreateDirectory(strPath);
                strPath = strPath + "/" + strNewFileName;
            }
            strCurrentFilePath = lblActualPath.Text = strPath;


            FileInfo f1 = new FileInfo(strPath);

            if (f1.Exists == true)
                f1.Delete();
            flUpload2.SaveAs(strPath);
            FileUpload t = (FileUpload)(gvPRDDT.Rows[intRowIndex].Cells[1].FindControl("flUpload"));
            //t.Focus();
            //flUpload2.Focus();



            if (lblPathF.Text == string.Empty)
            {
                hyplnkView.Enabled_False_Link_Asp();
                hyplnkViewDownLoadI.Enabled = false;
                hyplnkViewDownLoadI.ImageUrl = "~/Images/downloadFile_Disable.png";
            }
            else
            {
                hyplnkView.Enabled_True_Link_Asp();
                hyplnkViewDownLoadI.Enabled = true;
                hyplnkViewDownLoadI.ImageUrl = "~/Images/downloadFile.png";
            }

            hdnSetForceValues.Value = "1";
        }
        else
        {
            Utility.FunShowAlertMsg(this, "No HashFile");
        }

    }
    protected void btnBrowse_OnClick(object sender, EventArgs e)
    {
        try
        {
            string strPath = string.Empty;
            string strNewFileName = string.Empty;
            FileUpload flUpload2 = (FileUpload)gvPRDDT.FooterRow.FindControl("flUpload");
            TextBox txtFileupld = (TextBox)gvPRDDT.FooterRow.FindControl("txtFileupld");
            Label lblActualPath = (Label)gvPRDDT.FooterRow.FindControl("lblActualPath");
            Label lblPathF = (Label)gvPRDDT.FooterRow.FindControl("lblPathF");

            LinkButton hyplnkViewF = (LinkButton)gvPRDDT.FooterRow.FindControl("hyplnkViewF");
            ImageButton hyplnkDownLoadF = (ImageButton)gvPRDDT.FooterRow.FindControl("hyplnkDownLoadF");

            if (strDocpath == string.Empty || strDocpath == null)
            {
                Utility.FunShowValidationMsg(this, "ORG_PRI", 5);
                return;
            }

            if (flUpload2.HasFile)
            {
                strNewFileName = flUpload2.FileName;

                if (!ValidateFileExtn(strNewFileName))
                {
                    return;
                }

                lblPathF.Text = txtFileupld.Text = flUpload2.FileName;
                flUpload2.ToolTip = lblPathF.Text;



                if (strDocpath != "")
                {
                    strPath = Path.Combine(strDocpath, "COMPANY" + intCompany_Id.ToString() + "/" + "CheckList-Add" + System.DateTime.Now.ToString("_ddMMyyhhmmss") + gvPRDDT.Rows.Count + 1.ToString());
                    if (Directory.Exists(strPath))
                    {
                        Directory.Delete(strPath, true);
                    }
                    Directory.CreateDirectory(strPath);
                    strPath = strPath + "/" + strNewFileName;
                }
                strCurrentFilePath = lblActualPath.Text = strPath;


                FileInfo f1 = new FileInfo(strPath);

                if (f1.Exists == true)
                    f1.Delete();
                flUpload2.SaveAs(strPath);
                FileUpload t = (FileUpload)(gvPRDDT.FooterRow.Cells[1].FindControl("flUpload"));
                //t.Focus();
                //flUpload2.Focus();

            }
            else
            {
                Utility.FunShowAlertMsg(this, "No HashFile");
            }

            if (lblPathF.Text == string.Empty)
            {
                hyplnkViewF.Enabled_False_Link_Asp();
                hyplnkDownLoadF.Enabled = false;
                hyplnkDownLoadF.ImageUrl = "~/Images/downloadFile_Disable.png";
            }
            else
            {
                hyplnkViewF.Enabled_True_Link_Asp();
                hyplnkDownLoadF.Enabled = true;
                hyplnkDownLoadF.ImageUrl = "~/Images/downloadFile.png";
            }



        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            //funPriSetModalErrorMessege(ex.ToString());
        }

    }
    //public void funPriSetModalErrorMessege(string strErroMessge)
    //{
    //    //ModalFileUpload.Show();
    //    //lblErrorMesseg.Text = strErroMessge;

    //}
    //protected void btnUpload_Click(object sender, EventArgs e)
    //{
    //    //ModalFileUpload.Show();

    //}
    private void FunPriLoadLookupTypeData(DropDownList ddlLookup, string strLookupType)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompany_Id.ToString());
            Procparam.Add("@Lookup_Type", strLookupType);
            Procparam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            //ddlLookup.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, true, "--Select--", new string[] { "ID", "DESCRIPTION" });
            ddlLookup.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
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


                    Label lblParamValue = e.Row.FindControl("lblParamValues") as Label;
                    if (!string.IsNullOrEmpty(lblParamValue.Text))
                        ddlValues.SelectedValue = lblParamValue.Text;


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

    private void funPriAdditionalInfor(string strLobId, string strOfferDate)
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_Id.ToString());
        Procparam.Add("@Program_ID", Convert.ToString(intProgramId));
        Procparam.Add("@TYPE", Convert.ToString(1));
        Procparam.Add("@LOB_ID", strLobId);
        Procparam.Add("@CUST_OFF_DATE", Utility.StringToDate(strOfferDate).ToString());
        //Procparam.Add("@TYPE_ID", Utility.StringToDate(strOfferDate).ToString());


        //Procparam.Add("@TYPE_ID", ddlConstitutionName.SelectedValue);
        DataTable dtdata = Utility.GetDefaultData("S3G_GET_CONSTANT_PARAM_VAL", Procparam);
        if (dtdata.Rows.Count > 0)
        {
            grvAdditionalInfo.DataSource = dtdata;
            grvAdditionalInfo.DataBind();
        }
    }
    private void AdditionalInforFetch(int intPricingId)
    {
        //Procparam = new Dictionary<string, string>();
        //Procparam.Add("@Company_ID", intCompany_Id.ToString());
        //Procparam.Add("@TRAN_ID", Convert.ToString(intPricingId));
        //Procparam.Add("@PROGRAM_ID", Convert.ToString(intProgramId));


        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompany_Id.ToString());
        Procparam.Add("@Program_ID", Convert.ToString(intProgramId));
        Procparam.Add("@TRAN_ID", Convert.ToString(intPricingId));
        Procparam.Add("@LOB_ID", ddlLob.SelectedValue);
        Procparam.Add("@CUST_OFF_DATE", Utility.StringToDate(txtOfferDate.Text).ToString());



        DataTable dtdata = Utility.GetDefaultData("S3G_GET_CONSTANT_PARAMTRAN_VAL", Procparam);
        if (dtdata.Rows.Count > 0)
        {
            grvAdditionalInfo.DataSource = dtdata;
            grvAdditionalInfo.DataBind();
        }
    }

    protected void ddlTemplateType_SelectedIndexChanged(object sender, EventArgs e)
    {
        funPriLoadTemplateLookUp(null, null);
    }
    private void funPriLoadTemplateLookUp(object sender, EventArgs e)
    {

        DataSet dsGetCheckListDetails = new DataSet();
        Dictionary<string, string> strProParm = new Dictionary<string, string>();
        strProParm.Add("@OPTION", "5");
        strProParm.Add("@COMPANYID", intCompany_Id.ToString());
        strProParm.Add("@USERID", intUserId.ToString());
        strProParm.Add("@PROGRAMID", intProgramId.ToString());
        strProParm.Add("@Page_Mode", "C");
        strProParm.Add("@TempLateType", ddlTemplateType.SelectedValue);
        ddlLanguage.BindDataTable("S3G_OR_LOAD_LOV", strProParm, "value", "name");
        //ddlLanguage.Focus();
    }

    protected void txtDownPaymentReceipt_TextChanged(object sender, EventArgs e)
    {

        //funPriValidateDownPaymentRecipt();
    }
    private bool funPriValidateDownPaymentRecipt()
    {
        bool iReturn = false;
        try
        {
            ViewState["RECEIPTID"] = null;
            ViewState["RECEIPTAMOUNT"] = null;
            //if (ddlPayTo.SelectedValue == "1")
            //{

            if (txtMargintoMFC.Text != string.Empty)
            {

                if (Convert.ToDecimal(txtMargintoMFC.Text) > 0)
                {

                    if (txtDownPaymentReceipt.Text != string.Empty)
                    {

                        //Dictionary<string, string> strProParm = new Dictionary<string, string>();
                        //strProParm.Add("@OPTION", "6");
                        //strProParm.Add("@COMPANYID", intCompany_Id.ToString());
                        //strProParm.Add("@USERID", intUserId.ToString());
                        //strProParm.Add("@PROGRAMID", intProgramId.ToString());
                        //strProParm.Add("@Page_Mode", "C");
                        //strProParm.Add("@Receipt_No", txtDownPaymentReceipt.Text);
                        //DataTable dt = Utility.GetDefaultData("S3G_OR_LOAD_LOV", strProParm);
                        //if (dt.Rows.Count > 0)
                        //{
                        //    ViewState["RECEIPTID"] = dt.Rows[0]["RECEIPT_ID"].ToString();
                        //    ViewState["RECEIPTAMOUNT"] = dt.Rows[0]["TOTAL_RECEIPT_AMOUNT"].ToString();
                        //    iReturn = true;
                        //}
                        //else
                        //{
                        //    txtDownPaymentReceipt.Text = string.Empty;
                        //    Utility.FunShowAlertMsg(this, "Customer Receipt No Not Exists");
                        //    iReturn = false;
                        //}
                        iReturn = true;
                    }
                    else
                    {
                        Utility.FunShowAlertMsg(this, "Enter the Down Payment Receipt");
                        iReturn = false;
                    }
                }
                else
                {
                    iReturn = true;
                }

            }
            else
            {
                iReturn = true;
            }
            //}

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return iReturn;
    }
    protected void txtNoPDC_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtNoPDC.Text != string.Empty)
            {
                if (Convert.ToInt32(txtNoPDC.Text) > 999)
                {

                    Utility.FunShowAlertMsg(this, "No of PDC should not exceed 999");
                    txtNoPDC.Text = string.Empty;
                }

                if (Convert.ToInt32(txtNoPDC.Text) > Convert.ToInt32(txtTenure.Text))
                {
                    Utility.FunShowAlertMsg(this, "No of PDC should be Less than or Equal to Tenure");
                    txtNoPDC.Text = string.Empty;
                }
            }




            txtNoPDC.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void btnLoadCustomerMaster_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["EnqNewCustomerId"] != null)
            {
                intEnqNewCustomerId = Convert.ToInt32(Utility.Load("EnqNewCustomerId", ""));
                HiddenField hdnCustomerId = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                if (hdnCustomerId != null)
                {
                    hdnCustomerId.Value = hdnCustID.Value = intEnqNewCustomerId.ToString();
                    HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    hdnCID.Value = hdnCID.Value;
                    btnLoadCustomer_Click(null, null);
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void txtMargintoMFC_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtDownPaymentReceipt.Text = string.Empty;
            if (txtMargintoMFC.Text != string.Empty)
            {
                if (Convert.ToDecimal(txtMargintoMFC.Text) > 0)
                {
                    txtDownPaymentReceipt.Enabled = true;
                }
                else
                {
                    txtDownPaymentReceipt.Text = string.Empty;
                    txtDownPaymentReceipt.Enabled = false;
                }
            }
            else
            {
                txtDownPaymentReceipt.Text = string.Empty;
                txtDownPaymentReceipt.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    // DMS Integration Part Strat
    [System.Web.Services.WebMethod]
    public static string[] GetProposalfromDMS(String prefixText, int count) // For DMS
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@Company_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@Lob_Id", obj_PageValue.ddlLob.SelectedValue);
        Procparam.Add("@Location_Id", obj_PageValue.cmbLocation.SelectedValue);
        Procparam.Add("@User_Id", HttpContext.Current.Session["User_Id"].ToString());
        Procparam.Add("@Program_Id", "42");
        Procparam.Add("@PrefixText", prefixText);

        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("ORG_GET_CHECKLISTDMS_AGT", Procparam));
        return suggetions.ToArray();

    }

    private void FunPriLoadCheckListFromDMSDtls(int intPricingId) // For DMS
    {
        try
        {
            intProdcutSet = 1;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Pricing_ID", intPricingId.ToString());
            Procparam.Add("@COMPANY_ID", intCompany_Id.ToString());
            Procparam.Add("@Mode", strMode);
            DataSet ds_PricingDetails = Utility.GetDataset("S3G_OR_GET_CHECKLISTFROMSTG", Procparam);
            hdnIsDMS.Value = "1";
            if (ds_PricingDetails != null)
            {
                if (ds_PricingDetails.Tables[0].Rows.Count > 0)
                {




                    if (ds_PricingDetails.Tables[0].Rows[0]["RISKTEAM_RISK_RATING"].ToString() != string.Empty)
                    {
                        if (ds_PricingDetails.Tables[0].Rows[0]["RISK_APVL_STATUS_ID"].ToString() == "4")
                        {
                            Utility.FunShowAlertMsg(this, "High Risk Approval Rejected for this Proposal");
                            ucCheckListFromDMS.Clear();
                            return;
                        }

                        //Commentted By : Anbuvel.T, Date : 19-JUN-2019, Description : Due To Narien Confirmation on 06/19/2019 12:22 AM
                        //if (ds_PricingDetails.Tables[0].Rows[0]["RISKTEAM_RISK_RATING"].ToString() == "3")
                        //{
                        //    Utility.FunShowAlertMsg(this, "High Risk Approval Required for this Proposal");
                        //    ucCheckListFromDMS.Clear();
                        //    return;
                        //}
                    }

                    //Validation for If Assset count is more than 1 from DMS, Start By Praba on 08-02-2021

                    if (ds_PricingDetails.Tables[7].Rows[0]["ERRORCODE"].ToString() != string.Empty)
                    {
                        if (ds_PricingDetails.Tables[7].Rows[0]["ERRORCODE"].ToString() == "1")
                        {
                            Utility.FunShowAlertMsg(this, ds_PricingDetails.Tables[7].Rows[0]["ERROR_MESSAGE"].ToString());
                            ucCheckListFromDMS.Clear();
                            return;
                        }

                    }
                    //Validation for If Assset count is more than 1 from DMS, End By Praba on 08-02-2021

                    ucCheckListFromDMS.Enabled = false;
                    txtProposalNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["Business_Offer_Number"].ToString();
                    ddlLob.ClearSelection();
                    ddlLob.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["LOB_ID"].ToString();
                    ddlLob_SelectedIndexChanged(null, null);
                    funPriLoadProduct();
                    cmbLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Location_ID"].ToString();
                    cmbLocation_SelectedIndexChanged(null, null);
                    cmbSubLocation.Items.Clear();
                    //System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(cmbSubLocation.SelectedItem.Text, cmbSubLocation.SelectedValue);
                    System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_NAME"].ToString(), ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString());
                    cmbSubLocation.Items.Add(lstItem);
                    //cmbSubLocation.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SUB_LOCATION_ID"].ToString();
                    hdnIs_IS_NEW_CUSTOMER_FLAG.Value = ds_PricingDetails.Tables[0].Rows[0]["IS_NEW_CUSTOMER_FLAG"].ToString();



                    if (hdnIs_IS_NEW_CUSTOMER_FLAG.Value == "1")
                    {
                        ddlCustomerType.SelectedValue = "1";
                        //btnCreateCustomer.Enabled_True();
                        btnCreateCustomer.Attributes.Remove("disabled");
                        btnCreateCustomer.Attributes.Add("class", "btn_control");  // enab
                    }
                    else
                    {
                        ddlCustomerType.SelectedValue = "3"; //ds_PricingDetails.Tables[0].Rows[0]["CUSTOMER_TYPE"].ToString();
                        ucCustomerCodeLov.Enabled = false;
                        //btnCreateCustomer.Enabled_False();
                        btnCreateCustomer.Attributes.Add("disabled", "disabled");
                        btnCreateCustomer.Attributes.Add("class", "btn_control_disable");  // enab
                    }
                    if (ds_PricingDetails.Tables[0].Rows[0]["CUSTOMER_TYPE"].ToString() != string.Empty)
                    {
                        ddlCustomerType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CUSTOMER_TYPE"].ToString();
                    }
                    else
                    {
                        ddlCustomerType.SelectedValue = "3";
                    }
                    if (ddlCustomerType.SelectedIndex == 1)
                    {
                        ddlCustomerType.SelectedValue = "3";
                    }
                    ddlAppraisalType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    HttpContext.Current.Session["ddlContType"] = ddlContType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["CONTRACT_TYPE"].ToString();
                    //ddlContType_SelectedIndexChanged(null, null);
                    ddlDealType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEAL_TYPE"].ToString();
                    //ddlDealType_SelectedIndexChanged(null, null);
                    ddlDealerName.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_ID"].ToString();
                    ddlDealerName.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Name"].ToString();
                    txtDateofBirth.Text = ds_PricingDetails.Tables[0].Rows[0]["DATEOFBIRTH"].ToString();
                    ddlSalePersonCodeList.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["SALES_PERSON_ID"].ToString();
                    ddlSalePersonCodeList.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["Sales_Person_Name"].ToString();
                    ddlProduct.ClearSelection();
                    if (ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()) != null)
                    {
                        ddlProduct.Items.FindByValue(ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString()).Selected = true;
                    }
                    ddlProduct.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Product_ID"].ToString();
                    txtOfferDate.Text = ds_PricingDetails.Tables[0].Rows[0]["Offer_Date"].ToString();
                    txtFacilityAmt.Text = Convert.ToDecimal(ds_PricingDetails.Tables[0].Rows[0]["FACILITY_AMOUNT"].ToString()).ToString("#,##0.000");
                    txtTenure.Text = ds_PricingDetails.Tables[0].Rows[0]["Tenure"].ToString();
                    ddlTenureType.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["Tenure_Type"].ToString();
                    //ddldealerSalesPerson.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["DEALER_SALESPERSON_ID"].ToString();
                    ddldealerSalesPerson.Text = ds_PricingDetails.Tables[0].Rows[0]["Dealer_Sales_Persion"].ToString();

                    ViewState["ConsitutionId"] = ds_PricingDetails.Tables[0].Rows[0]["CONSTITUTION_ID"].ToString();
                    if (txtSellerName.Text == "" || txtSellerName.Text == string.Empty)
                    {
                        //lblSellerName.CssClass = "styleDisplayLabel";
                        //lblSellerCode.CssClass = "styleDisplayLabel";
                        //rfvSellerName.Enabled = false;
                        //rfvSellerCode.Enabled = false;
                        txtSellerCode.Enabled = false;
                        txtSellerName.Enabled = false;
                    }

                    //if (ddlContType.SelectedValue == "1")//New
                    //{
                    //    lblSellerName.CssClass = "styleDisplayLabel";
                    //    lblSellerCode.CssClass = "styleDisplayLabel";
                    //    rfvSellerName.Enabled = false;
                    //    rfvSellerCode.Enabled = false;
                    //    txtSellerCode.Enabled = false;
                    //    txtSellerName.Enabled = false;

                    //}
                    //else
                    //{
                    //    lblSellerName.CssClass = "styleReqFieldLabel";
                    //    lblSellerCode.CssClass = "styleReqFieldLabel";
                    //    rfvSellerName.Enabled = true;
                    //    rfvSellerCode.Enabled = true;
                    //    txtSellerCode.Enabled = true;
                    //    txtSellerName.Enabled = true;
                    //}
                    HttpContext.Current.Session["ddlContType"] = ddlContType.SelectedValue;

                    txtSellerName.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_NAME"].ToString();
                    txtSellerCode.Text = ds_PricingDetails.Tables[0].Rows[0]["SELLER_ID"].ToString();
                    //ddlInsurar.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURER"].ToString();
                    //ddlInsurar.SelectedText = ds_PricingDetails.Tables[0].Rows[0]["INSURER_NAME"].ToString();
                    txtInsurancePolicyNo.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_POLICYNO"].ToString();
                    if (ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString() != null && ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString() != "")
                    {
                        ddlInsuranceby.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_BY"].ToString();
                    }
                    if (ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_COVERAGE"].ToString() != string.Empty)
                    {
                        ddlInsuranceCoverage.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_COVERAGE"].ToString();
                    }

                    txtInsuranceRemarks.Text = ds_PricingDetails.Tables[0].Rows[0]["INSURANCE_REMARKS"].ToString();
                    TextBox txtName = (TextBox)ucCustomerCodeLov.FindControl("txtName");
                    txtName.Text = ds_PricingDetails.Tables[0].Rows[0]["customer"].ToString();
                    HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
                    hdnCID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //FunPriLoadAddressDetails(Convert.ToInt32(ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString()));
                    txtNoPDC.Text = ds_PricingDetails.Tables[0].Rows[0]["NO_OF_PDC"].ToString();
                    txtPDCstDate.Text = ds_PricingDetails.Tables[0].Rows[0]["PDC_STARTDATE"].ToString();
                    txtAccountNumber.Text = ds_PricingDetails.Tables[0].Rows[0]["AccountNumber"].ToString();
                    //ddlStatus.SelectedValue = ds_PricingDetails.Tables[0].Rows[0]["STATUS_ID"].ToString();
                    hdnCustID.Value = ds_PricingDetails.Tables[0].Rows[0]["customer_id"].ToString();
                    //ddlDealerName_Item_Selected(null, null);
                    if (hdnCustID.Value != string.Empty)
                    {
                        btnLoadCustomer_Click(null, null);
                    }
                    funDisableForDMS();
                    txtDateofBirth.Text = ds_PricingDetails.Tables[0].Rows[0]["PROSPECT_BOB"].ToString();
                    ViewState["DMSINSERTTYPE"] = ds_PricingDetails.Tables[0].Rows[0]["INSERT_TYPE"].ToString();



                }

                #region Document Details Tab
                //txtConstitutionCode.Text = ds_PricingDetails.Tables[0].Rows[0]["Consitution"].ToString();
                #endregion

                #region Asset Tab
                if (strMode == "Q")
                {
                    btnAddNew.Enabled_False_Asp();
                    //btnAddNew.Enabled_False();
                    //btnAddNew.Disabled = true;
                }

                if (ds_PricingDetails.Tables[1].Rows.Count > 0)
                {
                    gvAlert.DataSource = ds_PricingDetails.Tables[1];
                    gvAlert.DataBind();
                    ViewState["DtAlertDetails"] = ds_PricingDetails.Tables[1];
                    FunPriFill_Alert_Tab(_Edit);
                }
                else
                {
                    FunPriFill_Alert_Tab(_Add);
                }
                if (ds_PricingDetails.Tables[2].Rows.Count > 0)
                {
                    //ViewState["ObjDTAssetDetails"] = ds_PricingDetails.Tables[2];
                    //FunProBindAssetGrid();


                }
                //if (ds_PricingDetails.Tables[3].Rows.Count > 0)
                //{

                //    //gvPRDDT.DataSource = ds_PricingDetails.Tables[3];
                //    //gvPRDDT.DataBind();
                //    //btnViewDocuments.Visible = false;
                //    //btnViewDocuments.Text = "Update Documents";
                //    //ViewState["dtPDDCustomer"] = ds_PricingDetails.Tables[3];
                //}
                //else
                //{
                //    //btnViewDocuments.Visible = false;
                //}

                //Start Afetr Interface Review Changes for DMS
                /* Enabled as per Rajamohan Call - 15055 - Start */

                if (ds_PricingDetails.Tables[4].Rows.Count > 0)
                {
                    GRVPDCDetails.DataSource = ds_PricingDetails.Tables[4];
                    GRVPDCDetails.DataBind();
                    ViewState["PDC"] = ds_PricingDetails.Tables[4];


                    funPriControlPDCDelete();
                    funPriCalculateTotalPdc(ds_PricingDetails.Tables[4]);
                    //    funPriControlPDCDelete();


                    //    foreach (GridViewRow grvRow in gvAssetDetails.Rows)
                    //    {
                    //        LinkButton LnkDelete = (LinkButton)grvRow.FindControl("LnkDelete");
                    //        LnkDelete.Enabled = false;
                    //    }
                    //    //HtmlButton btnadd = (HtmlButton)GRVPDCDetails.FooterRow.FindControl("btnAddrowDays");
                    //    //btnadd.Enabled_False();
                    //    //ddlPdcType.SelectedValue = ds_PricingDetails.Tables[4].Rows[0]["IS_SECURITY"].ToString();
                }
                /* Enabled as per Rajamohan Call - 15055 - Start */
                //HtmlButton btnadd = (HtmlButton)GRVPDCDetails.FooterRow.FindControl("btnAddrowDays");
                //btnadd.Enabled_False();
                //GRVPDCDetails.Enabled = false;

                //End Afetr Interface Review Changes for DMS

                funPriInsertTempAssetTableFromDMS("6");
                //Start Afetr Interface Review Changes for DMS
                //funPriInsertTempDocTableFromDMS("6");
                //End Afetr Interface Review Changes for DMS

                if (hdnIsDMS.Value == "0")
                {
                    AdditionalInforFetch(intPricingId);
                }

                //FunPriFill_AssetTab(_Edit);
                #endregion
            }
            intProdcutSet = 0;
            btnViewDocuments_Click(null, null);

            if (ViewState["CHK_BSMO"].ToString() == "1")
            {
                //ddlDealType.Enabled = true;
            }
            else
            {
                //ddlDealType.Enabled = false;
            }

            if (ViewState["CHK_MOFMO"].ToString() == "1")
            {
                //ddlSalePersonCodeList.Enabled = true;
            }
            else
            {
                //ddlSalePersonCodeList.Enabled = false;
            }


            if (ViewState["CHK_PDCSTR"].ToString() == "1")
            {
                GRVPDCDetails.FooterRow.Enabled = true;
                txtNoPDC.Enabled = true;
                txtPDCstDate.Enabled = true;
                GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = true;
            }
            else
            {
                GRVPDCDetails.FooterRow.Enabled = false;
                txtNoPDC.Enabled = false;
                txtPDCstDate.Enabled = false;
                GRVPDCDetails.Columns[GRVPDCDetails.Columns.Count - 1].Visible = false;
            }


            if (ViewState["CHK_PDCOFR"].ToString() == "1")
            {
                txtOfferDate.Enabled = true;
                rfvOfferDate.Enabled = true;
                calCollectedDateffer.Enabled = true;
            }
            else
            {
                txtOfferDate.Enabled = false;
                rfvOfferDate.Enabled = false;
                calCollectedDateffer.Enabled = false;
            }
            if (ddlDealerName.SelectedValue != string.Empty)
            {
                ddlDealerDoc.SelectedValue = ddlDealerName.SelectedValue;
                ddlDealerDoc.SelectedText = ddlDealerName.SelectedText;
                btnGoDealerDoc_Click(null, null);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Error in getting data from Pricing");
        }
    }

    private void funPriInsertTempDocTableFromDMS(string strAction) // For DMS 
    {
        try
        {
            if (strAction == "6")//For DMS
            {
                int intPricingIdCopyProfile = 0;
                if (ViewState["intPricingIdCopyPrifile"] != null)
                {
                    intPricingIdCopyProfile = Convert.ToInt32(ViewState["intPricingIdCopyPrifile"].ToString());
                }
                strProParmDoc = new Dictionary<string, string>();
                strProParmDoc.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmDoc.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmDoc.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmDoc.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmDoc.Add("@PROGRAMID", intProgramId.ToString());
                strProParmDoc.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmDoc.Add("@PRICING_ID", hdnPricing_ID.Value);
                funPriBindDocGridViewPaging();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            //funPriSetModalErrorMessege(ex.ToString());
        }
    }

    public void funDisableForDMS() // For DMS
    {
        ddlLob.Enabled = false;
        cmbLocation.Enabled = false;
        //cmbSubLocation.Enabled = false;
        ddlCustomerType.Enabled = false;
        ddlContType.Enabled = false;
        ddlDealType.Enabled = true;
        ddlDealerName.Enabled = false;
        txtDateofBirth.Enabled = false;
        ddlSalePersonCodeList.Enabled = true;
        ddlProduct.Enabled = false;
        txtOfferDate.Enabled = false;


        if (ddlContType.SelectedValue == "2" || ddlContType.SelectedValue == "3")
        {
            //if (ddlDealerName.SelectedValue == strSecondHandDealer)//SecondDealer and Sales Back
            if (ddlDealerName.SelectedValue == "6227" || ddlDealerName.SelectedValue == "6307" || ddlDealerName.SelectedValue == "6418" || ddlDealerName.SelectedValue == "6431")
            {
                txtSellerName.Enabled = true;
                txtSellerCode.Enabled = true;
            }
        }
        else
        {
            txtSellerName.Enabled = false;
            txtSellerCode.Enabled = false;
        }

        ddldealerSalesPerson.Enabled = true;
        //btnCopyProfile.Enabled = false;
        btnCopyProfile.Enabled_False();
        txtFacilityAmt.Enabled = false;
        txtTenure.Enabled = false;
        ddlInsuranceCoverage.Enabled = false;
        txtInsuranceRemarks.Enabled = false;
        txtInsurancePolicyNo.Enabled = false;
        ddlTenureType.Enabled = false;
        ddlInsuranceby.Enabled = true;
        // PDC Details Part
        //txtNoPDC.Enabled = false;
        //txtPDCstDate.Enabled = false;
        // Asset Details
        ddlAssetCodeList1.Enabled = false;
        txtRequiredFromDate.Enabled = false;
        txtUnitCount.Enabled = false;
        txtUnitValue.Enabled = false;
        txtTotalAssetValue.Enabled = false;
        txtMarginPercentage.Enabled = false;
        txtMarginAmountAsset.Enabled = false;
        txtBookDepreciationPerc.Enabled = false;
        ddlPayTo.Enabled = false;
        ddlEntityNameList.Enabled = false;
        txtMargintoDealer.Enabled = false;
        txtMargintoMFC.Enabled = false;
        txtTradeIn.Enabled = false;
        txtLpoAssetAmount.Enabled = false;
        ddlAssetType.Enabled = false;
        txtDownPaymentReceipt.Enabled = false;
        btnAddNew.Enabled_False_Asp();
        //btnAddNew.Enabled_False();

    }
    public void funDisableForDMSClear() // For DMS
    {
        ddlLob.Enabled = true;
        cmbLocation.Enabled = true;
        cmbSubLocation.Enabled = true;
        ddlCustomerType.Enabled = true;
        ddlContType.Enabled = true;
        ddlDealType.Enabled = true;
        ddlDealerName.Enabled = true;
        txtDateofBirth.Enabled = true;
        ddlSalePersonCodeList.Enabled = true;
        ddlProduct.Enabled = true;
        txtOfferDate.Enabled = true;
        txtSellerName.Enabled = true;
        txtSellerCode.Enabled = true;
        ddldealerSalesPerson.Enabled = true;
        //btnCopyProfile.Enabled = false;
        btnCopyProfile.Enabled_True();
        txtFacilityAmt.Enabled = true;
        txtTenure.Enabled = true;
        ddlInsuranceCoverage.Enabled = true;
        txtInsuranceRemarks.Enabled = true;
        txtInsurancePolicyNo.Enabled = true;
        ddlTenureType.Enabled = true;
        ddlInsuranceby.Enabled = true;
        // PDC Details Part
        txtNoPDC.Enabled = true;
        txtPDCstDate.Enabled = true;
        // Asset Details
        ddlAssetCodeList1.Enabled = true;
        txtRequiredFromDate.Enabled = true;
        txtUnitCount.Enabled = true;
        txtUnitValue.Enabled = true;
        txtTotalAssetValue.Enabled = true;
        txtMarginPercentage.Enabled = true;
        txtMarginAmountAsset.Enabled = true;
        txtBookDepreciationPerc.Enabled = true;
        ddlPayTo.Enabled = true;
        ddlEntityNameList.Enabled = true;
        txtMargintoDealer.Enabled = true;
        txtMargintoMFC.Enabled = true;
        txtTradeIn.Enabled = true;
        txtLpoAssetAmount.Enabled = true;
        ddlAssetType.Enabled = true;
        txtDownPaymentReceipt.Enabled = true;
        btnAddNew.Enabled_True_Asp();
        GRVPDCDetails.Enabled = true;
        gvPRDDT.Enabled = true;
        //btnAddNew.Enabled_False();

    }
    protected void ucCheckListFromDMS_Item_Selected(object Sender, EventArgs e)  // For DMS
    {

        try
        {
            hdnIsLoad.Value = "0";
            hdnPricing_ID.Value = "0";
            //FunPriResetValuesForDMS();
            int IntPricing_Id = Convert.ToInt32(ucCheckListFromDMS.SelectedValue);
            hdnPricing_ID.Value = IntPricing_Id.ToString();
            FunPriLoadCheckListFromDMSDtls(IntPricing_Id);
            rfvtxtCustomerNameLease.Enabled = false;
            ucCheckListFromDMS.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void funPriInsertTempAssetTableFromDMS(string strAction)
    {
        try
        {
            if (strAction == "6")//Create From DMS
            {
                //int intPricingIdCopyProfile = 0;
                strProParmAsset = new Dictionary<string, string>();
                strProParmAsset.Add("@OPTION", strAction);
                if (ViewState["EditSno"] != null)
                    strProParmAsset.Add("@PRICING_ASSET_ID", ViewState["EditSno"].ToString());
                strProParmAsset.Add("@COMPANYID", intCompany_Id.ToString());
                strProParmAsset.Add("@SESSION_USER_ID", intUserId.ToString());
                strProParmAsset.Add("@PROGRAMID", intProgramId.ToString());
                strProParmAsset.Add("@SESSION_ID_DOT_NET", Session.SessionID);
                strProParmAsset.Add("@PRICING_ID", hdnPricing_ID.Value);
                funPriBindAssetGridViewPaging();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }


    } // For DMS
    // DMS Integration Part End
    protected void txtOfferValidTill_TextChanged(object sender, EventArgs e)
    {
        if (txtOfferValidTill.Text != string.Empty && txtOfferDate.Text != string.Empty)
        {
            if (Utility.StringToDate(txtOfferValidTill.Text) < Utility.StringToDate(txtOfferDate.Text))
            {
                Utility.FunShowAlertMsg(this, "offer valid Till Should be greater than or Equal to Offer Date");
                txtOfferValidTill.Text = string.Empty;
                return;
            }
            if (ViewState["Offer_Validity"] != null)
            {
                int ITotalDays = (Utility.StringToDate(txtOfferValidTill.Text) - DateTime.Now).Days;
                if (ITotalDays > Convert.ToInt32(ViewState["Offer_Validity"]))
                {
                    Utility.FunShowAlertMsg(this, "offer valid Till should not exceed the ( " + ViewState["Offer_Validity"].ToString() + " ) days as per Orgination GPS Parameter");
                    txtOfferValidTill.Text = string.Empty;
                    return;
                }
            }
        }
    }


    protected void ddlRequiredF_SelectedIndexChangedDealer(object sender, EventArgs e)
    {
        DropDownList ddlRequiredF = GRVPDCDetails.FooterRow.FindControl("ddlRequiredF") as DropDownList;
        DropDownList ddlReceivedF = GRVPDCDetails.FooterRow.FindControl("ddlReceivedF") as DropDownList;
        RequiredFieldValidator RfvddlReceivedF = GRVPDCDetails.FooterRow.FindControl("RfvddlReceivedF") as RequiredFieldValidator;

        TextBox ddlCollectedByF = GRVPDCDetails.FooterRow.FindControl("ddlCollectedByF") as TextBox;
        TextBox txtCollectedDateF = GRVPDCDetails.FooterRow.FindControl("txtCollectedDateF") as TextBox;
        TextBox txtRemarksMOF = GRVPDCDetails.FooterRow.FindControl("txtRemarksMOF") as TextBox;

        TextBox ddlCADVerifiedByF = GRVPDCDetails.FooterRow.FindControl("ddlCADVerifiedByF") as TextBox;
        TextBox txtCADVerifiedDateF = GRVPDCDetails.FooterRow.FindControl("txtCADVerifiedDateF") as TextBox;
        TextBox txtCADVerifierRemarksF = GRVPDCDetails.FooterRow.FindControl("txtCADVerifierRemarksF") as TextBox;



        if (ddlRequiredF.SelectedValue == "2")
        {
            ddlReceivedF.Enabled = false;
            RfvddlReceivedF.Enabled = false;
        }
        else
        {
            ddlReceivedF.Enabled = true;
            RfvddlReceivedF.Enabled = true;
        }

        if (ddlReceivedF.SelectedValue == "2")
        {
            ddlCollectedByF.Text = string.Empty;
            txtCollectedDateF.Text = string.Empty;
            txtRemarksMOF.Text = string.Empty;
            ddlCollectedByF.Enabled = false;
            txtCollectedDateF.Enabled = false;
            txtRemarksMOF.Enabled = false;
        }
        else
        {
            ddlCollectedByF.Enabled = true;
            txtCollectedDateF.Enabled = true;
            txtRemarksMOF.Enabled = true;

            ddlCollectedByF.Text = ObjUserInfo.ProUserNameRW;
            txtCollectedDateF.Text = DateTime.Now.ToString(strDateFormat);


        }
    }


    protected void ddlRequiredF_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlRequiredF = gvPRDDT.FooterRow.FindControl("ddlRequiredF") as DropDownList;
        DropDownList ddlReceivedF = gvPRDDT.FooterRow.FindControl("ddlReceivedF") as DropDownList;
        RequiredFieldValidator RfvddlReceivedF = gvPRDDT.FooterRow.FindControl("RfvddlReceivedF") as RequiredFieldValidator;

        TextBox ddlCollectedByF = gvPRDDT.FooterRow.FindControl("ddlCollectedByF") as TextBox;
        TextBox txtCollectedDateF = gvPRDDT.FooterRow.FindControl("txtCollectedDateF") as TextBox;
        TextBox txtRemarksMOF = gvPRDDT.FooterRow.FindControl("txtRemarksMOF") as TextBox;

        TextBox ddlCADVerifiedByF = gvPRDDT.FooterRow.FindControl("ddlCADVerifiedByF") as TextBox;
        TextBox txtCADVerifiedDateF = gvPRDDT.FooterRow.FindControl("txtCADVerifiedDateF") as TextBox;
        TextBox txtCADVerifierRemarksF = gvPRDDT.FooterRow.FindControl("txtCADVerifierRemarksF") as TextBox;



        if (ddlRequiredF.SelectedValue == "2")
        {
            ddlReceivedF.Enabled = false;
            RfvddlReceivedF.Enabled = false;
        }
        else
        {
            ddlReceivedF.Enabled = true;
            RfvddlReceivedF.Enabled = true;
        }

        if (ddlReceivedF.SelectedValue == "2")
        {
            ddlCollectedByF.Text = string.Empty;
            txtCollectedDateF.Text = string.Empty;
            txtRemarksMOF.Text = string.Empty;
            ddlCollectedByF.Enabled = false;
            txtCollectedDateF.Enabled = false;
            txtRemarksMOF.Enabled = false;
        }
        else
        {
            ddlCollectedByF.Enabled = true;
            txtCollectedDateF.Enabled = true;
            txtRemarksMOF.Enabled = true;

            ddlCollectedByF.Text = ObjUserInfo.ProUserNameRW;
            txtCollectedDateF.Text = DateTime.Now.ToString(strDateFormat);


        }
    }
    protected void ddlReceived_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void FunBind_Effective_To()
    {
        try
        {

            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "793");
            Procparam.Add("@Param1", Convert.ToString(intCompany_Id));
            DataTable dtdata = Utility.GetDefaultData("S3G_ORG_GetCustomerLookUp", Procparam);
            if (dtdata.Rows.Count > 0)
            {

                ViewState["Effective_To"] = dtdata.Rows[0][0].ToString();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    protected void txtPDCstDate_TextChanged(object sender, EventArgs e)
    {
        if (txtPDCstDate.Text != string.Empty)
        {
            if (Utility.StringToDate(txtPDCstDate.Text) > Utility.StringToDate(ViewState["Effective_To"].ToString()))
            {
                Utility.FunShowAlertMsg(this, "PDC Start Date should be less than or equal to " + ViewState["Effective_To"].ToString());
                txtPDCstDate.Text = string.Empty;
                return;
            }

            if (Utility.StringToDate(txtPDCstDate.Text) < Utility.StringToDate(ViewState["IMPLEMENTATIONDATE"].ToString()))
            {
                Utility.FunShowAlertMsg(this, "PDC Start Date should be greater than or Equal to " + ViewState["Effective_To"].ToString());
                txtPDCstDate.Text = string.Empty;
                return;
            }

            if (Utility.StringToDate(txtPDCstDate.Text) < Utility.StringToDate(txtOfferDate.Text))
            {

                Utility.FunShowAlertMsg(this, "PDC Start Date should be greater or Equal to Offer date(" + txtOfferDate.Text + ")");
                txtPDCstDate.Text = string.Empty;
                txtPDCstDate.Focus();
                return;
            }
        }
        txtPDCstDate.Focus();
    }
    protected void btnViewPropect_ServerClick(object sender, EventArgs e)
    {

        if (ucCheckListFromDMS.SelectedValue == string.Empty || ucCheckListFromDMS.SelectedValue == "0")
        {
            Utility.FunShowAlertMsg(this, "Select the Proposal Number");
            return;
        }
        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
        if (hdnCID.Value == string.Empty)
        {
            string strNewWin = string.Empty;
            strNewWin = "window.open('../Origination/S3GOrgCustomerMaster_Add.aspx?IsFromEnquiry_Pros_Query=Yes& qsMode=Q&NewCustomerID=" + ucCheckListFromDMS.SelectedText + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strNewWin, true);
            this.Focus();
            return;
        }
    }
    protected void btnGoDealerDoc_Click(object sender, EventArgs e)
    {
        if (ddlDealerDoc.SelectedText == string.Empty)
        {
            ddlDealerDoc.SelectedValue = string.Empty;
        }
        if (ddlDealerDoc.SelectedValue == "0" || ddlDealerDoc.SelectedValue == "")
        {
            if (strMode == "C")
            {
                Utility.FunShowAlertMsg(this, "Select the Dealer");
                return;
            }
        }
        if (hdnSetForceValuesDealer.Value == "1")
        {
            Utility.FunShowAlertMsg(this, "Dealer Document Details Modified Update and Continue");
            return;
        }

        //ddlDealerDoc.Enabled = false;
        btnUpdateDocumentsDealer.Enabled_True();
        funPriInsertTempDocTable("8");//Dealer Wise Documents
    }
    protected void btnUpdateDocumentsDealer_ServerClick(object sender, EventArgs e)
    {
        if (hdnSetForceValuesDealer.Value == "0")
        {
            Utility.FunShowAlertMsg(this, "Dealer Document Details not Modified");
            return;
        }
        funPriInsertTempDocTable("9");//Insert Dealer Base Documents
        Utility.FunShowAlertMsg(this, "Dealer Document Details Updated Successfully");
    }
    protected void btnClearDealerDocInfo_ServerClick(object sender, EventArgs e)
    {
        if (hdnSetForceValuesDealer.Value == "1")
        {
            Utility.FunShowAlertMsg(this, "Dealer Document Details Modified Update and Continue");
            return;
        }
        btnUpdateDocumentsDealer.Enabled_False();
        ddlDealerDoc.Clear();
        ddlDealerDoc.Enabled = true;
        grvPRDDCDealer.DataSource = null;
        grvPRDDCDealer.DataBind();

    }
    protected void ddlDealType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDealType.Focus();
    }
    protected void hyplnkViewDownLoadI_Click(object sender, EventArgs e)
    {
        string strFieldAtt = ((ImageButton)sender).ClientID;
        int gRowIndex = Utility.FunPubGetGridRowID("gvPRDDT", strFieldAtt);
        Label lblPath = gvPRDDT.Rows[gRowIndex].FindControl("lblPath") as Label;
        Label lblActualPath = gvPRDDT.Rows[gRowIndex].FindControl("lblActualPathI") as Label;
        if (lblPath.Text == "")
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            return;
        }
        string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
        string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    }
    protected void hyplnkDownLoadF_Click(object sender, EventArgs e)
    {
        Label lblPath = gvPRDDT.FooterRow.FindControl("lblPathF") as Label;
        Label lblActualPath = gvPRDDT.FooterRow.FindControl("lblActualPath") as Label;
        if (lblPath.Text == "")
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            return;
        }
        string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
        string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    }
    protected void hyplnkViewDownLoadIDealer_Click(object sender, ImageClickEventArgs e)
    {
        string strFieldAtt = ((ImageButton)sender).ClientID;
        int gRowIndex = Utility.FunPubGetGridRowID("grvPRDDCDealer", strFieldAtt);
        Label lblPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblPathDealer") as Label;
        Label lblActualPath = grvPRDDCDealer.Rows[gRowIndex].FindControl("lblActualPathIDealer") as Label;
        if (lblPath.Text == "")
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            return;
        }
        string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
        string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    }
    protected void hyplnkDownLoadFDealer_Click(object sender, ImageClickEventArgs e)
    {
        Label lblPath = grvPRDDCDealer.FooterRow.FindControl("lblPathF") as Label;
        Label lblActualPath = grvPRDDCDealer.FooterRow.FindControl("lblActualPath") as Label;
        if (lblPath.Text == "")
        {
            Utility.FunShowValidationMsg(this, "ORG_PRI", 7);
            return;
        }
        string strFileName = lblActualPath.Text.Replace("\\", "/").Trim();
        string strScipt = "window.open('../Common/S3GViewFile.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
    }

    private void DefaultDealerValue()
    {
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@COMPANY_ID", Convert.ToString(intCompany_Id));
        Procparam.Add("@USERID", Convert.ToString(intUserId));
        Procparam.Add("@Program_Id", Convert.ToString(intProgramId));
        Procparam.Add("@MODE", strMode);
        Procparam.Add("@DEFAULT", "1");
        if (intPricingId != null && intPricingId > 0)
            Procparam.Add("@PRICING_ID", Convert.ToString(intPricingId));
        DataTable dtEntity = Utility.GetDefaultData("S3G_OR_GET_ENTYMAST_AGT_DOC", Procparam);
        if (dtEntity.Rows.Count > 0)
        {
            if (Convert.ToString(dtEntity.Rows[0]["id"]) != string.Empty)
            {
                ddlDealerDoc.SelectedValue = Convert.ToString(dtEntity.Rows[0]["id"]);
                ddlDealerDoc.SelectedText = Convert.ToString(dtEntity.Rows[0]["name"]);
            }
            if (dtEntity.Rows.Count == 1)
            {

            }
        }

    }
    protected void txtOfferDate_TextChanged(object sender, EventArgs e)
    {
        txtOfferValidTill.Text = Utility.StringToDate(txtOfferDate.Text).AddDays(Convert.ToInt32(ViewState["Offer_Validity"])).ToString(strDateFormat);

        if (txtPDCstDate.Text != string.Empty)
        {
            if (Utility.StringToDate(txtPDCstDate.Text) < Utility.StringToDate(txtOfferDate.Text))
            {

                Utility.FunShowAlertMsg(this, "PDC Start Date should be greater or Equal to Offer date(" + txtOfferDate.Text + ")");
                txtOfferDate.Text = string.Empty;
                txtOfferDate.Focus();
                return;
            }
        }

        txtOfferValidTill.Focus();
    }

    private void funPrintCheckLisTemp(int intPricingId, string strLobId, string strProposalNo, string strLobCode)
    {
        try
        {

            if (intPricingId == 0)
            {
                if (ViewState["PricingId"] != null)
                {
                    intPricingId = Convert.ToInt32(ViewState["PricingId"]);
                }
            }
            var filepaths = new List<string>();
            string OutputFile = Server.MapPath(".") + "\\PDF Files\\" + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss");
            if (strLobCode.ToUpper() == "FT" || strLobCode.ToUpper() == "TL" || strLobCode.ToUpper() == "WC")
            {
                DataTable dtASSETPRINT = (DataTable)ViewState["ASSETPRINT"];
                String strHTML = String.Empty;
                strHTML = FunPubGetTemplateContent(intCompany_Id, strLobId, cmbLocation.SelectedValue, cmbLocation.SelectedValue, 9, intPricingId.ToString());

                if (strHTML == "")
                {
                    Utility.FunShowValidationMsg(this, "ORG_PRI", 12);
                    return;
                }
                string FileName = PDFPageSetup.FunPubGetFileName(strProposalNo + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss"));
                string FilePath = Server.MapPath(".") + "\\PDF Files\\";
                string DownFile = FilePath + FileName + ".pdf";
                //SaveDocument(strHTML, strProposalNo, FilePath, FileName, "0", "0", "0", intPricingId, strLobCode);
                string strFileEmail = FileName + "Email";
                string DownFile2 = FilePath + strFileEmail + ".pdf";
                SaveDocumentTemp(strHTML, strProposalNo, FilePath, strFileEmail, "0", "0", "0", intPricingId, strLobCode);
                filepaths.Add(DownFile2);
                WaterMarkPages((1).ToString(), DownFile2, DownFile2, "");
                //DeletePages((1).ToString(), DownFile2, DownFile2, "");
                if (!File.Exists(DownFile2))
                {
                    DownFile2 = null;
                }
                funPriSendEmailTemp(dtASSETPRINT, DownFile2, dtASSETPRINT.Rows[0]["ENTITY_ID"].ToString(), strLobId, intPricingId.ToString());
            }
            else
            {
                if (ViewState["ASSETPRINT"] == null)
                {
                    //Utility.FunShowAlertMsg(this, "Asset Details Not Available");
                    //return;
                }
                int iRowCount = 0;
                if (ViewState["ASSETPRINT"] != null)
                {
                    DataTable dtASSETPRINT = (DataTable)ViewState["ASSETPRINT"];
                    iRowCount = dtASSETPRINT.Rows.Count;
                    if (dtASSETPRINT.Rows.Count > 0)
                    {
                        string strDownLoadFile3 = string.Empty;
                        foreach (DataRow dr in dtASSETPRINT.Rows)
                        {
                            String strHTML = String.Empty;
                            strHTML = FunPubGetTemplateContent(intCompany_Id, strLobId, cmbLocation.SelectedValue, cmbLocation.SelectedValue, 9, intPricingId.ToString());

                            if (strHTML == "")
                            {
                                Utility.FunShowValidationMsg(this, "ORG_PRI", 12);
                                return;
                            }
                            string FileName = PDFPageSetup.FunPubGetFileName(strProposalNo + intUserId + DateTime.Now.ToString("ddMMMyyyyHHmmss"));

                            string FilePath = Server.MapPath(".") + "\\PDF Files\\";
                            string DownFile = FilePath + FileName + ".pdf";
                            //SaveDocument(strHTML, strProposalNo, FilePath, FileName, dr["entity_id"].ToString(), dr["no_of_units"].ToString(), dr["PAY_TO"].ToString(), intPricingId, strLobCode);
                            strDownLoadFile3 = DownFile;

                            string strFileEmail = FileName + "Email";
                            string DownFile2 = FilePath + strFileEmail + ".pdf";
                            SaveDocumentTemp(strHTML, strProposalNo, FilePath, strFileEmail, dr["entity_id"].ToString(), dr["no_of_units"].ToString(), dr["PAY_TO"].ToString(), intPricingId, strLobCode);
                            filepaths.Add(DownFile2);
                            WaterMarkPages((1).ToString(), DownFile2, DownFile2, "");
                            if (!File.Exists(DownFile2))
                            {
                                DownFile2 = null;
                            }
                            funPriSendEmailTemp(dtASSETPRINT, DownFile2, dr["ENTITY_ID"].ToString(), strLobId, intPricingId.ToString());


                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void SaveDocumentTemp(string strHTML, string ReferenceNumber, string FilePath, string FileName, string strEntityId, string strNooUnits, string strEntityType, int intPricingId, string strLobCode)
    {
        try
        {
            Dictionary<string, string> dictParam;
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@COMPANY_ID", Convert.ToString(intUserId));
            dictParam.Add("@pricing_id", intPricingId.ToString());
            dictParam.Add("@EntityId", strEntityId);
            dictParam.Add("@NooUnits", strNooUnits);
            dictParam.Add("@mode", "M");
            dictParam.Add("@Lob_Code", strLobCode);
            dictParam.Add("@EntityType", strEntityType);

            DataSet dsHeader = new DataSet();
            dsHeader = Utility.GetDataset("S3G_OR_GET_PRICGDET_PRINT", dictParam);

            if (dsHeader.Tables[3].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[3].Rows.Count;
                if (strHTML.Contains("~tbdocuments~"))
                    strHTML = FunPubBindTable("~tbdocuments~", strHTML, dsHeader.Tables[3]);
            }
            else
            {
                Utility.FunShowAlertMsg(this, "CheckList Documents Detail Not Exists");
                return;
            }

            if (dsHeader.Tables[2].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[2].Rows.Count;
                if (strHTML.Contains("~tbAsset~"))
                    strHTML = FunPubBindTable("~tbAsset~", strHTML, dsHeader.Tables[2]);
            }
            else
            {
                if (hdnLobCode.Value.ToString().ToUpper() == "FT" || hdnLobCode.Value.ToString().ToUpper() == "TL" || hdnLobCode.Value.ToString().ToUpper() == "WC")
                {

                }
                else
                {
                    strHTML = FunPubDeleteTable("~tbAsset~", strHTML);
                }
            }

            if (dsHeader.Tables[4].Rows.Count > 0)
            {
                IDocumentCount = dsHeader.Tables[4].Rows.Count;
                if (strHTML.Contains("~pdc~"))
                    strHTML = FunPubBindTable("~pdc~", strHTML, dsHeader.Tables[4]);
            }
            else
            {
                strHTML = FunPubDeleteTable("~pdc~", strHTML);
            }


            if (dsHeader.Tables[0].Rows.Count > 0)
                strHTML = PDFPageSetup.FunPubBindCommonVariables(strHTML, dsHeader.Tables[0]);

            List<string> listImageName = new List<string>();
            listImageName.Add("~CompanyLogo~");
            //listImageName.Add("~InvoiceSignStamp~");
            //listImageName.Add("~POSignStamp~");
            List<string> listImagePath = new List<string>();
            listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/CompanyLogo.png"));
            //listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/InvoiceSignStamp.png"));
            //listImagePath.Add(Server.MapPath("../Images/TemplateImages/" + CompanyId + "/POSignStamp.png"));

            strHTML = PDFPageSetup.FunPubBindImages(listImageName, listImagePath, strHTML.TrimEnd());
            PDFPageSetup.FunPubSaveDocument(strHTML.Trim(), FilePath, FileName, "P", 1, ObjS3GSession.ProDateFormatRW);
        }
        catch (Exception ex)
        {

            return;
        }
    }

    public void WaterMarkPages(string pageRange, string SourcePdfPath, string OutputPdfPath, string str)
    {

        List<int> pagesToDelete = new List<int>();
        Document doc = new Document();
        PdfReader reader = new PdfReader(SourcePdfPath, new System.Text.ASCIIEncoding().GetBytes(""));


        using (MemoryStream memoryStream = new MemoryStream())
        {
            PdfWriter writer = PdfWriter.GetInstance(doc, memoryStream);


            //PdfWriter pdfWriter = PdfWriter.GetInstance(doc, memoryStream);
            if (ddlStatus.SelectedItem.Text.Trim() != string.Empty)
            {
                writer.PageEvent = new PdfWriterEvents(ddlStatus.SelectedItem.Text);
            }
            else
            {
                writer.PageEvent = new PdfWriterEvents("PENDING");
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
    protected void hyplnkDownload_Click(object sender, EventArgs e)
    {


        string strScipt = string.Empty;
        string strNewFilePath = string.Empty;
        ImageButton lnkView = (ImageButton)sender;
        GridViewRow grv = (GridViewRow)lnkView.Parent.Parent;
        Label lblSNo = (Label)grv.FindControl("lblSNo");
        DataTable dt = (DataTable)ViewState["UploadedFiles"];

        DataRow[] dRowArray = dt.Select("Serial_No='" + lblSNo.Text + "'");
        if (dRowArray.Length == 0)
        {
            IsImageUploaded = false;
            ViewState["IsImageUploaded"] = IsImageUploaded.ToString();

            Utility.FunShowAlertMsg(this, "No files Uploaded yet for this document");
            return;
        }
        else
        {
            List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
            foreach (DataRow d in dRowArray)
            {
                string strPath = Server.MapPath("..\\PreDDImages\\");
                if (strPath.EndsWith("\\"))
                {
                    strPath = strPath.Remove(strPath.Length - 1);
                }
                Uri pathUri = new Uri(strPath, UriKind.Absolute);
                strNewFilePath = Path.GetFullPath(strPath) + (d["FileName"].ToString());
                Uri pathUri1 = new Uri(strNewFilePath, UriKind.Absolute);
                if (File.Exists(strNewFilePath))
                {
                    File.Delete(strNewFilePath);
                }
                File.Copy(d["Scanned_Ref_No"].ToString(), strNewFilePath);
                AjaxControlToolkit.Slide objItem = new AjaxControlToolkit.Slide();
                objItem.Name = Path.GetFileNameWithoutExtension(d["FileName"].ToString());
                objItem.ImagePath = pathUri.MakeRelativeUri(pathUri1).ToString();
                objItem.Description = ucCustomerCodeLov.SelectedText;
                slides.Add(objItem);
            }
            IsImageUploaded = true;
            ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
            MPUploadFiles.Show();
        }
        string strnewFile = strNewFilePath;
        FileInfo fileInfo = new FileInfo(strnewFile);
        strScipt = "window.open('../Common/S3GViewFileCheckList.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsFileExtn=" + fileInfo.Extension + "  &qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "CheckList", strScipt, true);
    }
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        try
        {
            string strFieldAtt = ((LinkButton)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("grvUploadedFiles", strFieldAtt);
            GridViewRow grv = (GridViewRow)grvUploadedFiles.Rows[gRowIndex];
            Label lblSerialNo = (Label)grv.FindControl("lblSerialNo");
            DataTable dt = (DataTable)ViewState["UploadedFiles"];
            dt.Rows.RemoveAt(gRowIndex);
            if (dt.Rows.Count > 0)
            {
                grvUploadedFiles.DataSource = dt;
                grvUploadedFiles.DataBind();
                ViewState["UploadedFiles"] = dt;
                IsImageUploaded = true;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
            }
            else
            {
                grvUploadedFiles.DataSource = null;
                grvUploadedFiles.EmptyDataText = "No Records Found..";
                grvUploadedFiles.DataBind();
                IsImageUploaded = false;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
            }
            MPUploadFiles.Show();
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void grvUploadedFiles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //LinkButton lnkDelete = (LinkButton)sender;
            GridViewRow grv = (GridViewRow)grvUploadedFiles.Rows[e.RowIndex];
            Label lblSerialNo = (Label)grv.FindControl("lblSerialNo");
            DataTable dt = (DataTable)ViewState["UploadedFiles"];
            dt.Rows.RemoveAt(e.RowIndex);
            if (dt.Rows.Count > 0)
            {
                grvUploadedFiles.DataSource = dt;
                grvUploadedFiles.DataBind();
                ViewState["UploadedFiles"] = dt;
                IsImageUploaded = true;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
            }
            else
            {
                grvUploadedFiles.DataSource = null;
                grvUploadedFiles.EmptyDataText = "No Records Found..";
                grvUploadedFiles.DataBind();
                IsImageUploaded = false;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
            }
            MPUploadFiles.Show();
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void grvUploadedFiles_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkDelete = (LinkButton)e.Row.FindControl("lnkDelete");
                CheckBox chkSelect = (CheckBox)e.Row.FindControl("chkSelect");

                chkSelect.Attributes.Add("onclick", "fnUnselectAllExpectSelected(this)");


                if (strMode == "Q")
                {
                    lnkDelete.Enabled = false;
                }
            }
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void hyplnkView_Click1(object sender, EventArgs e)
    {
        try
        {
            ImageButton lnkView = (ImageButton)sender;
            GridViewRow grv = (GridViewRow)lnkView.Parent.Parent;
            Label lblSNo = (Label)grv.FindControl("lblSNo");
            DataTable dt = (DataTable)ViewState["UploadedFiles"];

            DataRow[] dRowArray = dt.Select("Serial_No='" + lblSNo.Text + "'");
            if (dRowArray.Length == 0)
            {
                IsImageUploaded = false;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();

                Utility.FunShowAlertMsg(this, "No files Uploaded yet for this document");
                return;
            }
            else
            {
                List<AjaxControlToolkit.Slide> slides = new List<AjaxControlToolkit.Slide>();
                foreach (DataRow d in dRowArray)
                {
                    string strPath = Server.MapPath("..\\PreDDImages\\");
                    if (strPath.EndsWith("\\"))
                    {
                        strPath = strPath.Remove(strPath.Length - 1);
                    }
                    Uri pathUri = new Uri(strPath, UriKind.Absolute);
                    string strNewFilePath = Path.GetFullPath(strPath) + (d["FileName"].ToString());

                    if (!ValidateViewFileExtn(strNewFilePath))
                    {
                        return;
                    }


                    Uri pathUri1 = new Uri(strNewFilePath, UriKind.Absolute);
                    if (File.Exists(strNewFilePath))
                    {
                        File.Delete(strNewFilePath);
                    }
                    File.Copy(d["Scanned_Ref_No"].ToString(), strNewFilePath);
                    AjaxControlToolkit.Slide objItem = new AjaxControlToolkit.Slide();
                    objItem.Name = Path.GetFileNameWithoutExtension(d["FileName"].ToString());
                    objItem.ImagePath = pathUri.MakeRelativeUri(pathUri1).ToString();
                    objItem.Description = ucCustomerCodeLov.SelectedText;
                    slides.Add(objItem);
                }

                Session["SlideData"] = slides;
                string strScipt = "window.open('..//../S3G_ORG_PRDDCDocViewer.aspx', 'newwindow','toolbar=no,location=no,menubar=no,resizable=yes,scrollbars=yes');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", strScipt, true);
                this.Focus();

                IsImageUploaded = true;
                ViewState["IsImageUploaded"] = IsImageUploaded.ToString();
                MPUploadFiles.Show();
            }
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void btnUploadCancel_Click(object sender, EventArgs e)
    {
        MPUploadFiles.Hide();
    }
    protected void btnCancelRemarkHis_Click(object sender, EventArgs e)
    {
        MPERemarkHistory.Hide();
    }
    private void FunPriInitiateFileUploadPopUpGrid()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("SNo");
        dt.Columns.Add("Serial_No");
        dt.Columns.Add("FileName");
        dt.Columns.Add("Scanned_Ref_No");
        dt.Columns.Add("Remarks");
        ViewState["UploadedFiles"] = dt;
    }
    private void funPriSendEmailTemp(DataTable dtBaseInfor, string strFileName, string strEntityId, string strLobId, string strPricingId)
    {
        try
        {
            string strMAILHTML = string.Empty;
            string strREMAINDER_OUTPUT = string.Empty;
            string strTo_User = string.Empty;
            string strTo_User_Log_UserMail = string.Empty;

            System.Data.DataTable dt = new System.Data.DataTable();
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", Convert.ToString(intCompany_Id));
            Procparam.Add("@Lob_Id", strLobId);
            Procparam.Add("@Location_ID", cmbLocation.SelectedValue);
            Procparam.Add("@language", "1");
            Procparam.Add("@Template_Type_Code", "112");
            dt = Utility.GetDefaultData("S3G_Get_TemplateCont", Procparam);


            DataTable dtUsermailAddress;
            Dictionary<string, string> Procparammail2;
            Procparammail2 = new Dictionary<string, string>();
            Procparammail2.Add("@Company_Id", Convert.ToString(intCompany_Id));
            Procparammail2.Add("@USER_ID", ObjUserInfo.ProUserIdRW.ToString());
            Procparammail2.Add("@PROGRAM_ID", intProgramId.ToString());
            Procparammail2.Add("@USER_TYPE_ID", "2");//Entity
            Procparammail2.Add("@ALERTS_USERCONTACT", strEntityId);
            Procparammail2.Add("@Template_Type_Code", "104");
            dtUsermailAddress = Utility.GetDefaultData("CMN_GET_USER_MAILADDRESS", Procparammail2);

            if (dtUsermailAddress.Rows.Count > 0)
            {
                strTo_User = dtUsermailAddress.Rows[0]["USER_MAIL"].ToString();
                strTo_User_Log_UserMail = dtUsermailAddress.Rows[0]["LOG_USER_MAIL"].ToString();
            }


            strMAILHTML = dt.Rows[0]["Template_Content"].ToString();
            strMAILHTML = PDFPageSetup.FunPubBindCommonVariables(strMAILHTML, dtUsermailAddress);
            string strImagePath = String.Empty;
            if (strMAILHTML.Contains("~CompanyLogo~"))
            {
                strImagePath = Server.MapPath("../Images/TemplateImages/CompanyLogo.png");
                strMAILHTML = PDFPageSetup.FunPubBindImages("~CompanyLogo~", strImagePath, strMAILHTML);
            }

            //Get Mail Setup
            System.Data.DataTable dtmaiisetup = new System.Data.DataTable();
            Dictionary<string, string> Procparammail;
            Procparammail = new Dictionary<string, string>();
            Procparammail.Add("@Company_Id", Convert.ToString(intCompany_Id));
            Procparammail.Add("@USER_ID", Convert.ToString(intUserId));
            Procparammail.Add("@PROGRAM_ID", "42");
            Procparammail.Add("@Template_Type_Code", "112");
            dtmaiisetup = Utility.GetDefaultData("CMN_GET_MAILDETAILS", Procparammail);
            if (dtmaiisetup.Rows.Count > 0)
            {
            }
            //Assign Mail setup in variables
            string strFrom_User = dtmaiisetup.Rows[0]["FROM_MAIL"].ToString();
            string strTo_User_From_SetupTable = dtmaiisetup.Rows[0]["TO_MAIL"].ToString();
            string strCC_User = dtmaiisetup.Rows[0]["CC_MAIL"].ToString();
            string strBCC_User = dtmaiisetup.Rows[0]["BCC_MAIL"].ToString();
            string strSubject = dtmaiisetup.Rows[0]["SUBJECT"].ToString();
            string strDisplayName = dtmaiisetup.Rows[0]["DISPLAY_NAME"].ToString();
            string strSchedueType = dtmaiisetup.Rows[0]["SCHEDULE_TYPE"].ToString();
            string strConfigType = dtmaiisetup.Rows[0]["CONFIG_TYPE"].ToString();


            string strACCOUNT_INS_DETAILS_ID = strPricingId;
            string strAttachment_Path = string.Empty;
            string strPathwithFile = string.Empty;
            if (strFileName != null)
            {
                strAttachment_Path = strFileName.ToString();
                strPathwithFile = strAttachment_Path + "\\" + strREMAINDER_OUTPUT;
            }
            string strCUST_EMAIL = strTo_User;
            if (strConfigType == "1") // 1 - Actual
            {
                strTo_User = strCUST_EMAIL.ToString() + "," + strTo_User_From_SetupTable;
            }
            else
            {
                strTo_User = strTo_User_From_SetupTable.ToString();
            }


            if (strTo_User_Log_UserMail != string.Empty)
            {
                strTo_User = strTo_User + "," + strTo_User_Log_UserMail;
            }
            //Attachement
            if (strFileName != null)
            {
                strREMAINDER_OUTPUT = strFileName.ToString();
            }

            //Send Mail
            if (strSchedueType.ToString() == "1" && strTo_User != "" && strTo_User != string.Empty) //  1 - Immediate; 
            {
                StringBuilder strBody = new StringBuilder();
                Dictionary<string, string> dictMail = new Dictionary<string, string>();
                //dictMail.Add("FromMail", "sflcasarray.sundaramfinance.in");
                dictMail.Add("FromMail", strFrom_User.ToString());
                dictMail.Add("ToMail", strTo_User);
                dictMail.Add("ToCC", strCC_User);
                dictMail.Add("ToBCC", strBCC_User);
                dictMail.Add("Subject", strSubject.ToString());
                dictMail.Add("DisplayName", strDisplayName.ToString());
                System.Collections.ArrayList arrMailAttachement = new ArrayList();
                if (strFileName != null)
                {

                    arrMailAttachement.Add(strFileName);
                }
                strBody.Append(strMAILHTML);
                FunPubSentMailInner(dictMail, arrMailAttachement, strBody);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            //Utility.FunShowAlertMsg(this, ex.ToString());
            return;
        }

    }

    public void FunPubSentMailInner(Dictionary<string, string> dictMail, ArrayList arrMailAttachement, StringBuilder strBody)
    {
        if (dictMail["ToMail"].Trim() != "")
        {
            try
            {
                ClsPubCOM_MailInner ObjCom_Mail = new ClsPubCOM_MailInner();
                ObjCom_Mail.ProFromRW = dictMail["FromMail"];
                ObjCom_Mail.ProTORW = dictMail["ToMail"];
                ObjCom_Mail.ProSubjectRW = dictMail["Subject"];
                ObjCom_Mail.ProMessageRW = strBody.ToString();// dictMail["Body"];
                if (dictMail.ContainsKey("ToCC") && dictMail["ToCC"].ToString() != "")
                    ObjCom_Mail.ProCCRW = dictMail["ToCC"];
                if (dictMail.ContainsKey("ToBCC") && dictMail["ToBCC"].ToString() != "")
                    ObjCom_Mail.ProBCCRW = dictMail["ToBCC"];
                if (arrMailAttachement != null && arrMailAttachement.Count > 0)
                    ObjCom_Mail.ProFileAttachementRW = arrMailAttachement;
                FunSendMailFinal(ObjCom_Mail);
            }

            catch (Exception ex)
            {
                //throw ex;
                ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
                //Utility.FunShowAlertMsg(this,ex.ToString());
                //return;
            }
            finally
            {

            }
        }
    }

    public void FunSendMailFinal(ClsPubCOM_MailInner ObjComMail)
    {
        string strSMTPNAME = string.Empty;
        try
        {
            strSMTPNAME = ConfigurationManager.AppSettings.Get("SMTPServer");
        }
        catch
        {
            strSMTPNAME = "";
        }
        try
        {
            MailMessage ObjMailMessage = new MailMessage();
            string[] arrToEMail;
            string[] arrCCEMail;
            string[] arrBCcEMail;

            ObjMailMessage.From = new MailAddress(ObjComMail.ProFromRW);

            arrToEMail = ObjComMail.ProTORW.Split(new char[] { ',' });

            foreach (string strMailAddress in arrToEMail)
            {
                if (!string.IsNullOrEmpty(strMailAddress.Trim()))
                {
                    ObjMailMessage.To.Add(strMailAddress);
                }
            }

            if (!string.IsNullOrEmpty(ObjComMail.ProCCRW))
            {
                arrCCEMail = ObjComMail.ProCCRW.Split(new char[] { ',' });
                foreach (string strMailAddress in arrCCEMail)
                {
                    if (!string.IsNullOrEmpty(strMailAddress.Trim()))
                    {
                        ObjMailMessage.CC.Add(strMailAddress);
                    }
                }
            }

            if (!string.IsNullOrEmpty(ObjComMail.ProBCCRW))
            {
                arrBCcEMail = ObjComMail.ProBCCRW.Split(new char[] { ',' });
                foreach (string strMailAddress in arrBCcEMail)
                {
                    if (!string.IsNullOrEmpty(strMailAddress.Trim()))
                    {
                        ObjMailMessage.Bcc.Add(strMailAddress);
                    }
                }
            }
            ObjMailMessage.Subject = string.IsNullOrEmpty(ObjComMail.ProSubjectRW) ? string.Empty : ObjComMail.ProSubjectRW;
            ObjMailMessage.IsBodyHtml = true;
            ObjMailMessage.Body = ObjComMail.ProMessageRW;
            ObjMailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess & DeliveryNotificationOptions.Delay & DeliveryNotificationOptions.OnFailure;

            if (ObjComMail.ProFileAttachementRW != null)
            {
                foreach (string ObjAttachmentCollection in ObjComMail.ProFileAttachementRW)
                {
                    if (!string.IsNullOrEmpty(ObjAttachmentCollection))
                    {
                        Attachment objAttachmentS = new Attachment(ObjAttachmentCollection);
                        ObjMailMessage.Attachments.Add(objAttachmentS);
                    }
                }
            }
            ObjMailMessage.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            SmtpClient ObjClient = new SmtpClient(strSMTPNAME);
            ObjClient.Credentials = System.Net.CredentialCache.DefaultNetworkCredentials;
            ObjClient.UseDefaultCredentials = false;
            ObjClient.Send(ObjMailMessage);

        }
        catch (Exception ex)
        {
            throw ex;
            //Utility.FunShowAlertMsg(this,ex.ToString());
            //return;
        }

    }
    private void funPriLoadRemarks(string DocCatID, string PRICINGDOCID)
    {
        try
        {
            DataTable dtRemarkHistory = new DataTable();
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("@CompanyId", intCompany_Id.ToString());
            strProParm.Add("@UserId", intCompany_Id.ToString());
            strProParm.Add("@DocCatID", DocCatID);
            strProParm.Add("@PRICINGDOCID", PRICINGDOCID);
            strProParm.Add("@PricingId", intPricingId.ToString());
            dtRemarkHistory = Utility.GetDefaultData("S3G_ORG_PRI_GET_RMRK_HIS", strProParm);
            grvRemarkHistory.DataSource = dtRemarkHistory;
            grvRemarkHistory.EmptyDataText = "No Remarks History Exists";
            grvRemarkHistory.DataBind();
            MPERemarkHistory.Show();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void ImgButtonViewPrvRemarks_Click(object sender, EventArgs e)
    {
        try
        {
            MyIframeOpenFile.Src = null;
            int intRowIndex = Utility_FA.FunPubGetGridRowID("gvPRDDT", ((Button)sender).ClientID);
            Label lblTDocType = gvPRDDT.Rows[intRowIndex].FindControl("lblTDocType") as Label;
            Label lblPRICINGDOCID = gvPRDDT.Rows[intRowIndex].FindControl("lblPRICINGDOCID") as Label;
            funPriLoadRemarks(lblTDocType.Text, lblPRICINGDOCID.Text);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    protected void ImgButtonViewPrvRemarksDeal_Click(object sender, EventArgs e)
    {
        try
        {
            MyIframeOpenFile.Src = null;
            int intRowIndex = Utility_FA.FunPubGetGridRowID("grvPRDDCDealer", ((Button)sender).ClientID);
            Label lblTDocType = grvPRDDCDealer.Rows[intRowIndex].FindControl("lblTDocType") as Label;
            Label lblPRICINGDOCID = grvPRDDCDealer.Rows[intRowIndex].FindControl("lblPRICINGDOCID") as Label;
            funPriLoadRemarks(lblTDocType.Text, lblPRICINGDOCID.Text);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }

}

public static class ClassExtendPricing
{
    public static void ToUpper(this DropDownList dropDown)
    {
        foreach (System.Web.UI.WebControls.ListItem t in dropDown.Items)
            t.Text = t.ToString().ToUpper();
    }
    public static void Enabled_False_Asp(this Button btn)
    {
        btn.Enabled = false;
        btn.CssClass = "cancel_btn fa fa-times";
    }
    public static void Enabled_True_Asp(this Button btn)
    {
        btn.Enabled = true;
        btn.CssClass = "grid_btn";
    }
    public static void Enabled_False_Asp(this LinkButton btn)
    {
        btn.Enabled = false;
        btn.CssClass = "grid_btn_delete fa fa-times";
    }

    public static void Enabled_False_Link_Asp(this LinkButton btn)
    {
        btn.Enabled = false;
        btn.CssClass = "grid_btn_delete_disabled";
    }

    public static void Enabled_True_Link_Asp(this LinkButton btn)
    {
        btn.Enabled = true;
        btn.CssClass = "grid_btn";
    }

    public static void Enabled_True_Asp(this LinkButton btn)
    {
        btn.Enabled = true;
        btn.CssClass = "grid_btn";
    }
}
public class ClsPubCOM_MailInner
{
    #region properties

    public string ProFromRW
    {
        get;
        set;
    }
    public string ProTORW
    {
        get;
        set;
    }
    public string ProCCRW
    {
        get;
        set;
    }
    public string ProBCCRW
    {
        get;
        set;
    }
    public string ProSubjectRW
    {
        get;
        set;
    }
    public string ProMessageRW
    {
        get;
        set;
    }
    public ArrayList ProFileAttachementRW
    {
        get;
        set;
    }
    #endregion
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
        float fontSize = 80;
        float xPosition = iTextSharp.text.PageSize.A4.Width / 2;
        float yPosition = (iTextSharp.text.PageSize.A4.Height - 140f) / 2;
        float angle = 45;
        try
        {
            PdfContentByte under = writer.DirectContentUnder;
            BaseFont baseFont = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.WINANSI, BaseFont.EMBEDDED);
            under.BeginText();
            under.SetColorFill(BaseColor.LIGHT_GRAY);
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
