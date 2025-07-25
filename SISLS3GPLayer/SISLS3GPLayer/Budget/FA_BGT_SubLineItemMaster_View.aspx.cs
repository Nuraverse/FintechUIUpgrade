using FA_BusEntity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;

public partial class Budget_FA_BGT_SubLineItemMaster_View : ApplyThemeForProject
{
    string strRedirectPageView = "~/Budget/FA_BGT_SubLineItemMaster_View.aspx";
    string strRedirectPageAdd = "~/Budget/FA_BGT_SubLineItemMaster_Add.aspx";
    string strKey = "Insert";
    string strProgramName = string.Empty;
    Dictionary<string, string> Procparam;

    #region [Paging Config]

    string strSearchVal1 = string.Empty;

    int intUserID = 0;
    int intCompanyID = 0;

    //User Authorization variable declaration
    UserInfo ObjUserInfo = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Declaration end

    PagingValues ObjPaging = new PagingValues();

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
        if (!IsPostBack)
        {

        }
    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {

    }
    protected void btnSearch_ServerClick(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue();
            FunPriBindGrid();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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

    private void FunPriBindGrid()
    {
        try
        {
            int intTotalRecords = 0;
            Dictionary<string, string> ProcValue = new Dictionary<string, string>();

            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue();

            bool bIsNewRow = false;
            grvViewLineItems.BindGridView("", ProcValue, out  intTotalRecords, ObjPaging, out bIsNewRow);
            grvViewLineItems.DataBind();

            if (bIsNewRow)
            {
                grvViewLineItems.Rows[0].Visible = false;
            }

            FunPriSetSearchValue();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

        }
        catch (Exception ex)
        {
            // lblErrorMessage.InnerText = ex.Message;
        }
    }

    private void FunPriSetSearchValue()
    {
        if (grvViewLineItems.HeaderRow != null)
        {
            ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;

        }
    }
    private void FunPriGetSearchValue()
    {
        if (grvViewLineItems.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();

        }
    }

    private void FunPriClearSearchValue()
    {
        if (grvViewLineItems.HeaderRow != null)
        {
            ((TextBox)grvViewLineItems.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";

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

                case "lnkbtnLocation":
                    strSortColName = "LOCAT.LocationCat_Description";
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
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            //lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            //    lblErrorMessage.InnerText = ex.Message;
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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

            FunPriGetSearchValue();

            if (strSearchVal1 != "")
            {
                strSearchVal += " and Upper(locat.LocationCat_Description) like '%" + strSearchVal1.ToUpper() + "%'";
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;

            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)grvViewLineItems.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

}