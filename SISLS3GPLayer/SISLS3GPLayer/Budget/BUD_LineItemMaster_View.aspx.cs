#region Page Header

/// <Program Summary>
/// Module Name			: Budget 
/// Screen Name			: Line Item Master View
/// Created By			: Deepika .K
/// Created Date		: 18-Nov-2019
/// Purpose	            : Budget Module
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

public partial class Budget_BUD_LineItemMaster_View : ApplyThemeForProject_FA
{
    string strRedirectPageView = "~/Budget/BUD_LineItemMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/BUD_LineItemMaster_Add.aspx";
    string strKey = "Insert";
    string strProgramName = string.Empty;
    Dictionary<string, string> Procparam;
    string strPageName = "";

    #region [Paging Config]

    string strSearchVal1 = string.Empty;

    int intUserID = 0;
    int intCompanyID = 0;

    //User Authorization variable declaration
    UserInfo_FA ObjUserInfo = null;
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
        try
        {
            ObjUserInfo_FA = new UserInfo_FA();

            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;                                  // current user's company ID.
            intUserID = ObjUserInfo_FA.ProUserIdRW;                                        // current user's ID


            strPageName = "Budget Line Item Master - View";
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
                FunPriClearSearchValue_FA();
                FunPriBindGrid();
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    protected void btnClear_ServerClick(object sender, EventArgs e)
    {

    }
    protected void btnSearch_ServerClick(object sender, EventArgs e)
    {
        try
        {
            FunPriBindGrid();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
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
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
    }

    private void FunPriBindGrid()
    {
        try
        {
            int intTotalRecords = 0;
            Dictionary<string, string> ProcValue = new Dictionary<string, string>();

            ObjPaging_FA.ProCompany_ID = intCompanyID;
            ObjPaging_FA.ProUser_ID = intUserID;
            ObjPaging_FA.ProTotalRecords = intTotalRecords;
            ObjPaging_FA.ProCurrentPage = ProPageNumRW;
            ObjPaging_FA.ProPageSize = ProPageSizeRW;
            ObjPaging_FA.ProSearchValue = hdnSearch.Value;
            ObjPaging_FA.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue_FA();

            bool bIsNewRow = false;
            grvViewLineItems.BindGridView_FA("BUD_GET_LINEITEM_VIEW", ProcValue, out  intTotalRecords, ObjPaging_FA, out bIsNewRow);
            grvViewLineItems.DataBind();

            if (bIsNewRow)
            {
                grvViewLineItems.Rows[0].Visible = false;
            }

            FunPriSetSearchValue_FA();

            if (intTotalRecords == 0)
            {
                ucCustomPaging.Visible = true;
                ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
                ucCustomPaging.setPageSize(ProPageSizeRW);
                return;
            }
            ucCustomPaging.Visible = true;
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriSetSearchValue_FA()
    {
        if (grvViewLineItems.HeaderRow != null)
        {
            ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch")).Text = strSearchVal1;

        }
    }
    private void FunPriGetSearchValue_FA()
    {
        try
        {
            if (grvViewLineItems.HeaderRow != null)
            {
                strSearchVal1 = ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch")).Text.Trim();

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
            if (grvViewLineItems.HeaderRow != null)
            {
                ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch")).Text = "";

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
                    strSortColName = "IH.LOOKUP_DESC";
                    break;

            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);

            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((ImageButton)grvViewLineItems.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)grvViewLineItems.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
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
                strSearchVal += " and Upper(ih.lookup_desc) like '%" + strSearchVal1.ToUpper() + "%'";
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;


            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvViewLineItems.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void grvViewLineItems_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName != "")
            {
                FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
                switch (e.CommandName.ToLower())
                {
                    case "modify":
                        Response.Redirect(strRedirectPageAdd + "?qsmasterId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                        break;
                    case "query":
                        Response.Redirect(strRedirectPageAdd + "?qsMasterId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
    protected void grvViewLineItems_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                CheckBox chkbxStatus = (CheckBox)e.Row.FindControl("chkbxStatus");
                if (lblStatus.Text == "1")
                {
                    chkbxStatus.Checked = true;
                }
                else
                    chkbxStatus.Checked = false;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }
}
