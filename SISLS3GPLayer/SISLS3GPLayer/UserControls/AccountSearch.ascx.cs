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

public partial class UserControls_AccountSearch : System.Web.UI.UserControl
{
    #region [Variables]

    public enum enumContentType { Name, Code, Both };
    public delegate void ddlItem_Selected(object Sender, EventArgs e);
    public event ddlItem_Selected Item_Selected;
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
            TxtAccNumber.Width = value;
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

        Control_ID = this.ID;

        autoCompletor.OnClientItemSelected = "AutoSuggest_ItemSelected";
        autoCompletor.OnClientPopulated = "AutoSuggest_ItemPopulated";
        autoCompletor.OnClientShown = "AutoSuggest_ShowOptions";
        autoCompletor.ServicePath = this.Parent.Page.Request.FilePath;

        if (strLOV_Code == null && ViewState["strLOV_Code"] != null)
            strLOV_Code = ViewState["strLOV_Code"].ToString();

        if (strLOV_Code != null)
        {

            if (strLOV_Code.StartsWith("ACC_"))
            {
                string strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
                //TxtAccNumber.Attributes.Add("readonly", "false");
            }
            else if(strLOV_Code.StartsWith("CUS_"))
            {
                string strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
            }
            else if (strLOV_Code.StartsWith("ENT_"))
            {
                string strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
            }
        }
    }
    public void ReRegisterSearchControl(string LOVCode)
    {
        string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + LOVCode + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
        ViewState["strLOV_Code"] = LOVCode;
        btnGetLOV.OnClientClick = strQuery;
        TxtAccNumber.Clear();
        hdnID.Value = "";
        //txtItemName.Attributes.Add("readonly", "true");
    }

    public void DeRegisterSearchControl()
    {
        ViewState["strLOV_Code"] = null;
        btnGetLOV.OnClientClick = null;
    }


    public void ControlStatus(bool isEnabled)
    {
        this.btnGetLOV.Enabled = isEnabled;
        //this.txtName.Enabled = isEnabled;
        //this.txtItemName.Enabled = isEnabled;
    }

    #endregion [Page Event's]

    #region [Function's]

    public void FunPubClearControlValue()
    {
        hdnID.Value = "";
        TxtAccNumber.Clear();// = "";
    }

    public void FunPubSetControlValue(string strID, string strName)
    {
        hdnID.Value = strID;
        TxtAccNumber.Text = strName;
        hdnAccountNumber.Value = strName;
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
                string strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150');";
                //btnGetLOV.OnClientClick = strQuery;

                TxtAccNumber.Attributes.Add("readonly", "false");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", strQuery, true);
            }
        }
    }
    /// <summary>
    /// string AutoSuggest.SelectedValue
    /// Get or Set the of the selected item's value in the list control
    /// </summary>
    public string SelectedValue
    {
        get { return hdnSelectedValue.Text; }
        set { hdnSelectedValue.Text = value; }
    }

    /// <summary>
    /// string AutoSuggest.SelectedText
    /// Get or Set the of the selected item's text in the list control
    /// </summary>
    public string SelectedText
    {
        get { return TxtAccNumber.Text; }
        set { TxtAccNumber.Text = value; }
    }

    public string ToolTip
    {
        get { return TxtAccNumber.ToolTip; }
        set { TxtAccNumber.ToolTip = value; }
    }

    /// <summary>
    /// bool AutoSuggest.AutoPostBack
    /// Get or Set a value indicating whether a postback to the server automactically occurs when user changes the list selection.
    /// </summary>
    public bool AutoPostBack
    {
        get
        {
            if (hdnAutoPostBack.Value == "0")
                return false;
            else
                return true;
        }
        set
        {
            if (value)
                hdnAutoPostBack.Value = "1";
            else
                hdnAutoPostBack.Value = "0";
        }
    }

    /// <summary>
    /// bool AutoSuggest.ReadOnly
    /// Get or Set a value indicating whether the AutoSuggest is readonly mode.
    /// </summary>
    //public bool ReadOnly
    //{
    //    get
    //    {
    //        return txtItemName.ReadOnly;
    //    }
    //    set
    //    {
    //        txtItemName.ReadOnly = value;
    //        autoCompletor.Enabled = !value;
    //    }
    //}

    /// <summary>
    /// bool AutoSuggest.Enabled
    /// Get or Set a value indicating whether the AutoSuggest is Enabled mode.
    /// </summary>
    public bool Enabled
    {
        get
        {
            return TxtAccNumber.Enabled;
        }
        set
        {
            TxtAccNumber.Enabled = value;
            autoCompletor.Enabled = value;
        }
    }

    /// <summary>
    /// Unit AutoSuggest.Width
    /// Get or Set a Width of the AutoSuggest.
    /// </summary>
    public Unit Width
    {
        set
        {
            TxtAccNumber.Width = value;
            //tblContent.Width = Unit.Pixel(38 + Convert.ToInt32(value.Value)).ToString();
        }
    }

    /// <summary>
    /// string AutoSuggest.Control_ID
    /// Get or Set the name of the Auto suggest control.
    /// </summary>
    public string Control_ID
    {
        get
        {
            return hdnControlID.Value;
        }
        set
        {
            hdnControlID.Value = value;
        }
    }

    /// <summary>
    /// void AutoSuggest.Clear()
    /// Cleat the selected item of the Auto suggest control.
    /// </summary>
    public void Clear()
    {
        hdnSelectedValue.Text = "0";
        TxtAccNumber.Text = "";
        _AvailableRecords = 0;
    }

    public enum ValidateItem
    {
        Text = 0,
        Value = 1,
    }

    public static int _AvailableRecords;
    public int AvailableRecords
    {
        get
        {
            return _AvailableRecords;
        }
        set
        {
            _AvailableRecords = value;
        }
    }

    public static ValidateItem _ItemToValidate;
    public ValidateItem ItemToValidate
    {
        get
        {
            return _ItemToValidate;
        }
        set
        {
            _ItemToValidate = value;
            if (_ItemToValidate == ValidateItem.Text)
            {
                rfvMultiSuggest.ControlToValidate = "TxtAccNumber";
                txtBranchSearchExtender.Enabled = false;
                rfvMultiSuggest.InitialValue = "";
            }
            else
            {
                rfvMultiSuggest.ControlToValidate = "hdnSelectedValue";
                txtBranchSearchExtender.Enabled = true;
            }
        }
    }

    public bool FirstRowSelected
    {
        set
        {
            autoCompletor.FirstRowSelected = value;
        }
    }

    public TextBox TextBox
    {
        get { return TxtAccNumber; }
    }

    public bool IsMandatory
    {
        get { return rfvMultiSuggest.Enabled; }
        set { rfvMultiSuggest.Enabled = value; }
    }

    public string ServiceMethod
    {
        set { autoCompletor.ServiceMethod = value; }
    }

    public string ServicePath
    {
        set { autoCompletor.ServicePath = value; }
    }

    public string ValidationGroup
    {
        get { return rfvMultiSuggest.ValidationGroup; }
        set { rfvMultiSuggest.ValidationGroup = value; }
    }

    public string ErrorMessage
    {
        get { return rfvMultiSuggest.ErrorMessage; }
        set { rfvMultiSuggest.ErrorMessage = value; }
    }

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    Control_ID = this.ID;

    //    autoCompletor.OnClientItemSelected = "AutoSuggest_ItemSelected";
    //    autoCompletor.OnClientPopulated = "AutoSuggest_ItemPopulated";
    //    autoCompletor.OnClientShown = "AutoSuggest_ShowOptions";
    //    autoCompletor.ServicePath = this.Parent.Page.Request.FilePath;
    //}




    protected void btnItem_Selected(object sender, EventArgs e)
    {
        if (Item_Selected != null)
        {
            Item_Selected(sender, e);
        }
        //Code added - To set focus
        this.Control_ID = this.ClientID.ToString();
        TextBox txtName = ((TextBox)this.FindControl("TxtAccNumber"));
        //txtName.Focus();
    }
    public string WatermarkText
    {
        set
        {
            txtBranchSearchExtender.WatermarkText = value;
        }

    }
    public bool EnableCaching
    {
        get { return autoCompletor.EnableCaching; }
        set { autoCompletor.EnableCaching = value; }
    }
}
