using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Security;
using System.Data.OracleClient;

using Oracle.DataAccess.Types;
using Oracle.DataAccess.Client;
using System.Xml;


public partial class Collection_S3G_Cln_PDCUpload : ApplyThemeForProject
{

    #region "Initialization"

    public static Collection_S3G_Cln_PDCUpload obj_Page;
    int intUserID = 0, intCompanyID = 0, Flag = 0, intErrCode = 0;
    int IntProgramID = 552;
    string strDateFormat;
    string strKey = "Insert";
    string strRedirectPageView = "window.location.href='../PDC Module/S3G_Cln_PDCUploadView.aspx'";
    string strRedirectPagecancel = "../PDC Module/S3G_Cln_PDCUploadView.aspx";
    string strAlert = "alert('__ALERT__');";
    S3GSession ObjS3GSession = new S3GSession();
    UserInfo ObjUserInfo = new UserInfo();
    string strPageName = "PDC Upload";
    Dictionary<string, string> procparam = new Dictionary<string, string>();
    string FileNameFormat = string.Empty;
    string filepath = String.Empty;
    string strMode = "";
    string strPDCUploadID = "";
    string strProgramName;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj_Page = this;

            strDateFormat = ObjS3GSession.ProDateFormatRW;
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;

            ucCustomerCodeLov.strControlID = ucCustomerCodeLov.ClientID.ToString();
            TextBox txtCustItemNumber = ((TextBox)ucCustomerCodeLov.FindControl("txtItemName"));
            txtCustItemNumber.Style["display"] = "block";
            txtCustItemNumber.Attributes.Add("onfocus", "fnLoadCust()");
            txtCustItemNumber.Attributes.Add("readonly", "false");
            txtCustItemNumber.Width = 0;
            txtCustItemNumber.TabIndex = -1;
            txtCustItemNumber.BorderStyle = BorderStyle.None;

            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strMode = Request.QueryString.Get("qsMode");
                strPDCUploadID = fromTicket.Name;
            }
            else
            {
                if (ViewState["Upload_ID"] != null && Convert.ToString(ViewState["Upload_ID"]) != "")
                    strPDCUploadID = Convert.ToString(ViewState["Upload_ID"]);
            }

            if (!IsPostBack)
            {
                FunPriSetProgramName();
                FunPriLoadLOV();

                if (strMode == "M")
                {
                    FunPriDisableControls(1);
                }
                else if (strMode == "Q")
                {
                    FunPriDisableControls(2);
                }
                else
                {
                    FunPriDisableControls(0);
                }
            }

            ddlPDCNature.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #region "EVENTS"

    #region "BUTTON"

    protected void btnLoadCust_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
            //txtAccItemNumber.Text = hdnCID.Value;
            TxtAccNumber.Text = txtAccItemNumber.Text;

            //Load Address Start
            string strCustomerAddress = string.Empty;
            StringBuilder strFormAddress = new StringBuilder();
            // HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            if (hdnCID != null && hdnCID.Value != "")
            {
                ViewState["hdnCustorEntityID"] = hdnCID.Value;
                //CustomerDetails1.ClearCustomerDetails();
                Button btnGetLOV = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                btnGetLOV.Focus();
                UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLov.FindControl("S3GCustomerAddress1");
                TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");

                DataSet ds = new DataSet();
                Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
                objProcedureParameters.Add("@Option", "1");
                objProcedureParameters.Add("@COMPANY_ID", intCompanyID.ToString());
                objProcedureParameters.Add("@CustomerId", hdnCID.Value);
                ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", objProcedureParameters);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    ucCustomerCodeLov.SelectedValue = hdnCID.Value;
                    ucCustomerCodeLov.SelectedText = Convert.ToString(ds.Tables[0].Rows[0]["Customer_Code"]) + " - " + Convert.ToString(ds.Tables[0].Rows[0]["Customer_Name"]);
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                    {
                        strFormAddress.Append(Environment.NewLine);
                        strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + ds.Tables[0].Rows[0][i].ToString());

                    }

                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                        {
                            strFormAddress.Replace(ds.Tables[1].Rows[i]["COLUMN_NAME"].ToString().ToUpper(), ds.Tables[1].Rows[i]["DISPLAY_TEXT"].ToString());
                        }
                    }

                    FunPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucCustomerCodeLov);

                    FunPriLoadAccountDetails();
                }
            }
            //Load Address End

            btnLoadCust.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnDownloadFormat_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string StrAccountDetails = FunPriFormAccountXML();

            if (Convert.ToString(StrAccountDetails) != "")
            {
                procparam = Utility.FunPubClearDictParam(procparam);
                procparam.Add("@OPTION", "2");
                procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
                procparam.Add("@USER_ID", Convert.ToString(intUserID));
                procparam.Add("@XMLAccount_Deatils", StrAccountDetails);

                DataSet dsUploadDetails = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);


                if (dsUploadDetails.Tables[0].Rows.Count == 0)
                {
                    Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message8));
                    return;
                }
                FunPriExportExcel(dsUploadDetails.Tables[0], 0);
            }
            else
            {
                string strPath = Server.MapPath(@"Upload Format\PDC Upload Format.xls");
                Response.ContentType = "application/vnd.ms-excel";
                Response.AppendHeader("Content-Disposition", "attachment; filename=FileUpload.xls");
                Response.TransmitFile(strPath);
                Response.End();
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnUpload_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (!flUpload.HasFile)
            {
                Utility.FunShowAlertMsg(this, Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message1));
            }

            if (ViewState["DocumentPath"] != null)
            {
                if (flUpload.HasFile)
                {
                    string Extension = Path.GetExtension(flUpload.FileName);
                    if (Extension.ToLower() == ".xls" || Extension.ToLower() == ".xlsx" || Extension.ToLower() == ".csv") 
                    {
                        string[] filename = flUpload.FileName.Split('.');
                        FileNameFormat = filename[0] + "_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "." + filename[1];
                        //FileNameFormat = filename[0] + "_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ".xls";

                        filepath = ViewState["DocumentPath"].ToString();
                        if (!Directory.Exists(filepath))
                            Directory.CreateDirectory(filepath);

                        filepath = ViewState["DocumentPath"].ToString() + "\\" + FileNameFormat;
                        flUpload.SaveAs(filepath);
                       
                        FunPriFileUpload(FileNameFormat, filepath, Extension);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Invalid File Format...');", true);
                    }
                }
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message2));
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnBrowse_Click(object sender, EventArgs e)
    {

    }

    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        //Added on 07-Dec-2018 Starts here
        //To Validate Same file upload/ same account details upload
        procparam = Utility.FunPubClearDictParam(procparam);
        procparam.Add("@OPTION", "6");
        procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
        procparam.Add("@USER_ID", Convert.ToString(intUserID));
        procparam.Add("@Upload_ID", Convert.ToString(strPDCUploadID));
        DataSet dsCheckUpload = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

        if (Convert.ToInt32(dsCheckUpload.Tables[0].Rows[0]["ERROR_CODE"]) == 1)
        {
            btnSave.Enabled_False();
            Utility.FunShowAlertMsg(this, Convert.ToString(dsCheckUpload.Tables[0].Rows[0]["ERROR_MSG"]));
            return;
        }
        //Added on 07-Dec-2018 Ends Here
        ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient objFileUploadClient = new ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient();
        try
        {
            SerializationMode SerMode = SerializationMode.Binary;
            Int32 intUpload_ID = 0;

            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable ObjPDCUpldDataTable = new S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable();
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadRow ObjFileUploadRow;
            ObjFileUploadRow = ObjPDCUpldDataTable.NewS3G_CLN_PDCUploadRow();
            ObjFileUploadRow.Program_ID = Convert.ToInt32(IntProgramID);
            ObjFileUploadRow.Company_ID = Convert.ToInt32(intCompanyID);
            ObjFileUploadRow.File_Name = FileNameFormat;
            ObjFileUploadRow.Upload_Path = filepath;
            ObjFileUploadRow.Txn_ID = Convert.ToInt32(intUserID);
            ObjFileUploadRow.PDC_Nature = Convert.ToInt32(ddlPDCNature.SelectedValue);
            ObjFileUploadRow.Upload_ID = Convert.ToInt32(strPDCUploadID);

            ObjPDCUpldDataTable.AddS3G_CLN_PDCUploadRow(ObjFileUploadRow);

            intErrCode = objFileUploadClient.FunPubCreatePDCUploadDetails(out intUpload_ID, SerMode, ClsPubSerialize.Serialize(ObjPDCUpldDataTable, SerMode));

            if (intErrCode == 0)
            {
                btnSave.Enabled_False();
                btnDelete.Enabled_False();
                strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message3));
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message4));
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
        finally
        {
            objFileUploadClient.Close();
        }
    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../PDC Module/S3G_Cln_PDCUpload.aspx?qsMode=C", false);
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnCancel_ServerClick(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPagecancel);
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnDelete_ServerClick(object sender, EventArgs e)
    {
        try
        {
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@OPTION", "5");
            procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            procparam.Add("@USER_ID", Convert.ToString(intUserID));
            procparam.Add("@Upload_ID", strPDCUploadID);

            DataSet dsUploadDetails = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

            if (dsUploadDetails != null)
            {
                btnDelete.Enabled_False();
                btnSave.Enabled_False();
                strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message5));
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #region "LinkButton"

    protected void lnkbtnUploadFileName_Click(object sender, EventArgs e)
    {
        try
        {
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            procparam.Add("@User_ID", Convert.ToString(intUserID));
            procparam.Add("@Option", "4");
            procparam.Add("@Upload_ID", strPDCUploadID);

            DataSet dsUploadDetails = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

            FunPriExportExcel(dsUploadDetails.Tables[0], 1);
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #region"UserControl"

    protected void ucCustomerCodeLov_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");

            //Load Address Start
            string strCustomerAddress = string.Empty;
            StringBuilder strFormAddress = new StringBuilder();

            if (ucCustomerCodeLov.SelectedValue != "")
            {
                ViewState["hdnCustorEntityID"] = ucCustomerCodeLov.SelectedValue;
                //CustomerDetails1.ClearCustomerDetails();
                Button btnGetLOV = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
                btnGetLOV.Focus();
                UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLov.FindControl("S3GCustomerAddress1");
                TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");
                //txtCustomerCode.Text = txtCustomerName.Text;
                DataSet ds = new DataSet();
                Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
                objProcedureParameters.Add("@Option", "1");
                objProcedureParameters.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
                objProcedureParameters.Add("@CustomerId", ucCustomerCodeLov.SelectedValue);
                ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", objProcedureParameters);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                    {
                        strFormAddress.Append(Environment.NewLine);
                        strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + Convert.ToString(ds.Tables[0].Rows[0][i]));

                    }
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                        {
                            strFormAddress.Replace(Convert.ToString(ds.Tables[1].Rows[i]["COLUMN_NAME"]).ToUpper(), Convert.ToString(ds.Tables[1].Rows[i]["DISPLAY_TEXT"]));
                        }
                    }
                    FunPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucCustomerCodeLov);

                    FunPriLoadAccountDetails();
                }
            }
            //Load Address End
            btnLoadCust.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #endregion

    #region "FUNCTIONS"

    private void FunPriLoadLOV()
    {
        try
        {
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            procparam.Add("@Lookup_Type", "PDC_NATURE");
            procparam.Add("@Table_Name", "S3G_ORG_LOOKUP");
            ddlPDCNature.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", procparam, true, "--Select--", new string[] { "LOOKUP_CODE", "DESCRIPTION" });

            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            procparam.Add("@User_ID", Convert.ToString(intUserID));
            procparam.Add("@Option", "0");
            procparam.Add("@ActivityType_ID", Convert.ToString(IntProgramID));

            DataSet dsLOV = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

            ViewState["ColumnList"] = dsLOV.Tables[0];
            if (dsLOV.Tables[1].Rows.Count > 0)
                ViewState["DocumentPath"] = dsLOV.Tables[1].Rows[0]["Document_Path"].ToString();

            ViewState["ExcelColumnHeaderFields"] = dsLOV.Tables[2];
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriSetCustomerAddress(DataTable dtCustomer, StringBuilder strAddress, UserControl ucCustomerCodeLovDyn)
    {
        try
        {
            DataRow dtrCustomer;
            dtrCustomer = dtCustomer.Rows[0];
            UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLovDyn.FindControl("S3GCustomerAddress1");
            TextBox txtCustomerCode = (TextBox)CustomerDetails1.FindControl("txtCustomerCode");
            TextBox txtCustomerCode1 = (TextBox)CustomerDetails1.FindControl("txtCustomerCode1");
            TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");
            TextBox txtCustomerName1 = (TextBox)CustomerDetails1.FindControl("txtCustomerName1");
            TextBox txtMobile = (TextBox)CustomerDetails1.FindControl("txtMobile");
            TextBox txtMobile1 = (TextBox)CustomerDetails1.FindControl("txtMobile1");
            TextBox txtPhone = (TextBox)CustomerDetails1.FindControl("txtPhone");
            TextBox txtPhone1 = (TextBox)CustomerDetails1.FindControl("txtPhone1");
            TextBox txtEmail = (TextBox)CustomerDetails1.FindControl("txtEmail");
            TextBox txtEmail1 = (TextBox)CustomerDetails1.FindControl("txtEmail1");
            TextBox txtWebSite = (TextBox)CustomerDetails1.FindControl("txtWebSite");
            TextBox txtWebSite1 = (TextBox)CustomerDetails1.FindControl("txtWebSite1");
            TextBox txtCusAddress = (TextBox)CustomerDetails1.FindControl("txtCusAddress");
            TextBox txtCusAddress1 = (TextBox)CustomerDetails1.FindControl("txtCusAddress1");
            if (dtrCustomer != null)
            {
                if (dtrCustomer.Table.Columns["Customer_Code"] != null)
                    txtCustomerCode1.Text = txtCustomerCode.Text = dtrCustomer["Customer_Code"].ToString();
                if (dtrCustomer.Table.Columns["Title"] != null)
                    txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Title"].ToString() + " " + dtrCustomer["Customer_Name"].ToString();
                else
                    txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Customer_Name"].ToString();
                if (dtrCustomer.Table.Columns["Comm_Mobile"] != null) txtMobile.Text = txtMobile1.Text = dtrCustomer["Comm_Mobile"].ToString();
                if (dtrCustomer.Table.Columns.Contains("Comm_Telephone"))
                {
                    txtPhone.Text = txtPhone1.Text = dtrCustomer["Comm_Telephone"].ToString();
                }
                if (dtrCustomer.Table.Columns["Comm_Email"] != null) txtEmail.Text = txtEmail1.Text = dtrCustomer["Comm_Email"].ToString();
                if (dtrCustomer.Table.Columns["Comm_WebSite"] != null) txtWebSite.Text = txtWebSite1.Text = dtrCustomer["Comm_WebSite"].ToString();
                txtCusAddress.Text = txtCusAddress1.Text = strAddress.ToString();
            }

        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriLoadAccountDetails()
    {
        try
        {
            pnlAccountDetails.Visible = true;
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            procparam.Add("@User_ID", Convert.ToString(intUserID));
            procparam.Add("@Option", "1");
            procparam.Add("@Customer_ID", Convert.ToString(ViewState["hdnCustorEntityID"]));

            DataSet dsAccountDetails = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);
            DataTable dtAccountDetails = dsAccountDetails.Tables[0];

            if (dtAccountDetails != null && dtAccountDetails.Rows.Count > 0)
            {
                grvAccountDetails.DataSource = dtAccountDetails;
                grvAccountDetails.DataBind();
            }
            else
            {
                grvAccountDetails.DataSource = null;
                grvAccountDetails.DataBind();
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriDisableControls(int intOption)
    {
        try
        {
            txtPDCCount.ReadOnly = txtAccountCount.ReadOnly = txtTotalAmount.ReadOnly = true;
            switch (intOption)
            {
                case 0:
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    lblHeading.Text = strProgramName + " - Create";
                    pnlAccountDetails.Visible = pnlSummaryDetails.Visible = false;
                    btnException.Visible = btnSave.Visible = btnDelete.Visible = txtUploadStatus.Enabled = imgDownloadFile.Visible = false;
                    ddlPDCNature.SelectedValue = "1";
                    ddlPDCNature.ClearDropDownList();
                    lblNoteMessage.Text = "Note : Date format should be in dd-MM-yyyy format eg.20-Jan-2018 be 20-01-2018";
                    txtUploadStatus.Text = "Pending";
                    break;
                case 1:
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    lblHeading.Text = strProgramName + " - Modify";
                    pnlAccountDetails.Visible = false;
                    btnException.Visible = btnSave.Visible = btnUpload.Visible = btnDownloadFormat.Visible = txtUploadStatus.Enabled = false;
                    flUpload.Visible = ucCustomerCodeLov.Visible = lblCustomerName.Visible = false;
                    btnClear.Enabled_False();
                    if (IsUserAccessChecker(3))
                    {
                        btnDelete.Enabled_True();
                    }
                    else
                    {
                        btnDelete.Enabled_False();
                    }
                    FunPriLoadUploadDetails();
                    ddlPDCNature.ClearDropDownList();
                    break;
                case 2:
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    lblHeading.Text = strProgramName + " - Query";
                    pnlAccountDetails.Visible = false;
                    btnException.Visible = btnSave.Visible = btnUpload.Visible = btnDelete.Visible = btnDownloadFormat.Visible = txtUploadStatus.Enabled = false;
                    flUpload.Visible = ucCustomerCodeLov.Visible = lblCustomerName.Visible = false;
                    btnClear.Enabled_False();
                    FunPriLoadUploadDetails();
                    ddlPDCNature.ClearDropDownList();
                    break;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private string FunPriFormAccountXML()
    {
        Int32 iChecked = 0;
        string strAccount = string.Empty;
        try
        {
            if (grvAccountDetails != null && grvAccountDetails.Rows.Count > 0)
            {
                StringBuilder strbXml = new StringBuilder();
                strbXml.Append("<Root>");

                foreach (GridViewRow grv in grvAccountDetails.Rows)
                {
                    Label lblgrvAccountNumber = (Label)grv.FindControl("lblgrvAccountNumber");
                    Label lblgrvPASARefID = (Label)grv.FindControl("lblgrvPASARefID");
                    CheckBox cbxgrvIsCheck = (CheckBox)grv.FindControl("cbxgrvIsCheck");

                    if (cbxgrvIsCheck.Checked == true)
                    {
                        iChecked = 1;
                        strbXml.Append(" <Details ");
                        strbXml.Append(("Account_Number = '" + Convert.ToString(lblgrvAccountNumber.Text) + "' ").ToUpper());
                        strbXml.Append(("PA_SA_Ref_ID = '" + Convert.ToString(lblgrvPASARefID.Text) + "'").ToUpper());
                        strbXml.Append(" /> ");
                    }
                }

                strbXml.Append("</Root>");
                strAccount = (iChecked == 1) ? Convert.ToString(strbXml) : "";
            }
        }
        catch (Exception objException)
        {
            strAccount = string.Empty;
            throw objException;
        }
        return strAccount;
    }

    private void FunPriExportExcel(DataTable dtExport, Int32 iOption)
    {
        try
        {
            if (dtExport.Rows.Count == 0)
            {
                return;
            }

            //if (iOption == 0)
            //{
            //    foreach (DataRow dr in dtExport.Rows)
            //    {
            //        dr["Installment Date"] = Convert.ToDateTime(dr["Installment Date"]).ToString("MM/dd/yyyy");
            //        //dr["Instrument Date"] = Convert.ToDateTime(dr["Instrument Date"]).ToString("MM/dd/yyyy");
            //    }
            //    dtExport.AcceptChanges();
            //}

            GridView Grv = new GridView();
            Grv.DataSource = dtExport;
            Grv.DataBind();
            Grv.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            Grv.ForeColor = System.Drawing.Color.DarkBlue;

            if (Grv.Rows.Count > 0)
            {
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=PDCUploadData.xls");
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                Grv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        catch (Exception objException)
        {

        }
    }

    private void FunPriFileUpload(string FileNameFormat, string filepath, string Extension)
    {
        try
        {
            ImportExcelData_To_DBTable(filepath, Extension, "Yes");
            if (Flag == 1)
            {
                if (intErrCode == 0)
                {
                    if (ViewState["Upload_ID"] != null)
                        FunPriValidateUploadDtls(Convert.ToInt64(ViewState["Upload_ID"]));
                    strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message6));
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", Convert.ToString(Resources.LocalizationResources.PDCUPLOAD_Message7));
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected int ImportExcelData_To_DBTable(string FilePath, string Extension, string isHDR)
    {
        try
        {
            string errormsg = String.Empty;

            DataTable dtXLData = new DataTable();
            DataTable dtValidateXLData = new DataTable();
            DataTable ObjDtColumnList = new DataTable();
            ObjDtColumnList = (DataTable)ViewState["ColumnList"];

            string conStr = "";
            switch (Extension.ToLower())
            {
                case ".xls": //Excel 97-03
                    conStr = ConfigurationManager.ConnectionStrings["Excel03ConString"]
                             .ConnectionString;
                    break;
                case ".xlsx": //Excel 07
                    conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"]
                              .ConnectionString;
                    break;
                //case ".csv": //Excel 07
                //    conStr = ConfigurationManager.ConnectionStrings["Excel033ConString"]
                //              .ConnectionString;
                //    break;
            }
            //var fileName = string.Format("{0}{1}", AppDomain.CurrentDomain.BaseDirectory, "MFC\\");
            // conStr = string.Format(@"Provider=Microsoft.Jet.OLEDB.4.0; Data Source={0}; Extended Properties=""text;HDR=YES;FMT=Delimited""", fileName);
            conStr = String.Format(conStr, FilePath, isHDR);
            if (Extension.ToLower() != ".csv")
            {
                OleDbConnection connExcel = new OleDbConnection(conStr);
                OleDbCommand cmdExcel = new OleDbCommand();
                OleDbDataAdapter oda = new OleDbDataAdapter();
                DataTable dt = new DataTable();

                cmdExcel.Connection = connExcel;
                //Get the name of First Sheet
                connExcel.Open();
                DataTable dtExcelSchema;
                dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string SheetName = FunPriGetSheetName(dtExcelSchema);
                connExcel.Close();

                //Read Data from First Sheet
                try
                {
                    connExcel.Open();
                    cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + ObjDtColumnList.Rows[0][1].ToString() + "] IS NOT NULL";
                    oda.SelectCommand = cmdExcel;
                    oda.Fill(dtXLData);

                    cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + ObjDtColumnList.Rows[0][1].ToString() + "] IS NULL";
                    oda.SelectCommand = cmdExcel;
                    oda.Fill(dtValidateXLData);

                    connExcel.Close();
                }
                catch (Exception objException)
                {
                    connExcel.Close();
                    //if (File.Exists(FilePath))
                    //{
                    //    File.Delete(FilePath);
                    //}
                    throw objException;
                }
            }
            else
            {
                FunPriLoadCSV(FilePath);
                dtXLData = (DataTable)Session["Terror_CSV"];
            }
            
            if (dtValidateXLData.Rows.Count >= 0 && dtXLData.Rows.Count == 0)
            {
                lblErr.Text = "Please Correct The Validations";
                errormsg = ObjDtColumnList.Rows[0][1].ToString() + "  is Blank ;";
                lblErrorMessage.Text = errormsg;
                dtValidateXLData.Dispose();
                Flag = 2;
            }

            if (dtValidateXLData != null && dtValidateXLData.Rows.Count > 0)
                dtXLData.Merge(dtValidateXLData);

            if (Flag == 0)
                Flag = FunPriValidateExcelColumnHeaderDetails(dtXLData, ObjDtColumnList, FilePath);

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            if (objException.Message.Contains("No value given for one or more required parameters."))
            {
                lblErr.Text = "Please Correct The Validations";
                lblErrorMessage.Text = "Uploaded File Contains Empty Rows and Columns";
            }
            else
            {
                lblErr.Text = "Please Correct The Validations";
                lblErrorMessage.Text = "Uploaded File is in Invalid Format - " + objException.Message;
            }
        }
        return Flag;
    }

    private void FunPriLoadCSV(string strFileName)
    {
        try
        {
            string strFilePath = string.Empty;
            //strFilePath = ClsPubConfigReader.FunPubReadConfig("FA_TERRORIST_FILE_PATH");
            //string CSVFilePathName = strFilePath + "\\" + txtFileName.Text + ".csv";
            string CSVFilePathName = strFileName;
            string[] Lines = (File.ReadAllLines(CSVFilePathName, Encoding.UTF8));
            if (Lines == null)
            {
                Utility.FunShowAlertMsg(this, "Invalid File");
                return;
            }
            string[] Fields;
            Fields = Lines[0].Split(new char[] { ',' });
            int Cols = Fields.GetLength(0);
            DataTable dt = new DataTable();
            //1st row must be column names; force lower case to ensure matching later on.
            for (int i = 0; i < Cols; i++)
            {
                if (i == 27)
                {
                    dt.Columns.Add("AGE_DATE", typeof(string));
                }
                else if (i == 18)
                {
                    dt.Columns.Add(Fields[i].Replace("/", "_"), typeof(string));
                }
                else
                {
                    dt.Columns.Add(Fields[i].Replace(" ", " "), typeof(string));
                }
            }

            DataRow Row;
            for (int i = 1; i < Lines.GetLength(0); i++)//Lines.GetLength(0)
            {
                Fields = Lines[i].Split(new char[] { ',' });
                Row = dt.NewRow();
                for (int f = 0; f < Cols; f++)
                    Row[f] = Fields[f];
                dt.Rows.Add(Row);
            }
            Session["Terror_CSV"] = dt;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            //CVUsermanagement.ErrorMessage = ex.ToString();
            //CVUsermanagement.IsValid = false;
        }
    }


    protected string FunPriGetSheetName(DataTable dtExcelSchema)
    {
        string SheetName = string.Empty;
        foreach (DataRow row in dtExcelSchema.Rows)
        {
            if (!(row["TABLE_NAME"].ToString().Contains("FilterDatabase")
                || row["TABLE_NAME"].ToString().EndsWith("_")))
            {
                SheetName = row["TABLE_NAME"].ToString();
                return SheetName;
            }
        }
        return SheetName;
    }

    protected int FunPriValidateExcelColumnHeaderDetails(DataTable XLData, DataTable DBXLcolumnHeaderNames, string FilePath)
    {
        StringBuilder StrIncorrectColumn = new StringBuilder();
        StringBuilder StrColumnLength = new StringBuilder();

        string[] selectedColumns = FunPriGetExcelHeaderColumns();

        DataTable dt = new DataView(XLData).ToTable(false, selectedColumns);

        XLData = dt;

        if (XLData.Columns.Count >= DBXLcolumnHeaderNames.Select("Is_ExcelColumn = 1").Length)
        {

            foreach (DataRow ObjDR in DBXLcolumnHeaderNames.Select("Is_ExcelColumn = 1"))
            {
                string StrExcelColumn = "";
                StrExcelColumn = ObjDR["Excel_ColumnName"].ToString().Trim().ToUpper();
                if (!XLData.Columns.Contains(StrExcelColumn))
                {
                    if (StrIncorrectColumn.Length == 0)
                        StrIncorrectColumn.Append("Unmatched Column(s) : ");

                    StrIncorrectColumn.Append(ObjDR["Excel_ColumnName"].ToString() + "; <BR/>");
                }
                else
                {
                    int maxlength = 0;
                    int intColNo = XLData.Columns.IndexOf(StrExcelColumn);
                    XLData.Rows.OfType<DataRow>().ToList()
                        .ForEach(ss =>
                        {
                            maxlength = Convert.ToString(ss.ItemArray[intColNo]).Length > maxlength ?
                                Convert.ToString(ss.ItemArray[intColNo]).Length : maxlength;
                        });

                    if (!String.IsNullOrEmpty(ObjDR["Column_Length"].ToString()) && Convert.ToInt32(ObjDR["Column_Length"].ToString()) < maxlength)
                    {
                        if (StrColumnLength.Length == 0)
                            StrColumnLength.Append("Column Length Exceed : ");

                        StrColumnLength.Append(ObjDR["Excel_ColumnName"].ToString() +
                            "; Valid Length - " + ObjDR["Column_Length"].ToString() +
                            "; Available Length - " + maxlength + " <BR/>");
                    }
                }
            }
            if (StrIncorrectColumn.Length == 0 && StrColumnLength.Length == 0)
            {
                ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient objFileUploadClient = new ClnReceiptMgtServicesReference.ClnReceiptMgtServicesClient();
                Int32 intUpload_ID = 0;
                try
                {
                    SerializationMode SerMode = SerializationMode.Binary;

                    S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable ObjPDCUpldDataTable = new S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable();
                    S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadRow ObjFileUploadRow;
                    ObjFileUploadRow = ObjPDCUpldDataTable.NewS3G_CLN_PDCUploadRow();
                    ObjFileUploadRow.Program_ID = Convert.ToInt32(IntProgramID);
                    ObjFileUploadRow.Company_ID = Convert.ToInt32(intCompanyID);
                    ObjFileUploadRow.File_Name = FileNameFormat;
                    ObjFileUploadRow.Upload_Path = filepath;
                    ObjFileUploadRow.Txn_ID = Convert.ToInt32(intUserID);
                    ObjFileUploadRow.PDC_Nature = Convert.ToInt32(ddlPDCNature.SelectedValue);

                    ObjPDCUpldDataTable.AddS3G_CLN_PDCUploadRow(ObjFileUploadRow);

                    intErrCode = objFileUploadClient.FunPubCreateFileUpload(out intUpload_ID, SerMode, ClsPubSerialize.Serialize(ObjPDCUpldDataTable, SerMode));

                    ViewState["Upload_ID"] = intUpload_ID;

                    FunPriBindDataForCommonColumns(XLData, intUpload_ID);
                }
                catch (Exception objException)
                {
                    ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
                    //if (File.Exists(FilePath))
                    //{
                    //    File.Delete(FilePath);
                    //}
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Template Invalid ...');", true);
                }
                finally
                {
                    objFileUploadClient.Close();
                }


                //System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                //string constr = (string)AppReader.GetValue("DBPath", typeof(string));

                string conn = FunPriGetConfigConnectionString();
                System.Data.OracleClient.OracleConnection conndb = new System.Data.OracleClient.OracleConnection(conn);
                conndb.Open();
                System.Data.OracleClient.OracleTransaction tran = conndb.BeginTransaction(IsolationLevel.ReadCommitted);
                OracleBulkCopy sbcd = new OracleBulkCopy(conn, OracleBulkCopyOptions.Default);

                try
                {
                    sbcd.DestinationTableName = "S3G_CLN_PDC_DUMP";

                    foreach (DataRow row in DBXLcolumnHeaderNames.Rows)
                    {
                        sbcd.ColumnMappings.Add(row["Excel_ColumnName"].ToString(), row["Db_ColumnName"].ToString());
                    }

                    sbcd.BatchSize = 1000;
                    sbcd.WriteToServer(XLData);
                    tran.Commit();
                    conndb.Close();
                    sbcd.Close();
                    sbcd.Dispose();
                    Flag = 1;
                }
                catch (Exception ex)
                {
                    conndb.Close();
                    sbcd.Close();
                    sbcd.Dispose();
                    ClsPubCommErrorLog.CustomErrorRoutine(ex, lblHeading.Text + "Bulk Insert");
                    Flag = 2;
                    FunPriDeleteExceptionFile(intUpload_ID);
                }

                lblErrorMessage.Text = "";
                lblErr.Text = "";
                XLData.Clear();
            }
            else
            {
                //if (File.Exists(FilePath))
                //{
                //    File.Delete(FilePath);
                //}
                lblErr.Text = "File contains invalid column / data.";
                lblErrorMessage.Text = StrIncorrectColumn.ToString() + "<BR/>" + StrColumnLength.ToString();
            }
        }
        else
        {
            //if (File.Exists(FilePath))
            //{
            //    File.Delete(FilePath);
            //}
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Invalid file For Selected Template...');", true);
        }
        return Flag;
    }

    protected void FunPriBindDataForCommonColumns(DataTable XL, Int32 intUpload_ID)
    {
        try
        {
            Int32 count = 0;
            XL.Columns.Add(new DataColumn("Company_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("Upload_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("Status_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("User_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("SNO", typeof(Int32)));
            foreach (DataRow row in XL.Rows)
            {
                row["Company_ID"] = intCompanyID.ToString();
                row["Upload_ID"] = intUpload_ID;
                row["Status_ID"] = 1;
                row["User_ID"] = intUserID.ToString();
                row["SNO"] = count + 1;
                count = count + 1;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriLoadUploadDetails()
    {
        try
        {
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            procparam.Add("@User_ID", Convert.ToString(intUserID));
            procparam.Add("@Option", "3");
            procparam.Add("@Upload_ID", strPDCUploadID);

            DataSet dsPDC = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

            ddlPDCNature.SelectedValue = Convert.ToString(dsPDC.Tables[0].Rows[0]["PDC_NATURE"]);
            lnkbtnUploadFileName.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["File_Name"]);
            txtPDCCount.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["PDC_Count"]);
            txtTotalAmount.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["Total_Amount"]);
            txtAccountCount.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["Account_Count"]);
            txtUploadStatus.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["Upload_Status"]);
            lblNoteMessage.Text = Convert.ToString(dsPDC.Tables[0].Rows[0]["Note_Message"]);

            if (Convert.ToString(dsPDC.Tables[0].Rows[0]["Is_Valid"]) == "1" && strMode == "M")
            {
                btnSave.Visible = true;
                btnSave.Enabled_True();
            }
            else
            {
                btnSave.Visible = true;
                btnSave.Enabled_False();
            }

            grvSummary.DataSource = dsPDC.Tables[1];
            grvSummary.DataBind();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {

    }

    private string FunPriGetConfigConnectionString()
    {
        string ConnectionString;
        try
        {
            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));
            if (File.Exists(strFileName))
            {
                XmlDocument _xmlDoc = new XmlDocument();
                _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
                XmlDocument conxmlDoc = xmlDoc;
                ConnectionString = conxmlDoc.ChildNodes[0].SelectSingleNode("connectionStrings").ChildNodes[0].Attributes["connectionString"].Value;
            }
            else
            {
                throw new FileNotFoundException("Configuration file not found");
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
        return ConnectionString;
    }

    private void FunPriSetProgramName()
    {
        try
        {
            Dictionary<string, string> strProparm = new Dictionary<string, string>();
            strProparm.Add("@Program_ID", Convert.ToString(IntProgramID));
            DataTable dtProgram = Utility.GetDefaultData("S3G_GET_PROGRAM_NAME", strProparm);
            if (dtProgram.Rows.Count > 0)
            {
                strProgramName = dtProgram.Rows[0]["NAME"].ToString();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool IsUserAccessChecker(int Option)
    {
        bool blnRslt = false;
        try
        {
            DataTable dtUserRights = Utility.UserAccess(0, 0, intUserID, IntProgramID, intCompanyID);
            object count = null;
            int rcount = 0;
            if (dtUserRights.Rows.Count > 0)
            {
                if (Option == 1)//Create
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "ADDACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 2)//Modify
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "MODIFYACESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                if (Option == 3)//Delete
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "DELETEACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
                else if (Option == 4)//View/Querry
                {
                    count = dtUserRights.Compute("count(VIEWACCESS)", "VIEWACCESS='1'");
                    rcount = Convert.ToInt32(count);
                    if (rcount > 0)
                    {
                        blnRslt = true;
                    }
                }
            }
        }
        catch
        {
            blnRslt = false;
        }
        return blnRslt;
    }

    private void FunPriDeleteExceptionFile(Int32 iUploadID)
    {
        try
        {
            if (iUploadID > 0)
            {
                procparam = Utility.FunPubClearDictParam(procparam);
                procparam.Add("@OPTION", "7");
                procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
                procparam.Add("@USER_ID", Convert.ToString(intUserID));
                procparam.Add("@Upload_ID", Convert.ToString(iUploadID));
                DataSet dsCheckUpload = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Add("@COMPANY_ID", Convert.ToString(System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"]));
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));

        return suggetions.ToArray();

    }

    private string[] FunPriGetExcelHeaderColumns()
    {
        DataTable dtExcel = (DataTable)ViewState["ExcelColumnHeaderFields"];
        string[] strExcelColumnHeader = new string[dtExcel.Rows.Count];
        try
        {
            int i = 0;
            foreach (DataRow dr in dtExcel.Rows)
            {
                strExcelColumnHeader[i++] = dr[0].ToString();
            }
        }
        catch (Exception objException)
        {
        }
        return strExcelColumnHeader;
    }

    private void FunPriValidateUploadDtls(Int64 intUploadID)
    {
        try
        {
            procparam = Utility.FunPubClearDictParam(procparam);
            procparam.Add("@OPTION", "8");
            procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            procparam.Add("@USER_ID", Convert.ToString(intUserID));
            procparam.Add("@Upload_ID", Convert.ToString(intUploadID));

            DataSet dsUploadDetails = Utility.GetDataset("S3G_CLN_GET_PDCUPLDDTLS", procparam);

            FunPriGetUploadDtls(dsUploadDetails);

            pnlAccountDetails.Visible = false;
            btnException.Visible = btnUpload.Visible = btnDownloadFormat.Visible = false;
            flUpload.Visible = ucCustomerCodeLov.Visible = lblCustomerName.Visible = false;
            btnClear.Enabled_False();
            pnlSummaryDetails.Visible = imgDownloadFile.Visible = btnDelete.Visible = true;

            if (IsUserAccessChecker(3))
            {
                btnDelete.Enabled_True();
            }
            else
            {
                btnDelete.Enabled_False();
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetUploadDtls(DataSet dsDetails)
    {
        try
        {
            ddlPDCNature.SelectedValue = Convert.ToString(dsDetails.Tables[0].Rows[0]["PDC_NATURE"]);
            lnkbtnUploadFileName.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["File_Name"]);
            txtPDCCount.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["PDC_Count"]);
            txtTotalAmount.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["Total_Amount"]);
            txtAccountCount.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["Account_Count"]);
            txtUploadStatus.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["Upload_Status"]);
            lblNoteMessage.Text = Convert.ToString(dsDetails.Tables[0].Rows[0]["Note_Message"]);

            if (Convert.ToString(dsDetails.Tables[0].Rows[0]["Is_Valid"]) == "1")
            {
                btnSave.Visible = true;
                btnSave.Enabled_True();
            }
            else
            {
                btnSave.Visible = true;
                btnSave.Enabled_False();
            }

            grvSummary.DataSource = dsDetails.Tables[1];
            grvSummary.DataBind();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
}