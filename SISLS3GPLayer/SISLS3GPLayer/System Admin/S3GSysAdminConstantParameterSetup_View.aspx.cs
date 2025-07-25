#region Page Header
/// © 2018 SUNDARAM INFOTECH. All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Constant Parameter Definition
/// Created By			: Kannan RC
/// Created Date		: 11-JUL-2018
/// Purpose	            : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Data;
using System.Web.Security;
using System.Configuration;
#endregion

public partial class System_Admin_S3GSysAdminConstantParameterSetup_View : ApplyThemeForProject
{
    #region Intialization
    DocMgtServicesReference.DocMgtServicesClient ObjDNCClient;
    UserMgtServicesReference.UserMgtServicesClient objUserManagementClient;
    S3GBusEntity.DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable ObjS3G_DNCDetailsViewDataTable = new DocMgtServices.S3G_SYSAD_Get_DNCDetailsDataTable();
    int intDocumentSeqId = 0;
    string strSearchColName;
    string strRedirectPage = "~/System Admin/S3GSysAdminConstantParameterSetup_Add.aspx";
    PagedDataSource pdsPagerDataSource;
    DataView dvSearchView;
    private Int32 intCount;
    string strSortColName;
    Dictionary<string, string> Procparam = null;

    #endregion

    #region Paging Config

    string strSearchVal1 = string.Empty;
    string strSearchVal2 = string.Empty;
    string strSearchVal3 = string.Empty;
    string strSearchVal4 = string.Empty;
    string strSearchVal5 = string.Empty;
    int intUserID = 0;
    int intCompanyID = 0;
    bool bModify = false;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    UserInfo ObjUserInfo = null;
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
        FunGetDNCDetails();
    }
    #endregion


    #region Page_Load

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
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
            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            bModify = ObjUserInfo.ProModifyRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
            bQuery = ObjUserInfo.ProViewRW;
            bCreate = ObjUserInfo.ProCreateRW;
            bIsActive = ObjUserInfo.ProIsActiveRW;
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            if (!IsPostBack)
            {
                FunGetDNCDetails();
                if (!bIsActive)
                {
                    gvDNC.Columns[2].Visible = false;
                    gvDNC.Columns[1].Visible = false;
                    btnCreate.Enabled_False();
                    return;
                }

                if (!bModify)
                {
                    gvDNC.Columns[2].Visible = false;
                }
                if (!bQuery)
                {
                    gvDNC.Columns[1].Visible = false;
                }
                if (!bCreate)
                {
                    btnCreate.Enabled_False();
                }

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.InnerText = ex.Message;
        }
    }
    #endregion

    protected void gvDNC_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (gvDNC.Rows.Count > 0)
            {
                gvDNC.UseAccessibleHeader = true;
                gvDNC.HeaderRow.TableSection = TableRowSection.TableHeader;
                gvDNC.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.InnerText = ex.Message;
        }
    }
    protected void gvDNC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblActive = (Label)e.Row.FindControl("lblActive");
                CheckBox chkAct = (CheckBox)e.Row.FindControl("chkActive");
                if (lblActive.Text.Trim() == "1")
                {
                    chkAct.Checked = true;
                }
                else
                {
                    chkAct.Checked = false;
                }
                //User Authorization
                Label lblUserID = (Label)e.Row.FindControl("lblUserID");
                Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
                ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
                if (lblUserID.Text != "")
                {
                    
                    if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text), true)))
                    {
                        imgbtnEdit.Enabled = true;
                    }
                    else
                    {
                        imgbtnEdit.Enabled = false;
                        imgbtnEdit.CssClass = "styleGridEditDisabled";
                    }

                    //Code Added by saran on 23-Jan-2012 as per the observation raised by malaolan start
                    if (imgbtnEdit.CommandArgument.Trim() != string.Empty && (Convert.ToInt32(imgbtnEdit.CommandArgument) == ObjUserInfo.ProUserIdRW) && (ObjUserInfo.ProUserLevelIdRW != 5))
                    {
                        imgbtnEdit.Enabled = false;
                        imgbtnEdit.CssClass = "styleGridEditDisabled";
                    }
                    //Code Added by saran on 23-Jan-2012 as per the observation raised by malaolan end
                }
                //Authorization code end   

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.InnerText = ex.Message;
        }
    }

    protected void gvDNC_RowCommand(object sender, GridViewCommandEventArgs e)
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

    /// <summary>
    ///  This method used Get DNC Details
    /// </summary>
    private void FunGetDNCDetails()
    {
        objUserManagementClient = new UserMgtServicesReference.UserMgtServicesClient();
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
            Procparam = new Dictionary<string, string>();
            gvDNC.BindGridView("S3G_SYSAD_CONSTANT_PAGING", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);
            if (bIsNewRow)
            {
                gvDNC.Rows[0].Visible = false;
            }
            FunPriSetSearchValue();
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        finally
        {
            if (objUserManagementClient != null)
                objUserManagementClient.Close();
        }
    }

    /// <summary>
    /// To clear value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue()
    {
        if (gvDNC.HeaderRow != null)
        {
            ((TextBox)gvDNC.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";
        }
    }
    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue()
    {
        if (gvDNC.HeaderRow != null)
        {
            ((TextBox)gvDNC.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;
            ((TextBox)gvDNC.HeaderRow.FindControl("txtHeaderSearch2")).Text = strSearchVal2;
        }
    }
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue();
            ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
            ucCustomPaging.setPageSize(ProPageSizeRW);
            FunGetDNCDetails();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }


    private void FunPriGetSearchValue()
    {
        if (gvDNC.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)gvDNC.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();
            strSearchVal2 = ((TextBox)gvDNC.HeaderRow.FindControl("txtHeaderSearch2")).Text.Trim();
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
                strSearchVal += "CONSTANT_NAME like '%" + strSearchVal1 + "%'";
            }
            if (strSearchVal2 != "")
            {
                strSearchVal += " and Constant_Code like '%" + strSearchVal2 + "%'";
            }
            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunGetDNCDetails();
            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)gvDNC.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
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
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return strSortDirection;
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
                case "lnkbtnUserGroupName":
                    strSortColName = "CONSTANT_NAME";
                    break;
                case "lnkbtnSortCode":
                    strSortColName = "Constant_Code";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunGetDNCDetails();

            if (strDirection == "ASC")
            {
                ((Button)gvDNC.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((Button)gvDNC.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}