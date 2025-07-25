


#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: User Management View
/// Created By			: M.Saran
/// Created Date		: 02-Feb-2012
/// Purpose	            : 
/// Reason              : System Admin User Management View Developement
/// <Program Summary>
#endregion


#region "Name Spaces"

using System;
using System.Threading;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Data;
using System.Text;
using System.Configuration;
using System.Web.Security;
#endregion

public partial class System_Admin_FAUserManagement_View : ApplyThemeForProject_FA
{
    #region Intialization
    FASerializationMode SerMode = FASerializationMode.Binary;
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objUserManagementClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable ObjFA_SYS_UserManagementDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable ObjFA_SYS_UserMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable dtUser;


    string strRedirectPage = "~/FA_System Admin/FAUserManagement_Add.aspx";
    string strSearchColName;
    PagedDataSource pdsPagerDataSource;
    DataView dvSearchView;
    private Int32 intCount;
    string strSortColName;
    int intCompanyID = 0;
    #endregion

    #region Paging Config

    string strSearchVal1 = string.Empty;
    string strSearchVal2 = string.Empty;
    string strSearchVal3 = string.Empty;
    string strSearchVal4 = string.Empty;
    string strSearchVal5 = string.Empty;
    int intUserID = 0;
    UserInfo_FA ObjUserInfo_FA = null;
    bool bModify = false;
    bool bCreate = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    FAPagingValues ObjPaging = new FAPagingValues();
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
        FunGetUserDetails();
    }
    #endregion

    #region PageLoad

    protected void Page_Load(object sender, EventArgs e)
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

        ObjUserInfo_FA = new UserInfo_FA();
        intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;

        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
        lblErrorMessage.InnerText = "";

        if (!IsPostBack)
        {
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            FunGetUserDetails();
            if (!bIsActive)
            {
                grvUserManagement.Columns[1].Visible = false;
                grvUserManagement.Columns[0].Visible = false;
                btnCreate.Enabled_False();
                return;
            }

            if (!bModify)
            {
                grvUserManagement.Columns[1].Visible = false;
            }

            if (!bQuery)
            {
                grvUserManagement.Columns[0].Visible = false;
            }
            if (!bCreate)
            {
                btnCreate.Enabled_False();
            }



        }
    }

    #endregion

    #region Page Methods

    /// <summary>
    /// This method is used to display user details
    /// </summary>

    private void FunGetUserDetails()
    {
        objUserManagementClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow;

            ObjFA_SYS_UserManagementDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable();
            ObjUserManagementRow = ObjFA_SYS_UserManagementDataTable.NewFA_SYS_UserManagementRow();
            ObjUserManagementRow.Company_ID = intCompanyID;
            ObjUserManagementRow.User_ID = 0;

            //Paging Properties set

            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = 0;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            //Paging Properties end
            ObjFA_SYS_UserManagementDataTable.AddFA_SYS_UserManagementRow(ObjUserManagementRow);
            byte[] byteUserDetails = objUserManagementClient.FunPubQueryUserPaging(SerMode, FAClsPubSerialize.Serialize(ObjFA_SYS_UserManagementDataTable, SerMode), ObjFASession.ProConnectionName, ObjPaging,out  intTotalRecords);

            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable dtUser = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(byteUserDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
            DataView dvUser = dtUser.DefaultView;

            //Paging Config

            FunPriGetSearchValue_FA();

            //This is to show grid header
            bool bIsNewRow = false;
            if (dvUser.Count == 0)
            {
                dvUser.AddNew();
                bIsNewRow = true;
            }

            grvUserManagement.DataSource = dvUser;
            grvUserManagement.DataBind();

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvUserManagement.Rows[0].Visible = false;
            }

            FunPriSetSearchValue_FA();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            //Paging Config End


        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
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

    #endregion

    #region Paging and Searching Methods For Grid

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>

    private void FunPriGetSearchValue_FA()
    {
        if (grvUserManagement.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();
            strSearchVal2 = ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch2")).Text.Trim();
            strSearchVal3 = ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch3")).Text.Trim();
            strSearchVal4 = ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch4")).Text.Trim();
            //strSearchVal5 = ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch5")).Text.Trim();
            if (strSearchVal1 != null && strSearchVal1.Contains("'"))
                strSearchVal1 = strSearchVal1.Replace("'", "''");
            if (strSearchVal2 != null && strSearchVal2.Contains("'"))
                strSearchVal2 = strSearchVal2.Replace("'", "''");
            if (strSearchVal3 != null && strSearchVal3.Contains("'"))
                strSearchVal3 = strSearchVal3.Replace("'", "''");
            if (strSearchVal4 != null && strSearchVal4.Contains("'"))
                strSearchVal4 = strSearchVal4.Replace("'", "''"); 
        }
    }

    /// <summary>
    /// To Clear_FA value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue_FA()
    {
        if (grvUserManagement.HeaderRow != null)
        {
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch2")).Text = "";
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch3")).Text = "";
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch4")).Text = "";
            //((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch5")).Text = "";
        }
    }
    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue_FA()
    {
        if (grvUserManagement.HeaderRow != null)
        {
            if (strSearchVal1 != null && strSearchVal1.Contains("'"))
                strSearchVal1 = strSearchVal1.Replace("''", "'");
            if (strSearchVal2 != null && strSearchVal2.Contains("'"))
                strSearchVal2 = strSearchVal2.Replace("''", "'");
            if (strSearchVal3 != null && strSearchVal3.Contains("'"))
                strSearchVal3 = strSearchVal3.Replace("''", "'");
            if (strSearchVal4 != null && strSearchVal4.Contains("'"))
                strSearchVal4 = strSearchVal4.Replace("''", "'");
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch2")).Text = strSearchVal2;
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch3")).Text = strSearchVal3;
            ((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch4")).Text = strSearchVal4;
            //((TextBox)grvUserManagement.HeaderRow.FindControl("txtHeaderSearch5")).Text = strSearchVal5;
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

            // Modified By Chandrasekar K On 01-09-2012 For Oracle Case sensitive issue

            //if (strSearchVal1 != "")
            //{
            //    strSearchVal += "User_Code like '" + strSearchVal1 + "%'";
            //}
            //if (strSearchVal2 != "")
            //{
            //    strSearchVal += " and User_Name like '" + strSearchVal2 + "%'";
            //}
            //if (strSearchVal3 != "")
            //{
            //    strSearchVal += " and EMail_Id like '" + strSearchVal3 + "%'";
            //}
            //if (strSearchVal4 != "")
            //{
            //    strSearchVal += " and Designation like '" + strSearchVal4 + "%'";
            //}


            if (strSearchVal1 != "")
            {
                strSearchVal += "Upper(User_Code) like '%" + strSearchVal1.ToUpper() + "%'";
            }
            if (strSearchVal2 != "")
            {
                strSearchVal += " and Upper(User_Name) like '%" + strSearchVal2.ToUpper() + "%'";
            }
            if (strSearchVal3 != "")
            {
                strSearchVal += " and Upper(EMail_Id) like '%" + strSearchVal3.ToUpper() + "%'";
            }
            if (strSearchVal4 != "")
            {
                strSearchVal += " and Upper(Designation) like '%" + strSearchVal4.ToUpper() + "%'";
            }

            //if (strSearchVal5 != "")
            //{
            //    strSearchVal += " and LOB_Name like '" + strSearchVal5 + "%'";
            //}

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunGetUserDetails();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvUserManagement.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                case "lnkbtnUserCode":
                    strSortColName = "User_Code";
                    break;
                case "lnkbtnUserName":
                    strSortColName = "User_Name";
                    break;
                case "lnkbtnEMailId":
                    strSortColName = "EMail_Id";
                    break;
                case "lnkbtnDesignation":
                    strSortColName = "Designation";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunGetUserDetails();

            if (strDirection == "ASC")
            {
                ((ImageButton)grvUserManagement.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((ImageButton)grvUserManagement.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    #endregion

    #region Page Events


    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
    }

    protected void grvUserManagement_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblActive = (Label)e.Row.FindControl("lblActive");
            CheckBox chkAct = (CheckBox)e.Row.FindControl("chkActive");
            if (lblActive.Text == "True")
            {
                chkAct.Checked = true;
            }

            //User Authorization
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            if (lblUserID.Text != "")
            {
                if ((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text))))
                {
                    imgbtnEdit.Enabled = true;
                }
                else
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }

                //Code Added by saran on 23-Jan-2012 as per the observation raised by malaolan start
                if ((Convert.ToInt32(imgbtnEdit.CommandArgument) == ObjUserInfo_FA.ProUserIdRW) && (ObjUserInfo_FA.ProUserLevelIdRW != 5))
                {
                    imgbtnEdit.Enabled = false;
                    imgbtnEdit.CssClass = "styleGridEditDisabled";
                }
                //Code Added by saran on 23-Jan-2012 as per the observation raised by malaolan end
            }
            //Authorization code end   

        }

    }

    protected void grvUserManagement_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "?qsUserId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                break;
            case "query":
                Response.Redirect(strRedirectPage + "?qsUserId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                break;

        }

    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue_FA();
            FunGetUserDetails();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    #endregion

}
