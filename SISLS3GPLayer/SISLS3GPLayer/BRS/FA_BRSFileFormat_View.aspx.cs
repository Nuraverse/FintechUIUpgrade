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
using System.Collections.Generic;
using FA_BusEntity;
using System.Globalization;
using System.Text;



public partial class BRS_FA_BRSFileFormat_View : ApplyThemeForProject_FA
{
    #region Paging Config
    string strRedirectPage = "~/BRS/FA_BRSFileFormat_Add.aspx";
    int intNoofSearch = 1;
    string[] arrSortCol = new string[] { "BNKDT.Bank_Name" };
    //string strProcName = "S3G_CLN_TransLanderApproLogic";
    static string strPageName = "BRS File Format View";
    Dictionary<string, string> Procparam = null;

    ArrayList arrSearchVal = new ArrayList(1);
    int intUserID = 0;
    int intCompanyID = 0;
    int intlevelID = 0;
    FAPagingValues ObjPaging = new FAPagingValues();
    string strDateFormat = string.Empty;
    //User Authorization variable declaration
    UserInfo_FA ObjUserInfo_FA = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;

    //Declaration end

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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intlevelID = ObjUserInfo_FA.ProUserLevelIdRW;
            //this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            #region Paging Config
            arrSearchVal = new ArrayList(intNoofSearch);
            ProPageNumRW = 1;

            //User Authorization
            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;

            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            //bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            //Authorization Code end

            // Date Format
            FASession objFASession = new FASession();
            strDateFormat = objFASession.ProDateFormatRW;
            //End Date Format

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

