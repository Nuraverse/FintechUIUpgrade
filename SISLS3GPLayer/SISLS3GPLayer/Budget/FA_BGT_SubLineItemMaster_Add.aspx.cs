using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using S3GBusEntity;

public partial class Budget_FA_BGT_SubLineItemMaster_Add : ApplyThemeForProject
{
    string strRedirectPageView = "~/Budget/FA_BGT_SubLineItemMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/FA_BGT_SubLineItemMaster_Add.aspx";
    string strKey = "Insert";
    string strProgramName = string.Empty;
    public string strDateFormat;                                                // to maintain the standard format
    int intUserID = 0;                                                          // user who signed in
    int intCompanyID = 0;
    S3GSession ObjS3GSession = new S3GSession();
    UserInfo ObjUserInfo;

    protected void Page_Load(object sender, EventArgs e)
    {
        # region User Information
        ObjUserInfo = new UserInfo();
        intCompanyID = ObjUserInfo.ProCompanyIdRW;                                  // current user's company ID.
        intUserID = ObjUserInfo.ProUserIdRW;                                        // current user's ID

        System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();
        System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = intUserID.ToString();

        #endregion

        strDateFormat = ObjS3GSession.ProDateFormatRW;                              // to get the standard date format of the Application


        if (!IsPostBack)
        {
            funPubInitializedt();
            lblHeading.Text = "Budget Line Item Master - Create";

            TextBox txtFEffFrom = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffFrom");
            AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffFrom");
            txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',true,  false);");
            CEFEffFrom.Format = strDateFormat;

            TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
            AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
            txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "',true,  false);");
            CEFEffTo.Format = strDateFormat;
        }


    }

    protected void btnSearch_ServerClick(object sender, EventArgs e)
    {
    }

    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        ddlAccountNature.ClearSelection();
        ddlItemHeader.ClearSelection();
        ViewState["dtLineItems"] = null;
        funPubInitializedt();

        TextBox txtFEffFrom = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffFrom");
        AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffFrom");
        txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',true,  false);");
        CEFEffFrom.Format = strDateFormat;

        TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
        AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
        txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "',true,  false);");
        CEFEffTo.Format = strDateFormat;
    }
    protected void btnExit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageView, false);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void grvLineItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToString() == "Add")
        {
            CheckBox chkbxIsEnable = (CheckBox)grvLineItem.FooterRow.FindControl("chkbxFSLItem");
            DropDownList ddlAccGroup = (DropDownList)grvLineItem.FooterRow.FindControl("ddlAccGroup");
            DropDownList ddlFLineItem = (DropDownList)grvLineItem.FooterRow.FindControl("ddlFLineItem");
            DropDownList ddlFItemType = (DropDownList)grvLineItem.FooterRow.FindControl("ddlFItemType");
            TextBox txtFEffFrom = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffFrom");
            TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
            DataTable dtLineItems = new DataTable();
            if (ViewState["dtLineItems"] == null)
            {
                funPubInitializedt();
            }
            else
            {
                dtLineItems = (DataTable)ViewState["dtLineItems"];
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
                if (ddlFItemType.SelectedValue.ToString() != "0")
                {
                    drItem["SubLineType"] = ddlFItemType.SelectedValue.ToString();
                }
                else
                    drItem["SubLineType"] = "0";

                if (ddlFLineItem.SelectedValue.ToString() != "0")
                {
                    drItem["LineItem"] = ddlFLineItem.SelectedValue.ToString();
                }
                else
                    drItem["LineItem"] = "0";
                
                drItem["EffectiveFrom"] = txtFEffFrom.Text.Trim();
                drItem["EffectiveTo"] = txtFEffTo.Text.Trim();
                if (ddlAccGroup.SelectedValue.ToString() != "0")
                {
                    drItem["AccGroup"] = ddlAccGroup.SelectedValue.ToString();
                }
                else
                    drItem["AccGroup"] = "";

                drItem.EndEdit();
                dtLineItems.Rows.Add(drItem);

                grvLineItem.DataSource = dtLineItems;
                ViewState["dtLineItems"] = dtLineItems;
                grvLineItem.DataBind();


                AjaxControlToolkit.CalendarExtender CEFEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffFrom");
                txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',true,  false);");
                CEFEffFrom.Format = strDateFormat;


                AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
                txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "',true,  false);");
                CEFEffTo.Format = strDateFormat;
            }
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

    public void funPubInitializedt()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("SNO");
            dt.Columns.Add("AccGroup");
            dt.Columns.Add("LineItem");
            dt.Columns.Add("SubLineType");
            dt.Columns.Add("EffectiveFrom");
            dt.Columns.Add("EffectiveTo");

            DataRow drItem = dt.NewRow();
            drItem.BeginEdit();
            drItem["SNO"] = 0;
            drItem["AccGroup"] = "";
            drItem["LineItem"] = "";
            drItem["SubLineType"] = "";
            drItem["EffectiveFrom"] = "";
            drItem["EffectiveTo"] = "";
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

    protected void ddlItemHeader_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlAccountNature_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void grvLineItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    protected void grvLineItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvLineItem.EditIndex = e.NewEditIndex;
        int intEditIndex = 0;
        intEditIndex = e.NewEditIndex;
        funPriBindGrid();

        TextBox txtEEffFrom = (TextBox)grvLineItem.Rows[intEditIndex].FindControl("txtEEffFrom");
        AjaxControlToolkit.CalendarExtender CEEEffFrom = (AjaxControlToolkit.CalendarExtender)grvLineItem.Rows[intEditIndex].FindControl("CEEEffFrom");
        txtEEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffFrom.ClientID + "','" + strDateFormat + "',true,  false);");
        CEEEffFrom.Format = strDateFormat;

        TextBox txtEEffTo = (TextBox)grvLineItem.Rows[intEditIndex].FindControl("txtEEffTo");
        AjaxControlToolkit.CalendarExtender CEEEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.Rows[intEditIndex].FindControl("CEEEffTo");
        txtEEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtEEffTo.ClientID + "','" + strDateFormat + "',true,  false);");
        CEEEffTo.Format = strDateFormat;


    }

    private void funPriBindGrid()
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
        txtFEffFrom.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffFrom.ClientID + "','" + strDateFormat + "',true,  false);");
        CEFEffFrom.Format = strDateFormat;

        TextBox txtFEffTo = (TextBox)grvLineItem.FooterRow.FindControl("txtFEffTo");
        AjaxControlToolkit.CalendarExtender CEFEffTo = (AjaxControlToolkit.CalendarExtender)grvLineItem.FooterRow.FindControl("CEFEffTo");
        txtFEffTo.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEffTo.ClientID + "','" + strDateFormat + "',true,  false);");
        CEFEffTo.Format = strDateFormat;
    }

    protected void grvLineItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (ViewState["dtLineItems"] == null)
        {
            funPubInitializedt();
        }
        else
        {
            int IEditIndex = 0;
            IEditIndex = e.RowIndex;

            DataTable dt = (DataTable)ViewState["dtLineItems"];

            TextBox txtEEffFrom = (TextBox)grvLineItem.Rows[IEditIndex].FindControl("txtEEffFrom");
            TextBox txtEEffTo = (TextBox)grvLineItem.Rows[IEditIndex].FindControl("txtEEffTo");
            DropDownList ddlEAccGroup = (DropDownList)grvLineItem.Rows[IEditIndex].FindControl("ddlEAccGroup");
            DropDownList ddlELineItem = (DropDownList)grvLineItem.Rows[IEditIndex].FindControl("ddlELineItem");
            DropDownList ddlEItemType = (DropDownList)grvLineItem.Rows[IEditIndex].FindControl("ddlEItemType");

            DataRow dr = dt.Rows[IEditIndex];
            dr["AccGroup"] = ddlEAccGroup.SelectedValue.ToString();
            dr["LineItem"] = ddlELineItem.SelectedValue.ToString();
            
            dr["EffectiveFrom"] = txtEEffFrom.Text;
            dr["EffectiveTo"] = txtEEffTo.Text;
            if (ddlEItemType.SelectedValue.ToString() != "0")
            {
                dr["SubLineType"] = ddlEItemType.SelectedValue.ToString();
            }
            else
                dr["SubLineType"] = "0";

            if (ddlELineItem.SelectedValue.ToString() != "0")
            {
                dr["LineItem"] = ddlELineItem.SelectedValue.ToString();
            }
            else
                dr["LineItem"] = "0";

            
            dt.AcceptChanges();

            grvLineItem.EditIndex = -1;
            grvLineItem.DataSource = dt;
            ViewState["dtLineItems"] = dt;
            grvLineItem.DataBind();
        }
    }
    protected void grvLineItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvLineItem.EditIndex = -1;
        funPriBindGrid();
    }
    protected void ddlLineItem_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}