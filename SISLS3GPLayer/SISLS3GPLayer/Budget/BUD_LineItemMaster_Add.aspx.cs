#region Page Header

/// <Program Summary>
/// Module Name			: Budget 
/// Screen Name			: Line Item Master View
/// Created By			: Deepika .K
/// Created Date		: 18-Nov-2019
/// Purpose	            : Budget Module
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using FA_BusEntity;
using FA_DALayer;
using FA_BusEntity;
using System.Text;
using System.Web.Security;

public partial class Budget_BUD_LineItemMaster_Add : ApplyThemeForProject_FA
{
    string strRedirectPageView = "~/Budget/BUD_LineItemMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/BUD_LineItemMaster_Add.aspx";
    string strKey = "Insert";
    string strMode = "";
    string strProgramName = string.Empty;
    string StrConnectionName = string.Empty;
    public string strDateFormat;                                                // to maintain the standard format
    static string strPageName = "";
    int intUserID = 0;                                                          // user who signed in
    int intCompanyID = 0;
    int intLineItemId = 0;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    S3GSession ObjS3GSession = new S3GSession();
    UserInfo ObjUserInfo;
    UserInfo_FA ObjUserInfo_FA;
    Dictionary<string, string> Procparam;
    //BudgetServiceReference.BudgetMasterClient objBudgetService;
    BudgetServiceReference.BudgetMasterClient objBudgetService;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable objLIDataTable = null;
    FASerializationMode SerMode = FASerializationMode.Binary;
    FormsAuthenticationTicket fromTicket;
    FASession objFASession;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            # region User Information
            ObjUserInfo_FA = new UserInfo_FA();


            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;                                  // current user's company ID.
            intUserID = ObjUserInfo_FA.ProUserIdRW;                                        // current user's ID

            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();
            System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = intUserID.ToString();

            #endregion

            strDateFormat = ObjS3GSession.ProDateFormatRW;                              // to get the standard date format of the Application

