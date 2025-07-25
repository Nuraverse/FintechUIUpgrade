#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Common  
/// Screen Name			: Common Search user Control
/// Created By			: MAGESH.A
/// Created Date		: 16 Jul 2018
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

public partial class UserControls_CommonSearch : System.Web.UI.UserControl
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
    /// <summary>
    /// used To Filter Factoring Custmoer Details
    /// </summary>
    public string strLOB_ID
    {
        get;
        set;
    }

    public string strProgram_ID
    {
        get;
        set;
    }

    public string strCustomer_ID
    {
        get;
        set;
    }

    public string strLRN_NO
    {
        get;
        set;
    }

    public Unit TextWidth
    {
        set
        {
            TxtName.Width = value;
        }
    }



    public bool ButtonEnabled
    {
        set
        {
            btnGetLOV.Enabled = value;
        }
    }

    public bool ButtonVisible
    {
        set
        {
            btnGetLOV.Visible = value;
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

        autoCompletor.OnClientItemSelected = "CommonAutoSuggest_ItemSelected";
        autoCompletor.OnClientPopulated = "CommonAutoSuggest_ItemPopulated";
        autoCompletor.OnClientShown = "CommonAutoSuggest_ShowOptions";
        autoCompletor.ServicePath = this.Parent.Page.Request.FilePath;

        if (strLOV_Code == null && ViewState["strLOV_Code"] != null)
            strLOV_Code = ViewState["strLOV_Code"].ToString();

        if (strLOV_Code != null)
        {
            string strTitle = "";

            if (strLOV_Code.StartsWith("ACC_"))
            {
                strTitle = "Account Details";
                //string strQuery1= "window.showModalDialog('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID+ "&Popup=No','', 'dialogHeight:600px;dialogWidth:990px;resizable:no;status:no;');";
                //string str = "window.showModalDialog('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes', 'name','dialogWidth:255px;dialogHeight:250px');";
                //string i = "window.showModalDialog('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=No','', 'status:no;dialogWidth:600px;dialogHeight:250px;help:no;scroll:no');return false;";
                //string strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','dialogWidth:900px;dialogHeight:700px;status:no;help:no'); return false; ";
                string strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code +
                    "&ControlID=" + strControlID + "&Title=" + strTitle + "&LOB_ID=" + strLOB_ID +
                    "&LocationID=" + LocationID + "&Customer_ID=" + strCustomer_ID + "&LRN_ID=" + strLRN_NO +
                    " &Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=950,height=450,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
            }
            else if (strLOV_Code.StartsWith("CUS_"))
            {
                string strQuery = string.Empty;
                strTitle = "Customer Details";
                if ((strLOB_ID != null && strLOB_ID != string.Empty) && (strProgram_ID != null && strProgram_ID != string.Empty) && (strCustomer_ID != null && strCustomer_ID != string.Empty))
                {
                    strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID
                        + "&LOB_ID=" + strLOB_ID + "&Program_ID=" + strProgram_ID + "&Customer_ID=" + strCustomer_ID
                        + "&Title=" + strTitle + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=950,height=450,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                }
                else if ((strLOB_ID != null && strLOB_ID != string.Empty) && (strProgram_ID != null && strProgram_ID != string.Empty))
                {
                    strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID
                        + "&LOB_ID=" + strLOB_ID + "&Program_ID=" + strProgram_ID
                        + "&Title=" + strTitle + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=950,height=450,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                }
                else
                {
                    strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Title=" + strTitle + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=950,height=450,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                }
                btnGetLOV.OnClientClick = strQuery;
            }
            else if (strLOV_Code.StartsWith("ENT_"))
            {
                strTitle = "Entity Details";
                string strQuery = "window.open('../common/GetEntitySearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Title=" + strTitle + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=950,height=450,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
            }
            else if (strLOV_Code.StartsWith("PRO_"))
            {
                strTitle = "Application Details";
                string strQuery = "window.open('../common/GetProposalSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Title=" + strTitle + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,dialogHeight:250px;dialogWidth:850px,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;
            }
            else if (strLOV_Code.StartsWith("FA"))
            {
                string strQuery = "window.open('../common/FAGetLOV.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&LocationID=" + LocationID + "&LocationID2=" + LocationID2 + "&Param_Option1=" + Param_Option1 + "&DispCont=" + DispalyContent + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=700,height=450,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
                btnGetLOV.OnClientClick = strQuery;


            }
        }
    }
    //public void ReRegisterSearchControl(string LOVCode)
    //{
    //    string strQuery = "window.open('../common/GetInwardCustomer.aspx?LOV_Code=" + LOVCode + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";dialogHeight:250px;dialogWidth:850px
    //    ViewState["strLOV_Code"] = LOVCode;
    //    btnGetLOV.OnClientClick = strQuery;
    //    TxtName.Clear();
    //    hdnID.Value = "";
    //    //txtItemName.Attributes.Add("readonly", "true");
    //}

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

    public bool ShowHideAddressImageButton
    {
        set
        {
            btnAddress.Visible = value;
            tdbtnAddress.Visible = value;
        }
    }
    #endregion [Page Event's]

    #region [Function's]

    public void FunPubClearControlValue()
    {
        hdnID.Value = "";
        TxtName.Clear();// = "";
    }

    public void FunPubSetControlValue(string strID, string strName)
    {
        hdnID.Value = strID;
        TxtName.Text = strName;
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
                string strQuery = string.Empty;
                if (strLOV_Code.StartsWith("ACC_"))
                {
                    strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','','toolbar=no,location=no,menubar=no,width=340,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";

                    btnGetLOV.OnClientClick = strQuery;
                }
                else if (strLOV_Code.StartsWith("CUS_"))
                {
                    strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=340,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                    btnGetLOV.OnClientClick = strQuery;
                }
                else if (strLOV_Code.StartsWith("ENT_"))
                {
                    strQuery = "window.open('../common/GetCustomerSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=440,resizable=no,scrollbars=no,top=50,left=150'); return false; ";
                    btnGetLOV.OnClientClick = strQuery;
                }
                else if (strLOV_Code.StartsWith("FA"))
                {
                    strQuery = "window.open('../common/FAGetLOV.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&LocationID=" + LocationID + "&LocationID2=" + LocationID2 + "&Param_Option1=" + Param_Option1 + "&DispCont=" + DispalyContent + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=330,resizable=no,scrollbars=yes,top=50,left=150'); return false; ";
                    btnGetLOV.OnClientClick = strQuery;


                }


                //string strQuery = "window.open('../common/GetAccountSearch.aspx?LOV_Code=" + strLOV_Code + "&ControlID=" + strControlID + "&Popup=Yes','newwindow','toolbar=no,location=no,menubar=no,width=850,height=350,resizable=no,scrollbars=yes,top=50,left=150');";
                //btnGetLOV.OnClientClick = strQuery;

                TxtName.Attributes.Add("readonly", "false");
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
        get { return TxtName.Text; }
        set { TxtName.Text = value; }
    }

    public string ToolTip
    {
        get { return TxtName.ToolTip; }
        set { TxtName.ToolTip = value; }
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
    /// bool AutoSuggest.Enabled
    /// Get or Set a value indicating whether the AutoSuggest is Enabled mode.
    /// </summary>
    public bool Enabled
    {
        get
        {
            return TxtName.Enabled;
        }
        set
        {
            TxtName.Enabled = value;
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
            TxtName.Width = value;
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
        TxtName.Text = "";
        _AvailableRecords = 0;
        TxtName.Text = "";
        hdnID.Value = "0";
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
                rfvMultiSuggest.ControlToValidate = "TxtName";
                //txtBranchSearchExtender.Enabled = false;
                rfvMultiSuggest.InitialValue = "";
            }
            else
            {
                rfvMultiSuggest.ControlToValidate = "hdnSelectedValue";
                //txtBranchSearchExtender.Enabled = true;
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
        get { return TxtName; }
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

    protected void btnItem_Selected(object sender, EventArgs e)
    {
        if (Item_Selected != null)
        {
            Item_Selected(sender, e);
        }
        //Code added - To set focus
        this.Control_ID = this.ClientID.ToString();
        TextBox txtName = ((TextBox)this.FindControl("TxtName"));
    }
    public string WatermarkText
    {
        set
        {
            //txtBranchSearchExtender.WatermarkText = value;
        }

    }
    public bool WatermarkTextEnable
    {
        set
        {
            //txtBranchSearchExtender.Enabled = value;
        }

    }
    public bool EnableCaching
    {
        get { return autoCompletor.EnableCaching; }
        set { autoCompletor.EnableCaching = value; }
    }

    public string LocationID
    {
        get;
        set;
    }

    public int Param_Option1
    {
        get;
        set;
    }

    public string LocationID2
    {
        get;
        set;
    }
    public string LastSelectedText
    {
        get
        {
            return txtLastSelectedText.Value;

        }

    }
    public bool ReadOnly
    {
        get
        {
            return TxtName.ReadOnly;
        }
        set
        {
            TxtName.ReadOnly = value;
            autoCompletor.Enabled = !value;
        }
    }


    /// <summary>
    /// bool AutoSuggest.Enabled
    /// Get or Set a value indicating whether the AutoSuggest is Enabled mode.
    /// </summary>

    public bool EnabledbtnSelected
    {
        get
        {
            return btnSelected.Enabled;
        }
        set
        {
            btnSelected.Enabled = value;

        }
    }
    public void SetFocus()
    {
        TxtName.Focus();
    }
    public bool EnabledbtnGetLOV
    {
        get
        {
            return btnGetLOV.Enabled;
        }
        set
        {
            btnGetLOV.Enabled = value;

        }
    }
    public void ClearAddressControls()
    {
        UserControl CustomerDetails1 = (UserControl)S3GCustomerAddress1.FindControl("S3GCustomerAddress1");
        TextBox txtCustomerCode = (TextBox)S3GCustomerAddress1.FindControl("txtCustomerCode");
        TextBox txtCustomerCode1 = (TextBox)S3GCustomerAddress1.FindControl("txtCustomerCode1");
        TextBox txtCustomerName = (TextBox)S3GCustomerAddress1.FindControl("txtCustomerName");
        TextBox txtCustomerName1 = (TextBox)S3GCustomerAddress1.FindControl("txtCustomerName1");
        TextBox txtMobile = (TextBox)S3GCustomerAddress1.FindControl("txtMobile");
        TextBox txtMobile1 = (TextBox)S3GCustomerAddress1.FindControl("txtMobile1");
        TextBox txtPhone = (TextBox)S3GCustomerAddress1.FindControl("txtPhone");
        TextBox txtPhone1 = (TextBox)S3GCustomerAddress1.FindControl("txtPhone1");
        TextBox txtEmail = (TextBox)S3GCustomerAddress1.FindControl("txtEmail");
        TextBox txtEmail1 = (TextBox)S3GCustomerAddress1.FindControl("txtEmail1");
        TextBox txtWebSite = (TextBox)S3GCustomerAddress1.FindControl("txtWebSite");
        TextBox txtWebSite1 = (TextBox)S3GCustomerAddress1.FindControl("txtWebSite1");
        TextBox txtCusAddress = (TextBox)S3GCustomerAddress1.FindControl("txtCusAddress");
        TextBox txtCusAddress1 = (TextBox)S3GCustomerAddress1.FindControl("txtCusAddress1");

        txtCustomerCode.Text = txtCustomerCode1.Text = txtCustomerName.Text = txtCustomerName1.Text
            = txtMobile.Text = txtMobile1.Text = txtPhone.Text = txtPhone1.Text = txtEmail.Text = txtEmail1.Text
            = txtWebSite.Text = txtWebSite1.Text = txtCusAddress.Text = txtCusAddress1.Text = string.Empty;
    }
}
