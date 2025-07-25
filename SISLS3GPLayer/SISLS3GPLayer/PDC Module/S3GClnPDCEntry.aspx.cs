/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved

/// <Program Summary>
/// Module Name               : Collection 
/// Screen Name               : PDC Entry 
/// Created By                : Irsathameen .K
/// Created Date              : 15-OCT-2010
/// Purpose                   : 
/// Last Updated By           : Chandra Sekhar BS
/// Last Updated Date         : 19-Sep-2013
/// Reason                    : SQL Performance



/// <Program Summary>

#region Namespaces

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
using System.Globalization;
using System.ServiceModel;
using Resources;
using S3GBusEntity;
using S3GBusEntity.Collection;
using System.Text;
using System.IO;

#endregion

public partial class Collection_S3GClnPDCEntry : ApplyThemeForProject
{
    #region Variable Declaration
    public static Collection_S3GClnPDCEntry obj_Page;
    ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient ObjPDCEntryClient;
    S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable ObjS3G_CLN_PDCModuleDataTable = null;
    SerializationMode SerMode = SerializationMode.Binary;
    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    //Code end

    int intCompanyID, intUserID, i, intErrCode = 0, intGPSPrefix = 0, intGPSSuffix = 0;
    int intProgramId = 106;
    long endno;

    DataTable dt = new DataTable();
    Dictionary<string, string> dictParam = null;
    Dictionary<string, string> Procparam = null;
    StringBuilder strbDraweebankDet = new StringBuilder();
    UserInfo ObjUserInfo = new UserInfo();
    S3GSession ObjS3GSession = new S3GSession();

    string strPDCID = "";
    static string strPageName = "PDC Entry";
    string strProgramName = string.Empty;
    string StrXMLPDC, strPDCNo, strchequeNo, s, strexistingdate;
    string strRedirectPage = "../PDC Module/S3GClnTransLander.aspx?Code=CPM";
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strDateFormat = string.Empty;
    string strRedirectPageAdd = "window.location.href='../PDC Module/S3GClnPDCEntry.aspx';";
    string strRedirectPageView = "window.location.href='../PDC Module/S3GClnTransLander.aspx?Code=CPM';";
    DataTable dtWorkFlow = new DataTable();
    string StrPreBank = "";

    #endregion

    #region Page Events

    protected void Page_Load(object sender, EventArgs e)
    {
        obj_Page = this;
        try
        {
            ProgramCode = "106";
            FunPriLoadPage();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLN_CCR_10 + " PDC entry details";
            CVPDCEntry.IsValid = false;
        }
    }

    #endregion

    #region DropDownList Events

    protected void ddlLOB_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriClearcontrols();

            //if (ddlPAN.Items.Count > 0)
            //{
            //    ddlPAN.SelectedIndex = 0;
            //    ddlPAN.ClearDropDownList();
            //}
            //if (ddlSAN.Items.Count > 0)
            //{
            //    ddlSAN.SelectedIndex = 0;
            //    ddlSAN.ClearDropDownList();
            //}
            //if (ddlBranch.Items.Count > 0)
            //    ddlBranch.SelectedIndex = 0;
            //LoadPrimeAccNo();
            //ddlBranch.Items.Clear();

            FunPriGetBankNames();
            //CustomerDetails1.ClearCustomerDetails();
            ucCustomerCodeLov.FunPubClearControlValue();


