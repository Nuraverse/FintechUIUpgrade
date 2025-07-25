using S3GBusEntity;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Collection_S3G_Cln_PDCUploadView : ApplyThemeForProject
{
    #region Paging Config

    string strRedirectPage = "~/PDC Module/S3G_Cln_PDCUpload.aspx";
    int intNoofSearch = 2;
    string[] arrSortCol = new string[] { "LKPUP.Name", "FLUPLD.FILE_NAME" };
    //string strProcName = "S3G_CLN_TransLanderApproLogic";
    static string strPageName = "PDC Upload View";
    Dictionary<string, string> Procparam = null;

    ArrayList arrSearchVal = new ArrayList(1);
    int intUserID = 0;
    int intCompanyID = 0;
    int intlevelID = 0;
    int IntProgramID = 552;
    PagingValues ObjPaging = new PagingValues();
    string strDateFormat = string.Empty;
    //User Authorization variable declaration
    UserInfo ObjUserInfo = null;
    string strProgramName;
    public static DataTable dtUserRights;
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

    #region "EVENTS"

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intlevelID = ObjUserInfo.ProUserLevelIdRW;


            #region Paging Config
            arrSearchVal = new ArrayList(intNoofSearch);
            ProPageNumRW = 1;

            //User Authorization
            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            //Authorization Code end

            // Date Format
            S3GSession objSession = new S3GSession();

            strDateFormat = objSession.ProDateFormatRW;
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
                //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
                FunPriSetProgramName();
                FunPriBindGrid();
                TextBox txtHeaderSearch1 = (TextBox)grvPaging.HeaderRow.FindControl("txtHeaderSearch1");
                txtHeaderSearch1.Focus();
                dtUserRights = Utility.UserAccess(0, 0, intUserID, IntProgramID, intCompanyID);

                //Create
                if (!IsUserAccessChecker(1))
                {
                    btnCreate.Enabled_False();
                }

                //Modify
                if (!IsUserAccessChecker(2))
                {
                    grvPaging.Columns[0].Visible = false;
                }

                //Query
                if (!IsUserAccessChecker(4))
                {
                    grvPaging.Columns[0].Visible = false;
                }
            }
            //Authorization Code end
            FunPubSetIndex(1);
            //if (intlevelID <3)
            //{
            //    ImageButton imgbtnEdit = (grvPaging).Rows.fi
            //}
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
    }

    protected void grvPaging_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //User Authorization
                Label lblUserID = (Label)e.Row.FindControl("lblUserID");
                Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
                ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
                Label lblFileStatusID = (Label)e.Row.FindControl("lblFileStatusID");

                // if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text))))
                if ((lblFileStatusID.Text == "2" || lblFileStatusID.Text == "5"))
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
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void grvPaging_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
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
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage, false);
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            FunPriClearSearchValue();
            FunPriBindGrid();
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception objException)
        {
            lblErrorMessage.InnerText = objException.Message;
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #region "FUNCTIONS"

    #region Paging and Searching Methods For Grid

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

            FunPriGetSearchValue();


            Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Workflow_Sequence_ID", "0");

            grvPaging.BindGridView("S3G_CLN_PDCUPLD_PAGING", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvPaging.Rows[0].Visible = false;
            }

            FunPriSetSearchValue();



            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            //temp add
            // grvPaging.Rows[0].Visible = false;
            //ucCustomPaging.Visible = false;

            //temp add

            //Paging Config End
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetSearchValue()
    {
        try
        {
            arrSearchVal = grvPaging.FunPriGetSearchValue(arrSearchVal, intNoofSearch);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriClearSearchValue()
    {
        try
        {
            grvPaging.FunPriClearSearchValue(arrSearchVal);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriSetSearchValue()
    {
        try
        {
            grvPaging.FunPriSetSearchValue(arrSearchVal);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {
        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);

            FunPriGetSearchValue();
            //Replace the corresponding fields needs to search in sqlserver

            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (arrSearchVal[iCount].ToString() != "")
                {
                    //Modified By Chandrasekar K On 25-Sep-2012 For Oracle Case Sensitive Issue
                    //strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '" + arrSearchVal[iCount].ToString() + "%'";
                    strSearchVal += " and (" + arrSortCol[iCount].ToString() + ") like '%" + arrSearchVal[iCount].ToString().ToUpper() + "%'";
                }
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)grvPaging.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception objException)
        {
            throw objException;
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
        catch (Exception objException)
        {
            throw objException;
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
                ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

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
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriSetProgramName()
    {
        try
        {
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Program_ID", "552");
            DataTable dtProgram = Utility.GetDefaultData("S3G_GET_PROGRAM_NAME", strProparm);
            if (dtProgram.Rows.Count > 0)
            {
                strProgramName = dtProgram.Rows[0]["NAME"].ToString();
                lblHeading.Text = strProgramName + " - Details";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    #endregion

    #endregion


    public bool IsUserAccessChecker(int Option)
    {
        bool blnRslt = false;
        try
        {
            object count = null;
            int rcount = 0;
            if (dtUserRights.Rows.Count > 0)
            {
                if (Option == 1)//Create
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "ADDACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 2)//Modify
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "MODIFYACESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                if (Option == 3)//Delete
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "DELETEACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 4)//View/Querry
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "VIEWACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
            }
        }
        catch
        {
            blnRslt = false;
        }
        return blnRslt;
    }

    #endregion
}