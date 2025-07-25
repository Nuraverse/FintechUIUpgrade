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
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Configuration;
using System.Text;
using System.IO;
using System.Collections;
using System.Data;
using System.Security.Cryptography;
public partial class System_Admin_S3GSysTransactionHistory : ApplyThemeForProject
{
    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);
    PagingValues ObjPaging = new PagingValues();
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
    UserInfo ObjUserInfo = new UserInfo();
    S3GSession ObjS3GSession;
    string strDateFormat;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = ObjUserInfo.ProCompanyIdRW.ToString();
            System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = ObjUserInfo.ProUserIdRW.ToString();
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

            ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;

            txtFromDate_CalendarExtender.Format = strDateFormat;
            txtToDate_CalendarExtender.Format = strDateFormat;
            if (!IsPostBack)
            {
                ucCustomPaging.Visible = false;
                btnExportToExcel.Enabled_False();
                TextBox txtUserCode = (TextBox)txtUserName.FindControl("txtItemName");
                txtUserCode.Focus();
            }
            txtFromDate.Attributes.Add("onchange", "fnDoDate(this,'" + txtFromDate.ClientID + "','" + strDateFormat + "',true,  false);");
            txtToDate.Attributes.Add("onchange", "fnDoDate(this,'" + txtToDate.ClientID + "','" + strDateFormat + "',true,  false);");//Added by suseela 


        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
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
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_PRGNAMEDUSER", Procparam));
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
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtUserName.SelectedText != string.Empty && hdnUserId.Value == "")
            {
                Utility.FunShowAlertMsg(this, "Select the Valid User Code.");
                return;
            }
            if (txtProgramName.SelectedText != string.Empty && hdnProgram.Value == "")
            {
                Utility.FunShowAlertMsg(this, "Select the Valid Program Name.");
                return;
            }
            if (hdnUserId.Value != string.Empty && txtUserName.SelectedText == string.Empty)
            {
                hdnUserId.Value = string.Empty;
                txtUserName.SelectedText = string.Empty;
            }
            if (hdnProgram.Value != string.Empty && txtProgramName.SelectedText == string.Empty)
            {
                hdnProgram.Value = string.Empty;
                txtProgramName.SelectedText = string.Empty;
            }
            FunPriBindGrid();
            btnGo.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    private void FunPriBindGrid()
    {
        try
        {
            ucCustomPaging.Visible = true;
            if (Utility.StringToDate(txtFromDate.Text) > Utility.StringToDate(txtToDate.Text))
            {
                Utility.FunShowAlertMsg(this, "Date To Cannot be Less than Date From");
                txtToDate.Focus();
                txtToDate.Text = string.Empty;
                btnExportToExcel.Enabled_False();
                gvTransactionDetails.DataSource = null;
                gvTransactionDetails.DataBind();
                ucCustomPaging.Visible = false;
                return;
            }

            txtProgramName.SelectedValue = txtProgramName.SelectedValue == "0" ? "" : txtProgramName.SelectedValue;
            txtUserName.SelectedValue = txtUserName.SelectedValue == "0" ? "" : txtUserName.SelectedValue;

            ucCustomPaging.Visible = true;
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@USERID", hdnUserId.Value);
            Procparam.Add("@PROGRAMID", hdnProgram.Value);
            Procparam.Add("@DATEFROM", Utility.StringToDate(txtFromDate.Text.Trim()).ToString());
            Procparam.Add("@DATETO", Utility.StringToDate(txtToDate.Text.Trim()).ToString());
            int intTotalRecords = 0;
            ObjPaging.ProCompany_ID = ObjUserInfo.ProCompanyIdRW;
            ObjPaging.ProUser_ID = ObjUserInfo.ProUserIdRW;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = "";
            ObjPaging.ProOrderBy = "";
            bool bIsNewRow = false;
            gvTransactionDetails.BindGridView("S3G_GET_TRANSDETAIL", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);
            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            if (gvTransactionDetails.Rows.Count > 0)
            {
                if (gvTransactionDetails.Rows.Count < 10)
                {
                    pnlTransacDetails.Height = Unit.Pixel(350);
                }
                else
                {
                    pnlTransacDetails.Height = Unit.Pixel(350);
                }

                pnlTransacDetails.Visible = true;
            }
            else
            {
                pnlTransacDetails.Visible = false;
            }


            if (intTotalRecords > 0)
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

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        try
        {
            if (Utility.StringToDate(txtFromDate.Text) > Utility.StringToDate(txtToDate.Text))
            {
                Utility.FunShowAlertMsg(this, "Date To Cannot be Less than Date From");
                txtToDate.Focus();
                txtToDate.Text = string.Empty;
                btnExportToExcel.Enabled_False();
                gvTransactionDetails.DataSource = null;
                gvTransactionDetails.DataBind();
                ucCustomPaging.Visible = false;
                return;
            }

            txtProgramName.SelectedValue = txtProgramName.SelectedValue == "0" ? "" : txtProgramName.SelectedValue;
            txtUserName.SelectedValue = txtUserName.SelectedValue == "0" ? "" : txtUserName.SelectedValue;

            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@USERID", hdnUserId.Value);
            Procparam.Add("@PROGRAMID", hdnProgram.Value);
            Procparam.Add("@DATEFROM", Utility.StringToDate(txtFromDate.Text.Trim()).ToString());
            Procparam.Add("@DATETO", Utility.StringToDate(txtToDate.Text.Trim()).ToString());
            DataTable dt_Trans_Excel = new DataTable();
            dt_Trans_Excel = Utility.GetDefaultData("S3G_GET_TRANSDETAIL_RP", Procparam);
            GrdTransHistory.DataSource = dt_Trans_Excel;
            GrdTransHistory.DataBind();
            ExportToExcel(GrdTransHistory, "TransactionHistory");
            btnExportToExcel.Focus();

        }

        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
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
            //StringWriter sw = new StringWriter();
            //HtmlTextWriter htw = new HtmlTextWriter(sw);
            System.Text.StringBuilder StrBuildHtml = new System.Text.StringBuilder();
            StrBuildHtml.Append("<html>");
            StrBuildHtml.Append("<table  width='60%' CssClass='styleInfoLabel' class='styleGridHeader' align='center' BorderColor='000000' cellpadding=1 cellspacing=0 border=1>");
            //StrBuildHtml.Append("<tr>");
            //StrBuildHtml.Append("<td class='stylePageHeading' style='width:100%;' align='center' fontbold=true>");
            //StrBuildHtml.Append("<b>");
            //StrBuildHtml.Append("Transaction History");
            //StrBuildHtml.Append("</b>");
            //StrBuildHtml.Append("</td>");
            //StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td align='center'>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Transaction History for the Period  " + txtFromDate.Text + " To " + txtToDate.Text);
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("</tr>");
            string struser = string.Empty;
            string strprogram = string.Empty;
            if (txtUserName.SelectedText == string.Empty)
            {
                struser = " All        ";
            }
            else
            {
                struser = txtUserName.SelectedText;
            }
            if (txtProgramName.SelectedText == string.Empty)
            {
                strprogram = " All    ";
            }
            else
            {
                strprogram = txtProgramName.SelectedText;
            }
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td align='left'>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("User Id/User Name: " + struser);
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td align='left'>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append("Program Name: " + strprogram);
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("</tr>");
            
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Grd.RenderControl(htw);
            StrBuildHtml.Append("<tr>");
            StrBuildHtml.Append("<td class='stylePageHeading' style='width:100px;' align='center' fontbold=true>");
            StrBuildHtml.Append("<b>");
            StrBuildHtml.Append(sw.ToString());
            StrBuildHtml.Append("</b>");
            StrBuildHtml.Append("</td>");
            StrBuildHtml.Append("</tr>");

            StrBuildHtml.Append("</table>");
            StrBuildHtml.Append("</html>");
            Response.Write(StrBuildHtml.ToString());
            Response.End();
            //if (Grd.Rows.Count > 0)
            //{
            //    Grd.RenderControl(htw);
            //    Response.Write(sw.ToString());
            //    Response.End();
            //}
            //else
            //{
            //    Utility.FunShowAlertMsg(Up, "No Rows to Export to Excel");
            //    return;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally { }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        // base.VerifyRenderingInServerForm(control);
        // control.Focus();
    }
    protected void txtUserName_Item_Selected(object Sender, EventArgs e)
    {
        hdnUserId.Value = txtUserName.SelectedValue;
    }
    protected void txtProgramName_Item_Selected(object Sender, EventArgs e)
    {
        hdnProgram.Value = txtProgramName.SelectedValue;
    }
}