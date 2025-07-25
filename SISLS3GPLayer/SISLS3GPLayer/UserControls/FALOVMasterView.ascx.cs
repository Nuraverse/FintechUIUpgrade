#region [Page Header]
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Common  
/// Screen Name			: Get LOV user Control
/// Created By			: Tamilselvan.S
/// Created Date		: 12/03/2012
/// Purpose	            : 
#endregion [Page Header]

#region [Namespace]

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

#endregion [Namespace]

public partial class UserControls_FALOVMasterView : System.Web.UI.UserControl
{
    #region [Variables]

    public enum enumContentType { Name, Code, Both };

    public string LOV_Code
    {
        get;
        set;
    }

    public string ControlID
    {
        get;
        set;
    }

    public Unit TextWidth
    {
        set
        {
            txtName.Width = value;
        }
    }

    public bool ButtonEnabled
    {
        set
        {
            btnGetLOV.Enabled = value;
        }
    }
    public bool HoverMenuExtenderLeft
    {
        set
        {
            hvCustomerAddressLeft.Enabled = value;
        }
    }
    public bool HoverMenuExtenderRight
    {
        set
        {
            hvCustomerAddressRight.Enabled = value;
        }
    }

    public bool HoverMenuExtenderBottom
    {
        set
        {
            hvCustomerAddressBottom.Enabled = value;
        }
    }
    public bool HoverMenuExtenderTop
    {
        set
        {
            hvCustomerAddressTop.Enabled = value;
        }
    }
    public bool HoverMenuExtenderCenter
    {
        set
        {
            hvCustomerAddressCenter.Enabled = value;
        }
    }
    public bool ShowHideAddressImageButton
    {
        set
        {
            btnAddress.Visible = value;
        }
    }

    public enumContentType DispalyContent
    {
        get;
        set;
    }

    public string LocationID
    {
        get;
        set;
    }

    public string LocationID2
    {
        get;
        set;
    }

    public int Param_Option1
    {
        get;
        set;
    }

    #endregion [Variables]

    #region [Page Event's]

    protected void Page_Init(object sender, EventArgs n)
    {
        // FIRST 
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (LOV_Code == null && ViewState["LOV_Code"] != null)
            LOV_Code = ViewState["LOV_Code"].ToString();

        if (LOV_Code != null)
        {
            string strQuery = "window.open('../common/FAGetLOV.aspx?LOV_Code=" + LOV_Code + "&ControlID=" + ControlID + "&LocationID=" + LocationID + "&LocationID2=" + LocationID2 + "&Param_Option1=" + Param_Option1 + "&DispCont=" + DispalyContent + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=500,height=330,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
            btnGetLOV.OnClientClick = strQuery;
            txtName.Attributes.Add("readonly", "true");
        }
    }

    protected void btnGetLOV_Click(object sender, EventArgs e)
    {
        if (hdnLovCode.Value != "")
        {
            LOV_Code = hdnLovCode.Value;
            if (hdnCtrlId.Value != "")
            {
                ControlID = hdnCtrlId.Value;
            }
            if (LOV_Code != null)
            {
                string strQuery = "window.open('../common/FAGetLOV.aspx?LOV_Code=" + LOV_Code + "&ControlID=" + ControlID + "&LocationID=" + LocationID + "&LocationID2=" + LocationID2 + "&Param_Option1=" + Param_Option1 + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=500,height=330,resizable=no,scrollbars=yes,top=50,left=150');";
                txtName.Attributes.Add("readonly", "true");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strQuery, true);
            }
        }
    }

    public void ReRegisterSearchControl(string LOVCode)
    {
        string strQuery = "window.open('../common/FAGetLOV.aspx?LOV_Code=" + LOVCode + "&ControlID=" + ControlID + "&LocationID=" + LocationID + "&LocationID2=" + LocationID2 + "&Param_Option1=" + Param_Option1 + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=500,height=330,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
        ViewState["LOV_Code"] = LOVCode;
        btnGetLOV.OnClientClick = strQuery;
        txtName.Text = hdnID.Value = "";
        txtName.Attributes.Add("readonly", "true");
    }

    public void ControlStatus(bool isEnabled)
    {
        this.btnGetLOV.Enabled = isEnabled;
        this.txtName.Enabled = isEnabled;
    }

    #endregion [Page Event's]

    #region [Function's]

    public void FunPubClearControlValue()
    {
        hdnID.Value = txtName.Text = "";
    }

    public void FunPubSetControlValue(string strID, string strName)
    {
        hdnID.Value = strID;
        txtName.Text = strName;
    }

    #endregion [Function's]

}
