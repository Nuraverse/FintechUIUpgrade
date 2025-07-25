#region [Revision History]
/// Screen Name     :   FA_DimensionMaster_View.aspx
/// Created By      :   Tamilselvan S
/// Created Date    :   23-Jan-2012
/// Purpose         :   To viewing the Dimension master details
#endregion [Revision History]

#region [Namespace]

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
#endregion [Namespace]

public partial class System_Admin_FADimensionMaster_view : ApplyThemeForProject_FA
{
    #region [Declaration's]

    string strRedirectPage = "~/System Admin/FADimensionMaster_Add.aspx";
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objDimensionMasterClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable ObjFA_SYS_DimensionMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable();

    #region [Paging Config]

    string strSearchVal1 = string.Empty;
    string strSearchVal2 = string.Empty;
    string strSearchVal3 = string.Empty;
    string strSearchVal4 = string.Empty;
    string strSearchVal5 = string.Empty;
    int intUserID = 0;
    int intCompanyID = 0;

    //User Authorization variable declaration
    UserInfo_FA ObjUserInfo_FA = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Declaration end

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

    #endregion [Declaration's]

    #region [Events]

    protected void Page_Load(object sender, EventArgs e)
    {
        PubFunPageLoad();
    }

    protected void gvDimensionMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "?qsDimensionId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                break;
            case "query":
                Response.Redirect(strRedirectPage + "?qsDimensionId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                break;
        }
    }

    protected void gvDimensionMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblActive = (Label)e.Row.FindControl("lblActive");
            CheckBox chkAct = (CheckBox)e.Row.FindControl("chkActive");

            //User Authorization
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
           
            if (lblActive.Text == "True")
            {
                chkAct.Checked = true;
            }
            if (lblUserID != null && lblUserID.Text != "")
            {
                if (((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text)))) )
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
            switch (lnkbtnSearch.ID)
            {
                case "lnkbtnDimension_Code":
                    strSortColName = "DM.Dim_Code";
                    break;
                case "lnkbtnDimension_Desc":
                    strSortColName = "DM.Dim_Desc";
                    break;
                case "lnkbtnLocation":
                    strSortColName = "LOCAT.LocationCat_Description";
                    break;
                case "lnkbtnDimType":
                    strSortColName = "DLP.Dimension_Value";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((ImageButton)gvDimensionMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)gvDimensionMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
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

            FunPriGetSearchValue_FA();
            //Replace the corresponding fields needs to search in sqlserver
            if (strSearchVal1 != "")
            {
                strSearchVal += "Upper(DM.Dim_Code) like '%" + strSearchVal1.ToUpper() + "%'";
            }
            if (strSearchVal2 != "")
            {
                strSearchVal += " and Upper(DM.Dim_Desc) like '%" + strSearchVal2.ToUpper() + "%'";
            }
            if (strSearchVal3 != "")
            {
                strSearchVal += " and Upper(locat.LocationCat_Description) like '%" + strSearchVal3.ToUpper() + "%'";
            }
            if (strSearchVal4 != "")
            {
                strSearchVal += " and Upper(DLP.Dimension_Value) like '%" + strSearchVal4.ToUpper() + "%'";
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)gvDimensionMaster.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
    }

    protected void btnShow_Click(object sender, EventArgs e)
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
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
        ObjUserInfo_FA = new UserInfo_FA();
        intCompanyID = Convert.ToInt32(ObjUserInfo_FA.ProCompanyIdRW);
        intUserID = Convert.ToInt32(ObjUserInfo_FA.ProUserIdRW);

        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        //bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
        //Authorization Code end

        if (!IsPostBack)
        {
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);

            FunPriBindGrid();

            //User Authorization
            if (!bIsActive)
            {
                gvDimensionMaster.Columns[1].Visible = false;
                gvDimensionMaster.Columns[0].Visible = false;
                btnCreate.Enabled = false;
                return;
            }
            if (!bModify)
            {
                gvDimensionMaster.Columns[1].Visible = false;
            }
            if (!bQuery)
            {
                gvDimensionMaster.Columns[0].Visible = false;
            }
            if (!bCreate)
            {
                btnCreate.Enabled = false;
            }
            //Authorization Code end
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
            FunPriGetSearchValue_FA();

            bool bIsNewRow = false;
            gvDimensionMaster.BindGridView_FA(SPNames.View_Dimension_Paging, ProcValue, out  intTotalRecords, ObjPaging, out bIsNewRow);
            gvDimensionMaster.DataBind();

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                gvDimensionMaster.Rows[0].Visible = false;
            }

            FunPriSetSearchValue_FA();

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
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
        return strSortDirection;
    }

    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue_FA()
    {
        if (gvDimensionMaster.HeaderRow != null)
        {
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text = strSearchVal2;
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch3")).Text = strSearchVal3;
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch4")).Text = strSearchVal4;
        }
    }

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>

    private void FunPriGetSearchValue_FA()
    {
        if (gvDimensionMaster.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();
            strSearchVal2 = ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text.Trim();
            strSearchVal3 = ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch3")).Text.Trim();
            strSearchVal4 = ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch4")).Text.Trim();
        }
    }

    /// <summary>
    /// To Clear_FA value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue_FA()
    {
        if (gvDimensionMaster.HeaderRow != null)
        {
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text = "";
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch3")).Text = "";
            ((TextBox)gvDimensionMaster.HeaderRow.FindControl("txtHeaderSearch4")).Text = "";
        }
    }

    #endregion [Function's]

}
