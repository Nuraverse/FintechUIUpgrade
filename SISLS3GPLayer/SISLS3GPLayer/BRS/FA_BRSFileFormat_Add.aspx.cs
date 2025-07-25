using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Text;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using FA_BusEntity.FinancialAccounting;
using FATransactionServiceReference;
using FA_BusEntity;

public partial class BRS_FA_BRSFileFormat_Add : ApplyThemeForProject_FA
{
    Dictionary<string, string> Procparam = new Dictionary<string, string>();
    int intCompanyID, intUserID = 0;
    string Details = string.Empty;
    int intErrorCode;
    string strDocNo = string.Empty;
    static int Bank_ID = 0;
    static int Location_ID = 0;
    FASerializationMode SerMode = FASerializationMode.Binary;
    FATransactionServiceClient objBRS = null;
    Hedging.FA_BRS_File_FormatDataTable objBRSDtl = null;
    Hedging.FA_BRS_File_FormatRow objBRSRow = null;
    string strMode = string.Empty;
    int BRSId = 0;
    //FASession ObjFASession = new FASession();
    string strConnectionName = "";
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    ListItemCollection lstCollection = new ListItemCollection();
    FASession objsession = new FASession();
    string strDateFormat = string.Empty;
    DataTable dtBankList;
    string strRedirectPageAdd = "window.location.href='../BRS/FA_BRSFileFormat_Add.aspx';";
    string strRedirectPageView = "window.location.href='../BRS/FA_BRSFileFormat_View.aspx';";
    DataRow[] dr = { };
    public static BRS_FA_BRSFileFormat_Add obj_Page;

    string strRedirectPage = "~/BRS/FA_BRSFileFormat_View.aspx";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj_Page = this;

