#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Day Open/Close View
/// Created By			: Boobalan M
/// Created Date		: 14-Feb-2020
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
using FA_BusEntity;
using System.Collections.Generic;
using System.ServiceModel;

public partial class FA_Reports_FADayOpenClose_View : ApplyThemeForProject_FA
{

    string strRedirectPageAdd = "~/FA_System Admin/FADayOpenClose.aspx";
    Dictionary<string, string> Procparam = null;
    int intCompanyId = 0;

    #region [Paging Config]

    string strSearchVal1 = string.Empty;
    string strSearchGLVal = string.Empty;
    string strSearchActivityVal = string.Empty;
    string strPageName = "";
    int intUserID = 0;
    int intCompanyID;

    //User Authorization variable declaration
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Declaration end

    FAPagingValues ObjPaging_FA = new FAPagingValues();
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();

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
        strPageName = "Day Open Close - View";
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
            grvDayOpenCloseView.BindGridView_FA("FA_GET_DAY_OPENCLOSE_LIST", ProcValue, out  intTotalRecords, ObjPaging_FA, out bIsNewRow);
            grvDayOpenCloseView.DataBind();

            if (bIsNewRow)
            {
                grvDayOpenCloseView.Rows[0].Visible = false;
            }

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

        }
        catch (Exception objException)
        {
            throw objException;
        }

    }





    private void FunPriSetSearchValue_FA()
    {
        if (grvDayOpenCloseView.HeaderRow != null)
        {
            ((TextBox)grvDayOpenCloseView.HeaderRow.FindControl("txtHeaderSearch")).Text = strSearchVal1;

        }
    }


    private void FunPriGetSearchValue_FA()
    {
        try
        {
            if (grvDayOpenCloseView.HeaderRow != null)
            {
                strSearchVal1 = ((TextBox)grvDayOpenCloseView.HeaderRow.FindControl("txtHeaderSearch")).Text.Trim();

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
            if (grvDayOpenCloseView.HeaderRow != null)
            {
                ((TextBox)grvDayOpenCloseView.HeaderRow.FindControl("txtHeaderSearch")).Text = "";

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
                    strSortColName = "Location";
                    break;

            }
            strSortColName = "Location";
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
                ((ImageButton)grvDayOpenCloseView.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)grvDayOpenCloseView.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (Exception ex)
        {
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
                strSearchVal += " and Upper(Location) like '%" + strSearchVal1.ToUpper() + "%'";
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
                ((TextBox)grvDayOpenCloseView.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
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
            //    ClsPubCommErrorLogDB_FA.CustomErrorRoutine(ex);
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

        }
    }


    protected void grvViewBudgetMaster_RowCommand(object sender, GridViewCommandEventArgs e)
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

}