#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin  
/// Screen Name			: Role Code Master View
/// Created By			: Manikandan .R
/// Created Date		: 31-Jan -2012
/// Purpose	            : 
#endregion
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

public partial class System_Admin_FASysRoleCodeMaster_View : ApplyThemeForProject_FA
{
    #region Initialization
    string strRedirectPage = "~/FA_System Admin/FASysRoleCodeMaster_Add.aspx";
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    string strConnectionName = string.Empty;
    bool bIsActive = false;
    bool bMakerChecker = false;
    UserInfo_FA ObjUserInfo_FA = null;
    FASession ObjFASession = new FASession();
    #endregion

    #region PageLoad
    /// <summary>
    ///Page Load Event
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        FunPubPageLoad();
    }

   
    #endregion

    #region Functions
    /// <summary>
    /// To Load the Role Center View Page
    /// </summary>
    private void FunPubPageLoad()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
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
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            if (!IsPostBack)
            {
                FunPriBindGrid();

                if (!bIsActive)
                {
                    grvRoleCenterMaster.Columns[1].Visible = false;
                    grvRoleCenterMaster.Columns[0].Visible = false;
                    btnCreate.Enabled_False();
                    return;
                }
                if (!bModify)
                {
                    grvRoleCenterMaster.Columns[1].Visible = false;
                }

                if (!bQuery)
                {
                    grvRoleCenterMaster.Columns[0].Visible = false;
                }
                if (!bCreate)
                {
                    btnCreate.Enabled_False();
                }
            }
        }
        catch (Exception ae)
        {
            lblErrorMessage.InnerText = ae.Message;
            //throw ae;
        }
    }
    /// <summary>
    ///Bind Role Code Details
    /// </summary>
    private void FunPriBindGrid()
    {
        try
        {
            int intTotalRecords = 0;
            intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProUser_ID = intUserID;
            strConnectionName = ObjFASession.ProConnectionName;
            bool blnIsNewRow = false;
            FunPriGetSearchValue_FA();
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            try
            {
                grvRoleCenterMaster.BindGridView_FA(SPNames.Get_RCM_Paging, Procparam, out intTotalRecords, ObjPaging, out blnIsNewRow);            }
            catch (Exception ex)
            {
                   FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
            if (blnIsNewRow)
            {
                if (grvRoleCenterMaster.Rows.Count >= 1)
                {
                    grvRoleCenterMaster.Rows[0].Visible = false;
                }
                if (grvRoleCenterMaster.Rows.Count >= 1)
                {
                    grvRoleCenterMaster.Rows[0].Visible = false;
                }
            }
            FunPriSetSearchValue_FA();
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        //finally
        //{
        //    objCurrencyMasterClient.Close();
        //}

    }
    /// <summary>
    /// This method is used to display product details
    /// </summary>
    #region Paging and Searching Methods For Grid

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>



    /// <summary>
    /// To Clear_FA value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue_FA()
    {
        try
        {
            if (grvRoleCenterMaster.HeaderRow != null)
            {
                ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderRoleCode")).Text = "";
                ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderProgramCode")).Text = "";
               
            }
        }
        catch (Exception e)
        {
            lblErrorMessage.InnerText = e.Message;
            throw e;
        }
    }
    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue_FA()
    {
        try
        {
            if (grvRoleCenterMaster.HeaderRow != null)
            {

                ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderRoleCode")).Text = strSearchVal2;
                ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderProgramCode")).Text = strSearchVal4;
                
            }
        }
        catch (Exception e)
        {
            lblErrorMessage.InnerText = e.Message;
            throw e;
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

            //if (strSearchVal2 != "")
            //{
            //    strSearchVal += " and Role_Code like '%" + strSearchVal2 + "%'";
            //}
           
            //if (strSearchVal4 != "")
            //{
            //    strSearchVal += " and Program_Name like '%" + strSearchVal4 + "%'";
            //}


            if (strSearchVal2 != "")
            {
                strSearchVal += " and Upper(Role_Code) like '%" + strSearchVal2.ToUpper() + "%'";
            }

            if (strSearchVal4 != "")
            {
                strSearchVal += " and Upper(Program_Name) like '%" + strSearchVal4.ToUpper() + "%'";
            }

          
            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
            throw ex;
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
            throw ex;
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
              
                   
                case "lnkbtnRoleCode":
                    strSortColName = "Role_Code";
                    break;
                case "lnkbtnProgramCode":
                    strSortColName = "Program_Name";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((ImageButton)grvRoleCenterMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((ImageButton)grvRoleCenterMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
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
    #region Paging Config

    string strSearchVal1 = string.Empty;
    string strSearchVal2 = string.Empty;
    string strSearchVal3 = string.Empty;
    string strSearchVal4 = string.Empty;
    string strSearchVal5 = string.Empty;
    int intUserID = 0;
    int intCompanyID = 0;
    FAPagingValues ObjPaging = new FAPagingValues();

    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    /// <summary>
    ///Assign Page Number
    /// </summary>
    public int ProPageNumRW
    {
        get;
        set;
    }
    /// <summary>
    ///Assign Page Size
    /// </summary>
    public int ProPageSizeRW
    {
        get;
        set;

    }

    protected void AssignValue(int intPageNum, int intPageSize)
    {
        try
        {
            ProPageNumRW = intPageNum;
            ProPageSizeRW = intPageSize;
            FunPriBindGrid();
        }
        catch (Exception e)
        {
            throw e;
        }
    }
    #region Paging and Searching Methods For Grid

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>

    private void FunPriGetSearchValue_FA()
    {
        try
        {
            if (grvRoleCenterMaster.HeaderRow != null)
            {

                strSearchVal2 = ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderRoleCode")).Text.Trim();
                strSearchVal4 = ((TextBox)grvRoleCenterMaster.HeaderRow.FindControl("txtHeaderProgramCode")).Text.Trim();

            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    public string FunPriGetURL(string strId)
    {
        try
        {
            return (strRedirectPage + "?RCid=" + strId + "&mode=Q");
        }
        catch (Exception ae)
        {
            throw ae;
            lblErrorMessage.InnerText = ae.Message;
        }
    }

    #endregion
    #endregion

    #endregion

    #region Page Events

    protected void grvRoleCenterMaster_DataBound(object sender, EventArgs e)
    {
        try
        {
            if (grvRoleCenterMaster.Rows.Count > 0)
            {
                grvRoleCenterMaster.UseAccessibleHeader = true;
                grvRoleCenterMaster.HeaderRow.TableSection = TableRowSection.TableHeader;
                grvRoleCenterMaster.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
        catch (Exception ae)
        {
            lblErrorMessage.InnerText = ae.Message;
            throw ae;
        }
    }
    protected void grvRoleCenterMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            //if(e.Row.DataItem(""))
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblActive = (Label)e.Row.FindControl("lblActive");
                CheckBox chkAct = (CheckBox)e.Row.FindControl("chkActive");
                if (lblActive.Text == "True")
                {
                    chkAct.Checked = true;
                }

                //grvRoleCenterMaster.RowHeaderColumn.

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
                }
                //Authorization code end   

            }
        }
        catch (Exception ae)
        {
            throw ae;
            lblErrorMessage.InnerText = ae.Message;
        }
    }
    protected void grvRoleCenterMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            switch (e.CommandName.ToLower())
            {
                case "modify":
                    Response.Redirect("~/FA_System Admin/FASysRoleCodeMaster_Add.aspx?qsRCId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                    break;
                case "query":
                    Response.Redirect("~/FA_System Admin/FASysRoleCodeMaster_Add.aspx?qsRCId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                    break;
            }
        }
        catch (Exception ae)
        {
            throw ae;
            lblErrorMessage.InnerText = ae.Message;
        }
    }
    /// <summary>
    ///Navigation Create Mode
    /// </summary>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage);
        }
        catch (Exception ae)
        {
            throw ae;
        }
    }
    /// <summary>
    ///Show All Role Code Details
    /// </summary>
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

    
   
}
