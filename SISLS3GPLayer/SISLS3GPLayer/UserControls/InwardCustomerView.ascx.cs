#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Common  
/// Screen Name			: Get LOV user Control
/// Created By			: Tamilselvan.S
/// Created Date		: 25 Jan 2011
/// Purpose	            : 
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

public partial class UserControls_InwardCustomerView : System.Web.UI.UserControl
{

    #region [Variables]

    public enum enumContentType { Name, Code, Both };

    public string _strLOV_Code = string.Empty;
    public string _strControlID = string.Empty;

    public string strLOV_Code
    {
        get;
        set;
    }

    public string strControlID
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

    public enumContentType DispalyContent
    {
        get;
        set;
    }

    public string _strConstitutionID = string.Empty;

    public string strConstitutionID
    {
        get { return _strConstitutionID; }
        set { _strConstitutionID = value; }
    }
    #endregion [Variables]

    #region [Page Event's]
    protected void Page_Init(object sender, EventArgs n)
    {
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (strLOV_Code == null && ViewState["strLOV_Code"] != null)
            strLOV_Code = ViewState["strLOV_Code"].ToString();

        if (strLOV_Code != null)
        {
            if (strLOV_Code == "ENVENDOR1" || strLOV_Code == "ENSUNDRY1" || strLOV_Code == "ENDEALER1")
            {
                string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=400,height=350,resizable=no,scrollbars=yes,top=100,left=400'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
                txtName.Attributes.Add("readonly", "true");
            }
            else
            {
                string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
                txtName.Attributes.Add("readonly", "true");
            }
        }

    }
    public void ReRegisterSearchControl(string LOVCode)
    {
        string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + LOVCode + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
        ViewState["strLOV_Code"] = LOVCode;
        btnGetLOV.OnClientClick = strQuery;
        txtName.Text = "";
        hdnID.Value = "";
        txtName.Attributes.Add("readonly", "true");
    }

    public void DeRegisterSearchControl()
    {
        ViewState["strLOV_Code"] = null;
        btnGetLOV.OnClientClick = null; 
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
        hdnID.Value = "";
        txtName.Text = "";
    }

    public void FunPubSetControlValue(string strID, string strName)
    {
        hdnID.Value = strID;
        txtName.Text = strName;
    }

    #endregion [Function's]
    protected void btnGetLOV_Click(object sender, EventArgs e)
    {
        if (hdnLovCode.Value != "")
        {
            //if (hdnLovCode.Value != "")
            strLOV_Code = hdnLovCode.Value;
            if (hdnCtrlId.Value != "")
                strControlID = hdnCtrlId.Value;

            if (strLOV_Code != null)
            {
                string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150');";
                //btnGetLOV.OnClientClick = strQuery;

                txtName.Attributes.Add("readonly", "true");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strQuery, true);
            }
        }
    }
}
