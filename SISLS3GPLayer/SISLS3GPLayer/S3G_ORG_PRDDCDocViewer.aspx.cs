using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AjaxControlToolkit;
using System.Web.UI;
using S3GBusEntity;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;

public partial class S3G_ORG_PRDDCDocViewer : System.Web.UI.Page
{
    [WebMethod]    
    public static Slide[] GetImages()
    {
        List<Slide> objList = (List<Slide>)HttpContext.Current.Session["SlideData"];
        return objList.ToArray();
    }
    protected void chkLoop_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (chkLoop.Checked)
            {
                SlideShowExtender.Loop = true;
            }
            else
            {
                SlideShowExtender.Loop = false;
            }
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    protected void chkAutoPlay_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (chkAutoPlay.Checked)
            {
                SlideShowExtender.AutoPlay = true;
            }
            else
            {
                SlideShowExtender.AutoPlay = false;
            }
        }

        catch (Exception ae)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ae);
            throw ae;
        }
    }
}