            if (!IsPostBack)
            {
                bCreate = ObjUserInfo_FA.ProCreateRW;
                bModify = ObjUserInfo_FA.ProModifyRW;
                bQuery = ObjUserInfo_FA.ProViewRW;
                strPageName = "Budget Line Item Master";
                funPubInitializedt();
                //lblHeading.Text = "Budget Line Item Master - Create";
                funPubBindDropdowns();


                if (Request.QueryString.Get("qsmasterId") != null)
                {
                    fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                    intLineItemId = Convert.ToInt32(fromTicket.Name);
                    strPageName = strPageName + " - Modify";
                }
                else
                {
                    strPageName = strPageName + " - Create";
                }
                lblHeading.Text = strPageName;
                if (Request.QueryString["qsMode"] != null)
                    strMode = Convert.ToString(Request.QueryString["qsMode"]);

                if (((intLineItemId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intLineItemId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriDisableControls(0);
                }
                ddlItemHeader.Focus();
            }


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }
    public void funPubBindFooterDropdown()
    {
        try
        {
            DropDownList ddlLineItem = (DropDownList)grvLineItem.FooterRow.FindControl("ddlLineItem");
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Option", "1");

            DataSet dsData = new DataSet();

            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

            if (dsData.Tables[0].Rows.Count > 0)
            {
                ddlLineItem.Items.Clear();
                ddlLineItem.DataSource = dsData.Tables[0];
                ddlLineItem.DataTextField = "description";
                ddlLineItem.DataValueField = "value";
                ddlLineItem.DataBind();
            }
            ddlLineItem.Items.Insert(0, "--Select--");
        }
        catch (Exception ex)
        {
           // FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    public void funPubBindDropdowns()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());

            DataSet dsData = new DataSet();

            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

            if (dsData.Tables.Count > 0)
            {
                if (dsData.Tables[0].Rows.Count > 0)
                {
                    ddlItemHeader.Items.Clear();
                    ddlItemHeader.DataSource = dsData.Tables[0];
                    ddlItemHeader.DataTextField = "lookup_desc";
                    ddlItemHeader.DataValueField = "lookup_code";
                    ddlItemHeader.DataBind();
                }
                ddlItemHeader.Items.Insert(0, "--Select--");

                if (dsData.Tables[1].Rows.Count > 0)
                {
                    ddlAccountNature.Items.Clear();
                    ddlAccountNature.DataSource = dsData.Tables[1];
                    ddlAccountNature.DataTextField = "lookup_desc";
                    ddlAccountNature.DataValueField = "lookup_code";
                    ddlAccountNature.DataBind();
                }
                ddlAccountNature.Items.Insert(0, "--Select--");
                funPubBindFooterDropdown();
            }
        }
        catch (Exception ex)
        {
            //FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DataTable dtVS = (DataTable)ViewState["dtLineItems"];
            if (dtVS.Rows.Count > 0)
            {
                if (dtVS.Rows[0][0].ToString() == "0")
                {
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10057);
                    //Utility_FA.FunShowAlertMsg_FA(this, "Add Line Item.");
                    return;
                }
            }
            //funPubInitializedt();
            objLIDataTable = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable();
            FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTRow objDataRow;
            objDataRow = objLIDataTable.NewFA_BUD_LINEITEM_MSTRow();
            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intLineItemId = Convert.ToInt32(fromTicket.Name);
                objDataRow.LINEITEMMST_ID = intLineItemId;
            }
            else
                objDataRow.LINEITEMMST_ID = 0;
            objDataRow.COMPANY_ID = intCompanyID;
            objDataRow.ITEM_HDR_ID = Convert.ToInt32(ddlItemHeader.SelectedValue);
            objDataRow.ACCOUNT_NATURE_ID = Convert.ToInt32(ddlAccountNature.SelectedValue);
            objDataRow.USER_ID = intUserID;
            if (ChkbxStatus.Checked)
            {
                objDataRow.IS_ACTIVE = 1;
            }
            else
                objDataRow.IS_ACTIVE = 0;

            //StringBuilder strXMLLineItems = new StringBuilder();
            ////((DataTable)ViewState["dtLineItems"]).FunPubFormXml(true);
            //strXMLLineItems.Append("<Root>");
            //foreach (GridViewRow item in grvLineItem.Rows)
            //{
            //    if (item.RowType == DataControlRowType.DataRow)
            //    {
            //        //CheckBox chk = (item.FindControl("chkbxSelect") as CheckBox);
            //        Label lblIsEnabled = (item.FindControl("lblIsEnabled") as Label);
            //        Label lblSNO = (item.FindControl("lblSNO") as Label);
            //        Label lblLineItemId = (item.FindControl("lblLineItemId") as Label);
            //        Label lblEffFrom = (item.FindControl("lblEffFrom") as Label);
            //        Label lblEffTo = (item.FindControl("lblEffTo") as Label);
            //        strXMLLineItems.Append("<Details Id='" + lblSNO.Text + "' LineItemId = '" + lblLineItemId.Text + "' SubLineItemApplicable='" + lblIsEnabled.Text + "'" +
            //        " EffectiveFrom='" + Utility_FA.StringToDate(lblEffFrom.Text).ToString() + "' EffectiveTo='" + Utility_FA.StringToDate(lblEffTo.Text).ToString() + "' />");

            //    }
            //}
            //strXMLLineItems.Append("</Root>");

            //if (Convert.ToString(strXMLLineItems) != "<Root></Root>")
            //{
            //    objDataRow.Xml_LineItemDTLS = Convert.ToString(strXMLLineItems);
            //}
            //else
            //{
            //    objDataRow.Xml_LineItemDTLS = "";
            //}

            objDataRow.Xml_LineItemDTLS = ((DataTable)ViewState["dtLineItems"]).FunPubFormXml(true);

            objLIDataTable.AddFA_BUD_LINEITEM_MSTRow(objDataRow);

            int errorCode = 0;
            objBudgetService = new BudgetServiceReference.BudgetMasterClient();
            objFASession = new FASession();
            StrConnectionName = objFASession.ProConnectionName;
            errorCode = objBudgetService.FunPubCreateLineItem(SerMode, FAClsPubSerialize.Serialize(objLIDataTable, SerMode), StrConnectionName);
            if (errorCode == 0)
            {
                Utility_FA.FunSaveConfirmAlertMsg(this, "Success!", Resources.ErrorHandlingAndValidation._10052, "Do you want to create another line item?", "BUD_LineItemMaster_Add.aspx", "BUD_LineItemMaster_View.aspx");
            }
            else if (errorCode == 10)
            {
                Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", Resources.ErrorHandlingAndValidation._10053, "BUD_LineItemMaster_View.aspx");
            }
            else if (errorCode == 11)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10058);
            }
            else
            {
                if (errorCode == 50)
                {
                    //  ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('basic','Combination already exists','warning');", true);
                    Utility_FA.FunAlertMsg(this.Page, "Error", "Alert", Resources.ErrorHandlingAndValidation._10051);
                    //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10051);
                }
            }
        }

        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10051);
            Utility_FA.FunAlertMsg(this.Page, "Error", "Alert", Resources.ErrorHandlingAndValidation._10051);
        }

    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("BUD_LineItemMaster_Add.aspx");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnExit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageView, false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvLineItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.ToString() == "Add")
            {

            }
            //if (e.CommandName.ToString() == "Modify")
            //{
            //    int sno=Convert.ToInt32(e.CommandArgument);
            //    DataTable dtLineItem = (DataTable)ViewState["dtLineItems"];
            //    DataRow[] rows = dtLineItem.Select("SNO="+sno);
            //    foreach(DataRow dr in rows)
            //    {
            //        dtLineItem.Rows.Remove(dr);
            //    }
            //    ViewState["dtLineItems"] = dtLineItem;
            //}
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    public void funPubInitializedt()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SNO");
            dt.Columns.Add("LineItemId");
            dt.Columns.Add("LineItem");
            dt.Columns.Add("SubLineEnable");
            dt.Columns.Add("EffectiveFrom");
            dt.Columns.Add("EffectiveTo");
            dt.Columns.Add("EffectiveFrom1");
            dt.Columns.Add("EffectiveTo1");

            DataRow drItem = dt.NewRow();
            drItem.BeginEdit();
            drItem["SNO"] = 0;
            drItem["LineItemId"] = "0";
            drItem["LineItem"] = "";
            drItem["SubLineEnable"] = "0";
            drItem["EffectiveFrom"] = "";
            drItem["EffectiveTo"] = "";
            drItem["EffectiveFrom1"] = "";
            drItem["EffectiveTo1"] = "";
            drItem.EndEdit();

            dt.Rows.Add(drItem);
            grvLineItem.DataSource = dt;
            grvLineItem.DataBind();
            ViewState["dtLineItems"] = dt;
            grvLineItem.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    protected void grvLineItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                TextBox txtFEffFrom = (TextBox)e.Row.FindControl("txtFEffFrom");
                AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("CEFEffFrom");
                txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',false,  true);");
                CEFEffFrom.Format = strDateFormat;

                TextBox txtFEffTo = (TextBox)e.Row.FindControl("txtFEffTo");
                AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)e.Row.FindControl("CEFEffTo");
                txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "', false, true);");
                CEFEffTo.Format = strDateFormat;
            }
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != grvLineItem.EditIndex)
            {
                Label lblIsEnabled = (Label)e.Row.FindControl("lblIsEnabled");
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                Label lblStatusDet = (Label)e.Row.FindControl("lblStatusDet");
                CheckBox chkbxISLItem = (CheckBox)e.Row.FindControl("chkbxISLItem");

                if (lblIsEnabled.Text == "1")
                {
                    chkbxISLItem.Checked = true;
                }
                else
                    chkbxISLItem.Checked = false;
            }
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList ddlELineItem = (DropDownList)e.Row.FindControl("ddlELineItem");
                Label lblELineItemId = (Label)e.Row.FindControl("lblELineItemId");

                Procparam = new Dictionary<string, string>();
                if (Procparam != null)
                    Procparam.Clear();

                Procparam.Add("@Company_ID", intCompanyID.ToString());
                Procparam.Add("@Option", "1");

                DataSet dsData = new DataSet();

                dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

                if (dsData.Tables[0].Rows.Count > 0)
                {
                    ddlELineItem.DataSource = dsData.Tables[0];
                    ddlELineItem.DataTextField = "description";
                    ddlELineItem.DataValueField = "value";
                    ddlELineItem.DataBind();
                }
                ddlELineItem.Items.FindByValue(lblELineItemId.Text).Selected = true;

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }



    protected void grvLineItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            grvLineItem.EditIndex = e.NewEditIndex;
            int intEditIndex = 0;
            intEditIndex = e.NewEditIndex;
            funPriBindGrid();

            TextBox txtEEffFrom = (TextBox)grvLineItem.Rows[intEditIndex].FindControl("txtEEffFrom");
            AjaxControlToolkit.CalendarExtender CEEEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.Rows[intEditIndex].FindControl("CEEEffFrom");
            txtEEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffFrom.ClientID + "','" + strDateFormat + "',false,  true);");
            CEEEffFrom.Format = strDateFormat;

            TextBox txtEEffTo = (TextBox)grvLineItem.Rows[intEditIndex].FindControl("txtEEffTo");
            AjaxControlToolkit.CalendarExtender CEEEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.Rows[intEditIndex].FindControl("CEEEffTo");
            txtEEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffTo.ClientID + "','" + strDateFormat + "',false,  true);");
            CEEEffTo.Format = strDateFormat;
            funPubBindFooterDropdown();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    private void funPriBindGrid()
    {
        try
        {
            DataTable dt = (DataTable)ViewState["dtLineItems"];
            if (dt.Rows.Count > 0)
            {
                grvLineItem.DataSource = dt;
                grvLineItem.DataBind();
            }
            else
            {
                funPubInitializedt();
            }

            TextBox txtFEffFrom = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffFrom");
            AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffFrom");
            txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "', false, true);");
            CEFEffFrom.Format = strDateFormat;

            TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
            AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
            txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "', false,  true);");
            CEFEffTo.Format = strDateFormat;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void grvLineItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       
    }
    protected void grvLineItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            grvLineItem.EditIndex = -1;
            funPriBindGrid();
        }
        catch(Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    public void FunPubLoadLineItem()
    {
        try
        {
            DataSet dsLineItem = new DataSet();
            if (Procparam != null)
                Procparam.Clear();


            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@LineItem_ID", intLineItemId.ToString());

            dsLineItem = Utility_FA.GetDataset("BUD_GET_LINEITEMDETAILS", Procparam);
            if (dsLineItem.Tables.Count > 0)
            {
                if (dsLineItem.Tables[0].Rows.Count > 0)
                {
                    ddlAccountNature.SelectedValue = dsLineItem.Tables[0].Rows[0]["account_nature_id"].ToString();
                    ddlItemHeader.SelectedValue = dsLineItem.Tables[0].Rows[0]["item_hdr_id"].ToString();
                    if (dsLineItem.Tables[0].Rows[0]["Is_Active"].ToString() == "1")
                    {
                        ChkbxStatus.Checked = true;
                    }
                    else
                        ChkbxStatus.Checked = false;
                }
                if (dsLineItem.Tables[1].Rows.Count > 0)
                {
                    ViewState["dtLineItems"] = dsLineItem.Tables[1];
                    grvLineItem.DataSource = (DataTable)ViewState["dtLineItems"];
                    grvLineItem.DataBind();
                    funPubBindFooterDropdown();
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                    }

                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        btnSave.Enabled_False();
                    }
                    ddlAccountNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    ChkbxStatus.Disabled = false;
                    FunPubLoadLineItem();
                    btnClear.Enabled_False();

                    break;

                case -1:// Query Mode
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageAdd);
                    }
                    FunPubLoadLineItem();
                    btnSave.Enabled_False();
                    btnClear.Enabled_False();
                    ddlAccountNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    ChkbxStatus.Disabled = true;
                    foreach (GridViewRow gr in grvLineItem.Rows)
                    {
                        CheckBox chkbxISLItem = (CheckBox)gr.FindControl("chkbxISLItem");
                        ImageButton imgbtnModify = (ImageButton)gr.FindControl("imgbtnModify");
                        chkbxISLItem.Enabled = false;
                        imgbtnModify.Enabled = false;
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    grvLineItem.FooterRow.Visible = false;
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (ddlItemHeader.SelectedValue == "0" || ddlItemHeader.SelectedValue == "--Select--")
            {
                // Utility_FA.FunShowAlertMsg_FA(this, "Select Item Header.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10059);
                return;
            }
            if (ddlAccountNature.SelectedValue == "0" || ddlAccountNature.SelectedValue == "--Select--")
            {
                // Utility_FA.FunShowAlertMsg_FA(this, "Select Account Nature.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10060);
                return;
            }


            CheckBox chkbxIsEnable = (CheckBox)grvLineItem.FooterRow.FindControl("chkbxFSLItem");
            DropDownList ddlLineItem = (DropDownList)grvLineItem.FooterRow.FindControl("ddlLineItem");
            TextBox txtFEffFrom = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffFrom");
            TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
            DataTable dtLineItems = new DataTable();

            if (txtFEffFrom.Text.Trim() == "")
            {
                // Utility_FA.FunShowAlertMsg_FA(this, "Select Effective from date.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10061);
                return;
            }
            if (txtFEffTo.Text.Trim() == "")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Effective to date.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10062);
                return;
            }
            if (ddlLineItem.SelectedValue == "0" || ddlLineItem.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Account group.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10063);
                return;
            }
            if (txtFEffFrom.Text.Trim() != "" && txtFEffTo.Text.Trim() != "")
            {
                if (Utility_FA.StringToDate(txtFEffFrom.Text.Trim()) > Utility_FA.StringToDate(txtFEffTo.Text.Trim()))
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Effective to date should be greater than Effective from date.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10064);
                    return;
                }
            }
            if (ViewState["dtLineItems"] == null)
            {
                funPubInitializedt();
            }
            else
            {
                dtLineItems = (DataTable)ViewState["dtLineItems"];
                DataRow[] drRows = dtLineItems.Select("LineItemId='" + ddlLineItem.SelectedValue.ToString() + "'");
                if (drRows.Length > 0)
                {

                    //    for (int i = 0; i < drRows.Length; i++)
                    //    {
                    //        if (Utility_FA.StringToDate(drRows[i]["EffectiveFrom"].ToString()) < Utility_FA.StringToDate(txtFEffFrom.Text) &&
                    //            Utility_FA.StringToDate(drRows[i]["EffectiveTo"].ToString()) > Utility_FA.StringToDate(txtFEffTo.Text))
                    //        {
                    // Utility_FA.FunShowAlertMsg_FA(this, "Selected Line Item already exists.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10065);
                    return;
                    //    }
                    //}
                }


                DataRow drItem = dtLineItems.NewRow();

                int sno = 0;
                if (dtLineItems.Rows.Count > 0)
                {
                    if (dtLineItems.Rows[0][0].ToString() == "0" || dtLineItems.Rows[0][0].ToString() == "")
                    {
                        dtLineItems.Rows.RemoveAt(0);
                    }
                    sno = dtLineItems.Rows.Count + 1;
                }
                drItem.BeginEdit();
                drItem["SNO"] = sno;
                if (chkbxIsEnable.Checked)
                {
                    drItem["SubLineEnable"] = "1";
                }
                else
                    drItem["SubLineEnable"] = "0";

                drItem["EffectiveFrom"] = txtFEffFrom.Text.Trim();
                drItem["EffectiveTo"] = txtFEffTo.Text.Trim();
                drItem["EffectiveFrom1"] = Utility_FA.StringToDate(txtFEffFrom.Text.Trim()).ToString();
                drItem["EffectiveTo1"] = Utility_FA.StringToDate(txtFEffTo.Text.Trim()).ToString();
                if (ddlLineItem.SelectedValue.ToString() != "0")
                {
                    drItem["LineItemId"] = ddlLineItem.SelectedValue.ToString();
                    drItem["LineItem"] = ddlLineItem.SelectedItem.Text.ToUpper();
                }
                else
                {
                    drItem["LineItemId"] = "0";
                    drItem["LineItem"] = "";
                }

                drItem.EndEdit();
                dtLineItems.Rows.Add(drItem);

                grvLineItem.DataSource = dtLineItems;
                ViewState["dtLineItems"] = dtLineItems;
                grvLineItem.DataBind();

                funPubBindFooterDropdown();

                AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffFrom");
                txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',false,  false);");
                CEFEffFrom.Format = strDateFormat;


                AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
                txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "',false,  true);");
                CEFEffTo.Format = strDateFormat;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnUpdate_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (ViewState["dtLineItems"] == null)
            {
                funPubInitializedt();
            }
            else
            {
                GridViewRow row = grvLineItem.Rows[grvLineItem.EditIndex];

                TextBox txtEEffFrom = (TextBox)row.FindControl("txtEEffFrom");
                TextBox txtEEffTo = (TextBox)row.FindControl("txtEEffTo");
                DropDownList ddlELineItem = (DropDownList)row.FindControl("ddlELineItem");
                CheckBox chkbxESLItem = (CheckBox)row.FindControl("chkbxESLItem");
                Label lblESNO = (Label)row.FindControl("lblESNO");
                //int IEditIndex = 0;
                //IEditIndex = e.RowIndex;
                DataTable dt = (DataTable)ViewState["dtLineItems"];
                DataRow[] drRows = dt.Select("LineItemId='" + ddlELineItem.SelectedValue.ToString() + "'");
                if (drRows.Length > 0)
                {
                    if (Convert.ToString(ddlELineItem.SelectedValue) == drRows[0]["LineItemId"].ToString() &&
                        lblESNO.Text != drRows[0]["SNO"].ToString())
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this, "Selected Line Item already exists.");
                        Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10065);
                        return;
                    }
                }
                if (ddlELineItem.SelectedValue == "0" || ddlELineItem.SelectedValue == "--Select--")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Select Account group.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10063);
                    return;
                }
                if (txtEEffFrom.Text.Trim() == "")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Select Effective from date.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10061);
                    return;
                }
                if (txtEEffTo.Text.Trim() == "")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Select Effective to date.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10062);
                    return;
                }

                if (txtEEffFrom.Text.Trim() != "" && txtEEffTo.Text.Trim() != "")
                {
                    if (Utility_FA.StringToDate(txtEEffFrom.Text.Trim()) > Utility_FA.StringToDate(txtEEffTo.Text.Trim()))
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this, "Effective to date should be greater than Effective from date.");
                        Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10064);
                        return;
                    }
                }

                DataRow dr = dt.Rows[grvLineItem.EditIndex];

                if (chkbxESLItem.Checked)
                {
                    dr["SubLineEnable"] = "1";
                }
                else
                    dr["SubLineEnable"] = "0";

                dr["EffectiveFrom"] = txtEEffFrom.Text;
                dr["EffectiveTo"] = txtEEffTo.Text;

                dr["EffectiveFrom1"] = Utility_FA.StringToDate(txtEEffFrom.Text.Trim()).ToString();
                dr["EffectiveTo1"] = Utility_FA.StringToDate(txtEEffTo.Text.Trim()).ToString();

                if (ddlELineItem.SelectedValue.ToString() != "0")
                {
                    dr["LineItem"] = ddlELineItem.SelectedItem.Text.ToUpper();
                    dr["LineItemId"] = ddlELineItem.SelectedValue.ToString();
                }
                else
                {
                    dr["LineItem"] = "";
                    dr["LineItemId"] = "0";
                }

                dt.AcceptChanges();

                grvLineItem.EditIndex = -1;
                grvLineItem.DataSource = dt;
                ViewState["dtLineItems"] = dt;
                grvLineItem.DataBind();
            }
            funPubBindFooterDropdown();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void btnCancel_ServerClick(object sender, EventArgs e)
    {
        try
        {
            grvLineItem.EditIndex = -1;
            funPriBindGrid();
            funPubBindFooterDropdown();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
}