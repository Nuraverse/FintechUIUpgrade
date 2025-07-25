#region [Namespaces]

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
using System.ServiceModel;
using FA_BusEntity;
using System.Collections.Generic;

#endregion [Namespaces]

public partial class System_Admin_FA_Sys_ScheduledJobsView : ApplyThemeForProject_FA
{

    #region [Initialization]

    #endregion [Initialization]

    #region [Paging Config]

    string strRedirectPage = "../System Admin/FA_Sys_ScheduledJobs.aspx";
    int intNoofSearch = 1;


    string[] arrSortCol = new string[] { "JobDescription" };



    string strProcName = "FA_Sys_TransScheduledJobs";
    Dictionary<string, string> Procparam = null;

    ArrayList arrSearchVal = new ArrayList(1);
    int intUserID = 0;
    int intCompanyID = 0;
    //User Authorization variable declaration
    UserInfo_FA ObjUserInfo_FA = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    FAPagingValues ObjPaging = new FAPagingValues();

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

    #region [Event's]

    #region [Page Event's]


    protected void Page_Load(object sender, EventArgs e)
    {

        ObjUserInfo_FA = new UserInfo_FA();
        intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
        intUserID = ObjUserInfo_FA.ProUserIdRW;

        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;

        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

        #region [Paging Config]

        arrSearchVal = new ArrayList(intNoofSearch);
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
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;

        #endregion  [Paging Config]

        if (!IsPostBack)
        {
            // lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
            FunPriBindGrid();
            //User Authorization
            if (!bIsActive)
            {
                grvScheduledJobs.Columns[1].Visible = false;
                grvScheduledJobs.Columns[0].Visible = false;
                btnCreate.Enabled = false;
                return;
            }
            if (!bModify)
            {
                grvScheduledJobs.Columns[1].Visible = false;
            }
            if (!bQuery)
            {
                grvScheduledJobs.Columns[0].Visible = false;
            }
            if (!bCreate)
            {
                btnCreate.Enabled = false;
            }
            //Authorization Code end
        }


    }

    #endregion [Page Event's]

    #region [Grid Event's]

    protected void grvScheduledJobs_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "?qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                break;
            case "query":
                Response.Redirect(strRedirectPage + "?qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                break;
        }

    }

    protected void grvScheduledJobs_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    //User Authorization
        //    Label lblUserID = (Label)e.Row.FindControl("lblUserID");
        //    Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
        //    ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
        //    if ((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text))))
        //    {
        //        imgbtnEdit.Enabled = true;
        //    }
        //    else
        //    {
        //        imgbtnEdit.Enabled = false;
        //        imgbtnEdit.CssClass = "styleGridEditDisabled";
        //    }
        //    //Authorization code end
        //}
    }

    #endregion [Grid Event's]

    #region [Button Event's]

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue_FA();
            FunPriBindGrid();
        }
        catch (Exception ex)
        {
            cvErrormsg.ErrorMessage = ex.Message;
            cvErrormsg.IsValid = false;
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    #endregion [Button Event's]

    #endregion [Event's]

    #region [Function's]

    private void FunPriBindGrid()
    {
        try
        {
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue_FA();
            Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Workflow_Sequence_ID", "0");

            grvScheduledJobs.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvScheduledJobs.Rows[0].Visible = false;
            }
            FunPriSetSearchValue_FA();
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);
            //Paging Config End
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            cvErrormsg.ErrorMessage = ex.Message;
            cvErrormsg.IsValid = false;
        }
    }

    #region [Paging and Searching Methods For Grid]

    private void FunPriGetSearchValue_FA()
    {
        arrSearchVal = grvScheduledJobs.FunPriGetSearchValue_FA(arrSearchVal, intNoofSearch);
    }

    private void FunPriClearSearchValue_FA()
    {
        grvScheduledJobs.FunPriClearSearchValue_FA(arrSearchVal);
    }

    private void FunPriSetSearchValue_FA()
    {
        grvScheduledJobs.FunPriSetSearchValue_FA(arrSearchVal);
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {
        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);
            FunPriGetSearchValue_FA();
            //Replace the corresponding fields needs to search in sqlserver
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (arrSearchVal[iCount].ToString() != "")
                {
                    strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '" + arrSearchVal[iCount].ToString() + "%'";
                }
            }
            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }
            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvScheduledJobs.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private string FunPriGetSortDirectionStr(string strColumn)
    {
        string strSortDirection = string.Empty;
        string strSortExpression = string.Empty;
        // By default, set the sort direction to ascending.
        string strOrderBy = string.Empty;
        strSortDirection = "DESC";
        try
        {
            // Retrieve the last strColumn that was sorted.
            // Check if the same strColumn is being sorted.
            // Otherwise, the default value can be returned.
            strSortExpression = hdnSortExpression.Value;
            if ((strSortExpression != "") && (strSortExpression == strColumn) && (hdnSortDirection.Value != null) && (hdnSortDirection.Value == "DESC"))
            {
                strSortDirection = "ASC";
            }
            // Save new values in hidden control.
            hdnSortDirection.Value = strSortDirection;
            hdnSortExpression.Value = strColumn;
            strOrderBy = " " + strColumn + " " + strSortDirection;
            hdnOrderBy.Value = strOrderBy;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return strSortDirection;
    }

    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        arrSearchVal = new ArrayList(intNoofSearch);
        var imgbtnSearch = string.Empty;
        try
        {
            LinkButton lnkbtnSearch = (LinkButton)sender;
            string strSortColName = string.Empty;
            //To identify image button which needs to get chnanged
            imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");

            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (lnkbtnSearch.ID == "lnkbtnSort" + (iCount + 1).ToString())
                {
                    strSortColName = arrSortCol[iCount].ToString();
                    break;
                }
            }
            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();
            if (strDirection == "ASC")
            {

                ((ImageButton)grvScheduledJobs.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)grvScheduledJobs.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //      FAClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
        //    cvErrormsg.ErrorMessage = objFaultExp.Detail.ProReasonRW;
        //    cvErrormsg.IsValid = false;
        //}
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            cvErrormsg.ErrorMessage = ex.Message;
            cvErrormsg.IsValid = false;
        }
    }

    #endregion [Paging and Searching Methods For Grid]

    #endregion [Function's]
}