            AjaxControlToolkit.ToolkitScriptManager objScriptManager = (AjaxControlToolkit.ToolkitScriptManager)Master.FindControl("ScriptManager1");
            objScriptManager.EnablePageMethods = true;
            strDateFormat = ObjFASession.ProDateFormatRW;
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strMode = Request.QueryString.Get("qsMode");
                BRSId = Convert.ToInt32(fromTicket.Name);
            }
            if (!IsPostBack)
            {
                Session["GridTable"] = null;
                CEDocumentDate.Format = ObjFASession.ProDateFormatRW;
               // txtDocumentDate.Attributes.Add("onchange", "fnDoDate(this,'" + txtDocumentDate.ClientID + "','" + strDateFormat + "',true,'false',true,'" + ObjFASession.ProFinYearStartDate + "','" + ObjFASession.ProFinYearEndDate + "');");

                ddlLocation.SelectedText = "--Select--";
                Funpribindtype();
                if (strMode == "")
                {
                    chkActive.Checked = true;
                    chkActive.Enabled = false;
                    FunPriLoadBankDetails();
                    FunProSetinitialRow();
                    //txtDocumentDate.Text = (System.DateTime.Now).ToString(strDateFormat);
                }
                if (strMode == "Q" || strMode == "M")
                {
                    imgPaymentRequestDate.Visible = false;
                    if (strMode == "Q")
                    {
                        ddlLocation.ReadOnly = btnCancel.Visible = txtDocumentDate.ReadOnly = true;
                        chkActive.Enabled = ddlBankName.Enabled =
                        btnSave.Enabled = btnGo.Enabled = btnClear.Visible = false;
                        panBRS.Enabled = false;
                    }
                    else
                    {
                        chkActive.Enabled = ((ObjUserInfo_FA.ProUserLevelIdRW == 1 || ObjUserInfo_FA.ProUserLevelIdRW == 2)) ? false : true;
                    }
                    FunPubGetDetails();
                    btnGo.Enabled = btnClear.Visible = CEDocumentDate.Enabled = false;
                    panBRS.Visible = gvBRS.Visible = btnSave.Visible = btnCancel.Visible = true;
                    ddltype.ClearDropDownList_FA();
                    ddlLocation.Focus();
                }
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    private void FunPriClear()
    {
        try
        {
            ddlLocation.Clear_FA();
            ddlBankName.SelectedIndex = -1;
            txtDocumentDate.Text = (System.DateTime.Now).ToString(strDateFormat);
            ddltype.SelectedIndex = -1;
            btnSave.Visible = btnClear.Visible = gvBRS.Visible = panBRS.Visible = false;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    //protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        FunPriLoadBankDetails();
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}

    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            Session["GridTable"] = null;
            panBRS.Visible = gvBRS.Visible = btnSave.Visible = btnClear.Visible = btnCancel.Visible = true;
            FunPriGetFieldDesc();
            FunProSetinitialRow();
            if (gvBRS != null && gvBRS.FooterRow != null)
            {
                TextBox txtFtrTo = (TextBox)gvBRS.FooterRow.FindControl("txtFTo");
                TextBox txtFtrLength = (TextBox)gvBRS.FooterRow.FindControl("txtFLength");
                txtFtrTo.Enabled = txtFtrLength.Enabled = (Convert.ToInt32(ddltype.SelectedValue) == 13) ? false : true;
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void ddlBankName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            funpribankvalidation();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            objBRS = new FATransactionServiceClient();
            objBRSDtl = new FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatDataTable();
            objBRSRow = objBRSDtl.NewFA_BRS_File_FormatRow();

            if (Session["GridTable"] != null)
            {
                ViewState["GridTable"] = (DataTable)Session["GridTable"];
                Session["GridTable"] = null;
            }

            DataTable dt = (DataTable)ViewState["GridTable"];

            if (dt.Rows.Count < 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Atleast one detail should be added");
                return;
            }
            else
            {
                DataRow[] drCheck = dt.Select("Is_Realisation_Date = 1");
                if (drCheck.Length == 0)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Check Realization date field in the File Format");
                    return;
                }
                else if (drCheck.Length > 1)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Realization checked should not be more than one field.");
                    return;
                }
            }

            //if ((dr = dt.Select("Lookup_description='Debit_Amount'")).Length == 0 || (dr = dt.Select("Lookup_description='Credit_Amount'")).Length == 0 || (dr = dt.Select("Lookup_description='Instrument_NO'")).Length == 0)
            //{

            //    Utility_FA.FunShowAlertMsg_FA(this, "Debit_Amount,Credit_Amount and Instrument_NO columns are mandatory");
            //    return;

            //}
            // Details = dt.FunPubFormXml_FA(true, true);
            Details = gvBRS.FunPubFormXml_FA(true, false);

            objBRSRow.Type = Convert.ToInt32(ddltype.SelectedValue);
            objBRSRow.Details = Details;
            objBRSRow.Company_ID = ObjUserInfo_FA.ProCompanyIdRW.ToString();

            if (strMode == "M" || strMode == "Q")
            {
                objBRSRow.Bank_ID = Convert.ToString(Bank_ID);
                objBRSRow.Location_ID = Convert.ToString(Location_ID);
                objBRSRow.Doc_Date = Utility_FA.StringToDate(txtDocumentDate.Text).ToString();
                objBRSRow.BRS_ID = Convert.ToString(BRSId);
            }
            else
            {
                objBRSRow.Doc_Date = Utility_FA.StringToDate(txtDocumentDate.Text).ToString();
                objBRSRow.Bank_ID = ddlBankName.SelectedValue;
                objBRSRow.Location_ID = ddlLocation.SelectedValue;
                objBRSRow.BRS_ID = "0";
            }

            objBRSRow.Doc_No = txtDocumentNo.Text;
            objBRSRow.Is_Active = (chkActive.Checked == true) ? "1" : "0";

            objBRSDtl.AddFA_BRS_File_FormatRow(objBRSRow);
            string strConnectionName = ObjFASession.ProConnectionName;
            string strDocNo = string.Empty;

            intErrorCode = objBRS.FunPubInsertBRSFileFormat(out strDocNo, SerMode, FAClsPubSerialize.Serialize(objBRSDtl, SerMode), strConnectionName);

            switch (intErrorCode)
            {
                case 0:
                    if (BRSId == 0)
                        FunShowValidationMsgg(this, intErrorCode, strRedirectPageAdd, strRedirectPageView, strMode, false, strDocNo, true);
                    else
                        FunShowValidationMsgg(this, intErrorCode, strRedirectPageAdd, strRedirectPageView, strMode, false, "", false);
                    break;
                case 2:
                    //strMode = "C";
                    FunShowValidationMsgg(this, intErrorCode, strRedirectPageAdd, strRedirectPageView, strMode, false, "", false);
                    break;

                case 3:
                    FunShowValidationMsgg(this, intErrorCode, strRedirectPageAdd, strRedirectPageView, strMode, false, "", false);
                    break;
                case 4:
                    Utility_FA.FunShowValidationMsg_FA(this, intErrorCode);
                    break;
                case 5:
                    Utility_FA.FunShowValidationMsg_FA(this, intErrorCode);
                    break;
                case 8000:
                    Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(strDocNo));
                    break;
                default:
                    Utility_FA.FunShowAlertMsg_FA(this, (Convert.ToString(strDocNo) == "") ? "Due to data problem...Unable to Process Save" : Convert.ToString(strDocNo));
                    //Utility_FA.FunShowAlertMsg_FA(this, "Due to data problem...Unable to Process Save");
                    break;
            }

            //else
            //{
            //    string strAlertMsg = "BRS file format updated successfully";
            //    StringBuilder strMsg = new StringBuilder();
            //    strMsg.Append("alert('" + strAlertMsg + "');");
            //    Response.Redirect("../BRS/FA_BRSFileFormat_View.aspx");
            //    //Utility_FA.FunShowValidationMsg_FA(this.Page, intErrorCode, strRedirectPageAdd, strRedirectPageView, strMode, false, strDocNo, true);
            //}

        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    public static void FunShowValidationMsgg(Page thisPage, int intErrCode, string strRedirectAddPage, string strRedirectViewPage, string strMode, bool blnValReturn, string strToConcatenate, bool IsDocno)
    {
        try
        {
            //StringBuilder strMsg = new StringBuilder();
            string strAlertMsg = "";

            string strMsg = (Convert.ToInt32(intErrCode) == 0 && Convert.ToString(strMode) == "M") ? "File Format Updated Successfully"
                : "File Format Inserted Successfully. Do you want to define another file format";


            if (IsDocno && !string.IsNullOrEmpty(strToConcatenate))
            {
                if (strMsg.Contains("Doc_No"))
                    strMsg = strMsg.Replace("Doc_No", "\"" + strToConcatenate + "\"");
                else
                    strMsg = "\"" + strToConcatenate + "\" " + strMsg;
            }

            if (blnValReturn == false)
            {
                if (!string.IsNullOrEmpty(strRedirectAddPage) && !string.IsNullOrEmpty(strRedirectViewPage) && (strMode == "C" || strMode == ""))
                {
                    strAlertMsg = "if(confirm('" + strMsg.ToString() + "')){" + strRedirectAddPage + "}else {" + strRedirectViewPage + "}";
                }
                else if (!string.IsNullOrEmpty(strRedirectViewPage) && strMode == "M")
                {
                    strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectViewPage;
                }
                else
                {
                    strAlertMsg = "alert('" + strMsg.ToString() + "');";
                }
            }
            else
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');";
            }
            ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strAlertMsg.ToString(), true);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void gvBRS_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddNew")
            {
                TextBox txtFrom = (TextBox)gvBRS.FooterRow.FindControl("txtFFrom");
                TextBox txtTo = (TextBox)gvBRS.FooterRow.FindControl("txtFTo");
                TextBox txtLength = (TextBox)gvBRS.FooterRow.FindControl("txtFLength");
                DropDownList ddlType = (DropDownList)gvBRS.FooterRow.FindControl("ddlFType");
                TextBox txtFtrCreditPrty = (TextBox)gvBRS.FooterRow.FindControl("txtFtrCreditPrty");
                TextBox txtFtrDebitPrty = (TextBox)gvBRS.FooterRow.FindControl("txtFtrDebitPrty");
                CheckBox chkIsRealization = (CheckBox)gvBRS.FooterRow.FindControl("grvFtrchkIsRealization");

                foreach (GridViewRow gr in gvBRS.Rows)
                {
                    Label lblRowlob1 = (Label)gr.FindControl("lblDesc");

                    if (ddlType.SelectedItem.Text.Trim().ToUpper() == lblRowlob1.Text.Trim().ToUpper())
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "select another field description");
                        return;
                    }
                }

                if (Session["GridTable"] != null)
                {
                    ViewState["GridTable"] = (DataTable)Session["GridTable"];
                    Session["GridTable"] = null;
                }

                DataTable dt = (DataTable)ViewState["GridTable"];

                DataRow dr = dt.NewRow();

                dr["ECS_From_Position"] = txtFrom.Text;
                dr["ECS_To_position"] = txtTo.Text;
                dr["ECS_Length"] = txtLength.Text;
                dr["Lookup_Description"] = ddlType.SelectedItem.Text;
                dr["Lookup_Code"] = ddlType.SelectedValue;
                dr["Credit_Priority"] = Convert.ToString(txtFtrCreditPrty.Text).Trim();
                dr["Debit_Priority"] = Convert.ToString(txtFtrDebitPrty.Text).Trim();
                dr["Is_Realisation_Date"] = (chkIsRealization.Checked == true) ? "1" : "0";

                dt.Rows.Add(dr);
                ViewState["GridTable"] = dt;

                gvBRS.DataSource = dt;
                gvBRS.DataBind();

                // FunPriGetFieldDesc();
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void gvBRS_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    }

    protected void gvBRS_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            DataTable dtDelete = new DataTable();

            if (Session["GridTable"] != null)
            {
                dtDelete = (DataTable)Session["GridTable"];
                Session["GridTable"] = null;
            }
            else
                dtDelete = (DataTable)ViewState["GridTable"];

            dtDelete.Rows.RemoveAt(e.RowIndex);
            dtDelete.AcceptChanges();

            ViewState["GridTable"] = dtDelete;

            gvBRS.DataSource = dtDelete;
            gvBRS.DataBind();
            panBRS.Visible = true;
            //gvBRS.Rows.Count = "1";
            gvBRS.FooterRow.Visible = true;

            if (gvBRS.Rows.Count == 0)
            {
                FunProSetinitialRow();
            }
            FunPriGetFieldDesc();
            foreach (System.Web.UI.WebControls.ListItem lstItem in lstCollection)
            {
                DropDownList ddlFType = gvBRS.FooterRow.FindControl("ddlFType") as DropDownList;
                if (ddlFType.Items.Contains(lstItem))
                {
                    ddlFType.Items.Remove(lstItem);
                }
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage, false);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void gvBRS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            DataTable dt = (DataTable)ViewState["GridTable"];

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                TextBox txtFFrom = e.Row.FindControl("txtFFrom") as TextBox;
                TextBox txtTo = e.Row.FindControl("txtFTo") as TextBox;
                TextBox txtLen = e.Row.FindControl("txtFLength") as TextBox;
                Button btnAdd = e.Row.FindControl("btnAddrow") as Button;
                DropDownList ddlFType = e.Row.FindControl("ddlFType") as DropDownList;
                CheckBox chkIsRealization = e.Row.FindControl("grvFtrchkIsRealization") as CheckBox;

                Procparam.Clear();
                Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());

                //if (PageMode == PageModes.Create)
                //{
                ddlFType.BindDataTable_FA("FA_Get_BRSFieldDesc", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });
                // }
                foreach (System.Web.UI.WebControls.ListItem lstItem in lstCollection)
                {
                    if (ddlFType.Items.Contains(lstItem))
                    {
                        ddlFType.Items.Remove(lstItem);
                    }
                }

                if (BRSId > 0 && strMode == "Q")
                {
                    btnAdd.Enabled = ddlFType.Enabled = false;
                }

                txtLen.Attributes.Add("readonly", "readonly");
                ddlFType.Attributes.Add("onchange", "javascript:fnEnableDisableRealisation('" + ddlFType.ClientID + "','" + chkIsRealization.ClientID + "')");
                if (dt != null)
                {
                    if (dt.Rows.Count == 0)
                    {
                        txtFFrom.Text = "1";
                        btnAdd.OnClientClick = "javascript:return FunCheckForOverlap('1','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','0', '" + ddlFType.ClientID + "', '" + ddltype.ClientID + "');";
                        //if (Convert.ToInt32(ddltype.SelectedValue) == 14)
                        //{
                        //    txtTo.Attributes.Add("onfocusout", "javascript:FunCheckForOverlap('1','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','0');");
                        //    txtFFrom.Attributes.Add("onblur", "javascript:FunCheckForOverlap('2','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','0');");
                        //}
                    }
                    else
                    {
                        txtFFrom.Text = (Convert.ToInt32(ddltype.SelectedValue) == 13)
                            ? (Convert.ToInt32(Convert.ToString(dt.Rows[dt.Rows.Count - 1]["ECS_From_Position"])) + 1).ToString()
                            : (Convert.ToInt32(Convert.ToString(dt.Rows[dt.Rows.Count - 1]["ECS_To_position"])) + 1).ToString();

                        btnAdd.OnClientClick = "javascript:return FunCheckForOverlap('2','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','" + Convert.ToString(dt.Rows[dt.Rows.Count - 1]["ECS_To_position"]) + "', '" + ddlFType.ClientID + "', '" + ddltype.ClientID + "');";

                        //if (Convert.ToInt32(ddltype.SelectedValue) == 14)
                        //{
                        //    txtTo.Attributes.Add("onfocusout", "javascript:FunCheckForOverlap('1','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','" + Convert.ToString(dt.Rows[dt.Rows.Count - 1]["ECS_To_position"]) + "');");
                        //    txtFFrom.Attributes.Add("onblur", "javascript:FunCheckForOverlap('2','" + txtFFrom.ClientID + "','" + txtTo.ClientID + "','" + txtLen.ClientID + "','" + Convert.ToString(dt.Rows[dt.Rows.Count - 1]["ECS_To_position"]) + "');");
                        //}
                    }
                }
                txtFFrom.Focus();
                txtFFrom.ReadOnly = true;
                txtTo.Enabled = (Convert.ToInt32(ddltype.SelectedValue) == 13) ? false : true;
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button Ltnbtn = e.Row.FindControl("btnRemove") as Button;
                CheckBox cbxgvIsMandatory = e.Row.FindControl("cbxgvIsMandatory") as CheckBox;
                Label lblDesc1 = e.Row.FindControl("lblDesc") as Label;
                Label lblCode1 = e.Row.FindControl("lblCode1") as Label;
                TextBox txtDebitPrty = e.Row.FindControl("txtDebitPrty") as TextBox;
                TextBox txtCreditPrty = e.Row.FindControl("txtCreditPrty") as TextBox;
                CheckBox chkIsRealization = e.Row.FindControl("grvItmchkIsRealization") as CheckBox;
                if (dt != null && e.Row.RowIndex != dt.Rows.Count - 1)
                {
                    Ltnbtn.Visible = false;
                }
                System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(lblDesc1.Text, lblCode1.Text);
                lstCollection.Add(lstItem);
                if (strMode == "Q")
                {
                    cbxgvIsMandatory.Enabled = false;
                    txtCreditPrty.ReadOnly = txtDebitPrty.ReadOnly = true;
                }

                chkIsRealization.Enabled = (lblCode1.Text == "2" || lblCode1.Text == "5" || lblCode1.Text == "10") ? true : false;
                chkIsRealization.Attributes.Add("onclick", "javascript:fnUpdateRealisation('" + chkIsRealization.ClientID + "','" + Convert.ToString(lblCode1.Text) + "')");
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        FunPriClear();
    }

    protected void cbxgvIsMandatory_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            string strSelectID = ((CheckBox)sender).ClientID;
            int _iRowIdx = Utility_FA.FunPubGetGridRowID("gvBRS", strSelectID);

            CheckBox cbxgvIsMandatory = (CheckBox)gvBRS.Rows[_iRowIdx].FindControl("cbxgvIsMandatory");

            DataTable dtFormat = (DataTable)ViewState["GridTable"];
            dtFormat.Rows[_iRowIdx]["Is_Mandatory"] = (cbxgvIsMandatory.Checked == true) ? "1" : "0";
            dtFormat.AcceptChanges();
            ViewState["GridTable"] = dtFormat;
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, "BRS File Format", "FA");
        }
    }

    protected void txtDebitPrty_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtDebitPrty = (TextBox)sender;
            GridViewRow gvRow = (GridViewRow)txtDebitPrty.Parent.Parent;
            int iRowIdx = gvRow.RowIndex;

            DataTable dtFormat = (DataTable)ViewState["GridTable"];
            dtFormat.Rows[iRowIdx]["Debit_Priority"] = Convert.ToString(txtDebitPrty.Text);
            dtFormat.AcceptChanges();
            ViewState["GridTable"] = dtFormat;
        }
        catch (Exception objException)
        {
        }
    }

    protected void txtCreditPrty_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtCreditPrty = (TextBox)sender;
            GridViewRow gvRow = (GridViewRow)txtCreditPrty.Parent.Parent;
            int iRowIdx = gvRow.RowIndex;

            DataTable dtFormat = (DataTable)ViewState["GridTable"];
            dtFormat.Rows[iRowIdx]["Credit_Priority"] = Convert.ToString(txtCreditPrty.Text);
            dtFormat.AcceptChanges();
            ViewState["GridTable"] = dtFormat;
        }
        catch (Exception objException)
        {
        }
    }

    private void FunPriLoadBankDetails()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            dtBankList = Utility_FA.GetDefaultData(SPNames.Get_BankDetail_Receipt, Procparam);
            ViewState["vs_BankList"] = dtBankList;
            ddlBankName.BindDataTable_FA(dtBankList, "Bank_Detail_ID", "Bank_Name");

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPubGetDetails()
    {
        try
        {
            string chk = string.Empty;
            DataTable dt = new DataTable();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@BRS_ID", BRSId.ToString());
            Procparam.Add("@Bank_ID", ddlBankName.SelectedValue);
            Procparam.Add("@Loc_ID", ddlLocation.SelectedValue);

            DataSet ds = Utility_FA.GetDataset("FA_BRS_FileForm", Procparam);
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlLocation.SelectedText = ds.Tables[0].Rows[0]["Location_Name"].ToString();
                Location_ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Location_ID"].ToString());
                ListItem Li = new ListItem(ds.Tables[0].Rows[0]["Bank_Name"].ToString(), ds.Tables[0].Rows[0]["Bank_Name"].ToString());
                ddlBankName.Items.Add(Li);
                Bank_ID = Convert.ToInt32(ds.Tables[0].Rows[0]["Bank_ID"]);
                txtDocumentNo.Text = ds.Tables[0].Rows[0]["BRS_Format_No"].ToString();
                txtDocumentDate.Text = ds.Tables[0].Rows[0]["BRS_Format_Date"].ToString();
                ddltype.ClearSelection();
                ddltype.Items.FindByText(ds.Tables[0].Rows[0]["type"].ToString()).Selected = true;
                chk = ds.Tables[0].Rows[0]["Is_Active"].ToString();

                if (chk == "True")
                {
                    chkActive.Checked = true;
                }
            }
            dt = ds.Tables[1];
            ViewState["GridTable"] = dt;
            gvBRS.DataSource = ds.Tables[1];
            gvBRS.DataBind();
            //FunPriGetFieldDesc();
            if (strMode == "Q")
            {
                for (int i = 0; i <= gvBRS.Rows.Count - 1; i++)
                {
                    Button btnRemove = (Button)gvBRS.Rows[i].FindControl("btnRemove") as Button;
                    btnRemove.Visible = false;
                }
                //if (strMode == "Q")
                //{
                gvBRS.FooterRow.Visible = false;
                //}
            }

            //if (dt.Rows.Count == 10)
            //{
            //    for (int i = 10; i <= 11; i++)
            //    {
            //        DropDownList ddlFType = gvBRS.FooterRow.FindControl("ddlFType") as DropDownList;
            //        ddlFType.ClearDropDownList_FA();
            //    }
            //}

            ddlLocation.ReadOnly = txtDocumentDate.ReadOnly = true;
            ddlBankName.Enabled = false;

        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetFieldDesc()
    {
        try
        {
            Procparam.Clear();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());

            DropDownList ddlFType = gvBRS.FooterRow.FindControl("ddlFType") as DropDownList;
            ddlFType.BindDataTable_FA("FA_Get_BRSFieldDesc", Procparam, new string[] { "Lookup_Code", "Lookup_Description" });
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void FunProSetinitialRow()
    {
        try
        {
            DataTable dt = new DataTable();
            DataRow dr;

            dt.Columns.Add("ECS_From_Position");
            dt.Columns.Add("ECS_To_position");
            dt.Columns.Add("ECS_Length");
            dt.Columns.Add("Lookup_Description");
            dt.Columns.Add("Lookup_Code");
            //dt.Columns.Add("Is_Mandatory");
            dt.Columns.Add("Credit_Priority");
            dt.Columns.Add("Debit_Priority");
            dt.Columns.Add("Is_Realisation_Date");

            dr = dt.NewRow();

            dr["ECS_From_Position"] = string.Empty;
            dr["ECS_To_position"] = string.Empty;
            dr["ECS_Length"] = string.Empty;
            dr["Lookup_Description"] = string.Empty;
            dr["Lookup_Code"] = string.Empty;
            //dr["Is_Mandatory"] = "0";
            dr["Credit_Priority"] = string.Empty;
            dr["Debit_Priority"] = string.Empty;
            dr["Is_Realisation_Date"] = string.Empty;

            dt.Rows.Add(dr);

            gvBRS.DataSource = dt;
            ViewState["GridTable"] = dt.Copy();
            ((DataTable)ViewState["GridTable"]).Rows.RemoveAt(0);
            gvBRS.DataBind();
            gvBRS.Rows[0].Visible = false;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void funpribankvalidation()
    {
        try
        {
            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            //Procparam.Add("@Bank_ID", ddlBankName.SelectedValue);
            //if (Convert.ToInt32(ddlLocation.SelectedValue) > 0 && Convert.ToString(ddlLocation.SelectedText) != "")
            //    Procparam.Add("@Location_ID", Convert.ToString(ddlLocation.SelectedValue));
            //dtBankList = Utility_FA.GetDefaultData("FA_BRS_FormatBankValidation", Procparam);
            //Procparam.Clear();

            //if (dtBankList != null && dtBankList.Rows.Count > 0)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "File Format already exists for the selected bank");
            //    FunPriClear();
            //}
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void Funpribindtype()
    {
        try
        {
            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            dictparam.Add("@company_id", intCompanyID.ToString());
            ddltype.BindDataTable_FA("FA_Get_BRSFormatType", dictparam, new string[] { "ID", "Name" });
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

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
        Procparam.Add("@Program_Id", "100");
        Procparam.Add("@Is_Operational", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_Loca_List_AGT", Procparam));

        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod()]
    public static void WMtdUpdateFormat(String strValue, Int32 intRowID)
    {
        DataTable dtFormat = new DataTable();
        if (obj_Page.Session["GridTable"] != null)
            dtFormat = (DataTable)obj_Page.Session["GridTable"];
        else
            dtFormat = (DataTable)obj_Page.ViewState["GridTable"];
        DataRow[] drPymnt = dtFormat.Select("Lookup_Code = '" + Convert.ToString(intRowID) + "'");
        if (drPymnt.Length > 0)
            drPymnt[0]["Is_Realisation_Date"] = strValue;
        dtFormat.AcceptChanges();
        obj_Page.Session["GridTable"] = dtFormat;
    }

    protected void ddlLocation_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt64(ddlBankName.SelectedValue) > 0)
                funpribankvalidation();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}