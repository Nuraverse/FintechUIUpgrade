#region PageHeader
/// © 2013 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Transaction History Details
/// Screen Name         :   S3GSysTransactionHistory
/// Created By          :   SATHISH R 
/// Created Date        :   18-Sep-2013
/// Purpose             :   To See Transaction Details
/// <Program Summary>
#endregion
using System;
using System.Collections;
using System.Collections.Generic;
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
//using COLLATERAL = FA_BusEntity.Collateral;
//using COLLATERALSERVICES = CollateralMgtServicesReference;
using System.IO;
using System.Globalization;
using System.Web.Services;
using System.ServiceModel;
using System.Text;

public partial class System_Admin_FASysTransactionHistory : ApplyThemeForProject_FA
{
    #region [Common Variable declaration]
    DataTable dtAuditTrial;
    int intCompanyId, intUserId, intUserLevelId = 0;
    static int intCustomer = 0;
    string StrConnectionName;

    Dictionary<string, string> Procparam = null;
    int intErrCode = 0;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();

    FAPagingValues ObjPaging = new FAPagingValues();                                // grid paging
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    string strProcName;

    string _DateFormat = "dd/MM/yyyy";
    string strDateFormat = string.Empty;
    string strAuditTrial = "AuditTrial";
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strXMLAuditTrial;
    public int ProPageNumRW                                                     // to retain the current page size and number
    {
        get;
        set;
    }

    public int ProPageSizeRW
    {
        get;
        set;
    }

    string strRedirectPage = "~/System Admin/S3GSysAdminAuditTrial.aspx";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminAuditTrial.aspx';";
    string strRedirectPageView = "window.location.href='../Collateral/S3GCLTTransLander.aspx?Code=KCP';";

    //Code end
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FASession ObjFASession = new FASession();
            intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
            intUserId = ObjUserInfo_FA.ProUserIdRW;
            intUserLevelId = ObjUserInfo_FA.ProUserLevelIdRW;
            StrConnectionName = ObjFASession.ProConnectionName;
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = ObjUserInfo_FA.ProCompanyIdRW.ToString();
            System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = ObjUserInfo_FA.ProUserIdRW.ToString();

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
            strDateFormat = ObjFASession.ProDateFormatRW;
            txtFromDate_CalendarExtender.Format = strDateFormat;
            txtToDate_CalendarExtender.Format = strDateFormat;
            if (!IsPostBack)
            {
                txtFromDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFromDate.ClientID + "','" + strDateFormat + "',false,  false);");//Added by suseela 
                txtToDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtToDate.ClientID + "','" + strDateFormat + "',false,  false);");//Added by suseela 
                ucCustomPaging.Visible = false;
                btnExportToExcel.Enabled_False();
                txtUserName.Focus();
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;              // To set the page Number
        ProPageSizeRW = intPageSize;            // To set the page size    
    }
    [System.Web.Services.WebMethod]
    public static string[] GetUserName(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserID"].ToString());
        Procparam.Add("@PrefixText", prefixText.Trim());
        Procparam.Add("@Type", "1");
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }
    [System.Web.Services.WebMethod]
    public static string[] GetProgramName(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserID"].ToString());
        Procparam.Add("@PrefixText", prefixText.Trim());
        Procparam.Add("@Type", "2");
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriBindGrid();
            btnGo.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    private void FunPriBindGrid()
    {
        try
        {
            ucCustomPaging.Visible = true;
            if (Utility_FA.StringToDate(txtFromDate.Text) > Utility_FA.StringToDate(txtToDate.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Date To Cannot be Less than Date From");
                txtToDate.Focus();
                txtToDate.Text = string.Empty;
                btnExportToExcel.Enabled_False();
                gvTransactionDetails.DataSource = null;
                gvTransactionDetails.DataBind();
                ucCustomPaging.Visible = false;
                return;
            }            

            ucCustomPaging.Visible = true;
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@USERID", hdnUserId.Value.ToString());
            Procparam.Add("@PROGRAMID", hdnProgram.Value.ToString());
            Procparam.Add("@DATEFROM", Utility_FA.StringToDate(txtFromDate.Text.Trim()).ToString());
            Procparam.Add("@DATETO", Utility_FA.StringToDate(txtToDate.Text.Trim()).ToString());
            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = ObjUserInfo_FA.ProCompanyIdRW;
            ObjPaging.ProUser_ID = ObjUserInfo_FA.ProUserIdRW;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = "";
            ObjPaging.ProOrderBy = "";
            bool bIsNewRow = false;
            gvTransactionDetails.BindGridView_FA("FA_GET_TRANSDETAIL", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);
            if (intTotalRecords>0)
            {
                btnExportToExcel.Enabled_True();
                
            }
            else
            {
                btnExportToExcel.Enabled_False();
               
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void GrdUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GrdUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void txtUserName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtUserName.Text == string.Empty)
            {
                hdnUserId.Value = string.Empty;
            }
            txtUserName.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    protected void txtProgramName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtProgramName.Text == string.Empty)
            {
                hdnProgram.Value = string.Empty;
            }
            txtProgramName.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        try
        {
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@USERID", hdnUserId.Value.ToString());
            Procparam.Add("@PROGRAMID", hdnProgram.Value.ToString());
            Procparam.Add("@DATEFROM", Utility_FA.StringToDate(txtFromDate.Text.Trim()).ToString());
            Procparam.Add("@DATETO", Utility_FA.StringToDate(txtToDate.Text.Trim()).ToString());
            DataTable dt_Trans_Excel = new DataTable();
            dt_Trans_Excel = Utility_FA.GetDefaultData("S3G_GET_TRANSDETAIL_RP", Procparam);
            GrdTransHistory.DataSource = dt_Trans_Excel;
            GrdTransHistory.DataBind();
            ExportToExcel(GrdTransHistory, "TransactionHistory");
            btnExportToExcel.Focus();
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    private void ExportToExcel(GridView Grd, String FileName)
    {
        try
        {
            string attachment = "attachment; filename=" + FileName + ".xls";
            Response.ClearContent();

            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            if (Grd.Rows.Count > 0)
            {
                Grd.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(Up, "No Rows to Export to Excel");
                return;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }
  
}