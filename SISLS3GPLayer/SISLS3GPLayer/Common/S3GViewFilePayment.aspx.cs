using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_S3GViewFilePayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strFileName = string.Empty;
            strFileName = Request.QueryString["qsFileName"];
            if (Session["Payment_File"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["Payment_File"]) + ".pdf");
            }
            else
            {
                Response.AppendHeader("content-disposition", "attachment; filename=CheckList.pdf");
            }            
            Response.ContentType = "application/pdf";
            Response.WriteFile(strFileName);
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message;
        }
    }
}