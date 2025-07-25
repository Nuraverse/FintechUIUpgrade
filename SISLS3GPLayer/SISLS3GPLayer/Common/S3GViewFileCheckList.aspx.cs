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
using System.IO;
using System.Text;

public partial class Common_S3GViewFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strFileName = string.Empty;
            strFileName = Request.QueryString["qsFileName"];
            if (Request.QueryString["qsFileExtn"] != null)
            {
                Response.AppendHeader("content-disposition", "attachment; filename=CheckList" + Request.QueryString["qsFileExtn"].ToString());
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
