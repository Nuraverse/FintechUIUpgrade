#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget Planning Master View
/// Created By			: Boobalan M
/// Created Date		: 14-Nov-2019
/// Purpose	            : 
#endregion

using FA_BusEntity;
using S3GBusEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;

public partial class FA_Budget_File_Upload_View : ApplyThemeForProject_FA
{


    string strRedirectPageAdd = "~/Budget/FA_Budget_File_Upload.aspx";
    string strRedirectPageQueryPage = "~/Budget/FA_Budget_File_Upload_Query_View.aspx";
    Dictionary<string, string> Procparam = null;
    int intCompanyId = 0;
    UserInfo usrInfo = new UserInfo();

    #region [Paging Config]

    string strSearchVal1 = string.Empty;
    string strPageName = "";
    int intUserID = 0;
    int intCompanyID;

    //User Authorization variable declaration
    UserInfo ObjUserInfo = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Declaration end

    FAPagingValues ObjPaging_FA = new FAPagingValues();
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);

    public int ProPageNumRW
    {
        get;
        set;
    }

    public int ProPageSizeRW
    {
        get;
        set;
    }

    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;
        ProPageSizeRW = intPageSize;
        FunPriBindGrid();
    }

    #endregion [Paging Config]

    protected void Page_Load(object sender, EventArgs e)
    {
        
        intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
        intUserID = ObjUserInfo_FA.ProUserIdRW;
        strPageName = "Budget Planning Master - View";
        ProPageNumRW = 1;
        TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
        if (txtPageSize.Text != "")
            ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
        else
            ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

        PageAssignValue obj = new PageAssignValue(this.AssignValue);
        ucCustomPaging.callback = obj;
        ucCustomPaging.ProPageNumRW = ProPageNumRW;
        ucCustomPaging.ProPageSizeRW = ProPageSizeRW;
        hdnSearch.Value = "";
        hdnOrderBy.Value = "";
      
        if (!IsPostBack)
        {
            FunPriBindGrid();  
            
        }

    }

    public void FunPriBindGrid()
    {
        try
        {
            //DataSet Dset = new DataSet();

            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Company_ID", intCompanyId.ToString());
            //Dset = Utility_FA.GetDataset("FA_GET_BUDGET_MASTER_LIST", Procparam);
            //this.grvBudgetFileUploadView.DataSource = Dset.Tables[0];
            //this.grvBudgetFileUploadView.DataBind();
            int intTotalRecords = 0;
            Dictionary<string, string> ProcValue = new Dictionary<string, string>();

            ObjPaging_FA.ProCompany_ID = ObjUserInfo_FA.ProCompanyIdRW;
            ObjPaging_FA.ProUser_ID = intUserID;
            ObjPaging_FA.ProTotalRecords = intTotalRecords;
            ObjPaging_FA.ProCurrentPage = ProPageNumRW;
            ObjPaging_FA.ProPageSize = ProPageSizeRW;
            ObjPaging_FA.ProSearchValue = hdnSearch.Value;
            ObjPaging_FA.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue_FA();
            FunPriSetSearchValue_FA();
            bool bIsNewRow = false;
            grvBudgetFileUploadView.ClearGrid_FA();
            grvBudgetFileUploadView.BindGridView_FA("FA_GET_BUDGET_FILEUPLOAD_VIEW", ProcValue, out  intTotalRecords, ObjPaging_FA, out bIsNewRow);
            grvBudgetFileUploadView.DataBind();

            if (bIsNewRow)
            {
                grvBudgetFileUploadView.Rows[0].Visible = false;
            }

            

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);


        }
        catch (Exception objException)
        {
            throw objException;
        }

    }


    protected void grvFormulaMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void grvFormulaMaster_RowCommand(object sender, GridViewRowEventArgs e)
    {

    }

  


   
    private void FunPriSetSearchValue_FA()
    {
        if (grvBudgetFileUploadView.HeaderRow != null)
        {
            ((TextBox)grvBudgetFileUploadView.HeaderRow.FindControl("txtHeaderSearch")).Text = strSearchVal1;

        }
    }


    private void FunPriGetSearchValue_FA()
    {
        try
        {
            if (grvBudgetFileUploadView.HeaderRow != null)
            {
                strSearchVal1 = ((TextBox)grvBudgetFileUploadView.HeaderRow.FindControl("txtHeaderSearch")).Text.Trim();

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }

    }

    private void FunPriClearSearchValue_FA()
    {
        try
        {
            if (grvBudgetFileUploadView.HeaderRow != null)
            {
                ((TextBox)grvBudgetFileUploadView.HeaderRow.FindControl("txtHeaderSearch")).Text = "";

            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        var imgbtnSearch = string.Empty;
        try
        {
            LinkButton lnkbtnSearch = (LinkButton)sender;
            string strSortColName = string.Empty;

            imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");
            switch (lnkbtnSearch.ID)
            {

                case "lnkbtnItemHeader":
                    strSortColName = "fin_year";
                    break;

            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            ProPageNumRW = 1;
            TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
            if (txtPageSize.Text != "")
                ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            else
                ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((ImageButton)grvBudgetFileUploadView.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)grvBudgetFileUploadView.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (Exception ex)
        {
            //    lblErrorMessage.InnerText = ex.Message;
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    private string FunPriGetSortDirectionStr(string strColumn)
    {
        string strSortDirection = string.Empty;
        string strSortExpression = string.Empty;

        string strOrderBy = string.Empty;
        strSortDirection = "DESC";
        try
        {
            strSortExpression = hdnSortExpression.Value;
            if ((strSortExpression != "") && (strSortExpression == strColumn) && (hdnSortDirection.Value != null) && (hdnSortDirection.Value == "DESC"))
            {
                strSortDirection = "ASC";
            }
            hdnSortDirection.Value = strSortDirection;
            hdnSortExpression.Value = strColumn;
            strOrderBy = " " + strColumn + " " + strSortDirection;
            hdnOrderBy.Value = strOrderBy;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
        return strSortDirection;
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {
        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);

            FunPriGetSearchValue_FA();

            if (strSearchVal1 != "")
            {
                strSearchVal += " and Upper(FinYear) like '%" + strSearchVal1.ToUpper() + "%'";
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;

            ProPageNumRW = 1;
            TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
            if (txtPageSize.Text != "")
                ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            else
                ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvBudgetFileUploadView.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
            if (txtPageSize.Text != "")
                ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            else
                ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue_FA();
            FunPriBindGrid();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void btnCreate_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageAdd, false);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }


    protected void grvViewBudgetMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            switch (e.CommandName.ToLower())
            {
                case "query":
                    Response.Redirect(strRedirectPageQueryPage + "?qsUploadId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                    break;
            }
        }
    }

}