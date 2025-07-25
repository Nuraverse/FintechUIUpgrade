#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Budget  
/// Screen Name			: Budget File Upload
/// Created By			: Boobalan M
/// Created Date		: 13-Nov-2019
/// Purpose	            : Budegt File Upload
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
using System.Collections.Generic;
using System.Text;
using System.Text;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Web.Security;
using System.Data.OracleClient;
using System.Xml;
using System.Data.OracleClient;
using Oracle.DataAccess.Types;
using Oracle.DataAccess.Client;
using System.Web.Services;
using FA_BusEntity;


public partial class Budget_Budget_File_Upload : ApplyThemeForProject_FA
{
    // Common Declaration
    static string[] strarrControlsID = new string[0];
    int intCompanyId = 0;
    int intUserId = 0;
    static string strPageName = "Budget File Upload";
    string StrConnectionName = string.Empty;

    ApplyThemeForProject ATFP = new ApplyThemeForProject();
    UserInfo usrInfo = new UserInfo();
    Dictionary<string, string> Procparam = new Dictionary<string, string>();
    string FileNameFormat = string.Empty;
    string filepath = String.Empty;
    DataTable dtExcel = new DataTable();
    DataSet dtsearch = new DataSet();
    int Flag, intErrCode, intUpload_ID = 0;
    FASession objFASession;
  //  public static string path = @"D:\Boobalan\SVN_Projects\SVNS3G\Dev\S3G_MFC\SISLS3GPLayer\SISLS3GPLayer\Budget\Upload_Format\";
    public static string path = @"\\siststs3g02\S3G_Oracle\MFC\MFC_S3G\Web\Budget\Upload_Format\";
    
    string strRedirectPageAdd = "~/Budget/FA_Budget_File_Upload.aspx";
    string strRedirectPageView = "~/Budget/FA_Budget_File_Upload_View.aspx";

    // Serivice Ref Declaration
    BudgetServiceReference.BudgetMasterClient objBudget_MasterClient;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADRow objbudegtfileuploadrow;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVERow objbudegtfileuploadSaverow;
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable objbudgetFileupload_DTB = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable();
    FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable objbudgetFileuploadSave_DTB = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable();

    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (usrInfo.ProCompanyIdRW == 0)
                HttpContext.Current.Response.Redirect("../SessionExpired.aspx");

            Page.Theme = usrInfo.ProUserThemeRW;

            // Initialize from User Information
            CompanyId = usrInfo.ProCompanyIdRW.ToString();
            UserId = usrInfo.ProUserIdRW.ToString();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            usrInfo = new UserInfo();
            intCompanyId = usrInfo.ProCompanyIdRW;
            intUserId = usrInfo.ProUserIdRW;

            if (!IsPostBack)
            {
                FundropDownListLoad();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }


    private void FundropDownListLoad()
    {
        try
        {
            DataSet Dset = new DataSet();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyId.ToString());
            Dset = Utility_FA.GetDataset("BUD_GET_FILEUPLOAD_LOAD", Procparam);

            // Binding Financial Year
            this.ddlFinancialyear.DataSource = Dset.Tables[0];
            this.ddlFinancialyear.DataTextField = "FINANCIAL_YEAR";
            this.ddlFinancialyear.DataValueField = "FINANCIAL_YEAR";
            this.ddlFinancialyear.DataBind();

            // Binding Activity List
            this.ddlActivity.DataSource = Dset.Tables[1];
            this.ddlActivity.DataTextField = "lookup_desc";
            this.ddlActivity.DataValueField = "lookup_code";
            this.ddlActivity.DataBind();
            ddlActivity.Items.Insert(0, new ListItem("--Select--", "0"));

            // Binding Item Header List
            this.ddlItemHeader.DataSource = Dset.Tables[2];
            this.ddlItemHeader.DataTextField = "lookup_desc";
            this.ddlItemHeader.DataValueField = "lookup_code";
            this.ddlItemHeader.DataBind();
            ddlItemHeader.Items.Insert(0, new ListItem("--Select--", "0"));

            ViewState["ColumnList"] = Dset.Tables[4];
            ViewState["DocumentPath"] = path;

            // Binding Account Nature
            this.ddlAccountNature.DataSource = Dset.Tables[5];
            this.ddlAccountNature.DataTextField = "lookup_desc";
            this.ddlAccountNature.DataValueField = "lookup_code";
            this.ddlAccountNature.DataBind();
            ddlAccountNature.Items.Insert(0, new ListItem("--Select--", "0"));

            // dtExcel = Dset.Tables[3];

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }


