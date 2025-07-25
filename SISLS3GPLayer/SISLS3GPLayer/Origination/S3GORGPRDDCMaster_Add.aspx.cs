
//Module Name      :   Origination
//Screen Name      :   S3GORGPRDDC_Add.aspx
//Created By       :   Kaliraj K
//Created Date     :   01-JUN-2010
//Purpose          :   To insert and update PRDDC code details

//Modified By      :    Thangam M
//Modified On      :    16-SEP-2010 

using System;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web.UI;
using System.ServiceModel;
using System.Data;
using System.Text;
using S3GBusEntity.Origination;
using S3GBusEntity;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Configuration;
using System.Linq;
using System.Collections;

public partial class S3GORGPRDDCMaster_Add : ApplyThemeForProject
{
    #region Intialization

    PRDDCMgtServicesReference.PRDDCMgtServicesClient ObjPRDDCMasterClient;
    PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
    SerializationMode SerMode = SerializationMode.Binary;
    int intErrCode = 0;
    static int intRowCount = 0;

    int intPRDDCID = 0;
    int intUserID = 0;
    int intCompanyID = 0;

    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    //Code end

    Dictionary<string, string> Procparam = null;
    string strXMLPRDDCDocumentsDet = "<Root><Details Doc_Cat_ID='0' /></Root>";
    StringBuilder strbLOBDet = new StringBuilder();
    StringBuilder strbPRDDCDocumentsDet = new StringBuilder();
    string strRedirectPage = "../Origination/S3GORGPRDDCMaster_View.aspx";
    string strKey = "Insert";
    string strPgmName = "S3G_ORG_GetWorkflowProgramMaster";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../Origination/S3GORGPRDDCMaster_Add.aspx';";
    string strRedirectPageView = "window.location.href='../Origination/S3GORGPRDDCMaster_View.aspx';";
    #endregion

