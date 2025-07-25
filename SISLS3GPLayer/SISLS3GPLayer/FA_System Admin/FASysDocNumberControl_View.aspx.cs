#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Document Number Control View
/// Created By			: Muni Kavitha
/// Created Date		: 18-Jan-2012
/// Purpose	            : To define DocumentNumber Types for the program
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Globalization;
using System.ServiceModel;
using Resources;
using System.Web.UI.WebControls.WebParts;
using FA_BusEntity;
using System.Text;

#endregion

public partial class Sysadm_FASysDocNumberControl_View : ApplyThemeForProject_FA
{
    #region Intialization
   
  
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objDNCClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable objDNCDetails_DTB = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable();
    int intNoofSearch = 2;
    string[] arrSortCol = new string[] { "LocationCat_Description", "Document_Type_Desc"};
    int intDocumentSeqId = 0;
    string strSearchColName;
    string strRedirectPageAdd = "~/System Admin/FASysDocNumberControl_Add.aspx";
    PagedDataSource pdsPagerDataSource;
    DataView dvSearchView;
    ArrayList arrSearchVal = new ArrayList(1);
    FASession objSession = new FASession();
    private Int32 intCount;
    string strSortColName;
    string strConnectionName = "";
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
    UserInfo_FA ObjUserInfo_FA = null;
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
            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            objSession = new FASession();
            strConnectionName = objSession.ProConnectionName;
            
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            if (!IsPostBack)
            {
                FunGetDNCDetails();
                if (!bIsActive)
                {
                    gvDNC.Columns[2].Visible = false;
                    gvDNC.Columns[1].Visible = false;
                    btnCreate.Enabled = false;
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
                    btnCreate.Enabled = false;
                }
                btnCreate.Focus();

            }
        }

        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;

        }

    }
    #endregion

    #region Page Methods

    /// <summary>
    /// Tos et search value after sorting or paging changed
    /// </summary>
    private void FunPriSetSearchValue_FA()
    {
        try
        {
            
           
            gvDNC.FunPriSetSearchValue_FA(arrSearchVal);
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }
    /// <summary>
    ///  This method used Get DNC Details
    /// </summary>
    private void FunGetDNCDetails()
    {
        objDNCClient=new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            int intTotalRecords = 0;
           FA_BusEntity .SysAdmin .SystemAdmin .FA_Sys_DNCDetailsRow objDNCDetailsRow;
            objDNCDetailsRow = objDNCDetails_DTB.NewFA_Sys_DNCDetailsRow();
            objDNCDetailsRow.Doc_Number_Seq_ID = intDocumentSeqId;
            objDNCDetailsRow.Company_ID = intCompanyID;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;
            ObjPaging.ProProgram_ID = 10;
            objDNCDetails_DTB.AddFA_Sys_DNCDetailsRow(objDNCDetailsRow);
            FASerializationMode SerMode = FASerializationMode.Binary;
            byte[] byteDNCDetails = objDNCClient.FunPubGetDNCDetails_View(SerMode, FAClsPubSerialize.Serialize(objDNCDetails_DTB, SerMode), strConnectionName, ObjPaging,out  intTotalRecords);
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable dtDNC = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable)FAClsPubSerialize.DeSerialize(byteDNCDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable));
            DataView dvDNC = dtDNC.DefaultView;

            //Paging Config

            FunPriGetSearchValue_FA();
            bool bIsNewRow = false;
            if (dvDNC.Count == 0)
            {

                dvDNC.AddNew();
                bIsNewRow = true;
            }


            //if (this.ViewState["strSortExpression"] != null)
            //{
            //    dvDNC.Sort = this.ViewState["strSortExpression"].ToString() + " " + this.ViewState["strSortDirection"].ToString();
            //}

            gvDNC.DataSource = dvDNC;// FunPriTrimdt(dvDNC.ToTable());//FunPriGetPagedSource(dvDNC);
            gvDNC.DataBind();

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                intTotalRecords = 0;
                gvDNC.Rows[0].Visible = false;
            }

            //ViewState["SearchCurrencyGrid"] = dtDNC;
            //Session["SearchCurrencyDataView"] = null;
            //Session["AfterCurrencySearch"] = "No";
            //gvDNC.HeaderStyle.CssClass = "styleGridHeader";

            FunPriSetSearchValue_FA();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);


        }
        //catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //       FAClsPubCommErrorLog.CustomErrorRoutine(objFaultExp);
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            //if(ObjDNCClient!=null)
            objDNCClient.Close();
        }
    }
    /// <summary>
    /// To Clear_FA value after show all is clicked
    /// </summary>
    private void FunPriClearSearchValue_FA()
    {
        try
        {

            gvDNC.FunPriClearSearchValue_FA(arrSearchVal);
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }
    #endregion

    #region Pageing and sorting
    private void FunPridoPaging()
    {
        try
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            for (int i = 0; i < pdsPagerDataSource.PageCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }

       
    }

    /// <summary>
    /// To Search in Grid view Gets the text box as sender and gets its text
    /// </summary>
    /// <param name="sender">Text box in gridview</param>
    /// <param name="e"></param>
    private void FunPriGetSearchValue_FA()
    {
        try
        {
            arrSearchVal = gvDNC.FunPriGetSearchValue_FA(arrSearchVal, intNoofSearch);
           
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    /// <summary>
    /// This method used header Searching
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void FunProHeaderSearch(object sender, EventArgs e)
    {
        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);
            FunPriGetSearchValue_FA();
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (arrSearchVal[iCount].ToString() != "")
                {
                    // Modified By Chandrasekar K On 01-09-2012 For Oracle Case sensitive issue

                    //strSearchVal += " and " + arrSortCol[iCount].ToString() + ") like '%" + arrSearchVal[iCount].ToString() + "%'";
                    
                    strSearchVal += " and Upper(" + arrSortCol[iCount].ToString() + ") like '%" + arrSearchVal[iCount].ToString().ToUpper() + "%'";
                }
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }
           

            hdnSearch.Value = strSearchVal;
            FunGetDNCDetails();
            FunPriSetSearchValue_FA();
            if (txtboxSearch.Text != "")
                ((TextBox)gvDNC.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }
   

    /// <summary>
    /// This method using Sorting
    /// </summary>
    /// <param name="strColumn"></param>
    /// <returns></returns>
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
            lblErrorMessage.Text = ex.Message;
        }
        return strSortDirection;

      
    }

    /// <summary>
    /// This methode used filtering using the grid
    /// </summary>
    /// <param name="dtTable"></param>
    /// <param name="strColumnName"></param>
    /// <param name="strSearchExp"></param>
    /// <returns></returns>
    private DataView FuncPriFilterGrid(DataTable dtTable, string strColumnName, string strSearchExp)
    {

        if (dtTable != null || dtTable.Rows.Count > 0)
        {
            if (Session["SearchCurrencyDataView"] == null)
            {
                dvSearchView = new DataView(dtTable);
            }
            else
            {
                dvSearchView = (DataView)Session["SearchCurrencyDataView"];
            }

            if (strSearchExp != "")
            {
                if (strSearchExp.StartsWith("and"))
                {
                    strSearchExp = strSearchExp.Substring(3);
                }
                dvSearchView.RowFilter = strSearchExp;

            }
        }
        Session["SearchCurrencyDataView"] = dvSearchView;
        return dvSearchView;

    }

    public int ProCurrentPageRW
    {
        get
        {
            if (this.ViewState["CurrentPageRW"] == null)
                return 0;
            else
                return Convert.ToInt16(this.ViewState["CurrentPageRW"].ToString());
        }
        set
        {
            this.ViewState["CurrentPageRW"] = value;
        }
    }
    /// <summary>
    /// Property Used for Page Count
    /// </summary>
    private Int32 ProPageCountRW
    {

        get { return intCount; }
        set { intCount = value; }
    }


    private void FuncPriBindCurrencyGrid()
    {
        try
        {
            if (ViewState["SearchCurrencyGrid"] != null)
            {
                //Session AfterCurrencySearch Value is checked since we need to Show only Searched Records or All Records if Value is NO 
                if (Session["SearchCurrencyDataView"] == null || Session["AfterCurrencySearch"].ToString() == "No")
                {
                    dvSearchView = ((DataTable)ViewState["SearchCurrencyGrid"]).DefaultView;
                }
                else
                {
                    dvSearchView = (DataView)Session["SearchCurrencyDataView"];

                }
                if (this.ViewState["strSortExpression"] != null)
                {
                    dvSearchView.Sort = this.ViewState["strSortExpression"].ToString() + " " + this.ViewState["strSortDirection"].ToString();
                }
                gvDNC.DataSource = dvSearchView;
                gvDNC.DataBind();

            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        try
        {
            arrSearchVal = new ArrayList(intNoofSearch);
            var imgbtnSearch = string.Empty;
            //ImageButton imgbtnSearch = (ImageButton)sender;
            LinkButton lnkbtnSearch = (LinkButton)sender;
            imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");
            string strSortColName = string.Empty;
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (lnkbtnSearch.ID == "lnkbtnSort" + (iCount + 1).ToString())
                {
                    strSortColName = arrSortCol[iCount].ToString();
                    break;
                }
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);


            FunGetDNCDetails();

            if (strDirection == "ASC")
            {
                ((ImageButton)gvDNC.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((ImageButton)gvDNC.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }

            
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

   



    protected void dlstPager_ItemCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("lnkbtnDNCPaging"))
            {
                ProPageCountRW = Convert.ToInt32(e.CommandArgument);
                ProCurrentPageRW = Convert.ToInt16(e.CommandArgument.ToString());
                FuncPriBindCurrencyGrid();
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    protected void dlstPager_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        System.Web.UI.WebControls.LinkButton lnkbtnPage;

        try
        {
            lnkbtnPage = (System.Web.UI.WebControls.LinkButton)e.Item.FindControl("lnkbtnDNCPaging");
            if (lnkbtnPage.Text == Convert.ToString(ProCurrentPageRW + 1))
            {
                lnkbtnPage.Enabled = false;
                ViewState["dlstPager_ItemDataBound"] = Convert.ToInt32(((Label)e.Item.FindControl("lblCount")).Text.Trim());
                ((Label)gvDNC.BottomPagerRow.FindControl("lblPagerSearch")).Text = " of  " + ((int)ViewState["TotalPageCount"] + 1).ToString().Trim();
                ((TextBox)gvDNC.BottomPagerRow.FindControl("txtPagerSearch")).Text = lnkbtnPage.Text;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }



    #endregion

    #region Page Events
    private DataTable FunPriTrimdt(DataTable dt)
    {
        if ((dt != null) && (dt.Rows.Count > 0))
        {
            if (!(string.IsNullOrEmpty(hdnOrderBy.Value)))
            {
                dt.DefaultView.Sort = hdnOrderBy.Value;
                dt = dt.DefaultView.ToTable();
            }
            for (int i_dt = 0; i_dt < dt.Rows.Count; i_dt++)
            {
                dt.Rows[i_dt]["RowNumber"] = (i_dt + 1);
            }
        }
        return dt;
    }

    /// <summary>
    /// Onclick create new DNC 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/FA_System Admin/FASysDocNumberControl_Add.aspx");
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }
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
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }
    protected void gvDNC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lblDNCActive = (Label)e.Row.FindControl("lblDNCActive");
                CheckBox chkAct = (CheckBox)e.Row.FindControl("CbxDNCActive");
                if (lblDNCActive.Text == "True")
                {
                    chkAct.Checked = true;
                }

                //User Authorization
                Label lblUserID = (Label)e.Row.FindControl("lblUserID");
                Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
                ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnModify");
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
                    //Authorization code end   
                }


            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    /// <summary>
    /// Show all the records in click event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            lblErrorMessage.Text = "";

            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue_FA();
            FunGetDNCDetails();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }


    /// <summary>
    /// Passing DNC ID for Modify mode
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvDNC_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            switch (e.CommandName.ToLower())
            {
                case "modify":
                    Response.Redirect(strRedirectPageAdd + "?qsDNCId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
                    break;
                case "query":
                    Response.Redirect(strRedirectPageAdd + "?qsDNCId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
                    break;

            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #endregion
}

