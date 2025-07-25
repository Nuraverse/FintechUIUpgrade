using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Common_S3GViewFileKYC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strFileName = string.Empty;
            strFileName = Request.QueryString["qsFileName"];
            if (Session["KYC_File"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["KYC_File"]) + ".pdf");
            }
            else if (Session["LPO_File"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["LPO_File"]) + ".pdf");
            }
            else if (Session["PMC_FILE"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["PMC_FILE"]) + ".pdf");
            }
            else if (Session["BATCH_File"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["BATCH_File"]) + ".pdf");
            }
            else if (Session["CHEQUE_PRINT"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["CHEQUE_PRINT"]) + ".pdf");
            }
            else if (Session["WELCOME_File"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["WELCOME_File"]) + ".pdf");
            }
            else if (Session["JOINT_LETTER"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=" + Convert.ToString(Session["JOINT_LETTER"]) + ".pdf");
            }
            else
            {
                Response.AppendHeader("content-disposition", "attachment; filename=KYC.pdf");
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