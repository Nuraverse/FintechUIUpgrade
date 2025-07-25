using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Web.Security;
using System.ServiceModel;
using System.Configuration;

public partial class System_Admin_S3GSysAdminHoliday_Master_View : ApplyThemeForProject
{
    #region [Declaration's]

    string strRedirectPage = "~/System Admin/S3GSysAdminHoliday_Master_Add.aspx";

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

    #endregion [Declaration's]

    #region [Events]

    protected void Page_Load(object sender, EventArgs e)
    {
        PubFunPageLoad();
    }

    protected void gvHolidayMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "?qsmasterId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M", false);
                break;
            case "query":
                Response.Redirect(strRedirectPage + "?qsmasterId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q", false);
                break;
        }
    }

    protected void gvHolidayMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {


            //User Authorization
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");

            if (lblUserID != null && lblUserID.Text != "")
            {
                if (((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text)))))
                {
                    imgbtnEdit.Enabled = true;
                }
                else
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
            }
            //Authorization code end
        }
    }

    /// <summary>
    /// Will Perform Sorting On Colunm base upon the link button id calling the function
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 
    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        var imgbtnSearch = string.Empty;
        try
        {
            LinkButton lnkbtnSearch = (LinkButton)sender;
            string strSortColName = string.Empty;
            //To identify image button which needs to get chnanged
            imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");
            switch (Convert.ToString(lnkbtnSearch.ID))
            {
                case "lnkbtnlocation":
                    strSortColName = "LOCAT.LocationCat_Description";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((Button)gvHolidayMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((Button)gvHolidayMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (FaultException<S3GAdminServicesReference.ClsPubFaultException> objFaultExp)
        {
            //lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            //    lblErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    /// <summary>
    /// To Search in Grid view Gets the text box as sender and gets its text
    /// </summary>
    /// <param name="sender">Text box in gridview</param>
    /// <param name="e"></param>

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {

        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);

            FunPriGetSearchValue();
            //Replace the corresponding fields needs to search in sqlserver

            if (strSearchVal1 != "")
            {
                strSearchVal += " and Upper(NVL(locat.LocationCat_Description,'ALL')) like '%" + strSearchVal1.ToUpper() + "%'";
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)gvHolidayMaster.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }

    protected void btnShow_Click(object sender, EventArgs e)
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
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    #endregion [Events]

    #region [Function's]

    public void PubFunPageLoad()
    {
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

        #region Paging Config

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

        #endregion

        //User Authorization
        ObjUserInfo = new UserInfo();
        intCompanyID = Convert.ToInt32(ObjUserInfo.ProCompanyIdRW);
        intUserID = Convert.ToInt32(ObjUserInfo.ProUserIdRW);

        bCreate = ObjUserInfo.ProCreateRW;
        bModify = ObjUserInfo.ProModifyRW;
        bQuery = ObjUserInfo.ProViewRW;
        bIsActive = ObjUserInfo.ProIsActiveRW;
        //bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
        //Authorization Code end

        if (!IsPostBack)
        {
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            ucCustomPaging.Visible = false;
            FunPriBindGrid();

            //User Authorization
            if (!bIsActive)
            {
                gvHolidayMaster.Columns[1].Visible = false;
                gvHolidayMaster.Columns[0].Visible = false;
                //  btnCreate.Enabled = false;
                btnCreate.Enabled_False();
                return;
            }
            if (!bModify)
            {
                gvHolidayMaster.Columns[1].Visible = false;
            }
            if (!bQuery)
            {
                gvHolidayMaster.Columns[0].Visible = false;
            }
            if (!bCreate)
            {
                // btnCreate.Enabled = false;
                btnCreate.Enabled_False();
            }
            //Authorization Code end
            //Added by Suseela to set focus- code starts
            TextBox txtheadersearch1 = (TextBox)gvHolidayMaster.HeaderRow.FindControl("txtheadersearch1");
            txtheadersearch1.Focus();
            //Added by Suseela to set focus- code Ends
        }
    }

    /// <summary>
    /// This method is used to display currency details
    /// </summary>
    private void FunPriBindGrid()
    {
        try
        {
            int intTotalRecords = 0;
            Dictionary<string, string> ProcValue = new Dictionary<string, string>();

            //Paging Properties set
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            //Paging code end
            FunPriGetSearchValue();

            bool bIsNewRow = false;
            gvHolidayMaster.BindGridView("S3G_SYSAD_VIEW_HOLIDAY", ProcValue, out  intTotalRecords, ObjPaging, out bIsNewRow);
            gvHolidayMaster.DataBind();

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                gvHolidayMaster.Rows[0].Visible = false;
            }

            FunPriSetSearchValue();
            ucCustomPaging.Visible = true;
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            //Paging Config End

        }
        catch (Exception ex)
        {
            // lblErrorMessage.InnerText = ex.Message;
        }
    }

    /// <summary>
    /// Gets the Sort Direction of the strColumn in the Grid View Using hidden control
    /// </summary>
    /// <param name="strColumn"> Colunm Name is Passed</param>
    /// <returns>Sort Direction as a String </returns>
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
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
        return strSortDirection;
    }

    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue()
    {
        if (gvHolidayMaster.HeaderRow != null)
        {
            ((TextBox)gvHolidayMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;

        }
    }

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>

    private void FunPriGetSearchValue()
    {
        if (gvHolidayMaster.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)gvHolidayMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();

        }
    }

    /// <summary>
    /// To clear value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue()
    {
        if (gvHolidayMaster.HeaderRow != null)
        {
            ((TextBox)gvHolidayMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";

        }
    }

    #endregion [Function's]
}