            if (!IsPostBack)
            {
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                FunPriBindGrid();
                btnCreate.Focus();
            }
            //User Authorization
            if (!bIsActive)
            {
                grvPaging.Columns[1].Visible = false;
                grvPaging.Columns[0].Visible = false;
                btnCreate.Enabled = false;
                return;
            }
            if (!bModify)
            {
                //grvPaging.Columns[1].Visible = false;
            }
            if (!bQuery)
            {
                grvPaging.Columns[0].Visible = false;
            }
            if (!bCreate)
            {
                btnCreate.Enabled = false;
            }
            //Authorization Code end
           // FunPubSetIndex(1);
            //if (intlevelID <3)
            //{
            //    ImageButton imgbtnEdit = (grvPaging).Rows.fi
            //}
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }

    protected void grvPaging_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //User Authorization
            //Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            //Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            if (((ImageButton)e.Row.FindControl("imgbtfile")).CommandArgument == "13")
            {
                ((ImageButton)e.Row.FindControl("imgbtfile")).ImageUrl = "~/Images/Excel_Over.png";
                ImageButton imgbtfile = ((ImageButton)e.Row.FindControl("imgbtfile"));
            }

            else
            {
                ((ImageButton)e.Row.FindControl("imgbtfile")).Visible = false;

            }

            imgbtnEdit.Enabled = true;
        }

    }

    protected void grvPaging_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "modify")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            Response.Redirect(strRedirectPage + "?qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M", false);
        }
        if (e.CommandName.ToLower() == "query")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            Response.Redirect(strRedirectPage + "?qsViewId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q", false);
        }


    }
    
    public void ExportToExcel(DataTable dt)
    {
        string str = string.Empty;
        string filename = "Columns.xls";
        System.IO.StringWriter tw = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(tw);

        DataGrid dgGrid = new DataGrid();
        dgGrid.DataSource = dt;
        dgGrid.DataBind();
        str += "<tr>";
        foreach (DataColumn dcol in dt.Columns)
        {

            str += "<td>";
            str += dcol.ToString();
            str += "</td>";

        }
        str += "</tr>";
        //Get the HTML for the control.
        dgGrid.RenderControl(hw);
        //Write the HTML back to the browser.
        //Response.ContentType = application/vnd.ms-excel;
        Response.ContentType = "application/vnd.ms-excel";
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename + "");
        Response.Write("<html xmlns:x='urn:schemas-microsoft-com:office:excel'>");
        Response.Write("<head>");
        Response.Write("<meta http-equiv='Content-Type' content='text/html;charset=windows-1252'>");
        Response.Write("<!--[if gte mso 9]>");
        Response.Write("<xml>");
        Response.Write("<x:ExcelWorkbook>");
        Response.Write("<x:ExcelWorksheets>");
        Response.Write("<x:ExcelWorksheet>");
        //this line names the worksheet
        Response.Write("<x:Name>gridlineTest</x:Name>");
        Response.Write("<x:WorksheetOptions>");
        //these 2 lines are what works the magic
        Response.Write("<x:Panes>");
        Response.Write("</x:Panes>");
        Response.Write("</x:WorksheetOptions>");
        Response.Write("</x:ExcelWorksheet>");
        Response.Write("</x:ExcelWorksheets>");
        Response.Write("</x:ExcelWorkbook>");
        Response.Write("</xml>");
        Response.Write("<![endif]-->");
        Response.Write("</head>");
        Response.Write("<body>");
        Response.Write("<table>");
        Response.Write(str);
        Response.Write("</table>");
        Response.Write("</body>");
        Response.Write("</html>");


        Response.Write(tw.ToString());
        Response.End();

    }

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
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

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

            grvPaging.BindGridView_FA("FA_BRSFileFormat_Mst_Paging", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvPaging.Rows[0].Visible = false;
            }

            FunPriSetSearchValue_FA();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            //Paging Config End
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }

    }

    #region Paging and Searching Methods For Grid

    private void FunPriGetSearchValue_FA()
    {
        arrSearchVal = grvPaging.FunPriGetSearchValue_FA(arrSearchVal, intNoofSearch);
    }

    private void FunPriClearSearchValue_FA()
    {
        grvPaging.FunPriClearSearchValue_FA(arrSearchVal);
    }

    private void FunPriSetSearchValue_FA()
    {
        grvPaging.FunPriClearSearchValue_FA(arrSearchVal);
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
                    //Modified By Chandrasekar K On 25-Sep-2012 For Oracle Case Sensitive Issue
                    //strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '" + arrSearchVal[iCount].ToString() + "%'";
                    strSearchVal += " and Upper(" + arrSortCol[iCount].ToString() + ") like '%" + arrSearchVal[iCount].ToString().ToUpper() + "%'";
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
                ((TextBox)grvPaging.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                ((ImageButton)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((ImageButton)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    #endregion
    
    #region  DateFormat
    
    public string FormatDate(string strDate)
    {
        try
        {
            if ((strDate.Trim()).Length > 0)
                return DateTime.Parse(strDate, CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
            else
                return string.Empty;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }
    
    #endregion
    
    protected void imgbtfile_Click(object sender, ImageClickEventArgs e)
    {
        Dictionary<string, string> dictparam = new Dictionary<string, string>();
        dictparam.Add("@Id", ((ImageButton)grvPaging.Rows[(Int16)Utility_FA.FunPubGetGridRowID("grvPaging", ((ImageButton)sender).ClientID)].FindControl("imgbtnEdit")).CommandArgument);
        DataTable dtcol = Utility_FA.GetDefaultData("FA_Get_FileFormatColName", dictparam);
        using (DataTable dtexcel = new DataTable())
        {
            foreach (DataRow drow in dtcol.Rows)
            {
                dtexcel.Columns.Add(drow["field_desc"].ToString());

            }
            ExportToExcel(dtexcel);

        }
    }
    
    protected void imgbtfile_DataBinding(object sender, EventArgs e)
    {
        ImageButton imgbtn = (ImageButton)sender;
        ScriptManager sm = (ScriptManager)Page.Master.FindControl("ScriptManager1");
        sm.RegisterPostBackControl(imgbtn);
    }
}