            ddlLOB.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_1;
            CVPDCEntry.IsValid = false;
        }
    }

    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriClearcontrols();
            //if (ddlPAN.Items.Count > 0)
            //{
            //    ddlPAN.SelectedIndex = 0;
            //    ddlPAN.ClearDropDownList();
            //}
            //if (ddlSAN.Items.Count > 0)
            //{
            //    ddlSAN.SelectedIndex = 0;
            //    ddlSAN.ClearDropDownList();
            //}

            ucCustomerCodeLov.FunPubClearControlValue();
            //LoadPrimeAccNo();
            FunPriGetBankNames();
            //CustomerDetails1.ClearCustomerDetails();
            ViewState["CustomerID"] = null;
            ddlBranch.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_1;
            CVPDCEntry.IsValid = false;
        }
    }

    protected void ddlPDCNature_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriPDCNatureChange();
            ddlPDCNature.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void BindAccountInfor()
    {

    }

    protected void ddlSAN_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txtFromInstallmentNo.Text = hdnFromInstallmentNo.Value = string.Empty;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_2;
            CVPDCEntry.IsValid = false;
        }
    }

    protected void ddlPDCStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int intRowID = Utility.FunPubGetGridRowID("GRVPDCDetails", ((DropDownList)sender).ClientID.ToString());
            DropDownList ddlPDCStatus = (DropDownList)GRVPDCDetails.Rows[intRowID].FindControl("ddlPDCStatus");
            TextBox txtRevisedBankDate = (TextBox)GRVPDCDetails.Rows[intRowID].FindControl("txtRevisedBankDate");
            AjaxControlToolkit.CalendarExtender CERevisedBankDate = (AjaxControlToolkit.CalendarExtender)GRVPDCDetails.Rows[intRowID].FindControl("CERevisedBankDate");
            Label lblStatus = (Label)GRVPDCDetails.Rows[intRowID].FindControl("lblStatus");
            Label lblUserID = (Label)GRVPDCDetails.Rows[intRowID].FindControl("lblUserID");
            Label lblTxnDate = (Label)GRVPDCDetails.Rows[intRowID].FindControl("lblTxnDate");
            if (ddlPDCStatus.SelectedValue == "2")
            {
                Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message1));
                ddlPDCStatus.SelectedValue = lblStatus.Text;
                lblStatus.Text = ddlPDCStatus.SelectedValue;
                return;
            }
            if (ddlPDCStatus.SelectedValue == "1")
            {
                txtRevisedBankDate.ReadOnly = false;
                CERevisedBankDate.Enabled = true;
            }
            else
            {
                txtRevisedBankDate.ReadOnly = true;
                CERevisedBankDate.Enabled = false;
            }
            lblStatus.Text = ddlPDCStatus.SelectedValue;
            lblUserID.Text = intUserID.ToString();
            lblTxnDate.Text = "1";
            ddlPDCStatus.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.IsValid = false;
        }
    }

    protected void ddlInstrmentSequence_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            pnlGRDSeqYes.Visible = false;
            if (ddlInstrmentSequence.SelectedValue == "1")
            {
                RFVInstrumentStartNo.Enabled = true;
                //rfvMICR.Enabled = true;

                lblMICR.Enabled = txtMICR.Enabled = lblInstrumentType.Enabled = ddlInstrmentType.Enabled =
                    RFVInstrumentType.Visible = txtInstrumentStartNo.Enabled = lblInstrumentStartNo.Enabled = lblDraweeBank.Enabled = true;

            }
            else if (ddlInstrmentSequence.SelectedValue == "2")
            {
                txtInstrumentStartNo.Enabled = lblMICR.Enabled =
                lblInstrumentStartNo.Enabled = lblDraweeBank.Enabled =
                RFVInstrumentStartNo.Visible = false;
                txtInstrumentStartNo.Text = string.Empty;

                //txtMICR.Enabled = 
                //txtMICR.Text = 
                //rfvMICR.Visible = 
            }
            ddlInstrmentSequence.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.IsValid = false;
        }
    }

    protected void ddlDraweeBank_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            FunPriGetAccRepayAmount();
            if (GRVPDCDetails != null && GRVPDCDetails.Rows.Count > 0)
            {
                foreach (GridViewRow grvRow in GRVPDCDetails.Rows)
                {
                    UserControls_S3GAutoSuggest ucgvDraweeBank = (UserControls_S3GAutoSuggest)grvRow.FindControl("ucgvDraweeBank");
                    ucgvDraweeBank.SelectedText = Convert.ToString(ddlDraweeBank.SelectedText);
                    ucgvDraweeBank.SelectedValue = Convert.ToString(ddlDraweeBank.SelectedValue);

                    DropDownList ddlDepositBank = (DropDownList)grvRow.FindControl("ddlDepositBank");
                    ddlDepositBank.BindDataTable(ViewState["Dep_Bank"] as DataTable);
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void ucgvDraweeBank_Item_Selected(object sender, EventArgs e)
    {
        int intCurrentRow = ((GridViewRow)((Button)sender).Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent).RowIndex;

        UserControls_S3GAutoSuggest ucgvDraweeBank = GRVPDCDetails.Rows[intCurrentRow].FindControl("ucgvDraweeBank") as UserControls_S3GAutoSuggest;

        DataTable ObjDt;
        ObjDt = FunPriGetDepositinGrid(ucgvDraweeBank.SelectedText, ucgvDraweeBank.SelectedValue);

        DropDownList ddlDepositBank = GRVPDCDetails.Rows[intCurrentRow].FindControl("ddlDepositBank") as DropDownList;
        if (ObjDt != null && ObjDt.Rows.Count > 0)
        {

            ddlDepositBank.BindDataTable(ObjDt);
        }
        else
            ddlDepositBank.Items.Clear();
    }

    protected void ddlDepositBankCodes_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            if (GRVPDCDetails != null && GRVPDCDetails.Rows.Count > 0)
            {
                foreach (GridViewRow grvRow in GRVPDCDetails.Rows)
                {
                    DropDownList ddlDepositBank = (DropDownList)grvRow.FindControl("ddlDepositBank");
                    ddlDepositBank.SelectedValue = Convert.ToString(ddlDepositBankCodes.SelectedValue);
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void ddlIssuerBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            txtGivenBy.Text = (Convert.ToInt32(ddlIssuerBy.SelectedValue) == 1) ? Convert.ToString(ucCustomerCodeLov.SelectedText) : "";
            ddlIssuerBy.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    #endregion

    #region Button Events

    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            btnSave.Enabled_False();
            if (ucAccountLov.SelectedValue == "0" || ucAccountLov.SelectedText == "")
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message2));
                return;
            }

            if (Convert.ToString(txtInstrumentStartNo.Text) != "" && Convert.ToDecimal(txtInstrumentStartNo.Text) == 0)
            {
                //Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message13));
                Utility.FunShowAlertMsg(this, "Enter the Cheque Start Number");
                return;
            }

            if (Convert.ToString(txtNoofPDC.Text) != "" && Convert.ToDecimal(txtNoofPDC.Text) == 0)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message14));
                return;
            }

            if (Convert.ToString(txtFromInstallmentNo.Text) != "" && Convert.ToDecimal(txtFromInstallmentNo.Text) == 0)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message15));
                return;
            }

            if (ddlPDCNature.SelectedValue == "1")
                FunPriGeneratePDCDetails();
            else
                FunPriCreateSupplementaryCheque();

            //Added By Arunkumar K on 02-Aug-2016 For CR 010 
            if (GRVPDCDetails.Rows.Count > 0)
            {
                ddlLOB.Enabled = txtTransactionDate.Enabled = ddlBranch.Enabled =
                ucCustomerCodeLov.ButtonEnabled = txtNoofPDC.Enabled = txtFromInstallmentNo.Enabled =
                ucAccountLov.Enabled = ddlPDCNature.Enabled = false;
                //ddlInstrmentSequence.Enabled = 
                //txtAuthorizedSign.Enabled = txtAccountNumber.Enabled = ddlDraweeBank.Enabled = txtMICR.Enabled = 
                //ddlInstrmentType.Enabled = 

                txtInstrumentStartNo.Enabled = (Convert.ToInt32(ddlInstrmentSequence.SelectedValue) == 2) ? false : true;
                btnSave.Enabled_True();

                //GRVPDCDetails.Columns[15].Visible = 
                GRVPDCDetails.Columns[9].Visible = false;
            }
            //Added By Arunkumar K on 02-Aug-2016 For CR 010 
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_3;
            CVPDCEntry.IsValid = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (GRVPDCDetails == null)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message11));
                return;
            }
            else if (GRVPDCDetails.Rows.Count == 0)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message11));
                return;
            }
            else if (GRVPDCDetails.Rows.Count > 0 && GRVPDCDetails.Rows[0].Visible == false)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message11));
                return;
            }
            else if (pnlGRDSeqYes.Visible == false)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message11));
                return;
            }

            FunPriSavePDCEntry();
            btnSave.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_4;
            CVPDCEntry.IsValid = false;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Popup"] != null)
        {
            strAlert = "window.close();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strAlert, true);
        }
        else if (PageMode == PageModes.WorkFlow)
        {
            ReturnToWFHome();
        }
        else

            Response.Redirect(strRedirectPage, false);
        //btnCancel.Focus();//Added by Suseela
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../PDC Module/S3GClnPDCEntry.aspx?qsMode=C", false);
            btnClear.Focus();//Added by Suseela
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnLoadAccount_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TxtAccNumber = (TextBox)ucAccountLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucAccountLov.FindControl("txtItemName");

            HiddenField hdnCID = (HiddenField)ucAccountLov.FindControl("hdnID");

            ucAccountLov.SelectedValue = hdnCID.Value;
            ucAccountLov.SelectedText = TxtAccNumber.Text = txtAccItemNumber.Text;
            hdnAccount_ID.Value = hdnCID.Value;

            FunPriGetAccountDtls(Convert.ToString(hdnCID.Value), "");
            FunPriClearDetails();

            if (ddlPDCNature.Enabled == true)
                ddlPDCNature.Focus();
            else
                txtNoofPDC.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnViewStructure_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@OPTION", "3");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@USER_ID", Convert.ToString(intUserID));
            Procparam.Add("@PASA_REF_ID", Convert.ToString(ucAccountLov.SelectedValue));

            DataSet dsRepayStructure = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);

            //FunPriExportExcel(dsRepayStructure.Tables[0]);
            FunPriEnblDsblButtons(true);
            mpeViewStructure.Show();
            divRepay.Style["display"] = "block";
            divReceipt.Style["display"] = "none";
            grvAccountStructure.DataSource = dsRepayStructure.Tables[0];
            grvAccountStructure.DataBind();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }

    protected void btnhldExit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            FunPriEnblDsblButtons(false);
            mpeViewStructure.Hide();
            btnViewStructure.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }

    }

    #endregion

    #region Gridview Events

    protected void GRVPDCDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            FunPriGridviewPDCdatabound(e);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CVPDCEntry.ErrorMessage = Resources.ValidationMsgs.CLNPDC_5;
            CVPDCEntry.IsValid = false;
        }
    }

    #endregion

    #region "TEXTBOX EVENTS"

    protected void txtAccountNumber_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (GRVPDCDetails != null && GRVPDCDetails.Rows.Count > 0)
            {
                foreach (GridViewRow grvRow in GRVPDCDetails.Rows)
                {
                    TextBox txtDraweeAccountNo = (TextBox)grvRow.FindControl("txtDraweeAccountNo");
                    txtDraweeAccountNo.Text = Convert.ToString(txtAccountNumber.Text);
                }
            }
            txtAccountNumber.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void txtMICR_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (GRVPDCDetails != null && GRVPDCDetails.Rows.Count > 0)
            {
                foreach (GridViewRow grvRow in GRVPDCDetails.Rows)
                {
                    TextBox txtMICRD = (TextBox)grvRow.FindControl("txtMICRD");
                    txtMICRD.Text = Convert.ToString(txtMICR.Text);
                }
            }
            txtMICR.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    #endregion

    protected void ucAccountLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            //RFVSLA.Visible = false;
            FunPriClearcontrols();
            Button btnLoadAccount = (Button)ucAccountLov.FindControl("btnGetLOV");
            btnLoadAccount.Focus();
            hdnAccount_ID.Value = ucAccountLov.SelectedValue;

            FunPriGetAccountDtls(ucAccountLov.SelectedValue, "");

            FunPriClearDetails();

            if (ddlPDCNature.Enabled == true)
                ddlPDCNature.Focus();
            else
                txtNoofPDC.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    #region Methods

    private void FunPriLoadPage()
    {
        try
        {
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            // Get Prefix and suffix values from Session
            intGPSPrefix = ObjS3GSession.ProGpsPrefixRW;
            intGPSSuffix = ObjS3GSession.ProGpsSuffixRW;
            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;


            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
                if (fromTicket != null)
                    strPDCID = Convert.ToString(fromTicket.Name);
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
                strMode = Request.QueryString["qsMode"];
            }

            ucCustomerCodeLov.strControlID = ucCustomerCodeLov.ClientID.ToString();
            TextBox txtCustItemNumber = ((TextBox)ucCustomerCodeLov.FindControl("txtItemName"));
            Button btnGetLOV = ((Button)ucCustomerCodeLov.FindControl("btnGetLOV"));
            btnGetLOV.Visible = false;
            txtCustItemNumber.Attributes.Add("readonly", "true");
            txtCustItemNumber.Width = 0;
            txtCustItemNumber.TabIndex = -1;
            txtCustItemNumber.BorderStyle = BorderStyle.None;

            //Account Code Popup Start
            ucAccountLov.strControlID = ucAccountLov.ClientID.ToString();
            TextBox txtAccItemNumber = ((TextBox)ucAccountLov.FindControl("txtItemName"));
            txtAccItemNumber.Style["display"] = "block";
            txtAccItemNumber.Attributes.Add("onfocus", "fnLoadAccount()");
            txtAccItemNumber.Attributes.Add("readonly", "false");
            txtAccItemNumber.Width = 0;
            txtAccItemNumber.TabIndex = -1;
            txtAccItemNumber.BorderStyle = BorderStyle.None;

            //Factoring Customer Lov
            ucFactCustomerLov.strControlID = Convert.ToString(ucFactCustomerLov.ClientID);
            TextBox txtFactCustItemNumber = ((TextBox)ucFactCustomerLov.FindControl("txtItemName"));
            Button btnFactGetLOV = ((Button)ucFactCustomerLov.FindControl("btnGetLOV"));
            btnFactGetLOV.Visible = false;
            txtFactCustItemNumber.Attributes.Add("readonly", "true");
            txtFactCustItemNumber.Width = 0;
            txtFactCustItemNumber.TabIndex = -1;
            txtFactCustItemNumber.BorderStyle = BorderStyle.None;

            if (strMode == "Q")
            {
                Button btnGetAcctLOV = ((Button)ucAccountLov.FindControl("btnGetLOV"));
                btnGetAcctLOV.Visible = false;
            }

            //Code end  
            if (!IsPostBack)
            {
                ViewState["Product_id"] = "0";
                FunPriSetProgramName();
                CECTransactiondate.Format = strDateFormat;
                ////User Authorization            
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if ((strPDCID != "") && (strMode == "M"))// Modify
                {
                    FunPriLoadPDCLOV();
                    FunPriGetPDCDetails_QueryMode();
                    FunPriDisableControls(1);
                }
                else if ((strPDCID != "") && (strMode == "Q")) // Query 
                {
                    //FunPriGetPDCDetails();
                    FunPriLoadPDCLOV();
                    FunPriGetPDCDetails_QueryMode();
                    FunPriDisableControls(-1);
                }
                else //Create Mode
                {
                    FunPriLoadPDCLOV();
                    FunPriDisableControls(0);
                    FunPriBindPDCDummy(strMode);
                    ddlInstrmentType.SelectedValue = "1";
                }
                txtTransactionDate.Focus();
            }

            TextBox txtAccountNumberSuggest = ((TextBox)ucAccountLov.FindControl("TxtName"));
            txtAccountNumberSuggest.Attributes.Add("onchange", "fnTrashAccountCommonSuggest('" + ucAccountLov.ClientID + "');");

            TextBox txtFactCustomerLovSuggest = ((TextBox)ucFactCustomerLov.FindControl("TxtName"));
            txtFactCustomerLovSuggest.Attributes.Add("onchange", "fnTrashCommonSuggest('" + ucFactCustomerLov.ClientID + "');");

            if (PageMode == PageModes.WorkFlow & !IsPostBack)
            {
                try
                {
                    PreparePageForWorkFlowLoad();
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
                    Utility.FunShowAlertMsg(this.Page, "Invalid data to load, access from menu");
                }
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    #region Workflow Methods
    /// <summary>
    /// Workflow Function
    /// </summary>
    private void PreparePageForWorkFlowLoad()
    {
        try
        {


            if (!IsPostBack)
            {
                WorkFlowSession WFSessionValues = new WorkFlowSession();
                funPriLoadContractNoWF(WFSessionValues.LastDocumentNo);
                ucAccountLov_Item_Selected(null, null);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    private void funPriLoadContractNoWF(string strProposal)
    {
        try
        {
            ViewState["Product_id"] = "0";
            HiddenField hdnCID = (HiddenField)ucAccountLov.FindControl("hdnID");
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Company_id", intCompanyID.ToString());
            strProparm.Add("@APPLN", strProposal);

            DataTable dt = Utility.GetDefaultData("LR_GET_PANUM_APPLN", strProparm);
            if (dt.Rows.Count > 0)
            {
                ucAccountLov.SelectedText = dt.Rows[0]["panum"].ToString();
                ucAccountLov.SelectedValue = dt.Rows[0]["PA_SA_REF_ID"].ToString();
                hdnCID.Value = dt.Rows[0]["PA_SA_REF_ID"].ToString();
                ViewState["Product_id"] = dt.Rows[0]["product_id"].ToString();

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    #endregion

    private void FunPriLoadPDCLOV()
    {
        try
        {
            //FunPriGetLOBList();
            FunPriGetBranchList();

            // Drawee Bank name ,Instrumenttype ,Instrument Sequence
            FunPribindBankSequenceType();

            RFVInstrumentType.ErrorMessage = Resources.ValidationMsgs.CLNPDC_8;
            RFVTransactionDate.ErrorMessage = Resources.ValidationMsgs.CLNPDC_15;
            RFVInstrmentSequence.ErrorMessage = Resources.ValidationMsgs.CLNPDC_6;

            rfvPDCNature.ErrorMessage = Resources.ValidationMsgs.CLNPDC_17;
            RFVNoofPDC.ErrorMessage = Resources.ValidationMsgs.CLNPDC_18;
            rfvFromInstallmentNo.ErrorMessage = Resources.ValidationMsgs.CLNPDC_19;
            //rfvMICR.ErrorMessage = Resources.ValidationMsgs.CLNPDC_20;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetBranchList()
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (strPDCID == "")
            {
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@User_ID", Convert.ToString(ObjUserInfo.ProUserIdRW));
            Procparam.Add("@Option", "1");
            Procparam.Add("@Program_ID", Convert.ToString(intProgramId));
            //ddlBranch.BindDataTable("S3G_GET_LOCATION", Procparam, new string[] { "BRANCH_ID", "BRANCH" });
            //ddlBranch.AddItemToolTip();

            ddlOperatingBranch.BindDataTable("S3G_GET_LOCATION", Procparam, new string[] { "BRANCH_ID", "BRANCH" });
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException);
            throw new ApplicationException("Unable To Load Branch");
        }
    }

    private void FunPriGetLOBList()
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (strPDCID == "")
            {
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@Program_ID", Convert.ToString(intProgramId));
            Procparam.Add("@User_ID", Convert.ToString(ObjUserInfo.ProUserIdRW));
            Procparam.Add("@FilterOption", "'FL','HP','LN','OL','TE','TL'");
            ddlLOB.BindDataTable("S3G_Get_LOB_LIST", Procparam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
            ddlLOB.AddItemToolTip();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException);
            throw new ApplicationException("Unable To Load Line of Business");
        }
    }

    private void FunPribindBankSequenceType()
    {
        try
        {
            DataSet ds = new DataSet();
            // Instruction Sequence  Yes & No          
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@LookupType_Code", "18");
            ddlInstrmentSequence.BindDataTable(SPNames.S3G_LOANAD_GetLookUpValues, dictParam, new string[] { "Lookup_Code", "Lookup_Description" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Lookup_Type", "PDC_NATURE");
            dictParam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlPDCNature.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", dictParam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Lookup_Type", "PDC_CATEGORY");
            dictParam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlCategory.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", dictParam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            // Instruction Type Local Outstation
            //dictParam = new Dictionary<string, string>();
            //dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            //dictParam.Add("@LookupType_Code", "48");
            //ddlInstrmentType.BindDataTable(SPNames.S3G_LOANAD_GetLookUpValues, dictParam, new string[] { "Lookup_Code", "Lookup_Description" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Lookup_Type", "CHEQUE_TYPE");
            dictParam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlInstrmentType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", dictParam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Lookup_Type", "ISSUER_BY");
            dictParam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlIssuerBy.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", dictParam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Lookup_Type", "CLEARING_TYPE");
            dictParam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlClearingType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", dictParam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@LookupType_Code", "57");
            ds = Utility.GetDataset(SPNames.S3G_LOANAD_GetLookUpValues, dictParam);
            ViewState["Status"] = ds.Tables[0];
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadCustomerDetails(string strCustomerID)
    {
        try
        {
            StringBuilder strFormAddress = new StringBuilder();

            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@Option", "1");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@CustomerId", strCustomerID);
            DataSet ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", Procparam);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                {
                    strFormAddress.Append(Environment.NewLine);
                    strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + Convert.ToString(ds.Tables[0].Rows[0][i]));

                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                    {
                        strFormAddress.Replace(Convert.ToString(ds.Tables[1].Rows[i]["COLUMN_NAME"]).ToUpper(), Convert.ToString(ds.Tables[1].Rows[i]["DISPLAY_TEXT"]));
                    }
                }

                FunPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucCustomerCodeLov);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriSetCustomerAddress(DataTable dtCustomer, StringBuilder strAddress, UserControl ucCustomerCodeLovDyn)
    {
        try
        {
            DataRow dtrCustomer = dtCustomer.Rows[0];
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
            if (dtrCustomer != null)
            {
                if (dtrCustomer.Table.Columns["Customer_Code"] != null)
                    txtCustomerCode1.Text = txtCustomerCode.Text = Convert.ToString(dtrCustomer["Customer_Code"]);
                if (dtrCustomer.Table.Columns["Title"] != null)
                    txtCustomerName.Text = txtCustomerName1.Text = Convert.ToString(dtrCustomer["Title"]) + " " + Convert.ToString(dtrCustomer["Customer_Name"]);
                else
                    txtCustomerName.Text = txtCustomerName1.Text = Convert.ToString(dtrCustomer["Customer_Name"]);
                if (dtrCustomer.Table.Columns["Mob_Phone_No"] != null) txtMobile.Text = txtMobile1.Text = Convert.ToString(dtrCustomer["Mob_Phone_No"]);
                if (dtrCustomer.Table.Columns.Contains("Office_Phone_No"))
                {
                    txtPhone.Text = txtPhone1.Text = Convert.ToString(dtrCustomer["Office_Phone_No"]);
                }
                if (dtrCustomer.Table.Columns["Cust_Email"] != null) txtEmail.Text = txtEmail1.Text = Convert.ToString(dtrCustomer["Cust_Email"]);
                if (dtrCustomer.Table.Columns["Comm_WebSite"] != null) txtWebSite.Text = txtWebSite1.Text = Convert.ToString(dtrCustomer["Comm_WebSite"]);
                txtCusAddress.Text = txtCusAddress1.Text = Convert.ToString(strAddress);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriGetAccountDtls(string strPASAREFID, string strPanum)
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@Option", "1");
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            if (strPASAREFID != "")
                Procparam.Add("@PASA_REF_ID", strPASAREFID);
            if (strPanum != "")
                Procparam.Add("@Panum", strPanum);

            DataSet dsPDC = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);

            if (dsPDC != null)
            {
                ucAccountLov.SelectedValue = Convert.ToString(dsPDC.Tables[0].Rows[0]["PA_SA_REF_ID"]);
                txtAccountCode.Text = ucAccountLov.SelectedText = Convert.ToString(dsPDC.Tables[0].Rows[0]["Panum"]);

                if (ddlLOB.Items != null && ddlLOB.Items.Count > 0)
                    ddlLOB.Items.Clear();

                if (ddlBranch.Items != null && ddlBranch.Items.Count > 0)
                    ddlBranch.Items.Clear();

                System.Web.UI.WebControls.ListItem lstLOB = new System.Web.UI.WebControls.ListItem(Convert.ToString(dsPDC.Tables[0].Rows[0]["LOB_Desc"]), Convert.ToString(dsPDC.Tables[0].Rows[0]["LOB_ID"]));
                ddlLOB.Items.Add(lstLOB);

                ddlLOB.SelectedValue = Convert.ToString(dsPDC.Tables[0].Rows[0]["LOB_ID"]);

                System.Web.UI.WebControls.ListItem lstBranch = new System.Web.UI.WebControls.ListItem(Convert.ToString(dsPDC.Tables[0].Rows[0]["Location_Desc"]), Convert.ToString(dsPDC.Tables[0].Rows[0]["Location_ID"]));
                ddlBranch.Items.Add(lstBranch);

                ddlBranch.SelectedValue = Convert.ToString(dsPDC.Tables[0].Rows[0]["Location_ID"]);

                ViewState["NoOfPDC"] = hdnmaxInstallmentNo.Value = txtNoofPDC.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["Balance_PDC_Count"]);
                hdnFromInstallmentNo.Value = Convert.ToString(dsPDC.Tables[0].Rows[0]["From_Installment_No"]);

                txtFromInstallmentNo.Text = string.Empty;

                ucCustomerCodeLov.SelectedText = Convert.ToString(dsPDC.Tables[0].Rows[0]["Customer_Name"]);
                ucCustomerCodeLov.SelectedValue = Convert.ToString(dsPDC.Tables[0].Rows[0]["Customer_ID"]);
                hidcuscode.Value = Convert.ToString(dsPDC.Tables[0].Rows[0]["Customer_ID"]);

                txtGivenBy.Text = (Convert.ToInt32(ddlIssuerBy.SelectedValue) == 1) ? Convert.ToString(ucCustomerCodeLov.SelectedText) : "";

                ddlInstrmentType.SelectedValue = "1";

                //Added on 06-Mar-2019 starts Here
                ViewState["Is_PNTD"] = Convert.ToString(dsPDC.Tables[0].Rows[0]["IS_PNTD"]);
                //Added on 06-Mar-2019 ends Here

                //if (Convert.ToString(dsPDC.Tables[0].Rows[0]["REPAYMENT_CODE"]) != "3")
                //{
                //    ddlPDCNature.SelectedValue = "2";
                //    ddlPDCNature.Enabled = false;
                //}
                //else
                //{
                ddlPDCNature.SelectedValue = "0";
                ddlPDCNature.Enabled = true;
                //}
                FunPriPDCNatureChange();

                FunPriLoadCustomerDetails(Convert.ToString(dsPDC.Tables[0].Rows[0]["Customer_ID"]));

                FunPriGetAccRepayAmount();

            }
            btnViewStructure.Visible = true;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    lblHeading.Text = strPageName + " - Create";
                    ucCustomerCodeLov.Enabled = false;
                    //Changed By Thangam on 14/May/2012 for UAT bug - PDCE_003
                    txtTransactionDate.Text = DateTime.Parse(DateTime.Today.ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                    btnViewStructure.Visible = false;
                    ucFactCustomerLov.strControlID = Convert.ToString(ucFactCustomerLov.ClientID);
                    ((TextBox)ucFactCustomerLov.FindControl("txtItemName")).Attributes.Add("readonly", "true");
                    ucFactCustomerLov.Enabled = rfvFactCustomerLov.Enabled = false;
                    //End here
                    break;
                case -1:// Query Mode
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    lblHeading.Text = strPageName + " - View";
                    FunPriClearDropDown();
                    txtInstrumentStartNo.Enabled = imgTransactionDate.Enabled = txtFromInstallmentNo.Enabled = ucCustomerCodeLov.ButtonEnabled =
                        ucCustomerCodeLov.Enabled = ucAccountLov.Enabled = ucFactCustomerLov.Enabled = rfvFactCustomerLov.Enabled = false;
                    btnGo.Enabled_False();
                    btnSave.Enabled_False();
                    btnClear.Enabled_False();
                    //lblNoofPDC.Text = "No of PDC";
                    ddlDraweeBank.Enabled = false;
                    txtMICR.ReadOnly = txtTransactionDate.ReadOnly = txtNoofPDC.ReadOnly = txtAuthorizedSign.ReadOnly = txtGivenBy.ReadOnly =
                        txtAccountNumber.ReadOnly = true;
                    ddlClearingType.ClearDropDownList();
                    if (ddlOperatingBranch.SelectedValue != "")
                        ddlOperatingBranch.ClearDropDownList();
                    ddlIssuerBy.ClearDropDownList();
                    ddlPDCNature.ClearDropDownList();
                    GRVPDCDetails.Columns[9].Visible = false;
                    //End here
                    break;
                case 1:// Modify Mode
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    lblHeading.Text = strPageName + " - Modify";
                    FunPriClearDropDown();
                    txtFromInstallmentNo.Visible = false;
                    //lblNoofPDC.Text = "No of PDC";
                    //ddlInstrmentSequence.Visible = lblInstrmentSequence.Visible =
                    imgTransactionDate.Enabled = false;
                    btnGo.Enabled_False();
                    btnClear.Enabled_False();
                    RFVInstrmentSequence.Visible = RFVInstrumentType.Visible = false;
                    lblInstrumentStartNo.Visible = txtInstrumentStartNo.Visible = false;
                    txtNoofPDC.ReadOnly = txtTransactionDate.ReadOnly = true;
                    ucCustomerCodeLov.ButtonEnabled = false;
                    RFVInstrumentStartNo.Enabled = txtInstrumentStartNo.Visible;
                    //Added By R. Manikandan
                    //rfvMICR.Enabled = txtMICR.Visible;
                    //Added by Thangam on 17/Jul/2012 for UAT
                    if (ddlInstrmentSequence.SelectedValue == "1")
                    {
                        lblDraweeBank.Visible = true;
                        GRVPDCDetails.Columns[6].Visible = false;
                    }
                    else
                    {
                        lblDraweeBank.Visible = false;
                        GRVPDCDetails.Columns[6].Visible = true;
                    }
                    txtMICR.ReadOnly = true;
                    txtAuthorizedSign.ReadOnly = true;
                    ucFactCustomerLov.Enabled = rfvFactCustomerLov.Enabled = false;
                    //End here
                    break;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriClearDropDown()
    {
        try
        {
            if (ddlLOB.Items.Count > 0)
                ddlLOB.ClearDropDownList();
            //if (ddlBranch.Items.Count > 0)
            //    ddlBranch.ClearDropDownList();
            ddlBranch.ClearDropDownList();
            if (ddlInstrmentType.Items.Count > 0)
                ddlInstrmentType.ClearDropDownList();
            if (ddlInstrmentSequence.Items.Count > 0)
                ddlInstrmentSequence.ClearDropDownList();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetPDCDetails_QueryMode()
    {
        try
        {
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@PDCNO", Convert.ToString(strPDCID));
            dictParam.Add("@Program_ID", "106");
            DataSet DS = Utility.GetDataset("S3G_CLN_GetPDCModuleDetails", dictParam);

            //  Table 0  
            if (DS.Tables[0].Rows.Count >= 1)
            {

                System.Web.UI.WebControls.ListItem lstLOB = new System.Web.UI.WebControls.ListItem(Convert.ToString(DS.Tables[0].Rows[0]["LOBName"]), Convert.ToString(DS.Tables[0].Rows[0]["LOB_ID"]));
                ddlLOB.Items.Add(lstLOB);

                ddlLOB.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["LOB_ID"]);

                System.Web.UI.WebControls.ListItem lstBranch = new System.Web.UI.WebControls.ListItem(Convert.ToString(DS.Tables[0].Rows[0]["LocationName"]), Convert.ToString(DS.Tables[0].Rows[0]["Location_ID"]));
                ddlBranch.Items.Add(lstBranch);

                ddlBranch.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["Location_ID"]);
                ucAccountLov.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["PA_SA_REF_ID"]);
                ucAccountLov.SelectedText = Convert.ToString(DS.Tables[0].Rows[0]["PANum"]);
                txtTransactionDate.Text = Convert.ToString(DS.Tables[0].Rows[0]["PDC_Collection_Date"]);
                txtPDCEntryNo.Text = Convert.ToString(DS.Tables[0].Rows[0]["PDC_ENTRY_NO"]);
                txtNoofPDC.Text = Convert.ToString(DS.Tables[0].Rows[0]["No_Of_PDC"]);
                txtMICR.Text = Convert.ToString(DS.Tables[0].Rows[0]["MICR"]);
                txtAuthorizedSign.Text = Convert.ToString(DS.Tables[0].Rows[0]["AUTHORIZED_SIGN"]);
                //txtDepositBank.Text = Convert.ToString(DS.Tables[0].Rows[0]["Deposit_Bank"]);
                txtTotalRepayAmount.Text = Convert.ToString(DS.Tables[0].Rows[0]["Total_Repay_Amount"]);

                ddlInstrmentSequence.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["InstrumentSequence"]);
                ddlInstrmentType.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["Instrument_Type_Code"]);

                ddlPDCNature.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["PDC_NATURE_TYPE"]);
                ddlClearingType.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["CLEARING_TYPE"]);
                //ddlCategory.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0][""]);
                ddlIssuerBy.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["ISSUER_TYPE"]);
                ddlOperatingBranch.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["OPERATING_BRANCH"]);
                txtGivenBy.Text = Convert.ToString(DS.Tables[0].Rows[0]["GIVEN_BY"]);

                ucCustomerCodeLov.SelectedText = Convert.ToString(DS.Tables[0].Rows[0]["Customer_Name"]);
                ucCustomerCodeLov.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["Customer_ID"]);
                hidcuscode.Value = Convert.ToString(DS.Tables[0].Rows[0]["Customer_ID"]);

                ucFactCustomerLov.SelectedText = Convert.ToString(DS.Tables[0].Rows[0]["Factoring_Customer_Name"]);
                ucFactCustomerLov.SelectedValue = Convert.ToString(DS.Tables[0].Rows[0]["Factoring_Customer_ID"]);
            }

            ////To load status in Query and Modify modes
            //if (DS.Tables.Count > 4 && DS.Tables[4] != null)
            //{
            //    ViewState["Status"] = DS.Tables[4];
            //}

            // Table 1 PDC Details Gridview
            if (DS.Tables[1].Rows.Count >= 1)
            {
                GRVPDCDetails.DataSource = DS.Tables[1];
                GRVPDCDetails.DataBind();
                pnlGRDSeqYes.Visible = true;
            }

            // Tables[3]  Existing PDC Data Entry
            if (DS.Tables[3].Rows.Count >= 1)
            {
                tbExistingPDC.Enabled = true;
                GrvExisting.DataSource = DS.Tables[3];
                GrvExisting.DataBind();
            }
            else if (DS.Tables[3].Rows.Count == 0)
            {
                tbExistingPDC.Enabled = false;
            }

            FunPriLoadCustomerDetails(Convert.ToString(DS.Tables[0].Rows[0]["Customer_ID"]));

            if (Convert.ToString(DS.Tables[0].Rows[0]["Factoring_Customer_ID"]) != "")
                FunPriLoadFactCustomerDetails(Convert.ToString(DS.Tables[0].Rows[0]["Factoring_Customer_ID"]));
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriGeneratePDCDetails()
    {
        try
        {
            if (strMode == string.Empty)
            {
                if (!string.IsNullOrEmpty(hdnFromInstallmentNo.Value) && !string.IsNullOrEmpty(txtFromInstallmentNo.Text) && Convert.ToInt32(txtFromInstallmentNo.Text) > Convert.ToInt32(hdnFromInstallmentNo.Value))
                {
                    Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message3) + hdnFromInstallmentNo.Value.ToString());
                    btnSave.Enabled_False();
                    return;
                }

                if (Convert.ToInt32(ViewState["NoOfPDC"].ToString()) < Convert.ToInt32(txtNoofPDC.Text))
                {
                    Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message4) + ViewState["NoOfPDC"].ToString());
                    btnSave.Enabled_False();
                    txtNoofPDC.Focus();
                    return;
                }

                if (ddlInstrmentSequence.SelectedValue == "1")
                {
                    if (txtInstrumentStartNo.Text == string.Empty)
                    {
                        Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs.CLNPDC_9);
                        return;
                    }

                    //Commented on 11-Apr-2019 WRF UAT Pt 16 - MICR Code to be populate from drawee bank master Starts Here

                    //if (txtMICR.Text == string.Empty)
                    //{
                    //    Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message5));
                    //    return;
                    //}

                    //Commented on 11-Apr-2019 WRF UAT Pt 16 - MICR Code to be populate from drawee bank master Ends Here
                }

                Dictionary<string, string> Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", intCompanyID.ToString());
                Procparam.Add("@PANum", Convert.ToString(ucAccountLov.SelectedText));
                if (hdnAccount_ID.Value.ToString() == "0")
                {
                    Procparam.Add("@SANum", hdnAccount_ID.Value.ToString() + "DUMMY");
                }

                DataTable dt = Utility.GetDefaultData("S3G_CLN_GetAccountCreationDate", Procparam);

                if (dt != null && dt.Rows.Count > 0)
                {
                    //Added on 09-Dec-2018 Starts here
                    // Start Validation Removed on 01-Aug-2021
                    //Reason : Now they will capture and not send for Bank (Chq status will automatically update as PNTD) If the employee resigned then they will use remaining cheque
                    //if (Convert.ToInt32(dt.Rows[0]["REPAYMENT_CODE"]) != 3 && Convert.ToInt32(ddlPDCNature.SelectedValue) == 1)
                    //{
                    //    Utility.FunShowAlertMsg(this.Page, "Account Repayment Type should be Post Dated Cheques.");
                    //    btnSave.Enabled_False();
                    //    return;
                    //}
                    // End Validation Removed on 01-Aug-2021
                    //Added on 09-Dec-2018 Ends here

                    if (Convert.ToDateTime(Utility.StringToDate(dt.Rows[0]["CREATED_DATE"].ToString()).ToString("dd-MMM-yyyy")) > Convert.ToDateTime(Utility.StringToDate(txtTransactionDate.Text).ToString("dd-MMM-yyyy")))
                    {
                        Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message6) + Utility.StringToDate(dt.Rows[0][0].ToString()).ToString(strDateFormat));
                        btnSave.Enabled_False();
                        return;
                    }

                    if (Convert.ToDateTime(Utility.StringToDate(dt.Rows[0]["INSTALLMENTDATE"].ToString()).ToString("dd-MMM-yyyy")) < Convert.ToDateTime(Utility.StringToDate(txtTransactionDate.Text).ToString("dd-MMM-yyyy")))
                    {
                        Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message7) + Utility.StringToDate(dt.Rows[0][0].ToString()).ToString(strDateFormat));
                        btnSave.Enabled_False();
                        return;
                    }
                }
            }
            DataSet DS = new DataSet();
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
            dictParam.Add("@Pa_Sa_Ref_Id", Convert.ToString(ucAccountLov.SelectedValue));
            dictParam.Add("@PDC_Nature_Type", Convert.ToString(ddlPDCNature.SelectedValue));
            if (Convert.ToString(txtInstrumentStartNo.Text.Trim()) != "")
                dictParam.Add("@InststartNo", Convert.ToString(txtInstrumentStartNo.Text.Trim()));
            dictParam.Add("@MICR", Convert.ToString(txtMICR.Text.Trim()));
            dictParam.Add("@PDC_Count", Convert.ToString(txtNoofPDC.Text.Trim()));

            if (ddlDraweeBank.SelectedText != "" && Convert.ToInt32(ddlDraweeBank.SelectedValue) > 0)
            {
                dictParam.Add("@Drawee_Bank_ID", Convert.ToString(ddlDraweeBank.SelectedValue));
                dictParam.Add("@Drawee_Bank_Name", Convert.ToString(ddlDraweeBank.SelectedText));
            }

            if (ddlDepositBankCodes.SelectedItem != null)
            {
                if (ddlDepositBankCodes.SelectedItem.Text != "" && Convert.ToInt32(ddlDepositBankCodes.SelectedValue) > 0)
                {
                    dictParam.Add("@Deposit_Bank_ID", Convert.ToString(ddlDepositBankCodes.SelectedValue));
                    dictParam.Add("@Deposit_Bank_Name", Convert.ToString(ddlDepositBankCodes.SelectedItem.Text));
                }
            }

            dictParam.Add("@Drawee_Account_No", Convert.ToString(txtAccountNumber.Text.Trim()));
            dictParam.Add("@FromInstal_No", Convert.ToString(txtFromInstallmentNo.Text));

            DS = Utility.GetDataset(SPNames.S3G_CLN_GetPDCEntryDetails, dictParam);

            if (DS != null)
            {
                //txtDepositBank.Text = Convert.ToString(DS.Tables[0].Rows[0]["Deposit_Bank"]);
                txtTotalRepayAmount.Text = Convert.ToString(DS.Tables[0].Rows[0]["Total_Repay_Amount"]);

                pnlGRDSeqYes.Visible = true;
                if (DS.Tables[2].Rows.Count == 0)
                {
                    GRVPDCDetails.DataSource = null;
                    GRVPDCDetails.DataBind();
                }
                else
                {
                    GRVPDCDetails.DataSource = DS.Tables[2];
                    GRVPDCDetails.DataBind();
                }

                tbExistingPDC.Enabled = true;
                GrvExisting.DataSource = DS.Tables[3];
                GrvExisting.DataBind();

            }

            upanelPDCEntry.Update();
            UpExisting.Update();
            UpPDCDetails.Update();
            btnSave.Enabled_True();
            //txtInstrumentStartNo.AutoPostBack = true;


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void FunPubSetStartinstallmentNo()
    {
        DataSet DS = new DataSet();
        dictParam = new Dictionary<string, string>();
        dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
        dictParam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
        dictParam.Add("@PANUM", Convert.ToString(hdnAccount_ID.Value));
        dictParam.Add("@SANUM", Convert.ToString(Convert.ToString(hdnAccount_ID.Value + "DUMMY")));
        DS = Utility.GetDataset(SPNames.S3G_CLN_GetPDCEntryDetails, dictParam);

        if (DS.Tables.Count > 0 && DS.Tables[0].Rows.Count > 0)
        {
            hdnmaxInstallmentNo.Value = Convert.ToString(DS.Tables[0].Rows[0][0]);
            //    rgFromInstallmentNo.MaximumValue = Convert.ToString(DS.Tables[0].Rows[0][0]);
            //    rgFromInstallmentNo.MinimumValue = Convert.ToString(DS.Tables[1].Rows[0][1]);
            //    //rgFromInstallmentNo.ErrorMessage = "Starting Installment should be with in " + Convert.ToString(DS.Tables[1].Rows[0][1]) + " to " + Convert.ToString(DS.Tables[0].Rows[0][0]);
        }
        if (DS.Tables.Count > 1 && DS.Tables[1].Rows.Count > 0)
        {
            hdnFromInstallmentNo.Value = txtFromInstallmentNo.Text = Convert.ToString(DS.Tables[1].Rows[0][1]);
            ViewState["NoOfPDC"] = txtNoofPDC.Text = (Convert.ToInt32(Convert.ToString(DS.Tables[0].Rows[0][0])) - Convert.ToInt32(Convert.ToString(DS.Tables[1].Rows[0][1])) + 1).ToString();
        }
    }

    private void FunPriSavePDCEntry()
    {
        try
        {
            Dictionary<string, string> Procparam;
            strPDCNo = "";
            strchequeNo = "";
            strexistingdate = "";
            if (strMode != "M")
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", intCompanyID.ToString());
                Procparam.Add("@PANum", hdnAccount_ID.Value.ToString());
                if (hdnAccount_ID.Value.ToString() == "0")
                {
                    Procparam.Add("@SANum", hdnAccount_ID.Value.ToString() + "DUMMY");
                }
                //else
                //{
                //    Procparam.Add("@SANum", ddlSAN.SelectedValue.ToString());
                //}

                DataTable dt = Utility.GetDefaultData("S3G_CLN_GetAccountCreationDate", Procparam);

                if (dt != null && dt.Rows.Count > 0)
                {
                    if (Convert.ToDateTime(Utility.StringToDate(dt.Rows[0][0].ToString()).ToString("dd-MMM-yyyy")) > Convert.ToDateTime(Utility.StringToDate(txtTransactionDate.Text).ToString("dd-MMM-yyyy")))
                    {
                        Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message6) + Utility.StringToDate(dt.Rows[0][0].ToString()).ToString(strDateFormat) + "]");
                        return;
                    }

                    if (Convert.ToDateTime(Utility.StringToDate(dt.Rows[0][1].ToString()).ToString("dd-MMM-yyyy")) < Convert.ToDateTime(Utility.StringToDate(txtTransactionDate.Text).ToString("dd-MMM-yyyy")))
                    {
                        Utility.FunShowAlertMsg(this.Page, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message7) + Utility.StringToDate(dt.Rows[0][0].ToString()).ToString(strDateFormat) + "]");
                        return;
                    }
                }
            }

            FunPriGenerateXMLPDC();

            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Option", "2");
            //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            //Procparam.Add("@User_ID", Convert.ToString(intUserID));
            //Procparam.Add("@PASA_REF_ID", Convert.ToString(ucAccountLov.SelectedValue));
            //Procparam.Add("@PDC_Nature", Convert.ToString(ddlPDCNature.SelectedValue));
            //Procparam.Add("@XML_PDCDetails", StrXMLPDC);

            //DataSet dsCheck = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);

            //if (dsCheck != null && dsCheck.Tables != null && dsCheck.Tables.Count > 0)
            //{
            //    if (dsCheck.Tables[0].Rows.Count > 0 && Convert.ToString(dsCheck.Tables[0].Rows[0]["EXCEPTION_MESSAGE"]) != "" && Convert.ToString(dsCheck.Tables[0].Rows[0]["Error_Code"]) == "1")
            //    {
            //        Utility.FunShowAlertMsg(this, Convert.ToString(dsCheck.Tables[0].Rows[0]["EXCEPTION_MESSAGE"]));
            //        return;
            //    }

            //    else if (dsCheck.Tables[0].Rows.Count > 0 && Convert.ToString(dsCheck.Tables[0].Rows[0]["EXCEPTION_MESSAGE"]) != "" && Convert.ToString(dsCheck.Tables[0].Rows[0]["Error_Code"]) == "2")
            //    {
            //        lblAlertMessage.Text = Server.HtmlDecode(Convert.ToString(dsCheck.Tables[0].Rows[0]["EXCEPTION_MESSAGE"]));
            //        mpeConfirmation.Show();

            //        return;
            //    }


            //}

            FunPriConfirmSave();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriConfirmSave()
    {
        try
        {
            FunPriGenerateXMLPDC();

            ObjS3G_CLN_PDCModuleDataTable = new S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable();
            S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsRow ObjPDCModuleRow;
            ObjPDCModuleRow = ObjS3G_CLN_PDCModuleDataTable.NewS3G_CLN_PDCModuleDetailsRow();
            ObjPDCModuleRow.Company_ID = intCompanyID;
            ObjPDCModuleRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
            ObjPDCModuleRow.Branch_ID = Convert.ToInt32(ddlBranch.SelectedValue);
            ObjPDCModuleRow.Customer_ID = Convert.ToInt32(hidcuscode.Value);
            ObjPDCModuleRow.PANum = Convert.ToString(ucAccountLov.SelectedValue);
            ObjPDCModuleRow.SANum = Convert.ToString(ucAccountLov.SelectedText + "DUMMY");
            ObjPDCModuleRow.No_Of_PDC = Convert.ToInt32(txtNoofPDC.Text.Trim());
            ObjPDCModuleRow.PDC_Collection_Date = Utility.StringToDate(txtTransactionDate.Text.Trim());
            ObjPDCModuleRow.PDC_Entry_Date = Utility.StringToDate(txtTransactionDate.Text.Trim());
            ObjPDCModuleRow.Instrument_Type = 42;
            ObjPDCModuleRow.InstrumentSequence = Convert.ToInt32(ddlInstrmentSequence.SelectedValue);
            ObjPDCModuleRow.Instrument_Type_Code = Convert.ToInt32(ddlInstrmentType.SelectedValue);
            if (strMode == "M")
                ObjPDCModuleRow.PDC_Entry_NO = Convert.ToString(txtPDCEntryNo.Text.Trim());
            else
                ObjPDCModuleRow.PDC_Entry_NO = "1";

            ObjPDCModuleRow.Created_By = intUserID;

            ObjPDCModuleRow.XMLPDCEntry = StrXMLPDC;
            /* Added By Manikandan to bring MICR Code in PDC as User Enterable ON 30 - SEP 2014 */
            ObjPDCModuleRow.MICR = txtMICR.Text;
            ObjPDCModuleRow.Authorized_Sign = txtAuthorizedSign.Text.Trim();

            ObjPDCModuleRow.From_Installment_No = Convert.ToString(txtFromInstallmentNo.Text);
            ObjPDCModuleRow.Collateral_Category = Convert.ToInt32(ddlCategory.SelectedValue);
            ObjPDCModuleRow.Drawee_Account_No = Convert.ToString(txtAccountNumber.Text);
            ObjPDCModuleRow.Clearing_Type = Convert.ToInt32(ddlClearingType.SelectedValue);
            ObjPDCModuleRow.Operating_Branch = Convert.ToInt32(ddlOperatingBranch.SelectedValue);
            ObjPDCModuleRow.Issuer_By_ID = Convert.ToInt32(ddlIssuerBy.SelectedValue);
            ObjPDCModuleRow.Given_By_Desc = Convert.ToString(txtGivenBy.Text);
            ObjPDCModuleRow.PDC_Nature_Type = Convert.ToInt32(ddlPDCNature.SelectedValue);

            if (ddlLOB != null && ddlLOB.SelectedValue != null && Convert.ToString(ddlLOB.SelectedValue) == "4")
            {
                ObjPDCModuleRow.Factoring_Customer_ID = Convert.ToInt32(ucFactCustomerLov.SelectedValue);
            }

            ObjS3G_CLN_PDCModuleDataTable.AddS3G_CLN_PDCModuleDetailsRow(ObjPDCModuleRow);
            ObjPDCEntryClient = new ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient();
            intErrCode = ObjPDCEntryClient.FunPubCreatePDCModuleDetails(out strPDCNo, out strchequeNo, out strexistingdate, SerMode, ClsPubSerialize.Serialize(ObjS3G_CLN_PDCModuleDataTable, SerMode));

            if (intErrCode == 0)
            {
                //To avoid double save click
                btnSave.Enabled_False();
                //End here

                try
                {
                    //Work Flow Start
                    WorkFlowSession WFValues = new WorkFlowSession();
                    int WFProgramId = 0;
                    if (CheckForWorkFlowConfiguration(ProgramCode, WFLOBId, WFProductId, out WFProgramId, out dtWorkFlow) > 0)
                    {

                        try
                        {

                            int intWorkflowStatus = UpdateWorkFlowTasks(CompanyId.ToString(), UserId.ToString(), WFValues.LOBId, WFValues.BranchID, WFValues.WorkFlowDocumentNo, WFValues.WorkFlowProgramId, WFValues.WorkFlowStatusID.ToString(), "", "", WFValues.ProductId);
                            strAlert = "";
                        }
                        catch (Exception ex)
                        {
                            strAlert = "Work Flow not Assigned";
                            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
                        }
                    }
                }
                catch (Exception ex)
                {

                }
                //Work Flow End

                if (strPDCID != String.Empty)
                {
                    Utility.FunShowAlertMsg(this.Page, "PDC Entry  " + ValidationMsgs.S3G_ValMsg_Update);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strRedirectPageView, true);
                    return;
                }
                else
                {
                    strAlert = "PDC Entry Number is " + strPDCNo;
                    strAlert += @"\n\n " + Convert.ToString(Resources.LocalizationResources.PDCEntry_Message10);
                    strAlert += @"\n\nWould you like to add one more PDC Entry?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPage = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                    lblErrorMessage.Text = string.Empty;
                    return;
                }


            }
            else if (intErrCode == 2)
            {
                Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs._1);
                return;
            }
            else if (intErrCode == 3)
            {
                //  strchequeNo   This message has been handled in Stored procedure (S3G_CLN_InsertPDCEntry)
                Utility.FunShowAlertMsg(this.Page, strchequeNo);
                return;
            }
            else if (intErrCode == 4)
            {
                strAlert = Convert.ToString(Resources.LocalizationResources.PDCEntry_Message9);
                //strAlert += @"\n\n The Instrument(s) Number " + strchequeNo + " can not be Modified";
                strAlert = "alert('" + strAlert + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                return;
            }
            else if (intErrCode == 5)
            {
                strAlert = Convert.ToString(Resources.LocalizationResources.PDCEntry_Message9);
                //strAlert += @"\n\n The Instrument Date " + strexistingdate + " can not be Modified";
                strAlert = "alert('" + strAlert + "');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                return;
            }
            else if (intErrCode == 51)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message8));
                return;
            }
            else if (intErrCode == 6)
            {
                Utility.FunShowAlertMsg(this, strchequeNo);
                return;
            }
            else
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCEntry_Message12));
                return;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            if (ObjPDCEntryClient != null)
                ObjPDCEntryClient.Close();
        }

    }

    private void FunPriClearcontrols()
    {
        try
        {
            if (ddlInstrmentType.Items.Count > 0)
                ddlInstrmentType.SelectedIndex = 0;
            if (ddlInstrmentSequence.Items.Count > 0)
                ddlInstrmentSequence.SelectedIndex = 0;

            //CustomerDetails1.ClearCustomerDetails();
            btnSave.Enabled_False();
            lblErrorMessage.Text = "";
            //FunPribindBankSequenceType();             
            txtInstrumentStartNo.Enabled = lblInstrumentStartNo.Enabled = lblDraweeBank.Enabled = ddlInstrmentType.Enabled = lblInstrumentType.Enabled = true;
            txtInstrumentStartNo.Text = txtNoofPDC.Text = txtFromInstallmentNo.Text = hdnFromInstallmentNo.Value = string.Empty;
            GrvExisting.DataSource = null;
            GrvExisting.DataBind();
            tbExistingPDC.Enabled = true;
            GRVPDCDetails.DataSource = null;
            GRVPDCDetails.DataBind();
            pnlGRDSeqYes.Visible = false;
            UpExisting.Update();
            UpPDCDetails.Update();
            txtAuthorizedSign.Text = string.Empty;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriGridviewPDCdatabound(GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtInstrumentNo = (TextBox)e.Row.FindControl("txtInstrumentNo");
                TextBox txtAmount = (TextBox)e.Row.FindControl("txtAmount");
                DropDownList ddlPDCStatus = (DropDownList)e.Row.FindControl("ddlPDCStatus");
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                TextBox txtMICRD = (TextBox)e.Row.FindControl("txtMICRD");
                UserControls_S3GAutoSuggest ucgvDraweeBank = (UserControls_S3GAutoSuggest)e.Row.FindControl("ucgvDraweeBank");
                DropDownList ddlDepositBank = (DropDownList)e.Row.FindControl("ddlDepositBank");
                Label lblgvDraweeBankID = (Label)e.Row.FindControl("lblgvDraweeBankID");
                Label lblgvDraweeBankName = (Label)e.Row.FindControl("lblgvDraweeBankName");
                Label lblgvDepositBankID = (Label)e.Row.FindControl("lblgvDepositBankID");
                TextBox txtRemarks = (TextBox)e.Row.FindControl("txtRemarks");
                TextBox txtDraweeAccountNo = (TextBox)e.Row.FindControl("txtDraweeAccountNo");
                LinkButton lnkbtnInstallmentNo = (LinkButton)e.Row.FindControl("lnkbtnInstallmentNo");
                Label lblInstallmentNo = (Label)e.Row.FindControl("lblInstallmentNo");
                TextBox txtgvBankingDate = (TextBox)e.Row.FindControl("txtgvBankingDate");
                AjaxControlToolkit.CalendarExtender CEgvBankingDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("CEgvBankingDate");

                TextBox txtInstrumentDate = (TextBox)e.Row.FindControl("txtInstrumentDate");
                AjaxControlToolkit.CalendarExtender CECInstrumentDate = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("CECInstrumentDate");

                if (strMode == "Q" || strMode == "M")  //Query Mode 
                {
                    if (StrPreBank != lblgvDraweeBankID.Text)
                    {
                        ViewState["Dep_Bank"] = FunPriGetDepositinGrid("", lblgvDraweeBankID.Text);
                        StrPreBank = lblgvDraweeBankID.Text;
                    }

                    ddlDepositBank.BindDataTable(ViewState["Dep_Bank"] as DataTable); // Load Deposit Bank
                }
                else
                {
                    ddlDepositBank.BindDataTable(ViewState["Dep_Bank"] as DataTable); // Load Deposit Bank
                }

                ddlPDCStatus.BindDataTable(ViewState["Status"] as DataTable);      // Load Status value


                if (strMode == "Q")           //Query Mode 
                {
                    lblInstallmentNo.Visible = (Convert.ToInt32(lblStatus.Text) == 2 || Convert.ToInt32(lblStatus.Text) == 8) ? false : true;
                    lnkbtnInstallmentNo.Visible = (Convert.ToInt32(lblStatus.Text) == 2 || Convert.ToInt32(lblStatus.Text) == 8) ? true : false;
                    ddlPDCStatus.SelectedValue = Convert.ToString(lblStatus.Text);
                    ddlPDCStatus.ClearDropDownList();
                    ucgvDraweeBank.SelectedText = Convert.ToString(lblgvDraweeBankName.Text);
                    ucgvDraweeBank.SelectedValue = Convert.ToString(lblgvDraweeBankID.Text);

                    ddlDepositBank.SelectedValue = Convert.ToString(lblgvDepositBankID.Text);

                    txtAmount.ReadOnly = txtInstrumentNo.ReadOnly = txtMICRD.ReadOnly =
                        ucgvDraweeBank.ReadOnly = txtDraweeAccountNo.ReadOnly =
                        txtRemarks.ReadOnly = txtInstrumentDate.ReadOnly = txtgvBankingDate.ReadOnly = true;

                    CECInstrumentDate.Enabled = CEgvBankingDate.Enabled = false;
                }
                else if (strMode == "M")     // Modify Mode
                {

                }
                else                       // Create Mode
                {
                    lnkbtnInstallmentNo.Visible = false;
                    txtAmount.SetDecimalPrefixSuffix(ObjS3GSession.ProGpsPrefixRW, ObjS3GSession.ProGpsSuffixRW, ((ddlPDCNature.SelectedValue == "1") ? true : false), "Amount");
                    txtAmount.Attributes.Remove("onpaste");
                    //txtInstrumentDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtInstrumentDate.ClientID + "','" + strDateFormat + "',false,  true);");
                    //CECInstrumentDate.Format = strDateFormat;
                    txtgvBankingDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtgvBankingDate.ClientID + "','" + strDateFormat + "',false,  true);");
                    CEgvBankingDate.Format = strDateFormat;
                    ddlPDCStatus.SelectedValue = lblStatus.Text;
                    ddlPDCStatus.ClearDropDownList();

                    if (Convert.ToInt32(ddlDraweeBank.SelectedValue) > 0 && Convert.ToString(ddlDraweeBank.SelectedText) != "")
                    {
                        ucgvDraweeBank.SelectedText = Convert.ToString(ddlDraweeBank.SelectedText);
                        ucgvDraweeBank.SelectedValue = Convert.ToString(ddlDraweeBank.SelectedValue);

                        ddlDepositBank.SelectedValue = Convert.ToString(lblgvDepositBankID.Text);

                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            //throw ex;
        }
    }

    private void FunPriGenerateXMLPDC()
    {
        try
        {
            //StrXMLPDC = GRVPDCDetails.FunPubFormXml();
            StrXMLPDC = string.Empty;
            StringBuilder strXML_PDC = new StringBuilder();
            StrXMLPDC = "<Root>";
            Int32 iChequeCnt = 0;
            foreach (GridViewRow grvData in GRVPDCDetails.Rows)
            {
                iChequeCnt = iChequeCnt + 1;
                Label lblPANUM = (Label)grvData.FindControl("lblPANUM");
                Label lblSANUM = (Label)grvData.FindControl("lblSANUM");
                Label lblInstallmentNo = (Label)grvData.FindControl("lblInstallmentNo");
                Label lblInstallmentDate = (Label)grvData.FindControl("lblInstallmentDate");
                TextBox txtInstrumentNo = (TextBox)grvData.FindControl("txtInstrumentNo");
                TextBox txtInstrumentDate = (TextBox)grvData.FindControl("txtInstrumentDate");
                TextBox txtMICRD = (TextBox)grvData.FindControl("txtMICRD");
                TextBox txtAmount = (TextBox)grvData.FindControl("txtAmount");
                DropDownList ddlPDCStatus = (DropDownList)grvData.FindControl("ddlPDCStatus");
                DropDownList ddlDepositBank = (DropDownList)grvData.FindControl("ddlDepositBank");
                UserControls_S3GAutoSuggest ucgvDraweeBank = (UserControls_S3GAutoSuggest)grvData.FindControl("ucgvDraweeBank");
                TextBox txtRemarks = (TextBox)grvData.FindControl("txtRemarks");
                TextBox txtDraweeAccountNo = (TextBox)grvData.FindControl("txtDraweeAccountNo");
                TextBox txtgvBankingDate = (TextBox)grvData.FindControl("txtgvBankingDate");

                strXML_PDC.Clear();

                strXML_PDC.Append("Panum = '" + Convert.ToString(lblPANUM.Text) + "' ");
                strXML_PDC.Append("Sanum = '" + Convert.ToString(lblSANUM.Text) + "' ");

                if (Convert.ToInt32(ddlPDCNature.SelectedValue) == 1)
                    strXML_PDC.Append("Installment_No = '" + Convert.ToString(lblInstallmentNo.Text) + "' ");
                else
                    strXML_PDC.Append("Installment_No = '" + Convert.ToString(iChequeCnt) + "' ");

                if (Convert.ToString(lblInstallmentDate.Text) != string.Empty)
                    strXML_PDC.Append("Installment_Date = '" + Convert.ToString(Utility.StringToDate(lblInstallmentDate.Text)) + "' ");
                strXML_PDC.Append("Instrument_Number = '" + Convert.ToString(txtInstrumentNo.Text) + "' ");
                if (Convert.ToString(txtInstrumentDate.Text) != string.Empty)
                    strXML_PDC.Append("Instrument_Date = '" + Convert.ToString(Utility.StringToDate(txtInstrumentDate.Text)) + "' ");
                else if (Convert.ToString(txtInstrumentDate.Text) == string.Empty && Convert.ToString(txtgvBankingDate.Text) != string.Empty && Convert.ToInt32(ddlPDCNature.SelectedValue) == 2)
                {
                    strXML_PDC.Append("Instrument_Date = '" + Convert.ToString(Utility.StringToDate(txtgvBankingDate.Text)) + "' ");
                }

                strXML_PDC.Append("Instrument_Amount = '" + Convert.ToString(txtAmount.Text) + "' ");
                strXML_PDC.Append("MICR_Number = '" + Convert.ToString(txtMICRD.Text) + "' ");
                strXML_PDC.Append("PDC_Status = '" + Convert.ToString(ddlPDCStatus.SelectedValue) + "' ");
                if (ucgvDraweeBank.SelectedValue != "0" && Convert.ToString(ucgvDraweeBank.SelectedText).Trim() != "")
                {
                    strXML_PDC.Append("Drawee_Bank_ID = '" + Convert.ToString(ucgvDraweeBank.SelectedValue) + "' ");
                    strXML_PDC.Append("Drawee_Bank_Name = '" + Convert.ToString(ucgvDraweeBank.SelectedText) + "' ");
                }

                if (ddlDepositBank.SelectedValue != "0" && Convert.ToString(ddlDepositBank.SelectedItem.Text).Trim() != "")
                {
                    strXML_PDC.Append("DEPOSIT_BANK_ID = '" + Convert.ToString(ddlDepositBank.SelectedValue) + "' ");
                    strXML_PDC.Append("Deposit_Bank_Name = '" + ddlDepositBank.SelectedItem.Text + "' ");
                }

                strXML_PDC.Append("Drawee_Account_Number = '" + Convert.ToString(txtDraweeAccountNo.Text) + "' ");
                strXML_PDC.Append("Remarks = '" + Convert.ToString(txtRemarks.Text) + "' ");

                if (Convert.ToString(txtgvBankingDate.Text) != string.Empty)
                    strXML_PDC.Append("Revised_Bank_Date = '" + Convert.ToString(Utility.StringToDate(txtgvBankingDate.Text)) + "' ");

                StrXMLPDC = StrXMLPDC + "<Details " + Convert.ToString(strXML_PDC).ToUpper() + " />";
            }
            StrXMLPDC = StrXMLPDC + "</Root>";
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriGetBankNames()
    {
        try
        {
            DataSet ds = new DataSet();

            // Drawee Bank Names
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
            dictParam.Add("@Location_ID", Convert.ToString(ddlBranch.SelectedValue));
            dictParam.Add("@Flag", "1");

            ds = Utility.GetDataset(SPNames.S3G_CLN_GetDraweeBank, dictParam);
            ViewState["BankNames"] = ds.Tables[0];
            //ddlDraweeBank.BindDataTable(SPNames.S3G_CLN_GetBankNames, dictParam, new string[] { "SYS_BANK_CODE", "BankNames" });
        }
        catch (Exception objException)
        {
            throw objException;
        }

    }

    private void FunPriBindPDCDummy(string Mode)
    {
        try
        {
            DataTable objDtAddLess = new DataTable();
            if (Mode == "C" || Mode == string.Empty)
            {
                objDtAddLess.Columns.Add("PANUM");
                objDtAddLess.Columns.Add("SANUM");
                objDtAddLess.Columns.Add("InstallmentNo");
                objDtAddLess.Columns.Add("InstallmentDate");
                objDtAddLess.Columns.Add("InstrumentNo");
                objDtAddLess.Columns.Add("InstrumentDate");
                objDtAddLess.Columns.Add("MICR");
                objDtAddLess.Columns.Add("Amount");
                objDtAddLess.Columns.Add("Status");
                objDtAddLess.Columns.Add("Insurance");
                objDtAddLess.Columns.Add("Tax");
                objDtAddLess.Columns.Add("REVISED_BANKDATE");
                objDtAddLess.Columns.Add("othercharges");
                objDtAddLess.Columns.Add("Remarks");
                objDtAddLess.Columns.Add("user_id");
                objDtAddLess.Columns.Add("txn_date");
                objDtAddLess.Columns.Add("Drawee_Bank_ID");
                objDtAddLess.Columns.Add("Drawee_Bank_Name");

                objDtAddLess.Columns.Add("Deposit_Bank_ID");
                //objDtAddLess.Columns.Add("Deposit_Bank_Name");

                objDtAddLess.Columns.Add("Drawee_Account_No");
                objDtAddLess.Columns.Add("Installment_Amount");
                objDtAddLess.Columns.Add("Revised_Bank_Date");
                objDtAddLess.Columns.Add("PDC_DETAILS_ID");

                DataRow objDrAddLess = objDtAddLess.NewRow();
                objDrAddLess["PANUM"] = "";
                objDrAddLess["SANUM"] = "";
                objDrAddLess["InstallmentNo"] = "";
                objDrAddLess["InstallmentDate"] = "";
                objDrAddLess["InstrumentNo"] = "";
                objDrAddLess["InstrumentDate"] = "";
                objDrAddLess["MICR"] = "";
                objDrAddLess["Amount"] = "0.00";
                objDrAddLess["Status"] = "";
                objDrAddLess["Insurance"] = "0.00";
                objDrAddLess["Tax"] = "0.00";
                objDrAddLess["REVISED_BANKDATE"] = "";
                objDrAddLess["othercharges"] = "0.00";
                objDrAddLess["Drawee_Bank_ID"] = "";
                objDrAddLess["Drawee_Bank_Name"] = "";
                objDrAddLess["Deposit_Bank_ID"] = "";
                //objDrAddLess["Deposit_Bank_Name"] = "";
                objDrAddLess["Remarks"] = "";
                objDrAddLess["user_id"] = "";
                objDrAddLess["txn_date"] = "";
                objDrAddLess["Revised_Bank_Date"] = "";
                objDrAddLess["PDC_DETAILS_ID"] = "0";
                objDtAddLess.Rows.Add(objDrAddLess);
                //objDtAddLess.Rows.Clear();
                GRVPDCDetails.DataSource = objDtAddLess;
                GRVPDCDetails.DataBind();
                objDtAddLess.Rows.Clear();
                ViewState["PDCDetails"] = objDtAddLess;
                pnlGRDSeqYes.Visible = true;

                GRVPDCDetails.Rows[0].Visible = false;
                //GRVPDCDetails.Columns[15].Visible = 
                GRVPDCDetails.Columns[9].Visible = false;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    private void FunPriCreateSupplementaryCheque()
    {
        try
        {
            DataTable dtSupplementary = ((DataTable)ViewState["PDCDetails"]).Clone();

            for (Int32 i = 0; i < Convert.ToInt32(txtNoofPDC.Text); i++)
            {

                DataRow objDrAddLess = dtSupplementary.NewRow();
                if (Convert.ToString(txtInstrumentStartNo.Text) == "")
                    objDrAddLess["InstrumentNo"] = "";
                else
                    objDrAddLess["InstrumentNo"] = FunPriLpadZeros(Convert.ToString(Convert.ToInt64(txtInstrumentStartNo.Text) + i), Convert.ToString(txtInstrumentStartNo.Text).Length);
                objDrAddLess["MICR"] = Convert.ToString(txtMICR.Text);
                objDrAddLess["Amount"] = Convert.ToDecimal(0).ToString(Funsetsuffix());
                if (ViewState["Is_PNTD"] != null && Convert.ToString(ViewState["Is_PNTD"]) == "1")
                {
                    objDrAddLess["Status"] = "10";
                }
                else
                {
                    objDrAddLess["Status"] = "1";
                }
                objDrAddLess["Drawee_Bank_ID"] = Convert.ToString(ddlDraweeBank.SelectedValue);
                objDrAddLess["Drawee_Bank_Name"] = Convert.ToString(ddlDraweeBank.SelectedText);
                objDrAddLess["Drawee_Account_No"] = Convert.ToString(txtAccountNumber.Text);

                dtSupplementary.Rows.Add(objDrAddLess);
            }
            pnlGRDSeqYes.Visible = true;
            GRVPDCDetails.DataSource = dtSupplementary;
            GRVPDCDetails.DataBind();
            //FunPriGetAccRepayAmount();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriExportExcel(DataTable dtExport)
    {
        try
        {
            if (dtExport.Rows.Count == 0)
            {
                return;
            }

            GridView Grv = new GridView();
            Grv.DataSource = dtExport;
            Grv.DataBind();
            Grv.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            Grv.ForeColor = System.Drawing.Color.DarkBlue;

            if (Grv.Rows.Count > 0)
            {
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=AccountRepayStructure.xls");
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                Grv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        catch (Exception objException)
        {

        }
    }

    private void FunPriSetProgramName()
    {
        try
        {
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Program_ID", Convert.ToString(intProgramId));
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
    }

    private void FunPriClearDetails()
    {
        try
        {
            txtNoofPDC.Enabled = txtFromInstallmentNo.Enabled =
            ddlInstrmentType.Enabled = txtInstrumentStartNo.Enabled =
            ddlInstrmentSequence.Enabled = txtAuthorizedSign.Enabled = txtAccountNumber.Enabled = ddlDraweeBank.Enabled = txtMICR.Enabled = true;

            ddlInstrmentSequence.SelectedValue = "0";
            //ddlInstrmentType.SelectedValue = "0";
            //ddlPDCNature.SelectedValue = "0";
            ddlDraweeBank.Clear();
            txtInstrumentStartNo.Text = txtInstrumentStartNo.Text =
                txtAuthorizedSign.Text = txtAccountNumber.Text = txtMICR.Text = txtFactCustomerLov.Text = string.Empty;

            ucFactCustomerLov.Clear();
            ucFactCustomerLov.ClearAddressControls();

            if (ddlLOB != null && ddlLOB.SelectedValue != null && Convert.ToString(ddlLOB.SelectedValue) == "4")
            {
                ucFactCustomerLov.Enabled = rfvFactCustomerLov.Enabled = true;
            }
            else
            {
                ucFactCustomerLov.Enabled = rfvFactCustomerLov.Enabled = false;
            }

            GRVPDCDetails.DataSource = null;
            GRVPDCDetails.DataBind();

            GrvExisting.DataSource = null;
            GrvExisting.DataBind();

        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriEnblDsblButtons(bool blnValue)
    {
        try
        {
            if (strMode == "C" || strMode == string.Empty)
            {
                btnCancel.Disabled = btnClear.Disabled = btnGo.Disabled = btnSave.Disabled = btnViewStructure.Disabled = blnValue;
            }
            else
            {
                btnCancel.Disabled = btnViewStructure.Disabled = blnValue;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriPDCNatureChange()
    {
        try
        {
            txtFromInstallmentNo.Text = string.Empty;
            ddlCategory.SelectedValue = "0";
            rfvFromInstallmentNo.Enabled = txtFromInstallmentNo.Enabled = (ddlPDCNature.SelectedValue == "1") ? true : false;
            ddlCategory.Enabled = (ddlPDCNature.SelectedValue == "1") ? false : true;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    #endregion

    #region "WEB METHODS"

    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        UserInfo Uinfo = new UserInfo();

        Procparam.Clear();
        Procparam.Add("@Company_ID", Uinfo.ProCompanyIdRW.ToString());
        Procparam.Add("@Type", "GEN");
        Procparam.Add("@User_ID", Uinfo.ProUserIdRW.ToString());
        Procparam.Add("@Program_Id", "106");
        Procparam.Add("@Lob_Id", obj_Page.ddlLOB.SelectedValue);
        Procparam.Add("@Is_Active", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData(SPNames.S3G_SA_GET_BRANCHLIST, Procparam));

        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetAccountList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        UserInfo Uinfo = new UserInfo();
        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(Uinfo.ProCompanyIdRW));
        Procparam.Add("@User_ID", Convert.ToString(Uinfo.ProUserIdRW));
        //Procparam.Add("@Program_ID", "106");
        Procparam.Add("@Option", "4");
        Procparam.Add("@Pdc_Nature", obj_Page.ddlPDCNature.SelectedValue);
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_Cln_Get_PDCLKP", Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetDraweeBankList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Add("@Company_ID", Convert.ToString(obj_Page.intCompanyID));
        Procparam.Add("@User_ID", Convert.ToString(obj_Page.intUserID));
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_CLN_GET_DRAWEEBANK_AGT", Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();

        Procparam.Add("@COMPANY_ID", Convert.ToString(obj_Page.intCompanyID));
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));

        return suggetions.ToArray();

    }

    [System.Web.Services.WebMethod]
    public static string[] GetFactoringCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();

        Procparam.Add("@COMPANY_ID", Convert.ToString(obj_Page.intCompanyID));
        Procparam.Add("@Program_Id", Convert.ToString(obj_Page.intProgramId));
        if (obj_Page.ucAccountLov.SelectedValue != "" && obj_Page.ucAccountLov.SelectedValue != "0" && obj_Page.ucAccountLov.SelectedText != "")
        {
            Procparam.Add("@PA_SA_REF_ID", Convert.ToString(obj_Page.ucAccountLov.SelectedValue));
        }
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));

        return suggetions.ToArray();

    }

    #endregion

    protected void lnkbtnInstallmentNo_Click(object sender, EventArgs e)
    {
        try
        {
            int intRowIndex = Utility.FunPubGetGridRowID("GRVPDCDetails", ((LinkButton)sender).ClientID);
            Label lblPDCDetailID = (Label)GRVPDCDetails.Rows[intRowIndex].FindControl("lblPDCDetailID");
            Label lblgvInstallmentAmount = (Label)GRVPDCDetails.Rows[intRowIndex].FindControl("lblgvInstallmentAmount");
            Label lblgvInsurance = (Label)GRVPDCDetails.Rows[intRowIndex].FindControl("lblgvInsurance");
            Label lblgvOtherCharges = (Label)GRVPDCDetails.Rows[intRowIndex].FindControl("lblgvOtherCharges");

            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@Option", "5");
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@PDC_DETAIL_ID", Convert.ToString(lblPDCDetailID.Text));

            DataSet dsReceiptDetails = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);

            FunPriEnblDsblButtons(true);
            mpeViewStructure.Show();

            divRepay.Style["display"] = "none";
            divReceipt.Style["display"] = "block";

            DataTable dtReceipt = dsReceiptDetails.Tables[0];

            foreach (DataRow dr in dtReceipt.Rows)
            {
                dr["Installment_Amount"] = Convert.ToDecimal(lblgvInstallmentAmount.Text).ToString(Funsetsuffix());
                dr["Others"] = (Convert.ToDecimal(lblgvInsurance.Text) + Convert.ToDecimal(lblgvOtherCharges.Text)).ToString(Funsetsuffix());
            }
            dtReceipt.AcceptChanges();

            grvReceiptDetails.DataSource = dtReceipt;
            grvReceiptDetails.DataBind();
        }
        catch (Exception objException)
        {
        }
    }

    private string Funsetsuffix()
    {
        int suffix = 1;
        S3GSession ObjS3GSession = new S3GSession();
        suffix = ObjS3GSession.ProGpsSuffixRW;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }

    protected void txtInstrumentStartNo_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtInstrumentStartNo.Text != string.Empty && Convert.ToDecimal(txtInstrumentStartNo.Text) == 0)
            {
                txtInstrumentStartNo.Text = "";
                Utility.FunShowAlertMsg(this, "Cheque Start Number should not be 0.");
                txtInstrumentStartNo.Focus();
                return;
            }

            if (GRVPDCDetails != null && GRVPDCDetails.Rows.Count > 0 && Convert.ToString(txtInstrumentStartNo.Text) != string.Empty)
            {
                Int32 iCount = 0;
                foreach (GridViewRow grvRow in GRVPDCDetails.Rows)
                {
                    TextBox txtInstrumentNo = (TextBox)grvRow.FindControl("txtInstrumentNo");
                    txtInstrumentNo.Text = FunPriLpadZeros(Convert.ToString(Convert.ToInt64(txtInstrumentStartNo.Text) + iCount), Convert.ToString(txtInstrumentStartNo.Text).Length);
                    iCount = iCount + 1;
                }
            }

            txtInstrumentStartNo.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriGetAccRepayAmount()
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@OPTION", "6");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@USER_ID", Convert.ToString(intUserID));
            Procparam.Add("@PASA_REF_ID", Convert.ToString(ucAccountLov.SelectedValue));

            if (ddlDraweeBank.SelectedText != "" && Convert.ToInt32(ddlDraweeBank.SelectedValue) > 0)
            {
                Procparam.Add("@Drawee_Bank_ID", Convert.ToString(ddlDraweeBank.SelectedValue));
            }

            DataSet dsRepayStructure = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);

            if (ddlDraweeBank.SelectedText != "" && Convert.ToInt32(ddlDraweeBank.SelectedValue) > 0)
            {
                Utility.FillDataTable(ddlDepositBankCodes, dsRepayStructure.Tables[0], "BANKMASTER_DETAILS_ID", "BANK_NAME");
                ViewState["Dep_Bank"] = dsRepayStructure.Tables[0];
                //txtDepositBank.Text = Convert.ToString(dsRepayStructure.Tables[0].Rows[0]["Deposit_Bank"]);
                txtTotalRepayAmount.Text = Convert.ToString(dsRepayStructure.Tables[1].Rows[0]["Total_Repay_Amount"]);
            }
            else
            {
                txtTotalRepayAmount.Text = Convert.ToString(dsRepayStructure.Tables[0].Rows[0]["Total_Repay_Amount"]);
            }
        }
        catch (Exception objException)
        {
        }
    }

    private DataTable FunPriGetDepositinGrid(String ddlDraweeBank_Text, String ddlDraweeBank_Value)
    {
        try
        {
            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@OPTION", "8");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@USER_ID", Convert.ToString(intUserID));
            Procparam.Add("@PASA_REF_ID", Convert.ToString(ucAccountLov.SelectedValue));

            if (Convert.ToInt32(ddlDraweeBank_Value) > 0)
            {
                Procparam.Add("@Drawee_Bank_ID", ddlDraweeBank_Value);
            }

            DataSet dsRepayStructure = Utility.GetDataset("S3G_Cln_Get_PDCLKP", Procparam);
            return dsRepayStructure.Tables[0];
        }
        catch (Exception objException)
        {
            return null;
        }
    }

    private string FunPriLpadZeros(string strValue, Int32 intLength)
    {
        string strResult = string.Empty;
        try
        {
            if (strValue.Length < intLength)
                strResult = strValue.PadLeft(intLength, '0');
            else
                strResult = strValue;
        }
        catch (Exception objexception)
        {
            throw objexception;
        }
        return strResult;
    }

    protected void ucFactCustomerLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            TextBox txtFCustomerName = (TextBox)ucFactCustomerLov.FindControl("TxtName");
            TextBox txtFCustomerItemName = (TextBox)ucFactCustomerLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucFactCustomerLov.FindControl("hdnID");
            if (txtFCustomerItemName.Text != "")
                txtFactCustomerLov.Text = txtFCustomerName.Text = txtFCustomerItemName.Text;
            else
                txtFactCustomerLov.Text = txtFCustomerName.Text;
            hdnCID.Value = ucFactCustomerLov.SelectedValue;

            FunPriLoadFactCustomerDetails(Convert.ToString(hdnCID.Value));

            if (ddlPDCNature.Enabled == true)
                ddlPDCNature.Focus();
            else
                txtNoofPDC.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadFactCustomerDetails(string strCustomerID)
    {
        try
        {
            StringBuilder strFormAddress = new StringBuilder();

            Procparam = Utility.FunPubClearDictParam(Procparam);
            Procparam.Add("@Option", "1");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@CustomerId", strCustomerID);
            DataSet ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", Procparam);

            if (ds.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                {
                    strFormAddress.Append(Environment.NewLine);
                    strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + Convert.ToString(ds.Tables[0].Rows[0][i]));

                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                    {
                        strFormAddress.Replace(Convert.ToString(ds.Tables[1].Rows[i]["COLUMN_NAME"]).ToUpper(), Convert.ToString(ds.Tables[1].Rows[i]["DISPLAY_TEXT"]));
                    }
                }

                FunPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucFactCustomerLov);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    void AssignNewWorkFlowValues(int SelecteDocument, int SelectedProgramId, string SelectedDocumentNo, int BranchID, int LOBId, int ProductId, string LasDocumentNo, DataTable WFSequence)
    {
        WorkFlowSession WFValues = new WorkFlowSession(SelecteDocument, SelectedProgramId, SelectedDocumentNo, BranchID, LOBId, ProductId, LasDocumentNo, 2);
        WFValues.WorkFlowScreens = WFSequence;
    }


    protected void btnModalCNF_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriConfirmSave();
        }
        catch (Exception objException)
        {
        }
    }
    private int WFLOBId { get { return int.Parse(ddlLOB.SelectedValue); } }
    private int WFBranchId { get { return int.Parse(ddlBranch.SelectedValue); } }
    private int WFProductId { get { return int.Parse(ViewState["Product_id"].ToString()); } }
}