    protected void onDownloadTemplateClick(object sender, EventArgs e)
    {
        try
        {
            if (this.ddlItemHeader.SelectedValue != "0" && this.ddlAccountNature.SelectedValue != "0")
            {
                DataSet Dset = new DataSet();
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", intCompanyId.ToString());
                Procparam.Add("@Item_Header_ID", ddlItemHeader.SelectedValue);
                Procparam.Add("@Account_Nature_ID", ddlAccountNature.SelectedValue);
                Dset = Utility_FA.GetDataset("BUD_GET_FILEUPLOAD_FORMAT", Procparam);
                FunPriExportExcel(Dset.Tables[0], "BudgetUploadFormat");
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Select Item Header & Account Nature");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }


    private void FunPriExportExcel(DataTable dtExport, string Filename)
    {
        try
        {
            if (dtExport.Rows.Count == 0)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "No data found.");
                return;
            }

            GridView Grv = new GridView();
            Grv.DataSource = dtExport;
            Grv.AllowPaging = false;
            Grv.DataBind();

            if (Grv.Rows.Count > 0)
            {
                Response.ClearContent();
                Response.AddHeader("content-disposition", "attachment;filename=" + Filename + ".xls");
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Grv.GridLines = GridLines.Both;
                Grv.HeaderStyle.Font.Bold = true;
                Grv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnUpload_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (!flUpload.HasFile)
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Upload the File");
                return;
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

                        filepath = ViewState["DocumentPath"].ToString();
                        if (!Directory.Exists(filepath))
                            Directory.CreateDirectory(filepath);

                        filepath = ViewState["DocumentPath"].ToString() + "\\" + FileNameFormat;
                        flUpload.SaveAs(filepath);

                        FunPriFileUpload(FileNameFormat, filepath, Extension);
                    }
                    else
                    {

                        Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Invalid File Format");
                    }
                }
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Invalid File");
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageAdd);
    }

    protected void btnCancelClick(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageView);
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
                     //   FunPriValidateUploadDtls(Convert.ToInt64(ViewState["Upload_ID"]), "2");
                    
