#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Company Creation
/// Created By			: M.Saran
/// Created Date		: 23-Jan-2012
/// Purpose	            : 
/// Reason              : System Admin Company Master Developement
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
#endregion

public partial class Sysadm_FACompanyMaster_Add : ApplyThemeForProject_FA
{
    #region Intialization
    int intErrCode = 0;
    int intCompanyId = 0;
    int intUserId = 0;
    bool bModify = false;
    UserInfo_FA ObjUserInfo_FA;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    string strMode;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strDateFormat;
    string strConnectionName = "";
    Dictionary<string, string> Procparam = null;
    DataTable dtCompanyLocationdetails = new DataTable();
    FASession ObjFASession = new FASession();
    static string strPageName = "Company Master";
    FASerializationMode SerMode = FASerializationMode.Binary;
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objCompanyMasterClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable ObjFA_SYS_CompanyMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable();
    string strRedirectPageView = "window.location.href='../LoginPage.aspx'";
    #endregion



    #region Page Events
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (System.Data.SqlClient.SqlException sqle)
        {
            CVCompanyMaster.ErrorMessage = sqle.Message;
            CVCompanyMaster.IsValid = false;
        }
        catch (DataException de)
        {

        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable to Load";
            CVCompanyMaster.IsValid = false;
        }
    }


    #endregion

    #region "Checkbox Events"
    protected void chkCompanyCurrency_OnCheckedChanged(object sender, EventArgs e)
    {
        try
        {

            CheckBox chk = (CheckBox)sender;
            GridViewRow gvrow = (GridViewRow)chk.Parent.Parent;
            Label lblCurrencyID = (Label)gvrow.FindControl("lblCurrencyID");
            bool intCurrencyMapped = false;
            if (ViewState["dtCompanyLocationdetails"] != null)
                dtCompanyLocationdetails = (DataTable)ViewState["dtCompanyLocationdetails"];
            if (dtCompanyLocationdetails.Rows.Count > 0)
            {
                foreach (DataRow dr in dtCompanyLocationdetails.Rows)
                {
                    if (dr["Currency_ID"].ToString() == lblCurrencyID.Text)
                    {
                        intCurrencyMapped = true;
                    }
                }
            }
            if (!intCurrencyMapped)
                FunPriLoadFooterCurrency();
            else
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Already Mapped with Location");//Error Code 101
                Utility_FA.FunShowValidationMsg_FA(this, 101);
                chk.Checked = (!chk.Checked);
            }
        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Error in Currency details";
            CVCompanyMaster.IsValid = false;
        }
    }


    protected void chkCompanydefaultCurrency_OnCheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow gvRow = (GridViewRow)chk.Parent.Parent;
            foreach (GridViewRow grow in grvCurrencyDtls.Rows)
            {
                CheckBox chkCompanydefaultCurrency = (CheckBox)grow.FindControl("chkCompanydefaultCurrency");
                if (gvRow.RowIndex != grow.RowIndex)
                {
                    chkCompanydefaultCurrency.Checked = false;
                }
            }

        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Error in Currency details";
            CVCompanyMaster.IsValid = false;
        }
    }

    protected void chkCommAddress_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (chkCommAddress.Checked)
            {
                txtCommAddress.Text = txtHeadOfficeAddress.Text;
                txtCommPhoneNumber.Text = txtHeadOfficePhoneNumber.Text;
                txtCommEmailID.Text = txtHeadOfficeEmailID.Text;
            }
            else
            {
                txtCommAddress.Text = txtCommPhoneNumber.Text = txtCommEmailID.Text = "";
            }

        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable to Copy Head Office details in Communication details";
            CVCompanyMaster.IsValid = false;
        }
    }


    protected void chkContactAddress_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            if (chkContactAddress.Checked)
            {
                txtContactAddress.Text = txtCommAddress.Text;
                txtContactPhoneNumber.Text = txtCommPhoneNumber.Text;
                txtContactEmailID.Text = txtCommEmailID.Text;
            }
            else
            {
                txtContactAddress.Text = txtContactPhoneNumber.Text = txtContactEmailID.Text = "";
            }

        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable to Copy Communication details in Contact details";
            CVCompanyMaster.IsValid = false;
        }
    }


    #endregion

    #region Grid events

    protected void grvCurrencyDtls_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            bool SetDefaultCurrency = false;
            if (ViewState["DefaultCurrencyExists"] != null)
                if (Convert.ToInt16(ViewState["DefaultCurrencyExists"]) > 0)
                    SetDefaultCurrency = true;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkCompanydefaultCurrency = (CheckBox)e.Row.FindControl("chkCompanydefaultCurrency");
                if (SetDefaultCurrency)
                {
                    chkCompanydefaultCurrency.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Error in Currency details.";
            CVCompanyMaster.IsValid = false;
        }
    }



    protected void grvLocationCurrency_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                FunPriAddLocationCurrencyDetails();
            }
        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable to add Location Currency details.";
            CVCompanyMaster.IsValid = false;
        }
    }

    protected void grvLocationCurrency_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            FunPriRemoveLocationCurrencyDetails(e.RowIndex);

        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable to Delete Location Currency details.";
            CVCompanyMaster.IsValid = false;
        }
    }


    #endregion


    #region Page Methods

    /// <summary>
    /// This method will execute when page Loads
    /// </summary>
    private void FunPriLoadPage()
    {
        try
        {
            ObjUserInfo_FA = new UserInfo_FA();
            intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;//Convert.ToInt32(Request.QueryString["qsCmpnyId"]);
            intUserId = ObjUserInfo_FA.ProUserIdRW;
            strDateFormat = ObjFASession.ProDateFormatRW;
            strConnectionName = ObjFASession.ProConnectionName;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            CalendarExtender1.Format = strDateFormat;
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            if (!IsPostBack)
            {
                txtIncorporationDate.Attributes.Add("readonly", "readonly");
                int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
                int intCurrentyear = DateTime.Now.Year;
                if(DateTime.Now.Month > 3)
                   txtFinancialYear.Text = (intCurrentyear).ToString() + intActualMonth.ToString("00") + "-" + (intCurrentyear+1).ToString() + (intActualMonth - 1).ToString("00");
                else
                    txtFinancialYear.Text = (intCurrentyear - 1).ToString() + intActualMonth.ToString("00") + "-" + (intCurrentyear).ToString() + (intActualMonth - 1).ToString("00");
                if (intCompanyId > 0)
                {
                    FunPriLoadControls();
                    FunPriDisableControls(1);
                    if (!bIsActive)
                    {

                        btnSave.Enabled = false;
                        btnClear.Enabled = false;

                    }
                    else
                    {
                        if (!bModify)
                        {
                            strMode = "Q";
                        }
                        else
                        {
                            strMode = "M";
                        }
                    }
                }

            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// This method is used to load the company details in modify mode
    /// </summary>
    private void FunPriGetCompanyDetails(DataTable dtCompanyDetails)
    {
        try
        {
            #region "Company details tab"
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Company_code"].ToString()))
                txtCompanyCode.Text = dtCompanyDetails.Rows[0]["Company_code"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Company_name"].ToString()))
                txtCompanyName.Text = dtCompanyDetails.Rows[0]["Company_name"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Group_code"].ToString()))
                txtGroupCompanyCode.Text = dtCompanyDetails.Rows[0]["Group_code"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Group_name"].ToString()))
                txtGroupCompanyName.Text = dtCompanyDetails.Rows[0]["Group_name"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comp_PAN"].ToString()))
                txtPANTAXNumber.Text = dtCompanyDetails.Rows[0]["Comp_PAN"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comp_TIN"].ToString()))
                txtTINNumber.Text = dtCompanyDetails.Rows[0]["Comp_TIN"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comp_Incorp_Date"].ToString()))
            {
                if (strDateFormat != null || strDateFormat != string.Empty)
                {
                    txtIncorporationDate.Text = DateTime.Parse(dtCompanyDetails.Rows[0]["Comp_Incorp_Date"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
                }
                else
                {
                    txtIncorporationDate.Text = dtCompanyDetails.Rows[0]["Comp_Incorp_Date"].ToString();
                }
            }
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["FinancialYear"].ToString()))
                txtFinancialYear.Text = dtCompanyDetails.Rows[0]["FinancialYear"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Name"].ToString()))
                txtContactPersonName.Text = dtCompanyDetails.Rows[0]["Cont_Per_Name"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Designation"].ToString()))
                txtContactPersonDesignation.Text = dtCompanyDetails.Rows[0]["Cont_Per_Designation"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["SA_UserName"].ToString()))
                txtSysUserName.Text = dtCompanyDetails.Rows[0]["SA_UserName"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["SA_Password"].ToString()))
                txtSysPassword.Attributes.Add("value", FAClsPubCommCrypto.DecryptText(dtCompanyDetails.Rows[0]["SA_Password"].ToString()));
            #endregion

            #region "Address Tab"
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["HO_Address"].ToString()))
                txtHeadOfficeAddress.Text = dtCompanyDetails.Rows[0]["HO_Address"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["HO_Phone"].ToString()))
                txtHeadOfficePhoneNumber.Text = dtCompanyDetails.Rows[0]["HO_Phone"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["HO_Email"].ToString()))
                txtHeadOfficeEmailID.Text = dtCompanyDetails.Rows[0]["HO_Email"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comu_Address"].ToString()))
                txtCommAddress.Text = dtCompanyDetails.Rows[0]["Comu_Address"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comu_Phone"].ToString()))
                txtCommPhoneNumber.Text = dtCompanyDetails.Rows[0]["Comu_Phone"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Comu_Email"].ToString()))
                txtCommEmailID.Text = dtCompanyDetails.Rows[0]["Comu_Email"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Address"].ToString()))
                txtContactAddress.Text = dtCompanyDetails.Rows[0]["Cont_Per_Address"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Phone"].ToString()))
                txtContactPhoneNumber.Text = dtCompanyDetails.Rows[0]["Cont_Per_Phone"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Email"].ToString()))
                txtContactEmailID.Text = dtCompanyDetails.Rows[0]["Cont_Per_Email"].ToString();
            if (!string.IsNullOrEmpty(dtCompanyDetails.Rows[0]["Cont_Per_Mobile"].ToString()))
                txtMobileNumber.Text = dtCompanyDetails.Rows[0]["Cont_Per_Mobile"].ToString();
            #endregion
            ViewState["DefaultCurrencyExists"] = dtCompanyDetails.Rows[0]["Default_Currency"].ToString();


        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to delete the Location Currrency details.
    /// </summary>
    private void FunPriRemoveLocationCurrencyDetails(int intRowIndex)
    {
        try
        {
            dtCompanyLocationdetails = (DataTable)ViewState["dtCompanyLocationdetails"];
            dtCompanyLocationdetails.Rows.RemoveAt(intRowIndex);
            if (dtCompanyLocationdetails.Rows.Count == 0)
            {
                FunLoadGridInsert();
            }
            else
            {
                FunFillgrid(dtCompanyLocationdetails);
                FunPriLoadFooterLocationGrid();
                FunPriLoadFooterCurrency();
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// This method is used to insert the Location Currrency details.
    /// </summary>
    private void FunPriAddLocationCurrencyDetails()
    {
        try
        {
            dtCompanyLocationdetails = new DataTable();
            if (ViewState["dtCompanyLocationdetails"] != null)
            {
                dtCompanyLocationdetails = (DataTable)ViewState["dtCompanyLocationdetails"];
            }
            if (dtCompanyLocationdetails.Rows.Count == 1)
            {
                if (dtCompanyLocationdetails.Rows[0]["Location_Name"].ToString() == string.Empty)
                    dtCompanyLocationdetails.Rows[0].Delete();
            }
            DropDownList ddlLocation = (DropDownList)grvLocationCurrency.FooterRow.FindControl("ddlLocation");
            DropDownList ddldefaultCurrency = (DropDownList)grvLocationCurrency.FooterRow.FindControl("ddldefaultCurrency");

            if (!(FunPriChkAlreadyExist(ddlLocation.SelectedValue, ddldefaultCurrency.SelectedValue)))
            {
                DataRow drEmptyRow;
                drEmptyRow = dtCompanyLocationdetails.NewRow();

                drEmptyRow["Location_Name"] = ddlLocation.SelectedItem.Text;
                drEmptyRow["Location_ID"] = ddlLocation.SelectedValue;
                drEmptyRow["Currency_Name"] = ddldefaultCurrency.SelectedItem.Text;
                drEmptyRow["Currency_ID"] = ddldefaultCurrency.SelectedValue;
                dtCompanyLocationdetails.Rows.Add(drEmptyRow);
                ViewState["dtCompanyLocationdetails"] = dtCompanyLocationdetails;
                FunFillgrid(dtCompanyLocationdetails);
                FunPriLoadFooterLocationGrid();
                FunPriLoadFooterCurrency();
            }
            else
            {
                //Utility_FA.FunShowAlertMsg_FA(this, "Records Already exist");//Error Code 102
                Utility_FA.FunShowValidationMsg_FA(this, 102);
                return;

            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to check Currency Exists.
    /// </summary>
    private bool FunPriChkAlreadyExist(string strLocation_ID, string strCurrency_ID)
    {
        bool IsExists = false;
        try
        {

            if (strLocation_ID != string.Empty)
            {
                if (ViewState["dtCompanyLocationdetails"] != null)
                {
                    dtCompanyLocationdetails = (DataTable)ViewState["dtCompanyLocationdetails"];
                }
                foreach (DataRow dr in dtCompanyLocationdetails.Rows)
                {
                    if (strLocation_ID == dr["Location_ID"].ToString())
                    {
                        IsExists = true;
                    }
                }
            }

        }
        catch (Exception ex)
        {

        }
        return IsExists;
    }

    private bool FunChkPageValidations()
    {
        bool IsError = false;
        try
        {
            if (intCompanyId > 0)
            {
                int intCurrencyDtls = 0;
                int intDefaultCurrency = 0;
                if (grvCurrencyDtls != null)
                {
                    foreach (GridViewRow grv in grvCurrencyDtls.Rows)
                    {
                        CheckBox chkCurrency = (CheckBox)grv.FindControl("chkCompanyCurrency");
                        CheckBox chkdefaultCurrency = (CheckBox)grv.FindControl("chkCompanydefaultCurrency");
                        if (chkCurrency.Checked)
                            intCurrencyDtls++;
                        if (chkdefaultCurrency.Checked)
                            intDefaultCurrency++;
                    }
                    if (intCurrencyDtls == 0)
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this, "Select Atleast one currency");//Error Code 103
                        Utility_FA.FunShowValidationMsg_FA(this, 103);
                        return true;

                    }
                    else if (intDefaultCurrency == 0)
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this, "Select Atleast one default currency");//Error Code 104
                        Utility_FA.FunShowValidationMsg_FA(this, 104);
                        return true;

                    }
                }
            }
            else
            {
                if (txtSysPassword.Text.IsValidPassword_FA())
                {

                    IsError = false;
                }
                else
                {
                    //Utility_FA.FunShowAlertMsg_FA(this, "Enter a valid Password");//Error Code 105
                    Utility_FA.FunShowValidationMsg_FA(this, 105);
                    return true;

                }
            }
        }
        catch (Exception ex)
        {

        }
        return IsError;
    }


    /// <summary>
    /// This method is used to insert the Company Master.
    /// </summary>
    private void FunPriInsertCompanyDetails()
    {
        try
        {
            if (txtCompanyCode.Text != string.Empty && txtCompanyName.Text != string.Empty)
            {

                if (!FunChkPageValidations())
                {
                    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterRow ObjCompanyMasterRow;
                    ObjCompanyMasterRow = ObjFA_SYS_CompanyMasterDataTable.NewFA_SYS_CompanyMasterRow();
                    ObjCompanyMasterRow.Company_ID = intCompanyId;
                    ObjCompanyMasterRow.Company_code = txtCompanyCode.Text;
                    ObjCompanyMasterRow.Company_name = txtCompanyName.Text;
                    ObjCompanyMasterRow.HO_Address = txtHeadOfficeAddress.Text;
                    ObjCompanyMasterRow.HO_Phone = txtHeadOfficePhoneNumber.Text;
                    ObjCompanyMasterRow.HO_Email = txtHeadOfficeEmailID.Text;
                    ObjCompanyMasterRow.Comu_Address = txtCommAddress.Text;
                    ObjCompanyMasterRow.Comu_Phone = txtCommPhoneNumber.Text;
                    ObjCompanyMasterRow.Comu_Email = txtCommEmailID.Text;
                    ObjCompanyMasterRow.Comp_PAN = txtPANTAXNumber.Text;
                    ObjCompanyMasterRow.Comp_TIN = txtTINNumber.Text;
                    if (txtIncorporationDate.Text != string.Empty)
                        //ObjCompanyMasterRow.Comp_Incorp_Date = Utility_FA.StringToDate(txtIncorporationDate.Text);
                        ObjCompanyMasterRow.Comp_Incorp_Date = DateTime.Now;
                    ObjCompanyMasterRow.Default_Currency = -1;//handled in Updation SP
                    ObjCompanyMasterRow.FinancialYear = txtFinancialYear.Text;
                    ObjCompanyMasterRow.Group_code = txtGroupCompanyCode.Text;
                    ObjCompanyMasterRow.Group_name = txtGroupCompanyName.Text;
                    ObjCompanyMasterRow.Cont_Per_Name = txtContactPersonName.Text;
                    ObjCompanyMasterRow.Cont_Per_Designation = txtContactPersonDesignation.Text;
                    ObjCompanyMasterRow.Cont_Per_Address = txtContactAddress.Text;
                    ObjCompanyMasterRow.Cont_Per_Mobile = txtMobileNumber.Text;
                    ObjCompanyMasterRow.Cont_Per_Phone = txtContactPhoneNumber.Text;
                    ObjCompanyMasterRow.Cont_Per_Email = txtContactEmailID.Text;

                    string strFa_Type = FAClsPubConfigReader.FunPubReadConfig("FA_APPLN_TYPE");
                    string strS3G_Type = FAClsPubConfigReader.FunPubReadConfig("S3G_APPLN_TYPE");

                    if (!string.IsNullOrEmpty(strFa_Type))
                        ObjCompanyMasterRow.FA_APPLN_TYPE = strFa_Type;
                    if (!string.IsNullOrEmpty(strS3G_Type))
                        ObjCompanyMasterRow.S3G_APPLN_TYPE = strS3G_Type;
                    //Code added by saran tohandle application type dynamic end



                    ObjCompanyMasterRow.SA_UserName = txtSysUserName.Text;
                    ObjCompanyMasterRow.SA_Password = FAClsPubCommCrypto.EncryptText(txtSysPassword.Text);
                    ObjCompanyMasterRow.Comp_Status = true;
                    if (intCompanyId > 0)
                    {
                        ObjCompanyMasterRow.XMLCompanyCurrency = grvCurrencyDtls.FunPubFormXml_FA();
                        if (ViewState["dtCompanyLocationdetails"] != null)
                        {
                            dtCompanyLocationdetails = (DataTable)ViewState["dtCompanyLocationdetails"];
                        }
                        if (dtCompanyLocationdetails.Rows.Count > 0)
                        {
                            if (dtCompanyLocationdetails.Rows[0]["Location_ID"].ToString() != string.Empty)
                            {
                                ObjCompanyMasterRow.XMLLocationCurrency = grvLocationCurrency.FunPubFormXml_FA();
                            }
                            else
                            {
                                ObjCompanyMasterRow.XMLLocationCurrency = "<Root></Root>";
                            }
                        }
                        else
                        {
                            ObjCompanyMasterRow.XMLLocationCurrency = "<Root></Root>";
                        }
                        
                        ObjCompanyMasterRow.Modified_By = intUserId;

                    }
                    else
                    {
                        ObjCompanyMasterRow.Created_By = intUserId;
                    }
                    ObjFA_SYS_CompanyMasterDataTable.AddFA_SYS_CompanyMasterRow(ObjCompanyMasterRow);
                    objCompanyMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
                    if (intCompanyId > 0)
                    {
                        intErrCode = objCompanyMasterClient.FunPubUpdateCompanyMaster(SerMode, FAClsPubSerialize.Serialize(ObjFA_SYS_CompanyMasterDataTable, SerMode), strConnectionName);
                    }
                    else
                    {
                        intErrCode = objCompanyMasterClient.FunPubInsertCompanyMaster(SerMode, FAClsPubSerialize.Serialize(ObjFA_SYS_CompanyMasterDataTable, SerMode), strConnectionName);
                    }

                    if (intErrCode == 111 || intErrCode == 112)//Error Code 111 -insertion 112-updation successfully
                    {
                        Session.Abandon();
                        strMode = "M";//given for both create and modify mode to redirect to Login page.
                        Utility_FA.FunShowValidationMsg_FA(this, intErrCode, strRedirectPageView, strRedirectPageView, strMode, false);

                    }
                    else
                    {
                        strRedirectPageView = "";
                        Utility_FA.FunShowValidationMsg_FA(this, intErrCode, strRedirectPageView, strRedirectPageView, strMode, true);

                    }

                }

            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to load Default currency dropdown, Currency details grid and location Currency details.
    /// </summary>
    private void FunPriLoadControls()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            DataSet DS = new DataSet();
            DS = Utility_FA.GetDataset(SPNames.FA_SYS_GET_COMPANYDETAILS, Procparam);
            if (DS != null)
            {
                if (DS.Tables[0].Rows.Count > 0)
                {
                    FunPriGetCompanyDetails(DS.Tables[0]);
                }
                if (DS.Tables[1].Rows.Count > 0)
                {
                    grvCurrencyDtls.DataSource = DS.Tables[1];
                    grvCurrencyDtls.DataBind();
                }
                if (DS.Tables[2].Rows.Count > 0)
                {
                    grvLocationCurrency.DataSource = DS.Tables[2];
                    grvLocationCurrency.DataBind();
                    ViewState["dtCompanyLocationdetails"] = DS.Tables[2];
                }
                else
                {
                    FunLoadGridInsert();
                }
                FunPriLoadFooterLocationGrid();
                FunPriLoadFooterCurrency();
            }

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// This method is used to empty the grid.
    /// In create mode,this method is used to bind the Datarow to show the footer Row.
    /// </summary>
    public void FunLoadGridInsert()
    {

        try
        {
            DataRow drEmptyRow;
            dtCompanyLocationdetails = new DataTable();

            dtCompanyLocationdetails.Columns.Add("Location_Name");
            dtCompanyLocationdetails.Columns.Add("Location_ID");
            dtCompanyLocationdetails.Columns.Add("Currency_Name");
            dtCompanyLocationdetails.Columns.Add("Currency_ID");
            drEmptyRow = dtCompanyLocationdetails.NewRow();
            dtCompanyLocationdetails.Rows.Add(drEmptyRow);
            ViewState["dtCompanyLocationdetails"] = dtCompanyLocationdetails;
            FunFillgrid(dtCompanyLocationdetails);
            grvLocationCurrency.Rows[0].Visible = false;
            FunPriLoadFooterLocationGrid();
            FunPriLoadFooterCurrency();

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            dtCompanyLocationdetails.Dispose();
            dtCompanyLocationdetails = null;
        }
    }

    //To fill the Grid
    /// <summary>
    /// This method is used to load the datatable to a grid.
    /// Here argument is used as datatable to bind the grid.
    /// </summary>
    /// <param name="dtparameterdetails"></param>
    private void FunFillgrid(DataTable dtCompanyLocationdetails)
    {
        try
        {
            grvLocationCurrency.DataSource = dtCompanyLocationdetails;
            grvLocationCurrency.DataBind();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// 
    /// </summary>
    private void FunPriLoadFooterLocationGrid()
    {
        try
        {
            if (grvLocationCurrency != null)
            {
                if (grvLocationCurrency.FooterRow != null)
                {
                    DropDownList ddlLocation = (DropDownList)grvLocationCurrency.FooterRow.FindControl("ddlLocation");
                    DropDownList ddldefaultCurrency = (DropDownList)grvLocationCurrency.FooterRow.FindControl("ddldefaultCurrency");
                    Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Option", "1");
                    Procparam.Add("@Company_ID", intCompanyId.ToString());
                    ddlLocation.BindDataTable_FA(SPNames.FA_SYS_GET_COMPANY_DDLIST, Procparam, new string[] { "Location_Id", "Location_Name" });
                }
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadFooterCurrency()
    {
        try
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("Currency_Id");
            dt.Columns.Add("Currency_Name");
            if (dt.Rows.Count > 0)
                dt.Rows.Clear();
            if (grvCurrencyDtls != null && grvLocationCurrency != null)
            {
                if (grvCurrencyDtls.Rows.Count > 0)
                {
                    foreach (GridViewRow gr in grvCurrencyDtls.Rows)
                    {
                        CheckBox chkCompanyCurrency = (CheckBox)gr.FindControl("chkCompanyCurrency");
                        Label lblCurrencyName = (Label)gr.FindControl("lblCurrencyName");
                        Label lblCurrencyID = (Label)gr.FindControl("lblCurrencyID");
                        if (chkCompanyCurrency.Checked)
                        {
                            dr = dt.NewRow();
                            dr["Currency_Id"] = lblCurrencyID.Text;
                            dr["Currency_Name"] = lblCurrencyName.Text;
                            dt.Rows.Add(dr);
                        }
                    }
                }
            }
            if (grvLocationCurrency.FooterRow != null)
            {
                DropDownList ddldefaultCurrency = (DropDownList)grvLocationCurrency.FooterRow.FindControl("ddldefaultCurrency");
                ddldefaultCurrency.FillDataTable(dt, "Currency_Id", "Currency_Name");
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    /// <summary>
    /// This method is used to Clear_FA the Company Master.
    /// </summary>
    private void FunPriClearDetails()
    {
        try
        {
            txtCompanyCode.Text = txtCompanyName.Text =
                txtGroupCompanyCode.Text = txtGroupCompanyName.Text = txtPANTAXNumber.Text = txtTINNumber.Text =
                txtIncorporationDate.Text = txtContactPersonName.Text = txtContactPersonDesignation.Text =
                txtSysUserName.Text = txtSysPassword.Text = txtHeadOfficeAddress.Text = txtHeadOfficeEmailID.Text = txtHeadOfficePhoneNumber.Text =
                txtCommAddress.Text = txtCommEmailID.Text = txtCommPhoneNumber.Text = txtCommPhoneNumber.Text = txtContactAddress.Text =
                txtContactPhoneNumber.Text = txtContactEmailID.Text = "";
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #region FieldDisable
    private void FunPriDisableControls(int intMode)
    {
        try
        {
            switch (intMode)
            {
                case 0:
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    break;
                case 1:
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    txtFinancialYear.ReadOnly = true;
                    txtCompanyCode.ReadOnly =
                    txtGroupCompanyCode.ReadOnly =
                    txtIncorporationDate.ReadOnly =
                    txtSysPassword.ReadOnly =
                    txtSysUserName.ReadOnly = true;
                    imgCalIncorpDate.Visible = false;
                    CalendarExtender1.Enabled = false;
                    //Issues in Encrypt/Decrypt
                    RFVtxtSysPassword.Enabled = false;
                    btnClear.Enabled = false;
                    //Currency Level
                    if (ObjFASession.ProCurrencyLevelIDRW == 0)//Company_Level
                    {
                        PnlLocationCurrency.Visible = false;
                    }


                    break;
                case -1:
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    txtCompanyCode.ReadOnly = txtCompanyName.ReadOnly =
                    txtGroupCompanyCode.ReadOnly = txtGroupCompanyName.ReadOnly = txtPANTAXNumber.ReadOnly = txtTINNumber.ReadOnly =
                    txtIncorporationDate.ReadOnly = txtFinancialYear.ReadOnly = txtContactPersonName.ReadOnly = txtContactPersonDesignation.ReadOnly =
                    txtSysUserName.ReadOnly = txtSysPassword.ReadOnly = txtHeadOfficeAddress.ReadOnly = txtHeadOfficeEmailID.ReadOnly = txtHeadOfficePhoneNumber.ReadOnly =
                    txtCommAddress.ReadOnly = txtCommEmailID.ReadOnly = txtCommPhoneNumber.ReadOnly = txtCommPhoneNumber.ReadOnly = txtContactAddress.ReadOnly =
                    txtContactPhoneNumber.ReadOnly = txtContactEmailID.ReadOnly = true;
                    btnClear.Enabled = false;
                    btnSave.Enabled = false;
                    //Currency Level
                    if (ObjFASession.ProCurrencyLevelIDRW == 0)//Company_Level
                    {
                        PnlLocationCurrency.Visible = false;
                    }
                    break;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    #endregion

    #endregion

    #region Button Events(Save/Cancel/Clear_FA)

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriInsertCompanyDetails();
        }
        //catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    CVCompanyMaster.ErrorMessage = objFaultExp.Detail.ProReasonRW;
        //    CVCompanyMaster.IsValid = false;
        //}
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Error in Saving.";
            CVCompanyMaster.IsValid = false;
        }
        finally
        {
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriClearDetails();
        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable To Clear_FA.";
            CVCompanyMaster.IsValid = false;
        }

    }


    /// <summary>
    /// Cancel
    /// </summary>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/Common/HomePage.aspx");
        }
        catch (Exception ex)
        {
            CVCompanyMaster.ErrorMessage = "Unable To Cancel.";
            CVCompanyMaster.IsValid = false;
        }
    }


    #endregion


}
