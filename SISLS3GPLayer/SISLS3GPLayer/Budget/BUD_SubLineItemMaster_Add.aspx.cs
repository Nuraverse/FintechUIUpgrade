#region Page Header

/// <Program Summary>
/// Module Name			: Budget 
/// Screen Name			: Line Item Master Add
/// Created By			: Deepika .K
/// Created Date		: 22-Nov-2019
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

public partial class Budget_BUD_SubLineItemMaster_Add : ApplyThemeForProject_FA
{
    string strRedirectPageView = "~/Budget/BUD_SubLineItemMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/BUD_SubLineItemMaster_Add.aspx";
    //string strRedirectPageView = "window.location.href='../Budget/BUD_SubLineItemMaster_View.aspx';";
    //string strRedirectPageAdd = "window.location.href='../Budget/BUD_SubLineItemMaster_Add.aspx';";
    string strKey = "Insert";
    string strMode = "";
    string strAlert = "";
    string strProgramName = string.Empty;
    string StrConnectionName = string.Empty;
    public string strDateFormat;                                                // to maintain the standard format
    static string strPageName = "";
    int intUserID = 0;                                                          // user who signed in
    int intCompanyID = 0;
    int intSubLineItemId = 0;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    S3GSession ObjS3GSession = new S3GSession();
    UserInfo ObjUserInfo;
    UserInfo_FA ObjUserInfo_FA;
    Dictionary<string, string> Procparam;
    //BudgetServiceReference.BudgetMasterClient objBudgetService;
    BudgetServiceReference.BudgetMasterClient objBudgetService;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTDataTable objLIDataTable = null;
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
                Session["Company_Id"] = intCompanyID.ToString();
                bCreate = ObjUserInfo_FA.ProCreateRW;
                bModify = ObjUserInfo_FA.ProModifyRW;
                bQuery = ObjUserInfo_FA.ProViewRW;
                strPageName = "Budget Sub Line Item Master";
                funPubInitializedt();
                //lblHeading.Text = "Budget Line Item Master - Create";
                funPubBindDropdowns();

                ddlLineItem.Items.Insert(0, "--Select--");
                if (Request.QueryString.Get("qsmasterId") != null)
                {
                    fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                    intSubLineItemId = Convert.ToInt32(fromTicket.Name);
                    strPageName = strPageName + " - Modify";
                }
                else
                {
                    strPageName = strPageName + " - Create";
                }
                lblHeading.Text = strPageName;
                if (Request.QueryString["qsMode"] != null)
                    strMode = Convert.ToString(Request.QueryString["qsMode"]);

                if (((intSubLineItemId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intSubLineItemId > 0)) && (strMode == "Q"))
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
            //  DropDownList ddlSubLineItem = (DropDownList)grvSubLineItem.FooterRow.FindControl("ddlFSubLineItem");
            DropDownList ddlType = (DropDownList)grvSubLineItem.FooterRow.FindControl("ddlType");

            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Option", "4");

            DataSet dsData = new DataSet();

            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

            if (dsData.Tables[1].Rows.Count > 0)
            {
                ddlType.Items.Clear();
                ddlType.DataSource = dsData.Tables[1];
                ddlType.DataTextField = "lookup_desc";
                ddlType.DataValueField = "lookup_code";
                ddlType.DataBind();
                ddlType.Items.Insert(0, "--Select--");
            }


        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    public void funPubBindLineItem()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();

            Procparam.Add("@Company_ID", intCompanyID.ToString());
            if (ddlItemHeader.SelectedValue != "--Select--" || ddlItemHeader.SelectedValue != "0")
            {
                Procparam.Add("@ItemHeader", ddlItemHeader.SelectedValue.ToString());
            }
            if (ddlAccountNature.SelectedValue != "--Select--" || ddlAccountNature.SelectedValue != "0")
            {
                Procparam.Add("@AccNature", ddlAccountNature.SelectedValue.ToString());
            }

            Procparam.Add("@Option", "2");

            DataSet dsData = new DataSet();

            dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

