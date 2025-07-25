#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Company Creation
/// Created By			: Nataraj Y
/// Created Date		: 07-May-2010
/// Purpose	            : 
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 07-May-2010
/// Reason              : System Admin Module Developement
/// Last Updated By		: Nataraj Y
/// Last Updated Date   : 10-May-2010
/// Reason              : System Admin Company Module Developement
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Text;
#endregion


public partial class System_Admin_S3GSysAdminCompanyMaster_Add : ApplyThemeForProject
{
    #region Intialization
    int intErrCode = 0;
    int intCompanyId = 0;
    int intUserId = 0;
    bool bModify = false;
    UserInfo ObjUserInfo;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    string strMode;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminCompanyMaster_View.aspx';";
    //string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminCompanyMaster_Add.aspx';";
    CompanyMgtServicesReference.CompanyMgtServicesClient objCompanyMasterClient;
    string strDateFormat;
    S3GSession ObjS3GSession = new S3GSession();
    CompanyMgtServices.S3G_SYSAD_CompanyMaster_CUDataTable ObjS3G_SYSAD_CompanyMaster_CUDataTable = new CompanyMgtServices.S3G_SYSAD_CompanyMaster_CUDataTable();
    CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable ObjS3G_SYSAD_CompanyMasterDataTable = new CompanyMgtServices.S3G_SYSAD_CompanyMasterDataTable();
    CompanyMgtServices.S3G_SYSAD_CompanyMaster_ViewDataTable ObjS3G_CompanyMaster_ViewDataTable = new CompanyMgtServices.S3G_SYSAD_CompanyMaster_ViewDataTable();
    SerializationMode SerMode = SerializationMode.Binary;
    Dictionary<string, string> Procparam = null;

    #endregion

    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {

        ObjUserInfo = new UserInfo();
        //S3GSession ObjS3GSession = new S3GSession();
        //if (Request.QueryString["qsCmpnyId"] != null)
        intCompanyId = ObjUserInfo.ProCompanyIdRW;//Convert.ToInt32(Request.QueryString["qsCmpnyId"]);
        System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyId.ToString();
        intUserId = ObjUserInfo.ProUserIdRW;
        txtRemarks.Attributes.Add("onchange", "maxlengthfortxt(60);");
        string strPassword = txtSystemAdminPwd.Text;
        string strRedirectPage;
        txtSystemAdminPwd.Attributes.Add("value", strPassword);
        strDateFormat = ObjS3GSession.ProDateFormatRW;
        bModify = ObjUserInfo.ProModifyRW;
        bQuery = ObjUserInfo.ProViewRW;
        bCreate = ObjUserInfo.ProCreateRW;
        bIsActive = ObjUserInfo.ProIsActiveRW;
        bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
        //CalendarExtender1.Format = CultureInfo.CurrentCulture.DateTimeFormat.ShortDatePattern;
        CalendarExtender1.Format = strDateFormat;
        cexValdityOfRegNumber.Format = strDateFormat;
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);


        FunSetComboBoxAttributes(txtOtherCountry, "Country", "60");