    #region Paging Config
    int intNoofSearch = 3;
    ArrayList arrSearchVal = new ArrayList(1);
    PagingValues ObjPaging = new PagingValues();

    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);

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
        FunGetPRDDCGridDetails();
    }
    #endregion

    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            // For PRDDC Docs Grid
            lblGErrorMessage.InnerText = "";
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            arrSearchVal = new ArrayList(intNoofSearch);

            #region Paging Config

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

            #endregion

            UserInfo ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            lblErrorMessage.Text = "";

            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsViewId"));
                if (fromTicket != null)
                {
                    intPRDDCID = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
                strMode = Request.QueryString["qsMode"];
            }

            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            //Code end


            if (!IsPostBack)
            {
                //<<Performance>>
                if (PageMode == PageModes.Create)
                {
                    FunPriBindLOBProduct();
                    //FunPriBindProgram();
                }
                DummyRow();
                FunPriBindProduct();
                FunGetPRDDCDetails();
                FunGetPRDDCGridDetails();
                ddlConstitution.Items.Add(new ListItem("--Select--", "0"));

                //User Authorization
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                ddlLOB.Focus();
                hdnPRDDC.Value = String.Empty;
                if ((intPRDDCID > 0) && (strMode == "M"))
                {
                    //<<Performance>>
                    //modifyPRDDCDetails();
                    FunPriDisableControls(1);
                    txtScanPath.Focus();
                }
                else if ((intPRDDCID > 0) && (strMode == "Q")) // Query // Modify
                {
                    //modifyPRDDCDetails();
                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriDisableControls(0);
                    //lnkCopyProfile.Enabled = false;
                    lnkCopyProfile.Attributes.Add("disabled", "disabled");  // enable false
                    lnkCopyProfile.Attributes.Add("class", "css_btn_disabled");  // enable false css
                    divPRDDC.Visible = false;
                    divPRDDC.Style.Add("display", "none");
                    //btnSave.Visible = btnClear.Visible = false;
                    btnSave.Enabled_False();
                    ddlLOB.Focus();
                }
                //Code end
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }


    #endregion

    #region Page Events

    /// <summary>
    /// This is used to save PRDDC details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnSave_Click(object sender, EventArgs e)
    {
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        try
        {
            if (txtScanPath.Text.Trim() != "")
            {
                //string[] strScan = txtScanPath.Text.Split('/');c

                //string[]  strScan = txtScanPath.Text.Replace("/", "\\").Split('\\');              
                string[] strScan = txtScanPath.Text.Trim().Split('\\');
                var matchQuery = from word in strScan
                                 where word == ""
                                 select word;

                // Count the matches.
                int wordCount = matchQuery.Count();

                if (wordCount >= 2 || txtScanPath.Text.Trim().Contains('/'))
                {
                    Utility.FunShowAlertMsg(this.Page, "Invalid scan location path");
                    return;
                }

            }

            if (txtScanPath.Text.Trim() != "" && !Directory.Exists(txtScanPath.Text.Trim()))
            {
                Utility.FunShowAlertMsg(this.Page, "Invalid scan location path");
                return;
            }

            bool rowCnt = false;
            bool chkMan = false;
            bool chk = false;
            foreach (GridViewRow grvData in grvPRDDCDocuments.Rows)
            {
                if (grvData.Visible)
                {
                    rowCnt = true;
                    CheckBox chkImageCopy = (CheckBox)grvData.FindControl("chkImageCopy");
                    CheckBox chkOptMan = (CheckBox)grvData.FindControl("chkOptMan");
                    if (chkOptMan.Checked) chkMan = true;
                    if (chkImageCopy.Checked)
                    {
                        chk = true;
                        //break;
                    }
                }
            }
            if (rowCnt == false)
            {
                Utility.FunShowAlertMsg(this.Page, "Add atleast one row to save");
                return;
            }
            if (chkMan == false)
            {
                Utility.FunShowAlertMsg(this.Page, "Select atleast one mandatory PRDDc document to save");
                return;
            }
            if (txtScanPath.Text.Trim() == "" && chk)
            {
                Utility.FunShowAlertMsg(this.Page, "Define the Scan Location Path in Document path setup");
                return;
            }

            int rowCountCheck = 0;
            if (GrvConstitution.Rows.Count > 0)
            {
                foreach (GridViewRow grvData in GrvConstitution.Rows)
                {
                    CheckBox chkLOB = ((CheckBox)grvData.FindControl("chkSelect"));
                    if (chkLOB.Checked)
                    {
                        rowCountCheck = 1;
                        break;
                    }
                }
            }
            if (rowCountCheck == 0)
            {
                Utility.FunShowAlertMsg(this, "Select atleast one Constitution");
                return;
            }
            rowCountCheck = 0;
            if (GrvConstitution.Rows.Count > 0)
            {
                foreach (GridViewRow grvData in grvOcupation.Rows)
                {
                    CheckBox chkLOB = ((CheckBox)grvData.FindControl("chkSelectOc"));
                    if (chkLOB.Checked)
                    {
                        rowCountCheck = 1;
                        break;
                    }
                }
            }
            if (rowCountCheck == 0)
            {
                if (hvOccGrdFlag.Value != "Y")
                {
                    Utility.FunShowAlertMsg(this, "Select atleast one Occupation");
                    return;
                }
            }
            rowCountCheck = 0;
            if (GrvConstitution.Rows.Count > 0)
            {
                foreach (GridViewRow grvData in grvContractType.Rows)
                {
                    CheckBox chkLOB = ((CheckBox)grvData.FindControl("chkSelectCT"));
                    if (chkLOB.Checked)
                    {
                        rowCountCheck = 1;
                        break;
                    }
                }
            }
            if (rowCountCheck == 0)
            {
                Utility.FunShowAlertMsg(this, "Select atleast one Contract Type");
                return;
            }


            ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
            PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
            ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();

            ObjPRDDCRow.Company_ID = intCompanyID;
            ObjPRDDCRow.PRDDC_ID = intPRDDCID;
            ObjPRDDCRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
            ObjPRDDCRow.Product_ID = Convert.ToInt32(ddlProductCode.SelectedValue);
            ObjPRDDCRow.Constitution_ID = GrvConstitution.FunPubFormXml();
            ObjPRDDCRow.Occupation = grvOcupation.FunPubFormXml();
            ObjPRDDCRow.ContractType = grvContractType.FunPubFormXml();
            ObjPRDDCRow.DocPath = txtScanPath.Text.Trim();//.Replace("/", "\\").Trim();
            ObjPRDDCRow.Created_By = intUserID != null ? Convert.ToInt32(intUserID) : 0;
            FunPriGeneratePRDDCDocDet();
            ObjPRDDCRow.XMLPRDDCDocumentsDet = strXMLPRDDCDocumentsDet;
            //DataTable dt = (DataTable)ViewState["GRIDROW"];
            //if (dt != null)
            //{
            //    ObjPRDDCRow.XMLPRDDCDocumentsDet = dt.FunPubFormXml();
            //}
            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

            intErrCode = ObjPRDDCMasterClient.FunPubCreatePRDDCDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));

            if (intErrCode == 0)
            {
                //Added by Thangam M on 18/Oct/2012 to avoid double save click
                //btnSave.Enabled = false;
                btnSave.Attributes.Add("disabled", "disabled");  // enable false
                btnSave.Attributes.Add("class", "css_btn_disabled");  // enable false css
                //End here


                if (intPRDDCID > 0)
                {
                    Utility.FunShowAlertMsg(this.Page, "PRDDC details updated successfully", strRedirectPage);
                }
                else
                {
                    strAlert = "PRDDC details added successfully";
                    strAlert += @"\n\nWould you like to add one more PRDDC?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                }
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "PRDDC details already exist");
            }
            else if (intErrCode == 3)
            {
                Utility.FunShowAlertMsg(this.Page, "PRDDC details cannot be updated.Transaction exists");
                return;
            }
            //else if (intErrCode == 2)
            //{
            //    Utility.FunShowAlertMsg(this.Page, "Document sequence number is not defined to create PRDDC Code");
            //}
            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
        finally
        {
            ObjPRDDCMasterClient.Close();
        }
    }


    /// <summary>
    /// This is used to redirect page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
        btnCancel.Focus();//Added by Suseela
    }

    protected void grvPRDDC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridView grvPRDDC = (GridView)sender;

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal ||
            e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBoxSelect = (CheckBox)e.Row.FindControl("chkSel");
            chkBoxSelect.Attributes["onclick"] = string.Format
                                      (
                                         "javascript:fnDGUnselectAllExpectSelected('{0}',this);",
                                         grvPRDDC.ClientID
                                     );
        }
    }

    /// <summary>
    /// checkbox validation for PRDDCal Documents
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    /// 

    protected void grvPRDDCDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblDocCatID = (Label)e.Row.FindControl("lblDocCatID");
                Label lblPgmID = (Label)e.Row.FindControl("lblPgmID");
                //CheckBox chkSel = (CheckBox)e.Row.FindControl("chkSel");
                DropDownList ddlPgmID = (DropDownList)e.Row.FindControl("ddlPgmID");
                TextBox txtRemarks = (TextBox)e.Row.FindControl("txtRemarks");
                Label lblOptMan = (Label)e.Row.FindControl("lblOptMan");
                Label lblImageCopy = (Label)e.Row.FindControl("lblImageCopy");
                CheckBox chkOptMan = (CheckBox)e.Row.FindControl("chkOptMan");
                CheckBox chkImageCopy = (CheckBox)e.Row.FindControl("chkImageCopy");
                Button lnkRemovePRDDC = (Button)e.Row.FindControl("lnkRemovePRDDC");

                Label lblCheckList = (Label)e.Row.FindControl("lblCheckList");
                CheckBox chkCheckList = (CheckBox)e.Row.FindControl("chkCheckList");

                ddlPgmID.Attributes.Add("onmouseover", "showDDTooltip(this,event,'" + divTooltip.ClientID + "');");
                ddlPgmID.Attributes.Add("onmouseout", "hideDDTooltip('" + divTooltip.ClientID + "');");

                //BindDataTable(ddlPgmID, new string[] { "Program_ID", "Program_Ref_No", "Program_Name" }); - kuppu
                BindDataTable(ddlPgmID, new string[] { "Program_ID", "Program_Name" });

              


                //if (lblOptMan.Text == "True") chkOptMan.Checked = true;
                //if (lblImageCopy.Text == "True") chkImageCopy.Checked = true;

                //  Modified by SENTHILKUMAR P - PSK for Oracle

                if (lblOptMan.Text.Trim() == "True" || lblOptMan.Text.Trim() == "1") chkOptMan.Checked = true;
                if (lblImageCopy.Text.Trim() == "True" || lblImageCopy.Text.Trim() == "1") chkImageCopy.Checked = true;
                if (lblCheckList.Text.Trim() == "True" || lblCheckList.Text.Trim() == "1") chkCheckList.Checked = true;

                //  Modified by SENTHILKUMAR P -- PSK for Oracle

                ddlPgmID.SelectedValue = lblPgmID.Text;

                //Commented by Thangam M on 14/Mar/2012 to fix bug id - 5481
                //if (strMode == "M")
                //{
                //    if (intRowCount > grvPRDDCDocuments.Rows.Count)
                //    {
                //        lnkRemovePRDDC.Enabled = false;
                //    }
                //}
                //End here

                //ddlPgmID.AddItemToolTip();
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                txtPRDDCDesc.Attributes.Add("onkeypress", "javascript:if(this.value.toUpperCase()!='--SELECT--' && this.value!='')fnCheckSpecialCharsStartWithAlphabets(true,this.value);");
                txtPRDDCDesc.Attributes.Add("onblur", "javascript:if(this.value.toUpperCase()!='--SELECT--' && this.value!='' )fnCheckSingleAlphabets(this.value,this,'Description'); else this.value='--Select--'");
                txtPRDDCDesc.Attributes.Add("onfocus", "if(this.value.toUpperCase()=='--SELECT--')this.value=''");

                DropDownList ddlPriorityType = (DropDownList)e.Row.FindControl("ddlPriorityType");
                DropDownList ddlPRDDCType = (DropDownList)e.Row.FindControl("ddlPRDDCType");
                DropDownList ddlPRDDCDesc = (DropDownList)e.Row.FindControl("ddlPRDDCDesc");
                DropDownList ddlFooterPgmID = (DropDownList)e.Row.FindControl("ddlFooterPgmID");

                //<<Performance>>
                if (PageMode != PageModes.Query)
                {
                    Procparam = new Dictionary<string, string>();
                    DataSet dsPRDDCDesc = Utility.GetTableValues(SPNames.S3G_ORG_GetPRDDC_DocumentCategory, Procparam);

                    ddlPRDDCType.DataSource = dsPRDDCDesc.Tables[1];
                    ddlPRDDCType.DataTextField = "PRDDC_Doc_Type";
                    ddlPRDDCType.DataValueField = "PRDDC_Doc_Type";
                    ddlPRDDCType.DataBind();
                    ddlPRDDCType.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlPRDDCType.AddItemToolTip();

                    ddlPriorityType.DataSource = dsPRDDCDesc.Tables[3];
                    ddlPriorityType.DataTextField = "DESCRIPTION";
                    ddlPriorityType.DataValueField = "LOOKUP_CODE";
                    ddlPriorityType.DataBind();
                    ddlPriorityType.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddlPriorityType.AddItemToolTip();
                }

                //ddlPRDDCType.Attributes.Add("onmouseover", "showDDTooltip(this,event,'" + divTooltip.ClientID + "');");
                //ddlPRDDCType.Attributes.Add("onmouseout", "hideDDTooltip('" + divTooltip.ClientID + "');");
                BindDataTable(ddlFooterPgmID, new string[] { "Program_ID", "Program_Ref_No", "Program_Name" });
                ddlFooterPgmID.Attributes.Add("onmouseover", "showDDTooltip(this,event,'" + divTooltip.ClientID + "');");
                ddlFooterPgmID.Attributes.Add("onmouseout", "hideDDTooltip('" + divTooltip.ClientID + "');");
                //ddlFooterPgmID.AddItemToolTip();   

            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    protected void grvPRDDC_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridView grvPRDDC = (GridView)sender;

        if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState == DataControlRowState.Normal ||
            e.Row.RowState == DataControlRowState.Alternate))
        {
            CheckBox chkBoxSelect = (CheckBox)e.Row.FindControl("chkSel");
            chkBoxSelect.Attributes["onclick"] = string.Format
                                      (
                                         "javascript:fnDGUnselectAllExpectSelected('{0}',this);",
                                         grvPRDDC.ClientID
                                     );
        }
    }


    /// <summary>
    /// This is used to clear data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            hdnPRDDC.Value = String.Empty;
            ddlLOB.SelectedIndex = 0;
            //ddlLOB.ToolTip = ddlLOB.SelectedItem.Text.Trim();
            if (ddlProductCode.Items.Count > 0)
            {
                ddlProductCode.SelectedIndex = 0;
                //ddlProductCode.ToolTip = ddlProductCode.SelectedItem.Text.Trim();
            }
            //if (ddlConstitution.Items.Count > 0)
            //{
            //    ddlConstitution.SelectedIndex = 0;
            //    //ddlConstitution.ToolTip = ddlConstitution.SelectedItem.Text.Trim();
            //}

            txtScanPath.Text = "";
            hdnPRDDC.Value = "0";
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            dt.Rows.Clear();
            //DummyRow();
            //grvPRDDCDocuments.Columns[grvPRDDCDocuments.Columns.Count - 1].Visible = true;            
            GrvConstitution.ClearGrid();
            grvOcupation.ClearGrid();
            grvContractType.ClearGrid();
            grvPRDDCDocuments.ClearGrid();
            //btnClear.Visible = btnSave.Visible = false;
            btnSave.Enabled_False();
            //lnkCopyProfile.Enabled = false;
            lnkCopyProfile.Attributes.Add("disabled", "disabled");  // enable false
            lnkCopyProfile.Attributes.Add("class", "css_btn_disabled");  // enable false css
            //btnGo.Enabled = true;
            btnGo.Attributes.Remove("disabled");
            btnGo.Attributes.Add("class", "css_btn_enabled");  // enab
            btnClear.Focus();//Added by Suseela
            ucCustomPaging.Visible = false;
            hvOccGrdFlag.Value = null;
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    #endregion

    #region Page Methods

    private void FunPriBindProgram()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Is_Active", "1");
            ViewState["dtProgram"] = Utility.GetDefaultData(strPgmName, Procparam);
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    /// <summary>
    /// to bind LOB and Product details
    /// </summary>
    private void FunPriBindLOBProduct()
    {
        //LOB List
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (PageMode == PageModes.Create)
            {
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@User_ID", intUserID.ToString());
            Procparam.Add("@Program_ID", "25");
            ddlLOB.BindDataTable(SPNames.LOBMaster, Procparam, new string[] { "LOB_ID", "LOB_Name" });
            ddlLOB.AddItemToolTip();
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    protected void ddlLOB_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        ddlLOB.AddItemToolTip();
        ddlLOB.ToolTip = ddlLOB.SelectedItem.Text.Trim();
        hvOccGrdFlag.Value = null;
        FunPriBindProduct();
        ClearPRDDCGrid();
        ddlLOB.Focus();
    }

    private void ClearPRDDCGrid()
    {
        if (divPRDDC.Visible)
        {
            divPRDDC.Visible = false;
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            if (dt.Rows.Count > 0)
                dt.Rows.Clear();
            bindGridPaging(0);
            DummyRow();
            //btnSave.Visible = btnClear.Visible = false;
            btnSave.Enabled_False();
            //lnkCopyProfile.Enabled = false;
            lnkCopyProfile.Attributes.Add("disabled", "disabled");
            lnkCopyProfile.Attributes.Add("class", "css_btn_disabled");  // enab

        }
    }
    protected void GrvConstitution_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblChked = (Label)e.Row.FindControl("lblChked");
                CheckBox chkSelect = (CheckBox)e.Row.FindControl("chkSelect");
                Label lblFlag = (Label)e.Row.FindControl("lblFlag");

                if (lblChked.Text == "0")
                    chkSelect.Checked = false;
                else
                    chkSelect.Checked = true;


                if (!String.IsNullOrEmpty(lblFlag.Text))
                {
                    if (chkSelect.Checked == true && lblFlag.Text == "Y")
                    {
                        hvOccGrdFlag.Value = "Y";//based on Non - Indv Type of customer , should disable occupaton grid
                    }
                }
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void grvOcupation_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label lblChkedOc = (Label)e.Row.FindControl("lblChkedOc");
                CheckBox chkSelectOc = (CheckBox)e.Row.FindControl("chkSelectOc");
                if (lblChkedOc.Text == "0")
                    chkSelectOc.Checked = false;
                else
                    chkSelectOc.Checked = true;
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void grvContractType_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblChkedCT = (Label)e.Row.FindControl("lblChkedCT");
                CheckBox chkSelectCT = (CheckBox)e.Row.FindControl("chkSelectCT");
                if (lblChkedCT.Text == "0")
                    chkSelectCT.Checked = false;
                else
                    chkSelectCT.Checked = true;
            }
        }
        catch (Exception ex)
        {

        }
    }

    private void FunPriBindProduct()
    {
        //Product Code
        try
        {
            ddlConstitution.Items.Clear();
            ddlProductCode.Items.Clear();

            //condition added for bug fixing - Bug id_5469 - Kuppusamy.B
            if (ddlLOB.SelectedIndex > 0 || ddlLOB.SelectedValue != "0")
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
                Procparam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
                Procparam.Add("@Is_Active", "1");
                Procparam.Add("@PAGEMODE", "1");
                ddlProductCode.BindDataTable(SPNames.SYS_ProductMaster, Procparam, new string[] { "Product_ID", "Product_Name" });
                ddlProductCode.AddItemToolTip();
                //if (PageMode == PageModes.Create)
                //{
                //    Procparam.Add("@Is_Active", "1");
                //    Procparam.Add("@PAGEMODE", "1");
                //    ddlProductCode.BindDataTable(SPNames.SYS_ProductMaster, Procparam, new string[] { "Product_ID", "Product_Name" });
                //    ddlProductCode.AddItemToolTip();

                //}
                //else
                //{
                //    Procparam.Add("@PAGEMODE", "2");
                //    Procparam.Add("@PRDDCID", intPRDDCID.ToString());
                //}

                //Code changed for bug fixing - Product code not required - Kuppusamy.B - Feb-29-2012
                //ddlProductCode.BindDataTable(SPNames.SYS_ProductMaster, Procparam, new string[] { "Product_ID", "Product_Code", "Product_Name" });


                //Constitution
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
                Procparam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
                if (PageMode == PageModes.Create)
                {
                    Procparam.Add("@Is_Active", "1");
                    Procparam.Add("@PAGEMODE", "1");
                }
                else
                {
                    Procparam.Add("@PAGEMODE", "2");
                    Procparam.Add("@PRDDCID", intPRDDCID.ToString());
                }
                DataSet dtConstitutionMaster = Utility.GetDataset(SPNames.S3G_Get_ConstitutionMaster, Procparam);

                //code modified get scan path from Doc.Path setup - bug fixing _ Bug_Id - 5469 - Kuppusamy.B - 15/02/2012
                //ddlConstitution.BindDataTable(SPNames.S3G_Get_ConstitutionMaster, Procparam, new string[] { "Constitution_ID", "ConstitutionName" });

                //Code changed for bug fixing - Constitution code not required - Kuppusamy.B - Feb-29-2012
                //ddlConstitution.BindDataTable(dtConstitutionMaster, new string[] { "Constitution_ID", "Constitution_Name" });
                if (dtConstitutionMaster.Tables.Count > 0)
                {
                    if (dtConstitutionMaster.Tables[0].Rows.Count > 0)
                    {
                        if (PageMode == PageModes.Create)
                        {
                            txtScanPath.Text = Convert.ToString(dtConstitutionMaster.Tables[0].Rows[0]["Document_Path"]);
                        }

                        GrvConstitution.DataSource = dtConstitutionMaster.Tables[0];
                        GrvConstitution.DataBind();

                        pnlConstitution.Visible = true;
                    }
                    else
                    {
                        GrvConstitution.DataSource = null;
                        GrvConstitution.EmptyDataText = "No Records Found";
                        GrvConstitution.DataBind();
                        pnlConstitution.Visible = true;
                    }

                    if (dtConstitutionMaster.Tables[1].Rows.Count > 0)
                    {
                        grvOcupation.DataSource = dtConstitutionMaster.Tables[1];
                        grvOcupation.DataBind();
                        pnlOcupation.Visible = true;
                    }
                    else
                    {
                        grvOcupation.DataSource = null;
                        GrvConstitution.EmptyDataText = "No Records Found";
                        grvOcupation.DataBind();
                        pnlOcupation.Visible = true;
                    }

                    if (dtConstitutionMaster.Tables[2].Rows.Count > 0)
                    {
                        grvContractType.DataSource = dtConstitutionMaster.Tables[2];
                        grvContractType.DataBind();
                        pnlContractType.Visible = true;
                    }
                    else
                    {
                        grvContractType.DataSource = null;
                        grvContractType.EmptyDataText = "No Records Found";
                        grvContractType.DataBind();
                        pnlContractType.Visible = true;
                    }
                    txtScanPath.Attributes.Add("Readonly", "Readonly");
                    ddlConstitution.AddItemToolTip();
                }
            }
            else
            {
                GrvConstitution.DataSource = null;
                GrvConstitution.EmptyDataText = "No Records Found";
                GrvConstitution.DataBind();
                pnlConstitution.Visible = true;

                grvOcupation.DataSource = null;
                grvOcupation.EmptyDataText = "No Records Found";
                grvOcupation.DataBind();
                pnlOcupation.Visible = true;

                grvContractType.DataSource = null;
                grvContractType.EmptyDataText = "No Records Found";
                grvContractType.DataBind();
                pnlContractType.Visible = true;

                txtScanPath.Text = "";
                ddlConstitution.Items.Insert(0, new ListItem("--Select--", "--Select--"));
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    /// <summary>
    /// This method is used to display User details
    /// </summary>
    private void FunGetPRDDCDetails()
    {
        DataSet dsPRDDC = new DataSet();
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        try
        {
            ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
            PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
            ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();

            ObjPRDDCRow.Company_ID = intCompanyID;
            ObjPRDDCRow.PRDDC_ID = intPRDDCID;
            ObjPRDDCRow.Created_By = intUserID;

            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

            byte[] bytePRDDCDetails = ObjPRDDCMasterClient.FunPubQueryPRDDCDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));
            dsPRDDC = (DataSet)ClsPubSerialize.DeSerialize(bytePRDDCDetails, SerializationMode.Binary, typeof(DataSet));

            if ((intPRDDCID > 0) && (dsPRDDC.Tables[0].Rows.Count > 0) && hdnPRDDC.Value == "0")
            {
                //<<Performance>>
                ListItem lst;

                lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["LOB_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["LOB_ID"].ToString());
                ddlLOB.Items.Add(lst);
                ddlLOB.SelectedValue = dsPRDDC.Tables[0].Rows[0]["LOB_ID"].ToString();
                //ddlLOB.ToolTip = ddlLOB.SelectedItem.Text.Trim();
                //FunPriBindProduct();
                //if (strMode == "Q")
                //{
                txtScanPath.Text = dsPRDDC.Tables[0].Rows[0]["Document_Path"].ToString();
                //}

                //lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["Product_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["Product_ID"].ToString());
                //ddlProductCode.Items.Add(lst);

                ddlProductCode.SelectedValue = dsPRDDC.Tables[0].Rows[0]["Product_ID"].ToString();
                //ddlProductCode.ToolTip = ddlProductCode.SelectedItem.Text.Trim();

                lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["Constitution_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["Constitution_ID"].ToString());
                ddlConstitution.Items.Add(lst);

                ddlConstitution.SelectedValue = dsPRDDC.Tables[0].Rows[0]["Constitution_ID"].ToString();
                //ddlConstitution.ToolTip = ddlConstitution.SelectedItem.Text.Trim();
                //txtScanPath.Text = dsPRDDC.Tables[0].Rows[0]["Document_Path"].ToString();
            }

            //<<Performance>>
            if ((dsPRDDC.Tables[1].Rows.Count > 0) && (intPRDDCID == 0))
            {
                grvPRDDC.DataSource = dsPRDDC.Tables[1];
                grvPRDDC.DataBind();
                trCopyProfileMessage.Visible = false;
            }
            else if (dsPRDDC.Tables[1].Rows.Count == 0)
            {
                trCopyProfileMessage.Visible = true;
            }

            //<<Performance>>

            if (dsPRDDC.Tables[3] != null)
            {
                ViewState["dtProgram"] = dsPRDDC.Tables[3];
            }

            if (dsPRDDC.Tables[4].Rows.Count > 0)
            {
                GrvConstitution.DataSource = dsPRDDC.Tables[4];
                GrvConstitution.DataBind();
            }

            if (dsPRDDC.Tables[5].Rows.Count > 0)
            {
                grvOcupation.DataSource = dsPRDDC.Tables[5];
                grvOcupation.DataBind();
            }

            if (dsPRDDC.Tables[6].Rows.Count > 0)
            {
                grvContractType.DataSource = dsPRDDC.Tables[6];
                grvContractType.DataBind();
            }
            if (strMode == "M")
                ViewState["GRIDROW"] = dsPRDDC.Tables[2];
            //intRowCount = dsPRDDC.Tables[2].Rows.Count;
            //grvPRDDCDocuments.DataSource = dsPRDDC.Tables[2];
            //grvPRDDCDocuments.DataBind();            
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
        finally
        {
            dsPRDDC.Dispose();
            dsPRDDC = null;
            ObjPRDDCMasterClient.Close();
        }
    }

    /// <summary>
    /// This method is used to display User details
    /// </summary>
    private void FunGetPRDDCGridDetails()
    {
        try
        {
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue();

            UpdateDataTableBefPgeNavg();

            Procparam = new Dictionary<string, string>();
            if (hdnPRDDC.Value != null && hdnPRDDC.Value != "0" && !(string.IsNullOrEmpty(hdnPRDDC.Value)))
                Procparam.Add("@PRDDC_ID", hdnPRDDC.Value);
            else
                Procparam.Add("@PRDDC_ID", intPRDDCID.ToString());

            grvPRDDCDocuments.BindGridView("S3G_OR_GET_PRDDCGridDocs", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvPRDDCDocuments.Rows[0].Visible = false;
            }

            FunPriSetSearchValue();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);
            lblGErrorMessage.InnerText = "";

            UpdateGridAftrPgeNavg();
            //Paging Config End
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblGErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblGErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        //DataSet dsPRDDC = new DataSet();
        //divPRDDC.Style.Add("display", "block");
        //ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        //try
        //{
        //    ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
        //    PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
        //    ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();

        //    ObjPRDDCRow.Company_ID = intCompanyID;
        //    ObjPRDDCRow.PRDDC_ID = intPRDDCID;
        //    ObjPRDDCRow.Created_By = intUserID;

        //    ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

        //    byte[] bytePRDDCDetails = ObjPRDDCMasterClient.FunPubQueryPRDDCGridDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));
        //    dsPRDDC = (DataSet)ClsPubSerialize.DeSerialize(bytePRDDCDetails, SerializationMode.Binary, typeof(DataSet));

        //    if ((intPRDDCID > 0) && (dsPRDDC.Tables[0].Rows.Count > 0) && hdnPRDDC.Value == "0")
        //    {
        //        ////<<Performance>>
        //        //ListItem lst;

        //        //lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["LOB_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["LOB_ID"].ToString());
        //        //ddlLOB.Items.Add(lst);
        //        //ddlLOB.SelectedValue = dsPRDDC.Tables[0].Rows[0]["LOB_ID"].ToString();
        //        ////ddlLOB.ToolTip = ddlLOB.SelectedItem.Text.Trim();
        //        ////FunPriBindProduct();
        //        ////if (strMode == "Q")
        //        ////{
        //        //txtScanPath.Text = dsPRDDC.Tables[0].Rows[0]["Document_Path"].ToString();
        //        ////}

        //        ////lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["Product_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["Product_ID"].ToString());
        //        ////ddlProductCode.Items.Add(lst);

        //        //ddlProductCode.SelectedValue = dsPRDDC.Tables[0].Rows[0]["Product_ID"].ToString();
        //        ////ddlProductCode.ToolTip = ddlProductCode.SelectedItem.Text.Trim();

        //        //lst = new ListItem(dsPRDDC.Tables[0].Rows[0]["Constitution_Code"].ToString(), dsPRDDC.Tables[0].Rows[0]["Constitution_ID"].ToString());
        //        //ddlConstitution.Items.Add(lst);

        //        //ddlConstitution.SelectedValue = dsPRDDC.Tables[0].Rows[0]["Constitution_ID"].ToString();
        //        ////ddlConstitution.ToolTip = ddlConstitution.SelectedItem.Text.Trim();
        //        ////txtScanPath.Text = dsPRDDC.Tables[0].Rows[0]["Document_Path"].ToString();
        //    }

        //    //<<Performance>>
        //    //if ((dsPRDDC.Tables[1].Rows.Count > 0) && (intPRDDCID == 0))
        //    //{
        //    //    grvPRDDC.DataSource = dsPRDDC.Tables[1];
        //    //    grvPRDDC.DataBind();
        //    //    trCopyProfileMessage.Visible = false;
        //    //}
        //    //else if (dsPRDDC.Tables[1].Rows.Count == 0)
        //    //{
        //    //    trCopyProfileMessage.Visible = true;
        //    //}

        //    //<<Performance>>
        //    divPRDDC.Style.Add("display", "block");
        //    divPRDDC.Visible = true;

        //    //if (dsPRDDC.Tables[3] != null)
        //    //{
        //    //    ViewState["dtProgram"] = dsPRDDC.Tables[3];
        //    //}

        //    //if (dsPRDDC.Tables[4].Rows.Count > 0)
        //    //{
        //    //    GrvConstitution.DataSource = dsPRDDC.Tables[4];
        //    //    GrvConstitution.DataBind();
        //    //}

        //    //if (dsPRDDC.Tables[5].Rows.Count > 0)
        //    //{
        //    //    grvOcupation.DataSource = dsPRDDC.Tables[5];
        //    //    grvOcupation.DataBind();
        //    //}

        //    //if (dsPRDDC.Tables[6].Rows.Count > 0)
        //    //{
        //    //    grvContractType.DataSource = dsPRDDC.Tables[6];
        //    //    grvContractType.DataBind();
        //    //}

        //    //intRowCount = dsPRDDC.Tables[2].Rows.Count;
        //    grvPRDDCDocuments.DataSource = dsPRDDC.Tables[0];
        //    grvPRDDCDocuments.DataBind();
        //}
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        //catch (Exception ex)
        //{
        //    lblErrorMessage.Text = ex.Message;
        //    ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        //}
        //finally
        //{
        //    dsPRDDC.Dispose();
        //    dsPRDDC = null;
        //    ObjPRDDCMasterClient.Close();
        //}
    }

    #region Paging and Searching Methods For Grid


    private void bindGridPaging(int dataCount)
    {
        ucCustomPaging.Navigation(dataCount, ProPageNumRW, ProPageSizeRW);
        ucCustomPaging.setPageSize(ProPageSizeRW);
    }

    private void FunPriGetSearchValue()
    {
        arrSearchVal = grvPRDDCDocuments.FunPriGetSearchValue(arrSearchVal, intNoofSearch);
    }

    private void FunPriClearSearchValue()
    {
        grvPRDDCDocuments.FunPriClearSearchValue(arrSearchVal);
    }

    private void FunPriSetSearchValue()
    {
        grvPRDDCDocuments.FunPriSetSearchValue(arrSearchVal);
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {

        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            //    txtboxSearch = ((TextBox)sender);

            //    FunPriGetSearchValue();
            //    //Replace the corresponding fields needs to search in sqlserver

            //    for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            //    {
            //        if (arrSearchVal[iCount].ToString() != "")
            //        {
            //            strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
            //        }
            //    }

            //    if (strSearchVal.StartsWith(" and "))
            //    {
            //        strSearchVal = strSearchVal.Remove(0, 5);
            //    }

            //    hdnSearch.Value = strSearchVal;
            //    FunPriBindGrid();
            //    FunPriSetSearchValue();
            //    if (txtboxSearch.Text != "")
            //        ((TextBox)grvPRDDCDocuments.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
            lblGErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private string FunPriGetSortDirectionStr(string strColumn)
    {
        string strSortDirection = string.Empty;
        string strSortExpression = string.Empty;
        // By default, set the sort direction to ascending.
        string strOrderBy = string.Empty;
        strSortDirection = "DESC";
        try
        {
            // Retrieve the last strColumn that was sorted.
            // Check if the same strColumn is being sorted.
            // Otherwise, the default value can be returned.
            strSortExpression = hdnSortExpression.Value;
            if ((strSortExpression != "") && (strSortExpression == strColumn) && (hdnSortDirection.Value != null) && (hdnSortDirection.Value == "DESC"))
            {
                strSortDirection = "ASC";
            }
            // Save new values in hidden control.
            hdnSortDirection.Value = strSortDirection;
            hdnSortExpression.Value = strColumn;
            string strSplitColumn = "";
            if (strColumn.Contains("+"))
            {
                strSplitColumn = strColumn.Substring(0, strColumn.IndexOf("+"));
            }
            else
            {
                strSplitColumn = strColumn;
            }
            strOrderBy = " " + strSplitColumn + " " + strSortDirection;
            hdnOrderBy.Value = strOrderBy;
        }
        catch (Exception ex)
        {
            lblGErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return strSortDirection;
    }

    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        arrSearchVal = new ArrayList(intNoofSearch);
        var imgbtnSearch = string.Empty;
        try
        {
            //LinkButton lnkbtnSearch = (LinkButton)sender;
            //string strSortColName = string.Empty;
            ////To identify image button which needs to get chnanged
            //imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");

            //for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            //{
            //    if (lnkbtnSearch.ID == "lnkbtnSort" + (iCount + 1).ToString())
            //    {
            //        strSortColName = arrSortCol[iCount].ToString();
            //        break;
            //    }
            //}

            //string strDirection = FunPriGetSortDirectionStr(strSortColName);
            //FunPriBindGrid();

            //if (strDirection == "ASC")
            //{
            //    ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            //}
            //else
            //{

            //    ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            //}
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblGErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblGErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    #endregion

    protected void UpdateDataTableBefPgeNavg()
    {
        DataTable dtUpdate = (DataTable)ViewState["GRIDROW"];
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        DropDownList ddlPgmID = null;
        try
        {
            foreach (GridViewRow gvr in grvPRDDCDocuments.Rows)
            {
                if (strMode != "M")
                {
                    lblDocCatID = (Label)gvr.FindControl("lblDocCatID");
                    if (lblDocCatID.Text != String.Empty)
                        dr = dtUpdate.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
                }
                else
                {
                    lblPrdcDocsId = (Label)gvr.FindControl("lblPRDDC_Documents_ID");
                    if (lblPrdcDocsId.Text != String.Empty)
                        dr = dtUpdate.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
                }
                if (dr != null)
                {
                    ddlPgmID = ((DropDownList)grvPRDDCDocuments.FindControl("ddlPgmID"));
                    dr["Program_ID"] = ddlPgmID.SelectedValue != null ? ddlPgmID.SelectedValue : "";
                    dr["Doc_Cat_ID"] = ((Label)grvPRDDCDocuments.FindControl("lblDocCatID")).Text.Trim();
                    dr["Doc_Cat_OptMan"] = ((CheckBox)grvPRDDCDocuments.FindControl("chkOptMan")).Checked == true ? "1" : "0";
                    dr["Doc_Cat_CheckList"] = ((CheckBox)grvPRDDCDocuments.FindControl("chkCheckList")).Checked == true ? "1" : "0";
                    dr["Doc_Cat_ImageCopy"] = ((CheckBox)grvPRDDCDocuments.FindControl("chkImageCopy")).Checked == true ? "1" : "0";
                    dr["Remarks"] = ((TextBox)grvPRDDCDocuments.FindControl("txtRemarks")).Text.Replace("'", "\"").Replace(">", "").Replace("<", "").Replace("&", "");
                    dr["LOOKUP_CODE"] = ((Label)grvPRDDCDocuments.FindControl("lblPriorityTypeCode")).Text.Trim();
                    dr["Display_Order"] = ((Label)grvPRDDCDocuments.FindControl("lblDisplayOrder")).Text.Trim();
                    dr["Remarks"] = ((TextBox)grvPRDDCDocuments.FindControl("txtRemarks")).Text.Trim();
                }
                dtUpdate.AcceptChanges();
            }
            ViewState["GRIDROW"] = dtUpdate;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void UpdateGridAftrPgeNavg()
    {
        DataTable dtUpdate = (DataTable)ViewState["GRIDROW"];
        Label lblDocCatID = null, lblPrdcDocsId = null;
        DataRow dr = null;
        try
        {
            foreach (GridViewRow row in grvPRDDCDocuments.Rows)
            {
                if (strMode != "M")
                {
                    lblDocCatID = (Label)row.FindControl("lblDocCatID");
                    if (lblDocCatID.Text != String.Empty)
                        dr = dtUpdate.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
                }
                else
                {
                    lblPrdcDocsId = (Label)row.FindControl("lblPRDDC_Documents_ID");
                    if (lblPrdcDocsId.Text != String.Empty)
                        dr = dtUpdate.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
                }
                if (dr != null)
                {
                    if (strMode != "M" ? (dr["Doc_Cat_ID"].ToString() == lblDocCatID.Text) : (dr["PRDDC_Documents_ID"].ToString() == lblPrdcDocsId.Text))
                    {
                        ((DropDownList)row.FindControl("ddlPgmID")).SelectedValue = dr["Program_ID"].ToString() != null ? dr["Program_ID"].ToString() : "";
                        ((Label)row.FindControl("lblDocCatID")).Text = dr["Doc_Cat_ID"].ToString().Trim();
                        ((CheckBox)row.FindControl("chkOptMan")).Checked = dr["Doc_Cat_OptMan"].ToString() == "1" ? true : false;
                        ((CheckBox)row.FindControl("chkCheckList")).Checked = dr["Doc_Cat_CheckList"].ToString() == "1" ? true : false;
                        ((CheckBox)row.FindControl("chkImageCopy")).Checked = dr["Doc_Cat_ImageCopy"].ToString() == "1" ? true : false;
                        ((TextBox)row.FindControl("txtRemarks")).Text = dr["Remarks"].ToString().Replace("'", "\"").Replace(">", "").Replace("<", "").Replace("&", "");
                        ((Label)row.FindControl("lblPriorityTypeCode")).Text = dr["LOOKUP_CODE"].ToString().Trim();
                        ((Label)row.FindControl("lblDisplayOrder")).Text = dr["Display_Order"].ToString().Trim();
                        ((TextBox)row.FindControl("txtRemarks")).Text = dr["Remarks"].ToString().Trim();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void FunPriGetCopyProfileDetails(object sender, EventArgs e)
    {
        //Modified based on the Test case AH_006
        try
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow gvRow = null;
            if (chk != null) gvRow = (GridViewRow)chk.Parent.Parent;

            if (chk.Checked && gvRow != null)
            {
                intPRDDCID = Convert.ToInt32(((Label)gvRow.FindControl("lblPRDDCID")).Text);
                ddlLOB.Attributes.Add("LOB_ID", ((Label)gvRow.FindControl("lblLOBID")).Text);
                ddlProductCode.Attributes.Add("Product_ID", ((Label)gvRow.FindControl("lblProductID")).Text);
                hdnPRDDC.Value = intPRDDCID.ToString();
                ViewState["CopyProfile"] = "COPY";
            }

            if (chk.Checked)
            {
                FunGetPRDDCGridDetails();
                //modifyPRDDCDetails();
            }

            if (chk.Checked)
            {
                foreach (GridViewRow grv in grvPRDDCDocuments.Rows)
                {
                    Button lnkRemovePRDDC = (Button)grv.FindControl("lnkRemovePRDDC");
                    if (chk.Checked) lnkRemovePRDDC.Visible = false; //lnkRemovePRDDC.Enabled = false;
                }
                grvPRDDCDocuments.FooterRow.Visible = false;
                grvPRDDCDocuments.Columns[grvPRDDCDocuments.Columns.Count - 1].Visible = false;
                foreach (GridViewRow grv in grvPRDDC.Rows)
                {
                    CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
                    if (chkSel != null)
                    {
                        String strPRDDCID = ((Label)grv.FindControl("lblPRDDCID")).Text;
                        if (hdnPRDDC.Value != strPRDDCID)
                            chkSel.Checked = false;
                    }
                }
            }
            else
            {
                grvPRDDCDocuments.Columns[grvPRDDCDocuments.Columns.Count - 1].Visible = true;
                if (hdnPRDDC.Value == ((Label)gvRow.FindControl("lblPRDDCID")).Text)
                {
                    DataTable dt = (DataTable)ViewState["GRIDROW"];
                    dt.Rows.Clear();
                    DummyRow();
                    foreach (GridViewRow grv in grvPRDDC.Rows)
                    {
                        CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
                        chkSel.Checked = false;
                    }
                    hdnPRDDC.Value = String.Empty;
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    private void FunPriGeneratePRDDCDocDet()
    {
        try
        {
            string strCatID = string.Empty;
            string strOptMan = string.Empty;
            string strCheckList = string.Empty;
            string strImageCopy = string.Empty;
            string strRemarks = string.Empty;
            string strPriorityType = string.Empty;
            string strDisplayOrder = string.Empty;
            string strdoc_category = string.Empty;

            //CheckBox chkPRDDCDoc = null;
            //DropDownList ddlPgmID = null;
            String strProgramID = null;
            strbPRDDCDocumentsDet.Append("<Root>");

            DataTable dtsave = (DataTable)ViewState["GRIDROW"];

            foreach (DataRow dr in dtsave.Rows)
            {
                //ddlPgmID = ((DropDownList)grvPRDDCDoc.FindControl("ddlPgmID"));
                //strCatID = ((Label)grvPRDDCDoc.FindControl("lblDocCatID")).Text.Trim();
                //strOptMan = ((CheckBox)grvPRDDCDoc.FindControl("chkOptMan")).Checked == true ? "1" : "0";
                //strCheckList = ((CheckBox)grvPRDDCDoc.FindControl("chkCheckList")).Checked == true ? "1" : "0";
                ////if (strOptMan == "1")
                //strImageCopy = ((CheckBox)grvPRDDCDoc.FindControl("chkImageCopy")).Checked == true ? "1" : "0";
                ////else
                ////    strImageCopy = "0";
                //strRemarks = ((TextBox)grvPRDDCDoc.FindControl("txtRemarks")).Text.Replace("'", "\"").Replace(">", "").Replace("<", "").Replace("&", "");
                //strPriorityType = ((Label)grvPRDDCDoc.FindControl("lblPriorityTypeCode")).Text.Trim();
                //strDisplayOrder = ((Label)grvPRDDCDoc.FindControl("lblDisplayOrder")).Text.Trim();


                strProgramID = dr["Program_ID"].ToString();
                strCatID = dr["Doc_Cat_ID"].ToString().Trim();
                strOptMan = dr["Doc_Cat_OptMan"].ToString();
                if (strOptMan.ToUpper() == "TRUE" || strOptMan=="1")
                    strOptMan = "1";
                else
                    strOptMan = "0";

                strCheckList = dr["Doc_Cat_CheckList"].ToString();
                if (strCheckList.ToUpper() == "TRUE" || strCheckList == "1")
                    strCheckList = "1";
                else
                    strCheckList = "0";

                strImageCopy = dr["Doc_Cat_ImageCopy"].ToString();
                if (strImageCopy.ToUpper() == "TRUE" || strImageCopy == "1")
                    strImageCopy = "1";
                else
                    strImageCopy = "0"; 

                strRemarks = dr["Remarks"].ToString().Replace("'", "\"").Replace(">", "").Replace("<", "").Replace("&", "");
                strPriorityType = dr["LOOKUP_CODE"].ToString().Trim();
                strDisplayOrder = dr["Display_Order"].ToString().Trim();
                strdoc_category = dr["doc_category"].ToString().Trim();

                strbPRDDCDocumentsDet.Append(" <Details Doc_Cat_ID='" + strCatID + "' Doc_Cat_OptMan='" + strOptMan + "' Check_List='" + strCheckList + "' ");
                strbPRDDCDocumentsDet.Append(" Doc_Cat_ImageCopy='" + strImageCopy + "' Program_ID='" + strProgramID +
                    "' Priority_Type='" + strPriorityType + "' Display_Order='" + strDisplayOrder + "' Doc_Cat_Remarks='" + strRemarks + "' Doc_Cat_Type='" + strdoc_category + "'/> ");
            }
            strbPRDDCDocumentsDet.Append("</Root>");
            strXMLPRDDCDocumentsDet = strbPRDDCDocumentsDet.ToString();
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    //This is used to implement User Authorization

    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);

                    if (!bCreate)
                    {
                        // btnSaveDocType.Enabled = false;
                        //grvPRDDCDocuments.FooterRow.Visible = false;
                        //btnSave.Enabled = false;
                        btnSave.Attributes.Add("disabled", "disabled");
                        btnSave.Attributes.Add("class", "css_btn_disabled");  // enab

                    }
                    break;

                case 1: // Modify Mode

                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);

                    if (!bModify)
                    {
                        //btnSaveDocType.Enabled = false;

                        //btnSave.Enabled = false;
                        btnSave.Attributes.Add("disabled", "disabled");
                        btnSave.Attributes.Add("class", "css_btn_disabled");  // enab
                    }
                    //grvPRDDCDocuments.FooterRow.Visible = false;
                    lnkCopyProfile.Visible = false;
                    btnGo.Visible = false;
                    ddlLOB.Enabled = false;
                    ddlProductCode.Enabled = false;
                    pnlConstitution.Enabled = pnlOcupation.Enabled = pnlContractType.Enabled = false;
                    //ddlConstitution.Enabled = false;
                    txtScanPath.ReadOnly = true;
                    //btnClear.Enabled = false;
                    btnClear.Attributes.Add("disabled", "disabled");
                    btnClear.Attributes.Add("class", "css_btn_disabled");  // enab
                    divPRDDC.Style.Add("display", "block");
                    divPRDDC.Visible = ucCustomPaging.Visible = true;
                    break;

                case -1:// Query Mode

                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPage, false);
                    }
                    divPRDDC.Style.Add("display", "block");
                    divPRDDC.Visible = ucCustomPaging.Visible = true;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    //lnkAddOtherDoc.Visible = false;
                    grvPRDDCDocuments.FooterRow.Visible = false;
                    grvPRDDCDocuments.Columns[grvPRDDCDocuments.Columns.Count - 1].Visible = false;
                    lnkCopyProfile.Visible = false;
                    txtScanPath.ReadOnly = true;
                    ddlProductCode.Enabled = false;
                    ddlLOB.Enabled = false;
                    // panCategoryType.Visible = false;
                    if (bClearList)
                    {
                        ddlLOB.ClearDropDownList();
                        if (ddlProductCode.SelectedValue != string.Empty)
                            ddlProductCode.ClearDropDownList();
                        //ddlConstitution.ClearDropDownList();
                    }
                    //btnClear.Enabled = false;
                    btnClear.Attributes.Add("disabled", "disabled");
                    btnClear.Attributes.Add("class", "css_btn_disabled");  // enab
                    //btnSave.Enabled = false;
                    btnSave.Attributes.Add("disabled", "disabled");
                    btnSave.Attributes.Add("class", "css_btn_disabled");  // enab
                    btnGo.Visible = false;
                    pnlConstitution.Enabled = pnlOcupation.Enabled = pnlContractType.Enabled = false;
                    fnGridPRDDC_CtrlDisable();
                    break;
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    private void fnGridPRDDC_CtrlDisable()
    {
        try
        {
            foreach (GridViewRow grv in grvPRDDCDocuments.Rows)
            {
                TextBox txtRemarks = (TextBox)grv.FindControl("txtRemarks");
                CheckBox chkOptMan = (CheckBox)grv.FindControl("chkOptMan");
                CheckBox chkImageCopy = (CheckBox)grv.FindControl("chkImageCopy");
                CheckBox chkCheckList = (CheckBox)grv.FindControl("chkCheckList");
                DropDownList ddlPgmID = (DropDownList)grv.FindControl("ddlPgmID");
                //CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
                Button lnkRemovePRDDC = (Button)grv.FindControl("lnkRemovePRDDC");
                lnkRemovePRDDC.Enabled = chkOptMan.Enabled = chkImageCopy.Enabled = false;
                txtRemarks.ReadOnly = true;
                chkCheckList.Enabled = false;

                if (bClearList)
                {
                    ddlPgmID.ClearDropDownList();
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }


    //Code end

    #endregion


    private string GenerateConstGridtoString()
    {
        string strConstitution = string.Empty;
        if (GrvConstitution.Rows.Count > 0)
        {

            strConstitution = "<Root>";
            int i;
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("CONSTITUTION_ID", typeof(string)));

            for (i = 0; i < GrvConstitution.Rows.Count; i++)
            {
                if (i < GrvConstitution.Rows.Count)
                {
                    Label lbl = (Label)GrvConstitution.Rows[i].FindControl("lblConstitution_Id");
                    CheckBox chk = (CheckBox)GrvConstitution.Rows[i].FindControl("chkSelect");
                    if (lbl != null && chk != null)
                    {
                        if (chk.Checked)
                        {
                            dt.Rows.Add(lbl.Text);
                        }
                    }
                }
                else
                {
                    strConstitution = strConstitution + "";
                }
            }

            var values = dt.AsEnumerable().Select(x => x.Field<string>("Constitution_Id")).ToArray();
            strConstitution = string.Join(",", values);

        }
        return strConstitution;
    }
    private string GenerateOccuGridtoString()
    {
        string strConstitution = string.Empty;
        if (grvOcupation.Rows.Count > 0)
        {

            strConstitution = "<Root>";
            int i;
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("LOOKUP_CODE", typeof(string)));

            for (i = 0; i < grvOcupation.Rows.Count; i++)
            {
                if (i < grvOcupation.Rows.Count)
                {
                    Label lbl = (Label)grvOcupation.Rows[i].FindControl("lblOcupation_Id");
                    CheckBox chk = (CheckBox)grvOcupation.Rows[i].FindControl("chkSelectOc");
                    if (lbl != null && chk != null)
                    {
                        if (chk.Checked)
                        {
                            dt.Rows.Add(lbl.Text);
                        }
                    }
                }
                else
                {
                    strConstitution = strConstitution + "";
                }
            }

            var values = dt.AsEnumerable().Select(x => x.Field<string>("LOOKUP_CODE")).ToArray();
            strConstitution = string.Join(",", values);

        }
        else
        {
            strConstitution = "<Root></Root>";
        }
        if (Convert.ToString(strConstitution).Trim() == string.Empty)
        {
            strConstitution = "<Root></Root>";
        }
        return strConstitution;
    }

    private string GenerateContracTypGridtoString()
    {
        string strContractType = string.Empty;
        if (grvContractType.Rows.Count > 0)
        {
            strContractType = "<Root>";
            int i;
            DataTable dt = new DataTable();

            dt.Columns.Add(new DataColumn("LOOKUP_CODE", typeof(string)));

            for (i = 0; i < grvContractType.Rows.Count; i++)
            {
                if (i < grvContractType.Rows.Count)
                {
                    Label lbl = (Label)grvContractType.Rows[i].FindControl("lblContract_Type_Id");
                    CheckBox chk = (CheckBox)grvContractType.Rows[i].FindControl("chkSelectCT");
                    if (lbl != null && chk != null)
                    {
                        if (chk.Checked)
                        {
                            dt.Rows.Add(lbl.Text);
                        }
                    }
                }
                else
                {
                    strContractType = strContractType + "";
                }
            }

            var values = dt.AsEnumerable().Select(x => x.Field<string>("LOOKUP_CODE")).ToArray();
            strContractType = string.Join(",", values);

        }
        return strContractType;
    }

    protected void btnGo_Click(object sender, EventArgs e)
    {
        divPRDDC.Visible = false;
        grvPRDDCDocuments.Columns[grvPRDDCDocuments.Columns.Count - 1].Visible = true;
        if (ddlLOB.SelectedIndex == 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert16", "alert('Select the LOB');", true);
            return;
        }
        //if (ddlConstitution.SelectedIndex == 0)
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert17", "alert('Select the Constitution');", true);
        //    return;
        //}


        int rowCountCheck = 0;
        if (GrvConstitution.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in GrvConstitution.Rows)
            {
                CheckBox chkVal = ((CheckBox)grvData.FindControl("chkSelect"));
                if (chkVal.Checked)
                {
                    rowCountCheck = 1;
                    break;
                }
            }
        }
        if (rowCountCheck == 0)
        {
            Utility.FunShowAlertMsg(this, "Select atleast one Constitution");
            return;
        }
        rowCountCheck = 0;
        if (GrvConstitution.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in grvOcupation.Rows)
            {
                CheckBox chkVal = ((CheckBox)grvData.FindControl("chkSelectOc"));
                if (chkVal.Checked)
                {
                    rowCountCheck = 1;
                    break;
                }
            }
        }
        if (rowCountCheck == 0)
        {
            if (hvOccGrdFlag.Value != "Y")
            {
                Utility.FunShowAlertMsg(this, "Select atleast one Occupation");
                return;
            }
        }
        rowCountCheck = 0;
        if (grvContractType.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in grvContractType.Rows)
            {
                CheckBox chkVal = ((CheckBox)grvData.FindControl("chkSelectCT"));
                if (chkVal.Checked)
                {
                    rowCountCheck = 1;
                    break;
                }
            }
        }
        if (rowCountCheck == 0)
        {
            Utility.FunShowAlertMsg(this, "Select atleast one Contract Type");
            return;
        }

        DataTable dtPRDDC = new DataTable();
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        try
        {
            ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
            PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRows;
            ObjPRDDCRows = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();

            ObjPRDDCRows.Company_ID = intCompanyID;
            ObjPRDDCRows.LOB_ID = Convert.ToInt16(ddlLOB.SelectedValue);
            ObjPRDDCRows.Constitution_ID = GenerateConstGridtoString();
            ObjPRDDCRows.Occupation = GenerateOccuGridtoString();
            ObjPRDDCRows.ContractType = GenerateContracTypGridtoString();
            if (Convert.ToInt16(ddlProductCode.SelectedValue) > 0)
            {
                ObjPRDDCRows.Product_ID = Convert.ToInt16(ddlProductCode.SelectedValue);
            }
            else
                ObjPRDDCRows.Product_ID = 0;
            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRows);

            byte[] bytePRDDCDetails = ObjPRDDCMasterClient.FunPubQueryPRDDCMasterCombi(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));
            dtPRDDC = (DataTable)ClsPubSerialize.DeSerialize(bytePRDDCDetails, SerializationMode.Binary, typeof(DataTable));
            if (dtPRDDC.Rows.Count > 0)
            {
                if (dtPRDDC.Rows[0]["CNT"].ToString() != "0")//) '0' means selected combination not exist
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert18", "alert('Selected combination already exist');", true);
                    return;
                }
                else
                {
                    //lnkCopyProfile.Enabled = true;
                    lnkCopyProfile.Attributes.Remove("disabled");
                    lnkCopyProfile.Attributes.Add("class", "css_btn_enabled");  // enab

                    divPRDDC.Style.Add("display", "block");
                    divPRDDC.Visible = ucCustomPaging.Visible = true;
                    //btnGo.Enabled = false;
                    btnGo.Attributes.Add("disabled", "disabled");
                    btnGo.Attributes.Add("class", "css_btn_disabled");  // enab

                    //btnSave.Visible = btnClear.Visible = true;
                    btnSave.Enabled_True();

                    ViewState["CopyProfile"] = "NEW";

                    DataTable dt = (DataTable)ViewState["GRIDROW"];
                    if (dt.Rows.Count > 0)
                        dt.Rows.Clear();
                    DummyRow();
                    foreach (GridViewRow grv in grvPRDDC.Rows)
                    {
                        CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
                        chkSel.Checked = false;
                    }
                    hdnPRDDC.Value = String.Empty;
                }
            }
            btnGo.Focus();//Added by Suseela
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
        finally
        {
            dtPRDDC.Dispose();
            dtPRDDC = null;
            ObjPRDDCMasterClient.Close();
        }
    }

    protected void ddlConstitution_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClearPRDDCGrid();
        ddlConstitution.AddItemToolTip();
        ddlConstitution.ToolTip = ddlConstitution.SelectedItem.Text.Trim();
        ddlConstitution.Focus();//Added by Suseela
    }

    private void DummyRow()
    {
        try
        {
            DataRow dr;
            DataTable dtGrid;

            if (ViewState["GRIDROW"] == null)
            {
                dtGrid = new DataTable();

                DataColumn dcPRDDCType = new DataColumn("PRDDCType");
                dtGrid.Columns.Add(dcPRDDCType);

                DataColumn dcPRDDCDesc = new DataColumn("PRDDCDesc");
                dtGrid.Columns.Add(dcPRDDCDesc);

                DataColumn dcDoc_Cat_OptMan = new DataColumn("Doc_Cat_OptMan");
                dcDoc_Cat_OptMan.DataType = System.Type.GetType("System.Boolean");
                dtGrid.Columns.Add(dcDoc_Cat_OptMan);

                DataColumn dcDoc_Cat_ID = new DataColumn("Doc_Cat_ID");
                dtGrid.Columns.Add(dcDoc_Cat_ID);

                DataColumn dcDoc_Cat_IDAssigned = new DataColumn("Doc_Cat_IDAssigned");
                dtGrid.Columns.Add(dcDoc_Cat_IDAssigned);

                DataColumn dcDoc_Cat_ImageCopy = new DataColumn("Doc_Cat_ImageCopy");
                dcDoc_Cat_ImageCopy.DataType = System.Type.GetType("System.Boolean");
                dtGrid.Columns.Add(dcDoc_Cat_ImageCopy);

                DataColumn dcProgram_ID = new DataColumn("Program_ID");
                dtGrid.Columns.Add(dcProgram_ID);

                DataColumn dcRemarks = new DataColumn("Remarks");
                dtGrid.Columns.Add(dcRemarks);

                DataColumn dcLookup_Code = new DataColumn("LOOKUP_CODE");
                dtGrid.Columns.Add(dcLookup_Code);

                DataColumn dcDescription = new DataColumn("Description");
                dtGrid.Columns.Add(dcDescription);

                DataColumn dcDisplay_Order = new DataColumn("Display_Order");
                dtGrid.Columns.Add(dcDisplay_Order);

                DataColumn dcDoc_Cat_CheckList = new DataColumn("Doc_Cat_CheckList");
                dcDoc_Cat_CheckList.DataType = System.Type.GetType("System.Boolean");
                dtGrid.Columns.Add(dcDoc_Cat_CheckList);

                DataColumn dcPRDDC_Documents_ID = new DataColumn("PRDDC_Documents_ID");
                dtGrid.Columns.Add(dcPRDDC_Documents_ID);

                //Added By Sathish R-15-Apr-2019 for MFC Change Start
                DataColumn doc_category = new DataColumn("doc_category");
                doc_category.DataType = System.Type.GetType("System.Int32");
                dtGrid.Columns.Add(doc_category);

                DataColumn DOC_CATEGORY_DESC = new DataColumn("DOC_CATEGORY_DESC");
                dtGrid.Columns.Add(DOC_CATEGORY_DESC);

                //Added By Sathish R-15-Apr-2019 for MFC Change Start
            }
            else
            {
                dtGrid = (DataTable)ViewState["GRIDROW"];
            }
            dr = dtGrid.NewRow();

            dr["PRDDCType"] = "";
            dr["PRDDCDesc"] = "";
            dr["Doc_Cat_OptMan"] = false;
            dr["Doc_Cat_ID"] = "0";
            dr["Doc_Cat_IDAssigned"] = "0";
            dr["Doc_Cat_ImageCopy"] = false;
            dr["Program_ID"] = "0";
            dr["Remarks"] = "";
            dr["Description"] = "";
            dr["LOOKUP_CODE"] = 0;
            dr["Display_Order"] = 0;
            dr["Doc_Cat_CheckList"] = false;
            dr["PRDDC_Documents_ID"] = 0;

            dr["doc_category"] = 0;
            dr["DOC_CATEGORY_DESC"] = "";

            dtGrid.Rows.Add(dr);
            grvPRDDCDocuments.DataSource = dtGrid;
            grvPRDDCDocuments.DataBind();
            ViewState["GRIDROW"] = dtGrid;
            grvPRDDCDocuments.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    protected void txtPRDDCDesc_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (System.Web.HttpContext.Current.Session["dsPRDDCDesc"] != null)
            {
                DataTable dt = (DataTable)System.Web.HttpContext.Current.Session["dsPRDDCDesc"];
                if (dt.Rows.Count > 0)
                {
                    string filterExpression = "PRDDC_Doc_Description = '" + txtPRDDCDesc.Text + "'";
                    DataRow[] dtSuggestions = dt.Select(filterExpression);
                    if (dtSuggestions.Length > 0)
                    {
                        ViewState["DocID"] = dtSuggestions[0]["PRDDC_Doc_Cat_ID"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    [System.Web.Services.WebMethod]
    public static string[] getPRDDCDescription(String prefixText, int count)
    {
        List<String> suggetions = null;
        DataTable dtDesc = new DataTable();
        try
        {
            if (System.Web.HttpContext.Current.Session["dsPRDDCDesc"] != null)
            {
                dtDesc = (DataTable)System.Web.HttpContext.Current.Session["dsPRDDCDesc"];
                suggetions = GetDescription(prefixText, count, dtDesc);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return suggetions.ToArray();
    }

    private static List<String> GetDescription(string key, int count, DataTable dt1)
    {
        List<String> suggestions = new List<string>();
        try
        {
            string filterExpression = "PRDDC_Doc_Description like '" + key + "%'";
            DataRow[] dtSuggestions = dt1.Select(filterExpression);
            foreach (DataRow dr in dtSuggestions)
            {
                string suggestion = dr["PRDDC_Doc_Description"].ToString();
                suggestions.Add(suggestion);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
        return suggestions;
    }

    protected void ddlPRDDCType_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ViewState["DocID"] = "";
            DropDownList ddlPRDDCType = (DropDownList)sender;
            DropDownList ddlPRDDCDesc = (DropDownList)ddlPRDDCType.Parent.Parent.FindControl("ddlPRDDCDesc");
            TextBox txtPRDDCDesc = (TextBox)ddlPRDDCType.Parent.Parent.FindControl("txtPRDDCDesc");

            txtPRDDCDesc.Text = "--Select--";
            if (ddlPRDDCType.SelectedValue != "0")
            {
                Procparam = new Dictionary<string, string>();
                if (ddlPRDDCType.SelectedValue != "Others")
                    Procparam.Add("@PRDDC_Doc_Type", ddlPRDDCType.SelectedValue.Split('-')[0].ToString());
                else
                    Procparam.Add("@PRDDC_Doc_Type", ddlPRDDCType.SelectedValue);

                DataSet dsPRDDCDesc = Utility.GetTableValues(SPNames.S3G_ORG_GetPRDDC_DocumentCategory, Procparam);

                System.Web.HttpContext.Current.Session["dsPRDDCDesc"] = dsPRDDCDesc.Tables[2];
                txtPRDDCDesc.Enabled = false;
                if (ddlPRDDCType.SelectedValue.ToUpper().Trim() == "OTHERS")
                {
                    txtPRDDCDesc.Enabled = true;
                    ddlPRDDCDesc.Focus();
                }
                else
                {
                    //Changed By Thangam M on 02/Dec/2011

                    DataRow[] dr;
                    if (ddlPRDDCType.SelectedValue != "Others")
                        dr = dsPRDDCDesc.Tables[0].Select("PRDDC_Doc_Type = '" + ddlPRDDCType.SelectedValue.Split('-')[0].ToString() + "' ");
                    else
                        dr = dsPRDDCDesc.Tables[0].Select("PRDDC_Doc_Type + ' - ' + PDDC_Doc_Description = '" + ddlPRDDCType.SelectedValue + "' ");

                    if (dr != null && dr.Count() > 0)
                    {
                        txtPRDDCDesc.Text = dr[0]["PRDDC_Doc_Description"].ToString();
                        ViewState["DocID"] = dr[0]["PRDDC_Doc_Cat_ID"].ToString();
                    }
                }
            }
            ddlPRDDCType.AddItemToolTip();
            ddlPRDDCType.ToolTip = ddlPRDDCType.SelectedItem.Text;
            ddlPRDDCDesc.AddItemToolTip();
            if (ddlPRDDCDesc.Items.Count > 0)
            {
                ddlPRDDCDesc.ToolTip = ddlPRDDCDesc.SelectedItem.Text;
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    protected void lnkRemovePRDDC_Click(object sender, EventArgs e)
    {
        DataRow[] rows;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            //dt.Rows.Clear();

            //foreach (GridViewRow grv in grvPRDDCDocuments.Rows)
            //{
            //    if (grv.Visible)
            //    {
            //        CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
            //        CheckBox chkOptMan = (CheckBox)grv.FindControl("chkOptMan");
            //        CheckBox chkImageCopy = (CheckBox)grv.FindControl("chkImageCopy");
            //        DropDownList ddlPgmID = (DropDownList)grv.FindControl("ddlPgmID");
            //        TextBox txtRemarks = (TextBox)grv.FindControl("txtRemarks");
            //        Label lblPRDDCType = (Label)grv.FindControl("lblPRDDCType");
            //        Label lblPRDDCDesc = (Label)grv.FindControl("lblPRDDCDesc");
            //        Label lblDocCatID = (Label)grv.FindControl("lblDocCatID");
            //        Label lblPriorityType = (Label)grv.FindControl("lblPriorityType");
            //        Label lblPriorityTypeCode = (Label)grv.FindControl("lblPriorityTypeCode");
            //        Label lblDisplayOrder = (Label)grv.FindControl("lblDisplayOrder");

            //        DataRow dr = dt.NewRow();
            //        dr["PRDDCType"] = lblPRDDCType.Text.Trim();
            //        dr["PRDDCDesc"] = lblPRDDCDesc.Text.Trim();
            //        dr["Doc_Cat_OptMan"] = true;//chkOptMan.Checked ? true : false;
            //        dr["Doc_Cat_ID"] = lblDocCatID.Text.Trim();
            //        dr["Doc_Cat_IDAssigned"] = "1";
            //        dr["Doc_Cat_ImageCopy"] = chkImageCopy.Checked ? true : false;
            //        dr["Program_ID"] = ddlPgmID.SelectedValue;
            //        dr["Remarks"] = txtRemarks.Text.Trim();
            //        dr["Description"] = lblPriorityType.Text.Trim();
            //        dr["LOOKUP_CODE"] = lblPriorityTypeCode.Text.Trim();
            //        dr["Display_Order"] = lblDisplayOrder.Text.Trim();
            //        dt.Rows.Add(dr);
            //    }
            //}

            Button lnkRemovePRDDC = (Button)sender;
            GridViewRow gvRow = (GridViewRow)lnkRemovePRDDC.Parent.Parent;
            dt = (DataTable)ViewState["GRIDROW"];
            if (strMode != "M")
            {
                Label lblDocCatID = (Label)gvRow.FindControl("lblDocCatID");
                rows = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text);
            }
            else
            {
                Label lblPrdcDocsId = (Label)gvRow.FindControl("lblPRDDC_Documents_ID");
                rows = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text);
            }
            
            foreach (DataRow row in rows)
                dt.Rows.Remove(row);
            dt.AcceptChanges();

            ViewState["GRIDROW"] = dt;
            
            grvPRDDCDocuments.DataSource = dt;
            grvPRDDCDocuments.DataBind();

            bindGridPaging(dt.Rows.Count);
            if (dt.Rows.Count == 0)
                DummyRow();
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    protected void lnkAAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Button lnkAAdd = (Button)sender;
            DropDownList ddlPRDDCType = (DropDownList)lnkAAdd.Parent.Parent.FindControl("ddlPRDDCType");
            DropDownList ddlPRDDCDesc = (DropDownList)lnkAAdd.Parent.Parent.FindControl("ddlPRDDCDesc");
            TextBox txtPRDDCDesc = (TextBox)lnkAAdd.Parent.Parent.FindControl("txtPRDDCDesc");
            CheckBox chkFootOptMan = (CheckBox)lnkAAdd.Parent.Parent.FindControl("chkFootOptMan");
            CheckBox chkCheckListF = (CheckBox)lnkAAdd.Parent.Parent.FindControl("chkCheckListF");
            CheckBox chkScan = (CheckBox)lnkAAdd.Parent.Parent.FindControl("chkScan");
            DropDownList ddlFooterPgmID = (DropDownList)lnkAAdd.Parent.Parent.FindControl("ddlFooterPgmID");
            TextBox txtFooterRemarks = (TextBox)lnkAAdd.Parent.Parent.FindControl("txtFooterRemarks");
            DropDownList ddlPriorityType = (DropDownList)lnkAAdd.Parent.Parent.FindControl("ddlPriorityType");
            TextBox txtFooterDispOrdr = (TextBox)lnkAAdd.Parent.Parent.FindControl("txtFooterDispOrdr");

            DropDownList ddlDocCategory = (DropDownList)lnkAAdd.Parent.Parent.FindControl("ddlDocCategory");


            if (ddlDocCategory.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select the Doc Category");
                ddlDocCategory.Focus();
                return;
            }

            if (ddlPriorityType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select the Priority Type");
                ddlPriorityType.Focus();
                return;
            }
            if (txtFooterDispOrdr.Text.Length == 0)
            {
                Utility.FunShowAlertMsg(this.Page, "Enter the Display Order");
                txtFooterDispOrdr.Focus();
                return;
            }
            if (ddlPRDDCType.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select the PRDDC Type");
                ddlPRDDCType.Focus();
                return;
            }
            if (txtPRDDCDesc.Text.Trim() == "" || txtPRDDCDesc.Text.Trim().ToUpper() == "--SELECT--")
            {
                Utility.FunShowAlertMsg(this.Page, "Enter the PRDDC other document description.");
                txtPRDDCDesc.Focus();
                return;
            }
            if (ddlFooterPgmID.SelectedValue == "0")
            {
                Utility.FunShowAlertMsg(this.Page, "Select the Last Program ID");
                ddlPRDDCType.Focus();
                return;
            }
            if (ddlPRDDCType.SelectedItem.Text.Trim().ToUpper() == "OTHERS" && ViewState["DocID"].ToString() == "")
            {
                PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
                PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
                ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();

                try
                {
                    ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();
                    ObjPRDDCRow.DocCategory = "";
                    ObjPRDDCRow.DocType = "PRDDC";
                    ObjPRDDCRow.DocDesc = txtPRDDCDesc.Text.Trim();
                    ObjPRDDCRow.Created_By = intUserID;

                    ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

                    intErrCode = ObjPRDDCMasterClient.FunPubCreateOtherDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));

                    if (intErrCode != -1)
                    {
                        Utility.FunShowAlertMsg(this.Page, "PRDDC other document details added successfully");
                        ViewState["DocID"] = intErrCode.ToString();
                        if (Request.QueryString["qsPRDDCId"] != null)
                            intPRDDCID = Convert.ToInt32(Request.QueryString["qsPRDDCId"]);
                    }
                    else if (intErrCode == -1)
                    {
                        Utility.FunShowAlertMsg(this.Page, "PRDDC other document details already exist in data base.");
                    }
                    //else if (intErrCode == 2)
                    //{
                    //    Utility.FunShowAlertMsg(this.Page, "Document sequence number is not defined to create PRDDC Code");
                    //}
                    lblErrorMessage.Text = string.Empty;

                }
                catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
                {
                    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = ex.Message;
                    ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
                }
                finally
                {
                    ObjPRDDCMasterClient.Close();
                }
            }

            foreach (GridViewRow grv in grvPRDDCDocuments.Rows)
            {
                if (grv.Visible)
                {
                    Label lblDocCatID = (Label)grv.FindControl("lblDocCatID");
                    Label lblPRDDCDesc = (Label)grv.FindControl("lblPRDDCDesc");
                    //Label lblDisplayOrder = (Label)grv.FindControl("lblDisplayOrder");
                    if (ddlPRDDCType.SelectedItem.Text.Trim().ToUpper() != "OTHERS" && lblDocCatID.Text.Trim() == ViewState["DocID"].ToString())
                    {
                        Utility.FunShowAlertMsg(this.Page, "Selected PRDDC Type already exists in the grid.");
                        return;
                    }
                    if (ddlPRDDCType.SelectedItem.Text.Trim().ToUpper() == "OTHERS")
                    {
                        if (txtPRDDCDesc.Text.Trim().ToLower() == lblPRDDCDesc.Text.Trim().ToLower())
                        {
                            Utility.FunShowAlertMsg(this.Page, "Selected PRDDC Type & Description already exists in the grid.");
                            return;
                        }
                    }
                    //if (txtFooterDispOrdr.Text == lblDisplayOrder.Text)
                    //{
                    //    txtFooterDispOrdr.Focus();
                    //    Utility.FunShowAlertMsg(this.Page, "Entered Display order already exists in the grid.");
                    //    return;
                    //}
                }
            }


            DataTable dt = (DataTable)ViewState["GRIDROW"];
            //dt.Rows.Clear();

            //foreach (GridViewRow grv in grvPRDDCDocuments.Rows)
            //{
            //    if (grv.Visible)
            //    {
            //        CheckBox chkSel = (CheckBox)grv.FindControl("chkSel");
            //        CheckBox chkOptMan = (CheckBox)grv.FindControl("chkOptMan");
            //        CheckBox chkCheckList = (CheckBox)grv.FindControl("chkCheckList");
            //        CheckBox chkImageCopy = (CheckBox)grv.FindControl("chkImageCopy");
            //        DropDownList ddlPgmID = (DropDownList)grv.FindControl("ddlPgmID");
            //        TextBox txtRemarks = (TextBox)grv.FindControl("txtRemarks");
            //        Label lblPRDDCType = (Label)grv.FindControl("lblPRDDCType");
            //        Label lblPRDDCDesc = (Label)grv.FindControl("lblPRDDCDesc");
            //        Label lblDocCatID = (Label)grv.FindControl("lblDocCatID");
            //        Label lblPriorityType = (Label)grv.FindControl("lblPriorityType");
            //        Label lblPriorityTypeCode = (Label)grv.FindControl("lblPriorityTypeCode");
            //        Label lblDisplayOrder = (Label)grv.FindControl("lblDisplayOrder");

            //        DataRow dr = dt.NewRow();
            //        dr["PRDDCType"] = lblPRDDCType.Text.Trim();
            //        dr["PRDDCDesc"] = lblPRDDCDesc.Text.Trim();
            //        dr["Doc_Cat_CheckList"] = chkCheckList.Checked ? true : false;
            //        dr["Doc_Cat_OptMan"] = chkOptMan.Checked ? true : false;
            //        dr["Doc_Cat_ID"] = lblDocCatID.Text.Trim();
            //        dr["Doc_Cat_IDAssigned"] = "1";
            //        dr["Doc_Cat_ImageCopy"] = chkImageCopy.Checked ? true : false;
            //        dr["Program_ID"] = ddlPgmID.SelectedValue;
            //        dr["Remarks"] = txtRemarks.Text.Trim();
            //        dr["Description"] = lblPriorityType.Text.Trim();
            //        dr["LOOKUP_CODE"] = lblPriorityTypeCode.Text.Trim();
            //        dr["Display_Order"] = lblDisplayOrder.Text.Trim();
            //        dt.Rows.Add(dr);
            //    }
            //}

            if (ViewState["GRIDROW"] != null)
            {
                DataRow dr = dt.NewRow();

                dr["PRDDCType"] = ddlPRDDCType.SelectedValue.Trim();
                //dr["PRDDCDesc"] =  ddlPRDDCType.SelectedValue.Trim().ToUpper()=="OTHERS"? ddlPRDDCDesc.SelectedItem.Text.Trim():txtPRDDCDesc.Text.Trim(); 
                dr["PRDDCDesc"] = txtPRDDCDesc.Text.Trim();
                dr["Doc_Cat_OptMan"] = chkFootOptMan.Checked ? true : false;
                dr["Doc_Cat_CheckList"] = chkCheckListF.Checked ? true : false;
                dr["Doc_Cat_ID"] = ViewState["DocID"].ToString();
                dr["Doc_Cat_IDAssigned"] = "0";
                dr["Doc_Cat_ImageCopy"] = chkScan.Checked ? true : false;
                dr["Program_ID"] = ddlFooterPgmID.SelectedValue;
                dr["Remarks"] = txtFooterRemarks.Text.Trim();
                dr["Description"] = ddlPriorityType.SelectedItem.Text.Trim();
                dr["LOOKUP_CODE"] = ddlPriorityType.SelectedValue;
                dr["Display_Order"] = txtFooterDispOrdr.Text.Trim();

                dr["doc_category"] = ddlDocCategory.SelectedValue;
                dr["doc_category_desc"] = ddlDocCategory.SelectedItem.Text.Trim();
                

                dt.Rows.Add(dr);

                if (dt.Rows.Count > 1 && dt.Rows[0]["Doc_Cat_ID"].ToString() == "0")
                        dt.Rows.RemoveAt(0);
                    dt.AcceptChanges();
                
                grvPRDDCDocuments.DataSource = dt;
                grvPRDDCDocuments.DataBind();
                //grvPRDDCDocuments.Rows[0].Visible = false;
                bindGridPaging(dt.Rows.Count);
                ViewState["GRIDROW"] = dt;
            }
            ViewState["DocID"] = "";
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
    }

    private void modifyPRDDCDetails()
    {
        DataSet dsPRDDC = new DataSet();
        divPRDDC.Style.Add("display", "block");
        divPRDDC.Visible = true;
        ObjPRDDCMasterClient = new PRDDCMgtServicesReference.PRDDCMgtServicesClient();
        try
        {
            ObjS3G_ORG_PRDDCMasterDataTable = new PRDDCMgtServices.S3G_ORG_PRDDCMasterDataTable();
            PRDDCMgtServices.S3G_ORG_PRDDCMasterRow ObjPRDDCRow;
            ObjPRDDCRow = ObjS3G_ORG_PRDDCMasterDataTable.NewS3G_ORG_PRDDCMasterRow();

            ObjPRDDCRow.Company_ID = intCompanyID;
            ObjPRDDCRow.PRDDC_ID = intPRDDCID;
            ObjPRDDCRow.Created_By = intUserID;

            ObjS3G_ORG_PRDDCMasterDataTable.AddS3G_ORG_PRDDCMasterRow(ObjPRDDCRow);

            byte[] bytePRDDCDetails = ObjPRDDCMasterClient.FunPubQueryPRDDCDocDetails(SerMode, ClsPubSerialize.Serialize(ObjS3G_ORG_PRDDCMasterDataTable, SerMode));
            dsPRDDC = (DataSet)ClsPubSerialize.DeSerialize(bytePRDDCDetails, SerializationMode.Binary, typeof(DataSet));

            if (dsPRDDC.Tables[2] != null && dsPRDDC.Tables[2].Rows.Count > 0)
            {
                intRowCount = dsPRDDC.Tables[2].Rows.Count;
                grvPRDDCDocuments.DataSource = dsPRDDC.Tables[2];
                grvPRDDCDocuments.DataBind();
                bindGridPaging(dsPRDDC.Tables[2].Rows.Count);
            }
            //commented for bug fixing - Bug_ID - 5469 - Kuppusamy.B - 15/Feb/2012
            //if (dsPRDDC.Tables[0] != null && dsPRDDC.Tables[0].Rows.Count > 0)
            //    txtScanPath.Text = dsPRDDC.Tables[0].Rows[0]["Document_Path"].ToString();
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, lblHeading.Text);
        }
        finally
        {
            dsPRDDC.Dispose();
            dsPRDDC = null;
            ObjPRDDCMasterClient.Close();
        }
    }

    protected void ddlProductCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        ClearPRDDCGrid();
        ddlProductCode.AddItemToolTip();
        ddlProductCode.ToolTip = ddlProductCode.SelectedItem.Text.Trim();
        ddlProductCode.Focus();
    }

    private void BindDataTable(DropDownList ddlSourceControl, params string[] strBinidArgs)
    {
        string strDataTextField = "";

        try
        {
            if (ViewState["dtProgram"] != null)
            {
                DataTable ObjDataTable = (DataTable)ViewState["dtProgram"];

                if (ObjDataTable == null)
                    return;

                if (ObjDataTable.Columns["DataText"] == null)
                {
                    if (strBinidArgs.Length > 2)
                    {
                        strDataTextField = strBinidArgs[1].ToString() + "+'  -  '+" + strBinidArgs[2].ToString();
                    }
                    else
                    {
                        strDataTextField = strBinidArgs[1].ToString();
                    }

                    ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField);
                }

                ddlSourceControl.Items.Clear();
                if (ObjDataTable != null)
                {
                    if (ObjDataTable.Rows.Count > 0)
                    {
                        ddlSourceControl.DataValueField = strBinidArgs[0].ToString();
                        ddlSourceControl.DataTextField = "DataText";
                        ddlSourceControl.DataSource = ObjDataTable;
                        ddlSourceControl.DataBind();
                    }
                }
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                ddlSourceControl.Items.Insert(0, liSelect);

                //foreach (ListItem lt in ddlSourceControl.Items)
                //    lt.Attributes.Add("title", lt.Text);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            //ObjAdminService.Close();
        }
    }
    protected void chkSelect_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chkSelct = (CheckBox)sender;
            chkSelct.Focus();

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            Label lblFlagSelct = (Label)GrvConstitution.Rows[selRowIndex].FindControl("lblFlag");
            Label lblConstitution_IdSelct = (Label)GrvConstitution.Rows[selRowIndex].FindControl("lblConstitution_Id");

            if (!(String.IsNullOrEmpty(lblFlagSelct.Text)))
            {
                if (chkSelct.Checked)
                {
                    #region Checked to True
                    foreach (GridViewRow gv in GrvConstitution.Rows)
                    {
                        CheckBox cbChkSelect = (CheckBox)gv.FindControl("chkSelect");
                        Label lblFlag = (Label)gv.FindControl("lblFlag");
                        Label lblConstitution_Id = (Label)gv.FindControl("lblConstitution_Id");

                        if (lblConstitution_Id.Text != lblConstitution_IdSelct.Text)
                        {
                            if (!(String.IsNullOrEmpty(lblFlag.Text)))
                            {
                                if (lblFlagSelct.Text == "Y")
                                {
                                    if (lblFlag.Text == "Y")
                                        cbChkSelect.Enabled = true;
                                    else if (lblFlag.Text == "N")
                                        cbChkSelect.Enabled = false;
                                }
                                if (lblFlagSelct.Text == "N")
                                {
                                    if (lblFlag.Text == "N")
                                        cbChkSelect.Enabled = true;
                                    else if (lblFlag.Text == "Y")
                                        cbChkSelect.Enabled = false;
                                }
                            }
                        }
                    }
                    if (lblFlagSelct.Text == "Y")
                    {
                        hvOccGrdFlag.Value = "Y";
                        grvOcupation.Enabled = false;
                        foreach (GridViewRow gv in grvOcupation.Rows)
                        {
                            CheckBox chkSelectOc = (CheckBox)gv.FindControl("chkSelectOc");
                            chkSelectOc.Checked = false;
                        }
                    }
                    else
                    {
                        grvOcupation.Enabled = true;
                        hvOccGrdFlag.Value = "N";
                    }
                    #endregion
                }
                else
                {
                    #region Checked To False
                    foreach (GridViewRow gv in GrvConstitution.Rows)
                    {
                        CheckBox cbChkSelect = (CheckBox)gv.FindControl("chkSelect");
                        cbChkSelect.Enabled = true;
                        cbChkSelect.Checked = false;
                    }
                    grvOcupation.Enabled = true;

                    foreach (GridViewRow gv in grvOcupation.Rows)
                    {
                        CheckBox chkSelectOc = (CheckBox)gv.FindControl("chkSelectOc");
                        chkSelectOc.Checked = false;
                    }
                    hvOccGrdFlag.Value = "N";

                    #endregion
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    //Contract Type Grid - Check Box Events
    protected void chkSelectCT_CheckedChanged(object sender, EventArgs e)
    {
        int flag = 0;
        try
        {
            CheckBox chkSelctCT = (CheckBox)sender;
            chkSelctCT.Focus();

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            Label lblContract_Type_Id = (Label)grvContractType.Rows[selRowIndex].FindControl("lblContract_Type_Id");

            foreach (GridViewRow row in grvContractType.Rows)
            {
                Label lblContract_Type_IdGrid = (Label)row.FindControl("lblContract_Type_Id");
                CheckBox chkSelectCTGrid = (CheckBox)row.FindControl("chkSelectCT");

                #region FOR BOTH OPTION  - 3
                if ((lblContract_Type_Id.Text != String.Empty && lblContract_Type_Id.Text == "3")
                    && (lblContract_Type_IdGrid.Text != String.Empty && !(lblContract_Type_IdGrid.Text.Equals(lblContract_Type_Id.Text))))
                {
                    if (chkSelctCT.Checked)//3-Both
                    {
                        chkSelectCTGrid.Checked = true;
                    }
                    else //Both - Unselected
                    {
                        chkSelectCTGrid.Checked = false;
                    }
                }
                #endregion

                #region FOR OPTIONS NEW - 1 / USED - 2 [any one option get unselected ->both option also get unselected by default]
                if ((lblContract_Type_Id.Text != String.Empty && (lblContract_Type_Id.Text == "1" || lblContract_Type_Id.Text == "2"))
                    && (lblContract_Type_IdGrid.Text != String.Empty && !(lblContract_Type_IdGrid.Text.Equals(lblContract_Type_Id.Text))))
                {
                    if (!chkSelctCT.Checked)
                    {
                        if (lblContract_Type_IdGrid.Text == "3")
                            chkSelectCTGrid.Checked = false;
                    }
                }
                #endregion

                #region FOR OPTIONS NEW - 1 / USED - 2 [2 options get selected ->both option also get selected by default]

                if (lblContract_Type_Id.Text != String.Empty && lblContract_Type_IdGrid.Text != String.Empty)
                {
                    if (lblContract_Type_IdGrid.Text == "1" && chkSelectCTGrid.Checked)
                        flag = flag + 1;
                    if (lblContract_Type_IdGrid.Text == "2" && chkSelectCTGrid.Checked)
                        flag = flag + 1;

                    if (flag == 2 && chkSelctCT.Checked)
                    {
                        if (lblContract_Type_IdGrid.Text == "3")
                            chkSelectCTGrid.Checked = true;
                    }
                }
                #endregion
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    //Occupation  Grid - Check Box Events
    protected void chkSelectOc_CheckedChanged(object sender, EventArgs e)
    {
        int flag = 0;
        try
        {
            CheckBox chkSelectOc = (CheckBox)sender;
            chkSelectOc.Focus();

            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            Label lblOcupation_Id = (Label)grvOcupation.Rows[selRowIndex].FindControl("lblOcupation_Id");

            foreach (GridViewRow row in grvOcupation.Rows)
            {
                Label lblOcupation_IdGrid = (Label)row.FindControl("lblOcupation_Id");
                CheckBox chkSelectOcGrid = (CheckBox)row.FindControl("chkSelectOc");

                #region FOR BOTH OPTION  - 1

                if (lblOcupation_Id.Text != String.Empty && lblOcupation_Id.Text == "1")
                {
                    if (lblOcupation_IdGrid.Text != String.Empty && (lblOcupation_IdGrid.Text == "2" || lblOcupation_IdGrid.Text == "3"))//2-BUSINESS 3-EMPLOYED
                    {
                        if (chkSelectOc.Checked)//1-Both
                        {
                            chkSelectOcGrid.Checked = true;
                        }
                        else //Both - Unselected
                        {
                            chkSelectOcGrid.Checked = false;
                        }
                    }
                }
                #endregion

                #region FOR OPTIONS BUSINESS - 2 / EMPLOYED - 3 [any one option get unselected ->both option also get unselected by default]

                if (lblOcupation_Id.Text != String.Empty && (lblOcupation_Id.Text == "2" || lblOcupation_Id.Text == "3"))
                {
                    if (!chkSelectOc.Checked)
                    {
                        if (lblOcupation_IdGrid.Text == "1")//Both
                            chkSelectOcGrid.Checked = false;
                    }
                }
                #endregion

                #region FOR OPTIONS BUSINESS - 2 / EMPLOYED - 3 [2 options get selected ->both option also get selected by default]

                if (lblOcupation_Id.Text != String.Empty && lblOcupation_IdGrid.Text != String.Empty)
                {
                    if (lblOcupation_IdGrid.Text == "2" && chkSelectOcGrid.Checked)
                        flag = flag + 1;
                    if (lblOcupation_IdGrid.Text == "3" && chkSelectOcGrid.Checked)
                        flag = flag + 1;

                    if (flag == 2 && chkSelectOc.Checked)
                    {
                        if (lblOcupation_IdGrid.Text == "1")//Both
                            chkSelectOcGrid.Checked = true;
                    }
                }
                #endregion
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void chkOptMan_CheckedChanged(object sender, EventArgs e)
    {
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            CheckBox chkOptMan = (CheckBox)sender;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            if (strMode != "M")
            {
                lblDocCatID = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblDocCatID");
                dr = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
            }
            else
            {
                lblPrdcDocsId = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblPRDDC_Documents_ID");
                dr = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
            }
            if (dr != null)
            {
                dr["Doc_Cat_OptMan"] = chkOptMan.Checked ? true : false;
            }
            dt.AcceptChanges();
            ViewState["GRIDROW"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void chkImageCopy_CheckedChanged(object sender, EventArgs e)
    {
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            CheckBox chkImageCopy = (CheckBox)sender;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            if (strMode != "M")
            {
                lblDocCatID = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblDocCatID");
                dr = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
            }
            else
            {
                lblPrdcDocsId = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblPRDDC_Documents_ID");
                dr = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
            }
            if (dr != null)
            {
                dr["Doc_Cat_ImageCopy"] = chkImageCopy.Checked ? true : false;
            }
            dt.AcceptChanges();
            ViewState["GRIDROW"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void chkCheckList_CheckedChanged(object sender, EventArgs e)
    {
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            CheckBox chkCheckList = (CheckBox)sender;
            int selRowIndex = ((GridViewRow)(((CheckBox)sender).Parent.Parent)).RowIndex;
            if (strMode != "M")
            {
                lblDocCatID = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblDocCatID");
                dr = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
            }
            else
            {
                lblPrdcDocsId = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblPRDDC_Documents_ID");
                dr = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
            }
            if (dr != null)
            {
                dr["Doc_Cat_CheckList"] = chkCheckList.Checked ? true : false;
            }
            dt.AcceptChanges();
            ViewState["GRIDROW"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void ddlPgmID_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            DropDownList ddlPgmID = (DropDownList)sender;
            int selRowIndex = ((GridViewRow)(((DropDownList)sender).Parent.Parent)).RowIndex;
            if (strMode != "M")
            {
                lblDocCatID = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblDocCatID");
                dr = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
            }
            else
            {
                lblPrdcDocsId = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblPRDDC_Documents_ID");
                dr = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
            }
            if (dr != null)
            {
                dr["Program_ID"] = ddlPgmID.SelectedValue != null ? ddlPgmID.SelectedValue : "0";
            }
            dt.AcceptChanges();
            ViewState["GRIDROW"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void txtRemarks_TextChanged(object sender, EventArgs e)
    {
        DataRow dr = null;
        Label lblDocCatID, lblPrdcDocsId;
        try
        {
            DataTable dt = (DataTable)ViewState["GRIDROW"];
            TextBox txtRemarks = (TextBox)sender;
            int selRowIndex = ((GridViewRow)(((TextBox)sender).Parent.Parent)).RowIndex;
            if (strMode != "M")
            {
                lblDocCatID = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblDocCatID");
                dr = dt.Select("Doc_Cat_ID=" + lblDocCatID.Text).FirstOrDefault();
            }
            else
            {
                lblPrdcDocsId = (Label)grvPRDDCDocuments.Rows[selRowIndex].FindControl("lblPRDDC_Documents_ID");
                dr = dt.Select("PRDDC_Documents_ID=" + lblPrdcDocsId.Text).FirstOrDefault();
            }
            if (dr != null)
            {
                dr["Remarks"] = txtRemarks.Text != String.Empty ? txtRemarks.Text : "";
            }
            dt.AcceptChanges();
            ViewState["GRIDROW"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}