            if (dsData.Tables[0].Rows.Count > 0)
            {
                ddlLineItem.Items.Clear();
                ddlLineItem.DataSource = dsData.Tables[0];
                ddlLineItem.DataTextField = "description";
                ddlLineItem.DataValueField = "value";
                ddlLineItem.DataBind();
                ddlLineItem.Items.Insert(0, "--Select--");
            }
            else
            {
                ddlLineItem.Items.Clear();
                ddlLineItem.Items.Insert(0, "--Select--");
            }
        }
        catch (Exception ex)
        {
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
                    ddlItemHeader.Items.Insert(0, "--Select--");
                }


                if (dsData.Tables[1].Rows.Count > 0)
                {
                    ddlAccountNature.Items.Clear();
                    ddlAccountNature.DataSource = dsData.Tables[1];
                    ddlAccountNature.DataTextField = "lookup_desc";
                    ddlAccountNature.DataValueField = "lookup_code";
                    ddlAccountNature.DataBind();
                    ddlAccountNature.Items.Insert(0, "--Select--");
                }

                //funPubBindFooterDropdown();
            }
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
            DataTable dtVS = (DataTable)ViewState["dtSubLineItems"];
            if (dtVS.Rows.Count > 0)
            {
                if (dtVS.Rows[0][0].ToString() == "0")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Add Sub Line Item.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10066);
                    return;
                }
            }
            if (ddlSubTotal.SelectedValue.ToString() == "1")
            {
                if (txtSubTotalName.Text.Trim() == "")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Enter sub total name");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10067);
                    return;
                }
            }
            //funPubInitializedt();
            objLIDataTable = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTDataTable();
            FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTRow objDataRow;
            objDataRow = objLIDataTable.NewFA_BUD_SUBLINEITEM_MSTRow();
            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intSubLineItemId = Convert.ToInt32(fromTicket.Name);
                objDataRow.SUBLINEITEMMST_ID = intSubLineItemId;
            }
            else
                objDataRow.SUBLINEITEMMST_ID = 0;
            objDataRow.COMPANY_ID = intCompanyID;
            objDataRow.ITEM_HDR_ID = Convert.ToInt32(ddlItemHeader.SelectedValue);
            objDataRow.ACCOUNT_NATURE_ID = Convert.ToInt32(ddlAccountNature.SelectedValue);
            objDataRow.LINE_ITEM_ID = Convert.ToInt32(ddlLineItem.SelectedValue);
            objDataRow.USER_ID = intUserID;

            if (ChkbxStatus.Checked)
            {
                objDataRow.IS_ACTIVE = 1;
            }
            else
                objDataRow.IS_ACTIVE = 0;

            if (ddlSubTotal.SelectedValue.ToString() == "1")
            {
                objDataRow.SUBTOTAL = 1;
                objDataRow.SUBTOTALNAME = txtSubTotalName.Text.Trim();
            }
            else
            {
                objDataRow.SUBTOTAL = 0;
                objDataRow.SUBTOTALNAME = "";
            }

            objDataRow.Xml_SubLineItemDTLS = ((DataTable)ViewState["dtSubLineItems"]).FunPubFormXml(true);

            objLIDataTable.AddFA_BUD_SUBLINEITEM_MSTRow(objDataRow);

            int errorCode = 0;
            objBudgetService = new BudgetServiceReference.BudgetMasterClient();
            objFASession = new FASession();
            StrConnectionName = objFASession.ProConnectionName;
            errorCode = objBudgetService.FunPubCreateSubLineItem(SerMode, FAClsPubSerialize.Serialize(objLIDataTable, SerMode), StrConnectionName);
            if (errorCode == 0)
            {
                //Utility_FA.FunShowAlertMsg_FA(this, , "BUD_SubLineItemMaster_Add.aspx");
                Utility_FA.FunSaveConfirmAlertMsg(this, "Success!", Resources.ErrorHandlingAndValidation._10054, "Do you want to create another Sub line item?", "BUD_SubLineItemMaster_Add.aspx", "BUD_SubLineItemMaster_View.aspx");
            }
            else if (errorCode == 10)
            {
                //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10055, "BUD_SubLineItemMaster_View.aspx");
                Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", Resources.ErrorHandlingAndValidation._10055, "BUD_SubLineItemMaster_View.aspx");
            }
            else if (errorCode == 11)
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Combination already exists");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10058);
                //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alert('basic', ,'Alert' ,'Combination already exists' );", true);
            }
            else
            {
                if (errorCode == 50)
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10056);
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10056);
                }
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            //Utility_FA.FunShowAlertMsg_FA(this, Resources.ErrorHandlingAndValidation._10051);
            Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10056);
        }
    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("BUD_SubLineItemMaster_Add.aspx");
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

    protected void grvSubLineItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

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
            dt.Columns.Add("SubLineItemId");
            dt.Columns.Add("SubLineItem");
            dt.Columns.Add("Type");
            dt.Columns.Add("TypeId");
            dt.Columns.Add("EffectiveFrom");
            dt.Columns.Add("EffectiveTo");
            dt.Columns.Add("EffectiveFrom1");
            dt.Columns.Add("EffectiveTo1");

            DataRow drItem = dt.NewRow();
            drItem.BeginEdit();
            drItem["SNO"] = 0;
            drItem["SubLineItemId"] = "0";
            drItem["SubLineItem"] = "";
            drItem["TypeId"] = "0";
            drItem["Type"] = "";
            drItem["EffectiveFrom"] = "";
            drItem["EffectiveTo"] = "";
            drItem["EffectiveFrom1"] = "";
            drItem["EffectiveTo1"] = "";
            drItem.EndEdit();

            dt.Rows.Add(drItem);
            grvSubLineItem.DataSource = dt;
            grvSubLineItem.DataBind();
            ViewState["dtSubLineItems"] = dt;
            grvSubLineItem.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [System.Web.Services.WebMethod]
    public static string[] GetSublineItems(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Add("@COMPANY_ID", HttpContext.Current.Session["Company_Id"].ToString());
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("BUD_GET_SUBLINEITEMS", Procparam));
        return suggetions.ToArray();
    }

    protected void grvSubLineItem_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                UserControls_S3GAutoSuggest ddlESubLineItem = (UserControls_S3GAutoSuggest)e.Row.FindControl("ddlESubLineItem");
                DropDownList ddlEType = (DropDownList)e.Row.FindControl("ddlEType");
                Label lblESubLineItemId = (Label)e.Row.FindControl("lblESubLineItemId");
                Label lblESubLineItem = (Label)e.Row.FindControl("lblESubLineItem");
                Label lblETypeId = (Label)e.Row.FindControl("lblETypeId");

                Procparam = new Dictionary<string, string>();
                if (Procparam != null)
                    Procparam.Clear();

                Procparam.Add("@Company_ID", intCompanyID.ToString());
                Procparam.Add("@Option", "4");

                DataSet dsData = new DataSet();

                dsData = Utility_FA.GetDataset("BUD_GET_ITEMDETAILS", Procparam);

                //if (dsData.Tables[0].Rows.Count > 0)
                //{
                //    ddlESubLineItem.Items.Clear();
                //    ddlESubLineItem.DataSource = dsData.Tables[0];
                //    ddlESubLineItem.DataTextField = "description";
                //    ddlESubLineItem.DataValueField = "value";
                //    ddlESubLineItem.DataBind();
                //}
                //ddlESubLineItem.Items.Insert(0, "--Select--");

                if (dsData.Tables[1].Rows.Count > 0)
                {
                    ddlEType.Items.Clear();
                    ddlEType.DataSource = dsData.Tables[1];
                    ddlEType.DataTextField = "lookup_desc";
                    ddlEType.DataValueField = "lookup_code";
                    ddlEType.DataBind();
                }
                // ddlEType.Items.Insert(0, "--Select--");
                ddlESubLineItem.SelectedText = lblESubLineItem.Text;
                ddlESubLineItem.SelectedValue = lblESubLineItemId.Text;
                ddlEType.Items.FindByValue(lblETypeId.Text).Selected = true;

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }



    protected void grvSubLineItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            grvSubLineItem.EditIndex = e.NewEditIndex;
            int intEditIndex = 0;
            intEditIndex = e.NewEditIndex;
            funPriBindGrid();

            TextBox txtEEffFrom = (TextBox)grvSubLineItem.Rows[intEditIndex].FindControl("txtEEffFrom");
            AjaxControlToolkit.CalendarExtender CEEEffFrom = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.Rows[intEditIndex].FindControl("CEEEffFrom");
            txtEEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffFrom.ClientID + "','" + strDateFormat + "', false,  true);");
            CEEEffFrom.Format = strDateFormat;

            TextBox txtEEffTo = (TextBox)grvSubLineItem.Rows[intEditIndex].FindControl("txtEEffTo");
            AjaxControlToolkit.CalendarExtender CEEEffTo = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.Rows[intEditIndex].FindControl("CEEEffTo");
            txtEEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffTo.ClientID + "','" + strDateFormat + "', false,  true);");
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
            DataTable dt = (DataTable)ViewState["dtSubLineItems"];
            if (dt.Rows.Count > 0)
            {
                grvSubLineItem.DataSource = dt;
                grvSubLineItem.DataBind();
            }
            else
            {
                funPubInitializedt();
            }

            TextBox txtFEffFrom = (TextBox)grvSubLineItem.FooterRow.FindControl("txtFEffFrom");
            AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.FooterRow.FindControl("CEFEffFrom");
            txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "', false, true);");
            CEFEffFrom.Format = strDateFormat;

            TextBox txtFEffTo = (TextBox)grvSubLineItem.FooterRow.FindControl("txtFEffTo");
            AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.FooterRow.FindControl("CEFEffTo");
            txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "', false,  true);");
            CEFEffTo.Format = strDateFormat;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void FunPubLoadSubLineItem()
    {
        try
        {
            DataSet dsSubLineItem = new DataSet();
            if (Procparam != null)
                Procparam.Clear();


            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@SubLineItem_ID", intSubLineItemId.ToString());

            dsSubLineItem = Utility_FA.GetDataset("BUD_GET_SUBLINEITEMDETAILS", Procparam);
            if (dsSubLineItem.Tables.Count > 0)
            {
                if (dsSubLineItem.Tables[0].Rows.Count > 0)
                {
                    ddlAccountNature.SelectedValue = dsSubLineItem.Tables[0].Rows[0]["account_nature_id"].ToString();
                    ddlItemHeader.SelectedValue = dsSubLineItem.Tables[0].Rows[0]["item_hdr_id"].ToString();
                    //ddlAccountNature_SelectedIndexChanged(null, null);
                    if (Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["line_item_id"]) != "")
                    {
                        //ddlLineItem.SelectedValue = Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["line_item_id"]);
                        //ddlLineItem.SelectedItem.Text = Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["LineItem"]);
                        string val = Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["line_item_id"]);
                        string text = Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["LineItem"]);
                        ListItem lst = new ListItem(text, val);
                        ddlLineItem.Items.Insert(0, lst);
                    }
                    //ddlLineItem.Items.FindByValue(dsSubLineItem.Tables[0].Rows[0]["line_item_id"].ToString());
                    if (dsSubLineItem.Tables[0].Rows[0]["Is_Active"].ToString() == "1")
                    {
                        ChkbxStatus.Checked = true;
                    }
                    else
                        ChkbxStatus.Checked = false;
                    if (Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["sub_total"]) == "1")
                    {
                        ddlSubTotal.SelectedValue = "1";
                        txtSubTotalName.Text = Convert.ToString(dsSubLineItem.Tables[0].Rows[0]["sub_total_name"]);
                    }
                    else
                    {
                        ddlSubTotal.SelectedValue = "2";
                        txtSubTotalName.Text = "";
                    }
                    ddlSubTotal_SelectedIndexChanged(null, null);

                }
                if (dsSubLineItem.Tables[1].Rows.Count > 0)
                {
                    ViewState["dtSubLineItems"] = dsSubLineItem.Tables[1];
                }

                DataTable dtSL = new DataTable();
                dtSL = (DataTable)ViewState["dtSubLineItems"];
                grvSubLineItem.DataSource = dtSL;
                grvSubLineItem.DataBind();
                if (dtSL.Rows[0][0].ToString() == "0")
                {
                    grvSubLineItem.Rows[0].Visible = false;
                }
                funPubBindFooterDropdown();
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
                    FunPubLoadSubLineItem();
                    btnClear.Enabled_False();
                    ddlAccountNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    ddlLineItem.Enabled = false;
                    ChkbxStatus.Disabled = false;
                    break;

                case -1:// Query Mode
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageAdd);
                    }
                    FunPubLoadSubLineItem();
                    btnSave.Enabled_False();
                    btnClear.Enabled_False();
                    ddlAccountNature.Enabled = false;
                    ddlItemHeader.Enabled = false;
                    ddlLineItem.Enabled = false;
                    ChkbxStatus.Disabled = true;
                    ddlSubTotal.Enabled = false;
                    txtSubTotalName.ReadOnly = true;
                    foreach (GridViewRow gr in grvSubLineItem.Rows)
                    {
                        ImageButton imgbtnModify = (ImageButton)gr.FindControl("imgbtnModify");
                        imgbtnModify.Enabled = false;
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    grvSubLineItem.FooterRow.Visible = false;
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

    protected void ddlAccountNature_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            funPubBindLineItem();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlLineItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        funPubBindFooterDropdown();
    }
    protected void btnAdd_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (ddlItemHeader.SelectedValue == "0" || ddlItemHeader.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Item Header.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10059);
                return;
            }
            if (ddlAccountNature.SelectedValue == "0" || ddlAccountNature.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Account Nature.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10060);
                return;
            }
            if (ddlLineItem.SelectedValue == "0" || ddlLineItem.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Line Item.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", "Select Line Item");
                return;
            }

            UserControls_S3GAutoSuggest ddlSubLineItem = (UserControls_S3GAutoSuggest)grvSubLineItem.FooterRow.FindControl("ddlFSubLineItem");
            DropDownList ddlType = (DropDownList)grvSubLineItem.FooterRow.FindControl("ddlType");
            TextBox txtFEffFrom = (TextBox)grvSubLineItem.FooterRow.FindControl("txtFEffFrom");
            TextBox txtFEffTo = (TextBox)grvSubLineItem.FooterRow.FindControl("txtFEffTo");
            DataTable dtLineItems = new DataTable();


            if (ddlSubLineItem.SelectedValue == "0" || ddlSubLineItem.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Sub line item.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10071);
                return;
            }

            if (ddlLineItem.SelectedValue == "0" || ddlLineItem.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Line Item.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10070);
                return;
            }
            if (ddlType.SelectedValue == "0" || ddlType.SelectedValue == "--Select--")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Sub line Type.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10069);
                return;
            }
            if (txtFEffFrom.Text.Trim() == "")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Effective from date.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10061);
                return;
            }
            if (txtFEffTo.Text.Trim() == "")
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Select Effective to date.");
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10062);
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
            if (ViewState["dtSubLineItems"] == null)
            {
                funPubInitializedt();
            }
            else
            {
                dtLineItems = (DataTable)ViewState["dtSubLineItems"];

                DataRow[] drRows = dtLineItems.Select("SubLineItemId='" + ddlSubLineItem.SelectedValue.ToString() + "'");

                if (drRows.Length > 0)
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Selected Sub Line Item already exists.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10068);
                    return;
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

                drItem["EffectiveFrom"] = txtFEffFrom.Text.Trim();
                drItem["EffectiveTo"] = txtFEffTo.Text.Trim();
                drItem["EffectiveFrom1"] = Utility_FA.StringToDate(txtFEffFrom.Text.Trim()).ToString();
                drItem["EffectiveTo1"] = Utility_FA.StringToDate(txtFEffTo.Text.Trim()).ToString();
                if (ddlSubLineItem.SelectedValue.ToString() != "0")
                {
                    drItem["SubLineItemId"] = ddlSubLineItem.SelectedValue.ToUpper();
                    drItem["SubLineItem"] = ddlSubLineItem.SelectedText;
                }
                else
                {
                    drItem["SubLineItemId"] = "0";
                    drItem["SubLineItem"] = "";
                }
                if (ddlType.SelectedValue.ToString() != "0")
                {
                    drItem["Type"] = ddlType.SelectedItem.Text.ToUpper();
                    drItem["TypeId"] = ddlType.SelectedValue.ToString();
                }
                else
                {
                    drItem["Type"] = "";
                    drItem["TypeId"] = "0";
                }
                drItem.EndEdit();
                dtLineItems.Rows.Add(drItem);

                grvSubLineItem.DataSource = dtLineItems;
                ViewState["dtSubLineItems"] = dtLineItems;
                grvSubLineItem.DataBind();

                funPubBindFooterDropdown();

                AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.FooterRow.FindControl("CEFEffFrom");
                txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',false,  true);");
                CEFEffFrom.Format = strDateFormat;


                AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvSubLineItem.FooterRow.FindControl("CEFEffTo");
                txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "', false,  true);");
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
            if (ViewState["dtSubLineItems"] == null)
            {
                funPubInitializedt();
            }
            else
            {
                GridViewRow row = grvSubLineItem.Rows[grvSubLineItem.EditIndex];

                DataTable dt = (DataTable)ViewState["dtSubLineItems"];

                TextBox txtEEffFrom = (TextBox)row.FindControl("txtEEffFrom");
                TextBox txtEEffTo = (TextBox)row.FindControl("txtEEffTo");
                UserControls_S3GAutoSuggest ddlESubLineItem = (UserControls_S3GAutoSuggest)row.FindControl("ddlESubLineItem");
                DropDownList ddlEType = (DropDownList)row.FindControl("ddlEType");
                CheckBox chkbxESLItem = (CheckBox)row.FindControl("chkbxESLItem");
                Label lblESNO = (Label)row.FindControl("lblESNO");

                if (ddlESubLineItem.SelectedValue == "0" || ddlESubLineItem.SelectedValue == "--Select--")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Select Sub line item.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10071);
                    return;
                }

                if (ddlEType.SelectedValue == "0" || ddlEType.SelectedValue == "--Select--")
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Select Sub line type.");
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10069);
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

                DataRow[] drRows = dt.Select("SubLineItemId='" + ddlESubLineItem.SelectedValue.ToString() + "'");
                if (drRows.Length > 0)
                {
                    if (Convert.ToString(ddlESubLineItem.SelectedValue) == drRows[0]["SubLineItemId"].ToString()
                        && lblESNO.Text != drRows[0]["SNO"].ToString())
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this, "Selected Sub Line Item already exists.");
                        Utility_FA.FunAlertMsg(this.Page, "warning", "Alert", Resources.ErrorHandlingAndValidation._10068);
                        return;
                    }
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

                DataRow dr = dt.Rows[grvSubLineItem.EditIndex];

                dr["EffectiveFrom"] = txtEEffFrom.Text;
                dr["EffectiveTo"] = txtEEffTo.Text;

                dr["EffectiveFrom1"] = Utility_FA.StringToDate(txtEEffFrom.Text.Trim()).ToString();
                dr["EffectiveTo1"] = Utility_FA.StringToDate(txtEEffTo.Text.Trim()).ToString();

                if (ddlESubLineItem.SelectedValue.ToString() != "0")
                {
                    dr["SubLineItem"] = ddlESubLineItem.SelectedText.ToUpper();
                    dr["SubLineItemId"] = ddlESubLineItem.SelectedValue.ToString();
                }
                else
                {
                    dr["SubLineItem"] = "";
                    dr["SubLineItemId"] = "0";
                }
                if (ddlEType.SelectedValue.ToString() != "0")
                {
                    dr["Type"] = ddlEType.SelectedItem.Text.ToUpper();
                    dr["TypeId"] = ddlEType.SelectedValue.ToString();
                }
                else
                {
                    dr["Type"] = "";
                    dr["TypeId"] = "0";
                }

                dt.AcceptChanges();

                grvSubLineItem.EditIndex = -1;
                grvSubLineItem.DataSource = dt;
                ViewState["dtSubLineItems"] = dt;
                grvSubLineItem.DataBind();
                funPubBindFooterDropdown();
            }
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
            grvSubLineItem.EditIndex = -1;
            funPriBindGrid();
            funPubBindFooterDropdown();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void ddlSubTotal_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlSubTotal.SelectedValue.ToString() != "1")
            {
                txtSubTotalName.Clear();
                txtSubTotalName.ReadOnly = true;
            }
            else
                txtSubTotalName.ReadOnly = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void ddlItemHeader_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlAccountNature.ClearSelection();
            ddlLineItem.ClearSelection();
            ddlSubTotal.ClearSelection();
            txtSubTotalName.Clear();
            ViewState["dtSubLineItems"] = null;
            funPubInitializedt();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
}