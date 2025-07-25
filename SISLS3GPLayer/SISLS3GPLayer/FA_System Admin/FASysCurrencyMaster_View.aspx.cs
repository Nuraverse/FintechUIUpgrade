#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin  
/// Screen Name			: Currency Master View
/// Created By			: Manikandan .R
/// Created Date		: 24-Jan -2012
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

public partial class FASysCurrencyMaster_View : ApplyThemeForProject_FA
{
    #region Intialization
    string strRedirectPage = "~/FA_system%20admin/FASysCurrencyMaster.aspx";
    string strSearchColName;
    PagedDataSource pdsPagerDataSource;
    DataView dvSearchView;
    private Int32 intCount;
    string strSortColName;
    string strConnectionName = string.Empty;
    FASession ObjFASession = new FASession();

    #endregion

    #region Paging Config

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
    #endregion

    #region PageLoad

    protected void Page_Load(object sender, EventArgs e)
    {
        FunPubPageLoad();
    }

    

    #endregion

    #region Page Methods
    /// <summary>
    /// This method is used to Load Currency Master View Page
    /// </summary>
    private void FunPubPageLoad()
    {
        try
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
                    grvCurrencyMaster.Columns[1].Visible = false;
                    grvCurrencyMaster.Columns[0].Visible = false;
                    btnCreate.Enabled_False();
                    return;
                }
                if (!bModify)
                {
                    grvCurrencyMaster.Columns[1].Visible = false;
                }
                if (!bQuery)
                {
                    grvCurrencyMaster.Columns[0].Visible = false;
                }
                if (!bCreate)
                {
                    btnCreate.Enabled_False();
                }
                //Authorization Code end
            }
        }
        catch (Exception Ex)
        {
            cvCurrency.ErrorMessage = "Unable to Load Currency Master";
            cvCurrency.IsValid = false;
            return;
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
            intTotalRecords = 0;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;
            strConnectionName = ObjFASession.ProConnectionName;
            
            bool blnIsNewRow = false;
            FunPriGetSearchValue_FA();
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            try
            {
                grvCurrencyMaster.BindGridView_FA(SPNames.Currency_Paging, Procparam, out intTotalRecords, ObjPaging, out blnIsNewRow);
            }
            catch (Exception ex)
            {
                   FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
            if (blnIsNewRow)
            {
                if (grvCurrencyMaster.Rows.Count >= 1)
                {
                    grvCurrencyMaster.Rows[0].Visible = false;
                }
                if (grvCurrencyMaster.Rows.Count >= 1)
                {
                    grvCurrencyMaster.Rows[0].Visible = false;
                }
            }
            FunPriSetSearchValue_FA();
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);
         
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objFaultExp);
            throw new ApplicationException("Unable to Initialise the Controls in Currency Master");
        }
        catch (Exception ex)
        {
            cvCurrency.ErrorMessage = "Unable to Load Currency Master";
            cvCurrency.IsValid = false;
            return;
        }
        //finally
        //{
        //    objCurrencyMasterClient.Close();
        //}

    }

    #endregion


    #region Paging and Searching Methods For Grid

    /// <summary>
    /// To Get search value to display value after sorting or paging changed
    /// </summary>

    private void FunPriGetSearchValue_FA()
    {
        if (grvCurrencyMaster.HeaderRow != null)
        {
            strSearchVal1 = ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text.Trim();
            strSearchVal2 = ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text.Trim();
            
        }
    }

    /// <summary>
    /// To Clear_FA value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue_FA()
    {
        if (grvCurrencyMaster.HeaderRow != null)
        {
            ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = "";
            ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text = "";
           
        }
    }
    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue_FA()
    {
        if (grvCurrencyMaster.HeaderRow != null)
        {
            ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch1")).Text = strSearchVal1;
            ((TextBox)grvCurrencyMaster.HeaderRow.FindControl("txtHeaderSearch2")).Text = strSearchVal2;
           
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
            //    strSearchVal += "Currency_Code like '%" + strSearchVal1 + "%'";
            //}
            //if (strSearchVal2 != "")
            //{
            //    strSearchVal += " and Currency_Name like '%" + strSearchVal2 + "%'";
            //}

            if (strSearchVal1 != "")
            {
                strSearchVal += "Upper(Currency_Code) like '%" + strSearchVal1.ToUpper() + "%'";
            }
            if (strSearchVal2 != "")
            {
                strSearchVal += " and Upper(Currency_Name) like '%" + strSearchVal2.ToUpper() + "%'";
            }

            // Modified By Chandrasekar K End


            //if (strSearchVal3 != "")
            //{
            //    strSearchVal += " and Currency_Name like '" + strSearchVal3 + "%'";
            //}
            //if (strSearchVal4 != "")
            //{
            //    strSearchVal += " and Currency_Name like '" + strSearchVal4 + "%'";
            //}
            //if (strSearchVal5 != "")
            //{
            //    strSearchVal += " and Currency_Name like '" + strSearchVal5 + "%'";
            //}

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)grvCurrencyMaster.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

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
            throw ex;
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
                case "lnkbtnCurrencyCode":
                    strSortColName = "Currency_Code";
                    break;
                case "lnkbtnCurrencyName":
                    strSortColName = "Currency_Name";
                    break;
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();

            if (strDirection == "ASC")
            {
                ((ImageButton)grvCurrencyMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((ImageButton)grvCurrencyMaster.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
             cvCurrency.ErrorMessage = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            cvCurrency.ErrorMessage = ex.Message;
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    private void FunPubRowDataBound(GridViewRowEventArgs e)
    {
        try
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
        catch (Exception ex)
        {
            cvCurrency.ErrorMessage = "Unable to Load Currency View Grid";
            cvCurrency.IsValid = false;
            throw ex;

        }
    }

    #endregion

    #region Page Events


    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage);
    }

    protected void grvCurrencyMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            FunPubRowDataBound(e);
        }
        catch (Exception ex)
        {
            cvCurrency.ErrorMessage = ex.Message;
        }
    }

   

    protected void grvCurrencyMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
        switch (e.CommandName.ToLower())
        {
            case "modify":
                Response.Redirect(strRedirectPage + "?qsCurrencyId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                break;
            case "query":
                Response.Redirect(strRedirectPage + "?qsCurrencyId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
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
            FunPriBindGrid();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    public string FunPriGetURL(string strId)
    {
        return (strRedirectPage + "?qsCurrencyId=" + strId + "&mode=Q");
    }

    #endregion

}
