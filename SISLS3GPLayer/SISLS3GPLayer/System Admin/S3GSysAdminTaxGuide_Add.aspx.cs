///Module Name      :   System Admin
///Screen Name      :   S3GSysAdminTaxGuide_Add.aspx
///Created By       :   Kaliraj K
///Created Date     :   27-May-2010
///Purpose          :   To insert and update Tax Guide details
///
///Created By       :   Gunasekar K
///Created Date     :   18-Oct-2010
///Purpose          :   To address the Bug - 1747

using System;
using System.ServiceModel;
using System.Web.UI;
using S3GBusEntity;
using System.Globalization;
using System.Collections.Generic;
using System.Data;
using System.Web.Security;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class S3GSysAdminTaxGuide_Add : ApplyThemeForProject
{
    #region Intialization

    AccountMgtServicesReference.AccountMgtServicesClient ObjTaxGuideMasterClient;
    AccountMgtServices.S3G_SYSAD_TaxGuideDataTable ObjS3G_SYSAD_TaxGuideDataTable = new AccountMgtServices.S3G_SYSAD_TaxGuideDataTable();
    //S3GAdminServicesReference.S3GAdminServicesClient ObjAdminServiceClient;
    string strDateFormat = string.Empty;
    Dictionary<string, string> Procparam = null;
    SerializationMode SerMode = SerializationMode.Binary;
    int intErrCode = 0;
    int intTaxCodeId = 0;
    int intUserId = 0;
    int intCompanyID = 0;
    bool bClearList = false;
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    UserInfo ObjUserInfo = null;
    DataSet dsTaxDetails = null;
    string strProcName = null;
    string strXMLTaxAssetDet = null;
    StringBuilder strbTaxAssetDet = new StringBuilder();
    DataTable dtTaxAsset = new DataTable();
    string strRedirectPage = "../System Admin/S3GSysAdminTaxGuide_View.aspx";
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminTaxGuide_Add.aspx';";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminTaxGuide_View.aspx';";
    #endregion

    #region PageLoad

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserId = ObjUserInfo.ProUserIdRW;
            S3GSession ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            CalendarExtender1.Format = strDateFormat;

            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bDelete = ObjUserInfo.ProDeleteRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;

            txtRate.Attributes.Add("onblur", "funChkDecimial(this," + 3 + "," + 2 + ",'Rate %')");
            txtTax.Attributes.Add("onblur", "funChkDecimial(this," + 3 + "," + 2 + ",'Tax %')");
            txtSurcharge.Attributes.Add("onblur", "funChkDecimial(this," + 3 + "," + 2 + ",'Surcharge %')");
            txtCess.Attributes.Add("onblur", "funChkDecimial(this," + 3 + "," + 2 + ",'Cess %')");
            txtEligible.Attributes.Add("onblur", "funChkDecimial(this," + 3 + "," + 2 + ",'Eligible %')");
            

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            if (Request.QueryString["qsTaxCodeId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsTaxCodeId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intTaxCodeId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            txtEffFrom.Attributes.Add("onblur", "fnDoDate(this,'" + txtEffFrom.ClientID + "','" + strDateFormat + "',false,  false);");
            if (!IsPostBack)
            {
                //HtmlControl bodyPage = (HtmlControl)Master.FindControl("bodyMaster");
                //bodyPage.Attributes.Add("onload", "javscript:fnDisableControls();");

                //txtEffFrom.Attributes.Add("readonly", "readonly");
                FunPriBindLOBBranchTaxType();
                //Code Added by Ganapathy to load the GLCode BEGIN
                FunpriLoadGLCode();                
                //END
                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (((intTaxCodeId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);                    
                }
                else if (((intTaxCodeId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);                    
                }
                else
                {

                    FunPriDisableControls(0);
                }

                if (dtTaxAsset.Rows.Count == 0)
                {
                    FunPriInsertTaxAssetDataTable("-1", "-1", "", "", "");
                }
                else
                {
                    FunPubBindTaxAsset(dtTaxAsset);
                }
                if (strMode == "Q" && (gvTaxAsset.FooterRow != null))
                {
                    gvTaxAsset.Columns[3].Visible = false;
                    gvTaxAsset.FooterRow.Visible = false;
                }
            }

            /*
            //--Added by Guna on 18th-Oct-2010 to address the bug - 1747
            if (ddlTaxType.SelectedValue == "68" || ddlTaxType.SelectedValue == "69" || ddlTaxType.SelectedValue == "64" || ddlTaxType.SelectedValue == "66")
            ////if (ddlTaxType.SelectedValue == "68" || ddlTaxType.SelectedValue == "69")
            //--Ends Here
            {
                rfvBranch.Enabled = false;
            }
            else
            {
                rfvBranch.Enabled = true;
            }
            */
            if (ddlSetoff.SelectedValue == "76")
            {
                txtEligible.Text = "";
                txtEligible.Enabled = false;
                rfvEligible.Enabled = false;
                rvEligible.Enabled = false;
            }
            else
            {
                rfvEligible.Enabled = true;
                rvEligible.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);

        }

    }

    #endregion

    #region Page Events

    /// <summary>
    /// This is used to save TaxGuide details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnSave_Click(object sender, EventArgs e)
    {
        vsUserMgmt.Visible = true;
        ObjTaxGuideMasterClient = new AccountMgtServicesReference.AccountMgtServicesClient();
        try
        {
            //---Code Commented and added by saran on 04-Sep-2012 start
           /* if (ddlTaxType.SelectedValue == "68" || ddlTaxType.SelectedValue == "69" || ddlTaxType.SelectedValue == "64" || ddlTaxType.SelectedValue == "66")
            {
                //ddlBranch.Enabled = false;
                rfvBranch.Enabled = false;
                vsUserMgmt.Visible = false;
            }
            else if (ddlTaxType.SelectedValue == "66")
            {
                //ddlBranch.Enabled = false;
                rfvBranch.Enabled = false;
                vsUserMgmt.Visible = false;
            }*/
            if (ddlTaxType.SelectedValue == "83" || ddlTaxType.SelectedValue == "84" || ddlTaxType.SelectedValue == "85" || ddlTaxType.SelectedValue == "86")
            {
                //ddlBranch.Enabled = false;
                rfvBranch.Enabled = false;
                vsUserMgmt.Visible = false;
            }
            //---Code Commented and added by saran on 04-Sep-2012 end
            else
            {
                ddlBranch.Enabled = true;
                rfvBranch.Enabled = true;
                vsUserMgmt.Visible = true;
            }
            AccountMgtServices.S3G_SYSAD_TaxGuideRow ObjTaxGuideRow;
            ObjTaxGuideRow = ObjS3G_SYSAD_TaxGuideDataTable.NewS3G_SYSAD_TaxGuideRow();

            ObjTaxGuideRow.Tax_Code_ID = intTaxCodeId;
            ObjTaxGuideRow.Company_ID = intCompanyID;
            ObjTaxGuideRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
            if (ddlBranch.SelectedIndex > 0)
            {
                ObjTaxGuideRow.Branch_ID = Convert.ToInt32(ddlBranch.SelectedValue);
            }
            if (ddlGLCode.SelectedIndex > 0)
            {
                ObjTaxGuideRow.Posting_GL_Code = Convert.ToInt32(ddlGLCode.SelectedValue);
            }            
            ObjTaxGuideRow.Tax_Type_ID = Convert.ToInt32(ddlTaxType.SelectedValue);
            ObjTaxGuideRow.Effective_From = Utility.StringToDate(txtEffFrom.Text);
            ObjTaxGuideRow.RatePercentage = Convert.ToDecimal(txtRate.Text);
            if (txtEligible.Text != "")
                ObjTaxGuideRow.EligiblePercentage = Convert.ToDecimal(txtEligible.Text);
            ObjTaxGuideRow.ON_FC_ID = Convert.ToInt32(ddlOnFC.SelectedValue);
            ObjTaxGuideRow.Recovery_ID = Convert.ToInt32(ddlRecovery.SelectedValue);
            ObjTaxGuideRow.Remittance_ID = Convert.ToInt32(ddlRemittance.SelectedValue);
            ObjTaxGuideRow.Setoff_ID = Convert.ToInt32(ddlSetoff.SelectedValue);
            ObjTaxGuideRow.Tax = (txtTax.Text.Replace(".", "") == "") ? 0 : Convert.ToDecimal(txtTax.Text);
            ObjTaxGuideRow.Surcharge = (txtSurcharge.Text.Replace(".", "") == "") ? 0 : Convert.ToDecimal(txtSurcharge.Text);
            ObjTaxGuideRow.Cess = (txtCess.Text.Replace(".", "") == "") ? 0 : Convert.ToDecimal(txtCess.Text);
            ObjTaxGuideRow.Is_Active = chkActive.Checked;
            ObjTaxGuideRow.Created_By = intUserId;
            //Added on 11-Aug-2011 to insert asset details
            if (ViewState["Tax_AssetDetails"] != null)
            {
                FunPriGenerateTaxAssetXMLDet();
            }
            ObjTaxGuideRow.XMLAsset = strXMLTaxAssetDet;
            ObjS3G_SYSAD_TaxGuideDataTable.AddS3G_SYSAD_TaxGuideRow(ObjTaxGuideRow);
            //SerializationMode SerMode = SerializationMode.Binary;


            intErrCode = ObjTaxGuideMasterClient.FunPubCreateTaxGuide(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_TaxGuideDataTable, SerMode));

            if (intErrCode == 0)
            {
                if (intTaxCodeId > 0)
                {
                    if (FunCheckLobisvalid(ddlLOB.SelectedValue))
                    {

                        //Utility.FunShowAlertMsg(this.Page, "Tax Guide details updated successfully", strRedirectPage);
                    }
                    else
                    {
                        strAlert = strAlert.Replace("__ALERT__", "Selected Line of Business rights not assigned");
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                        return;
                    }

                    if (Convert.ToInt32(ddlBranch.SelectedValue) > 0)
                    {
                        if (FunCheckBranchisvalid(ddlBranch.SelectedValue))
                        {
                            Utility.FunShowAlertMsg(this.Page, "Tax Guide details updated successfully", strRedirectPage);
                        }
                        else
                        {
                            strAlert = strAlert.Replace("__ALERT__", "Selected Branch rights not assigned");
                            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                            return;
                        }
                    }
                    else
                    {
                        //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                        btnSave.Enabled = false;
                        //End here
                        Utility.FunShowAlertMsg(this.Page, "Tax Guide details updated successfully", strRedirectPage);
                    }
                }
                else
                {
                    //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                    btnSave.Enabled = false;
                    //End here
                    strAlert = "Tax Guide details added successfully";
                    strAlert += @"\n\nWould you like to add one more tax guide?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                    //Utility.FunShowAlertMsg(this.Page, "Work Flow details added successfully", strRedirectPage);
                }
            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Tax Guide already exist");
            }
            else if (intErrCode == 7)
            {
                Utility.FunShowAlertMsg(this.Page, "Define Tax Guide at Location Level");
            }
            else if (intErrCode == 8)
            {
                Utility.FunShowAlertMsg(this.Page, "Define Tax Guide at LOB Level");
            }
            else if (intErrCode == 2)
            {
                Utility.FunShowAlertMsg(this.Page, "Document sequence number is not defined to create TaxCode");
                //---Code Commented and added by saran on 04-Sep-2012 start
                /* if (ddlTaxType.SelectedValue == "68" || ddlTaxType.SelectedValue == "69" || ddlTaxType.SelectedValue == "64" || ddlTaxType.SelectedValue == "66")
                 {
                     //ddlBranch.Enabled = false;
                     rfvBranch.Enabled = false;
                     vsUserMgmt.Visible = false;
                 }
                 else if (ddlTaxType.SelectedValue == "66")
                 {
                     //ddlBranch.Enabled = false;
                     rfvBranch.Enabled = false;
                     vsUserMgmt.Visible = false;
                 }*/
                if (ddlTaxType.SelectedValue == "83" || ddlTaxType.SelectedValue == "84" || ddlTaxType.SelectedValue == "85" || ddlTaxType.SelectedValue == "86")
                {
                    //ddlBranch.Enabled = false;
                    rfvBranch.Enabled = false;
                    vsUserMgmt.Visible = false;
                }
                //---Code Commented and added by saran on 04-Sep-2012 end
                else
                {
                    ddlBranch.Enabled = true;
                    rfvBranch.Enabled = true;
                    vsUserMgmt.Visible = true;
                }
            }
            else if (intErrCode == 3)
            {
                Utility.FunShowAlertMsg(this.Page, "Effective from date cannot be less than date of incorporation of the company");
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + "window.location.href='" + strRedirectPage + "';", true);
            lblErrorMessage.Text = string.Empty;

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjTaxGuideMasterClient.Close();
        }
    }

    /// <summary>
    /// This is used to redirect page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage,false);
    }

    /// <summary>
    /// This is used to clear data
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlLOB.SelectedIndex = 0;
        ddlBranch.SelectedIndex = 0;
        ddlTaxType.SelectedIndex = 0;
        ddlOnFC.SelectedIndex = 0;
        ddlRecovery.SelectedIndex = 0;
        ddlRemittance.SelectedIndex = 0;
        ddlSetoff.SelectedIndex = 0;
        ddlGLCode.SelectedIndex = 0;        
        txtRate.Text = "";
        txtEligible.Text = "";
        txtTax.Text = "";
        txtSurcharge.Text = "";
        txtCess.Text = "";
        txtEffFrom.Text = "";
        chkActive.Checked = true;
    }

    #endregion

    #region Page Methods


    /// <summary>
    /// This is used to bind lob,product,module and program details in dropdownlist
    /// </summary>

    private void FunPriBindLOBBranchTaxType()
    {
        try
        {
            string strProcName = "S3G_Get_LookUp_TaxType";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@Param1", "Yes_Flag");
            ddlOnFC.BindDataTable(strProcName, Procparam, new string[] { "ID", "Name" });

            Procparam = new Dictionary<string, string>();
            //Code Commented and added by saran on 04-Sep-2012 start
            //Procparam.Add("@Option", "1");
            Procparam.Add("@Option", "2");
            //Code Commented and added by saran on 04-Sep-2012 end
            Procparam.Add("@Param1", "TaxType");
            ddlTaxType.BindDataTable(strProcName, Procparam, new string[] { "ID", "Name" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@Param1", "Remittance");
            ddlRemittance.BindDataTable(strProcName, Procparam, new string[] { "ID", "Name" });
            ddlRecovery.BindDataTable(strProcName, Procparam, new string[] { "ID", "Name" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@Param1", "Setoff");
            ddlSetoff.BindDataTable(strProcName, Procparam, new string[] { "ID", "Name" });

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));

            if (intTaxCodeId == 0)
            {
                Procparam.Add("@User_ID", intUserId.ToString());
                Procparam.Add("@Is_Active", "1");
            }
            Procparam.Add("@Program_ID", "16");
            ddlLOB.BindDataTable(SPNames.LOBMaster, Procparam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });

            ddlBranch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, new string[] { "Location_ID", "Location_Code", "Location_Name" });
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }


    private void loblist()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Is_Active", "1");
            if (intTaxCodeId == 0)
            {
                Procparam.Add("@User_ID", intUserId.ToString());
            }
            Procparam.Add("@Program_ID", "16");
            ddlLOB.BindDataTable(SPNames.LOBMaster, Procparam, new string[] { "LOB_ID", "LOB_Code", "LOB_Name" });
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }

    }

    private void FunpriLoadGLCode()
    {       
        Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        if (ddlLOB.SelectedIndex > 0)
        {
            Procparam.Add("@LOB_ID", Convert.ToString(ddlLOB.SelectedValue));
        }

        if (ddlBranch.SelectedIndex > 0)
        {
            Procparam.Add("@Location_ID", Convert.ToString(ddlBranch.SelectedValue));
        }
        ddlGLCode.BindDataTable("S3G_SYSAD_GetGLCode", Procparam, new string[] { "GLac", "GLAccount" });        
    }
    /// <summary>
    /// This method is used to display User details
    /// </summary>
    private void FunGetTaxGuideDetails()
    {
        ObjTaxGuideMasterClient = new AccountMgtServicesReference.AccountMgtServicesClient();
        try
        {
            ObjS3G_SYSAD_TaxGuideDataTable = new AccountMgtServices.S3G_SYSAD_TaxGuideDataTable();
            AccountMgtServices.S3G_SYSAD_TaxGuideRow ObjTaxGuideRow;
            SerializationMode SerMode = SerializationMode.Binary;
            ObjTaxGuideRow = ObjS3G_SYSAD_TaxGuideDataTable.NewS3G_SYSAD_TaxGuideRow();
            ObjTaxGuideRow.Company_ID = intCompanyID;
            ObjTaxGuideRow.Tax_Code_ID = intTaxCodeId;

            ObjS3G_SYSAD_TaxGuideDataTable.AddS3G_SYSAD_TaxGuideRow(ObjTaxGuideRow);

            byte[] byteTaxGuideDetails = ObjTaxGuideMasterClient.FunPubQueryTaxGuide(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_TaxGuideDataTable, SerMode));
            ObjS3G_SYSAD_TaxGuideDataTable = (AccountMgtServices.S3G_SYSAD_TaxGuideDataTable)ClsPubSerialize.DeSerialize(byteTaxGuideDetails, SerializationMode.Binary, typeof(AccountMgtServices.S3G_SYSAD_TaxGuideDataTable));

            dsTaxDetails = new DataSet();
            strProcName = "S3G_Get_Taxguide_Asset_Details";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@TaxCode_ID", intTaxCodeId.ToString());
            dsTaxDetails = Utility.GetTableValues(strProcName, Procparam);
            if (dsTaxDetails.Tables[0].Rows.Count > 0)
            {
                dtTaxAsset = dsTaxDetails.Tables[0].Copy();
                ViewState["Tax_AssetDetails"] = dtTaxAsset;
            }
            dsTaxDetails.Dispose();

            loblist();
            txtTaxCode.Text = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Tax_Code"].ToString();
            ddlLOB.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["LOB_ID"].ToString();
            ddlBranch.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Branch_ID"].ToString();
            ddlTaxType.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Tax_Type_ID"].ToString();
            ddlOnFC.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["On_FC_ID"].ToString();
            txtRate.Text = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["RatePercentage"].ToString();
            txtEligible.Text = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["EligiblePercentage"].ToString();
            ddlRecovery.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Recovery_ID"].ToString();
            ddlRemittance.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Remittance_ID"].ToString();
            ddlSetoff.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["SetOff_ID"].ToString();
            hdnID.Value = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Created_By"].ToString();
            ddlGLCode.SelectedValue = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Posting_GL_Code"].ToString();            
            string strTax = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Tax"].ToString();
            string strSur = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Surcharge"].ToString();
            string strCess = ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Cess"].ToString();
            if ((strTax != "0.00") || (strSur != "0.00") || (strCess != "0.00"))
            {
                txtTax.Text = strTax;
                txtSurcharge.Text = strSur;
                txtCess.Text = strCess;
            }
            txtEffFrom.Text = DateTime.Parse(ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Effective_From"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
            //txtEffFrom.Text = DateTime.Parse(ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Effective_From"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToShortDateString();


            if (ObjS3G_SYSAD_TaxGuideDataTable.Rows[0]["Is_Active"].ToString() == "True")
                chkActive.Checked = true;
            else
                chkActive.Checked = false;
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            ObjTaxGuideMasterClient.Close();
        }
    }

    /// <summary>
    /// This is to disable controls based on user level role id
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode
                if (!bCreate)
                {
                    btnSave.Enabled = false;
                }
                chkActive.Enabled = false;
                chkActive.Checked = true;
                break;

            case 1: // Modify Mode

                if (!bModify)
                {
                    btnSave.Enabled = false;
                }                
                FunGetTaxGuideDetails();                
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                btnClear.Enabled = false;
                ddlBranch.Enabled = false;
                ddlTaxType.Enabled = false;
                ddlLOB.Enabled = false;
                //FunGetTaxGuideDetails();
                //if (ddlBranch.SelectedIndex == 0)
                //{
                //    rfvBranch.Enabled = false;
                //}
                string str = ddlLOB.SelectedItem.Text.ToLower().Split('-').GetValue(0).ToString().Trim();
                //---Code Commented and added by saran on 04-Sep-2012 start
                //tcTaxAsset.Visible = ((ddlTaxType.SelectedValue == "64") && !((str.ToLower() == "wc") || (str.ToLower() == "ft"))) ? true : false;
                tcTaxAsset.Visible = ((ddlTaxType.SelectedValue == "86") && !((str.ToLower() == "wc") || (str.ToLower() == "ft"))) ? true : false;
                //---Code Commented and added by saran on 04-Sep-2012 end
                btnClear.Enabled = false;
                break;

            case -1:// Query Mode                
                FunGetTaxGuideDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                if (bClearList)
                {
                    ddlLOB.ClearDropDownList();
                    ddlBranch.ClearDropDownList();
                    ddlTaxType.ClearDropDownList();
                    ddlOnFC.ClearDropDownList();
                    ddlRecovery.ClearDropDownList();
                    ddlRemittance.ClearDropDownList();
                    ddlSetoff.ClearDropDownList();
                    ddlGLCode.ClearDropDownList();                    
                }

                CalendarExtender1.Enabled = false;
                txtTaxCode.ReadOnly = true;
                txtRate.ReadOnly = true;
                txtEligible.ReadOnly = true;
                txtTax.ReadOnly = true;
                txtSurcharge.ReadOnly = true;
                txtCess.ReadOnly = true;
                txtEffFrom.ReadOnly = true;
                txtEffFrom.Attributes.Remove("onblur");
                btnClear.Enabled = false;
                btnSave.Enabled = false;
                chkActive.Enabled = false;
                txtTaxCode.Enabled = true;
                
                string str1 = ddlLOB.SelectedItem.Text.ToLower().Split('-').GetValue(0).ToString().Trim();
                //---Code Commented and added by saran on 04-Sep-2012 start
                //tcTaxAsset.Visible = ((ddlTaxType.SelectedValue == "64") && !((str1.ToLower() == "wc") || (str1.ToLower() == "ft"))) ? true : false;
                tcTaxAsset.Visible = ((ddlTaxType.SelectedValue == "86") && !((str1.ToLower() == "wc") || (str1.ToLower() == "ft"))) ? true : false;
                //---Code Commented and added by saran on 04-Sep-2012 end
                break;
        }

    }


    #endregion

    private bool FunCheckLobisvalid(string strLobId)
    {
        Dictionary<string, string> Procparm = new Dictionary<string, string>();
        Procparm.Add("@Company_ID", intCompanyID.ToString());
        Procparm.Add("@User_Id", intUserId.ToString());
        Procparm.Add("@LOB_ID", strLobId);
        Procparm.Add("@Program_ID", "16");
        if (intTaxCodeId == 0)
        {
            Procparm.Add("@Is_Active", "1");
        }
        Procparm.Add("@Is_UserLobActive", "1");
        DataTable dtBool = Utility.GetDefaultData("S3G_GetUserLobMapping", Procparm);
        if (dtBool.Rows[0]["EXISTS"].ToString() == "1")
            return true;
        else
            return false;

    }

    private bool FunCheckBranchisvalid(string strBranchId)
    {
        Dictionary<string, string> Procparm = new Dictionary<string, string>();
        Procparm.Add("@Company_ID", intCompanyID.ToString());
        Procparm.Add("@User_Id", intUserId.ToString());
        Procparm.Add("@Location_ID", strBranchId);
        Procparm.Add("@Program_ID", "16");
        if (intTaxCodeId == 0)
        {
            Procparm.Add("@Is_Active", "1");
        }

        Procparm.Add("@Is_UserLobActive", "1");
        DataTable dtBool = Utility.GetDefaultData("S3G_GetUserBranchMapping", Procparm);
        if (dtBool.Rows[0]["EXISTS"].ToString() == "1")
            return true;
        else
            return false;

    }

    #region GridEvents

    protected void ddlAssetType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlAssetClass = gvTaxAsset.FooterRow.FindControl("ddlAssetClass") as DropDownList;
            DropDownList ddlAssetType = gvTaxAsset.FooterRow.FindControl("ddlAssetType") as DropDownList;
            ddlAssetClass.Items.Clear();
            //ddlAssetDescription.Items.Clear();
            //txtAssetDescription.Text = "";

            if (ddlAssetType.SelectedValue != "0")
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", ObjUserInfo.ProCompanyIdRW.ToString());
                Procparam.Add("@Type", "Class");
                Procparam.Add("@Asset_Type_ID", ddlAssetType.SelectedValue.ToString());
                ddlAssetClass.BindDataTable("S3G_SysAd_GetAssetCategory_List", Procparam, new string[] { "Asset_Category_ID", "Category_Code", "Category_Description" });
                //ddlAssetDescription.BindDataTable("S3G_LOANAD_GetAssetLists", ObjDictParams, new string[] { "Asset_ID", "Asset_Description" });
                Procparam = null;
            }

            ddlAssetType.Focus();
        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void ddlTaxType_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            AssetValidation4LOB();
        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }

    }


    protected void ddlAssetClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlAssetClass = gvTaxAsset.FooterRow.FindControl("ddlAssetClass") as DropDownList;
            ddlAssetClass.Focus();
        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void gvTaxAsset_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //e.Row.Cells[0].Style.Add("position", "relative");
                //e.Row.Cells[0].BorderWidth = 0;
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddlAssetClass = e.Row.FindControl("ddlAssetClass") as DropDownList;
                DropDownList ddlAssetType = e.Row.FindControl("ddlAssetType") as DropDownList;

                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", intCompanyID.ToString());
                Procparam.Add("@Type", "Asset_Category");
                ddlAssetType.BindDataTable("S3G_SysAd_GetAssetCategory_List", Procparam, new string[] { "ID", "Name" });
                ddlAssetType.Focus();

                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", ObjUserInfo.ProCompanyIdRW.ToString());
                Procparam.Add("@Type", "Class");
                Procparam.Add("@Asset_Type_ID", ddlAssetType.SelectedValue.ToString());
                ddlAssetClass.BindDataTable("S3G_SysAd_GetAssetCategory_List", Procparam, new string[] { "Asset_Category_ID", "Category_Code", "Category_Description" });
                //ddlAssetDescription.BindDataTable("S3G_LOANAD_GetAssetLists", ObjDictParams, new string[] { "Asset_ID", "Asset_Description" });

            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    LinkButton lnkRemove = e.Row.FindControl("lnkRemove") as LinkButton;

            //    if (strMode == "Q" || strMode == "M")
            //    {
            //        lnkRemove.Enabled = false;
            //    }
            //}
        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void gvTaxAsset_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            string strAssetClassID, strAssetClass, strTaxAssetID;

            if (e.CommandName == "Add")
            {
                DropDownList ddlAssetClass = gvTaxAsset.FooterRow.FindControl("ddlAssetClass") as DropDownList;
                //Label lblTaxAssetID = gvTaxAsset.FooterRow.FindControl("lblTaxAssetID") as Label;
                DropDownList ddlAssetType = gvTaxAsset.FooterRow.FindControl("ddlAssetType") as DropDownList;
                strTaxAssetID = "0";
                if (ddlAssetType.SelectedValue == "0")
                {
                    Utility.FunShowAlertMsg(this.Page, "Select the Asset Type.");
                    ddlAssetType.Focus();
                    return;
                }
                strAssetClassID = ddlAssetClass.SelectedValue.ToString();
                strAssetClass = ddlAssetClass.SelectedItem.Text.ToString();
                //strAssetDescription = txtAssetDescription.Text;
                if (strAssetClassID.Equals("0"))
                {
                    Utility.FunShowAlertMsg(this.Page, "Select the Asset Class.");
                    ddlAssetClass.Focus();
                    return;

                }
                DataRow[] drCheck = null;
                dtTaxAsset = FunPriGetTaxAssetDataTable();
                string strFilterQuery = "Asset_Class_ID='" + strAssetClassID + "' AND Asset_Type_ID='" + ddlAssetType.SelectedValue + "'";
                drCheck = dtTaxAsset.Select(strFilterQuery);
                if (drCheck.Length > 0)
                {
                    Utility.FunShowAlertMsg(this.Page, "Same record already exists in the grid");
                    return;
                }
                FunPriInsertTaxAssetDataTable(strAssetClassID.ToString(), ddlAssetType.SelectedValue, strAssetClass, ddlAssetType.SelectedItem.Text, strTaxAssetID);
            }
        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    protected void gvTaxAsset_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            dtTaxAsset = FunPriGetTaxAssetDataTable();
            dtTaxAsset.Rows.RemoveAt(e.RowIndex);

            ViewState["Tax_AssetDetails"] = dtTaxAsset;

            dtTaxAsset = FunPriGetTaxAssetDataTable();
            if (dtTaxAsset.Rows.Count == 0)
            {
                FunPriInsertTaxAssetDataTable("-1", "-1", "", "", "");
            }
            else
            {
                FunPubBindTaxAsset(dtTaxAsset);
            }

        }
        catch (Exception ex)
        {
              ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    private DataTable FunPriGetTaxAssetDataTable()
    {
        try
        {

            if (ViewState["Tax_AssetDetails"] == null)
            {
                dtTaxAsset = new DataTable();

                dtTaxAsset.Columns.Add("Asset_Serial_Number");
                dtTaxAsset.Columns.Add("Tax_Asset_ID");
                dtTaxAsset.Columns.Add("Asset_Class_ID");
                dtTaxAsset.Columns.Add("Asset_Type_ID");
                dtTaxAsset.Columns.Add("Asset_Class");
                dtTaxAsset.Columns.Add("Asset_Type");

                ViewState["Tax_AssetDetails"] = dtTaxAsset;
            }

            dtTaxAsset = (DataTable)ViewState["Tax_AssetDetails"];

            return dtTaxAsset;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriInsertTaxAssetDataTable(string strAssetClass_ID, string strAssetType_ID, string strAssetClass, string strAssetType, string strTaxAsset_ID)
    {
        try
        {

            DataRow drEmptyRow;
            dtTaxAsset = FunPriGetTaxAssetDataTable();

            if (strAssetClass_ID.Equals("-1"))
            {
                if (dtTaxAsset.Rows.Count == 0)
                {
                    drEmptyRow = dtTaxAsset.NewRow();
                    drEmptyRow["Asset_Serial_Number"] = "0";
                    dtTaxAsset.Rows.Add(drEmptyRow);
                }
            }
            else
            {
                drEmptyRow = dtTaxAsset.NewRow();
                drEmptyRow["Asset_Serial_Number"] = Convert.ToInt32(dtTaxAsset.Rows[dtTaxAsset.Rows.Count - 1]["Asset_Serial_Number"]) + 1;
                drEmptyRow["Tax_Asset_ID"] = strTaxAsset_ID;
                drEmptyRow["Asset_Class_ID"] = strAssetClass_ID;
                drEmptyRow["Asset_Type_ID"] = strAssetType_ID;
                drEmptyRow["Asset_Class"] = strAssetClass;
                drEmptyRow["Asset_Type"] = strAssetType;
                dtTaxAsset.Rows.Add(drEmptyRow);
            }

            if (dtTaxAsset.Rows.Count > 1)
            {
                if (dtTaxAsset.Rows[0]["Asset_Serial_Number"].Equals("0"))
                {
                    dtTaxAsset.Rows[0].Delete();
                    //gvWorkFlowSequence.Rows[0].Visible = false;
                }
            }

            ViewState["Tax_AssetDetails"] = dtTaxAsset;

            dtTaxAsset = FunPriGetTaxAssetDataTable();
            FunPubBindTaxAsset(dtTaxAsset);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPubBindTaxAsset(DataTable dtTaxAsset)
    {
        try
        {
            gvTaxAsset.DataSource = dtTaxAsset;
            gvTaxAsset.DataBind();
            if (dtTaxAsset.Rows[0]["Asset_Serial_Number"].ToString().Equals("0"))
            {
                gvTaxAsset.Rows[0].Visible = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private bool FunPriGenerateTaxAssetXMLDet()
    {
        try
        {
            dtTaxAsset = (DataTable)ViewState["Tax_AssetDetails"];

            if (dtTaxAsset.Rows.Count == 1)
            {
                if (dtTaxAsset.Rows[0]["Asset_Serial_Number"].ToString().Equals("0") && PageMode == PageModes.Create)
                {
                    return false;
                }
            }
            strbTaxAssetDet.Append("<Root>");
            foreach (DataRow drow in dtTaxAsset.Rows)
            {
                strbTaxAssetDet.Append("<Details ");
                strbTaxAssetDet.Append(" Tax_Asset_ID = '" + drow["Tax_Asset_ID"].ToString() + "'");
                strbTaxAssetDet.Append(" Asset_Class_ID = '" + drow["Asset_Class_ID"].ToString() + "'");
                strbTaxAssetDet.Append(" Asset_Type_ID = '" + drow["Asset_Type_ID"].ToString() + "'");

                strbTaxAssetDet.Append(" />");
            }
            strbTaxAssetDet.Append("</Root>");
            strXMLTaxAssetDet = strbTaxAssetDet.ToString();
            return true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void ddlLOB_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_Id", Convert.ToString(intUserId));
            Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Program_ID", "16");
            Procparam.Add("@LOB_ID", ddlLOB.SelectedValue.ToString());
            ddlBranch.BindDataTable(SPNames.BranchMaster_LIST, Procparam, new string[] { "Location_ID", "Location_Code", "Location_Name" });
            AssetValidation4LOB();
            FunpriLoadGLCode();
        }
        catch
        {
            throw;
        }
    }

    protected void ddlGLCode_SelectedIndexChanged(object sender, EventArgs e)
    {
        //try
        //{
        //    //Procparam = new Dictionary<string, string>();
        //    //Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
        //    //Procparam.Add("@GL_Code", ddlGLCode.SelectedValue);
        //    //ddlSLCode.BindDataTable("S3G_SYSAD_GetSLCode", Procparam, new string[] { "SLac", "SLAccount" });
        //    //if (ddlSLCode.Items.Count > 1)
        //    //{
        //    //    lblSLCode.CssClass = "styleReqFieldLabel";
        //    //    rfvSLCode.Enabled = true;
        //    //}
        //    //else
        //    //{
        //    //    lblSLCode.CssClass = "styleMandatoryLabel";
        //    //    rfvSLCode.Enabled = false;
        //    //}
        //}
        //catch
        //{
        //    throw;
        //}
    }

    protected void AssetValidation4LOB()
    {
        string str = ddlLOB.SelectedItem.Text.ToLower().Split('-').GetValue(0).ToString().Trim();
        //---Code Commented and added by saran on 04-Sep-2012 start
        //if ((ddlTaxType.SelectedValue == "64") && !((str == "wc") || (str == "ft")))
        if ((ddlTaxType.SelectedValue == "86") && !((str == "wc") || (str == "ft")))
        //---Code Commented and added by saran on 04-Sep-2012 end
        {
            tcTaxAsset.Visible = true;
            if (dtTaxAsset.Rows.Count == 0)
            {
                FunPriInsertTaxAssetDataTable("-1", "-1", "", "", "");
            }
            else
            {
                FunPubBindTaxAsset(dtTaxAsset);
            }
        }
        else
        {
            dtTaxAsset.Clear();
            ViewState["Tax_AssetDetails"] = null;

            tcTaxAsset.Visible = false;
        }
    }
   

    #endregion

}



