#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget File Upload
/// Created By			: Boobalan M
/// Created Date		: 13-Nov-2019
/// Purpose	            : Budegt File Upload
#endregion

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
using S3GBusEntity;
using System.Collections.Generic;
using System.Text;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Security;
using System.Data.OracleClient;
using System.Xml;
using System.Data.OracleClient;
using Oracle.DataAccess.Types;
using Oracle.DataAccess.Client;
using System.Web.Services;
using FA_BusEntity;


public partial class FA_Budget_File_Upload_Query_View : ApplyThemeForProject_FA
{
    // Common Declaration
    static string[] strarrControlsID = new string[0];
    int intCompanyId = 0;
    int intUserId = 0;
    static string strPageName = "Budget File Upload - Query";
    string StrConnectionName = string.Empty;

    ApplyThemeForProject ATFP = new ApplyThemeForProject();
    UserInfo usrInfo = new UserInfo();
    Dictionary<string, string> Procparam = new Dictionary<string, string>();
    string FileNameFormat = string.Empty;
    string filepath = String.Empty;
    DataTable dtExcel = new DataTable();
    DataSet dtsearch = new DataSet();
    int Flag, intErrCode, intUpload_ID = 0;
    FASession objFASession;
    string strRedirectPageView = "~/Budget/FA_Budget_File_Upload_View.aspx";
    FormsAuthenticationTicket fromTicket;

    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (usrInfo.ProCompanyIdRW == 0)
                HttpContext.Current.Response.Redirect("../SessionExpired.aspx");

            Page.Theme = usrInfo.ProUserThemeRW;

            // Initialize from User Information
            CompanyId = usrInfo.ProCompanyIdRW.ToString();
            UserId = usrInfo.ProUserIdRW.ToString();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            usrInfo = new UserInfo();
            intCompanyId = usrInfo.ProCompanyIdRW;
            intUserId = usrInfo.ProUserIdRW;

            int UploadId = 0;

            if (Request.QueryString.Get("qsUploadId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsUploadId"));
                UploadId = Convert.ToInt32(fromTicket.Name);

            }


            if (!IsPostBack)
            {
                BindQueryData(UploadId);
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }


    private void BindQueryData(int UploadId)
    {
        try
        {
            DataSet Dset = new DataSet();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Procparam.Add("@Upload_ID", UploadId.ToString());
            Dset = Utility_FA.GetDataset("BUD_GET_FILEUPLOAD_QUERY", Procparam);
            this.txtFinYear.Text = Dset.Tables[0].Rows[0]["FinYear"].ToString();
            this.txtItemHeader.Text = Dset.Tables[0].Rows[0]["Item_Header"].ToString();
            this.txtAccountNature.Text = Dset.Tables[0].Rows[0]["Account_Nature"].ToString();
            this.txtActivity.Text = Dset.Tables[0].Rows[0]["Activity"].ToString();


            this.grvUploadSummary.DataSource = Dset.Tables[1];
            this.grvUploadSummary.DataBind();

            ViewState["MonthWiseData"] = Dset.Tables[2];
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    protected void btnExport_ServerClick(object sender, EventArgs e)
    {

        try
        {
            DataTable DtMonthWise = new DataTable();
            DtMonthWise = (DataTable)ViewState["MonthWiseData"];

            if (DtMonthWise.Rows.Count == 0)
            {
                return;
            }
            string Filename = "File Upload MonthWise Summary";

            GridView Grv = new GridView();
            Grv.DataSource = DtMonthWise;
            Grv.AllowPaging = false;

            //Grv.Columns[0].HeaderText = "Jan-2019";
            //Grv.Columns[1].HeaderText = "Feb-2019";
            Grv.DataBind();


            string PrjMonth = this.txtFinYear.Text;
            PrjMonth = PrjMonth.Substring(4);
            Grv.HeaderRow.Cells[1].Text = "Jan" + PrjMonth;
            Grv.HeaderRow.Cells[2].Text = "Feb" + PrjMonth;
            Grv.HeaderRow.Cells[3].Text = "Mar" + PrjMonth;
            Grv.HeaderRow.Cells[4].Text = "Apr" + PrjMonth;
            Grv.HeaderRow.Cells[5].Text = "May" + PrjMonth;
            Grv.HeaderRow.Cells[6].Text = "Jun" + PrjMonth;
            Grv.HeaderRow.Cells[7].Text = "Jul" + PrjMonth;
            Grv.HeaderRow.Cells[8].Text = "Aug" + PrjMonth;
            Grv.HeaderRow.Cells[9].Text = "Sep" + PrjMonth;
            Grv.HeaderRow.Cells[10].Text = "Oct" + PrjMonth;
            Grv.HeaderRow.Cells[11].Text = "Nov" + PrjMonth;
            Grv.HeaderRow.Cells[12].Text = "Dec" + PrjMonth;

            if (Grv.Rows.Count > 0)
            {
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=" + Filename + ".xls");
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Grv.GridLines = GridLines.Both;
                Grv.HeaderStyle.Font.Bold = true;
                Grv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    protected void btnExit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageView, false);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

}