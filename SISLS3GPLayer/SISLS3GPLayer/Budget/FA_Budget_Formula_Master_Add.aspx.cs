#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget Formula Master
/// Created By			: Boobalan M
/// Created Date		: 13-Nov-2019
/// Purpose	            : Adding New Formula
#endregion

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
using S3GBusEntity;
using System.Collections.Generic;
using System.Text;

public partial class Budget_Budget_Formula_Master : ApplyThemeForProject
{
    static string[] strarrControlsID = new string[0];
    int intCompanyId = 0;
    int intUserId = 0;
    static string strPageName = "Budget Formula Master";
    SerializationMode SerMode = SerializationMode.Binary;
    ApplyThemeForProject ATFP = new ApplyThemeForProject();
    UserInfo usrInfo = new UserInfo();
    Dictionary<string, string> Procparam = null;


    protected void Page_PreInit(object sender, EventArgs e)
    {

        if (usrInfo.ProCompanyIdRW == 0)
            HttpContext.Current.Response.Redirect("../SessionExpired.aspx");

        Page.Theme = usrInfo.ProUserThemeRW;

        // Initialize from User Information
        CompanyId = usrInfo.ProCompanyIdRW.ToString();
        UserId = usrInfo.ProUserIdRW.ToString();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


            usrInfo = new UserInfo();
            intCompanyId = usrInfo.ProCompanyIdRW;
            intUserId = usrInfo.ProUserIdRW;

            if (!IsPostBack)
            {
                LineItemLoad();

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }
    public void LineItemLoad()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("LineItem", typeof(string));
        dt.Columns.Add("Value", typeof(int));
        dt.Rows.Add("Balance Sheet", 1);
        dt.Rows.Add("P&L", 2);
        dt.Rows.Add("Cash Flow", 3);
        dt.Rows.Add("Debtors", 4);
        dt.Rows.Add("Assumptions", 5);
        this.grvLineItemList.DataSource = dt;
        this.grvLineItemList.DataBind();

        DataTable dtItemCategory = new DataTable();
        dtItemCategory.Columns.Add("ItemCategory", typeof(string));
        dtItemCategory.Columns.Add("Value", typeof(int));
        dtItemCategory.Rows.Add("Line Items", 1);
        dtItemCategory.Rows.Add("Sub Line Items", 2);
        dtItemCategory.Rows.Add("Sub Total", 3);
        this.grvItemcategory.DataSource = dtItemCategory;
        this.grvItemcategory.DataBind();


    }

    protected void grvLineItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAllRole");

            CheckBox chkSelectAllLI = (CheckBox)e.Row.FindControl("chkSelectAllLI");
            chkSelectAllLI.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + this.grvLineItemList.ClientID + "',this,'chkSelectLI');");
            //chkAll.Checked = true;
            if (ViewState["SelectAll"] != null)
            {
                bool SelectAll = bool.Parse(ViewState["SelectAll"].ToString());
                chkSelectAllLI.Checked = SelectAll;
            }
        }


    }

    protected void grvItemCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAllRole");

            CheckBox chkSelectAllIC = (CheckBox)e.Row.FindControl("chkSelectAllIC");
            chkSelectAllIC.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + this.grvItemcategory.ClientID + "',this,'chkSelectIC');");
   
            if (ViewState["SelectAll"] != null)
            {
                bool SelectAll = bool.Parse(ViewState["SelectAll"].ToString());
                chkSelectAllIC.Checked = SelectAll;
            }
        }


    }


    protected void onCancelClick(object sender, EventArgs e)
    {
        Response.Redirect("FA_Budget_Formula_Master_View.aspx");
    }

}