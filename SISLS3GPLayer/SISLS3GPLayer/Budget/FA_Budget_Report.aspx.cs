#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name         :   Budget
/// Screen Name         :   Budget Report
/// Created By          :   Boobalan M
/// Created Date        :   03-Jan-2020
/// Purpose             :   To Get the Budget Report.
/// <Program Summary>
#endregion

#region Namespaces
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
using System.Globalization;
using System.IO;
using System.Configuration;
using System.Text;
using S3GBusEntity;
#endregion

public partial class FA_Budget_Report : ApplyThemeForProject_FA
{
    #region Variable Declaration
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    Dictionary<string, string> dictParam = null;
    static string strPageName = "Budget Report";
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    public string strDateFormat;
    int intCompanyId;
    int intUserId;
    string strRedirectPageHome = "../Common/HomePage.aspx";
    string strRedirectPageAdd = "../Budget/FA_Budget_Report.aspx";
    #endregion

    int Report_Type;


    #region Page Load
    /// <summary>
    /// This event is handled for loading the Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);

        }
    }
    #endregion

    #region Page Methods
    /// <summary>
    /// To Load the Page
    /// </summary>
    private void FunPriLoadPage()
    {
        try
        {
            UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
            FASession ObjFASession = new FASession();
            strDateFormat = ObjFASession.ProDateFormatRW;
            CalFromDate.Format = strDateFormat;
            intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
            intUserId = ObjUserInfo_FA.ProUserIdRW;
            txtFrmMonthyr.Attributes.Add("onchange", "fnDoMonthYear(this,'" + txtFrmMonthyr.ClientID + "','" + ObjFASession.ProDateFormatRW + "',true,  false);");
                        

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            if (!IsPostBack)
            {
                FunPriGetItemHeader();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "te", "Resize();", true);

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// To Load Location
    /// </summary>
    private void FunPriGetItemHeader()
    {
        try
        {

            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyId));
            ddlItemHeader.BindDataTable_FA("FA_GET_ITEM_HEADER", dictParam, new string[] { "ID", "Name" });
            if (ddlItemHeader.Items.Count == 2)
                ddlItemHeader.SelectedIndex = 1;
            dictParam = null;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// To Validate the Future Date
    /// </summary>
    /// <param name="text"></param>
    private void FunPriValidateFutureDate(TextBox txtval)
    {
        try
        {
            #region To find Current Year and Month
            //string Today = Convert.ToString(DateTime.Now);
            string YearMonth = txtval.Text;
            int Currentmonth = DateTime.Now.Month;
            int Currentyear = DateTime.Now.Year;
            #endregion

            int Month = int.Parse(Convert.ToDateTime(YearMonth).ToString("MM"));
            int year = int.Parse(Convert.ToDateTime(YearMonth).ToString("yyyy"));
            //if (year > Currentyear || Month > Currentmonth)
            if (year > Currentyear)
            {
                txtval.Text = "";
                Utility_FA.FunShowAlertMsg_FA(this, "Year cannot be Greater than System Year.");
                return;
            }
            else if (year == Currentyear)
            {
                if (Month > Currentmonth)
                {
                    txtval.Text = "";
                    Utility_FA.FunShowAlertMsg_FA(this, "Month cannot be Greater than System month.");
                    return;
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// To Set the Suffix
    /// </summary>
    /// <returns></returns>
    private string FunSetSuffix()
    {

        int suffix = 1;
        suffix = ObjFASession.ProGpsSuffixRW;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }

    #endregion


    #region Page Events

    /// <summary>
    /// To Populate the Grid 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            FunExcelExport();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    /// <summary>
    /// To Cancel the entered values and redirect to home page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scr", "javascript:RemoveTabnew(this);", true);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    /// <summary>
    /// To Clear_FA all Values
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPageAdd);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    protected void FunExcelExport()
    {
        try
        {
            int colspan1 = 6;
            string SPName = "S3G_CLN_BUDGET_PROCESS";
            if (ddlItemHeader.SelectedValue == "4" || ddlItemHeader.SelectedValue == "7")
            {
                SPName = "S3G_CLN_BUDGET_PROCESS";
                Report_Type = 1;
                colspan1 = 6;
               
            }
            else
            {
                SPName = "S3G_CLN_BUDGET_PROCESS_RPT";
                Report_Type = 2;
                colspan1 = 3;
             
            }
    

            string FromYearMonth = txtFrmMonthyr.Text;
            string PREFROMMONTH = string.Empty;
            string year = ObjFASession.ProFinYearRW;
            string finmonth = year.Substring(0, 4);
            string finyear = year.Substring(5, 4);

         //   string prevyear = (Convert.ToInt32(finmonth) - 1).ToString() + "-" + (Convert.ToInt32(finyear) - 1).ToString();
            int FromMonth = int.Parse(Convert.ToDateTime(FromYearMonth).ToString("MM"));
            int Fromyear = int.Parse(Convert.ToDateTime(FromYearMonth).ToString("yyyy"));
         //   int FromPreviousYear = Fromyear - 1;
            FromYearMonth = Fromyear.ToString("0000") + FromMonth.ToString("00");
            PREFROMMONTH = Fromyear.ToString("0000") + FromMonth.ToString("00");
            
            DataSet dst = new DataSet();
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@REPORT_ID", ddlItemHeader.SelectedValue);
            dictParam.Add("@IN_YEAR", PREFROMMONTH);
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyId));
            dst = Utility_FA.GetDataset(SPName, dictParam);

            if (dst.Tables[0].Rows.Count == 0)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "No data found.");
                return;
            }

            grvprint.DataSource = dst.Tables[0];
            grvprint.DataBind();

            StringBuilder StrBuildHtml = new StringBuilder();
            StrBuildHtml.Append("<html>");
            StrBuildHtml.Append("<table  width='100%' CssClass='styleInfoLabel' class='styleGridHeader' BorderColor='000000'  cellpadding=1 cellspacing=0 border=1>");

            StrBuildHtml.Append("<tr >");
            StrBuildHtml.Append("<td class='stylePageHeading' style='width:100%;' align='center' fontbold=true >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append(ObjUserInfo_FA.ProCompanyNameRW.ToString());
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td align='center' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Budget Report");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");


            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td >");
            StrBuildHtml.Append("<table  width='100%' CssClass='styleInfoLabel' class='styleGridHeader' BorderColor='000000'  cellpadding=1 cellspacing=0 border=0>");

            StrBuildHtml.Append("<tr >");
            StrBuildHtml.Append("<td colspan=" + colspan1 + " style='font-size:12px;' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("&nbsp;&nbsp;&nbsp;Item Header : " + ddlItemHeader.SelectedItem.Text + "");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            //StrBuildHtml.Append("<tr >");
            //StrBuildHtml.Append("<td colspan=6  style='font-size:12px;' >");
            //StrBuildHtml.Append("<b>");
            //StrBuildHtml.Append("&nbsp;&nbsp;&nbsp;Month/Year  : " + txtFrmMonthyr.Text + "</td>");
            //StrBuildHtml.Append("</b>");
            //StrBuildHtml.Append("</td>");
            //StrBuildHtml.Append("<td colspan=3 style='font-size:12px;  ' >");
            //StrBuildHtml.Append("<b>");
            //StrBuildHtml.Append("Currency : All Amounts in (Thousands) " + dst.Tables[2].Rows[0]["currency_name"].ToString() + "</td>");
            //StrBuildHtml.Append("</b>");
            //StrBuildHtml.Append("</td>");
            //StrBuildHtml.Append("</tr>");

            //StrBuildHtml.Append("</table >");
            //StrBuildHtml.Append("</td>");


            //StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr >");
            StrBuildHtml.Append("<td colspan=" + colspan1 + " style='font-size:12px;' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("&nbsp;&nbsp;&nbsp;Month/Year  : " + txtFrmMonthyr.Text + "</td>");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("<td colspan=3 style='font-size:12px;  ' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Currency : All Amounts in " + dst.Tables[2].Rows[0]["currency_name"].ToString() + "</td>");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");
            

            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr >");
            StrBuildHtml.Append("<td colspan=" + colspan1 + " style='font-size:12px;' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("&nbsp;&nbsp;&nbsp;Report Run By : " + ObjUserInfo_FA.ProUserNameRW + "</td>");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("<td colspan=3 style='font-size:12px;  ' >");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Report Date   : " + DateTime.Now.ToString() + "</td>");
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("</table >");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr>");
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            foreach (GridViewRow gv in grvprint.Rows)
            {
                for (int i = 0; i <= gv.Cells.Count - 1; i++)
                {
                    if ((i > 0))
                    {
                        gv.Cells[i].Attributes["style"] = "mso-number-format:\\#\\,\\#\\#0\\.000\\";
                    }

                }
            }
            for (int j = 0; j <= grvprint.FooterRow.Cells.Count - 1; j++)
            {
                grvprint.FooterRow.Cells[j].Attributes["style"] = "mso-number-format:\\#\\,\\#\\#0\\.000\\";
            }





            if (Report_Type == 1)
            { 
            grvprint.HeaderRow.Cells[1].Text = dst.Tables[1].Rows[0]["A1"].ToString();
            grvprint.HeaderRow.Cells[2].Text = dst.Tables[1].Rows[0]["C1"].ToString();
            grvprint.HeaderRow.Cells[3].Text = dst.Tables[1].Rows[0]["B1"].ToString();
            grvprint.HeaderRow.Cells[4].Text = dst.Tables[1].Rows[0]["A2"].ToString();
            grvprint.HeaderRow.Cells[5].Text = dst.Tables[1].Rows[0]["C2"].ToString();
            grvprint.HeaderRow.Cells[6].Text = dst.Tables[1].Rows[0]["B2"].ToString();
            grvprint.HeaderRow.Cells[7].Text = dst.Tables[1].Rows[0]["A3"].ToString();
            grvprint.HeaderRow.Cells[8].Text = dst.Tables[1].Rows[0]["C3"].ToString();
            grvprint.HeaderRow.Cells[9].Text = dst.Tables[1].Rows[0]["B3"].ToString();
            grvprint.HeaderRow.Cells[10].Text = dst.Tables[1].Rows[0]["A4"].ToString();
            grvprint.HeaderRow.Cells[11].Text = dst.Tables[1].Rows[0]["C4"].ToString();
            grvprint.HeaderRow.Cells[12].Text = dst.Tables[1].Rows[0]["B4"].ToString();
            }
            else
            {
                grvprint.Columns[1].Visible = false;
                grvprint.HeaderRow.Cells[2].Text = dst.Tables[1].Rows[0]["C1"].ToString();
                grvprint.Columns[3].Visible = false;
                grvprint.Columns[4].Visible = false;
                grvprint.Columns[5].Visible = false;
                grvprint.HeaderRow.Cells[6].Text = dst.Tables[1].Rows[0]["B2"].ToString();
                grvprint.Columns[7].Visible = false;
                grvprint.Columns[8].Visible = false;
                grvprint.HeaderRow.Cells[9].Text = dst.Tables[1].Rows[0]["B3"].ToString();
                grvprint.Columns[10].Visible = false;
                grvprint.HeaderRow.Cells[11].Text = dst.Tables[1].Rows[0]["B4"].ToString();
                grvprint.HeaderRow.Cells[12].Text = dst.Tables[1].Rows[0]["B5"].ToString();
            }
         //   grvprint.HeaderRow.BackColor = "#029961".ToString();
            grvprint.RenderControl(htw);
            grvprint.Visible = false;
            StrBuildHtml.Append("<td  >");
            StrBuildHtml.Append(sw.ToString());
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");
            StrBuildHtml.Append("</table>");
            StrBuildHtml.Append("</html>");
            string attachment = "attachment; filename=Budget Report" + DateTime.Now + ".xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            Response.Write(StrBuildHtml.ToString());
            Response.End();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }




    protected void grvprint_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Check your condition here
            if (e.Row.Cells[1].Text.Equals("1"))
            {
                e.Row.Font.Bold = true; // This will make row bold
            }
            for (int i_cellVal = 0; i_cellVal < e.Row.Cells.Count; i_cellVal++)
            {
                if (i_cellVal>1)
                {
                    e.Row.Cells[i_cellVal].HorizontalAlign = HorizontalAlign.Right;
                    e.Row.Cells[i_cellVal].Attributes["style"] = "mso-number-format:\\@;";
                }
            }
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }


    protected void txtFromDate_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            string str = txtFrmMonthyr.Text;
            //string str1 = CalendarExtender1.SelectedDate.ToString ();
            //FunPriClear_OnChange(0);
            //hdn_FTDate.Value = "From";

            //if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtFromDate, txtFromDate.Text, lblFromDate.Text))
            //    return;
            //if (!FunProValidate(hdn_FTDate.Value))
            //    return;
        }
        catch (Exception ex)
        {
           
        }
    }

    #endregion
}
