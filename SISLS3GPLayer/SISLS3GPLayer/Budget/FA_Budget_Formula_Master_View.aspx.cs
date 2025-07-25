#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget Formula Master View
/// Created By			: Boobalan M
/// Created Date		: 14-Nov-2019
/// Purpose	            : 
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

public partial class Budget_FA_Budget_Formula_Master_View : ApplyThemeForProject
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
           QueryTableLoad();
        }
       
    }

    public void QueryTableLoad()
    {
        DataTable Dt = new DataTable();
        Dt.Columns.Add("Code", typeof(int));
        Dt.Columns.Add("ItemHeader", typeof(string));
        Dt.Columns.Add("AccountNature", typeof(string));
        Dt.Columns.Add("LineItem", typeof(string));
        Dt.Columns.Add("SublineItem", typeof(string));

        Dt.Rows.Add(1, "Cash Flow", "Particular", "Inflow", "Vehicular Total");
        this.grvFormulaMaster.DataSource = Dt;
        this.grvFormulaMaster.DataBind();
    }

    protected void grvFormulaMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void grvFormulaMaster_RowCommand(object sender, GridViewRowEventArgs e)
    {

    }

    protected void FunProSortingColumn(object sender, EventArgs e)
    {

    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {

    }

    protected void btnShow_Click(object sender, EventArgs e)
    {

    }

    public void onCreateNew(object sender, EventArgs e)
    {
        Response.Redirect("FA_Budget_Formula_Master_Add.aspx");
    }
}