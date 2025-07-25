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
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;

public partial class Common_S3GShowPDF : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string strFileName = string.Empty;
            strFileName = Request.QueryString["qsFileName"];
            System.Threading.Thread.Sleep(1500);
            string virtualPath = "http://" + Request.ServerVariables["HTTP_HOST"].ToString() + ConfigurationManager.AppSettings["receiptpdfpath"].ToString() + strFileName;
            //Response.Redirect(virtualPath);

            //Newly Added
            //string strFilePath = Server.MapPath(".").Replace("Common", "Collection") + "\\PDF Files\\" + strFileName;
            string strFilePath = strFileName;
            
            var outputStream = new MemoryStream();
            var pdfReader = new PdfReader(strFilePath);
            var pdfStamper = new PdfStamper(pdfReader, outputStream);
            //Add the auto-print javascript
            var writer = pdfStamper.Writer;
            writer.AddJavaScript(GetAutoPrintJs());
            pdfStamper.Close();
            var content = outputStream.ToArray();
            outputStream.Close();
            Response.AppendHeader("content-disposition", "attachment; filename=Receipt.pdf");
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(content);
            Response.End();
            outputStream.Close();
            outputStream.Dispose(); //Upto This

        }
        catch (Exception ex)
        {
            //lblErrorMsg.Text = ex.Message;
        }
    }

    //And This
    protected string GetAutoPrintJs()
    {
        var script = new StringBuilder();
        script.Append("var pp = getPrintParams();");
        script.Append("pp.interactive= pp.constants.interactionLevel.full;");
        script.Append("print(pp);"); return script.ToString();
    }
}
