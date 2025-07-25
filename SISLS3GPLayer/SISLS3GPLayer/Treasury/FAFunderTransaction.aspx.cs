/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name               : Financial Accounting
/// Screen Name               : Funder Transaction
/// Created By                : Muni Kavitha    
/// Created Date              : 8-Feb-2012
/// Purpose                   : 
/// Last Updated By           : Chandra Sekhar BS
/// Last Updated Date         : 1-Oct-2013
/// Reason                    : Location Auto Suggest

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
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Microsoft.VisualBasic;

using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using iTextSharp.text.html;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

#endregion

public partial class Financial_Accounting_FAFunderTransaction : ApplyThemeForProject_FA
{

    #region Initialization

    int intCompanyID, intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strFunder_Tran_ID = string.Empty;
    string strFunder_Tran_No = string.Empty;
    string strDateFormat = string.Empty;
    int intErrCode = 0;
    int intFunder_Tran_ID = 0;
    bool IsExist = true;
    string validationCode;
    //string strMode = string.Empty;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASerializationMode ObjSerMode = FASerializationMode.Binary;
    StringBuilder sbFunderMasterXML = new StringBuilder();
    DataTable dtReceiving = null;
    DataTable dtRepay = null;
    DataTable dtFRefNo = null;
    DataTable dtCashFlows = null;
    StringBuilder sbReceivingXML;
    StringBuilder sbCashFlowsXML;
    FASession objFASession;
    List<string> LstReceived = new List<string>();
    List<string> LstRepay = new List<string>();
    DataTable dtTemp = new DataTable();
    DataTable dtMorotorium = new DataTable();
    DataTable dtHoliday = new DataTable();
    DataTable dtInterest = new DataTable();
    FAAdminServiceReference.FAAdminServicesClient objAdminServices;
    FunderInvestmentMgtService.FunderInvestmentMgtServiceClient objFunderTransaction;
    FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranDataTable objFA_FunderTransaction_DTB;
    FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranRow objFA_FunderTransactionRow;

    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "~/Treasury/FATransLander.aspx?Code=FUNT";
    string strRedirectPageAdd = "window.location.href='../Treasury/FAFunderTransaction.aspx';";
    string strRedirectPageView = "window.location.href='../Treasury/FATransLander.aspx?Code=FUNT';";

    static string strPageName = "Funder Transaction";
    //User Authorization
    string strMode = "C";//string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    string strConnectionName = string.Empty;


    //Code end
    #endregion
    #region Button Click Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation._1433;
            cvFunderTransaction.IsValid = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            btnSave.Enabled_False();
            //  FunSaveDetails();
            bool blnCheck = true;
            if (ViewState["Fund_Nature"] != null)
            {
                switch (ViewState["Fund_Nature"].ToString())
                {
                    //case "1"://	Term Loan
                    //case "2"://	Term Loan	Non-Convertible Depenture
                    //case "3"://	Term Loan	Bonds
                    //case "4"://	Term Loan	Working Capital
                    //case "5"://	Cash Credit
                    //case "6"://	Letter of Credit
                    //case "7"://	Bank Guarntee
                    case "8"://	Commercial Papers
                    case "4"://Working Capital
                        blnCheck = false;
                        break;
                    //case "9"://	Buyers Credit
                    //case "10"://	WC Short Term Loan
                    //case "11"://	Over Draft
                }
            }

            if (blnCheck)
            {
                dtReceiving = (DataTable)ViewState["DT_Receiving"];
                if (dtReceiving.Rows.Count > 0 && Convert.ToString(dtReceiving.Rows[0]["Serial_Number"]) == "0")
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Add Fund Reference Details in Receiving Schedule Details");
                    btnSave.Enabled_True();
                    return;
                }