                    Utility_FA.FunUpdateAlertMsg(this.Page ,"success!", "File Uploaded Successfully", "FA_Budget_File_Upload.aspx");

                }
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "File Uploaded Failed.");
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
            }
            conStr = String.Format(conStr, FilePath, isHDR);
            if (Extension.ToLower() != ".csv")
            {
                OleDbConnection connExcel = new OleDbConnection(conStr);
                OleDbCommand cmdExcel = new OleDbCommand();
                OleDbDataAdapter oda = new OleDbDataAdapter();
                DataTable dt = new DataTable();

                cmdExcel.Connection = connExcel;
                // Get the name of First Sheet
                connExcel.Open();
                DataTable dtExcelSchema;
                dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string SheetName = FunPriGetSheetName(dtExcelSchema);
                connExcel.Close();

                try
                {
                    connExcel.Open();
                    cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + Convert.ToString(ObjDtColumnList.Rows[0][1]) + "] IS NOT NULL";
                    oda.SelectCommand = cmdExcel;
                    oda.Fill(dtXLData);

                    cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + Convert.ToString(ObjDtColumnList.Rows[0][1]) + "] IS NULL";
                    oda.SelectCommand = cmdExcel;
                    oda.Fill(dtValidateXLData);

                    connExcel.Close();
                }
                catch (Exception objException)
                {
                    connExcel.Close();
                    throw objException;
                }
            }

            if (dtValidateXLData.Rows.Count >= 0 && dtXLData.Rows.Count == 0)
            {
                lblErr.Text = "Please Correct The Validations";
                errormsg = ObjDtColumnList.Rows[0][1].ToString() + "  is Blank ;";
                lblErrorMessage.Text = errormsg;
                dtValidateXLData.Dispose();
                Flag = 2;
            }

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


                objBudget_MasterClient = new BudgetServiceReference.BudgetMasterClient();
                Int32 intUpload_ID = 0;
                try
                {

                    objbudgetFileupload_DTB = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable();
                    objbudegtfileuploadrow = objbudgetFileupload_DTB.NewFA_BUD_FILEUPLOADRow();
                    objbudegtfileuploadrow.Program_ID = 435;
                    objbudegtfileuploadrow.Company_ID = Convert.ToInt32(intCompanyId);
                    objbudegtfileuploadrow.File_Name = FileNameFormat;
                    objbudegtfileuploadrow.Upload_Path = filepath;
                    objbudegtfileuploadrow.Txn_ID = Convert.ToInt32(intUserId);
                    objbudegtfileuploadrow.Fin_Year = Convert.ToString(ddlFinancialyear.SelectedValue);
                    objbudegtfileuploadrow.Item_Header = Convert.ToInt32(ddlItemHeader.SelectedValue);
                    objbudegtfileuploadrow.Activity = Convert.ToInt32(ddlActivity.SelectedValue);
                    objbudegtfileuploadrow.Account_Nature = Convert.ToInt32(ddlAccountNature.SelectedValue);
                    objbudgetFileupload_DTB.AddFA_BUD_FILEUPLOADRow(objbudegtfileuploadrow);

                    objFASession = new FASession();
                    StrConnectionName = objFASession.ProConnectionName;
                    FASerializationMode SerMode = FASerializationMode.Binary;
                    byte[] ObjBudgetDataTable = FAClsPubSerialize.Serialize(objbudgetFileupload_DTB, SerMode);
                    intErrCode = objBudget_MasterClient.FunPubBudgetUpload(SerMode, ObjBudgetDataTable, StrConnectionName, out intUpload_ID);

                    ViewState["Upload_ID"] = intUpload_ID;

                    FunPriBindDataForCommonColumns(XLData, intUpload_ID);

                }
                catch (Exception objException)
                {
                    ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
                    Utility_FA.FunAlertMsg(this.Page, "warning", "Alert!", "Invalid File Format");
                }
                finally
                {
                    objBudget_MasterClient.Close();
                }

                string conn = FA_DALayer.Common.ClsIniFileAccess.FunPriGetConfigConnectionString(StrConnectionName);
                System.Data.OracleClient.OracleConnection conndb = new System.Data.OracleClient.OracleConnection(conn);
                conndb.Open();
                System.Data.OracleClient.OracleTransaction tran = conndb.BeginTransaction(IsolationLevel.ReadCommitted);
                OracleBulkCopy sbcd = new OracleBulkCopy(conn, OracleBulkCopyOptions.Default);

                try
                {
                    sbcd.DestinationTableName = "FA_BUD_DATA_DUMP";

                    foreach (DataRow row in DBXLcolumnHeaderNames.Rows)
                    {
                        sbcd.ColumnMappings.Add(Convert.ToString(row["EXCEL_COLUMNNAME"]), Convert.ToString(row["DB_COLUMNNAME"]));
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
                lblErr.Text = "File contains invalid column / data.";
                lblErrorMessage.Text = StrIncorrectColumn.ToString() + "<BR/>" + StrColumnLength.ToString();
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('" + Convert.ToString(Resources.LocalizationResources.CHQRTNUPLOAD_Message8) + "');", true);
        }
        return Flag;
    }

    protected void FunPriBindDataForCommonColumns(DataTable XL, Int32 intUpload_ID)
    {
        try
        {
            Int32 count = 0;
            XL.Columns.Add(new DataColumn("COMPANY_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("UPLOAD_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("USER_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("STATUS_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("SNO", typeof(Int32)));
            foreach (DataRow row in XL.Rows)
            {
                row["COMPANY_ID"] = Convert.ToString(intCompanyId);
                row["UPLOAD_ID"] = Convert.ToString(intUpload_ID);
                row["USER_ID"] = Convert.ToString(intUserId);
                row["STATUS_ID"] = Convert.ToString("1");
                row["SNO"] = count + 1;
                count = count + 1;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
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

    private void FunPriDeleteExceptionFile(Int32 iUploadID)
    {
        try
        {
            if (iUploadID > 0)
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@OPTION", "7");
                Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
                Procparam.Add("@USER_ID", Convert.ToString(intUserId));
                Procparam.Add("@Upload_ID", Convert.ToString(iUploadID));
                DataSet dsCheckUpload = Utility.GetDataset("FA_GET_BUD_FILEUPLOADDETAILS", Procparam);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunValidateUploadFile(Int32 iUploadID)
    {
        try
        {
            if (iUploadID > 0)
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
                Procparam.Add("@USER_ID", Convert.ToString(intUserId));
                Procparam.Add("@Upload_ID", Convert.ToString(iUploadID));
                Utility_FA.GetDataset("FA_BUD_VLD_FILEUPLOAD", Procparam);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void btnException_Click(object sender, EventArgs e)
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {
            LinkButton lnkView = (sender as LinkButton);
            GridViewRow row = (lnkView.NamingContainer as GridViewRow);
            string Upload_ID = (row.FindControl("lblUpload_ID") as Label).Text;

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "3");
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@User_ID", Convert.ToString(intUserId));
            Procparam.Add("@Upload_ID", Upload_ID);
            Procparam.Add("@ACTIVITYTYPE_ID", Convert.ToString(ddlActivity.SelectedValue));

            DataSet dsDetails = Utility_FA.GetDataset("FA_GET_BUD_FILEUPLOADDETAILS", Procparam);
            ViewState["ExportDataExcel"] = dsDetails.Tables[0];

            FunPriExportExcel(dsDetails.Tables[0], "UploadFile_Details");

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
        finally
        {
        }
    }

    protected void btnSave_ServerClick(object sender, EventArgs e)
    {
        objBudget_MasterClient = new BudgetServiceReference.BudgetMasterClient();

        try
        {

            LinkButton lnkView = (sender as LinkButton);
            GridViewRow row = (lnkView.NamingContainer as GridViewRow);
            string Upload_ID = (row.FindControl("lblUpload_ID") as Label).Text;
            ViewState["Upload_ID"] = Upload_ID;

            objbudgetFileuploadSave_DTB = new FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable();
            objbudegtfileuploadSaverow = objbudgetFileuploadSave_DTB.NewFA_BUD_FILEUPLOAD_SAVERow();
            objbudegtfileuploadSaverow.Program_ID = 435;
            objbudegtfileuploadSaverow.Company_ID = Convert.ToInt32(intCompanyId);
            objbudegtfileuploadSaverow.User_Id = Convert.ToInt32(intUserId);
            objbudegtfileuploadSaverow.Upload_ID = Convert.ToInt32(Upload_ID); ;

            objbudgetFileuploadSave_DTB.AddFA_BUD_FILEUPLOAD_SAVERow(objbudegtfileuploadSaverow);

            objFASession = new FASession();
            StrConnectionName = objFASession.ProConnectionName;
            FASerializationMode SerMode = FASerializationMode.Binary;
            byte[] ObjBudgetDataTable = FAClsPubSerialize.Serialize(objbudgetFileuploadSave_DTB, SerMode);
            int intOutResult = 0;
            intErrCode = objBudget_MasterClient.FunPubBudgetUploadDetails(SerMode, ObjBudgetDataTable, StrConnectionName, out intOutResult);


            FunPriValidateUploadDtls(0, "2");

            if (intOutResult == 10080)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successRefAlt('Success!', 'Upload Data Saved successfully');", true);

             //   Utility_FA.FunUpdateAlertMsg(this.Page, "Success!", "Upload Data Saved successfully", "FA_Budget_File_Upload_View.aspx");
            }
            else
            {
                Utility_FA.FunAlertMsg(this.Page, "error", "error!", "Faild.");
            }
        }
        catch (Exception objException)
        {
            Utility_FA.FunAlertMsg(this.Page, "error", "error!", "Oops somthing went wrong");
        }
        finally
        {
            objBudget_MasterClient.Close();
        }
    }



    protected void btnSearchClick(object sender, EventArgs e)
    {
        FunPriValidateUploadDtls(0, "2");
    }


    protected void grvUploadSummary_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            Label lblUpload_ID = (Label)grvUploadSummary.Rows[e.RowIndex].FindControl("lblUpload_ID");
            string Upload_ID = lblUpload_ID.Text;
            ViewState["Upload_ID"] = Upload_ID;

            Procparam = new Dictionary<string, string>();

            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@USER_ID", Convert.ToString(intUserId));
            Procparam.Add("@Upload_ID", Convert.ToInt32(ViewState["Upload_ID"]).ToString());

            DataSet dsUploadDetails = Utility_FA.GetDataset("BUD_FILEUPLOAD_DELETE", Procparam);

            //this.grvUploadSummary.DataSource = dsUploadDetails.Tables[0];
            //this.grvUploadSummary.DataBind();
                       
            if (dsUploadDetails != null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successRefAlt('Success!', 'Deleted Successfully.');", true);
             //  Utility_FA.FunSuccessReload(this.Page, "Success!", "Deleted Successfully");
            }
           
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }


    private void FunPriBindGridDetails()
    {
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {
            Procparam = new Dictionary<string, string>();

            Procparam.Add("@OPTION", "2");
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@USER_ID", Convert.ToString(intUserId));
            Procparam.Add("@Upload_ID", Convert.ToString(intUpload_ID));
            dtsearch = Utility_FA.GetDataset("FA_GET_BUD_FILEUPLOADDETAILS", Procparam);
            pnlSummary.Visible = true;
            grvUploadSummary.Visible = false;
            grvUploadSummary.DataSource = dtsearch.Tables[0];
            grvUploadSummary.DataBind();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
    }

    private void FunPriValidateUploadDtls(Int64 intUploadID, String Option)
    {
        try
        {
            Procparam = new Dictionary<string, string>();

            Procparam.Add("@OPTION", Option);
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@USER_ID", Convert.ToString(intUserId));
            Procparam.Add("@Upload_ID", Convert.ToString(intUploadID));
            Procparam.Add("@ACTIVITYTYPE_ID", Convert.ToString(ddlActivity.SelectedValue));
            DataSet dsUploadDetails = Utility_FA.GetDataset("FA_GET_BUD_FILEUPLOADDETAILS", Procparam);

            FunPriGetUploadDtls(dsUploadDetails);
            //  flUpload.Visible = false;
            // btnClear.Enabled = false;
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
            grvUploadSummary.ClearGrid_FA();
            pnlSummary.Visible = true;
            grvUploadSummary.DataSource = dsDetails.Tables[0];
            grvUploadSummary.DataBind();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    protected void grvUploadSummary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //LinkButton btnSave = (LinkButton)e.Row.FindControl("btnSave");
                //Label lblcntsave = (Label)e.Row.FindControl("lblcntsave");
                //LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");
                //Label lblcntDelete = (Label)e.Row.FindControl("lblcntDelete");
                //if (lblcntsave.Text == "1")
                //    btnSave.Visible = true;
                //else
                //    btnSave.Visible = false;
                //if (lblcntDelete.Text == "1")
                //    btnDelete.Visible = false;
                //else
                //    btnDelete.Visible = true;
            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            throw objException;
        }
    }
}