        txtDateOfIncorp.Attributes.Add("onchange", "fnDoDate(this,'" + txtDateOfIncorp.ClientID + "','" + strDateFormat + "',true,  false);");
        txtValdityOfRegNumber.Attributes.Add("onchange", "fnDoDate(this,'" + txtValdityOfRegNumber.ClientID + "','" + strDateFormat + "',false,true);");
        if (!IsPostBack)
        {

            //FunGetScreenModifyAccess();
            txtPanNumber.Attributes.Add("maxlength", "20");

            //txtDateOfIncorp.Attributes.Add("readonly", "readonly");
            //txtValdityOfRegNumber.Attributes.Add("readonly", "readonly");

            FunProLoadAddressCombos();
            if (intCompanyId > 0)
            {
                FunPriCompany();

                if (!bIsActive)
                {

                    FunPriDisableControls(-1);
                    btnSave.Enabled_False();
                    //btnClear.Enabled = false;
                    btnCancel.Enabled_False();
                    ////btnDelete.Enabled = false;
                }
                else
                {

                    //if (bMakerChecker)
                    //{
                    //    if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(hdnUserId.Value), Convert.ToInt32(hdnUserLevelId.Value))))
                    //    {
                    //        strMode = "M";
                    //    }
                    //    else
                    //    {
                    //        strMode = "Q";
                    //    }
                    //}
                    //else
                    //{
                    if ((bModify) && (ObjUserInfo.ProUserLevelIdRW == 5))
                    {
                        strMode = "M";
                    }
                    else
                    {
                        strMode = "Q";
                    }
                    //}

                }
            }
            if (strMode == "M")
            {
                FunPriDisableControls(1);
            }
            else if (strMode == "Q")
            {
                FunPriDisableControls(-1);
            }
            else
            {
                //FunPriCompany();
                FunPriDisableControls(0);
            }

            FunGetScreenModifyAccess();
            //ucBasicDetAddressSetup.ReadOnly(true);
            ucBasicDetAddressSetup.ValGroup("Basic Details");
            ucOtherDetAddressSetup.ValGroup("Basic Details");
            txtCompanyName.Focus();
        }

    }
    #endregion

    protected void FunSetComboBoxAttributes(AjaxControlToolkit.ComboBox cmb, string Type, string maxLength)
    {
        TextBox textBox = cmb.FindControl("TextBox") as TextBox;

        if (textBox != null)
        {
            textBox.Attributes.Add("onkeyup", "maxlengthfortxt('" + maxLength + "');fnCheckSpecialChars('true');");
            textBox.Attributes.Add("onblur", "funCheckFirstLetterisNumeric(this, '" + Type + "');");
        }
    }

    #region Page Events
    /// <summary>
    /// Next button event to move to next Tab
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    //protected void btnNext_Click(object sender, EventArgs e)
    //{
    //    if (tcCompanyCreation.ActiveTabIndex != tcCompanyCreation.Tabs.Count - 1)
    //    {
    //        tcCompanyCreation.ActiveTabIndex = tcCompanyCreation.ActiveTabIndex + 1;
    //    }
    //    btnNext.Focus();
    //}
    ///// <summary>
    ///// Previous button event to move to previous tabs by getting curent tab index
    ///// </summary>
    ///// <param name="sender"></param>
    ///// <param name="e"></param>
    //protected void btnPrev_Click(object sender, EventArgs e)
    //{
    //    if (tcCompanyCreation.ActiveTabIndex != 0)
    //    {
    //        tcCompanyCreation.ActiveTabIndex = tcCompanyCreation.ActiveTabIndex - 1;
    //    }
    //    btnPrev.Focus();
    //}
    /// <summary>
    /// Save button event to insert and update record inser or update Service is called based on querystring 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            lblErrorMessage.InnerText = string.Empty;

            if (CheckZeroValidate(txtCompanyCode.Text))
            {
                if (CheckZeroValidate(txtCompanyName.Text))
                {
                    if (txtSystemAdminPwd.Text.IsValidPassword())
                    {
                        if (Utility.CompareDates(txtDateOfIncorp.Text, txtValdityOfRegNumber.Text) == 1)
                        {
                            if (ucBasicDetAddressSetup.IsPostalCode_Mandatory)
                            {
                                if (ucBasicDetAddressSetup.PostalCode_Text == "" || ucBasicDetAddressSetup.PostalCode_Text == string.Empty)
                                {

                                    //Utility.FunShowAlertMsg(this.Page, "Select the " + ucBasicDetAddressSetup.PostalCode_Label);
                                    Utility.FunShowValidationMsg(this, "SA_COM", 1, "", "", "", false, ucBasicDetAddressSetup.PostalCode_Label + " in Basic Details Tab", true);
                                    return;
                                }
                            }
           
                            if (ucOtherDetAddressSetup.IsPostalCode_Mandatory)
                            {
                                if (ucOtherDetAddressSetup.PostalCode_Text == "" || ucOtherDetAddressSetup.PostalCode_Text == string.Empty)
                                {

                                    //Utility.FunShowAlertMsg(this.Page, "Select the " + ucBasicDetAddressSetup.PostalCode_Label);
                                    Utility.FunShowValidationMsg(this, "SA_COM", 1, "", "", "", false, ucOtherDetAddressSetup.PostalCode_Label + " in Other Details Tab", true);
                                    return;
                                }
                            }


                            if (txtRemarks.Text == string.Empty || txtRemarks.Text.ToString() == "")
                            {
                                Utility.FunShowAlertMsg(this.Page, "Enter the Remarks.");
                                return;
                            }

                            CompanyMgtServices.S3G_SYSAD_CompanyMaster_CURow ObjCompanyMasterRow;
                            ObjCompanyMasterRow = ObjS3G_SYSAD_CompanyMaster_CUDataTable.NewS3G_SYSAD_CompanyMaster_CURow();
                            ObjCompanyMasterRow.Company_ID = intCompanyId;
                            ObjCompanyMasterRow.Accounting_Currency = txtAccCurrency.Text.Trim();
                            //ObjCompanyMasterRow.Address1 = txtAddress.Text.Trim();
                            //ObjCompanyMasterRow.Address2 = txtAddress2.Text.Trim();
                            //ObjCompanyMasterRow.City = txtCity.SelectedItem.Text.Trim(); //txtCity.Text;
                            //ObjCompanyMasterRow.State = txtState.SelectedItem.Text.Trim();
                            ObjCompanyMasterRow.CD_CEO_Head_Name = txtHeadName.Text.Trim();
                            ObjCompanyMasterRow.CD_Email_ID = txtEmailId.Text.Trim();
                            ObjCompanyMasterRow.CD_Mobile_Number = txtMobileNumber.Text.Trim();
                            ObjCompanyMasterRow.CD_Sys_Admin_User_Code = txtSystemAdminUser.Text.Trim();
                            ObjCompanyMasterRow.CD_Sys_Admin_User_Password = ClsPubCommCrypto.EncryptText(txtSystemAdminPwd.Text.Trim());
                            ObjCompanyMasterRow.CD_Telephone_Number = txtTeleNumber.Text.Trim();
                            ObjCompanyMasterRow.CD_Website = txtWebsite.Text.Trim();
                            ObjCompanyMasterRow.Company_Code = txtCompanyCode.Text.Trim();
                            ObjCompanyMasterRow.Company_Name = txtCompanyName.Text.Trim();
                            ObjCompanyMasterRow.Constitutional_Status_Id = Convert.ToInt32(ddlConstitutionalStatus.SelectedItem.Value);
                            ObjCompanyMasterRow.Country = txtCountry.SelectedItem.Text.Trim();
                            ObjCompanyMasterRow.Create_By = intUserId;
                            ObjCompanyMasterRow.is_Active = chkboxActive.Checked;
                            ObjCompanyMasterRow.Modified_By = intUserId;
                            ObjCompanyMasterRow.OD_Country = txtOtherCountry.Text.Trim();
                            ObjCompanyMasterRow.OD_Date_Of_Incorporation = Utility.StringToDate(txtDateOfIncorp.Text.Trim());
                            ObjCompanyMasterRow.OD_Income_Tax_PAN_Number = txtPanNumber.Text.Trim();
                            ObjCompanyMasterRow.OD_Reg_Lic_Number = txtRegNumber.Text.Trim();
                            ObjCompanyMasterRow.OD_Remarks = txtRemarks.Text.Trim();
                            ObjCompanyMasterRow.OD_Validity_Of_Reg_Lic_Number = Utility.StringToDate(txtValdityOfRegNumber.Text.Trim());
                            ObjCompanyMasterRow.Prev_CBO_Data_Prov_ID = txtPrevCBODataProvID.Text.Trim();
                            ObjCompanyMasterRow.CBO_Data_Prov_ID = txtCBODataProvID.Text;
                            ObjCompanyMasterRow.SetCreate_OnNull();
                            ObjCompanyMasterRow.SetModified_OnNull();
                            ObjCompanyMasterRow.XML_Basic_Address_Values = FunProFormBasicAddressXML();
                            ObjCompanyMasterRow.XML_OD_Address_Values = FunProFormODAddressXML();
                            ObjS3G_SYSAD_CompanyMaster_CUDataTable.AddS3G_SYSAD_CompanyMaster_CURow(ObjCompanyMasterRow);

                            objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();

                            if (intCompanyId > 0)
                            {
                                // if (FunPriCheckValidPinCode(txtOtherPin.Text, strType) && FunPriCheckValidPinCode(txtPinCode.Text, strType))
                                // {

                                intErrCode = objCompanyMasterClient.FunPubModifyCompany(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_CompanyMaster_CUDataTable, SerMode));
                                // }
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Enter a valid PIN code');", true);
                                //}
                            }
                            else
                            {
                                intErrCode = objCompanyMasterClient.FunPubCreateCompany(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_CompanyMaster_CUDataTable, SerMode));
                            }

                            if (intErrCode == 0)
                            {
                                if (intCompanyId > 0)
                                {
                                    //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                                    btnSave.Enabled_False();
                                    //End here
                                    strAlert = strAlert.Replace("__ALERT__", "Company details updated successfully");
                                    //ObjUserInfo.ProCountryNameR = txtCountry.Text;
                                    //ObjUserInfo.ProCompanyNameRW = txtCompanyName.Text;
                                    //Session.Abandon();
                                    // strRedirectPageView = "window.location.href='../LoginPage.aspx'";
                                    //Response.Redirect("~/System Admin/S3GSysAdminCompanyMaster_View.aspx");
                                }
                                else
                                {
                                    //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                                    btnSave.Enabled_False();
                                    //End here
                                    strAlert = strAlert.Replace("__ALERT__", @"Company details added successfully.\n\n Relogin using system admin credentials to proceed further");
                                    //Session.Abandon();
                                    //strRedirectPageView = "window.location.href='../LoginPage.aspx'";
                                    //Response.Redirect("~/System Admin/S3GSysAdminCompanyMaster_View.aspx");

                                }
                            }
                            else if (intErrCode == 1)
                            {
                                strAlert = strAlert.Replace("__ALERT__", "Company Code already exists in the system. kindly enter a new Company Code");
                                strRedirectPageView = "";
                            }
                            else if (intErrCode == 2)
                            {
                                strAlert = strAlert.Replace("__ALERT__", "Company Name already exists in the system. kindly enter a new Company Name");
                                strRedirectPageView = "";
                            }
                            else if (intErrCode == 3)
                            {
                                strAlert = strAlert.Replace("__ALERT__", "Income Tax Number/PAN already exists in the system. kindly enter a new Income Tax Number/PAN");
                                strRedirectPageView = "";
                            }
                            else if (intErrCode == 4)
                            {
                                strAlert = strAlert.Replace("__ALERT__", "Registration Number/Licence Number already exists in the system. kindly enter a new Registration Number/Licence Number");
                                strRedirectPageView = "";
                            }
                            else if (intErrCode == 5)
                            {
                                strAlert = strAlert.Replace("__ALERT__", "System admin user code already exists in the system. kindly enter a new System admin");
                                strRedirectPageView = "";
                            }
                            else
                            {
                                strAlert = strAlert.Replace("__ALERT__", "Unexpected error in processing your request!");
                                strRedirectPageView = "";
                                lblErrorMessage.InnerText = "Unexpected error in processing your request!";
                            }
                            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                            //Utility.FunShowAlertMsg(this.Page, strAlert + strRedirectPage);
                            lblErrorMessage.InnerText = string.Empty;
                            Session.Abandon();

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Validity of Registration/Licence Number should be greater than date of incorporation');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Please enter a valid Password');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Please enter a valid Company Name');", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Please enter a valid Company Code');", true);
            }
            btnSave.Focus();
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        finally
        {
            if (objCompanyMasterClient != null)
            {
                objCompanyMasterClient.Close();
            }
        }

    }
    /// <summary>
    /// Delete butoon event to delete a record
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {

            CompanyMgtServices.S3G_SYSAD_CompanyMasterRow ObjCompanyMasterRow;
            ObjCompanyMasterRow = ObjS3G_SYSAD_CompanyMasterDataTable.NewS3G_SYSAD_CompanyMasterRow();
            ObjCompanyMasterRow.Company_ID = intCompanyId;
            ObjS3G_SYSAD_CompanyMasterDataTable.AddS3G_SYSAD_CompanyMasterRow(ObjCompanyMasterRow);
            SerializationMode SerMode = SerializationMode.Binary;
            objCompanyMasterClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            intErrCode = objCompanyMasterClient.FunPubDeleteCompany(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_CompanyMasterDataTable, SerMode));
            if (intErrCode == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Error", "alert('Error During Company deletion');", true);

            }
            else if (intErrCode == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Delete", "alert('Company details deleted successfully');window.location.href='../System Admin/S3GSysAdminCompanyMaster_View.aspx';", true);
            }
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        finally
        {
            if (objCompanyMasterClient != null)
            {
                objCompanyMasterClient.Close();
            }
        }
    }
    /// <summary>
    /// Casncel butoon event to move back to View page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/System Admin/S3GSysAdminCompanyMaster_View.aspx");
        btnCancel.Focus();
    }
    /// <summary>
    /// Clears all the record on confirmation 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtAccCurrency.Text = "";
        txtHeadName.Text = "";
        txtEmailId.Text = "";
        txtMobileNumber.Text = "";
        txtSystemAdminUser.Text = "";
        txtSystemAdminPwd.Attributes.Add("value", "");
        txtTeleNumber.Text = "";
        txtWebsite.Text = "";
        txtCompanyCode.Text = "";
        txtCompanyName.Text = "";
        ddlConstitutionalStatus.SelectedIndex = 0;
        txtCountry.Text = ""; ;
        chkboxActive.Checked = false;
        txtOtherCountry.Text = "";
        txtDateOfIncorp.Text = "";
        txtPanNumber.Text = "";
        txtRegNumber.Text = "";
        txtRemarks.Text = "";
        txtValdityOfRegNumber.Text = "";
        //btnClear.Focus();
    }
    /// <summary>
    /// Event for Basic details Country name since we need to enable and disable 
    /// PAN Number Masked Editor for Countries other than India
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtCountry_TextChanged(object sender, EventArgs e)
    {
        if (txtCountry.Text.Trim().ToLower() != "india")
        {
            //mskexPanNumber.Enabled = false;
            revtxtPanNumber.ValidationExpression = @"^[a-zA-Z_0-9](\w|\W)*";
            revtxtPanNumber.ErrorMessage = "Enter a valid Income Tax Number";
        }
        else
        {
            //mskexPanNumber.Enabled = true;
            revtxtPanNumber.ValidationExpression = @"^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}$";
            revtxtPanNumber.ErrorMessage = "Income Tax/PAN Number should be of format AAAAA9999A";

        }
        txtPanNumber.Attributes.Add("maxlength", "20");
        txtPanNumber.Focus();
    }


    #endregion

    #region Page Methods

    protected void FunProLoadAddressCombos()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            if (intCompanyId > 0)
            {
                Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            }
            DataTable dtAddr = Utility.GetDefaultData("S3G_SYSAD_GetAddressLoodup", Procparam);

            DataTable dtSource = new DataTable();
            if (dtAddr.Select("Category = 1").Length > 0)
            {
                dtSource = dtAddr.Select("Category = 1").CopyToDataTable();
            }
            else
            {
                dtSource = FunProAddAddrColumns(dtSource);
            }

            dtSource = new DataTable();
            if (dtAddr.Select("Category = 2").Length > 0)
            {
                dtSource = dtAddr.Select("Category = 2").CopyToDataTable();
            }
            else
            {
                dtSource = FunProAddAddrColumns(dtSource);
            }

            dtSource = new DataTable();
            if (dtAddr.Select("Category = 3").Length > 0)
            {
                dtSource = dtAddr.Select("Category = 3").CopyToDataTable();
            }
            else
            {
                dtSource = FunProAddAddrColumns(dtSource);
            }
            txtCountry.FillDataTable(dtSource, "Name", "Name", false);
            txtOtherCountry.FillDataTable(dtSource, "Name", "Name", false);
            //txtStateName.BindDataTable("S3G_SYSAD_GetAddressLoodup", Procparam, new string[] { "ID", "Name" });
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        finally
        {
            if (objCompanyMasterClient != null)
            {
                objCompanyMasterClient.Close();
            }
        }
    }

    protected DataTable FunProAddAddrColumns(DataTable dt)
    {
        dt.Columns.Add("ID");
        dt.Columns.Add("Name");
        dt.Columns.Add("Category");

        return dt;
    }

    /// <summary>
    /// This method is used to display product details
    /// </summary>
    private void FunPriGetCompanyDetails()
    {
        try
        {

            DataSet ds = new DataSet();

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            ds = Utility.GetDataset("S3G_Get_Company_Details", Procparam);
            if (ds.Tables.Count > 0)
            {
                #region Tab1 Controls (Basic Details)

                txtCompanyCode.Text = ds.Tables[0].Rows[0]["Company_Code"].ToString();
                txtCompanyName.Text = ds.Tables[0].Rows[0]["Company_Name"].ToString();
                txtCountry.Text = ds.Tables[0].Rows[0]["Country"].ToString();


                //Binding Address Object Start
                ucBasicDetAddressSetup.BindAddressSetupDetails(1);
                ucOtherDetAddressSetup.BindAddressSetupDetails(2);

                if (ds.Tables[0].Rows.Count > 0)
                {

                    ucBasicDetAddressSetup.SetAddressDetails(ds.Tables[0].Rows[0]);
                }
                if (ds.Tables[1].Rows.Count > 0)
                {
                    ucOtherDetAddressSetup.PostalCode_Text = null;
                    ucOtherDetAddressSetup.PostalCode_Value = null;
                    

                    ucOtherDetAddressSetup.SetAddressDetails(ds.Tables[1].Rows[0]);
                }
                //Binding Address Object End

                txtPrevCBODataProvID.Text = ds.Tables[0].Rows[0]["Prev_CBO_Data_Prov_ID"].ToString();
                txtCBODataProvID.Text = ds.Tables[0].Rows[0]["CBO_Data_Prov_ID"].ToString();
            }


            if (txtCountry.Text.Trim().ToLower() != "india")
            {
                //mskexPanNumber.Enabled = false;
                revtxtPanNumber.ValidationExpression = @"^[a-zA-Z_0-9](\w|\W)*";
                revtxtPanNumber.ErrorMessage = "Enter a valid Income Tax Number";
            }
            else
            {
                revtxtPanNumber.ValidationExpression = @"^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}$";
                revtxtPanNumber.ErrorMessage = "Income Tax/PAN Number should be of format AAAAA9999A";

            }
            txtCountry.Attributes.Add("maxlength", "20");

            ddlConstitutionalStatus.SelectedValue = ds.Tables[0].Rows[0]["Constitutional_Status_Id"].ToString();
            if (ds.Tables[0].Rows[0]["Active"].ToString() == "True")
                chkboxActive.Checked = true;
            else
                chkboxActive.Checked = false;

            //hdnUserId.Value = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["Created_By"].ToString();
            //hdnUserLevelId.Value = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["User_Level_ID"].ToString();
                #endregion

            #region Tab2 Controls (Corporate Details)
            txtHeadName.Text = ds.Tables[0].Rows[0]["CD_CEO_Head_Name"].ToString();
            txtMobileNumber.Text = ds.Tables[0].Rows[0]["CD_Mobile_Number"].ToString();
            txtTeleNumber.Text = ds.Tables[0].Rows[0]["CD_Telephone_Number"].ToString();
            txtEmailId.Text = ds.Tables[0].Rows[0]["CD_Email_ID"].ToString();

            //revWebsite.ValidationExpression = @"www\.([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?";
            revWebsite.Enabled = false;

            txtWebsite.Text = ds.Tables[0].Rows[0]["CD_Website"].ToString();
            txtSystemAdminUser.Text = ds.Tables[0].Rows[0]["CD_Sys_Admin_User_Code"].ToString();
            //Added Inorder to set text for text box for which text mode is Password
            txtSystemAdminPwd.Attributes.Add("value", ClsPubCommCrypto.DecryptText(ds.Tables[0].Rows[0]["CD_Sys_Admin_User_Password"].ToString()));
            #endregion

            #region Tab3 Controls (Other Details)

            //txtCommunicationAdd.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_Communication_Address"].ToString();
            //txtAddress1.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_Address1"].ToString();
            //txtOtherCity.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_City"].ToString();
            //txtOtherState.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_State"].ToString();
            //txtOtherCountry.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_Country"].ToString();
            //txtOtherPin.Text = ObjS3G_CompanyMaster_ViewDataTable.Rows[0]["OD_Zip_Code"].ToString();

            txtDateOfIncorp.Text = DateTime.Parse(ds.Tables[0].Rows[0]["OD_Date_Of_Incorporation"].ToString(), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
            if (string.IsNullOrEmpty(txtDateOfIncorp.Text) == false)
            {
                CalendarExtender1.Enabled = false;
            }
            txtRegNumber.Text = ds.Tables[0].Rows[0]["OD_Reg_Lic_Number"].ToString();
            txtValdityOfRegNumber.Text = DateTime.Parse(Convert.ToString((ds.Tables[0].Rows[0]["OD_Validity_Of_Reg_Lic_Number"])), CultureInfo.CurrentCulture.DateTimeFormat).ToString(strDateFormat);
            txtPanNumber.Text = ds.Tables[0].Rows[0]["OD_Income_Tax_PAN_Number"].ToString();
            txtAccCurrency.Text = ds.Tables[0].Rows[0]["Accounting_Currency"].ToString();
            txtRemarks.Text = ds.Tables[0].Rows[0]["OD_Remarks"].ToString();
            #endregion


        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }
        finally
        {
            if (objCompanyMasterClient != null)
            {
                objCompanyMasterClient.Close();
            }
        }
    }
    //private void FunPriGetPinCode(int intCompany_Id)
    //{
    //    S3GAdminServicesReference.S3GAdminServicesClient ObjAdminService = null;

    //    try
    //    {
    //        Dictionary<string, string> dictProcParam = new Dictionary<string, string>();
    //        dictProcParam.Add("@Company_ID", intCompany_Id.ToString());
    //        ObjAdminService = new S3GAdminServicesReference.S3GAdminServicesClient();
    //        byte[] byteGlobalParamDetails = ObjAdminService.FunPubFillDropdown(SPNames.S3G_Get_GlobalParam_Details, dictProcParam);
    //        DataTable dtGlboalDetails = (DataTable)ClsPubSerialize.DeSerialize(byteGlobalParamDetails, SerMode, typeof(DataTable));
    //        strType = dtGlboalDetails.Rows[0]["Pincode_Field_Type"].ToString();
    //        txtOtherPin.MaxLength = Convert.ToInt32(dtGlboalDetails.Rows[0]["Pincode_Digits"].ToString());
    //        txtPinCode.MaxLength = Convert.ToInt32(dtGlboalDetails.Rows[0]["Pincode_Digits"].ToString());
    //    }
    //    catch (Exception)
    //    {
    //    }
    //    finally
    //    {
    //        ObjAdminService.Close();
    //    }
    //}

    //private bool FunPriCheckValidPinCode(string strPINCode, string strType)
    //{

    //    try
    //    {
    //        if (strPINCode.Length < txtOtherPin.MaxLength || strPINCode.Length > txtOtherPin.MaxLength)
    //        {
    //            return false;
    //        }



    //        string strUpper = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    //        string strLower = @"abcdefghijklmnopqrstuvwxyz";
    //        string strNo = "0123456789";

    //        char[] chArray = strPINCode.ToCharArray();

    //        bool blnUpperResult = false;
    //        bool blnLowerResult = false;
    //        bool blnNoResult = false;

    //        foreach (char ch in chArray)
    //        {

    //            blnUpperResult = (blnUpperResult == false) ? strUpper.IndexOf(ch) > 0 : blnUpperResult;
    //            blnLowerResult = (blnLowerResult == false) ? strLower.IndexOf(ch) > 0 : blnLowerResult;
    //            blnNoResult = (blnNoResult == false) ? strNo.IndexOf(ch) > 0 : blnNoResult;

    //        }
    //        switch (strType)
    //        {
    //            case "Alpha Numeric":
    //                blnResult = blnUpperResult | blnLowerResult | blnNoResult;
    //                break;
    //            case "Numeric":
    //                if (blnNoResult)
    //                {
    //                    if (blnUpperResult & blnLowerResult)
    //                    {
    //                        blnResult = false;
    //                    }
    //                    else blnResult = true;
    //                }
    //                else blnResult = false;
    //                break;
    //            default:
    //                blnResult = true;
    //                break;
    //        }

    //    }
    //    catch (Exception)
    //    {
    //        blnResult = false;
    //    }
    //    return blnResult;
    //}

    /// <summary>
    /// Checks weather the string has all zeors by converting to integer
    /// </summary>
    /// <param name="strVal">Gets the string needs to be checked for e.g. Textbox.Text can be an input</param>
    /// <returns>return true if its an Alpha numeric on number > 0 else return false</returns>
    private bool CheckZeroValidate(string strVal)
    {
        try
        {
            int val = Convert.ToInt32(strVal);
            if (val != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return true;
        }
    }

    protected void FunGetScreenModifyAccess()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@User_ID", Convert.ToString(intUserId));
            Procparam.Add("@Pgm_Code", "COMP_MAST");
            DataTable dt = Utility.GetDefaultData("S3G_SA_GET_SCREEN_ACCESS", Procparam);


            if (dt.Rows[0][0].ToString() == "0") //No Modify Access
            {
                FunPriDisableControls(-1);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    #endregion

    #region MCompany

    private void FunPriCompany()
    {
        if (intCompanyId > 0)
        {
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
            txtCompanyCode.ReadOnly = true;
            txtCompanyCode.Enabled = false;
            //btnDelete.Enabled = true;
            //btnClear.Enabled = false;
            FunPriGetCompanyDetails();
            // chkboxActive.Enabled = true;
            CalendarExtender1.Enabled = false;

        }
        else
        {
            FunPriDisableControls(0);

        }

    }

    #endregion

    #region FieldDisable
    private void FunPriDisableControls(int intMode)
    {
        switch (intMode)
        {

            case 0: //Create

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                txtCompanyCode.ReadOnly = false;
                ddlConstitutionalStatus.SelectedIndex = 0;
                chkboxActive.Checked = true;
                //btnDelete.Enabled = false;
                //btnClear.Enabled = true;
                //mskexPanNumber.Enabled = false;
                chkboxActive.Checked = true;
                chkboxActive.Enabled = false;
                break;
            case 1:
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                txtDateOfIncorp.ReadOnly = true;
                break;
            case -1: //Query
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                lblHeading.Text = "Company Master - View";
                ListItem lit;
                lit = new ListItem(ddlConstitutionalStatus.SelectedItem.Text, ddlConstitutionalStatus.SelectedItem.Value);
                ddlConstitutionalStatus.Items.Clear();
                ddlConstitutionalStatus.Items.Add(lit);
                txtCompanyCode.Enabled = true;
                txtCompanyCode.ReadOnly = true;
                txtCompanyName.ReadOnly = true;
                //btnDelete.Visible = false;
                //btnClear.Enabled = false;
                btnSave.Enabled_False();

                //txtState.ReadOnly = true;
                txtCountry.DropDownStyle = AjaxControlToolkit.ComboBoxStyle.DropDownList;
                //  txtCountry.ClearDropDownList();
                //txtCountry.ReadOnly = true;

                ddlConstitutionalStatus.Enabled = true;

                txtHeadName.ReadOnly = true;
                txtMobileNumber.ReadOnly = true;
                txtTeleNumber.ReadOnly = true;
                txtEmailId.ReadOnly = true;
                txtWebsite.ReadOnly = true;
                txtSystemAdminUser.ReadOnly = true;
                txtSystemAdminPwd.ReadOnly = true;
                chkboxActive.Enabled = false;
                txtOtherCountry.DropDownStyle = AjaxControlToolkit.ComboBoxStyle.DropDownList;
                // txtOtherCountry.ClearDropDownList();

                txtDateOfIncorp.ReadOnly = true;
                txtDateOfIncorp.Attributes.Remove("onchange");
                txtRegNumber.ReadOnly = true;
                txtValdityOfRegNumber.ReadOnly = true;
                txtValdityOfRegNumber.Attributes.Remove("onchange");
                txtPanNumber.ReadOnly = true;
                txtAccCurrency.ReadOnly = true;
                cexValdityOfRegNumber.Enabled = false;
                CalendarExtender1.Enabled = false;
                txtRemarks.ReadOnly = true;
                ucBasicDetAddressSetup.ReadOnly(true);
                ucOtherDetAddressSetup.ReadOnly(true);
                txtCBODataProvID.ReadOnly = true;
                txtPrevCBODataProvID.ReadOnly = true;
                break;
        }
    }
    #endregion

    #region Bind XML

    protected string FunProFormBasicAddressXML()
    {
        if (ucBasicDetAddressSetup.PostalCode_Text == "" || ucBasicDetAddressSetup.PostalCode_Text == "--Select--")
            ucBasicDetAddressSetup.PostalCode_Value = null;

        

        StringBuilder strbuXML = new StringBuilder();
        strbuXML.Append("<Root>");

        strbuXML.Append(" <Details Postal_Code='" + ucBasicDetAddressSetup.PostalCode_Value + "' Post_Box_No='" + ucBasicDetAddressSetup.PostBoxNo + "' Way_No='" + ucBasicDetAddressSetup.WayNo
                        + "' House_No='" + ucBasicDetAddressSetup.HouseNo + "' Block_No='" + ucBasicDetAddressSetup.BlockNo + "' Flat_No='" + ucBasicDetAddressSetup.FlatNo
                        + "' Land_Mark='" + ucBasicDetAddressSetup.LandMark + "' Area_Sheik='" + ucBasicDetAddressSetup.AreaSheik + "' Res_Phone_No='" + ucBasicDetAddressSetup.ResidencePhoneNo
                        + "' Res_Fax_No='" + ucBasicDetAddressSetup.ResidenceFaxNo + "' Mob_Phone_No='" + ucBasicDetAddressSetup.MobilePhoneNo + "' Cont_Name='" + ucBasicDetAddressSetup.ContactName
                        + "' Cont_No='" + ucBasicDetAddressSetup.ContactNo + "' Off_Phone_No='" + ucBasicDetAddressSetup.OfficePhoneNo + "' Off_Fax_No='" + ucBasicDetAddressSetup.OfficeFaxNo
                        + "' Cust_Email='" + ucBasicDetAddressSetup.CustomerEmail + "'/>");

        strbuXML.Append("</Root>");
        return strbuXML.ToString();
    }

    protected string FunProFormODAddressXML()
    {
        if (ucOtherDetAddressSetup.PostalCode_Text == "" || ucOtherDetAddressSetup.PostalCode_Text == "--Select--")
            ucOtherDetAddressSetup.PostalCode_Value = null;

        

        StringBuilder strbuXML = new StringBuilder();
        strbuXML.Append("<Root>");

        strbuXML.Append(" <Details Postal_Code='" + ucOtherDetAddressSetup.PostalCode_Value + "' Post_Box_No='" + ucOtherDetAddressSetup.PostBoxNo + "' Way_No='" + ucOtherDetAddressSetup.WayNo
                        + "' House_No='" + ucOtherDetAddressSetup.HouseNo + "' Block_No='" + ucOtherDetAddressSetup.BlockNo + "' Flat_No='" + ucOtherDetAddressSetup.FlatNo
                        + "' Land_Mark='" + ucOtherDetAddressSetup.LandMark + "' Area_Sheik='" + ucOtherDetAddressSetup.AreaSheik + "' Res_Phone_No='" + ucOtherDetAddressSetup.ResidencePhoneNo
                        + "' Res_Fax_No='" + ucOtherDetAddressSetup.ResidenceFaxNo + "' Mob_Phone_No='" + ucOtherDetAddressSetup.MobilePhoneNo + "' Cont_Name='" + ucOtherDetAddressSetup.ContactName
                        + "' Cont_No='" + ucOtherDetAddressSetup.ContactNo + "' Off_Phone_No='" + ucOtherDetAddressSetup.OfficePhoneNo + "' Off_Fax_No='" + ucOtherDetAddressSetup.OfficeFaxNo
                        + "' Cust_Email='" + ucOtherDetAddressSetup.CustomerEmail + "'/>");

        strbuXML.Append("</Root>");
        return strbuXML.ToString();
    }

    #endregion


    [System.Web.Services.WebMethod]
    public static string[] GetAddressPostalCodeList(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();

        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());

        Procparam.Add("@Type", "1");

        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SYSAD_GET_ADD_SETUP_LOOKUP", Procparam));
        return suggetions.ToArray();

    }
    

    protected void txtValdityOfRegNumber_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtValdityOfRegNumber.Text))
        {
            //if (Utility.StringToDate(txtValdityOfRegNumber.Text) <= Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
            //{
            //    Utility.FunShowAlertMsg(this, "Selected date cannot be less than or equal to system date.");
            //    txtValdityOfRegNumber.Text = string.Empty;
            //    return;
            //}
        }
    }

    protected void txtWebsite_TextChanged(object sender, EventArgs e)
    {
        revWebsite.Enabled = true;
    }
}