                if (ViewState["DueTotal"] != null)
                {
                    //if (Convert.ToDecimal(txtCommitAmt.Text) < Convert.ToDecimal(ViewState["DueTotal"]))
                    if (Convert.ToDecimal(txtTransactionAmt.Text) < Convert.ToDecimal(ViewState["DueTotal"]))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Commitment Amount cannot be less than Received Amount");
                        btnSave.Enabled_True();
                        return;
                    }
                }

            }
            else
            {
                if (ViewState["Fund_Nature"] != null)
                {
                    if (ViewState["Fund_Nature"].ToString() == "8")//Commercial paper
                    {
                        if (Utility_FA.StringToDate(txtValidUpto.Text.Trim()) > Utility_FA.StringToDate(txtFundTransDate.Text.Trim()).AddYears(1))
                        {
                            Utility_FA.FunShowAlertMsg_FA(this.Page, "Maximum validity for commercial paper is 365 days");
                            txtTenure.Focus();
                            btnSave.Enabled_True();
                            return;
                        }
                    }
                }
            }
            // Utility_FA.FunShowValidationMsg_FA(this.Page, FunPriSaveDetails(), strRedirectPageAdd, strRedirectPageView, strMode, false);
            int OutResult;
            OutResult = FunPriSaveDetails();
            switch (OutResult)
            {
                case 1431:
                    Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, strRedirectPageAdd, strRedirectPageView, strMode, false, strFunder_Tran_No, true);
                    break;
                case 1432:
                    Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, strRedirectPageAdd, strRedirectPageView, strMode, false, null, false);
                    break;
                default:
                    btnSave.Enabled_True();
                    Utility_FA.FunShowValidationMsg_FA(this, OutResult);
                    break;
            }

            //if (OutResult != 1431 && OutResult != 1432)
            //    Utility_FA.FunShowValidationMsg_FA(this, OutResult);
            //else
            //    Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, strRedirectPageAdd, strRedirectPageView, strMode, false);

        }
        catch (Exception objException)
        {
            btnSave.Enabled_True();
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation._1434;
            cvFunderTransaction.IsValid = false;
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriClearPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation._1435;
            //cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(validationCode);
            cvFunderTransaction.IsValid = false;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["Popup"] != null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "window.close();", true);
            }
            else
            {
                Response.Redirect(strRedirectPage);
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }


    #endregion



    protected void btnHedgeGo_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = (Button)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            if (row.RowType == DataControlRowType.DataRow)
                ViewState["gvHedgeRowIndex"] = row.RowIndex;
            else
                ViewState["gvHedgeRowIndex"] = null;

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@CompanyID", intCompanyID.ToString());
            DataTable dtHedging = new DataTable();
            dtHedging = Utility_FA.GetDefaultData("fa_get_hedging", Procparam);
            if (dtHedging.Rows.Count > 0)
            {
                grvHedging.DataSource = dtHedging;
                grvHedging.DataBind();
                lblmodalerror.Visible = false;
            }
            else
            {
                grvHedging.DataSource = dtHedging;
                grvHedging.DataBind();
                lblmodalerror.Visible = true;
                lblmodalerror.Text = "No Existing Records Available !";
            }
            ModalPopupExtenderHedging.Show();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow GvRow in grvHedging.Rows)
        {
            CheckBox chkSelect = (CheckBox)GvRow.FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {
                string strHedgeNo = ((Label)GvRow.FindControl("lblCode")).Text;
                if (ViewState["gvHedgeRowIndex"] != null)
                    ((Label)gvBorrowerRepay.Rows[Convert.ToInt32(ViewState["gvHedgeRowIndex"])].FindControl("lblHedgeNo")).Text = strHedgeNo;
                else
                    ((Label)gvBorrowerRepay.FooterRow.FindControl("lblHedgeNo")).Text = strHedgeNo;
            }
        }
        ModalPopupExtenderHedging.Hide();
        grvHedging.DataSource = null;
        grvHedging.DataBind();
    }

    protected void btnDEVModalCancel_Click(object sender, EventArgs e)
    {
        ModalPopupExtenderHedging.Hide();
    }






    #region Page Load Event

    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            //Code end

            objFASession = new FASession();
            strDateFormat = objFASession.ProDateFormatRW;
            CalendarExtender1.Format = strDateFormat;
            CEReceivingDate.Format = CERepayDate.Format = strDateFormat;
            CEDateofAvailment.Format = CEAllotmentDate.Format = strDateFormat;
            CEInterestLevy.Format = CEInterestCalcdate.Format = strDateFormat;
            txtFundTransDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFundTransDate.ClientID + "','" + strDateFormat + "',false,  false);");
            txtRepayDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRepayDate.ClientID + "','" + strDateFormat + "',false,  false);");

            CESubscriptionFrom.Format = strDateFormat;
            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;

            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strMode = Request.QueryString.Get("qsMode");
                strFunder_Tran_ID = fromTicket.Name;
            }
            strConnectionName = objFASession.ProConnectionName;

            if (!IsPostBack)
            {
                FunPriLoadLocation();
                FunPriLoadFunderCodes();
                FunPriLoadDealNos();
                FunPriLoadFundNature();
                FunPriInsertReceiving(LstReceived);
                //FunPriInsertRepay(LstRepay);
                FunPriSetEmptyRepayTbl();

                FunPriLoadPrinci_Int_Payable();
                FunPriSetEmptyCFtbl();
                FunPriSetEmptyIntSchd();
                FunPriSetCFFooterLOV();
                FunPriLoadInvestmentLean();
                FunPriSetEmptyMorotoriumtbl();
                if (Request.QueryString["qsMode"] == "Q")
                {
                    FunPriGetFunderTransaction(strFunder_Tran_ID);
                    FunPriDisableControls(-1);
                }
                else if (Request.QueryString["qsMode"] == "M")
                {
                    FunPriGetFunderTransaction(strFunder_Tran_ID);
                    FunPriDisableControls(1);
                }
                else
                {
                    FunPriDisableControls(0);
                }


            }
            ddlArrangement.AddItemToolTipText_FA();
            ddlFunderCode.AddItemToolTipText_FA();
            //txtCommitAmt.SetDecimalPrefixSuffix_FA(12, 0, true, "Commitment Amount");
            txtTransactionAmt.SetDecimalPrefixSuffix_FA(12, 4, true, "Transaction Amount");
            txtTransactionamtINR.SetDecimalPrefixSuffix_FA(12, 4, true, "Transaction Amount INR");
            Label lblTotDue = (Label)gvReceiving.FooterRow.FindControl("lblTotDue");
            txtValidUpto.Attributes.Add("Readonly", "true");
            //txtCommitAmt.Attributes.Add("onblur", "return fnAmountChange('" + lblTotDue.ClientID + "');");

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion

    #region Dropdown Events

    protected void ddlFunderCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //FunPriLoadDealNos();
            FunPriLoadFunderAddress();
            //FunProGetFunderDetails();
            ddlFunderCode.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlDealNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadTrancheNos("C");
            FunPriLoadTrancheDtls();
            ddlDealNumber.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlPrevFundTran_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriGetFunderTransaction(ddlPrevFundTran.SelectedValue);

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadCashFlowMaster();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlTrancheRefNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadTrancheDtls();
            FunPriSetAmountcheck(false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void ddlOutflowType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //FunPriLoadTrancheDtls();
            if (ddlOutflowType.SelectedValue == "7")//on maturity
            {

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlFields_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlFields.SelectedIndex > 0)
            {
                txtFormula.Text = txtFormula.Text + ddlFields.SelectedItem.Text;
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void ddlNumericOperators_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlNumericOperators.SelectedIndex > 0)
            {
                txtFormula.Text = txtFormula.Text + ddlNumericOperators.SelectedItem.Text;
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void chkCP_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            if (chkCP.Checked)
            {
                ddlPrevFundTran.Enabled = true;

            }
            else
            {
                ddlPrevFundTran.Enabled = false;
            }
            FunGetPrevFundTranNo();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunGetPrevFundTranNo()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            if (ddlFunderCode.SelectedIndex > 0)
                Procparam.Add("@Id", ddlFunderCode.SelectedValue);
            Procparam.Add("@Option", "10");
            ddlPrevFundTran.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "Funder_Tran_ID", "Funder_Tran_No" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    //protected void cbkCondition_CheckedChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        CheckBox cbkCondition = (CheckBox)grvCashflows.FooterRow.FindControl("cbkCondition");
    //        if (cbkCondition.Checked)
    //            pnlConditions.Visible = true;
    //        else
    //            pnlConditions.Visible = false;
    //    }
    //    catch (Exception ex)
    //    {
    //          FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}

    //protected void cbkConditionI_CheckedChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        CheckBox cbkCondition = (CheckBox)sender;
    //        GridViewRow gvRow = (GridViewRow)cbkCondition.Parent.Parent;
    //        Label lblCondition = (Label)grvCashflows.Rows[gvRow.RowIndex].FindControl("lblCondition");
    //        if (cbkCondition.Checked)
    //        {
    //            pnlConditions.Visible = true;
    //            if (lblCondition != null)
    //            {
    //                if (!string.IsNullOrEmpty(lblCondition.Text))
    //                    txtFormula.Text = lblCondition.Text;
    //            }
    //        }
    //        else
    //        {
    //            pnlConditions.Visible = false;
    //            txtFormula.Text = string.Empty;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //          FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}

    protected void cbkCondition_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox cbkCondition = (CheckBox)grvCashflows.FooterRow.FindControl("cbkCondition");
            TextBox txtCFAmount = (TextBox)grvCashflows.FooterRow.FindControl("txtCFAmount");
            if (cbkCondition.Checked)
                pnlConditions.Visible = true;
            else
            {
                pnlConditions.Visible = false;

                //if (ViewState["Fund_Nature"] != null)
                //{
                //    if (ViewState["Fund_Nature"].ToString() == "4" || ViewState["Fund_Nature"].ToString() == "10")
                //    {
                txtCFAmount.Text = FunGetCFAmount().ToString();
                //    }
                //}
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void cbkConditionI_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox cbkCondition = (CheckBox)sender;
            GridViewRow gvRow = (GridViewRow)cbkCondition.Parent.Parent;
            Label lblCondition = (Label)grvCashflows.Rows[gvRow.RowIndex].FindControl("lblCondition");
            Label lblCFAmount = (Label)grvCashflows.Rows[gvRow.RowIndex].FindControl("lblCFAmount");
            if (cbkCondition.Checked)
            {
                pnlConditions.Visible = true;
                if (lblCondition != null)
                {
                    if (!string.IsNullOrEmpty(lblCondition.Text))
                        txtFormula.Text = lblCondition.Text;
                }
            }
            else
            {
                pnlConditions.Visible = false;
                //if (ViewState["Fund_Nature"] != null)
                //{
                //    if (ViewState["Fund_Nature"].ToString() == "4" || ViewState["Fund_Nature"].ToString() == "10")
                //    {

                dtCashFlows = (DataTable)ViewState["dtCashFlows"];

                dtCashFlows.Rows[gvRow.RowIndex]["Condition"] = txtFormula.Text;
                if (!string.IsNullOrEmpty(txtFormula.Text))
                    dtCashFlows.Rows[gvRow.RowIndex]["CFAmount"] = FunGetCFAmount();
                dtCashFlows.AcceptChanges();
                ViewState["dtCashFlows"] = dtCashFlows;
                grvCashflows.DataSource = dtCashFlows;
                grvCashflows.DataBind();

                //    }
                //}
                txtFormula.Text = string.Empty;
            }


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion

    #region User Defined Methods

    private void FunPriSetEmptyCFtbl()
    {
        try
        {
            DataRow drEmptyRow;
            dtCashFlows = new DataTable();
            dtCashFlows.Columns.Add("Serial_Number");
            dtCashFlows.Columns.Add("Fund_CF_ID");
            dtCashFlows.Columns.Add("Type");
            dtCashFlows.Columns.Add("TypeID");
            dtCashFlows.Columns.Add("CashFlow");
            dtCashFlows.Columns.Add("CashFlowID");
            dtCashFlows.Columns.Add("Frequency");
            dtCashFlows.Columns.Add("FrequencyID");
            dtCashFlows.Columns.Add("CFDate");
            dtCashFlows.Columns.Add("CFAmount");
            dtCashFlows.Columns.Add("Jv_No");
            dtCashFlows.Columns.Add("Condition");
            drEmptyRow = dtCashFlows.NewRow();
            drEmptyRow["Serial_Number"] = "0";
            dtCashFlows.Rows.Add(drEmptyRow);
            ViewState["dtCashFlows"] = dtCashFlows;
            FunFillgrid(grvCashflows, dtCashFlows);
            grvCashflows.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriSetCFFooterLOV()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Program_ID", "15");
            Procparam.Add("@LookupType_Code", "57");//Fields
            ddlFields.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            Procparam.Remove("@LookupType_Code");
            Procparam.Add("@LookupType_Code", "58");//Numeric Operator
            ddlNumericOperators.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            FunPriSetCFFooter();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriSetCFFooter()
    {
        try
        {
            if (grvCashflows != null)
            {
                if (grvCashflows.FooterRow != null)
                {
                    DropDownList ddlType = (DropDownList)grvCashflows.FooterRow.FindControl("ddlType");
                    DropDownList ddlFrequency = (DropDownList)grvCashflows.FooterRow.FindControl("ddlFrequency");
                    //Type
                    Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Program_ID", "15");
                    Procparam.Add("@LookupType_Code", "16");//Cash flow type
                    DataTable dt = Utility_FA.GetDefaultData("FA_GET_LOOKUP_VALUES", Procparam);
                    if (dt.Rows.Count > 0)
                    {
                        dt.Rows[2].Delete();//removing Both
                        dt.AcceptChanges();
                        ddlType.FillDataTable(dt, "Lookup_Code", "Lookup_Desc");
                    }
                    //ddlType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
                    Procparam.Remove("@LookupType_Code");
                    Procparam.Add("@LookupType_Code", "55");//Repay Type//Frequency
                    ddlFrequency.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadCashFlowMaster()
    {
        try
        {
            DropDownList ddlType = (DropDownList)grvCashflows.FooterRow.FindControl("ddlType");
            DropDownList ddlCashFlow = (DropDownList)grvCashflows.FooterRow.FindControl("ddlCashFlow");
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (ddlType.SelectedIndex > 0)
                Procparam.Add("@Value", ddlType.SelectedItem.Text.ToUpper());
            Procparam.Add("@Option", "6");
            ddlCashFlow.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "CashFlow_ID", "CF_Description" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriSetEmptyIntSchd()
    {
        try
        {
            dtInterest = new DataTable();
            dtInterest.Columns.Add("Serial_Number");
            dtInterest.Columns.Add("Fund_Ref_No");
            dtInterest.Columns.Add("Due_Date");
            dtInterest.Columns.Add("Due_Amount");
            dtInterest.Columns.Add("From_Date");
            dtInterest.Columns.Add("OSAmount");
            dtInterest.Columns.Add("Rate");
            dtInterest.Columns.Add("No_of_days");
            ViewState["dtInterest"] = dtInterest;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to load/Bind the grid for the given datatable.
    /// </summary>
    /// <param name="grv"></param>
    /// <param name="dtEntityBankdetails"></param>

    private void FunFillgrid(GridView grv, DataTable dtbl)
    {
        try
        {
            grv.DataSource = dtbl;
            grv.DataBind();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadFundNature()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Option", "8");
            ddlNatureofFund.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadFunderAddress()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            //if (ddlFunderCode.SelectedIndex > 0)
            Procparam.Add("@ID", ddlFunderCode.SelectedValue);
            Procparam.Add("@Option", "3");
            DataTable dt = Utility_FA.GetDefaultData("FA_Get_Deal_Fund_Dtls", Procparam);
            txtComState.Text = txtComCity.Text = txtComCountry.Text = txtComPincode.Text = string.Empty;
            ddlLocation.Clear_FA();
            ViewState["Location_ID"] = null;
            ViewState["Location_Code"] = null;
            if (dt.Rows.Count > 0)
            {
                txtComState.Text = dt.Rows[0]["State"].ToString();
                txtComCity.Text = dt.Rows[0]["City"].ToString();
                txtComCountry.Text = dt.Rows[0]["Country"].ToString();
                txtComPincode.Text = dt.Rows[0]["Pincode"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Location"].ToString()))
                    ddlLocation.SelectedText = dt.Rows[0]["Location"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Location_ID"].ToString()))
                    ddlLocation.SelectedValue = dt.Rows[0]["Location_ID"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Location_Code"].ToString()))
                    ViewState["Location_Code"] = dt.Rows[0]["Location_Code"].ToString();
            }
            if (ViewState["Location_Code"] != null)
                FunGetHolidayDates(ViewState["Location_Code"].ToString());

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadDealNos()
    {
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
        Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
        //if (ddlFunderCode.SelectedIndex > 0)
        //    Procparam.Add("@ID", ddlFunderCode.SelectedValue);
        Procparam.Add("@Option", "1");
        ddlDealNumber.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "Deal_id", "Deal_No" });
    }

    public void FunpriLoadPop()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());


            //ModalPopupExtenderApprover.Show();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadTrancheNos(string StrMode)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (ddlDealNumber.SelectedIndex > 0)
                Procparam.Add("@ID", ddlDealNumber.SelectedValue);
            if (StrMode == "M")
                Procparam.Add("@Value", "1");
            Procparam.Add("@Option", "2");
            ddlTrancheRefNo.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "Trench_Ref_No", "Trench_Ref_No" });
            //  ddlTrancheRefNo.SelectedIndex = 1;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadInvestmentLean()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@Option", "5");
            ddlInvestmentLein.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "Invest_Header_ID", "Investment_Tran_No" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadTrancheDtls()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            Procparam.Add("@Value", ddlTrancheRefNo.SelectedValue);
            Procparam.Add("@Id", ddlDealNumber.SelectedValue);
            Procparam.Add("@Option", "4");

            DataTable dt = Utility_FA.GetDefaultData("FA_Get_Deal_Fund_Dtls", Procparam);
            ViewState["Deal_Details"] = dt;
            txtBaseRate.Text = txtSpreadRate.Text = txtTotalRate.Text = txtCurrecncyCode.Text =
             txtCurrencyValue.Text = txtCommitAmt.Text = txtCommitAmtINR.Text =
             txtTrancheAmt.Text = txtTrancheAmtINR.Text = txtAvailedAmt.Text = txtAvailedAmtINR.Text =
             txtTransactionAmt.Text = txtTransactionamtINR.Text = string.Empty;
            ddlNatureofFund.SelectedIndex = -1;
            ViewState["Fund_Nature"] = null; ViewState["Currency_Code"] = null;
            if (dt.Rows.Count > 0)
            {

                if (!string.IsNullOrEmpty(dt.Rows[0]["Base_Rate_Per"].ToString()))
                    txtBaseRate.Text = dt.Rows[0]["Base_Rate_Per"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Variable_Rate_Per"].ToString()))
                    txtSpreadRate.Text = dt.Rows[0]["Variable_Rate_Per"].ToString();
                else
                    txtSpreadRate.Text = "0";
                if (!string.IsNullOrEmpty(dt.Rows[0]["Total_Rate_Per"].ToString()))
                    txtTotalRate.Text = dt.Rows[0]["Total_Rate_Per"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Currency_Name"].ToString()))
                    txtCurrecncyCode.Text = dt.Rows[0]["Currency_Name"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Currency_Code"].ToString()))
                    ViewState["Currency_Code"] = dt.Rows[0]["Currency_Code"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Currency_Value"].ToString()))
                    txtCurrencyValue.Text = dt.Rows[0]["Currency_Value"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Commitment_Amount"].ToString()))
                    txtCommitAmt.Text = dt.Rows[0]["Commitment_Amount"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Commitment_AmountINR"].ToString()))
                    txtCommitAmtINR.Text = dt.Rows[0]["Commitment_AmountINR"].ToString();

                if (!string.IsNullOrEmpty(dt.Rows[0]["Facility_Amount"].ToString()))
                    txtTrancheAmt.Text = dt.Rows[0]["Facility_Amount"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Facility_AmountINR"].ToString()))
                    txtTrancheAmtINR.Text = dt.Rows[0]["Facility_AmountINR"].ToString();

                if (!string.IsNullOrEmpty(dt.Rows[0]["AvailAmt"].ToString()))
                    txtAvailedAmt.Text = dt.Rows[0]["AvailAmt"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["AvailAmtINR"].ToString()))
                    txtAvailedAmtINR.Text = dt.Rows[0]["AvailAmtINR"].ToString();

                if (!string.IsNullOrEmpty(dt.Rows[0]["Tran_Amount"].ToString()))
                    txtTransactionAmt.Text = dt.Rows[0]["Tran_Amount"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["Tran_AmountINR"].ToString()))
                    txtTransactionamtINR.Text = dt.Rows[0]["Tran_AmountINR"].ToString();

                if (dt.Rows[0]["Currency_code"].ToString() == string.Empty)
                {

                    lblTransactionAmt.Text = "Transaction Amount(OMR)";
                    lblTransactionAmtINR.Text = "Transaction Amount(FC)";
                    txtTransactionamtINR.Text = "";
                    txtTransactionamtINR.ReadOnly = true;
                    lblCommitmentAmt.Text = " Commitment Amount(OMR)";
                    lblCommitmentAmtINR.Text = "Commitment Amount(FC)";
                    txtCommitAmtINR.Text = "";
                    txtCommitAmtINR.ReadOnly = true;
                    lblAvailedAmt.Text = "Availed Amount(OMR)";
                    lblAvailedAmtINR.Text = "Availed Amount(FC)";
                    txtAvailedAmtINR.Text = "";
                    txtAvailedAmtINR.ReadOnly = true;
                    lblTrancheAmount.Text = "Tranche Amount(OMR)";
                    lblTrancheAmountINR.Text = "Tranche Amount(FC)";
                    txtTrancheAmtINR.Text = "";
                    txtTrancheAmtINR.ReadOnly = true;


                }
                else
                {
                    lblTransactionAmt.Text = "Transaction Amount(FC)";
                    lblTransactionAmtINR.Text = "Transaction Amount(OMR)";
                    lblCommitmentAmt.Text = " Commitment Amount(FC)";
                    lblCommitmentAmtINR.Text = "Commitment Amount(OMR)";
                    lblAvailedAmt.Text = "Availed Amount(FC)";
                    lblAvailedAmtINR.Text = "Availed Amount(OMR)";
                    lblTrancheAmount.Text = "Tranche Amount(FC)";
                    lblTrancheAmountINR.Text = "Tranche Amount(OMR)";
                }
                if (!string.IsNullOrEmpty(dt.Rows[0]["Fund_Nature"].ToString()))
                {
                    ViewState["Fund_Nature"] = dt.Rows[0]["Fund_Nature"].ToString();
                    ddlNatureofFund.SelectedValue = dt.Rows[0]["Fund_Nature"].ToString();
                }

                if (!string.IsNullOrEmpty(dt.Rows[0]["DiscAmount"].ToString()))
                {
                    if (ddlNatureofFund.SelectedValue == "8")//Commercial Paper
                        ViewState["DiscAmount"] = txtTotalRate.Text = dt.Rows[0]["DiscAmount"].ToString();

                }

                FunPriLoadFunderCodes();
                // ddlFunderCode.SelectedIndex = -1;
                if (!string.IsNullOrEmpty(dt.Rows[0]["Funder_Id"].ToString()))
                {
                    if (Convert.ToInt32(dt.Rows[0]["Funder_Id"]) > 0)
                    {
                        //FunPriLoadFunderCodes();
                        ddlFunderCode.SelectedValue = dt.Rows[0]["Funder_Id"].ToString();
                        ddlFunderCode.ClearDropDownList_FA();
                    }
                }

                FunPriLoadFunderAddress();

            }
            else
            {
                FunPriLoadFunderCodes();
                ddlFunderCode.SelectedIndex = -1;
                FunPriLoadFunderAddress();

            }





            if (ViewState["Fund_Nature"] != null)
            {
                FunSetNatureType(ViewState["Fund_Nature"].ToString());
            }
            FunPriSetEmptyRepayTbl();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunSetNatureType(string strNatureType)
    {
        try
        {
            if (!string.IsNullOrEmpty(strNatureType))
            {
                pnlLC.Visible = pnlCP.Visible = false;
                tpSchedule.Enabled = TabMoratorium.Enabled =
                TpBorower.Enabled = true;
                RFVInterestLevy.Enabled =
                    rfvddlInterestLevy.Enabled =
                        rfvddlInterestCalc.Enabled =
                        RFVInterestCalcdate.Enabled = false;
                ddlInterestLevy.Enabled = true;
                switch (strNatureType)
                {
                    case "8"://Commercial paper
                        pnlCP.Visible = true;
                        //RFVtxtCOF.Enabled = true;
                        txtInterestLevy.Text = txtValidUpto.Text;
                        ddlInterestLevy.Enabled = false;
                        break;
                    case "6"://Letter of Credit
                        tpSchedule.Enabled =
                       TabMoratorium.Enabled =
                       TpBorower.Enabled = false;
                        pnlLC.Visible = true;
                        FunPriLoadLC_Type("68");
                        pnlLC.GroupingText = "Letter Credit Details";
                        lblLCAmount.Text = "LC Amount ";
                        lblLCValidity.Text = "LC Validity";
                        lblLCAvailmentDate.Text = "LC Availment Date";
                        lblFavouring_Of.Text = "LC Favouring Of";
                        lblLC_Type.Text = "LC Type";
                        lblPurpose.Text = "LC Purpose";
                        //RFVtxtCOF.Enabled = false;
                        break;
                    case "7"://Bank Guarntee
                        tpSchedule.Enabled =
                       TabMoratorium.Enabled =
                       TpBorower.Enabled = false;
                        pnlLC.Visible = true;
                        FunPriLoadLC_Type("69");
                        pnlLC.GroupingText = "Bank Guarntee Details";
                        lblLCAmount.Text = "BG Amount ";
                        lblLCValidity.Text = "BG Validity";
                        lblLCAvailmentDate.Text = "BG Availment Date";
                        lblFavouring_Of.Text = "BG Favouring Of";
                        lblLC_Type.Text = "BG Type";
                        lblPurpose.Text = "BG Purpose";
                        //RFVtxtCOF.Enabled = false;
                        break;
                    case "4"://Working Capital
                        //tpInterest.Enabled = false;
                        tpSchedule.Enabled =
                        TabMoratorium.Enabled =
                        TpBorower.Enabled = false;
                        //RFVtxtCOF.Enabled = false;
                        RFVInterestLevy.Enabled =
                        rfvddlInterestLevy.Enabled =
                        rfvddlInterestCalc.Enabled =
                        RFVInterestCalcdate.Enabled = true;
                        break;
                    default:
                        //RFVtxtCOF.Enabled = true;
                        RFVInterestLevy.Enabled =
                        rfvddlInterestLevy.Enabled =
                        rfvddlInterestCalc.Enabled =
                        RFVInterestCalcdate.Enabled = true;
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadLC_Type(string strlookuptpe)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Program_ID", "15");
            Procparam.Add("@LookupType_Code", strlookuptpe);//LC Type
            ddlLC_Type.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriLoadPrinci_Int_Payable()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            //.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Program_ID", "15");
            Procparam.Add("@LookupType_Code", "53");
            ddlOutflowType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            ddlInflowType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            //Procparam.Remove("@LookupType_Code");
            //Procparam.Add("@LookupType_Code", "54");//Interest
            //ddlInterestPayableType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            Procparam.Remove("@LookupType_Code");
            Procparam.Add("@LookupType_Code", "55");//Repay Type
            ddlRepaymentType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            ddlReceivingType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            ddlInterestLevy.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });

            Procparam.Remove("@LookupType_Code");
            Procparam.Add("@LookupType_Code", "70");//Interest calculation Type
            ddlInterestCalc.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            Procparam.Remove("@LookupType_Code");
            Procparam.Add("@LookupType_Code", "56");//Tenure Type
            ddlTenureType.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    //This is used to implement User Authorization
    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                if (!bCreate)
                {
                    btnSave.Enabled_False();
                }
                txtFundTransDate.Text = DateTime.Now.ToString(strDateFormat);
                ddlArrangement.SelectedValue = "1";
                FunPriSetAmountcheck(false);//To check valid tran amount
                //pnlInterest.Visible = false;
                //tpInterest.Enabled = false;
                txtReceivingDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivingDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtRepayDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRepayDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtAllotmentDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtAllotmentDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtDateofAvailment.Attributes.Add("onblur", "fnDoDate(this,'" + txtDateofAvailment.ClientID + "','" + strDateFormat + "',false,  false);");
                pnlLetterNo.Visible = false;

                break;

            case 1: // Modify Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                btnClear.Enabled_False();
                if (!bModify)
                {

                }
                pnlLetterNo.Visible = true;
                if (ViewState["Auth_Stat"] != null)
                {
                    string strApproved = ViewState["Auth_Stat"].ToString();
                    if (!string.IsNullOrEmpty(strApproved))
                        if (strApproved != "N")
                        {
                            QueryView();
                        }
                }

                txtReceivingDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivingDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtRepayDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRepayDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtAllotmentDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtAllotmentDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtDateofAvailment.Attributes.Add("onblur", "fnDoDate(this,'" + txtDateofAvailment.ClientID + "','" + strDateFormat + "',false,  false);");


                Utility_FA.ClearDropDownList_FA(ddlFunderCode);
                Utility_FA.ClearDropDownList_FA(ddlArrangement);
                Utility_FA.ClearDropDownList_FA(ddlDealNumber);
                Utility_FA.ClearDropDownList_FA(ddlTrancheRefNo);
                ddlLocation.Enabled = false;
                if (Utility_FA.CompareDates(txtValidUpto.Text.Trim(), DateTime.Now.ToString(strDateFormat)) == 1)
                    txtCommitAmt.Enabled = false;

                if (ViewState["Currency_Code"] != null)//For Foreign currency hedging concept
                {
                    btnSave.Enabled_True();
                }
                btnDrawdown.Visible = lblReportType.Visible = ddlReportType.Visible = true; //By Siva.K For Report 20JUL2015

                // pnlCP.Visible = false;
                break;

            case -1:// Query Mode
                pnlLetterNo.Visible = true;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                QueryView();
                btnDrawdown.Visible = lblReportType.Visible = ddlReportType.Visible = true;//By Siva.K For Report 20JUL2015
                break;
        }
    }
    //Code end
    private void QueryView()
    {
        try
        {
            btnValidate.Enabled_False();
            btnGoInt.Enabled_False();
            btnSave.Enabled_False();
            btnClear.Enabled_False();
            //btnCalIRR.Enabled =
            //Need to Load proper DDLs
            Utility_FA.ClearDropDownList_FA(ddlFunderCode);
            Utility_FA.ClearDropDownList_FA(ddlArrangement);
            ddlLocation.Enabled = false;
            txtCommitAmt.ReadOnly = txtTenure.ReadOnly = txtValidUpto.ReadOnly = true;
            txtInterestCalcdate.ReadOnly = txtInterestLevy.ReadOnly =
            txtTrancheAmt.ReadOnly = txtTrancheAmtINR.ReadOnly = txtAvailedAmt.ReadOnly = txtAvailedAmtINR.ReadOnly =
                txtTransactionAmt.ReadOnly = txtTransactionamtINR.ReadOnly = true;
            CEInterestCalcdate.Enabled = CEInterestLevy.Enabled = CEReceivingDate.Enabled =
            CERepayDate.Enabled = CalendarExtender1.Enabled = false;
            gvReceiving.Columns[gvReceiving.Columns.Count - 1].Visible = false;
            //gvBorrowerRepay.Columns[gvBorrowerRepay.Columns.Count - 1].Visible = false;
            if (!bQuery)
            {
                Response.Redirect(strRedirectPage);
            }
            //New Ctrls.
            Utility_FA.ClearDropDownList_FA(ddlRepayPattern);
            btnGoB.Visible = btnGo.Visible = false;
            Utility_FA.ClearDropDownList_FA(ddlDealNumber);
            Utility_FA.ClearDropDownList_FA(ddlTrancheRefNo);
            Utility_FA.ClearDropDownList_FA(ddlFunderCode);
            Utility_FA.ClearDropDownList_FA(ddlTenureType);
            Utility_FA.ClearDropDownList_FA(ddlInterestCalc);
            Utility_FA.ClearDropDownList_FA(ddlInterestLevy);
            Utility_FA.ClearDropDownList_FA(ddlArrangement);
            Utility_FA.ClearDropDownList_FA(ddlInvestmentLein);
            Utility_FA.ClearDropDownList_FA(ddlInflowType);
            Utility_FA.ClearDropDownList_FA(ddlReceivingType);
            Utility_FA.ClearDropDownList_FA(ddlOutflowType);
            Utility_FA.ClearDropDownList_FA(ddlRepaymentType);
            Utility_FA.ClearDropDownList_FA(ddlFields);
            Utility_FA.ClearDropDownList_FA(ddlNumericOperators);
            txtRepayDate.ReadOnly =
            txtValidUpto.ReadOnly =
            txtFormula.ReadOnly =
            txtReceivingDate.ReadOnly =
            txtIntApplMoney.ReadOnly =
            txtApplMoneyHC.ReadOnly =
            txtDateofAvailment.ReadOnly =
            txtAvailmentAmount.ReadOnly = txtAvailmentISIN.ReadOnly = txtApplMoneyISIN.ReadOnly =
            txtAllotmentDate.ReadOnly = true;
            CEAllotmentDate.Enabled = CEDateofAvailment.Enabled = false;
            //    gvReceiving.FooterRow.Visible=false;
            //gvBorrowerRepay
            grvCashflows.FooterRow.Visible = false;
            grvCashflows.Columns[grvCashflows.Columns.Count - 1].Visible = false;
            grvMorotorium.FooterRow.Visible = false;
            grvMorotorium.Columns[grvMorotorium.Columns.Count - 1].Visible = false;




            // pnlCP.Visible = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    //Function To load Location
    private void FunPriLoadLocation()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (strMode == "C" || strMode == string.Empty)
            {
                Procparam.Add("@Location_Active", "1");
                Procparam.Add("@Is_Operational", "1");
            }
            Procparam.Add("@Program_ID", "14");
            //ddlLocation.BindDataTable_FA("FA_Loca_List", Procparam, new string[] { "Location_ID", "Location" });
            Procparam = null;
            //if (ddlLocation.Items.Count == 2)
            //    ddlLocation.SelectedIndex = 1;
            //ddlLocation.AddItemToolTipText_FA();


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    //Function To load Location
    private void FunPriLoadFunderCodes()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (ddlFunderCode.SelectedIndex > 0)
                Procparam.Add("@Funder_ID", ddlFunderCode.SelectedValue);
            Procparam.Add("@Program_ID", "15");
            Procparam.Add("@Option", "1");
            if (strMode == "C")
                Procparam.Add("@Is_Active", "1");
            ddlFunderCode.BindDataTable_FA(SPNames.GetFunderCode_Details, Procparam, new string[] { "Funder_ID", "FunderName" });
            Procparam = null;
            if (ddlFunderCode.Items.Count == 2)
            {
                // ddlFunderCode.SelectedIndex = 1;
                //FunProGetFunderDetails();
                FunPriLoadFunderAddress();
            }
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    //Function to Load Funder Transaction Details in Modify/Query Mode
    private void FunPriGetFunderTransaction(string strFunder_Tran_ID)
    {
        try
        {
            //DataTable ds.Tables[0] = new DataTable();
            DataSet ds = new DataSet();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            Procparam.Add("@Funder_Tran_ID", strFunder_Tran_ID);

            ds = Utility_FA.GetDataset(SPNames.GetFunderTransaction, Procparam);


            if (ds.Tables[0].Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Funder_ID"].ToString()))
                {
                    ddlFunderCode.SelectedValue = ds.Tables[0].Rows[0]["Funder_ID"].ToString();
                    FunPriLoadFunderAddress();
                }
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Location_ID"].ToString()))
                {
                    ddlLocation.SelectedText = ds.Tables[0].Rows[0]["LocationCat_Description"].ToString();
                    ddlLocation.SelectedValue = ds.Tables[0].Rows[0]["Location_ID"].ToString();
                }
                txtFunderTranNo.Text = ds.Tables[0].Rows[0]["Funder_Tran_No"].ToString();


                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Auth_Stat"].ToString()))
                    ViewState["Auth_Stat"] = ds.Tables[0].Rows[0]["Auth_Stat"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Funder_Tran_date"].ToString()))
                    txtFundTransDate.Text = ds.Tables[0].Rows[0]["Funder_Tran_date"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Type"].ToString()))
                    ddlArrangement.SelectedValue = ds.Tables[0].Rows[0]["Fund_Type"].ToString();

                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Nature"].ToString()))
                {
                    ViewState["Fund_Nature"] = ds.Tables[0].Rows[0]["Fund_Nature"].ToString();
                    ddlNatureofFund.SelectedValue = ds.Tables[0].Rows[0]["Fund_Nature"].ToString();
                    FunSetNatureType(ViewState["Fund_Nature"].ToString());
                }

                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Mat_Date"].ToString()))
                    txtValidUpto.Text = ds.Tables[0].Rows[0]["Mat_Date"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Deal_Id"].ToString()))
                    ddlDealNumber.SelectedValue = ds.Tables[0].Rows[0]["Deal_Id"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tranche_No"].ToString()))
                {
                    FunPriLoadTrancheNos("M");
                    ddlTrancheRefNo.SelectedValue = ds.Tables[0].Rows[0]["Fund_Tranche_No"].ToString();
                }
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Base_Rate"].ToString()))
                    txtBaseRate.Text = ds.Tables[0].Rows[0]["Base_Rate"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Spread_Rate"].ToString()))
                    txtSpreadRate.Text = ds.Tables[0].Rows[0]["Spread_Rate"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Total_Rate"].ToString()))
                    txtTotalRate.Text = ds.Tables[0].Rows[0]["Total_Rate"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tenure_Type"].ToString()))
                    ddlTenureType.SelectedValue = ds.Tables[0].Rows[0]["Tenure_Type"].ToString();

                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tenure"].ToString()))
                    txtTenure.Text = ds.Tables[0].Rows[0]["Fund_Tenure"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Int_Calc_type"].ToString()))
                    ddlInterestCalc.SelectedValue = ds.Tables[0].Rows[0]["Int_Calc_type"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Int_Start_Fm"].ToString()))
                    txtInterestCalcdate.Text = ds.Tables[0].Rows[0]["Int_Start_Fm"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Int_Credit_Type"].ToString()))
                    ddlInterestLevy.SelectedValue = ds.Tables[0].Rows[0]["Int_Credit_Type"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Int_Credit_Fm"].ToString()))
                    txtInterestLevy.Text = ds.Tables[0].Rows[0]["Int_Credit_Fm"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Inves_Lien"].ToString()))
                    ddlInvestmentLein.SelectedValue = ds.Tables[0].Rows[0]["Inves_Lien"].ToString();

                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Currency_Name"].ToString()))
                    txtCurrecncyCode.Text = ds.Tables[0].Rows[0]["Currency_Name"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Currency_Value"].ToString()))
                {
                    txtCurrencyValue.Text = ds.Tables[0].Rows[0]["Currency_Value"].ToString();
                }
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Currency_id"].ToString()))
                {
                    ViewState["Currency_Code"] = ds.Tables[0].Rows[0]["Currency_id"].ToString();
                }

                //Tab2
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["DD_Pattern"].ToString()))
                    ddlInflowType.SelectedValue = ds.Tables[0].Rows[0]["DD_Pattern"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["DD_Frequncy"].ToString()))
                    ddlReceivingType.SelectedValue = ds.Tables[0].Rows[0]["DD_Frequncy"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Receving_Date"].ToString()))
                    txtReceivingDate.Text = ds.Tables[0].Rows[0]["Receving_Date"].ToString();

                //Tab3
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Repay_Pattern"].ToString()))
                    ddlOutflowType.SelectedValue = ds.Tables[0].Rows[0]["Repay_Pattern"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Repay_Frequncy"].ToString()))
                    ddlRepaymentType.SelectedValue = ds.Tables[0].Rows[0]["Repay_Frequncy"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Repay_Date"].ToString()))
                    txtRepayDate.Text = ds.Tables[0].Rows[0]["Repay_Date"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["COF_Per"].ToString()))
                    txtCOF.Text = ds.Tables[0].Rows[0]["COF_Per"].ToString();

                //Last Tab
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Appl_Int_Rate"].ToString()))
                    txtIntApplMoney.Text = ds.Tables[0].Rows[0]["Appl_Int_Rate"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Appl_Amount"].ToString()))
                    txtApplMoneyHC.Text = ds.Tables[0].Rows[0]["Appl_Amount"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Appl_MaoneyISIN"].ToString()))
                    txtApplMoneyISIN.Text = ds.Tables[0].Rows[0]["Appl_MaoneyISIN"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Avail_Date"].ToString()))
                    txtDateofAvailment.Text = ds.Tables[0].Rows[0]["Avail_Date"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Avail_Amount"].ToString()))
                    txtAvailmentAmount.Text = ds.Tables[0].Rows[0]["Avail_Amount"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailmentISIN"].ToString()))
                    txtAvailmentISIN.Text = ds.Tables[0].Rows[0]["AvailmentISIN"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Allot_Date"].ToString()))
                    txtAllotmentDate.Text = ds.Tables[0].Rows[0]["Allot_Date"].ToString();


                //For CP
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Link_FT_Key"].ToString()))
                {
                    FunGetPrevFundTranNo();
                    chkCP.Checked = true;
                    ddlPrevFundTran.SelectedValue = ds.Tables[0].Rows[0]["Link_FT_Key"].ToString();
                }



                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Commitment_AmountINR"].ToString()))
                    txtCommitAmtINR.Text = ds.Tables[0].Rows[0]["Commitment_AmountINR"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Commitment_Amount"].ToString()))
                    txtCommitAmt.Text = ds.Tables[0].Rows[0]["Commitment_Amount"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tranche_Amt"].ToString()))
                    txtTrancheAmt.Text = ds.Tables[0].Rows[0]["Tranche_Amt"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tranche_AmtINR"].ToString()))
                    txtTrancheAmtINR.Text = ds.Tables[0].Rows[0]["Tranche_AmtINR"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailAmt"].ToString()))
                    txtAvailedAmt.Text = ds.Tables[0].Rows[0]["AvailAmt"].ToString();
                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailAmtINR"].ToString()))
                    txtAvailedAmtINR.Text = ds.Tables[0].Rows[0]["AvailAmtINR"].ToString();
                if (ds.Tables[0].Rows[0]["Currency_code"].ToString() == string.Empty)
                {

                    lblTransactionAmt.Text = "Transaction Amount(OMR)";
                    lblTransactionAmtINR.Text = "Transaction Amount(FC)";
                    txtTransactionamtINR.Text = "";
                    txtTransactionamtINR.ReadOnly = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tran_Amt_FC"].ToString()))
                        txtTransactionAmt.Text = ds.Tables[0].Rows[0]["Fund_Tran_Amt_FC"].ToString();
                    lblCommitmentAmt.Text = " Commitment Amount(OMR)";
                    lblCommitmentAmtINR.Text = "Commitment Amount(FC)";
                    txtCommitAmtINR.Text = "";
                    txtCommitAmtINR.ReadOnly = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Commitment_Amount"].ToString()))
                        txtCommitAmt.Text = ds.Tables[0].Rows[0]["Commitment_Amount"].ToString();

                    lblAvailedAmt.Text = "Availed Amount(OMR)";
                    lblAvailedAmtINR.Text = "Availed Amount(FC)";
                    txtAvailedAmtINR.Text = "";
                    txtAvailedAmtINR.ReadOnly = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailAmt"].ToString()))
                        txtAvailedAmt.Text = ds.Tables[0].Rows[0]["AvailAmt"].ToString();

                    lblTrancheAmount.Text = "Tranche Amount(OMR)";
                    lblTrancheAmountINR.Text = "Tranche Amount(FC)";
                    txtTrancheAmtINR.Text = "";
                    txtTrancheAmtINR.ReadOnly = true;
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tranche_Amt"].ToString()))
                        txtTrancheAmt.Text = ds.Tables[0].Rows[0]["Tranche_Amt"].ToString();

                    //if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tran_amt"].ToString()))
                    //    txtTransactionamtINR.Text = ds.Tables[0].Rows[0]["Fund_Tran_amt"].ToString();
                }
                else
                {
                    lblTransactionAmt.Text = "Transaction Amount(FC)";
                    lblTransactionAmtINR.Text = "Transaction Amount(OMR)";
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tran_Amt_FC"].ToString()))
                        txtTransactionAmt.Text = ds.Tables[0].Rows[0]["Fund_Tran_Amt_FC"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Fund_Tran_amt"].ToString()))
                        txtTransactionamtINR.Text = ds.Tables[0].Rows[0]["Fund_Tran_amt"].ToString();

                    lblCommitmentAmt.Text = " Commitment Amount(FC)";
                    lblCommitmentAmtINR.Text = "Commitment Amount(OMR)";
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Commitment_Amount"].ToString()))
                        txtCommitAmt.Text = ds.Tables[0].Rows[0]["Commitment_Amount"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Commitment_AmountINR"].ToString()))
                        txtCommitAmtINR.Text = ds.Tables[0].Rows[0]["Commitment_AmountINR"].ToString();

                    lblAvailedAmt.Text = "Availed Amount(FC)";
                    lblAvailedAmtINR.Text = "Availed Amount(OMR)";
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailAmt"].ToString()))
                        txtAvailedAmt.Text = ds.Tables[0].Rows[0]["AvailAmt"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["AvailAmtINR"].ToString()))
                        txtAvailedAmtINR.Text = ds.Tables[0].Rows[0]["AvailAmtINR"].ToString();

                    lblTrancheAmount.Text = "Tranche Amount(FC)";
                    lblTrancheAmountINR.Text = "Tranche Amount(OMR)";
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tranche_Amt"].ToString()))
                        txtTrancheAmt.Text = ds.Tables[0].Rows[0]["Tranche_Amt"].ToString();
                    if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["Tranche_AmtINR"].ToString()))
                        txtTrancheAmtINR.Text = ds.Tables[0].Rows[0]["Tranche_AmtINR"].ToString();

                }

            }
            if (ds.Tables[5].Rows.Count > 0)
            {
                ViewState["vs_Table"] = ds.Tables[5];
            }
            if (ds.Tables[1].Rows.Count > 0)
            {
                gvReceiving.DataSource = ds.Tables[1];
                gvReceiving.DataBind();
                ViewState["DT_Receiving"] = ds.Tables[1];
                Label lblTotDue = (Label)gvReceiving.FooterRow.FindControl("lblTotDue");
                ViewState["DueTotal"] = lblTotDue.Text = ds.Tables[1].Rows[0]["TotDue"].ToString();
            }

            if (ds.Tables[2].Rows.Count > 0)
            {
                //FunPubBindRepay(ds.Tables[2]);
                ViewState["dtRepay"] = ds.Tables[2];
                gvBorrowerRepay.DataSource = ds.Tables[2];
                gvBorrowerRepay.DataBind();

                //Label lblTotRepay = (Label)gvBorrowerRepay.FooterRow.FindControl("lblTotRepay");
                //ViewState["RepayTotal"] = lblTotRepay.Text = ds.Tables[2].Rows[0]["TotRepay"].ToString();

            }
            else if (strMode == "Q")
            {
                gvBorrowerRepay.EmptyDataText = "No Borrower Repay Details";
                gvBorrowerRepay.DataSource = null;
                gvBorrowerRepay.DataBind();
            }

            //if (ds.Tables[3].Rows.Count > 0)
            //{
            //    gvInterest.DataSource = ds.Tables[3];
            //    gvInterest.DataBind();
            //    ViewState["dtInterest"] = ds.Tables[3];
            //    Label lblTotDueAmount = (Label)gvInterest.FooterRow.FindControl("lblTotDueAmount");
            //    Label lblTotPayAmount = (Label)gvInterest.FooterRow.FindControl("lblTotPayAmount");
            //    lblTotDueAmount.Text = ds.Tables[4].Rows[0][0].ToString();
            //    if (Convert.ToDecimal(ds.Tables[4].Rows[0][1]) != 0)
            //        lblTotPayAmount.Text = ds.Tables[4].Rows[0][1].ToString();
            //}
            //else
            //{
            //    gvInterest.EmptyDataText = "No Interest Schedule Details";
            //    gvInterest.DataSource = null;
            //    gvInterest.DataBind();
            //}

            if (ds.Tables[6].Rows.Count > 0)
            {
                grvCashflows.DataSource = ds.Tables[6];
                grvCashflows.DataBind();
                ViewState["dtCashFlows"] = ds.Tables[6];
                if (strMode == "M")
                {
                    FunPriSetCFFooter();
                }
            }
            else
            {
                FunPriSetEmptyCFtbl();
                if (strMode == "M")
                {
                    FunPriSetCFFooter();
                }
            }

            if (ds.Tables[7].Rows.Count > 0)//Morotorium
            {
                grvMorotorium.DataSource = ds.Tables[7];
                grvMorotorium.DataBind();
                ViewState["dtMorotorium"] = ds.Tables[7];
                if (strMode == "M")
                {
                    FunPriSetMorotoriumLOV();
                }
            }
            else
            {
                FunPriSetEmptyMorotoriumtbl();
                if (strMode == "M")
                {
                    FunPriSetMorotoriumLOV();
                }
            }

            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("ddlFund_Ref_No") as DropDownList;
            //FunProLoadFund_Ref_No(ddlFund_Ref_No);
            if (gvBorrowerRepay.FooterRow != null)
            {
                DropDownList ddlHedgeNo = gvBorrowerRepay.FooterRow.FindControl("ddlHedgeNo") as DropDownList;
                if (ddlHedgeNo != null)
                    FunProLoadHedgeRefNo(ddlHedgeNo);
            }

            ddlArrangement.AddItemToolTipText_FA();
            ddlFunderCode.AddItemToolTipText_FA();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    //To Generate XML for Receiving Details
    private string FunPriReceivingXML()
    {
        try
        {

            sbReceivingXML = new StringBuilder();
            dtReceiving = (DataTable)ViewState["DT_Receiving"];
            sbReceivingXML.Append("<Root>");
            if (dtReceiving.Rows.Count == 1 && Convert.ToString(dtReceiving.Rows[0]["Serial_Number"]) == "0")
            {
                sbReceivingXML.Append("</Root>");
            }
            else
            {
                //for (int dtRow = 0; dtRow < dtReceiving.Rows.Count; dtRow++)
                foreach (DataRow dtRow in dtReceiving.Rows)
                {
                    if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                        sbReceivingXML.Append("<Details  Serial_Number='" + dtRow["Serial_Number"].ToString() + "' ");
                    else
                        sbReceivingXML.Append("<Details  Serial_Number='" + dtRow["Serial_Number"].ToString() + "' ");

                    sbReceivingXML.Append("  Funder_Tran_Details_ID='" + dtRow["Funder_Tran_Details_ID"].ToString() + "' ");
                    sbReceivingXML.Append("  Fund_Ref_No='" + dtRow["Fund_Ref_No"].ToString() + "' ");
                    sbReceivingXML.Append("  Fund_Rate='" + dtRow["Fund_Rate"].ToString() + "' ");
                    sbReceivingXML.Append("  Due_Date='" + Utility_FA.StringToDate(dtRow["Due_Date"].ToString()) + "' ");
                    sbReceivingXML.Append("  Due_Amount='" + dtRow["Due_Amount"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["JV_No"].ToString()))
                        sbReceivingXML.Append("  JV_No='" + dtRow["JV_No"].ToString() + "' ");
                    // sbReceivingXML.Append("  Is_Active='" + dtRow["Is_Active"].ToString() + "' ");
                    sbReceivingXML.Append("  New_Old='" + dtRow["New_Old"].ToString() + "' ");
                    sbReceivingXML.Append("  Changed='" + dtRow["Changed"].ToString() + "' ");

                    sbReceivingXML.Append(" /> ");
                }
                sbReceivingXML.Append("</Root>");
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sbReceivingXML.ToString();
    }

    //To Generate XML for Repay Details
    private string FunPriRepayXML()
    {
        try
        {
            int intslno = 1;
            sbReceivingXML = new StringBuilder();
            dtRepay = (DataTable)ViewState["dtRepay"];
            sbReceivingXML.Append("<Root>");
            if (dtRepay.Rows.Count == 1 && Convert.ToString(dtRepay.Rows[0]["Serial_Number"]) == "0")
            {
                sbReceivingXML.Append("</Root>");
            }
            else
            {
                //for (int dtRow = 0; dtRow < dtRepay.Rows.Count; dtRow++)
                foreach (DataRow dtRow in dtRepay.Rows)
                {
                    if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                        sbReceivingXML.Append("<Details  Serial_Number='" + intslno.ToString() + "' ");
                    else
                        sbReceivingXML.Append("<Details  Serial_Number='" + intslno.ToString() + "' ");
                    sbReceivingXML.Append("  Funder_Tran_DTL1_ID='" + dtRow["Funder_Tran_DTL1_ID"].ToString() + "' ");
                    sbReceivingXML.Append("  Fund_Ref_No='" + dtRow["Fund_Ref_No"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Repay_Date"].ToString()))
                        sbReceivingXML.Append("  Repay_Date='" + Utility_FA.StringToDate(dtRow["Repay_Date"].ToString()) + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Repay_Amount"].ToString()))
                        sbReceivingXML.Append("  Repay_Amount='" + dtRow["Repay_Amount"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["JV_No"].ToString()))
                        sbReceivingXML.Append("  JV_No='" + dtRow["JV_No"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Hedge_No"].ToString()))
                    {
                        string strHedgeNo = string.Empty;
                        strHedgeNo = dtRow["Hedge_No"].ToString();

                        if (strHedgeNo.Contains("-"))
                            strHedgeNo = strHedgeNo.Split('-')[0];

                        sbReceivingXML.Append("  Hedge_No='" + strHedgeNo + "' ");
                    }
                    if (!string.IsNullOrEmpty(dtRow["Hedge_Amount"].ToString()))
                        sbReceivingXML.Append("  Hedge_Amount='" + dtRow["Hedge_Amount"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Interest_Date"].ToString()))
                        sbReceivingXML.Append("  Interest_Date='" + Utility_FA.StringToDate(dtRow["Interest_Date"].ToString()) + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Interest_Amount"].ToString()))
                        sbReceivingXML.Append("  Interest_Amount='" + dtRow["Interest_Amount"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Repay_Int"].ToString()))
                        sbReceivingXML.Append("  Repay_Int='" + dtRow["Repay_Int"].ToString() + "' ");
                    //sbReceivingXML.Append("  Is_Active='" + dtRow["Is_Active"].ToString() + "' ");
                    sbReceivingXML.Append("  New_Old='" + dtRow["New_Old"].ToString() + "' ");
                    sbReceivingXML.Append("  Changed='" + dtRow["Changed"].ToString() + "' ");
                    sbReceivingXML.Append(" /> ");
                    intslno++;

                }

                sbReceivingXML.Append("</Root>");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sbReceivingXML.ToString();
    }

    //To Generate XML for CashFlow Details
    private string FunPriCashFlowsXML()
    {
        try
        {

            sbCashFlowsXML = new StringBuilder();
            dtRepay = (DataTable)ViewState["dtCashFlows"];
            sbCashFlowsXML.Append("<Root>");
            if (dtRepay.Rows.Count == 1 && Convert.ToString(dtRepay.Rows[0]["Serial_Number"]) == "0")
            {
                sbCashFlowsXML.Append("</Root>");
            }
            else
            {
                //for (int dtRow = 0; dtRow < dtRepay.Rows.Count; dtRow++)
                foreach (DataRow dtRow in dtRepay.Rows)
                {
                    if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                        sbCashFlowsXML.Append("<Details  Serial_Number='" + dtRow["Serial_Number"].ToString() + "' ");
                    else
                        sbCashFlowsXML.Append("<Details  Serial_Number='" + dtRow["Serial_Number"].ToString() + "' ");
                    sbCashFlowsXML.Append("  Fund_CF_ID='" + dtRow["Fund_CF_ID"].ToString() + "' ");
                    sbCashFlowsXML.Append("  Type='" + dtRow["Type"].ToString() + "' ");
                    sbCashFlowsXML.Append("  TypeID='" + dtRow["TypeID"].ToString() + "' ");
                    sbCashFlowsXML.Append("  CashFlow='" + dtRow["CashFlow"].ToString() + "' ");
                    sbCashFlowsXML.Append("  CashFlowID='" + dtRow["CashFlowID"].ToString() + "' ");
                    sbCashFlowsXML.Append("  Frequency='" + dtRow["Frequency"].ToString() + "' ");
                    sbCashFlowsXML.Append("  FrequencyID='" + dtRow["FrequencyID"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["CFDate"].ToString()))
                        sbCashFlowsXML.Append("  CFDate='" + Utility_FA.StringToDate(dtRow["CFDate"].ToString()).ToString() + "' ");
                    sbCashFlowsXML.Append("  CFAmount='" + dtRow["CFAmount"].ToString() + "' ");
                    if (!string.IsNullOrEmpty(dtRow["Condition"].ToString()))
                    {
                        sbCashFlowsXML.Append("  Condition='" + dtRow["Condition"].ToString().Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace("\"", "&quot").Replace("'", "&#39;") + "' ");
                    }
                    sbCashFlowsXML.Append(" /> ");
                }

                sbCashFlowsXML.Append("</Root>");
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sbCashFlowsXML.ToString();
    }

    /*
        //To save the Funder Details    
        private int FunPriSaveDetails()
        {
            objFunderTransaction = new FunderInvestmentMgtService.FunderInvestmentMgtServiceClient();
            try
            {
                objFA_FunderTransaction_DTB = new FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_TRAN_MSTDataTable();
                objFA_FunderTransactionRow = objFA_FunderTransaction_DTB.NewFA_FUNDER_TRAN_MSTRow();

                objFA_FunderTransactionRow.Company_ID = intCompanyID;
                objFA_FunderTransactionRow.User_ID = intUserID;
                if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                    objFA_FunderTransactionRow.Funder_Tran_ID = Convert.ToInt32(strFunder_Tran_ID);
                else
                    objFA_FunderTransactionRow.Funder_Tran_ID = 0;
                objFA_FunderTransactionRow.Funder_ID = Convert.ToInt32(ddlFunderCode.SelectedValue);
                objFA_FunderTransactionRow.Funder_Tran_No = txtFunderTranNo.Text;
                objFA_FunderTransactionRow.Fund_Type = ddlArrangement.SelectedValue;
                objFA_FunderTransactionRow.Commitment_Amt = Convert.ToDecimal(txtCommitAmt.Text.Trim());
                objFA_FunderTransactionRow.Tenure = Convert.ToInt32(txtTenure.Text.Trim());
                objFA_FunderTransactionRow.Validity_Date = Utility_FA.StringToDate(txtValidUpto.Text.Trim());
                objFA_FunderTransactionRow.Currency_Code = "0";
                objFA_FunderTransactionRow.XML_Tran_DTL = FunPriReceivingXML();
                objFA_FunderTransactionRow.XML_Tran_DTL1 = FunPriRepayXML();

                if (strMode == "M")
                    objFA_FunderTransactionRow.Option = 2;
                else
                    objFA_FunderTransactionRow.Option = 1;

                objFA_FunderTransaction_DTB.AddFA_FUNDER_TRAN_MSTRow(objFA_FunderTransactionRow);
                intErrCode = objFunderTransaction.FunPubInsertFunderTransaction(out intFunder_Tran_ID, out strFunder_Tran_No, ObjSerMode, FAClsPubSerialize.Serialize(objFA_FunderTransaction_DTB, ObjSerMode), strConnectionName);
            }

            catch (Exception objException)
            {
                throw objException;
            }
            finally
            {
                if (objFunderTransaction != null)
                    objFunderTransaction.Close();
            }
            return intErrCode;
        }
        */

    private int FunPriSaveDetails()
    {

        objFunderTransaction = new FunderInvestmentMgtService.FunderInvestmentMgtServiceClient();
        objFA_FunderTransaction_DTB = new FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranDataTable();
        objFA_FunderTransactionRow = objFA_FunderTransaction_DTB.NewFA_Fund_TranRow();
        try
        {
            objFA_FunderTransactionRow.Company_Id = intCompanyID;
            objFA_FunderTransactionRow.User_ID = intUserID;
            objFA_FunderTransactionRow.Funder_ID = Convert.ToInt32(ddlFunderCode.SelectedValue);
            objFA_FunderTransactionRow.Deal_Id = Convert.ToInt32(ddlDealNumber.SelectedValue);
            //Going to reuse this variable for CPFund tran Id i.e Previous Tran id
            if (ddlPrevFundTran.SelectedIndex > 0)
                objFA_FunderTransactionRow.Prev_Tran_Id = Convert.ToInt32(ddlPrevFundTran.SelectedValue);

            if (!string.IsNullOrEmpty(ddlNatureofFund.SelectedValue))
                objFA_FunderTransactionRow.Tranche_Id = Convert.ToInt32(ddlNatureofFund.SelectedValue);

            objFA_FunderTransactionRow.Location_Id = Convert.ToInt32(ddlLocation.SelectedValue);

            objFA_FunderTransactionRow.Tranche_Ref_No = ddlTrancheRefNo.SelectedValue;
            if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                objFA_FunderTransactionRow.Funder_Tran_Id = Convert.ToInt32(strFunder_Tran_ID);
            else
                objFA_FunderTransactionRow.Funder_Tran_Id = 0;
            objFA_FunderTransactionRow.Funder_Tran_No = txtFunderTranNo.Text;
            if (!string.IsNullOrEmpty(txtFundTransDate.Text))
                objFA_FunderTransactionRow.Funder_Tran_date = Utility_FA.StringToDate(txtFundTransDate.Text);
            if (!string.IsNullOrEmpty(txtBaseRate.Text))
                objFA_FunderTransactionRow.Base_Rate = Convert.ToDecimal(txtBaseRate.Text);
            else
                objFA_FunderTransactionRow.Base_Rate = 0;
            if (!string.IsNullOrEmpty(txtSpreadRate.Text))
                objFA_FunderTransactionRow.Spread_Rate = Convert.ToDecimal(txtSpreadRate.Text);
            else
                objFA_FunderTransactionRow.Spread_Rate = 0;
            if (!string.IsNullOrEmpty(txtTotalRate.Text))
                objFA_FunderTransactionRow.Total_Rate = Convert.ToDecimal(txtTotalRate.Text);
            else
                objFA_FunderTransactionRow.Total_Rate = 0;
            if (!string.IsNullOrEmpty(txtCommitAmt.Text))
                objFA_FunderTransactionRow.Commitment_Amt = Convert.ToDecimal(txtCommitAmt.Text);
            else
                objFA_FunderTransactionRow.Commitment_Amt = 0;
            if (!string.IsNullOrEmpty(txtCommitAmtINR.Text))
                objFA_FunderTransactionRow.Commitment_Amt_INR = Convert.ToDecimal(txtCommitAmtINR.Text);
            else
                objFA_FunderTransactionRow.Commitment_Amt_INR = 0;
            objFA_FunderTransactionRow.Tenure_Type = ddlTenureType.SelectedValue;
            if (!string.IsNullOrEmpty(txtTenure.Text))
                objFA_FunderTransactionRow.Tenure = Convert.ToInt32(txtTenure.Text);
            objFA_FunderTransactionRow.Int_Calculation = Convert.ToInt32(ddlInterestCalc.SelectedValue);
            objFA_FunderTransactionRow.Int_Credit = Convert.ToInt32(ddlInterestLevy.SelectedValue);
            objFA_FunderTransactionRow.Investment_Lein = Convert.ToInt32(ddlInvestmentLein.SelectedValue);
            objFA_FunderTransactionRow.Arrangement = Convert.ToInt32(ddlArrangement.SelectedValue);
            if (!string.IsNullOrEmpty(txtValidUpto.Text))
                objFA_FunderTransactionRow.Valid_Upto = Utility_FA.StringToDate(txtValidUpto.Text);
            objFA_FunderTransactionRow.Inflow_Type = Convert.ToInt32(ddlInflowType.SelectedValue);
            objFA_FunderTransactionRow.Receving_Freq = Convert.ToInt32(ddlReceivingType.SelectedValue);
            if (!string.IsNullOrEmpty(txtReceivingDate.Text))
                objFA_FunderTransactionRow.Receving_Date = Utility_FA.StringToDate(txtReceivingDate.Text);
            objFA_FunderTransactionRow.OutFlow_Type = Convert.ToInt32(ddlOutflowType.SelectedValue);
            objFA_FunderTransactionRow.Repay_Freq = Convert.ToInt32(ddlRepaymentType.SelectedValue);
            if (!string.IsNullOrEmpty(txtRepayDate.Text))
                objFA_FunderTransactionRow.Repay_Date = Utility_FA.StringToDate(txtRepayDate.Text);

            if (!string.IsNullOrEmpty(txtCOF.Text))
                objFA_FunderTransactionRow.COF_Per = Convert.ToDecimal(txtCOF.Text);

            if (!string.IsNullOrEmpty(txtIntApplMoney.Text))
                objFA_FunderTransactionRow.Int_Appl_Money = Convert.ToDecimal(txtIntApplMoney.Text);
            if (!string.IsNullOrEmpty(txtApplMoneyHC.Text))
                objFA_FunderTransactionRow.Appl_Money = Convert.ToDecimal(txtApplMoneyHC.Text);
            if (!string.IsNullOrEmpty(txtDateofAvailment.Text))
                objFA_FunderTransactionRow.Date_Availment = Utility_FA.StringToDate(txtDateofAvailment.Text);
            if (!string.IsNullOrEmpty(txtIntApplMoney.Text))
                objFA_FunderTransactionRow.Availment_Amount = Convert.ToDecimal(txtIntApplMoney.Text);
            if (!string.IsNullOrEmpty(txtAllotmentDate.Text))
                objFA_FunderTransactionRow.Allotment_Date = Utility_FA.StringToDate(txtAllotmentDate.Text);
            if (ViewState["Currency_Code"] != null)
                objFA_FunderTransactionRow.Currency_Code = Convert.ToString(ViewState["Currency_Code"]);
            if (!string.IsNullOrEmpty(txtCurrencyValue.Text))
                objFA_FunderTransactionRow.Currency_Value = Convert.ToDecimal(txtCurrencyValue.Text);

            objFA_FunderTransactionRow.XML_Receving_DTL = FunPriReceivingXML();
            objFA_FunderTransactionRow.XML_Repay_DTL = FunPriRepayXML();
            objFA_FunderTransactionRow.XML_CashFlow_DTL = FunPriCashFlowsXML();



            objFA_FunderTransactionRow.XML_Mort_DTL = "<Root></Root>";
            if (ViewState["dtMorotorium"] != null)
                dtMorotorium = (DataTable)ViewState["dtMorotorium"];
            if (dtMorotorium.Rows.Count > 0)
            {
                if (!string.IsNullOrEmpty(dtMorotorium.Rows[0]["SLNo"].ToString()))
                    objFA_FunderTransactionRow.XML_Mort_DTL = dtMorotorium.FunPubFormXml_FA();
            }


            //objFA_FunderTransactionRow.XML_Mort_DTL = grvMorotorium.FunPubFormXml_FA();
            if (!string.IsNullOrEmpty(txtApplMoneyISIN.Text))
                objFA_FunderTransactionRow.Appl_MaoneyISIN = txtApplMoneyISIN.Text;
            if (!string.IsNullOrEmpty(txtAvailmentISIN.Text))
                objFA_FunderTransactionRow.AvailmentISIN = txtAvailmentISIN.Text;


            if (!string.IsNullOrEmpty(txtTransactionAmt.Text))
                objFA_FunderTransactionRow.Trans_Amt = Convert.ToDecimal(txtTransactionAmt.Text);
            if (!string.IsNullOrEmpty(txtTransactionamtINR.Text))
                objFA_FunderTransactionRow.Trans_Amt_INR = Convert.ToDecimal(txtTransactionamtINR.Text);
            else
                objFA_FunderTransactionRow.Trans_Amt_INR = Convert.ToDecimal(txtTransactionAmt.Text);
            if (!string.IsNullOrEmpty(txtInterestCalcdate.Text))
                objFA_FunderTransactionRow.Int_Calc_date = Utility_FA.StringToDate(txtInterestCalcdate.Text);
            if (!string.IsNullOrEmpty(txtInterestLevy.Text))
                objFA_FunderTransactionRow.Int_Credit_date = Utility_FA.StringToDate(txtInterestLevy.Text);


            //Others tab LC/BG fields

            objFA_FunderTransactionRow.LC_Type = ddlLC_Type.SelectedValue;
            if (!string.IsNullOrEmpty(txtPurpose.Text))
                objFA_FunderTransactionRow.Purpose = txtPurpose.Text;
            //if (!string.IsNullOrEmpty(txtLCAvailmentDate.Text))
            //    objFA_FunderTransactionRow.Availment_Date = Utility_FA.StringToDate(txtLCAvailmentDate.Text);
            if (!string.IsNullOrEmpty(txtFavouring_Of.Text))
                objFA_FunderTransactionRow.Favouring_Of = txtFavouring_Of.Text;
            if (!string.IsNullOrEmpty(txtLCAmount.Text))
                objFA_FunderTransactionRow.LCAmount = Convert.ToDecimal(txtLCAmount.Text);
            //if (!string.IsNullOrEmpty(txtLCValidity.Text))
            //    objFA_FunderTransactionRow.LCValidity = Utility_FA.StringToDate(txtLCValidity.Text);
            objFA_FunderTransaction_DTB.AddFA_Fund_TranRow(objFA_FunderTransactionRow);
            intErrCode = objFunderTransaction.FunPubInsertFunderTransaction(out intFunder_Tran_ID, out strFunder_Tran_No, ObjSerMode, FAClsPubSerialize.Serialize(objFA_FunderTransaction_DTB, ObjSerMode), strConnectionName);
        }

        catch (Exception objException)
        {
            throw objException;
        }
        finally
        {
            if (objFunderTransaction != null)
                objFunderTransaction.Close();
        }
        return intErrCode;



    }

    //To Clear_FA the controls
    private void FunPriClearPage()
    {
        try
        {
            FunPriLoadFunderCodes();
            ViewState["DT_Receiving"] = ViewState["DueTotal"] = ViewState["dtRepay"] = null;
            ddlArrangement.SelectedIndex = 0;
            //txtGLCode.Text = txtSLCode.Text = 
            //txtLocation.Text = 
            txtFunderTranNo.Text = string.Empty;
            txtCommitAmt.Text = txtTenure.Text = txtValidUpto.Text = string.Empty;
            ddlLocation.Clear_FA();
            FunPriInsertReceiving(LstReceived);
            //FunPriInsertRepay(LstRepay);
            FunPriSetEmptyRepayTbl();
            txtFundTransDate.Text = DateTime.Now.ToString(strDateFormat);
            //gvInterest.DataSource = null;
            //gvInterest.DataBind();
            ddlFunderCode.AddItemToolTipText_FA();
            FunPriSetAmountcheck(false);
        }

        catch (Exception objException)
        {
            validationCode = "1405";
            throw objException;
        }
    }

    protected void FunProGetFunderDetails()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (ddlFunderCode.SelectedIndex > 0)
                Procparam.Add("@Funder_ID", ddlFunderCode.SelectedValue);
            Procparam.Add("@Program_ID", "15");
            Procparam.Add("@Option", "2");
            DataTable dt = new DataTable();
            dt = Utility_FA.GetDefaultData(SPNames.GetFunderCode_Details, Procparam);
            //txtLocation.Text = dt.Rows[0]["Location"].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void txtFund_Ref_No_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txt = (TextBox)sender;
            GridViewRow grvData = (GridViewRow)txt.Parent.Parent;
            TextBox txtFund_Ref_No = (TextBox)grvData.FindControl("txtFund_Ref_No");

            if (!string.IsNullOrEmpty(txtFund_Ref_No.Text.Trim()))
            {
                if (!FunPro_chk_Duplicate(txtFund_Ref_No.Text.Trim()))
                {
                    txtFund_Ref_No.Focus();
                    return;
                }
            }
            TextBox txtRate = (TextBox)grvData.FindControl("txtRate");
            txtRate.Focus();

            //if (!FunProIs_Exists_Fund_Ref_No(txt))
            //    return;
            //else if (!FunProIs_Exists_Fund_Ref_NoDT(txt))
            //    return;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvFunderTransaction.ErrorMessage = "Unable To Verify Fund Reference Number";//Resources.ErrorHandlingAndValidation._1434;
            cvFunderTransaction.IsValid = false;
        }
    }

    protected void txtReceivedDate_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txt = (TextBox)sender;
            GridViewRow grvData = (GridViewRow)txt.Parent.Parent;
            TextBox txtReceivedDate = (TextBox)grvData.FindControl("txtReceivedDate");
            txtReceivedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivedDate.ClientID + "','" + strDateFormat + "',false,  false);");


            //if (!FunProIs_Exists_Fund_Ref_No(txt))
            //    return;
            //else if (!FunProIs_Exists_Fund_Ref_NoDT(txt))
            //    return;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvFunderTransaction.ErrorMessage = "Unable To Verify Fund Reference Number";//Resources.ErrorHandlingAndValidation._1434;
            cvFunderTransaction.IsValid = false;
        }
    }

    protected bool FunPro_chk_Duplicate(string strFundRefNo)
    {
        objAdminServices = new FAAdminServiceReference.FAAdminServicesClient();

        try
        {
            DataTable DT = (DataTable)ViewState["DT_Receiving"];
            for (int i = 0; i < DT.Rows.Count; i++)
            {
                if (strFundRefNo.ToUpper() == DT.Rows[i]["Fund_Ref_No"].ToString().ToUpper())
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Fund Reference Number Already Exists");
                    return false;
                }
            }
            int j;

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            Procparam.Add("@Fund_Ref_No", strFundRefNo);
            //Modified By Chandrasekar K On 09-Oct-2012
            //j = Convert.ToInt32(objAdminServices.FunGetScalarValue("FA_IS_EXIST_FUNDER_REF_NO",strConnectionName , Procparam));
            DataTable dtIS_EXIST = Utility_FA.GetDefaultData("FA_IS_EXIST_FUNDER_REF_NO", Procparam);
            j = Convert.ToInt32(dtIS_EXIST.Rows[0][0].ToString());
            if (j == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Fund Reference Number Already Exists");
                return false;
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (objAdminServices != null)
                objAdminServices.Close();
        }
        return true;
    }

    protected void txtValidUpto_TextChanged(object sender, EventArgs e)
    {
        if (Utility_FA.CompareDates(txtValidUpto.Text.Trim(), DateTime.Now.ToString(strDateFormat)) != 1)
            txtCommitAmt.Enabled = true;
        txtValidUpto.Focus();
    }

    protected void txtCommitAmt_TextChanged(object sender, EventArgs e)
    {

        //if (ViewState["DueTotal"] != null)
        //{
        //    //if (Convert.ToDecimal(txtCommitAmt.Text) < Convert.ToDecimal(ViewState["DueTotal"]))
        //    if (Convert.ToDecimal(txtTransactionAmt.Text) < Convert.ToDecimal(ViewState["DueTotal"]))
        //    {
        //        Utility_FA.FunShowAlertMsg_FA(this.Page, "Transcation Amount cannot be less than Received Amount");
        //        //txtCommitAmt.Focus();
        //        txtTransactionAmt.Focus();
        //        return;
        //    }
        //}

        //if (ViewState["Deal_Details"] != null)
        //{
        //    DataTable dtdeal = new DataTable();
        //    dtdeal = (DataTable)ViewState["Deal_Details"];
        //    if (Convert.ToDecimal(dtdeal.Rows[0]["Tran_Amount"].ToString()) < Convert.ToDecimal(txtTransactionAmt.Text.ToString()))
        //    {
        //        Utility_FA.FunShowAlertMsg_FA(this.Page, "Transaction amount should not exceeds " + Convert.ToDecimal(dtdeal.Rows[0]["Tran_Amount"].ToString()));
        //        //txtCommitAmt.Focus();
        //        txtTransactionAmt.Focus();
        //        txtTransactionAmt.Text = dtdeal.Rows[0]["Tran_Amount"].ToString();
        //        return;
        //    }
        //}

        if (ViewState["Currency_Code"] != null)//Foregin currency
        {
            if (!string.IsNullOrEmpty(txtTransactionAmt.Text))
            {
                decimal decCurrencyValue = 1;
                if (!string.IsNullOrEmpty(txtCurrencyValue.Text))
                    decCurrencyValue = Convert.ToDecimal(txtCurrencyValue.Text);
                txtTransactionamtINR.Text = (Convert.ToDecimal(txtTransactionAmt.Text) * decCurrencyValue).ToString();
            }

        }



        FunPriSetAmountcheck(false);
        txtCommitAmt.Focus();

    }

    protected void txtTenure_TextChanged(object sender, EventArgs e)
    {
        DateTime dtEnddate = new DateTime();
        DateTime dtstartdate = new DateTime();
        if (!string.IsNullOrEmpty(txtTenure.Text))
        {
            if (ddlTenureType.SelectedIndex > 0)
            {

                dtstartdate = Utility_FA.StringToDate(txtFundTransDate.Text);
                switch (ddlTenureType.SelectedValue)
                {
                    case "1"://Years
                        dtEnddate = dtstartdate.AddYears(Convert.ToInt32(txtTenure.Text));
                        break;
                    case "2"://Months
                        dtEnddate = dtstartdate.AddMonths(Convert.ToInt32(txtTenure.Text));
                        break;
                    case "3"://Days
                        dtEnddate = dtstartdate.AddDays(Convert.ToInt32(txtTenure.Text));
                        break;
                }
                txtValidUpto.Text = dtEnddate.ToString(strDateFormat);
                if (ViewState["Fund_Nature"].ToString() == "8")
                {
                    txtInterestLevy.Text = txtValidUpto.Text;
                }
            }
        }
        txtTenure.Focus();
    }

    #endregion

    #region [Receiving Details]

    protected void btnGoR_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtInterestCalcdate.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Calculation date in Funder Details Tab");
                return;
            }
            if (txtInterestLevy.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Pay date in Funder Details Tab");
                return;
            }
            if (txtTenure.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Enter the Tenure in Funder Details Tab");
                return;
            }
            if (ddlTenureType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Tenure Type in Funder Details Tab");
                return;
            }
            if (txtTenure.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Enter the Tenure in Funder Details Tab");
                return;
            }
            if (ddlInterestCalc.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Calculation Type in Funder Details Tab");
                return;
            }
            if (ddlInterestLevy.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Pay in Funder Details Tab");
                return;
            }
            if (txtInterestLevy.Text == "0")
            {
                Utility.FunShowAlertMsg(this, "Enter the Interest Pay Date in Funder Details Tab");
                return;
            }


            if (ddlInflowType.SelectedValue == "1")//Equated Installments
            {
                decimal decFacilityAmt = 0;
                decimal decTempFacilityAmt = 0; decimal decSumFacilityAmt = 0;
                DateTime dtstartdate = new DateTime();
                DateTime dtEnddate = new DateTime();
                DateTime dttempdate = new DateTime();
                //str

                dtstartdate = Utility_FA.StringToDate(txtReceivingDate.Text);
                //DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
                //dtformat.ShortDatePattern = "MM/dd/yy";
                //dtstartdate = DateTime.Parse(txtReceivingDate.Text, dtformat);
                DataTable dtReceving = (DataTable)ViewState["DT_Receiving"];
                switch (ddlTenureType.SelectedValue)
                {
                    case "1"://Years
                        dtEnddate = dtstartdate.AddYears(Convert.ToInt32(txtTenure.Text));
                        break;
                    case "2"://Months
                        dtEnddate = dtstartdate.AddMonths(Convert.ToInt32(txtTenure.Text));
                        break;
                    case "3"://Days
                        dtEnddate = dtstartdate.AddDays(Convert.ToInt32(txtTenure.Text));
                        break;
                }
                decFacilityAmt = decTempFacilityAmt = Convert.ToDecimal(txtTransactionAmt.Text);

                if (ViewState["Fund_Nature"] != null)
                {
                    if (ViewState["Fund_Nature"].ToString() == "8")
                    {
                        decFacilityAmt = decTempFacilityAmt = FunPriGetFacilityAmount(decFacilityAmt);
                    }
                }

                decSumFacilityAmt = Math.Floor(decFacilityAmt / Convert.ToInt32(txtTenure.Text));
                //dttempdate = FunPubGetNextDate(ddlReceivingType.SelectedValue, dtstartdate);
                dttempdate = dtstartdate;
                int intslno = 1;
                dtReceving = FunPriReceivingDataTable();
                dtReceiving.Rows.Clear();

                while (dttempdate <= dtEnddate && dttempdate < Utility_FA.StringToDate(txtValidUpto.Text))
                {


                    DataRow drEmptyRow;
                    drEmptyRow = dtReceiving.NewRow();
                    drEmptyRow["Serial_Number"] = intslno.ToString();
                    drEmptyRow["Funder_Tran_Details_ID"] = "0";
                    drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
                    drEmptyRow["Fund_Rate"] = txtTotalRate.Text;
                    if (dttempdate != null)
                        drEmptyRow["Due_Date"] = dttempdate.ToString(strDateFormat);
                    //if (dttempdate == dtEnddate)
                    //    drEmptyRow["Due_Amount"] = decTempFacilityAmt;
                    //else
                    //    drEmptyRow["Due_Amount"] = decSumFacilityAmt;
                    //drEmptyRow["JV_No"] = " 0";
                    drEmptyRow["New_Old"] = "N";
                    drEmptyRow["Changed"] = "Y";
                    dtReceving.Rows.Add(drEmptyRow);
                    decTempFacilityAmt = Math.Floor(decTempFacilityAmt - decSumFacilityAmt);
                    intslno++;

                    dttempdate = FunPubGetNextDate(ddlReceivingType.SelectedValue, dttempdate);
                }

                if (dtReceiving.Rows.Count > 0)
                {
                    decimal decTotAmt = 0;
                    decSumFacilityAmt = Math.Floor(decFacilityAmt / (dtReceiving.Rows.Count));
                    foreach (DataRow dr in dtReceiving.Rows)
                    {
                        dr["Due_Amount"] = decSumFacilityAmt;
                        decTotAmt = decTotAmt + decSumFacilityAmt;
                    }
                    if (decTotAmt < decFacilityAmt)
                    {
                        dtReceiving.Rows[dtReceving.Rows.Count - 1]["Due_Amount"] = Math.Floor(Convert.ToDecimal(dtReceiving.Rows[dtReceving.Rows.Count - 1]["Due_Amount"]) + (decFacilityAmt - decTotAmt));
                    }
                    ViewState["DueTotal"] = null;
                    FunPubBindReceiving(dtReceiving);
                    ViewState["DT_Receiving"] = dtReceiving;
                }
                else
                {
                    FunPriInsertReceiving(LstReceived);
                }

            }
            else if (ddlInflowType.SelectedValue == "2")//Manual
            {
                ViewState["DT_Receiving"] = dtReceiving = null;
                FunPriInsertReceiving(LstReceived);
            }
            FunPriSetTotalDueAmount();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            cvFunderTransaction.ErrorMessage = "Unable to generate";
            cvFunderTransaction.IsValid = false;
        }
    }

    #region Receiving grid events

    protected void gvReceiving_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                AjaxControlToolkit.CalendarExtender CalReceivedDate = e.Row.FindControl("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                CalReceivedDate.Format = strDateFormat;

                TextBox txtFund_Ref_No = e.Row.FindControl("txtFund_Ref_No") as TextBox;

                TextBox txtRate = e.Row.FindControl("txtRate") as TextBox;
                TextBox txtReceivedDate = e.Row.FindControl("txtReceivedDate") as TextBox;
                TextBox txtReceivedAmount = e.Row.FindControl("txtReceivedAmount") as TextBox;
                LinkButton lnkAdd = e.Row.FindControl("lnkAdd") as LinkButton;

                Label lblTot = e.Row.FindControl("lblTot") as Label;
                Label lblTotDue = e.Row.FindControl("lblTotDue") as Label;
                if (ViewState["DueTotal"] != null)
                    lblTotDue.Text = ViewState["DueTotal"].ToString();

                if (strMode == "Q")
                {
                    lnkAdd.Visible = txtFund_Ref_No.Visible = txtRate.Visible = txtReceivedDate.Visible = txtReceivedAmount.Visible = false;
                }
                else if (strMode == "M")
                {
                    if (ViewState["Auth_Stat"] != null)
                        if (ViewState["Auth_Stat"].ToString() != "N")
                            lnkAdd.Visible = txtFund_Ref_No.Visible = txtRate.Visible = txtReceivedDate.Visible = txtReceivedAmount.Visible = false;

                }
                txtReceivedAmount.SetDecimalPrefixSuffix_FA(12, 3, false, "Due Amount");
                // txtRate.SetDecimalPrefixSuffix_FA(2, 2, false, "Rate");
                //txtReceivedDate.Attributes.Add("Readonly", "true");

                txtReceivedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivedDate.ClientID + "','" + strDateFormat + "',false,  false);");

            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkEdit = e.Row.FindControl("lnkEdit") as LinkButton;
                LinkButton lnkRemove = e.Row.FindControl("lnkRemove") as LinkButton;

                AjaxControlToolkit.CalendarExtender CalReceivedDate = e.Row.FindControl("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                if (CalReceivedDate != null)
                    CalReceivedDate.Format = strDateFormat;

                Label lblJVNo = e.Row.FindControl("lblJVNo") as Label;
                if (!string.IsNullOrEmpty(lblJVNo.Text.Trim()))
                {
                    //lnkRemove.Enabled = false;
                    lnkRemove.Visible = lnkEdit.Visible = false;
                    //lnkRemove.Attributes.Remove("OnClientClick");
                }

                TextBox txtReceivedDate = e.Row.FindControl("txtReceivedDate") as TextBox;

                if (txtReceivedDate != null)
                    //txtReceivedDate.Attributes.Add("Readonly", "true");
                    txtReceivedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivedDate.ClientID + "','" + strDateFormat + "',false,  false);");


                if (strMode == "Q")
                {
                    lnkEdit.Enabled = false;
                    lnkRemove.Enabled = false;
                }

                //Label lblReceivedAmount = e.Row.FindControl("lblReceivedAmount") as Label;
                //if (ViewState["DueTotal"] != null)
                //{
                //    ViewState["DueTotal"] = Convert.ToDecimal(ViewState["DueTotal"]) + Convert.ToDecimal(lblReceivedAmount.Text);
                //}
                //else
                //{
                //    ViewState["DueTotal"] = Convert.ToDecimal(lblReceivedAmount.Text);

                //}


            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation._1436;
            cvFunderTransaction.IsValid = false;
        }
    }
    protected void gvReceiving_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                // AjaxControlToolkit.ComboBox ComboRefNo = gvReceiving.FooterRow.FindControl("ComboRefNo") as AjaxControlToolkit.ComboBox;
                //AjaxControlToolkit.CalendarExtender CalReceivedDate = gvReceiving.FooterRow.FindControl ("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                //CalReceivedDate.Format = strDateFormat;

                TextBox txtFund_Ref_No = gvReceiving.FooterRow.FindControl("txtFund_Ref_No") as TextBox;
                TextBox txtRate = gvReceiving.FooterRow.FindControl("txtRate") as TextBox;
                TextBox txtReceivedDate = gvReceiving.FooterRow.FindControl("txtReceivedDate") as TextBox;
                TextBox txtReceivedAmount = gvReceiving.FooterRow.FindControl("txtReceivedAmount") as TextBox;

                Label lblTotDue = gvReceiving.FooterRow.FindControl("lblTotDue") as Label;
                decimal decTemp = 0;


                txtFund_Ref_No.Text = ddlTrancheRefNo.SelectedItem.Text;
                txtRate.Text = txtTotalRate.Text;

                if (ViewState["DueTotal"] == null)
                    decTemp = Convert.ToDecimal(txtReceivedAmount.Text);
                else
                    decTemp = Convert.ToDecimal(ViewState["DueTotal"]) + Convert.ToDecimal(txtReceivedAmount.Text);






                if (txtTransactionAmt.Text == "")
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter Transaction Amount");
                    return;
                }

                //if (!FunProIs_Exists_Fund_Ref_No(txtFund_Ref_No))
                //   return;
                //else if (!FunProIs_Exists_Fund_Ref_NoDT(txtFund_Ref_No))
                //   return;
                //if (!FunPro_chk_Duplicate(txtFund_Ref_No.Text.Trim()))
                //{
                //    txtFund_Ref_No.Focus();
                //    return;
                //}
                //else if (Utility_FA.CompareDates(txtValidUpto.Text.Trim(), txtReceivedDate.Text.Trim()) == 1)


                decimal decFacilityAmt = 0;
                if (!string.IsNullOrEmpty(txtTransactionAmt.Text))
                    decFacilityAmt = Convert.ToDecimal(txtTransactionAmt.Text);

                if (ViewState["Fund_Nature"] != null)
                {
                    if (ViewState["Fund_Nature"].ToString() == "8")
                    {
                        decFacilityAmt = FunPriGetFacilityAmount(decFacilityAmt);
                    }
                }



                if (Utility_FA.CompareDates(txtValidUpto.Text.Trim(), txtReceivedDate.Text.Trim()) == 1)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Due Date should be less than or equal to Valid Upto Date");
                    txtReceivedDate.Focus();
                    return;
                }
                //else if (decTemp > Convert.ToDecimal(txtCommitAmt.Text))
                else if (decTemp > decFacilityAmt)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Total Due Amount should be less than or equal to Transaction Amount");
                    txtReceivedAmount.Focus();
                    return;
                }
                else
                {
                    ViewState["DueTotal"] = decTemp;
                    lblTotDue.Text = Convert.ToString(decTemp);
                    LstReceived.Add("0");
                    LstReceived.Add(txtFund_Ref_No.Text.Trim());
                    LstReceived.Add(txtRate.Text.Trim());
                    LstReceived.Add(txtReceivedDate.Text.Trim());
                    LstReceived.Add(txtReceivedAmount.Text.Trim());
                    FunPriInsertReceiving(LstReceived);
                }

                //Fun_Update_Table(txtFund_Ref_No.Text , Convert .ToDecimal (txtReceivedAmount .Text),0);
                //Fun_Add_Table(txtFund_Ref_No.Text, Convert.ToDecimal(txtReceivedAmount.Text));
                //DropDownList ddlFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("ddlFund_Ref_No") as DropDownList;
                //FunProLoadFund_Ref_No(ddlFund_Ref_No);
                //FunProLoadFund_Ref_No(ddlFund_Ref_No,txtFund_Ref_No.Text.Trim());

            }
        }
        catch (Exception ex)
        {
            validationCode = "1436";
            throw ex;
        }
    }
    protected void gvReceiving_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            dtReceiving = FunPriReceivingDataTable();

            HiddenField hdnSlno = gvReceiving.Rows[e.RowIndex].FindControl("hdnSlno") as HiddenField;
            Label lblRefNo = gvReceiving.Rows[e.RowIndex].FindControl("lblRefNo") as Label;
            Label lblReceivedAmount = gvReceiving.Rows[e.RowIndex].FindControl("lblReceivedAmount") as Label;
            if (ViewState["DueTotal"] != null)
            {
                ViewState["DueTotal"] = Convert.ToDecimal(ViewState["DueTotal"]) - Convert.ToDecimal(lblReceivedAmount.Text);
            }
            DataTable DTRepay = (DataTable)ViewState["dtRepay"];
            //for (int j = DTRepay.Rows.Count; j > 0; j--)
            //{
            //    //if (lblRefNo.Text.Trim () == DTRepay.Rows[j-1]["Fund_Ref_No"].ToString())
            //    if (lblRefNo.Text.Trim() == DTRepay.Rows[j - 1]["Fund_Ref_No"].ToString() && string.IsNullOrEmpty(DTRepay.Rows[j - 1]["JV_No"].ToString()))
            //    {
            //        if (ViewState["RepayTotal"] != null)
            //        {
            //            ViewState["RepayTotal"] = Convert.ToDecimal(ViewState["RepayTotal"]) - Convert.ToDecimal(DTRepay.Rows[j - 1]["Repay_Amount"].ToString());
            //        }
            //        DTRepay.Rows.RemoveAt(j - 1);
            //    }
            //}
            //ViewState["DT_Repay"] = DTRepay;
            dtReceiving.Rows.RemoveAt(e.RowIndex);
            ViewState["DT_Receiving"] = dtReceiving;

            dtReceiving = FunPriReceivingDataTable();
            if (dtReceiving.Rows.Count == 0)
            {
                FunPriInsertReceiving(LstReceived);//FunPriInsertReceiving("0","", "", "", "", "");
            }
            else
            {
                FunPubBindReceiving(dtReceiving);
            }
            //if (DTRepay.Rows.Count == 0)
            //{
            //    FunPriInsertRepay(LstRepay);//FunPriInsertReceiving("0","", "", "", "", "");
            //}
            //else
            //{
            //    FunPubBindRepay(DTRepay);
            //}

        }
        catch (Exception ex)
        {
            validationCode = "1438";
            throw ex;
        }
    }
    protected void gvReceiving_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvReceiving.EditIndex = e.NewEditIndex;
            FunPriFillGrid();
            gvReceiving.FooterRow.Enabled = false;
            //((TextBox)gvReceiving.Rows[e.NewEditIndex].FindControl("txtReceivedAmount")).Style.Add("text-align", "right");
            ((TextBox)gvReceiving.Rows[e.NewEditIndex].FindControl("txtReceivedAmount")).SetDecimalPrefixSuffix_FA(12, 3, true, "Due Amount");
            //((TextBox)gvReceiving.Rows[e.NewEditIndex].FindControl("txtRate")).SetDecimalPrefixSuffix_FA(2, 2, true, "Rate");
            //  ((TextBox)gvReceiving.Rows[e.NewEditIndex].FindControl("txtRate")).Style.Add("text-align", "right");
            // ((TextBox)gvReceiving.Rows[e.NewEditIndex].FindControl("txtReceivedAmount")).Style.Add("text-align", "right");

        }
        catch (Exception ex)
        {
            validationCode = "1439";
            throw ex;
        }
    }
    protected void gvReceiving_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            Label lblRefNo = gvReceiving.Rows[e.RowIndex].FindControl("lblRefNo") as Label;

            TextBox txtRate = gvReceiving.Rows[e.RowIndex].FindControl("txtRate") as TextBox;
            TextBox txtReceivedDate = gvReceiving.Rows[e.RowIndex].FindControl("txtReceivedDate") as TextBox;
            TextBox txtReceivedAmount = gvReceiving.Rows[e.RowIndex].FindControl("txtReceivedAmount") as TextBox;
            HiddenField hdnSlno = gvReceiving.Rows[e.RowIndex].FindControl("hdnSlno") as HiddenField;
            HiddenField hdnDueAmt = gvReceiving.Rows[e.RowIndex].FindControl("hdnDueAmt") as HiddenField;
            HiddenField hdn_TranID = gvReceiving.Rows[e.RowIndex].FindControl("hdn_TranID") as HiddenField;
            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("ddlFund_Ref_No") as DropDownList;
            //FunProLoadFund_Ref_No(ddlFund_Ref_No);



            decimal decTemp = 0;

            //code added
            lblRefNo.Text = ddlTrancheRefNo.SelectedItem.Text;
            txtRate.Text = txtTotalRate.Text;

            if (ViewState["DueTotal"] == null)
                decTemp = Convert.ToDecimal(txtReceivedAmount.Text);
            else
                decTemp = Convert.ToDecimal(ViewState["DueTotal"]) - Convert.ToDecimal(hdnDueAmt.Value) + Convert.ToDecimal(txtReceivedAmount.Text);

            //if (ViewState["DT_FRefNo"] != null)
            //    dtFRefNo = (DataTable)ViewState["DT_FRefNo"];
            //if (dtFRefNo.Rows.Count > 0)
            //{
            //    DataRow[] drCode;
            //    drCode = dtFRefNo.Select("Fund_Ref_No='" + ddlFund_Ref_No.SelectedValue + "'");
            //    int i = Convert.ToInt32(drCode[0].ItemArray[0].ToString());

            //    if (decTemp < Convert.ToDecimal(drCode[0].ItemArray[3].ToString()))
            //    {
            // //       FunProLoadFund_Ref_No(ddlFund_Ref_No, null);
            //        Utility_FA.FunShowAlertMsg_FA(this.Page, "Due Amount should not be less than Repay Amount");
            //        txtReceivedAmount.Focus();
            //        return;
            //    }
            //}



            decimal decFacilityAmt = 0;
            if (!string.IsNullOrEmpty(txtTransactionAmt.Text))
                decFacilityAmt = Convert.ToDecimal(txtTransactionAmt.Text);

            if (ViewState["Fund_Nature"] != null)
            {
                if (ViewState["Fund_Nature"].ToString() == "8")
                {
                    decimal decRate = 0;
                    if (!string.IsNullOrEmpty(txtTotalRate.Text))
                        decRate = Convert.ToDecimal(txtTotalRate.Text);
                    decFacilityAmt = decFacilityAmt - decFacilityAmt * decRate / 100;

                    if (ViewState["DiscAmount"] != null)
                    {
                        if (!string.IsNullOrEmpty(ViewState["DiscAmount"].ToString()))
                            decFacilityAmt = decFacilityAmt - Convert.ToDecimal(ViewState["DiscAmount"].ToString());
                    }


                }
            }


            if (Utility_FA.CompareDates(txtValidUpto.Text.Trim(), txtReceivedDate.Text.Trim()) == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Due Date should be less than or equal to Valid Upto Date");
                txtReceivedDate.Focus();
                return;
            }
            //else if (decTemp > Convert.ToDecimal(txtCommitAmt.Text))
            else if (decTemp > decFacilityAmt)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Total Due Amount should be less than or equal to Transaction Amount");
                txtReceivedAmount.Focus();
                return;
            }
            else if (!Is_Valid_Update_Receiving(lblRefNo.Text, txtReceivedDate.Text, Convert.ToDecimal(txtReceivedAmount.Text), Convert.ToDecimal(hdnDueAmt.Value)))
            {
                return;
            }
            else
            {
                LstReceived.Add(e.RowIndex.ToString());
                LstReceived.Add(hdnSlno.Value);
                LstReceived.Add("");//txtFund_Ref_No.Text.Trim());
                LstReceived.Add(txtRate.Text.Trim());
                LstReceived.Add(txtReceivedDate.Text.Trim());
                LstReceived.Add(txtReceivedAmount.Text.Trim());
                FunPriUpdateDataTable(LstReceived);
            }
            Label lblTotDue = gvReceiving.FooterRow.FindControl("lblTotDue") as Label;
            ViewState["DueTotal"] = Convert.ToDecimal(ViewState["DueTotal"]) - Convert.ToDecimal(hdnDueAmt.Value) + Convert.ToDecimal(txtReceivedAmount.Text);
            lblTotDue.Text = ViewState["DueTotal"].ToString();

            gvReceiving.EditIndex = -1;
            FunPriFillGrid();
            gvReceiving.FooterRow.Enabled = true;

            //Fun_Update_Table(lblRefNo.Text, Convert.ToDecimal(txtReceivedAmount.Text), Convert.ToDecimal(hdnDueAmt.Value));

            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("ddlFund_Ref_No") as DropDownList;
            //FunProLoadFund_Ref_No(ddlFund_Ref_No);



        }
        catch (Exception ex)
        {
            validationCode = "1437";
            throw ex;
        }
    }
    protected void gvReceiving_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvReceiving.EditIndex = -1;
            FunPriFillGrid();
            gvReceiving.FooterRow.Enabled = true;
        }
        catch (Exception ex)
        {
            validationCode = "1440";
            throw ex;
        }
    }

    private void FunPriSetTotalDueAmount()
    {
        try
        {
            decimal decDueAmount = 0;

            foreach (GridViewRow grv in gvReceiving.Rows)
            {
                Label lblReceivedAmount = (Label)grv.FindControl("lblReceivedAmount");
                if (lblReceivedAmount != null)
                {
                    if (!string.IsNullOrEmpty(lblReceivedAmount.Text))
                    {
                        decDueAmount += Convert.ToDecimal(lblReceivedAmount.Text);
                    }
                }
            }

            if (gvReceiving.FooterRow != null)
            {
                Label lblTotDue = gvReceiving.FooterRow.FindControl("lblTotDue") as Label;
                if (lblTotDue != null)
                    ViewState["DueTotal"] = lblTotDue.Text = decDueAmount.ToString();

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    #endregion

    #region [Funder Receiving Methods for DataTable]

    private DataTable FunPriReceivingDataTable()
    {
        try
        {
            DataRow drEmptyRow;
            if (ViewState["DT_Receiving"] == null)
            {
                dtReceiving = new DataTable();
                dtReceiving.Columns.Add("Serial_Number");
                dtReceiving.Columns.Add("Funder_Tran_Details_ID");
                dtReceiving.Columns.Add("Fund_Ref_No");
                dtReceiving.Columns.Add("Fund_Rate");
                dtReceiving.Columns.Add("Due_Date");
                dtReceiving.Columns.Add("Due_Amount");
                dtReceiving.Columns.Add("JV_No");
                //dtReceiving.Columns.Add("Is_Active");
                dtReceiving.Columns.Add("New_Old");
                dtReceiving.Columns.Add("Changed");

                ViewState["DT_Receiving"] = dtReceiving;
            }
            dtReceiving = (DataTable)ViewState["DT_Receiving"];
        }
        catch (Exception ex)
        {
            validationCode = "1408";
            throw ex;
        }
        return dtReceiving;
    }

    private void FunPriInsertReceiving(List<string> Lst)
    {
        try
        {
            DataRow drEmptyRow;
            dtReceiving = FunPriReceivingDataTable();
            if (dtReceiving.Rows.Count < 1)
            {
                drEmptyRow = dtReceiving.NewRow();
                drEmptyRow["Serial_Number"] = "0";
                drEmptyRow["Funder_Tran_Details_ID"] = "0";
                drEmptyRow["Fund_Ref_No"] = "0";
                drEmptyRow["Fund_Rate"] = 0;
                drEmptyRow["Due_Date"] = "0";
                drEmptyRow["Due_Amount"] = 0;
                drEmptyRow["JV_No"] = " 0";
                // drEmptyRow["Is_Active"] = 1;
                drEmptyRow["New_Old"] = "N";
                drEmptyRow["Changed"] = "Y";
                dtReceiving.Rows.Add(drEmptyRow);
            }
            else
            {
                drEmptyRow = dtReceiving.NewRow();
                drEmptyRow["Serial_Number"] = Convert.ToInt32(dtReceiving.Rows[dtReceiving.Rows.Count - 1]["Serial_Number"]) + 1;
                drEmptyRow["Funder_Tran_Details_ID"] = Lst[0];
                drEmptyRow["Fund_Ref_No"] = Lst[1];
                drEmptyRow["Fund_Rate"] = Lst[2];
                drEmptyRow["Due_Date"] = Lst[3];
                drEmptyRow["Due_Amount"] = Lst[4];
                drEmptyRow["JV_No"] = "";// Lst[0];
                // drEmptyRow["Is_Active"] = 1;
                drEmptyRow["New_Old"] = "N";
                drEmptyRow["Changed"] = "Y";
                dtReceiving.Rows.Add(drEmptyRow);
            }
            if (dtReceiving.Rows.Count > 1)
            {
                if (dtReceiving.Rows[0]["Serial_Number"].ToString() == "0")
                {
                    dtReceiving.Rows[0].Delete();
                }
            }
            ViewState["DT_Receiving"] = dtReceiving;

            //FunPriFillGrid();
            FunPubBindReceiving(dtReceiving);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriUpdateDataTable(List<string> Lst)
    {
        try
        {
            DataTable dtUpdate = (DataTable)ViewState["DT_Receiving"];
            if (Convert.ToInt32(dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Serial_Number"]) == Convert.ToInt32(Lst[1]))
            {
                //dtUpdate.Rows[Convert .ToInt32 (Lst [0])]["Fund_Ref_No"] = Lst[2];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Fund_Rate"] = Lst[3];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Due_Date"] = Lst[4];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Due_Amount"] = Lst[5];
                //dtUpdate.Rows[Convert.ToInt32(Lst[0])]["JV_No"] = Lst[6];
                //dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Is_Active"] = 1;
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["New_Old"] = "O";
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Changed"] = "Y";
                dtUpdate.AcceptChanges();
                ViewState["DT_Receiving"] = dtUpdate;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriFillGrid()
    {
        try
        {
            gvReceiving.DataSource = (DataTable)ViewState["DT_Receiving"];
            gvReceiving.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPubBindReceiving(DataTable dtWorkflow)
    {
        try
        {
            // DataTable dt=new DataTable ();
            //dtWorkflow.DefaultView.Sort = "Due_Date";
            //DataView view = new DataView(dtWorkflow);
            //view.Sort = "Fund_Ref_No";


            gvReceiving.DataSource = dtWorkflow;
            gvReceiving.DataBind();
            Label lblTot = gvReceiving.FooterRow.FindControl("lblTot") as Label;
            Label lblTotDue = gvReceiving.FooterRow.FindControl("lblTotDue") as Label;
            if (dtWorkflow.Rows.Count > 0 && Convert.ToString(dtWorkflow.Rows[0]["Serial_Number"]) == "0")
            {
                gvReceiving.Rows[0].Visible = false;
                lblTot.Visible = lblTotDue.Visible = false;
            }
            else
                lblTot.Visible = lblTotDue.Visible = true;
            gvReceiving.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion

    #endregion



    #region [Borrower Repay Details]



    //To check the Entered Fund_Ref_No
    protected bool Is_Valid_Fund_Ref_No_Receiving(string txtRefNo, out string DueDate, out decimal DueAmt, out decimal Fund_Ref_RepayAmt)
    {
        try
        {
            DataTable DT = (DataTable)ViewState["DT_Receiving"];
            DueAmt = Fund_Ref_RepayAmt = 0;
            DueDate = "";
            //for (int i = 0; i < DT.Rows.Count; i++)
            //{
            //    if (txtRefNo == DT.Rows[i]["Fund_Ref_No"].ToString())
            //    {
            //        DueAmt = Convert.ToDecimal(DT.Rows[i]["Due_Amount"]);
            //        DueDate = DT.Rows[i]["Due_Date"].ToString();
            //        DataTable DTRepay = (DataTable)ViewState["DT_Repay"];
            //        for (int j = 0; j < DTRepay.Rows.Count; j++)
            //        {
            //            if (txtRefNo == DTRepay.Rows[j]["Fund_Ref_No"].ToString())
            //            {
            //                Fund_Ref_RepayAmt = Fund_Ref_RepayAmt + Convert.ToDecimal(DTRepay.Rows[j]["Repay_Amount"]);
            //            }
            //        }

            //        return true;
            //    }
            //}
            if (DT.Rows.Count > 0)
            {

                for (int i = 0; i < DT.Rows.Count; i++)
                {
                    if (txtRefNo == DT.Rows[i]["Fund_Ref_No"].ToString())
                    {
                        DueAmt = DueAmt + Convert.ToDecimal(DT.Rows[i]["Due_Amount"]);
                        DueDate = DT.Rows[i]["Due_Date"].ToString();
                    }
                }
                DueDate = DT.Rows[0]["Due_Date"].ToString();
                DataTable DTRepay = (DataTable)ViewState["dtRepay"];
                for (int j = 0; j < DTRepay.Rows.Count; j++)
                {
                    if (txtRefNo == DTRepay.Rows[j]["Fund_Ref_No"].ToString())
                    {
                        Fund_Ref_RepayAmt = Fund_Ref_RepayAmt + Convert.ToDecimal(DTRepay.Rows[j]["Repay_Amount"]);
                    }

                }
                return true;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
        return false;
    }

    protected bool Is_Valid_Update_Receiving(string txtRefNo, string strDate, decimal dcAmount, decimal dcOldReceiving)
    {
        try
        {
            DataTable DT = (DataTable)ViewState["DT_Receiving"];
            decimal dcRepay = 0, dCRec = 0;
            //dcAmount = Convert.ToDecimal(DT.Compute("Sum(Due_Amount)", "Fund_Ref_No='" + txtRefNo + "'")) - dcOldReceiving + dcAmount;


            DataTable DTRepay = (DataTable)ViewState["dtRepay"];
            for (int i = 0; i < DTRepay.Rows.Count; i++)
            {
                if (txtRefNo == DTRepay.Rows[i]["Fund_Ref_No"].ToString())
                {
                    if (Utility_FA.CompareDates(strDate, DTRepay.Rows[i]["Repay_Date"].ToString()) == -1)
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "Due Date cannot be greater than Repay Date");
                        return false;
                    }
                    dcRepay = dcRepay + Convert.ToDecimal(DTRepay.Rows[i]["Repay_Amount"]);
                }
            }
            if (dcRepay > dcAmount)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Due Amount cannot be lesser than Repay Amount");
                return false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return true;
    }

    #region "Old Methods"
    /*

    protected void gvBorrowerRepay_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                //TextBox txtFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("txtFund_Ref_No") as TextBox;

                //DropDownList ddlFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("ddlFund_Ref_No") as DropDownList;
                TextBox txtRepayDate = gvBorrowerRepay.FooterRow.FindControl("txtRepayDate") as TextBox;
                TextBox txtRepayAmount = gvBorrowerRepay.FooterRow.FindControl("txtRepayAmount") as TextBox;
                TextBox txtFund_Ref_No = gvBorrowerRepay.FooterRow.FindControl("txtFund_Ref_No") as TextBox;
                Label lblHedgeNo = gvBorrowerRepay.FooterRow.FindControl("lblHedgeNo") as Label;
                TextBox txtHedgeAmount = gvBorrowerRepay.FooterRow.FindControl("txtHedgeAmount") as TextBox;

                txtFund_Ref_No.Text = ddlTrancheRefNo.SelectedItem.Text;

                LstRepay.Add("0");
                LstRepay.Add(txtFund_Ref_No.Text.Trim());
                LstRepay.Add(txtRepayDate.Text.Trim());
                LstRepay.Add(txtRepayAmount.Text.Trim());
                if (lblHedgeNo.Text != "")
                {
                    LstRepay.Add(lblHedgeNo.Text.Trim());
                    LstRepay.Add(txtHedgeAmount.Text.Trim());
                }
                else
                {
                    LstRepay.Add(lblHedgeNo.Text.Trim());
                    LstRepay.Add(txtHedgeAmount.Text.Trim());
                }

                Label lblTotRepay = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;
                decimal decTotRepay = 0;

                //if (ViewState["RepayTotal"] == null)
                //    decTotRepay = Convert.ToDecimal(txtRepayAmount.Text);
                //else
                //    decTotRepay = Convert.ToDecimal(ViewState["RepayTotal"]) + Convert.ToDecimal(txtRepayAmount.Text);

                decimal DueAmt = 0, Fund_Ref_RepayAmt = 0, tot = 0;
                string DueDate = "";

                if (!Is_Valid_Fund_Ref_No_Receiving(txtFund_Ref_No.Text, out DueDate, out DueAmt, out Fund_Ref_RepayAmt))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter Valid Fund Reference Number ");
                    return;
                }
                if (!string.IsNullOrEmpty(txtRepayDate.Text))
                {
                    DateTime dtHolidate;
                    dtHolidate = FunCheckIs_Holiday(Utility_FA.StringToDate(txtRepayDate.Text));
                    if (dtHolidate != Utility_FA.StringToDate(txtRepayDate.Text))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should not in Holiday/Leave date.");
                        txtRepayDate.Focus();
                        return;
                    }
                }
                  //if (!string.IsNullOrEmpty(DueDate))
                  //  {
                  //      if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), DueDate) >= 0)
                  //      {
                  //          Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should be greater than Due Date");
                  //          txtRepayDate.Focus();
                  //          return;
                  //      }
                  //  }


                if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), txtValidUpto.Text.Trim()) == -1)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date Should be within the Tenure");
                    txtRepayDate.Focus();
                    return;
                }

                Fund_Ref_RepayAmt = Fund_Ref_RepayAmt + Convert.ToDecimal(txtRepayAmount.Text);

                if (Fund_Ref_RepayAmt > DueAmt)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Amount cannot be greater than Received Amount");
                    txtRepayAmount.Focus();
                    return;
                }
                else
                {
                    ViewState["RepayTotal"] = decTotRepay;
                    lblTotRepay.Text = Convert.ToString(decTotRepay);

                    FunPriInsertRepay(LstRepay);
                }
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            dtRepay = FunPriRepayDataTable();


            Label lblRepayAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("lblRepayAmount") as Label;
            if (ViewState["RepayTotal"] != null)
                ViewState["RepayTotal"] = Convert.ToDecimal(ViewState["RepayTotal"]) - Convert.ToDecimal(lblRepayAmount.Text);

            dtRepay.Rows.RemoveAt(e.RowIndex);
            ViewState["DT_Repay"] = dtRepay;

            dtRepay = FunPriRepayDataTable();
            if (dtRepay.Rows.Count == 0)
                FunPriInsertRepay(LstRepay);
            else
                FunPubBindRepay(dtRepay);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvBorrowerRepay.EditIndex = e.NewEditIndex;
            FunPriFillGridRepay();
            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("ddlFund_Ref_No") as DropDownList;
            //HiddenField hdn_Fund_Ref_No = (HiddenField)gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("hdn_Fund_Ref_No");
            // ((TextBox)gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtRepayAmount")).Style.Add("text-align", "right");
            ((TextBox)gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtRepayAmount")).SetDecimalPrefixSuffix_FA(12, 0, true, "Repay Amount");

            //FunProLoadFund_Ref_No(ddlFund_Ref_No, hdn_Fund_Ref_No.Value);
            //ddlFund_Ref_No.SelectedValue = hdn_Fund_Ref_No.Value;
            //ddlFund_Ref_No.AddItemToolTipText_FA();
            //gvBorrowerRepay.FooterRow.Enabled = false;
            if (gvBorrowerRepay.FooterRow != null)
            {
                DropDownList ddlHedgeNo = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("ddlHedgeNo") as DropDownList;

                if (ddlHedgeNo != null)
                {
                    FunProLoadHedgeRefNo(ddlHedgeNo);
                }
                gvBorrowerRepay.FooterRow.Enabled = false;
            }

            Button btnPopGo = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("btnPopGo") as Button;
            TextBox txtHedgeAmount = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtHedgeAmount") as TextBox;
            //To disable hedge button for indian currency
            if (ViewState["Currency_Code"] == null)
            {
                btnPopGo.Enabled = false;
                txtHedgeAmount.ReadOnly = true;
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    

    protected void FunProLoadFund_Ref_No(DropDownList ddl)
    {
        try
        {
            DataTable dt = new DataTable();
            DataRow drEmptyRow;
            dt.Columns.Add("Fund_Ref_No");
            dt.Columns.Add("Fund_Ref_No1");
            decimal due = 0, rec = 0;
            string strRef = "";

            //dtReceiving = (DataTable)ViewState["DT_Receiving"];
            dtRepay = (DataTable)ViewState["DT_Repay"];
            if (ViewState["vs_Table"] != null)
                dtReceiving = (DataTable)ViewState["vs_Table"];

            for (int i = 0; i < dtReceiving.Rows.Count; i++)
            {
                strRef = dtReceiving.Rows[i]["Fund_Ref_No"].ToString();
                due = Convert.ToDecimal(dtReceiving.Rows[i]["Due_Amount"]);
                for (int j = 0; j < dtRepay.Rows.Count; j++)
                {
                    if (dtRepay.Rows[j]["Fund_Ref_No"].ToString() == strRef)
                        rec = rec + Convert.ToDecimal(dtRepay.Rows[j]["Repay_Amount"]);
                }
                if (due > rec)
                {
                    drEmptyRow = dt.NewRow();
                    drEmptyRow["Fund_Ref_No"] = strRef;
                    drEmptyRow["Fund_Ref_No1"] = strRef;
                    dt.Rows.Add(drEmptyRow);
                }
                rec = 0;
            }

            //dtReceiving = (DataTable)ViewState["DT_Receiving"];
            ddl.DataValueField = "Fund_Ref_No";
            ddl.DataTextField = "Fund_Ref_No1";

            ddl.DataSource = dt;
            //if (dtReceiving.Rows[0]["Serial_Number"].ToString() == "0")
            //    ddl.DataSource = null;
            //else
            //    ddl.DataSource = dt;
            ddl.DataBind();
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddl.Items.Insert(0, liSelect);
            ddl.AddItemToolTipText_FA();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Fun_Create_Table()
    {
        // dtTemp.Columns.Add("ID" ,typeof(Int32));
        dtTemp.Columns.Add("Fund_Ref_No");
        dtTemp.Columns.Add("Due_Amount");
        ViewState["vs_Table"] = dtTemp;
    }

    protected void Fun_Add_Table(string strRefNo, decimal decDue_amount)
    {
        try
        {
            dtTemp = (DataTable)ViewState["vs_Table"];
            DataRow drEmptyRow = dtTemp.NewRow();
            //drEmptyRow["ID"] = dtTemp.Rows.Count;
            drEmptyRow["Fund_Ref_No"] = strRefNo;
            drEmptyRow["Due_Amount"] = decDue_amount;
            dtTemp.Rows.Add(drEmptyRow);
            ViewState["vs_Table"] = dtTemp;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Fun_Edit_Table(string strRefNo, decimal decDue_amount, decimal old_Amount)
    {
        try
        {
            dtTemp = (DataTable)ViewState["vs_Table"];
            DataRow[] dr;//= dtTemp.NewRow();
            dr = dtTemp.Select("Fund_Ref_No='" + strRefNo.ToLower() + "'");
            if (dr.Count() > 0)
            {
                dtTemp.Rows[0]["Due_Amount"] = Convert.ToDecimal(dtTemp.Rows[0]["Due_Amount"]) + decDue_amount - old_Amount;
                dtTemp.AcceptChanges();
                ViewState["vs_Table"] = dtTemp;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Fun_Update_Table(string strRefNo, decimal decDue_amount, decimal old_Amount)
    {
        try
        {
            dtTemp = (DataTable)ViewState["vs_Table"];
            DataRow[] dr;//= dtTemp.NewRow();
            int i = 0;
            // dr = dtTemp.Select("Fund_Ref_No='" + strRefNo.ToLower() + "'");
            if (dtTemp.Rows.Count <= 0)
            {
                DataRow drEmptyRow = dtTemp.NewRow();
                //drEmptyRow["ID"] = dtTemp.Rows.Count;
                drEmptyRow["Fund_Ref_No"] = strRefNo;
                drEmptyRow["Due_Amount"] = decDue_amount;
                dtTemp.Rows.Add(drEmptyRow);
            }
            else
            {
                dr = dtTemp.Select("Fund_Ref_No='" + strRefNo.ToLower() + "'");
                if (dr.Count() > 0)
                {
                    dtTemp.Rows[0]["Due_Amount"] = Convert.ToDecimal(dtTemp.Rows[0]["Due_Amount"]) + decDue_amount - old_Amount;
                    dtTemp.AcceptChanges();
                }
                else
                {
                    DataRow drEmptyRow = dtTemp.NewRow();
                    //drEmptyRow["ID"] = dtTemp.Rows.Count;
                    drEmptyRow["Fund_Ref_No"] = strRefNo;
                    drEmptyRow["Due_Amount"] = decDue_amount;
                    dtTemp.Rows.Add(drEmptyRow);

                }
            }
            ViewState["vs_Table"] = dtTemp;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void FunProLoadFund_Ref_No(DropDownList ddl, string strFRef_No)
    {
        try
        {
            DataTable dt = new DataTable();
            DataRow drEmptyRow;
            dt.Columns.Add("Fund_Ref_No");
            dt.Columns.Add("Fund_Ref_No1");
            decimal due = 0, rec = 0;
            string strRef = "";

            //dtReceiving = (DataTable)ViewState["DT_Receiving"];
            dtRepay = (DataTable)ViewState["DT_Repay"];

            dtReceiving = (DataTable)ViewState["vs_Table"];

            for (int i = 0; i < dtReceiving.Rows.Count; i++)
            {
                strRef = dtReceiving.Rows[i]["Fund_Ref_No"].ToString();
                due = Convert.ToDecimal(dtReceiving.Rows[i]["Due_Amount"]);
                for (int j = 0; j < dtRepay.Rows.Count; j++)
                {
                    if (dtRepay.Rows[j]["Fund_Ref_No"].ToString() == strRef)
                        rec = rec + Convert.ToDecimal(dtRepay.Rows[j]["Repay_Amount"]);
                }
                if (due > rec)
                {
                    drEmptyRow = dt.NewRow();
                    drEmptyRow["Fund_Ref_No"] = strRef;
                    drEmptyRow["Fund_Ref_No1"] = strRef;
                    dt.Rows.Add(drEmptyRow);
                }
            }

            DataRow[] dr;
            dr = dt.Select("Fund_Ref_No='" + strFRef_No + "'");
            if (dr.Count() == 0)
            {
                drEmptyRow = dt.NewRow();
                drEmptyRow["Fund_Ref_No"] = strFRef_No;
                drEmptyRow["Fund_Ref_No1"] = strFRef_No;
                dt.Rows.Add(drEmptyRow);
            }

            //    int i = Convert.ToInt32(drCode[0].ItemArray[0].ToString());

            //    if (dtFRefNo.Rows.Count > 0)
            //        dtFRefNo.Rows.RemoveAt(i);

            //dtReceiving = (DataTable)ViewState["DT_Receiving"];
            ddl.DataValueField = "Fund_Ref_No";
            ddl.DataTextField = "Fund_Ref_No1";
            //if (dtReceiving.Rows[0]["Serial_Number"].ToString() == "0")
            //    ddl.DataSource = null;
            //else
            ddl.DataSource = dt;
            ddl.DataBind();
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddl.Items.Insert(0, liSelect);
            ddl.AddItemToolTipText_FA();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void FunProLoadFund_Ref_No1(DropDownList ddl, string strFRefNo, string strDue)
    {
        if (ViewState["DT_FRefNo"] != null)
            dtFRefNo = (DataTable)ViewState["DT_FRefNo"];
        else
        {
            dtFRefNo = new DataTable();
            dtFRefNo.Columns.Add("id");
            dtFRefNo.Columns.Add("Fund_Ref_No1");
            dtFRefNo.Columns.Add("Fund_Ref_No");
            dtFRefNo.Columns.Add("Due");

        }


        if (strFRefNo != null)
        {
            DataRow dr = dtFRefNo.NewRow();
            dr["id"] = dtFRefNo.Rows.Count;
            dr["Fund_Ref_No1"] = strFRefNo;
            dr["Fund_Ref_No"] = strFRefNo;
            dr["Due"] = strDue;
            dtFRefNo.Rows.Add(dr);

            ViewState["DT_FRefNo"] = dtFRefNo;
        }

        //if(ViewState["DT_Receiving"]!=null 
        //dtReceiving = (DataTable)ViewState["DT_Receiving"];
        ddl.DataValueField = "Fund_Ref_No1";
        ddl.DataTextField = "Fund_Ref_No";
        //ddl.DataSource = dtFRefNo;
        ddl.Items.Clear();
        if (dtFRefNo.Rows.Count > 0)
            ddl.DataSource = dtFRefNo;
        else
        {
            ddl.DataSource = null;
        }

        ddl.DataBind();

        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        ddl.Items.Insert(0, liSelect);
        ddl.AddItemToolTipText_FA();
    }

    protected void FunProLoadFund_Ref_No3(DropDownList ddl, string strFRefNo)
    {
        if (ViewState["DT_FRefNo"] != null)
            dtFRefNo = (DataTable)ViewState["DT_FRefNo"];
        else
        {
            dtFRefNo = new DataTable();
            dtFRefNo.Columns.Add("id");
            dtFRefNo.Columns.Add("Fund_Ref_No1");
            dtFRefNo.Columns.Add("Fund_Ref_No");
            //dtFRefNo.Columns.Add("Due");

        }


        if (strFRefNo != null)
        {
            DataRow dr = dtFRefNo.NewRow();
            dr["id"] = dtFRefNo.Rows.Count;
            dr["Fund_Ref_No1"] = strFRefNo;
            dr["Fund_Ref_No"] = strFRefNo;
            //dr["Due"] = strDue;
            dtFRefNo.Rows.Add(dr);

            ViewState["DT_FRefNo"] = dtFRefNo;
        }

        //if(ViewState["DT_Receiving"]!=null 
        //dtReceiving = (DataTable)ViewState["DT_Receiving"];
        ddl.DataValueField = "Fund_Ref_No1";
        ddl.DataTextField = "Fund_Ref_No";
        //ddl.DataSource = dtFRefNo;
        ddl.Items.Clear();
        if (dtFRefNo.Rows.Count > 0)
            ddl.DataSource = dtFRefNo;
        else
        {
            ddl.DataSource = null;
        }

        ddl.DataBind();

        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        ddl.Items.Insert(0, liSelect);
        ddl.AddItemToolTipText_FA();
    }

    protected void FunProLoadFund_Ref_No2(DropDownList ddl)
    {
        if (ViewState["DT_Receiving"] != null)
            dtReceiving = (DataTable)ViewState["DT_Receiving"];
        ddl.DataValueField = "Fund_Ref_No";
        ddl.DataTextField = "Fund_Ref_No";
        if (dtReceiving.Rows[0]["Serial_Number"].ToString() == "0")
            ddl.DataSource = null;
        else
            ddl.DataSource = dtReceiving;
        ddl.DataBind();
        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        ddl.Items.Insert(0, liSelect);
        ddl.AddItemToolTipText_FA();
    }

    protected void gvBorrowerRepay_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label lblRefNo = gvBorrowerRepay.Rows[e.RowIndex].FindControl("lblRefNo") as Label;
            TextBox txtRepayDate = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtRepayDate") as TextBox;
            TextBox txtRepayAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtRepayAmount") as TextBox;
            HiddenField hdnSlno = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdnSlno") as HiddenField;
            HiddenField hdnRepayAmt = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdnRepayAmt") as HiddenField;
            //HiddenField hdn_TranID = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdn_TranID") as HiddenField;
            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.Rows[e.RowIndex].FindControl("ddlFund_Ref_No") as DropDownList;

            Label lblHedgeNo = gvBorrowerRepay.Rows[e.RowIndex].FindControl("lblHedgeNo") as Label;
            TextBox txtHedgeAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtHedgeAmount") as TextBox;

            LstRepay.Add(e.RowIndex.ToString());
            LstRepay.Add(hdnSlno.Value);
            LstRepay.Add(txtRepayDate.Text.Trim());
            LstRepay.Add(txtRepayAmount.Text.Trim());
            //LstRepay.Add(ddlFund_Ref_No.SelectedValue);
            LstRepay.Add(ddlTrancheRefNo.SelectedItem.Text);

            LstRepay.Add(lblHedgeNo.Text);
            LstRepay.Add(txtHedgeAmount.Text);

            decimal DueAmt = 0, Fund_Ref_RepayAmt = 0, tot = 0;
            string DueDate = "";

            if (!Is_Valid_Fund_Ref_No_Receiving(ddlTrancheRefNo.SelectedItem.Text, out DueDate, out DueAmt, out Fund_Ref_RepayAmt))
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter Valid Fund Reference Number ");
                return;
            }
              //if (!string.IsNullOrEmpty(DueDate))
              //{
              //    if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), DueDate) >= 0)
              //    {
              //        Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should be greater than Due Date");
              //        txtRepayDate.Focus();
              //        return;
              //    }
              //}

            DateTime dt;
            dt = Utility_FA.StringToDate(txtFundTransDate.Text.Trim());
            dt = dt.AddMonths(Convert.ToInt32(txtTenure.Text.Trim()));

            //if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), dt.ToString(strDateFormat)) == -1)
            if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), txtValidUpto.Text.Trim()) == -1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date Should be within the Tenure");
                txtRepayDate.Focus();
                return;
            }

            if (!string.IsNullOrEmpty(txtRepayDate.Text))
            {
                DateTime dtHolidate;
                dtHolidate = FunCheckIs_Holiday(Utility_FA.StringToDate(txtRepayDate.Text));
                if (dtHolidate != Utility_FA.StringToDate(txtRepayDate.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should not in Holiday/Leave date.");
                    txtRepayDate.Focus();
                    return;
                }
            }

            Fund_Ref_RepayAmt = Fund_Ref_RepayAmt - Convert.ToDecimal(hdnRepayAmt.Value) + Convert.ToDecimal(txtRepayAmount.Text);

            if (Fund_Ref_RepayAmt > DueAmt)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Amount cannot be greater than Received Amount");
                txtRepayAmount.Focus();
                return;
            }
            else
                FunPriUpdateDataTableRepay(LstRepay);

            Label lblTotRepay = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;
            ViewState["RepayTotal"] = Convert.ToDecimal(ViewState["RepayTotal"]) - Convert.ToDecimal(hdnRepayAmt.Value) + Convert.ToDecimal(txtRepayAmount.Text);
            lblTotRepay.Text = ViewState["RepayTotal"].ToString();

            gvBorrowerRepay.EditIndex = -1;
            FunPriFillGridRepay();
            gvBorrowerRepay.FooterRow.Enabled = true;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    private void FunPriSetTotalRepayAmount()
    {
        try
        {
            decimal decRepayAmount = 0;

            foreach (GridViewRow grv in gvBorrowerRepay.Rows)
            {
                Label lblRepayAmount = (Label)grv.FindControl("lblRepayAmount");
                if (lblRepayAmount != null)
                {
                    if (!string.IsNullOrEmpty(lblRepayAmount.Text))
                    {
                        decRepayAmount += Convert.ToDecimal(lblRepayAmount.Text);
                    }
                }
            }

            if (gvBorrowerRepay.FooterRow != null)
            {
                Label lblTotDue = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;
                if (lblTotDue != null)
                    ViewState["RepayTotal"] = lblTotDue.Text = decRepayAmount.ToString();

            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private DataTable FunPriRepayDataTable()
    {
        try
        {
            DataRow drEmptyRow;
            if (ViewState["DT_Repay"] == null)
            {
                dtRepay = new DataTable();
                dtRepay.Columns.Add("Serial_Number");
                dtRepay.Columns.Add("Funder_Tran_DTL1_ID");
                dtRepay.Columns.Add("Fund_Ref_No");
                dtRepay.Columns.Add("Repay_Date");
                dtRepay.Columns.Add("Repay_Amount");
                dtRepay.Columns.Add("JV_No");
                dtRepay.Columns.Add("Hedge_No");
                dtRepay.Columns.Add("Hedge_Amount");
                dtRepay.Columns.Add("Interest_Date");
                dtRepay.Columns.Add("Interest_Amount");
                //dtRepay.Columns.Add("Is_Active");
                dtRepay.Columns.Add("New_Old");
                dtRepay.Columns.Add("Changed");
                ViewState["DT_Repay"] = dtRepay;
            }
            dtRepay = (DataTable)ViewState["DT_Repay"];
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return dtRepay;
    }

    private void FunPriInsertRepay(List<string> Lst)
    {
        try
        {
            DataRow drEmptyRow;
            dtRepay = FunPriRepayDataTable();
            if (dtRepay.Rows.Count < 1)
            {
                drEmptyRow = dtRepay.NewRow();
                drEmptyRow["Serial_Number"] = "0";
                drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
                drEmptyRow["Fund_Ref_No"] = "0";
                drEmptyRow["Repay_Date"] = "0";
                drEmptyRow["Repay_Amount"] = 0;
                drEmptyRow["Hedge_No"] = "0";
                drEmptyRow["Hedge_Amount"] = 0;
                drEmptyRow["Interest_Date"] = 0;
                drEmptyRow["Interest_Amount"] = 0;
                drEmptyRow["New_Old"] = "N";
                drEmptyRow["Changed"] = "Y";
                dtRepay.Rows.Add(drEmptyRow);
            }
            else
            {
                drEmptyRow = dtRepay.NewRow();
                drEmptyRow["Serial_Number"] = Convert.ToInt32(dtRepay.Rows[dtRepay.Rows.Count - 1]["Serial_Number"]) + 1;
                drEmptyRow["Funder_Tran_DTL1_ID"] = Lst[0];
                drEmptyRow["Fund_Ref_No"] = Lst[1];
                drEmptyRow["Repay_Date"] = Lst[2];
                drEmptyRow["Repay_Amount"] = Lst[3];
                drEmptyRow["Hedge_No"] = Lst[4];
                drEmptyRow["Hedge_Amount"] = Lst[5];
                drEmptyRow["JV_No"] = "";//Lst[3];
                drEmptyRow["New_Old"] = "N";
                drEmptyRow["Changed"] = "Y";
                dtRepay.Rows.Add(drEmptyRow);
            }
            if (dtRepay.Rows.Count > 1)
            {
                if (dtRepay.Rows[0]["Serial_Number"].ToString() == "0")
                {
                    dtRepay.Rows[0].Delete();
                }
            }
            ViewState["DT_Repay"] = dtRepay;

            FunPubBindRepay(dtRepay);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriUpdateDataTableRepay(List<string> Lst)
    {
        try
        {
            DataTable dtUpdate = (DataTable)ViewState["DT_Repay"];
            if (Convert.ToInt32(dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Serial_Number"]) == Convert.ToInt32(Lst[1]))
            {
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Fund_Ref_No"] = Lst[4];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Repay_Date"] = Lst[2];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Repay_Amount"] = Lst[3];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Hedge_No"] = Lst[5];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Hedge_Amount"] = Lst[6];
                //dtUpdate.Rows[Convert .ToInt32 (Lst[0])]["JV_No"] = Lst[4];
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["New_Old"] = "O";
                dtUpdate.Rows[Convert.ToInt32(Lst[0])]["Changed"] = "Y";
                dtUpdate.AcceptChanges();
                ViewState["DT_Repay"] = dtUpdate;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriFillGridRepay()
    {
        try
        {
            gvBorrowerRepay.DataSource = (DataTable)ViewState["DT_Repay"];
            gvBorrowerRepay.DataBind();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPubBindRepay(DataTable dtWorkflow)
    {
        try
        {
            gvBorrowerRepay.DataSource = dtWorkflow;
            gvBorrowerRepay.DataBind();
            Label lblTot = gvBorrowerRepay.FooterRow.FindControl("lblTot") as Label;
            Label lblTotRepay = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;
            if (dtWorkflow.Rows.Count == 1 && Convert.ToString(dtWorkflow.Rows[0]["Serial_Number"]) == "0")
            {
                gvBorrowerRepay.Rows[0].Visible = false;
                lblTot.Visible = lblTotRepay.Visible = false;
            }
            else
                lblTot.Visible = lblTotRepay.Visible = true;
            gvBorrowerRepay.Visible = true;

            //if (gvBorrowerRepay.FooterRow != null)
            //{
            //    DropDownList ddlHedgeNo = gvBorrowerRepay.FooterRow.FindControl("ddlHedgeNo") as DropDownList;
            //    if (ddlHedgeNo != null)
            //        FunProLoadHedgeRefNo(ddlHedgeNo);
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    */
    #endregion


    #region "New"

    protected void FunProLoadHedgeRefNo(DropDownList ddl)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            //if (ddlFunderCode.SelectedIndex > 0)
            //    Procparam.Add("@ID", ddlFunderCode.SelectedValue);
            Procparam.Add("@Option", "12");
            ddl.BindDataTable_FA("FA_Get_Deal_Fund_Dtls", Procparam, new string[] { "HT_NO", "HT_NO" });
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriSetEmptyRepayTbl()
    {
        try
        {
            DataRow drEmptyRow;
            dtRepay = new DataTable();
            dtRepay.Columns.Add("Serial_Number");
            dtRepay.Columns.Add("Funder_Tran_DTL1_ID");
            dtRepay.Columns.Add("Fund_Ref_No");
            dtRepay.Columns.Add("Repay_Date");
            dtRepay.Columns.Add("Repay_Amount");
            dtRepay.Columns.Add("JV_No");
            dtRepay.Columns.Add("Hedge_No");
            dtRepay.Columns.Add("Hedge_Amount");
            dtRepay.Columns.Add("Interest_Date");
            dtRepay.Columns.Add("Interest_Amount");
            dtRepay.Columns.Add("Sort_Date", typeof(DateTime));
            dtRepay.Columns.Add("Repay_Int");
            dtRepay.Columns.Add("New_Old");
            dtRepay.Columns.Add("Changed");
            drEmptyRow = dtRepay.NewRow();
            drEmptyRow["Serial_Number"] = "0";
            dtRepay.Rows.Add(drEmptyRow);
            ViewState["dtRepay"] = dtRepay;
            FunFillgrid(gvBorrowerRepay, dtRepay);
            gvBorrowerRepay.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {


            if (e.Row.RowType == DataControlRowType.Footer)
            {
                AjaxControlToolkit.CalendarExtender CalRepayDate = e.Row.FindControl("CalRepayDate") as AjaxControlToolkit.CalendarExtender;
                CalRepayDate.Format = strDateFormat;

                //TextBox txtFund_Ref_No = e.Row.FindControl("txtFund_Ref_No") as TextBox;
                //DropDownList ddlFund_Ref_No = e.Row.FindControl("ddlFund_Ref_No") as DropDownList;

                TextBox txtRepayDate = e.Row.FindControl("txtRepayDate") as TextBox;
                TextBox txtRepayAmount = e.Row.FindControl("txtRepayAmount") as TextBox;
                LinkButton lnkAdd = e.Row.FindControl("lnkAdd") as LinkButton;

                //Button btnPopGo = e.Row.FindControl("btnPopGo") as Button;
                TextBox txtHedgeAmount = e.Row.FindControl("txtHedgeAmount") as TextBox;
                DropDownList ddlHedgeNo = e.Row.FindControl("ddlHedgeNo") as DropDownList;

                //FunProLoadFund_Ref_No(ddlFund_Ref_No);

                Label lblTot = e.Row.FindControl("lblTot") as Label;
                Label lblTotRepay = e.Row.FindControl("lblTotRepay") as Label;
                Label lblTotInterest = e.Row.FindControl("lblTotInterest") as Label;
                //if (ViewState["RepayTotal"] != null)
                //    lblTotRepay.Text = ViewState["RepayTotal"].ToString();

                decimal sumRepay = 0, sumInt = 0;
                dtRepay = (DataTable)ViewState["dtRepay"];
                foreach (DataRow drRepayRow in dtRepay.Rows)
                {
                    if (!(string.IsNullOrEmpty(drRepayRow["Repay_Amount"].ToString())))
                        sumRepay += (Convert.ToDecimal(drRepayRow["Repay_Amount"].ToString()));
                    if (!(string.IsNullOrEmpty(drRepayRow["Interest_Amount"].ToString())))
                        sumInt += (Convert.ToDecimal(drRepayRow["Interest_Amount"].ToString()));
                }

                lblTotRepay.Text = sumRepay.ToString();
                lblTotInterest.Text = sumInt.ToString();

                if (strMode == "Q")
                    ddlHedgeNo.Visible = txtHedgeAmount.Visible = txtRepayDate.Visible = txtRepayAmount.Visible = lnkAdd.Visible = false;
                else if (strMode == "M")
                {
                    if (ViewState["Auth_Stat"] != null)
                        if (ViewState["Auth_Stat"].ToString() != "N")
                            ddlHedgeNo.Visible = txtHedgeAmount.Visible = txtRepayDate.Visible = txtRepayAmount.Visible = lnkAdd.Visible = false;
                }
                txtRepayAmount.SetDecimalPrefixSuffix_FA(12, 0, true, "Repay Amount");
                // txtRepayDate.Attributes.Add("Readonly", "true");
                txtRepayDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRepayDate.ClientID + "','" + strDateFormat + "',false,  false);");

                ddlHedgeNo.Enabled = true; txtHedgeAmount.ReadOnly = false;
                //To disable hedge button for indian currency
                if (ViewState["Currency_Code"] == null)
                {
                    ddlHedgeNo.Enabled = false;
                    //btnPopGo.Enabled = false;
                    txtHedgeAmount.ReadOnly = true;
                }
                else
                    FunProLoadHedgeRefNo(ddlHedgeNo);
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lnkEdit = e.Row.FindControl("lnkEdit") as LinkButton;
                LinkButton lnkRemove = e.Row.FindControl("lnkRemove") as LinkButton;
                Label lblRepay_Int = e.Row.FindControl("lblRepay_Int") as Label;


                AjaxControlToolkit.CalendarExtender CalRepayDate = e.Row.FindControl("CalRepayDate") as AjaxControlToolkit.CalendarExtender;
                if (CalRepayDate != null)
                    CalRepayDate.Format = strDateFormat;
                Label lblJVNo = e.Row.FindControl("lblJVNo") as Label;
                if (!string.IsNullOrEmpty(lblJVNo.Text.Trim()))
                    lnkRemove.Visible = lnkEdit.Visible = false;

                TextBox txtRepayDate = e.Row.FindControl("txtRepayDate") as TextBox;
                if (txtRepayDate != null)
                    //txtRepayDate.Attributes.Add("Readonly", "true");
                    txtRepayDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRepayDate.ClientID + "','" + strDateFormat + "',false,  false);");

                //if (strMode == "Q")
                //{
                //    lnkEdit.Enabled = lnkRemove.Enabled = false;
                //}
                //else if (strMode == "M")
                //{
                //    if (ViewState["Auth_Stat"] != null)
                //        if (ViewState["Auth_Stat"].ToString() != "N")
                //            lnkEdit.Enabled = lnkRemove.Enabled = false;
                //}
                //for Interest schedule cannot delete manually
                if (!string.IsNullOrEmpty(lblRepay_Int.Text))
                {
                    if (lblRepay_Int.Text == "I")
                    {
                        lnkRemove.Enabled = false;
                        //To disable hedge button for indian currency
                        if (ViewState["Currency_Code"] == null)
                        {
                            lnkEdit.Enabled = false;
                        }
                    }
                }
            }
            //FunPricalcSumAmount();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            cvFunderTransaction.ErrorMessage = Resources.ErrorHandlingAndValidation._1436;
            cvFunderTransaction.IsValid = false;
        }
    }

    protected void gvBorrowerRepay_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                TextBox txtRepayDate = gvBorrowerRepay.FooterRow.FindControl("txtRepayDate") as TextBox;
                TextBox txtRepayAmount = gvBorrowerRepay.FooterRow.FindControl("txtRepayAmount") as TextBox;
                DropDownList ddlHedgeNo = gvBorrowerRepay.FooterRow.FindControl("ddlHedgeNo") as DropDownList;
                TextBox txtHedgeAmount = gvBorrowerRepay.FooterRow.FindControl("txtHedgeAmount") as TextBox;
                Label lblTotRepay = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;

                decimal decTotRepay = 0;
                DataRow drEmptyRow;


                if (!string.IsNullOrEmpty(txtRepayDate.Text))
                {
                    DateTime dtHolidate;
                    dtHolidate = FunCheckIs_Holiday(Utility_FA.StringToDate(txtRepayDate.Text));
                    if (dtHolidate != Utility_FA.StringToDate(txtRepayDate.Text))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should not in Holiday/Leave date.");
                        txtRepayDate.Focus();
                        return;
                    }
                }

                if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), txtValidUpto.Text.Trim()) == -1)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date Should be within the Tenure");
                    txtRepayDate.Focus();
                    return;
                }





                int intserialCount = 0;

                dtRepay = (DataTable)ViewState["dtRepay"];

                if (dtRepay.Rows.Count == 1)
                {
                    if (Convert.ToInt32(dtRepay.Rows[0]["Serial_Number"]) == 0)
                        dtRepay.Rows[0].Delete();
                }

                if (dtRepay.Rows.Count > 0)
                    intserialCount = Convert.ToInt32(dtRepay.Rows[dtRepay.Rows.Count - 1]["Serial_Number"]);


                drEmptyRow = dtRepay.NewRow();
                drEmptyRow["Serial_Number"] = intserialCount + 1;
                drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
                drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedValue;
                drEmptyRow["Repay_Date"] = txtRepayDate.Text;
                drEmptyRow["Sort_Date"] = Utility_FA.StringToDate(txtRepayDate.Text);
                drEmptyRow["Repay_Int"] = "R";
                drEmptyRow["Repay_Amount"] = txtRepayAmount.Text;
                //drEmptyRow["JV_No"]=;
                if (ddlHedgeNo.SelectedIndex > 0)
                    drEmptyRow["Hedge_No"] = ddlHedgeNo.SelectedValue;
                if (!string.IsNullOrEmpty(txtHedgeAmount.Text))
                    drEmptyRow["Hedge_Amount"] = txtHedgeAmount.Text;
                //drEmptyRow["Interest_Date"]=;
                //drEmptyRow["Interest_Amount"]=;
                drEmptyRow["New_Old"] = "Y";
                drEmptyRow["Changed"] = "N";

                dtRepay.Rows.Add(drEmptyRow);
                ViewState["dtRepay"] = dtRepay;
                FunFillgrid(gvBorrowerRepay, dtRepay);










                /*
                 Fund_Ref_RepayAmt = Fund_Ref_RepayAmt + Convert.ToDecimal(txtRepayAmount.Text);

                 * if (Fund_Ref_RepayAmt > DueAmt)
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Amount cannot be greater than Received Amount");
                    txtRepayAmount.Focus();
                    return;
                }
                else
                {
                    ViewState["RepayTotal"] = decTotRepay;
                    lblTotRepay.Text = Convert.ToString(decTotRepay);

                    FunPriInsertRepay(LstRepay);
                }*/
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {

            dtRepay = (DataTable)ViewState["dtRepay"];
            dtRepay.Rows.RemoveAt(e.RowIndex);
            if (dtRepay.Rows.Count == 0)
            {
                FunPriSetEmptyRepayTbl();
            }
            else
            {
                FunFillgrid(gvBorrowerRepay, dtRepay);
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvBorrowerRepay.EditIndex = -1;
            dtRepay = (DataTable)ViewState["dtRepay"];
            FunFillgrid(gvBorrowerRepay, dtRepay);
            gvBorrowerRepay.FooterRow.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label lblRefNo = gvBorrowerRepay.Rows[e.RowIndex].FindControl("lblRefNo") as Label;
            TextBox txtRepayDate = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtRepayDate") as TextBox;
            TextBox txtRepayAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtRepayAmount") as TextBox;
            HiddenField hdnSlno = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdnSlno") as HiddenField;
            HiddenField hdnRepayAmt = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdnRepayAmt") as HiddenField;
            DropDownList ddlHedgeNo = gvBorrowerRepay.Rows[e.RowIndex].FindControl("ddlHedgeNo") as DropDownList;
            TextBox txtHedgeAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtHedgeAmount") as TextBox;
            //HiddenField hdn_TranID = gvBorrowerRepay.Rows[e.RowIndex].FindControl("hdn_TranID") as HiddenField;
            //DropDownList ddlFund_Ref_No = gvBorrowerRepay.Rows[e.RowIndex].FindControl("ddlFund_Ref_No") as DropDownList;

            //Label lblHedgeNo = gvBorrowerRepay.Rows[e.RowIndex].FindControl("lblHedgeNo") as Label;
            //TextBox txtHedgeAmount = gvBorrowerRepay.Rows[e.RowIndex].FindControl("txtHedgeAmount") as TextBox;


            decimal DueAmt = 0, Fund_Ref_RepayAmt = 0, tot = 0;
            string DueDate = "";



            if (Utility_FA.CompareDates(txtRepayDate.Text.Trim(), txtValidUpto.Text.Trim()) == -1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date Should be within the Tenure");
                txtRepayDate.Focus();
                return;
            }

            if (!string.IsNullOrEmpty(txtRepayDate.Text))
            {
                DateTime dtHolidate;
                dtHolidate = FunCheckIs_Holiday(Utility_FA.StringToDate(txtRepayDate.Text));
                if (dtHolidate != Utility_FA.StringToDate(txtRepayDate.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Date should not in Holiday/Leave date.");
                    txtRepayDate.Focus();
                    return;
                }
            }

            /*  Fund_Ref_RepayAmt = Fund_Ref_RepayAmt - Convert.ToDecimal(hdnRepayAmt.Value) + Convert.ToDecimal(txtRepayAmount.Text);

              if (Fund_Ref_RepayAmt > DueAmt)
              {
                  Utility_FA.FunShowAlertMsg_FA(this.Page, "Repay Amount cannot be greater than Received Amount");
                  txtRepayAmount.Focus();
                  return;
              }
              else
                  FunPriUpdateDataTableRepay(LstRepay);
              */
            dtRepay = (DataTable)ViewState["dtRepay"];
            if (!string.IsNullOrEmpty(txtRepayDate.Text))
            {
                dtRepay.Rows[e.RowIndex]["Repay_Date"] = txtRepayDate.Text;
                dtRepay.Rows[e.RowIndex]["Sort_Date"] = Utility_FA.StringToDate(txtRepayDate.Text);
            }
            if (!string.IsNullOrEmpty(txtRepayAmount.Text))
            {
                dtRepay.Rows[e.RowIndex]["Repay_Amount"] = txtRepayAmount.Text;
            }
            //dtRepay.Rows[e.RowIndex]["Repay_Int"] = "R";
            if (ddlHedgeNo.SelectedIndex > 0)
                dtRepay.Rows[e.RowIndex]["Hedge_No"] = ddlHedgeNo.SelectedValue;
            if (!string.IsNullOrEmpty(txtHedgeAmount.Text))
                dtRepay.Rows[e.RowIndex]["Hedge_Amount"] = txtHedgeAmount.Text;
            dtRepay.AcceptChanges();


            //Label lblTotRepay = gvBorrowerRepay.FooterRow.FindControl("lblTotRepay") as Label;
            //ViewState["RepayTotal"] = Convert.ToDecimal(ViewState["RepayTotal"]) - Convert.ToDecimal(hdnRepayAmt.Value) + Convert.ToDecimal(txtRepayAmount.Text);
            //lblTotRepay.Text = ViewState["RepayTotal"].ToString();

            gvBorrowerRepay.EditIndex = -1;

            ViewState["dtRepay"] = dtRepay;
            FunFillgrid(gvBorrowerRepay, dtRepay);


            gvBorrowerRepay.FooterRow.Visible = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void gvBorrowerRepay_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvBorrowerRepay.EditIndex = e.NewEditIndex;
            dtRepay = (DataTable)ViewState["dtRepay"];
            FunFillgrid(gvBorrowerRepay, dtRepay);
            ((TextBox)gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtRepayAmount")).SetDecimalPrefixSuffix_FA(12, 0, true, "Repay Amount");
            DropDownList ddlHedgeNo = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("ddlHedgeNo") as DropDownList;
            Label lblRepay_Int = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("lblRepay_Int") as Label;
            RequiredFieldValidator rfvRepayDate = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("rfvRepayDate") as RequiredFieldValidator;
            RequiredFieldValidator rfvRepayAmount = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("rfvRepayAmount") as RequiredFieldValidator;
            Label lblHedgeNo = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("lblHedgeNo") as Label;

            TextBox txtRepayAmount = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtRepayAmount") as TextBox;
            TextBox txtRepayDate = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtRepayDate") as TextBox;
            AjaxControlToolkit.CalendarExtender CalRepayDate = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("CalRepayDate") as AjaxControlToolkit.CalendarExtender;
            //Button btnPopGo = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("btnPopGo") as Button;
            TextBox txtHedgeAmount = gvBorrowerRepay.Rows[e.NewEditIndex].FindControl("txtHedgeAmount") as TextBox;
            //To disable hedge button for indian currency
            ddlHedgeNo.Enabled = true; txtHedgeAmount.ReadOnly = false;
            if (ViewState["Currency_Code"] == null)
            {
                ddlHedgeNo.Enabled = false;
                txtHedgeAmount.ReadOnly = true;
            }
            else
            {
                FunProLoadHedgeRefNo(ddlHedgeNo);
                if (!string.IsNullOrEmpty(lblHedgeNo.Text))
                    ddlHedgeNo.SelectedValue = lblHedgeNo.Text;
            }
            gvBorrowerRepay.FooterRow.Visible = false;


            //for Interest schedule cannot say mandatory for repay date and amount 
            if (!string.IsNullOrEmpty(lblRepay_Int.Text))
            {
                if (lblRepay_Int.Text == "I")
                {
                    txtRepayAmount.Enabled = txtRepayDate.Enabled = CalRepayDate.Enabled =
                    rfvRepayDate.Enabled =
                    rfvRepayAmount.Enabled = false;
                }
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    #endregion


    #region "Schedule and moratorium"

    private bool IsEndOfMonth(DateTime date)
    {
        return date.AddDays(1).Day == 1;
    }

    private void FunGetHolidayDates(string Location_Code)
    {
        if (!string.IsNullOrEmpty(Location_Code))
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@Value", Location_Code);
            Procparam.Add("@Id", ddlLocation.SelectedValue);
            Procparam.Add("@Option", "7");
            dtHoliday = Utility_FA.GetDefaultData("FA_Get_Deal_Fund_Dtls", Procparam);
            ViewState["dtHoliday"] = null;
            if (dtHoliday.Rows.Count > 0)
            {
                ViewState["dtHoliday"] = dtHoliday;
            }
        }

    }

    protected void btnGoInt_Click(object sender, EventArgs e)
    {
        try
        {
            dtRepay = (DataTable)ViewState["dtRepay"];

            DataRow[] drr = dtRepay.Select("Repay_int='I'");

            foreach (DataRow dr in drr)
                dtRepay.Rows.Remove(dr);



            ViewState["dtInterest"] = dtInterest = FunGenerateInterestSchdule();

            if (dtInterest.Rows.Count > 0)
            {
                foreach (DataRow drInterest in dtInterest.Rows)
                {
                    DataRow drRepay;
                    drRepay = dtRepay.NewRow();
                    drRepay["Repay_Int"] = "I";
                    drRepay["Interest_Date"] = drInterest["Due_Date"].ToString();
                    drRepay["Interest_Amount"] = drInterest["Due_Amount"].ToString();
                    drRepay["Sort_Date"] = Utility_FA.StringToDate(drInterest["Due_Date"].ToString());
                    dtRepay.Rows.Add(drRepay);
                }
            }
            DataView dv = dtRepay.DefaultView;
            dv.Sort = "Sort_Date ASC";
            DataTable sortedDT = dv.ToTable();

            ViewState["dtRepay"] = sortedDT;



            FunFillgrid(gvBorrowerRepay, sortedDT);


            FunCalculateIRR();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            CustomValidator1.ErrorMessage = ex.Message;
            CustomValidator1.IsValid = false;
        }
    }

    public DateTime FunPubIntDate(DateTime dtFromDate, int intAddno, string strfreq)
    {
        DateTime dtToDate;
        switch (strfreq)
        {
            //daily
            case "1":
                dtToDate = dtFromDate.AddDays(1 * intAddno);
                break;
            //Monthly
            case "2":
                dtToDate = dtFromDate.AddMonths(1 * intAddno);
                break;
            //bi monthly
            case "3":
                dtToDate = dtFromDate.AddMonths(2 * intAddno);
                break;
            //quarterly
            case "4":
                dtToDate = dtFromDate.AddMonths(3 * intAddno);
                break;
            // half yearly
            case "5":
                dtToDate = dtFromDate.AddMonths(6 * intAddno);
                break;
            //annually
            case "6":
                dtToDate = dtFromDate.AddYears(1 * intAddno);
                break;
            default:
                dtToDate = dtFromDate.AddMonths(1 * intAddno);
                break;
        }
        return Utility_FA.StringToDate(dtToDate.ToString());
    }




    protected void btnGoB_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtInterestCalcdate.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Calculation date in Funder Details Tab");
                return;
            }
            if (txtInterestLevy.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Pay date in Funder Details Tab");
                return;
            }
            if (txtTenure.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Enter the Tenure in Funder Details Tab");
                return;
            }
            if (ddlTenureType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Tenure Type in Funder Details Tab");
                return;
            }
            if (txtTenure.Text == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Enter the Tenure in Funder Details Tab");
                return;
            }
            if (ddlInterestCalc.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Calculation Type in Funder Details Tab");
                return;
            }
            if (ddlInterestLevy.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Interest Pay in Funder Details Tab");
                return;
            }
            if (txtInterestLevy.Text == "0")
            {
                Utility.FunShowAlertMsg(this, "Enter the Interest Pay Date in Funder Details Tab");
                return;
            }

            if (ddlOutflowType.SelectedValue == "1")//Equated Installments
            {

                ViewState["dtRepay"] = dtRepay = FunGenerateRepaymentStructure();
                ViewState["dtInterest"] = dtInterest = FunGenerateInterestSchdule();



                if (dtInterest.Rows.Count > 0)
                {
                    foreach (DataRow drInterest in dtInterest.Rows)
                    {
                        DataRow drRepay;
                        drRepay = dtRepay.NewRow();
                        drRepay["Repay_Int"] = "I";
                        drRepay["Interest_Date"] = drInterest["Due_Date"].ToString();
                        drRepay["Interest_Amount"] = drInterest["Due_Amount"].ToString();
                        drRepay["Sort_Date"] = Utility_FA.StringToDate(drInterest["Due_Date"].ToString());
                        dtRepay.Rows.Add(drRepay);
                    }
                }
                DataView dv = dtRepay.DefaultView;
                dv.Sort = "Sort_Date ASC";
                DataTable sortedDT = dv.ToTable();

                ViewState["dtRepay"] = sortedDT;

                FunFillgrid(gvBorrowerRepay, sortedDT);
                FunCalculateIRR();

            }
            else if (ddlOutflowType.SelectedValue == "2")//Manual
            {
                FunPriSetEmptyRepayTbl();
            }


        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            CustomValidator1.ErrorMessage = objException.Message;
            CustomValidator1.IsValid = false;
        }
    }


    private DataTable FunGenerateRepaymentStructure()
    {
        int intslno = 1;
        decimal decFacilityAmt = 0;
        decimal decTempFacilityAmt = 0; decimal decSumFacilityAmt = 0;
        DateTime dtstartdate = new DateTime();
        DateTime dtEnddate = new DateTime();
        DateTime dttempdate = new DateTime();
        DateTime dtHolidate = new DateTime();
        DateTime dtlastdate = new DateTime();

        //str

        dtstartdate = Utility_FA.StringToDate(txtRepayDate.Text);
        dtEnddate = Utility_FA.StringToDate(txtValidUpto.Text);
        DataTable dtRepay = (DataTable)ViewState["dtRepay"];

        decFacilityAmt = decTempFacilityAmt = Convert.ToDecimal(txtTransactionAmt.Text);


        if (ViewState["Fund_Nature"] != null)
        {
            if (ViewState["Fund_Nature"].ToString() == "8")
            {
                decFacilityAmt = decTempFacilityAmt = FunPriGetFacilityAmount(decFacilityAmt);
            }
        }


        //to handle Maturity date start
        if (ddlRepaymentType.SelectedValue == "7")//on maturity
        {
            dtRepay.Rows.Clear();
            DataRow drEmptyRow;
            drEmptyRow = dtRepay.NewRow();
            drEmptyRow["Serial_Number"] = intslno.ToString();
            drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
            drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
            drEmptyRow["Repay_Amount"] = decFacilityAmt;
            if (dttempdate != null)
            {
                dtHolidate = FunCheckIs_Holiday(dttempdate);
                drEmptyRow["Repay_Date"] = txtValidUpto.Text;
                drEmptyRow["Sort_Date"] = Utility_FA.StringToDate(txtValidUpto.Text);
            }
            drEmptyRow["Repay_Int"] = "R";
            drEmptyRow["New_Old"] = "N";
            drEmptyRow["Changed"] = "Y";
            dtRepay.Rows.Add(drEmptyRow);
            return dtRepay;
        }





        dttempdate = dtstartdate;//Advance

        if (ddlRepayPattern.SelectedValue == "2")//Arrears
        {
            dttempdate = FunPubGetNextDate(ddlRepaymentType.SelectedValue, dtstartdate);
        }

        bool IsEOM = false;
        if (IsEndOfMonth(dtstartdate))
        {
            IsEOM = true;
        }
        if (ViewState["dtRepay"] != null)
            dtRepay = (DataTable)ViewState["dtRepay"];
        dtRepay.Rows.Clear();
        while (dttempdate <= dtEnddate)
        {
            if (!Is_Morotorium(dttempdate))
            {
                DataRow drEmptyRow;
                drEmptyRow = dtRepay.NewRow();
                drEmptyRow["Serial_Number"] = intslno.ToString();
                drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
                drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
                //drEmptyRow["Fund_Rate"] = txtTotalRate.Text;

                if (dttempdate != null)
                {
                    dtHolidate = FunCheckIs_Holiday(dttempdate);
                    drEmptyRow["Repay_Date"] = dtHolidate.ToString(strDateFormat);
                    drEmptyRow["Sort_Date"] = Utility_FA.StringToDate(dtHolidate.ToString(strDateFormat));
                }
                drEmptyRow["Repay_Int"] = "R";
                drEmptyRow["New_Old"] = "N";
                drEmptyRow["Changed"] = "Y";
                dtRepay.Rows.Add(drEmptyRow);
                decTempFacilityAmt = Math.Floor(decTempFacilityAmt - decSumFacilityAmt);
                intslno++;
            }

            dttempdate = FunPubGetNextDate(ddlRepaymentType.SelectedValue, dttempdate);
            //if End of month then all date should be EOM
            if (IsEOM)
            {
                DateTime endOfMon = new DateTime(dttempdate.Year, dttempdate.Month, DateTime.DaysInMonth(dttempdate.Year, dttempdate.Month));
                dttempdate = Utility_FA.StringToDate(endOfMon.ToString());
            }

        }


        if (dtRepay.Rows.Count > 0)
        {
            //To add maturity date START
            if (!string.IsNullOrEmpty(dtRepay.Rows[intslno - 2]["Repay_Date"].ToString()))
            {
                dtlastdate = Utility_FA.StringToDate(dtRepay.Rows[intslno - 2]["Repay_Date"].ToString());
            }
        }
        if (Utility_FA.CompareDates(dtlastdate.ToString(), dtEnddate.ToString()) != 0)
        {
            DataRow drEmptyRow;
            drEmptyRow = dtRepay.NewRow();
            drEmptyRow["Serial_Number"] = intslno.ToString();
            drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
            drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
            //drEmptyRow["Fund_Rate"] = txtTotalRate.Text;
            if (dttempdate != null)
            {
                dtHolidate = FunCheckIs_Holiday(dtEnddate);
                drEmptyRow["Repay_Date"] = dtEnddate.ToString(strDateFormat);
                drEmptyRow["Sort_Date"] = Utility_FA.StringToDate(dtEnddate.ToString(strDateFormat));
            }
            drEmptyRow["Repay_Int"] = "R";
            drEmptyRow["New_Old"] = "N";
            drEmptyRow["Changed"] = "Y";
            dtRepay.Rows.Add(drEmptyRow);
            decTempFacilityAmt = Math.Floor(decTempFacilityAmt - decSumFacilityAmt);
            intslno++;

        }
        //To add maturity date END
        decimal decTotAmt = 0;
        decSumFacilityAmt = Math.Round(decFacilityAmt / (dtRepay.Rows.Count), 3);
        foreach (DataRow dr in dtRepay.Rows)
        {
            dr["Repay_Amount"] = decSumFacilityAmt;
            //dr["Hedge_Amount"] = decSumFacilityAmt;
            decTotAmt = decTotAmt + decSumFacilityAmt;
        }
        if (decTotAmt < decFacilityAmt)
        {
            dtRepay.Rows[dtRepay.Rows.Count - 1]["Repay_Amount"] = Math.Floor(Convert.ToDecimal(dtRepay.Rows[dtRepay.Rows.Count - 1]["Repay_Amount"]) + (decFacilityAmt - decTotAmt));
            //dtRepay.Rows[dtRepay.Rows.Count - 1]["Hedge_Amount"] = Math.Floor(Convert.ToDecimal(dtRepay.Rows[dtRepay.Rows.Count - 1]["Hedge_Amount"]) + (decFacilityAmt - decTotAmt));
        }

        //FunGenerateMoratorium();

        //FunPubBindRepay(dtRepay);
        //ViewState["DT_Repay"] = dtRepay;
        //}
        //else
        //{
        //    //Maturity date entry start//for 0 repayment
        //    DataRow drEmptyRow;
        //    drEmptyRow = dtRepay.NewRow();
        //    drEmptyRow["Serial_Number"] = intslno.ToString();
        //    drEmptyRow["Funder_Tran_DTL1_ID"] = "0";
        //    drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
        //    //drEmptyRow["Fund_Rate"] = txtTotalRate.Text;
        //    if (dttempdate != null)
        //    {
        //        dtHolidate = FunCheckIs_Holiday(dtEnddate);
        //        drEmptyRow["Repay_Date"] = dtEnddate.ToString(strDateFormat);
        //        drEmptyRow["Sort_Date"] = Utility_FA.StringToDate(dtEnddate.ToString(strDateFormat));
        //    }
        //    drEmptyRow["Repay_Int"] = "R";
        //    drEmptyRow["New_Old"] = "N";
        //    drEmptyRow["Changed"] = "Y";
        //    dtRepay.Rows.Add(drEmptyRow);
        //    decTempFacilityAmt = Math.Floor(decTempFacilityAmt - decSumFacilityAmt);
        //    intslno++;
        //    //Maturity date entry end//for 0 repayment
        //    decimal decTotAmt = 0;
        //    decSumFacilityAmt = Math.Floor(decFacilityAmt / (dtRepay.Rows.Count));
        //    foreach (DataRow dr in dtRepay.Rows)
        //    {
        //        dr["Repay_Amount"] = decSumFacilityAmt;
        //        //dr["Hedge_Amount"] = decSumFacilityAmt;
        //        decTotAmt = decTotAmt + decSumFacilityAmt;
        //    }
        //    if (decTotAmt < decFacilityAmt)
        //    {
        //        dtRepay.Rows[dtRepay.Rows.Count - 1]["Repay_Amount"] = Math.Floor(Convert.ToDecimal(dtRepay.Rows[dtRepay.Rows.Count - 1]["Repay_Amount"]) + (decFacilityAmt - decTotAmt));
        //        //dtRepay.Rows[dtRepay.Rows.Count - 1]["Hedge_Amount"] = Math.Floor(Convert.ToDecimal(dtRepay.Rows[dtRepay.Rows.Count - 1]["Hedge_Amount"]) + (decFacilityAmt - decTotAmt));
        //    }
        //}
        return dtRepay;
    }

    private decimal FunPriGetFacilityAmount(decimal decFacilityAmt)
    {
        decimal decRate = 0;
        if (!string.IsNullOrEmpty(txtTotalRate.Text))
            decRate = Convert.ToDecimal(txtTotalRate.Text);
        int inttenure = 0;
        if (!string.IsNullOrEmpty(txtTenure.Text))
            inttenure = Convert.ToInt32(txtTenure.Text);

        if (ViewState["DiscAmount"] != null)
        {
            if (!string.IsNullOrEmpty(ViewState["DiscAmount"].ToString()))
                decFacilityAmt = decFacilityAmt - Convert.ToDecimal(ViewState["DiscAmount"].ToString());
            else
            {
                switch (ddlTenureType.SelectedValue)
                {
                    case "1"://Years
                        decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate / 100);
                        break;
                    case "2"://Months
                        decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate * inttenure / 1200);
                        break;
                    case "3"://Days
                        decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate * inttenure / 36500);//Take from GPS
                        break;
                }
            }
        }
        else
        {
            switch (ddlTenureType.SelectedValue)
            {
                case "1"://Years
                    decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate / 100);
                    break;
                case "2"://Months
                    decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate * inttenure / 1200);
                    break;
                case "3"://Days
                    decFacilityAmt = decFacilityAmt - decFacilityAmt * (decRate * inttenure / 36500);
                    break;
            }

        }
        return Math.Round(decFacilityAmt);
    }

    private DataTable FunGenerateInterestSchdule()
    {
        DateTime dtstartdate = new DateTime();
        DateTime dtEnddate = new DateTime();
        DateTime dttempdate = new DateTime();
        DateTime dtHolidate = new DateTime();
        DateTime dtlastdate = new DateTime();
        DateTime dtFromdate = new DateTime();

        dtEnddate = Utility_FA.StringToDate(txtValidUpto.Text);
        dtInterest = (DataTable)ViewState["dtInterest"];
        dtInterest.Rows.Clear();

        if (ViewState["Fund_Nature"] != null)
        {
            if (ViewState["Fund_Nature"].ToString() == "4")
                return dtInterest;
        }



        int intslno = 1;

        if (ddlInterestCalc.SelectedValue == "7")//Sync Principal
            dtstartdate = Utility_FA.StringToDate(txtRepayDate.Text);//repayment date
        else if (ddlInterestCalc.SelectedValue == "8")//On Maturity
            dtstartdate = Utility_FA.StringToDate(txtValidUpto.Text);
        else
            dtstartdate = Utility_FA.StringToDate(txtInterestCalcdate.Text);
        //dtstartdate = Utility_FA.StringToDate(txtInterestLevy.Text);


        //1   Daily,2       Monthly,3     Bi Monthly,4  Quarterly,5   Half Yearly ,6       Annually


        //int lastday = DateTime.DaysInMonth(dtstartdate.Year, dtstartdate.Month);
        //DateTime endOfMonth = new DateTime(dtstartdate.Year, dtstartdate.Month, DateTime.DaysInMonth(dtstartdate.Year, dtstartdate.Month));
        bool IsEOM = false;
        if (IsEndOfMonth(dtstartdate))
        {
            IsEOM = true;
        }

        dtFromdate = dtstartdate;
        dttempdate = dtstartdate;//Advance
        /* as per R.S interest should be always arrears.*/
        /*   if (ddlRepayPattern.SelectedValue == "2")//Arrears
           {
               if (ddlInterestCalc.SelectedValue == "7")//Sync Principal
                   dtstartdate = dttempdate = FunPubIntDate(dtstartdate, intslno, ddlRepaymentType.SelectedValue);
               else
                   dtstartdate = dttempdate = FunPubIntDate(dtstartdate, intslno, ddlInterestCalc.SelectedValue);
               //dtstartdate = dttempdate = FunPubIntDate(dtstartdate, intslno, ddlInterestLevy.SelectedValue);
           }*/

        //if (ddlInterestCalc.SelectedValue != "7")//always Arrears but not Sync Principal
        //    dtstartdate = dttempdate = FunPubIntDate(dtstartdate, intslno, ddlInterestCalc.SelectedValue);



        dtInterest.Rows.Clear();
        while (dttempdate < dtEnddate)
        {
            DataRow drEmptyRow;
            drEmptyRow = dtInterest.NewRow();
            drEmptyRow["Serial_Number"] = intslno.ToString();
            drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
            if (dttempdate != null)
            {
                dtHolidate = FunCheckIs_Holiday(dttempdate);
                drEmptyRow["Due_Date"] = dtHolidate.ToString(strDateFormat);
                drEmptyRow["From_Date"] = dtFromdate.ToString(strDateFormat);
            }
            dtInterest.Rows.Add(drEmptyRow);

            //For From date it should be previous date
            dtFromdate = dtHolidate.AddDays(1);
            //dtFromdate = dtHolidate;
            if (ddlInterestCalc.SelectedValue == "7")//Sync Principal
                dttempdate = FunPubIntDate(dtstartdate, intslno, ddlRepaymentType.SelectedValue);
            else
                dttempdate = FunPubIntDate(dtstartdate, intslno, ddlInterestCalc.SelectedValue);

            //dttempdate = FunPubIntDate(dtstartdate, intslno, ddlInterestLevy.SelectedValue);

            //if End of month then all date should be EOM
            if (IsEOM)
            {
                DateTime endOfMon = new DateTime(dttempdate.Year, dttempdate.Month, DateTime.DaysInMonth(dttempdate.Year, dttempdate.Month));
                dttempdate = Utility_FA.StringToDate(endOfMon.ToString());
            }

            intslno++;

        }
        if (dtInterest.Rows.Count > 0)//To add maturity date 
        {
            if (!string.IsNullOrEmpty(dtInterest.Rows[intslno - 2]["Due_Date"].ToString()))
            {
                dtlastdate = Utility_FA.StringToDate(dtInterest.Rows[intslno - 2]["Due_Date"].ToString());
            }
        }
        if (Utility_FA.CompareDates(dtlastdate.ToString(), dtEnddate.ToString()) != 0)
        {
            DataRow drEmptyRow;
            drEmptyRow = dtInterest.NewRow();
            drEmptyRow["Serial_Number"] = intslno.ToString();
            drEmptyRow["Fund_Ref_No"] = ddlTrancheRefNo.SelectedItem.Text;
            if (dtEnddate != null)
            {
                dtHolidate = FunCheckIs_Holiday(dtEnddate);
                drEmptyRow["Due_Date"] = dtHolidate.ToString(strDateFormat);
                drEmptyRow["From_Date"] = dtFromdate.ToString(strDateFormat);
            }
            dtInterest.Rows.Add(drEmptyRow);
        }

        //Interest Calculation
        DataTable dtRecRepay = new DataTable();
        dtRecRepay.Columns.Add("Duedate", typeof(DateTime));
        dtRecRepay.Columns.Add("Amount", typeof(decimal));
        dtRecRepay.Columns.Add("Enddate", typeof(DateTime));
        dtRecRepay.Columns.Add("OSAmount", typeof(decimal));


        dtRepay = new DataTable();
        if (ViewState["dtRepay"] != null)
            dtRepay = (DataTable)ViewState["dtRepay"];
        dtReceiving = new DataTable();
        if (ViewState["DT_Receiving"] != null)
            dtReceiving = (DataTable)ViewState["DT_Receiving"];

        foreach (DataRow dr in dtRepay.Rows)
        {
            if (!string.IsNullOrEmpty(dr["Repay_Date"].ToString()) && !string.IsNullOrEmpty(dr["Repay_Amount"].ToString()))
            {
                DataRow drt = dtRecRepay.NewRow();
                if (dr["Repay_Date"].ToString() != "0")
                    drt["Duedate"] = Utility_FA.StringToDate(dr["Repay_Date"].ToString());
                if (dr["Repay_Amount"].ToString() != "0")
                    drt["Amount"] = -Convert.ToDecimal(dr["Repay_Amount"].ToString());
                dtRecRepay.Rows.Add(drt);
            }
        }
        foreach (DataRow dr in dtReceiving.Rows)
        {
            if (!string.IsNullOrEmpty(dr["Due_Date"].ToString()) && !string.IsNullOrEmpty(dr["Due_Amount"].ToString()))
            {
                DataRow drt = dtRecRepay.NewRow();
                if (dr["Due_Date"].ToString() != "0")
                    drt["Duedate"] = Utility_FA.StringToDate(dr["Due_Date"].ToString());
                if (dr["Due_Amount"].ToString() != "0")
                    drt["Amount"] = Convert.ToDecimal(dr["Due_Amount"].ToString());
                dtRecRepay.Rows.Add(drt);
            }
        }


        DataView dv = dtRecRepay.DefaultView;
        dv.Sort = "Duedate ASC";
        DataTable sortedDT = dv.ToTable();

        //As per R.S interest start date should be always ist receiving date on 14-Aug-2014 start
        if (dtInterest.Rows.Count > 0)
            if (!string.IsNullOrEmpty(dtReceiving.Rows[0]["Due_Date"].ToString()))
                dtInterest.Rows[0]["From_date"] = Utility_FA.StringToDate(dtReceiving.Rows[0]["Due_Date"].ToString());
        //As per R.S interest start date should be always ist receiving date on 14-Aug-2014 end


        foreach (DataRow dr in dtInterest.Rows)
        {
            decimal decOSAmount = 0;
            decimal decSumAmt = 0;
            decimal decRate = 0;
            int intnoofdays = 0, intnoofdaystmpo = 0;
            DataTable dtInterestNew = dtInterest.Clone();
            DateTime dtfromdte = Utility_FA.StringToDate(dr["From_date"].ToString());
            DateTime dttodte = Utility_FA.StringToDate(dr["Due_date"].ToString());
            decSumAmt = 0; intnoofdaystmpo = 0;
            while (dtfromdte <= dttodte)
            {
                intnoofdaystmpo++;
                decOSAmount = 0; decRate = 0; intnoofdays = 0;
                DataRow drIntNew = dtInterestNew.NewRow();
                drIntNew["From_date"] = drIntNew["Due_date"] = dtfromdte;


                //string strExpression = " Duedate >= #" + dtfromdte.ToString() + "#" + " and #" + dtfromdte.ToString() + "# <= Enddate";
                string strExpression = " Duedate <= #" + dtfromdte + "#";
                DataRow[] drr = sortedDT.Select(strExpression);
                if (drr.Length > 0)
                {
                    intnoofdays = 1;
                    if (!string.IsNullOrEmpty(txtTotalRate.Text))
                        decRate = Convert.ToDecimal(txtTotalRate.Text);
                    decOSAmount = (decimal)sortedDT.Compute("sum(Amount)", strExpression);
                    decSumAmt += ((intnoofdays * decRate * decOSAmount) / (365 * 100));
                }
                //dr["OSAmount"] = decOSAmount;
                //dr["No_of_days"] = intnoofdays;
                //    dr["Rate"] = decRate;
                dtfromdte = dtfromdte.AddDays(1);
            }
            dr.BeginEdit();
            dr["No_of_days"] = intnoofdaystmpo.ToString();
            dr["Due_Amount"] = decSumAmt.ToString("0.000");
            dr.EndEdit();
        }
        if (ViewState["Fund_Nature"] != null)
        {
            if (ViewState["Fund_Nature"].ToString() == "8")
            {
                decimal decFacilityAmt = Convert.ToDecimal(txtTransactionAmt.Text);
                decimal decIntAmt = 0, decTotAmt = 0, decDueAmt = 0;
                int intcount = 1;
                decIntAmt = Math.Round(decFacilityAmt - FunPriGetFacilityAmount(decFacilityAmt));
                decDueAmt = Math.Round(decIntAmt / dtInterest.Rows.Count);
                foreach (DataRow dr in dtInterest.Rows)
                {
                    dr.BeginEdit();
                    if (intcount == dtInterest.Rows.Count)//Final Row
                        dr["Due_Amount"] = (decIntAmt - decTotAmt).ToString("0.000");
                    else
                        dr["Due_Amount"] = decDueAmt.ToString("0.000");
                    dr.EndEdit();
                    decTotAmt += decDueAmt;
                    intcount++;
                }

            }
        }



        //}

        return dtInterest;

    }


    private bool Is_Morotorium(DateTime dttempdate)
    {
        bool IsMort = false;
        try
        {
            //Morotorium part start
            if (ViewState["dtMorotorium"] != null)
            {
                dtMorotorium = (DataTable)ViewState["dtMorotorium"];

                if (dtMorotorium.Rows.Count > 0)
                {
                    if (dtMorotorium.Rows[0]["Moratoriumtype"].ToString() != string.Empty)
                    {
                        if (dtMorotorium.Rows[0]["Moratoriumtype"].ToString() == "1" || dtMorotorium.Rows[0]["Moratoriumtype"].ToString() == "3")
                        {
                            foreach (DataRow drMor in dtMorotorium.Rows)
                            {
                                if (!string.IsNullOrEmpty(dttempdate.ToString()))
                                {
                                    if (Utility_FA.StringToDate(dttempdate.ToString()) >= Utility_FA.StringToDate(drMor["Fromdate"].ToString())
                                        &&
                                        Utility_FA.StringToDate(dttempdate.ToString()) <= Utility_FA.StringToDate(drMor["Todate"].ToString()))
                                    {
                                        IsMort = true;
                                        return IsMort;
                                    }

                                }
                            }
                        }
                    }
                }
            }
            //Morotorium part end
        }
        catch (Exception ex)
        {
        }
        return IsMort;
    }

    private void FunGenerateMoratorium()
    {
        try
        {
            //Morotorium part start
            if (ViewState["dtMorotorium"] != null)
            {
                dtMorotorium = (DataTable)ViewState["dtMorotorium"];

                if (dtMorotorium.Rows.Count > 0)
                {
                    if (dtMorotorium.Rows[0]["Moratoriumtype"].ToString() != string.Empty)
                    {
                        if (dtMorotorium.Rows[0]["Moratoriumtype"].ToString() == "1" || dtMorotorium.Rows[0]["Moratoriumtype"].ToString() == "3")
                        {
                            foreach (DataRow drMor in dtMorotorium.Rows)
                            {
                                DataTable dtRepayMor = (DataTable)ViewState["dtRepay"];
                                FunPriApplyMorotorium(dtRepayMor, drMor["Fromdate"].ToString(), drMor["Todate"].ToString());
                            }

                        }
                    }
                }
            }
            //Morotorium part end
        }
        catch (Exception ex)
        {

        }
    }

    private void FunPriApplyMorotoriumInt(DataTable dtInterest, string strMorStartdate, string strMorEnddate)
    {
        try
        {
            DataTable dtRepaynew = new DataTable();
            dtRepaynew = dtInterest.Clone();
            decimal decMorAmount = 0;
            decimal decSumFacilityAmt = 0;


            foreach (DataRow dr in dtInterest.Rows)
            {
                if (Utility_FA.StringToDate(dr["Due_Date"].ToString()) >= Utility_FA.StringToDate(strMorStartdate)
                    &&
                    Utility_FA.StringToDate(dr["Due_Date"].ToString()) <= Utility_FA.StringToDate(strMorEnddate))
                {
                    if (!string.IsNullOrEmpty(dr["Due_Amount"].ToString()))
                        decMorAmount += Convert.ToDecimal(dr["Due_Amount"].ToString());
                }
                else
                {
                    dtRepaynew.ImportRow(dr);
                }

            }

            if (dtRepaynew.Rows.Count > 0)
            {
                decimal decTotMorAmt = 0; int intMorSlno = 1;
                decSumFacilityAmt = Math.Floor(decMorAmount / (dtRepaynew.Rows.Count));
                foreach (DataRow dr in dtRepaynew.Rows)
                {
                    dr["Serial_Number"] = intMorSlno.ToString();
                    dr["Due_Amount"] = Convert.ToDecimal(dr["Due_Amount"]) + decSumFacilityAmt;
                    //dr["Hedge_Amount"] = decSumFacilityAmt;
                    decTotMorAmt = decTotMorAmt + decSumFacilityAmt;
                    intMorSlno++;
                    dtRepaynew.AcceptChanges();
                }
                if (decTotMorAmt < decMorAmount)
                {
                    dtRepaynew.Rows[dtRepaynew.Rows.Count - 1]["Due_Amount"] = Math.Floor(Convert.ToDecimal(dtRepaynew.Rows[dtRepaynew.Rows.Count - 1]["Due_Amount"]) + (decMorAmount - decTotMorAmt));
                }
            }


            //To bind the grid
            //gvInterest.DataSource = dtRepaynew;
            //gvInterest.DataBind();
            ViewState["dtInterest"] = dtRepaynew;

        }
        catch (Exception ex)
        {

        }
    }

    private void FunPriApplyMorotorium(DataTable dtRepay, string strMorStartdate, string strMorEnddate)
    {
        try
        {
            DataTable dtRepaynew = new DataTable();
            dtRepaynew = dtRepay.Clone();
            decimal decMorAmount = 0;
            decimal decSumFacilityAmt = 0;

            //Principal part start
            foreach (DataRow dr in dtRepay.Rows)
            {
                if (!string.IsNullOrEmpty(dr["Repay_Date"].ToString()))
                {
                    if (Utility_FA.StringToDate(dr["Repay_Date"].ToString()) >= Utility_FA.StringToDate(strMorStartdate)
                        &&
                        Utility_FA.StringToDate(dr["Repay_Date"].ToString()) <= Utility_FA.StringToDate(strMorEnddate))
                    {
                        if (!string.IsNullOrEmpty(dr["Repay_Amount"].ToString()))
                            decMorAmount += Convert.ToDecimal(dr["Repay_Amount"].ToString());
                    }
                    else
                    {
                        dtRepaynew.ImportRow(dr);
                    }
                }
                else
                {
                    dtRepaynew.ImportRow(dr);
                }

            }

            if (dtRepaynew.Rows.Count > 0)
            {
                decimal decTotMorAmt = 0; int intMorSlno = 1;
                decSumFacilityAmt = Math.Floor(decMorAmount / (dtRepaynew.Rows.Count));
                foreach (DataRow dr in dtRepaynew.Rows)
                {
                    dr["Serial_Number"] = intMorSlno.ToString();
                    dr["Repay_Amount"] = Convert.ToDecimal(dr["Repay_Amount"]) + decSumFacilityAmt;
                    //dr["Hedge_Amount"] = decSumFacilityAmt;
                    decTotMorAmt = decTotMorAmt + decSumFacilityAmt;
                    intMorSlno++;
                    dtRepaynew.AcceptChanges();
                }
                if (decTotMorAmt < decMorAmount)
                {
                    dtRepaynew.Rows[dtRepaynew.Rows.Count - 1]["Repay_Amount"] = Math.Floor(Convert.ToDecimal(dtRepaynew.Rows[dtRepaynew.Rows.Count - 1]["Repay_Amount"]) + (decMorAmount - decTotMorAmt));
                }
            }

            //Principal part end

            ViewState["dtRepay"] = dtRepaynew;
            FunFillgrid(gvBorrowerRepay, dtRepaynew);
            //FunPubBindRepay(dtRepaynew);
            //ViewState["DT_Repay"] = dtRepaynew;

        }
        catch (Exception ex)
        {

        }
    }

    private DateTime FunCheckIs_Holiday(DateTime dtcheck)
    {
        DateTime dtValidDate;
        dtValidDate = dtcheck;
        try
        {
            if (ViewState["dtHoliday"] != null)
            {
                dtHoliday = (DataTable)ViewState["dtHoliday"];
                DataRow[] dtHoli = dtHoliday.Select("Leave_Date='" + dtcheck + "'");
                if (dtHoli.Length > 0)
                {
                    dtcheck = dtcheck.AddDays(1);
                    dtValidDate = FunCheckIs_Holiday(dtcheck);
                }
            }

        }
        catch (Exception ex)
        {

        }
        return Utility_FA.StringToDate(dtValidDate.ToString());
    }







    public static DateTime FunPubGetNextDate(string strFrequency, DateTime dtFromDate)
    {
        DateTime dtToDate;
        switch (strFrequency.ToLower())
        {
            //daily
            case "1":
                dtToDate = dtFromDate.AddDays(1);
                break;
            //Monthly
            case "2":
                dtToDate = dtFromDate.AddMonths(1);
                break;
            //bi monthly
            case "3":
                dtToDate = dtFromDate.AddMonths(2);
                break;
            //quarterly
            case "4":
                dtToDate = dtFromDate.AddMonths(3);
                break;
            // half yearly
            case "5":
                dtToDate = dtFromDate.AddMonths(6);
                break;
            //annually
            case "6":
                dtToDate = dtFromDate.AddYears(1);
                break;
            default:
                dtToDate = dtFromDate.AddMonths(1);
                break;
        }
        return Utility_FA.StringToDate(dtToDate.ToString());
    }

    #endregion








    #endregion


    #region "Cashflows"

    #region Grid Events


    protected void grvCashflows_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            AjaxControlToolkit.CalendarExtender CEtxtCFDate = e.Row.FindControl("CEtxtCFDate") as AjaxControlToolkit.CalendarExtender;
            CEtxtCFDate.Format = strDateFormat;
            TextBox txtCFDate = e.Row.FindControl("txtCFDate") as TextBox;
            txtCFDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCFDate.ClientID + "','" + strDateFormat + "',false,  false);");
        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblCFJv_No = e.Row.FindControl("lblCFJv_No") as Label;
            LinkButton btnRemove = e.Row.FindControl("btnRemove") as LinkButton;
            if (!string.IsNullOrEmpty(lblCFJv_No.Text))
                btnRemove.Enabled = false;

        }
    }

    protected void grvCashflows_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataRow drEmptyRow;
        if (e.CommandName == "Add")
        {
            DropDownList ddlType = (DropDownList)grvCashflows.FooterRow.FindControl("ddlType");
            DropDownList ddlCashFlow = (DropDownList)grvCashflows.FooterRow.FindControl("ddlCashFlow");
            DropDownList ddlFrequency = (DropDownList)grvCashflows.FooterRow.FindControl("ddlFrequency");
            TextBox txtCFDate = (TextBox)grvCashflows.FooterRow.FindControl("txtCFDate");
            TextBox txtCFAmount = (TextBox)grvCashflows.FooterRow.FindControl("txtCFAmount");
            CheckBox cbkCondition = (CheckBox)grvCashflows.FooterRow.FindControl("cbkCondition");
            int intserialCount = 0;

            dtCashFlows = (DataTable)ViewState["dtCashFlows"];

            if (dtCashFlows.Rows.Count == 1)
            {
                if (Convert.ToInt32(dtCashFlows.Rows[0]["Serial_Number"]) == 0)
                    dtCashFlows.Rows[0].Delete();
            }

            if (dtCashFlows.Rows.Count > 0)
                intserialCount = Convert.ToInt32(dtCashFlows.Rows[dtCashFlows.Rows.Count - 1]["Serial_Number"]);

            if (txtCFAmount.Text == string.Empty)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter Amount");
                return;
            }

            drEmptyRow = dtCashFlows.NewRow();
            drEmptyRow["Serial_Number"] = intserialCount + 1;
            //drEmptyRow["Fund_CF_ID"]=
            drEmptyRow["Type"] = ddlType.SelectedItem.Text;
            drEmptyRow["TypeID"] = ddlType.SelectedItem.Value;
            drEmptyRow["CashFlow"] = ddlCashFlow.SelectedItem.Text;
            drEmptyRow["CashFlowID"] = ddlCashFlow.SelectedItem.Value;
            if (ddlFrequency.SelectedIndex > 0)
                drEmptyRow["Frequency"] = ddlFrequency.SelectedItem.Text;
            drEmptyRow["FrequencyID"] = ddlFrequency.SelectedItem.Value;
            drEmptyRow["CFDate"] = txtCFDate.Text;
            drEmptyRow["CFAmount"] = txtCFAmount.Text;
            //drEmptyRow["Jv_No"] = txtCFAmount.Text;
            drEmptyRow["Condition"] = txtFormula.Text;
            dtCashFlows.Rows.Add(drEmptyRow);
            ViewState["dtCashFlows"] = dtCashFlows;
            FunFillgrid(grvCashflows, dtCashFlows);
            FunPriSetCFFooter();
            pnlConditions.Visible = false;
            txtFormula.Text = string.Empty;
        }

    }

    protected void grvCashflows_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtCashFlows = (DataTable)ViewState["dtCashFlows"];
        dtCashFlows.Rows.RemoveAt(e.RowIndex);
        if (dtCashFlows.Rows.Count == 0)
        {
            FunPriSetEmptyCFtbl();
        }
        else
        {
            FunFillgrid(grvCashflows, dtCashFlows);
        }
        FunPriSetCFFooter();
    }


    #endregion


    #region "Cashflow Formulae"

    protected void btn_chk_Click(object sender, EventArgs e)
    {

    }

    private decimal FunGetCFAmount()
    {
        int intfreq = 0;//quarterly 3 monthly 1
        decimal decFValue = 0;
        decimal decLValue = 0;
        decimal decRecAmount = 0;

        decimal decFinalAmt = 0;
        if (!string.IsNullOrEmpty(txtFormula.Text))
        {
            string[] strarr = txtFormula.Text.Split('~');




            if (strarr.Length > 0)
            {

                if (!string.IsNullOrEmpty(strarr[1].ToString()))
                {
                    if (strarr[1].ToString().ToUpper() == "QUARTER")
                        intfreq = 3;
                    else
                        intfreq = 1;
                }

                if (!string.IsNullOrEmpty(strarr[3].ToString()))
                {
                    decFValue = Convert.ToDecimal(strarr[3].ToString());
                }

                if (!string.IsNullOrEmpty(strarr[5].ToString()))
                {
                    decLValue = Convert.ToDecimal(strarr[5].ToString());
                }

                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Option", "13");
                Procparam.Add("@Company_Id", intCompanyID.ToString());
                Procparam.Add("@Id", ddlFunderCode.SelectedValue);

                DataTable dt = Utility_FA.GetDefaultData("FA_Get_Deal_Fund_Dtls", Procparam);

                if (dt.Rows.Count > 0)
                    decRecAmount = Convert.ToDecimal(dt.Rows[0]["Amount"]) / intfreq;//Average

                if (decRecAmount <= decFValue)
                {
                    decFinalAmt = Convert.ToDecimal(txtCommitAmt.Text) * decLValue;
                }

            }
        }
        //Utility_FA.FunShowAlertMsg_FA(this, decFinalAmt.ToString());
        return decFinalAmt;
    }

    #endregion

    #endregion


    #region "Morotorium Details"

    protected void grvMorotorium_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            AjaxControlToolkit.CalendarExtender CEFrom_Date = e.Row.FindControl("CEFrom_Date") as AjaxControlToolkit.CalendarExtender;
            AjaxControlToolkit.CalendarExtender CETo_Date = e.Row.FindControl("CETo_Date") as AjaxControlToolkit.CalendarExtender;
            CEFrom_Date.Format = CETo_Date.Format = strDateFormat;
            TextBox txtFrom_Date = e.Row.FindControl("txtFrom_Date") as TextBox;
            TextBox txtTo_Date = e.Row.FindControl("txtTo_Date") as TextBox;
            txtFrom_Date.Attributes.Add("onblur", "fnDoDate(this,'" + txtFrom_Date.ClientID + "','" + strDateFormat + "',false,  false);");
            txtTo_Date.Attributes.Add("onblur", "fnDoDate(this,'" + txtTo_Date.ClientID + "','" + strDateFormat + "',false,  false);");
        }

    }

    protected void grvMorotorium_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        DataRow drEmptyRow;
        if (e.CommandName == "Add")
        {

            DropDownList ddlMorotorium_Type = (DropDownList)grvMorotorium.FooterRow.FindControl("ddlMorotorium_Type");
            TextBox txtFrom_Date = (TextBox)grvMorotorium.FooterRow.FindControl("txtFrom_Date");
            TextBox txtTo_Date = (TextBox)grvMorotorium.FooterRow.FindControl("txtTo_Date");
            //TextBox txtNo_of_days = (TextBox)grvMorotorium.FooterRow.FindControl("txtNo_of_days");

            //Validation check
            if (Utility_FA.StringToDate(txtFrom_Date.Text) > Utility_FA.StringToDate(txtTo_Date.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "From Date should be lesser than To Date");
                return;
            }

            //Checking with in the tenure period
            if (Utility_FA.StringToDate(txtFrom_Date.Text) < Utility_FA.StringToDate(txtFundTransDate.Text)
                || Utility_FA.StringToDate(txtFrom_Date.Text) > Utility_FA.StringToDate(txtValidUpto.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Moratorium should be within the tenure");
                return;
            }
            if (Utility_FA.StringToDate(txtTo_Date.Text) > Utility_FA.StringToDate(txtValidUpto.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Moratorium should be within the tenure");
                return;
            }




            int intserialCount = 0;
            dtMorotorium = (DataTable)ViewState["dtMorotorium"];
            if (dtMorotorium.Rows.Count == 1)
            {
                if (dtMorotorium.Rows[0]["SLNo"].ToString() == string.Empty)
                    dtMorotorium.Rows[0].Delete();
            }

            if (dtMorotorium.Rows.Count > 0)
                intserialCount = Convert.ToInt32(dtMorotorium.Rows[dtMorotorium.Rows.Count - 1]["SLNo"]);



            drEmptyRow = dtMorotorium.NewRow();
            drEmptyRow["SLNo"] = intserialCount + 1;
            drEmptyRow["Moratoriumtype"] = ddlMorotorium_Type.SelectedValue;
            drEmptyRow["Moratorium"] = ddlMorotorium_Type.SelectedItem.Text;
            drEmptyRow["Fromdate"] = txtFrom_Date.Text;
            drEmptyRow["Todate"] = txtTo_Date.Text;
            if ((!string.IsNullOrEmpty(txtFrom_Date.Text)) && (!string.IsNullOrEmpty(txtTo_Date.Text)))
                drEmptyRow["Noofdays"] = (Utility_FA.StringToDate(txtTo_Date.Text) - Utility_FA.StringToDate(txtFrom_Date.Text)).TotalDays;
            dtMorotorium.Rows.Add(drEmptyRow);
            ViewState["dtMorotorium"] = dtMorotorium;
            FunFillgrid(grvMorotorium, dtMorotorium);
            FunPriSetMorotoriumLOV();
        }

    }

    protected void grvMorotorium_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtMorotorium = (DataTable)ViewState["dtMorotorium"];
        dtMorotorium.Rows.RemoveAt(e.RowIndex);
        if (dtMorotorium.Rows.Count == 0)
        {
            FunPriSetEmptyMorotoriumtbl();
        }
        else
        {
            FunFillgrid(grvMorotorium, dtMorotorium);
            FunPriSetMorotoriumLOV();
        }

    }

    private void FunPriSetEmptyMorotoriumtbl()
    {
        try
        {
            DataRow drEmptyRow;
            dtMorotorium = new DataTable();
            dtMorotorium.Columns.Add("SlNo");
            dtMorotorium.Columns.Add("Moratoriumtype");
            dtMorotorium.Columns.Add("Moratorium");
            dtMorotorium.Columns.Add("Fromdate");
            dtMorotorium.Columns.Add("Todate");
            dtMorotorium.Columns.Add("Noofdays");

            drEmptyRow = dtMorotorium.NewRow();
            dtMorotorium.Rows.Add(drEmptyRow);
            ViewState["dtMorotorium"] = dtMorotorium;
            FunFillgrid(grvMorotorium, dtMorotorium);
            grvMorotorium.Rows[0].Visible = false;
            FunPriSetMorotoriumLOV();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriSetMorotoriumLOV()
    {
        try
        {
            if (grvMorotorium != null)
            {
                if (grvMorotorium.FooterRow != null)
                {
                    DropDownList ddlMorotorium_Type = (DropDownList)grvMorotorium.FooterRow.FindControl("ddlMorotorium_Type");
                    //Type
                    Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Program_ID", "15");
                    Procparam.Add("@LookupType_Code", "61");//Morotrium type
                    ddlMorotorium_Type.BindDataTable_FA("FA_GET_LOOKUP_VALUES", Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    #endregion

    protected void btnValidate_Click(object sender, EventArgs e)
    {
        try
        {

            if (ddlTrancheRefNo.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this, "Select the Tranche/Serial Ref No");
                return;
            }

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@Deal_Id", ddlDealNumber.SelectedValue);
            Procparam.Add("@Tranche_No", ddlTrancheRefNo.SelectedValue);
            Procparam.Add("@Trans_Amount", txtTransactionAmt.Text);
            if (!string.IsNullOrEmpty(strFunder_Tran_ID))
                Procparam.Add("@Funder_Tran_Id", strFunder_Tran_ID);
            DataTable dt = Utility_FA.GetDefaultData("FA_Validate_FunTran", Procparam);
            FunPriSetAmountcheck(true);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["ErrorCode"].ToString() != "0")
                {
                    FunPriSetAmountcheck(false);
                    string stramount = "";
                    if (!string.IsNullOrEmpty(dt.Rows[0]["Avail_Amt"].ToString()))
                        stramount = "(" + dt.Rows[0]["Avail_Amt"].ToString() + ")";
                    Utility_FA.FunShowAlertMsg_FA(this, "Amount should not exceed " + stramount + "");
                    txtTransactionAmt.Text = string.Empty;
                    btnValidate.Focus();
                    return;
                }
            }
            btnValidate.Focus();
        }
        catch (Exception ex)
        {
        }
    }



    private void FunPriSetAmountcheck(bool blnflag)
    {
        try
        {
            ddlTenureType.SelectedIndex = -1;
            txtTenure.Text = txtValidUpto.Text = string.Empty;

            ddlTenureType.Enabled = txtTenure.Enabled = txtValidUpto.Enabled = blnflag;

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }



    #region "XIRR"

    private const double DaysPerYear = 365.0;
    DataTable dttte = new DataTable();
    DataTable dttter = new DataTable();
    protected void btnCalIRR_Click(object sender, EventArgs e)
    {
        try
        {
            FunCalculateIRR();
            //Utility_FA.FunShowAlertMsg_FA(this, "Cost of Fund %  " + Convert.ToDecimal(result * 100).ToString("0.00"));
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    private void FunCalculateIRR()
    {
        try
        {
            dttte.Columns.Add("Duedate", typeof(DateTime));
            dttte.Columns.Add("Amount", typeof(decimal));

            dtRepay = new DataTable();
            if (ViewState["dtRepay"] != null)
                dtRepay = (DataTable)ViewState["dtRepay"];
            dtReceiving = new DataTable();
            if (ViewState["DT_Receiving"] != null)
                dtReceiving = (DataTable)ViewState["DT_Receiving"];

            List<CashItem> DataItems = new List<CashItem>();

            foreach (DataRow dr in dtRepay.Rows)
            {

                if (dr["Repay_Int"].ToString() == "R")
                {

                    if (!string.IsNullOrEmpty(dr["Repay_Date"].ToString()) && !string.IsNullOrEmpty(dr["Repay_Amount"].ToString()))
                    {
                        DataRow drt = dttte.NewRow();
                        drt["Duedate"] = Utility_FA.StringToDate(dr["Repay_Date"].ToString());
                        drt["Amount"] = Convert.ToDecimal(dr["Repay_Amount"].ToString());
                        dttte.Rows.Add(drt);
                    }
                }
                if (dr["Repay_Int"].ToString() == "I")
                {
                    if (!string.IsNullOrEmpty(dr["Interest_Date"].ToString()) && !string.IsNullOrEmpty(dr["Interest_Amount"].ToString()))
                    {
                        DataRow drt = dttte.NewRow();
                        drt["Duedate"] = Utility_FA.StringToDate(dr["Interest_Date"].ToString());
                        drt["Amount"] = Convert.ToDecimal(dr["Interest_Amount"].ToString());
                        dttte.Rows.Add(drt);
                    }
                }
            }

            foreach (DataRow dr in dtReceiving.Rows)
            {
                DataRow drt = dttte.NewRow();
                drt["Duedate"] = Utility_FA.StringToDate(dr["Due_Date"].ToString());
                drt["Amount"] = -Convert.ToDecimal(dr["Due_Amount"].ToString());
                dttte.Rows.Add(drt);
            }

            if (ViewState["dtCashFlows"] != null)
                dtCashFlows = (DataTable)ViewState["dtCashFlows"];

            foreach (DataRow drCF in dtCashFlows.Rows)
            {
                if (!string.IsNullOrEmpty(drCF["CFDate"].ToString()) &&
                    !string.IsNullOrEmpty(drCF["TypeID"].ToString()))
                {
                    DataRow drte = dttte.NewRow();
                    if (!string.IsNullOrEmpty(drCF["CFDate"].ToString()))
                        drte["Duedate"] = Utility_FA.StringToDate(drCF["CFDate"].ToString());
                    if (!string.IsNullOrEmpty(drCF["TypeID"].ToString()))
                    {
                        //1	Inflow ,2	Outflow
                        if (drCF["TypeID"].ToString() == "1")
                            drte["Amount"] = Convert.ToDecimal(drCF["CFAmount"].ToString());
                        else
                            drte["Amount"] = Convert.ToDecimal(drCF["CFAmount"].ToString());
                    }

                    dttte.Rows.Add(drte);
                }
            }

            DataView dv = dttte.DefaultView;
            dv.Sort = "Duedate ASC";
            DataTable sortedDT = dv.ToTable();

            foreach (DataRow dr in sortedDT.Rows)
            {
                CashItem item = new CashItem();
                item.Date = Utility_FA.StringToDate(dr["Duedate"].ToString());
                item.Amount = Convert.ToDouble(dr["Amount"]);
                DataItems.Add(item);
            }

            //CashItem item1 = new CashItem();
            //item1.Date = Utility_FA.StringToDate("01/06/2014");
            //item1.Amount = -10000000 * 0.1;
            //DataItems.Add(item1);



            CashItem[] cashItems = DataItems.ToArray();
            // Hard-coded: based on Excel doc (http://office.microsoft.com/en-us/excel-help/xirr-function-HP010062387.aspx)
            const double defaultTolerance = 0.01;
            const double defaultGuess = 0.1;

            double result = CalcXirr(cashItems, defaultGuess, defaultTolerance);



            if (Double.IsInfinity(result) || Double.IsNaN(result))
                throw new InvalidOperationException("Could not calculate XIRR: Infinity");

            if (Double.IsNaN(result))
                throw new InvalidOperationException("Could not calculate XIRR: Not a number");
            //Utility_FA.FunShowAlertMsg_FA(this, "Cost of Fund %  " + Convert.ToDecimal(result * 100).ToString("0.00"));

            txtCOF.Text = Convert.ToDecimal(result * 100).ToString("0.000");

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    private static double CalcXirr(IList<CashItem> cashItems, double guess, double tolerance)
    {
        const int maxIterations = 100;
        var x0 = guess;
        var i = 0;
        bool continueLoop;
        do
        {
            var fx0 = XirrFunction(cashItems, x0);
            var xstep = Math.Abs(x0) / 1e6;
            var dfx0 = XirrDerivative(XirrFunction, cashItems, x0, xstep);

            double x1;
            // Overshoot slightly to prevent us from staying on just one side of the root.
            if (Math.Abs(Math.Abs(dfx0) - 0) >= double.Epsilon)
                x1 = x0 - 1.000001 * fx0 / dfx0;
            else
                x1 = x0 / 2;

            var errorEstimate = Math.Abs(x1 - x0) / (Math.Abs(x0) + Math.Abs(x1));
            x0 = x1;
            continueLoop = errorEstimate > tolerance && Math.Abs(fx0) > tolerance;
        } while (continueLoop && ++i < maxIterations);

        if (continueLoop || i == maxIterations)
            return double.NaN;

        var result = x0 < 0 ? -1 * (1 + x0) : x0 - 1;
        return result;
    }

    private static double XirrFunction(IList<CashItem> cashItems, double rate)
    {
        var firstEntry = cashItems.First();
        var firstDate = firstEntry.Date;
        var result = 0.0d;

        for (var i = 0; i < cashItems.Count(); i++)
        {
            var entry = cashItems.ElementAt(i);
            var days = (entry.Date - firstDate).Days;
            if (days < 0)
                return double.NaN;

            result += entry.Amount / Math.Pow(rate, days / DaysPerYear);
        }
        return result;
    }

    private static double XirrDerivative(Func<IList<CashItem>, double, double> xirrFunction,
                                             IList<CashItem> cashItems,
                                             double x,
                                             double xStep)
    {
        var xLeft = x - xStep;
        if (xLeft < double.MinValue)
            xLeft = x;

        var xRight = x + xStep;
        if (xRight > double.MaxValue)
            xRight = x;

        if (Math.Abs(xLeft - xRight) < double.Epsilon)
            return double.NaN;

        var yLeft = xirrFunction(cashItems, xLeft);
        var yRight = xirrFunction(cashItems, xRight);

        var dfx = (yRight - yLeft) / (xRight - xLeft);
        return dfx;
    }

    public struct CashItem
    {
        public DateTime Date;
        public double Amount;

        public CashItem(DateTime date, double amount)
        {
            Date = date;
            Amount = amount;
        }
    }

    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        UserInfo_FA Ufo = new UserInfo_FA();

        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
        Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
        Procparam.Add("@Program_Id", "15");
        Procparam.Add("@Is_Operational", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_Loca_List_AGT", Procparam));

        return suggetions.ToArray();
    }

    //Region Created By: Siva.K For Report 20JUL2015

    #region Reports

    protected void ddlReportType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlReportType.SelectedValue == "5" && ddlNatureofFund.SelectedItem.Text.ToLower() != "corporate deposit")
            {
                btnDrawdown.Enabled = false;

            }
            else
            {
                btnDrawdown.Enabled = true;
            }
            ddlReportType.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnDrawdown_Click(object sender, EventArgs e)
    {
        if (ddlReportType.SelectedValue == "1")
            FunPriGetReportDetais("FA_GET_OVERSEASBANK_DTLS");
        if (ddlReportType.SelectedValue == "2")
            FunPriGetReportDetais("FA_GET_FUNDS_LOCBANK_DTLS");
        if (ddlReportType.SelectedValue == "3")
            FunPriGetReportDetais("FA_GET_DRAWDOWN_DTLS");
        else if (ddlReportType.SelectedValue == "4")
            FunPriGetReportDetais("FA_GET_PROMISSORY_DTLS");
        else if (ddlReportType.SelectedValue == "5")
            FunPubPrintDepositLetter_PDF();
    }
    protected void btnPromissory_Click(object sender, EventArgs e)
    {
        FunPriGetReportDetais("FA_GET_PROMISSORY_DTLS");
    }
    protected void btnDeposit_Click(object sender, EventArgs e)
    {
        FunPriGetReportDetais("FA_GET_PROMISSORY_DTLS");
    }
    private void FunPriGetReportDetais(string strProcedure)
    {
        try
        {
            if (txtFunderTranNo.Text != "")
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", intCompanyID.ToString());
                Procparam.Add("@FUND_TRANNO", txtFunderTranNo.Text.ToString());
                Procparam.Add("@Letter_Number", txtLetterNumber.Text);
                DataSet DS = new DataSet();
                DataTable dtHeader = new DataTable();
                DataTable dtDetails = new DataTable();
                DataTable dtSubDetails = new DataTable();
                string strNewHTML = string.Empty;

                DS = Utility_FA.GetDataset(strProcedure, Procparam);
                if (DS != null)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                        dtHeader = DS.Tables[0].Copy();
                    if (DS.Tables[1].Rows.Count > 0)
                        strNewHTML = DS.Tables[1].Rows[0]["TEMPLATE_CONTENT"].ToString().Trim();
                }
                if (dtHeader.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtHeader.Rows)
                    {
                        foreach (DataColumn dcol in dtHeader.Columns)
                        {
                            string strColname = string.Empty;
                            strColname = "~" + dcol.ColumnName + "~";
                            if (strNewHTML.Contains(strColname))
                                strNewHTML = strNewHTML.Replace(strColname, dr[dcol].ToString());
                        }
                        FunPriGeneratePDF(strNewHTML, DS.Tables[1].Rows[0]["TMP_DOC_NO"].ToString().Trim().Replace("/", "-") + "-" + txtFunderTranNo.Text.ToString().Replace("/", "-"));
                    }
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }

    private void FunPriGeneratePDF(string strNewHTML, string FileName)
    {
        try
        {
            string strnewFile = string.Empty;
            string strFileName = string.Empty;
            String htmlText = strNewHTML.Replace("</P>", "</P></BR>");
            htmlText = htmlText.Replace("<HR>", "<HR width=\"100\">");
            //htmlText = htmlText.Replace("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "</BR>");
            strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + FileName + ".pdf");
            strFileName = "/Treasury/PDF Files/" + FileName + ".pdf";
            Document doc = new Document();
            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(strnewFile, FileMode.Create));
            doc.AddCreator("Sundaram Infotech Solutions Limited");
            doc.AddTitle("Dradown Letter_" + FileName);
            doc.Open();
            List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(htmlText), null);
            for (int k = 0; k < htmlarraylist.Count; k++)
            { doc.Add((IElement)htmlarraylist[k]); }
            doc.AddAuthor("S3G Team");
            doc.Close();
            //string strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            string strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    public void FunPubPrintDepositLetter_PDF()
    {
        try
        {
            DataTable dtSchedule = FunPubGetDataTable();
            //string strDepositLetter = DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "") + ddlInvestmentCode.SelectedItem.Text + "InterestSchedule.pdf";
            string strDepositLetter = DateTime.Now.ToString().Replace("/", "").Replace(":", "").Replace(" ", "") + "DepositLetter.pdf";
            string strnewFile = (Server.MapPath(".") + "\\PDF Files\\" + strDepositLetter);
            string strFileName = "/Treasury/PDF Files/" + strDepositLetter;
            if (dtSchedule.Rows.Count > 0)
            {
                //ReportDocument rptd = new ReportDocument();
                //rptd.Load(Server.MapPath("RptDepositLetter.rpt"));
                //rptd.SetDataSource(dtSchedule);
                DirectoryInfo df = new DirectoryInfo(Convert.ToString(Server.MapPath(".") + "\\PDF Files"));
                if (!df.Exists)
                {
                    df.Create();
                }
                if (File.Exists(strnewFile) == true)
                {
                    File.Delete(strnewFile);
                }

                //rptd.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath(".") + "\\PDF Files\\" + strDepositLetter);
            }
            string strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    public DataTable FunPubGetDataTable()
    {

        DataTable dtHeader = new DataTable();
        if (txtFunderTranNo.Text != "")
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@FUND_TRANNO", txtFunderTranNo.Text.ToString());
            DataSet DS = new DataSet();

            DataTable dtDetails = new DataTable();
            DataTable dtSubDetails = new DataTable();
            string strNewHTML = string.Empty;

            DS = Utility_FA.GetDataset("FA_GET_DEPOSIT_DTLS", Procparam);
            if (DS != null)
            {
                if (DS.Tables[0].Rows.Count > 0)
                    dtHeader = DS.Tables[0].Copy();
            }
        }
        return dtHeader;
    }
    #endregion

}



