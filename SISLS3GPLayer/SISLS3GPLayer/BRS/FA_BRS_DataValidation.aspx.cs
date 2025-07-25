using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using FA_BusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
using System.Text;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using System.Data.OleDb;
using FA_BusEntity.FinancialAccounting;
using FATransactionServiceReference;
using System.Data.SqlClient;
using System.Xml;

public partial class BRS_FA_BRS_DataValidation : ApplyThemeForProject_FA
{
    #region "Variable Declaration"

    DataSet ds = new DataSet();
    DataTable dtfintable = new DataTable();
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    string filename = string.Empty;
    string strfolder = string.Empty;
    int col = 0;
    DataTable dtcol = new DataTable();
    int ret = 0, Flag = 0;
    int m = 0;
    string fullpath = string.Empty;
    string strDateFormat = string.Empty;
    Hedging.FA_BRS_DatavalidationDataTable objvaldtbl = null;
    Hedging.FA_BRS_DatavalidationRow objvaldtblrow = null;
    FATransactionServiceReference.FATransactionServiceClient objtrans = null;
    FASerializationMode sermode = FASerializationMode.Binary;
    Microsoft.Office.Interop.Excel.Application excapp;
    string strRedirectPage = "~/BRS/FATransLander.aspx?Code=BRSD";
    string strRedirectPageView = "window.location.href='../BRS/FATransLander.aspx?Code=BRSD';";
    string strPageName = "Bank Statement Upload";
    string strAlert = "alert('__ALERT__');";
    string strKey = "Insert";
    string SheetName = String.Empty;
    string strDocNo = string.Empty;
    Int32 intCompanyID, IntUserID;
    string strMode = string.Empty;
    Int64 intUploadID = 0;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            strDateFormat = ObjFASession.ProDateFormatRW;
            CEFromDate.Format = strDateFormat;
            caltodate.Format = strDateFormat;
            txtFromdate.Attributes.Add("onchange", "fnDoDate1(this,'" + txtFromdate.ClientID + "','" + strDateFormat + "',true,'false','');");
            txtTodate.Attributes.Add("onchange", "fnDoDate1(this,'" + txtTodate.ClientID + "','" + strDateFormat + "',true,'false','T');");
            fpd.Attributes.Add("onchange", "fnAssignPath('" + fpd.ClientID + "','" + hdnSelectedPath.ClientID + "'); fnLoadPath('" + btnBrowse.ClientID + "');");
            btnDlg.OnClientClick = "fnLoadPath('" + fpd.ClientID + "');";
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            IntUserID = ObjUserInfo_FA.ProUserIdRW;

            //txtFromdate.Attributes.Add("onchange", "fnDoDate(this,'" + txtFromdate.ClientID + "','" + strDateFormat + "',true,'false',true,'" + ObjFASession.ProFinYearStartDate + "','" + ObjFASession.ProFinYearEndDate + "');");
            //txtTodate.Attributes.Add("onchange", "fnDoDate(this,'" + txtTodate.ClientID + "','" + strDateFormat + "',true,'false',true,'" + ObjFASession.ProFinYearStartDate + "','" + ObjFASession.ProFinYearEndDate + "');");
            //txtFromdate.Attributes.Add("onchange", "fnDoDate1(this,'" + txtFromdate.ClientID + "','" + strDateFormat + "',true,'false','');");
            //txtTodate.Attributes.Add("onchange", "fnDoDate1(this,'" + txtTodate.ClientID + "','" + strDateFormat + "',true,'false','T');");

            if (Request.QueryString["qsMode"] != null)
            {
                strMode = Request.QueryString.Get("qsMode");
                if (Request.QueryString["qsViewId"] != null)
                {
                    FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                    intUploadID = Convert.ToInt64(fromTicket.Name);
                }
            }
            else
                strMode = "C";

            if (!IsPostBack)
            {
                FunPriLoadBankDetails();
                FunPriEnblDsblCtrl();
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    #region "EVENTS"

    protected void ddlbankname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunpubClear();

            #region "Commented On 14Jul2016"

            /*
            if (ddlbankname.SelectedIndex == 0)
            {
                FunpubClear();
                return;
            }
            
            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            dictparam.Add("@Option", "2");
            dictparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictparam.Add("@Usr_ID", Convert.ToString(IntUserID));
            dictparam.Add("@Bank_ID", Convert.ToString(ddlbankname.SelectedValue));

            DataSet dsClmnLst = Utility_FA.GetDataset("FA_CMN_BRSLst", dictparam);
            if (dsClmnLst != null && dsClmnLst.Tables[0].Rows.Count == 0 && dsClmnLst.Tables.Count > 1)
            {
                txtType.Text = Convert.ToString(dsClmnLst.Tables[1].Rows[0]["Doc_Type"]);
                lblTypeID.Text = Convert.ToString(dsClmnLst.Tables[1].Rows[0]["Type_ID"]);

                ViewState["ColumnList"] = dsClmnLst.Tables[2];

                //ddllocation.FillDataTable(dsClmnLst.Tables[0], "ID", "Name");
            }
            else if (dsClmnLst != null && dsClmnLst.Tables[0].Rows.Count > 0 && dsClmnLst.Tables.Count == 1)
            {
                //ddllocation.FillDataTable(dsClmnLst.Tables[0], "ID", "Name");

                txtType.Text = "";
                lblTypeID.Text = "0";

                ViewState["ColumnList"] = null;
            }
            else
            {
                FunpubClear();
                Utility_FA.FunShowAlertMsg_FA(this, "BRS File Format not yet defined for the Selected Bank");
                return;
            }
            */

            /*
            if (dsClmnLst != null && dsClmnLst.Tables[2].Rows.Count > 0)
            {
                ViewState["ColumnList"] = dsClmnLst.Tables[0];
                ddllocation.FillDataTable(dsClmnLst.Tables[1], "ID", "Name");
                //ddllocation.BindDataTable_FA(dt, "Location_Id", "Location_Name");
                //ddllocation.Items.FindByValue(dt.Rows[0]["Location_id"].ToString()).Selected = true;
                //ddllocation.Enabled = false;                
                txtType.Text = Convert.ToString(dsClmnLst.Tables[2].Rows[0]["Doc_Type"]);
                lblTypeID.Text = Convert.ToString(dsClmnLst.Tables[2].Rows[0]["Type_ID"]);
            }
            else
            {
                FunpubClear();
                Utility_FA.FunShowAlertMsg_FA(this, "BRS File Format not yet defined for the Selected Bank");
                return;
            }
            */
            #endregion
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void ddllocation_Item_Selected(object Sender, EventArgs e)
    {
        try
        {
            FunpubClear();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (!FunPriValidateFromDate())
            {
                return;
            }
            //object instantiation//

            string strConnectionName = ObjFASession.ProConnectionName;
            objvaldtbl = new Hedging.FA_BRS_DatavalidationDataTable();
            objvaldtblrow = objvaldtbl.NewFA_BRS_DatavalidationRow();
            objtrans = new FATransactionServiceReference.FATransactionServiceClient();

            //object instantiation end//

            #region "Hide"

            ////Dictionary<string, string> Procparam = new Dictionary<string, string>();
            ////Procparam.Add("@Company_Id", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            ////Procparam.Add("@Location_Id", ddllocation.SelectedValue);
            ////Procparam.Add("@Bank_Id", ddlbankname.SelectedValue);
            ////ds = Utility_FA.GetDataset("FA_BRS_Get_FileFormat", Procparam);

            ////for (int i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
            ////{
            ////    dtfintable.Columns.Add(ds.Tables[0].Rows[i]["Field_Desc"].ToString());
            ////}

            ////filename = fpd.FileName;
            ////strfolder = (Server.MapPath(".") + "\\PDF Files\\BRS File\\");
            ////fpd.SaveAs(strfolder + filename);

            ////if (txtType.Text == "Text")
            ////{
            ////    int val = fpd.FileName.IndexOf(".");

            ////    if (!(fpd.FileName.Substring(val, (fpd.FileName.Length - val)) == ".txt"))
            ////    {
            ////        Utility_FA.FunShowAlertMsg_FA(this, "Please upload a text file");
            ////        return;
            ////    }
            ////    fungettextdata();
            ////}

            ////else
            ////{
            ////    int val = fpd.FileName.IndexOf(".");

            ////    //if (!(fpd.FileName.Substring(val, (fpd.FileName.Length - val)) == ".xls") && !(fpd.FileName.Substring(val, (fpd.FileName.Length - val)) == ".xlsx"))
            ////    //{
            ////    //    Utility_FA.FunShowAlertMsg_FA(this, "Please enter a valid excel file");
            ////    //    return;
            ////    //}
            ////    fungetexceldata();
            ////    if (dtcol.Columns.Count != dtfintable.Columns.Count)
            ////    {
            ////        Utility_FA.FunShowAlertMsg_FA(this, "Invalid file format");
            ////        return;
            ////    }
            ////}

            #endregion

            objvaldtblrow.Location_ID = Convert.ToInt16(ddllocation.SelectedValue);
            objvaldtblrow.Bank_ID = Convert.ToInt16(ddlbankname.SelectedValue);
            objvaldtblrow.From_Date = Utility_FA.StringToDate(txtFromdate.Text);
            objvaldtblrow.To_Date = Utility_FA.StringToDate(txtTodate.Text);
            //objvaldtblrow.Path = fullpath;
            objvaldtblrow.Path = Convert.ToString(ViewState["FilePath"]);
            objvaldtblrow.Is_Active = true;
            //objvaldtblrow.xmldet = funpubcreatexml();
            objvaldtblrow.XMLdet = string.Empty;
            objvaldtblrow.Created_By = Convert.ToInt32(IntUserID);
            objvaldtblrow.Company_ID = Convert.ToInt32(intCompanyID);
            objvaldtbl.Rows.Add(objvaldtblrow);

            int errcode = objtrans.FunPubInsertBRSValidation(out strDocNo, sermode, FAClsPubSerialize.Serialize(objvaldtbl, sermode), strConnectionName);

            if (errcode == 0)
            {
                strAlert = strAlert.Replace("__ALERT__", "File Saved Successfully");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                btnSave.Enabled = false;
            }
            else if (errcode == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Statement already available for the selected period");
            }
            else
            {
                throw new Exception("Unable to save the file");
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        try
        {
            //Dictionary<string, string> dictp = new Dictionary<string, string>();
            //if (ddlbankname.SelectedIndex == 0)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select a Bank");
            //    return;
            //}
            //if (string.IsNullOrEmpty(txtFromdate.Text))
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select From Date");
            //    return;

            //}
            //if (string.IsNullOrEmpty(txtTodate.Text))
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select To Date");
            //    return;

            //}

            //dictp.Add("@From_Date", Convert.ToString(Utility_FA.StringToDate(txtFromdate.Text)));
            //dictp.Add("@To_Date", Convert.ToString(Utility_FA.StringToDate(txtTodate.Text)));
            //dictp.Add("@Bank_id", ddlbankname.SelectedValue);

            //DataTable dtstatement = Utility_FA.GetDefaultData("FA_Get_BRSPath", dictp);

            //if (dtstatement.Rows.Count == 0)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Statement not available for the selected period");
            //    return;
            //}

            if (txtType.Text.Equals("Excel"))
            {
                //string XlsPath = dtstatement.Rows[0]["Path"].ToString();
                string XlsPath = Convert.ToString(txtUploadPath.Text);
                FileInfo fileDet = new System.IO.FileInfo(XlsPath);
                Response.Clear();
                Response.Charset = "UTF-8";
                Response.ContentEncoding = Encoding.UTF8;
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fileDet.Name));
                Response.AddHeader("Content-Length", fileDet.Length.ToString());
                Response.ContentType = "application/ms-excel";
                Response.Flush();
                Response.WriteFile(fileDet.ToString());
                Response.End();
            }

            else
            {
                //string path = dtstatement.Rows[0]["Path"].ToString();
                string XlsPath = Convert.ToString(txtUploadPath.Text);
                FileInfo fileDet = new System.IO.FileInfo(XlsPath);
                Response.Clear();
                Response.Charset = "UTF-8";
                Response.ContentEncoding = Encoding.UTF8;
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(fileDet.Name));
                Response.AddHeader("Content-Length", fileDet.Length.ToString());
                Response.ContentType = "application/CSV";
                Response.Flush();
                Response.WriteFile(fileDet.ToString());
                Response.End();
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btndelete_Click(object sender, EventArgs e)
    {
        try
        {
            #region "Commented"

            //if (ddlbankname.SelectedIndex == 0)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select a Bank");
            //    return;
            //}

            //if (string.IsNullOrEmpty(txtFromdate.Text))
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select From Date");
            //    return;

            //}

            //if (string.IsNullOrEmpty(txtTodate.Text))
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Please select To Date");
            //    return;

            //}

            //Dictionary<string, string> dictdelete = new Dictionary<string, string>();

            //dictdelete.Add("@From_Date", Convert.ToString(Utility_FA.StringToDate(txtFromdate.Text)));
            //dictdelete.Add("@To_Date", Convert.ToString(Utility_FA.StringToDate(txtTodate.Text)));
            //dictdelete.Add("@Bank_id", ddlbankname.SelectedValue);
            //if (Utility_FA.GetDefaultData("FA_Get_BRSPathfordelete", dictdelete).Rows.Count == 0)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "Statement not available for the selected period");
            //    return;

            //}
            //else if (Utility_FA.GetDefaultData("FA_Get_BRSPathfordelete", dictdelete).Rows[0]["path"].ToString() == "1")
            //{

            //    Utility_FA.FunShowAlertMsg_FA(this, "Reconciled Statement cannot be deleted");
            //    return;
            //}
            //dictdelete.Clear_FA();
            //dictdelete.Add("@Is_Active", false.ToString());
            //dictdelete.Add("@bank_id", ddlbankname.SelectedValue);
            //dictdelete.Add("@From_Date", Utility_FA.StringToDate(txtFromdate.Text).ToString());
            //dictdelete.Add("@To_Date", Utility_FA.StringToDate(txtTodate.Text).ToString());
            //DataTable dtdelete = Utility_FA.GetDefaultData("S3G_BnkStatmtDelete", dictdelete);
            //Utility_FA.FunShowAlertMsg_FA(this, "Statement Deleted successfully");

            #endregion

            Dictionary<string, string> dictdelete = new Dictionary<string, string>();
            dictdelete.Add("@Upload_Hdr_ID", Convert.ToString(intUploadID));
            dictdelete.Add("@Company_ID", Convert.ToString(intCompanyID));

            Utility_FA.GetDefaultData("S3G_BnkStatmtDelete", dictdelete);
            strAlert = strAlert.Replace("__ALERT__", "Statement Deleted successfully");
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage, false);
        }
        catch (Exception ObjException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ObjException, "Bank Statement Upload", "FA");
        }
    }

    protected void btnBrowse_Click(object sender, EventArgs e)
    {
        try
        {
            string strErrorMsg = "Please Correct the following Validations:<br/><br/>";
            string strError = "";

            if (Convert.ToInt64(ddlbankname.SelectedValue) <= 0)
            {
                strError = strError + "   Select Bank Name.<br/>";
            }

            if (Convert.ToInt64(ddllocation.SelectedValue) == 0 || Convert.ToString(ddllocation.SelectedText) == "")
            {
                strError = strError + "   Enter Branch.<br/>";
            }

            if (Convert.ToString(txtFromdate.Text) == "")
            {
                strError = strError + "   Bank Statement Start Date should not be blank.<br/>";
            }

            if (Convert.ToString(txtTodate.Text) == "")
            {
                strError = strError + "   Bank Statement End date should not be blank.<br/>";
            }

            if (strError != "")
            {
                strErrorMsg = strErrorMsg + strError;
                CVUpload.ErrorMessage = Convert.ToString(strErrorMsg);
                CVUpload.IsValid = false;
                //Utility_FA.FunShowAlertMsg_FA(this, strErrorMsg);
                return;
            }

            if (!FunPriValidateFromDate())
            {
                return;
            }

            if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtFromdate, txtFromdate.Text, lblFromdate.Text))
            {
                txtFromdate.Text = "";
                return;
            }

            if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtTodate, txtTodate.Text, lblTodate.Text))
            {
                txtTodate.Text = "";
                return;
            }

            if (!FunPriGetUploadFormatDtls())
            {
                return;
            }

            lblUploadErrorMsg.InnerHtml = lblExcelCurrentPath.Text = "";
            btnUpload.Enabled = btnValidate.Enabled = btnException.Enabled = btnSave.Enabled = false;
            HttpFileCollection hfc = Request.Files;
            HttpPostedFile hpf = hfc[0];
            if (hpf.ContentLength > 0)
            {
                if (Convert.ToInt32(lblTypeID.Text) == 13)
                {
                    if (!((Path.GetExtension(hpf.FileName) == ".xls") || (Path.GetExtension(hpf.FileName) == ".xlsx")))
                    {
                        CVUpload.ErrorMessage = "Upload Excel File and Extension should be .xls or .xslx";
                        CVUpload.IsValid = false;
                        return;
                    }
                }
                else if (Convert.ToInt32(lblTypeID.Text) == 14)
                {
                    if (!(Path.GetExtension(hpf.FileName) == ".txt"))
                    {
                        CVUpload.ErrorMessage = "Upload Text File and Extension should be .txt";
                        CVUpload.IsValid = false;
                        return;
                    }
                }

                if (Convert.ToString(txtUploadPath.Text).Trim() == "")
                {
                    CVUpload.ErrorMessage = "Enter the Document Path";
                    CVUpload.IsValid = false;
                    return;
                }

                String strFilePath = Convert.ToString(txtUploadPath.Text).Trim();
                if (!Directory.Exists(strFilePath))
                {
                    CVUpload.ErrorMessage = "Document Path should be valid path";
                    CVUpload.IsValid = false;
                    return;
                }


                fpd.ToolTip = hdnSelectedPath.Value;

                string[] filename = fpd.FileName.Split('.');
                string StrFileNameFormat = filename[0] + "_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "." + filename[1];
                ViewState["FileName"] = Convert.ToString(StrFileNameFormat);
                if (!Directory.Exists(strFilePath))
                    Directory.CreateDirectory(strFilePath);

                strFilePath = strFilePath + "\\" + StrFileNameFormat;
                fpd.SaveAs(strFilePath);
                ViewState["FilePath"] = strFilePath;
                btnUpload.Enabled = true;
                lblExcelCurrentPath.Text = Convert.ToString(ViewState["FileName"]);
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            lblUploadErrorMsg.InnerHtml = "";
            string strPathName = ViewState["FilePath"].ToString();
            string strFilepath = System.IO.Path.GetFullPath(strPathName);

            //Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(ViewState["FileName"]) + "," + Convert.ToString(ViewState["FilePath"]) + "," + Path.GetExtension(strFilepath));

            if (Convert.ToInt32(lblTypeID.Text) == 13) //Excel
            {
                if (Path.GetExtension(strFilepath) == ".xls" || Path.GetExtension(strFilepath) == ".xlsx")
                {
                    FunPriFileUpload(Convert.ToString(ViewState["FileName"]), Convert.ToString(ViewState["FilePath"]), Path.GetExtension(strFilepath));
                }
            }
            else if (Convert.ToInt32(lblTypeID.Text) == 14) //Text
            {
                string strLine = string.Empty;
                Dictionary<string, string> dictParam = new Dictionary<string, string>();
                dictParam.Add("@Option", "9");
                dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
                dictParam.Add("@Usr_ID", Convert.ToString(IntUserID));
                dictParam.Add("@Bank_ID", Convert.ToString(ddlbankname.SelectedValue));
                dictParam.Add("@Location_ID", Convert.ToString(ddllocation.SelectedValue));

                DataSet dsUpld = Utility_FA.GetDataset("FA_CMN_BRSLst", dictParam);
                //ViewState["BankDataTableFormat"] = dsUpld.Tables[0];
                DataTable dtBankTblFmt = dsUpld.Tables[0].Clone();

                Int64 intLineCount = 0;
                using (var reader = File.OpenText(strFilepath))
                {
                    while (reader.ReadLine() != null)
                    {
                        intLineCount++;
                    }
                }

                if (intLineCount == 0)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "File sholud not be Empty");
                    return;
                }

                DataView dvExcelClmn = new DataView(dsUpld.Tables[1]);
                dvExcelClmn.RowFilter = "Is_ExcelClmnName = 1";
                DataTable dtExcelClmnName = dvExcelClmn.ToTable();

                using (var reader = File.OpenText(strFilepath))
                {
                    Int32 iLpCnt = 0;
                    while (iLpCnt < intLineCount)
                    {
                        strLine = reader.ReadLine();
                        DataRow drow = dtBankTblFmt.NewRow();
                        for (int i = 0; i < dtExcelClmnName.Rows.Count; i++)
                        {
                            if (Convert.ToInt32(Convert.ToString(strLine).Length) >= Convert.ToInt32(dtExcelClmnName.Rows[i]["End_To"]))
                            {
                                drow[i] = Convert.ToString(strLine).Substring(Convert.ToInt32(dtExcelClmnName.Rows[i]["Start_From"]) - 1, Convert.ToInt32(dtExcelClmnName.Rows[i]["Char_Length"]));
                            }
                            else if (i == (dtExcelClmnName.Rows.Count - 1))
                            {
                                drow[i] = Convert.ToString(strLine).Substring(Convert.ToInt32(dtExcelClmnName.Rows[i]["Start_From"]) - 1, ((Convert.ToInt32(Convert.ToString(strLine).Length) - Convert.ToInt32(dtExcelClmnName.Rows[i]["Start_From"])) + 1));
                            }
                        }
                        dtBankTblFmt.Rows.Add(drow);
                        dtBankTblFmt.AcceptChanges();
                        iLpCnt++;
                    }
                }

                Flag = FunPriInsertTextFileData(dtBankTblFmt, dsUpld.Tables[1]);

                if (Flag == 1)
                {
                    btnValidate.Enabled = true; btnUpload.Enabled = false;
                    strAlert = strAlert.Replace("__ALERT__", "File uploaded successfully");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                }
                else
                {
                    btnValidate.Enabled = false;
                    strAlert = strAlert.Replace("__ALERT__", "File upload Failed");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                }
            }
        }
        catch (Exception objException)
        {
            Utility_FA.FunShowAlertMsg_FA(this, "Unable to Upload. File may contain invalid records / Invalid Format. kindly check and Proceed");
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
            //if (File.Exists(Convert.ToString(ViewState["FilePath"])))
            //{
            //    File.Delete(Convert.ToString(ViewState["FilePath"]));
            //}
            btnUpload.Enabled = false;
        }
    }

    protected void btnValidate_Click(object sender, EventArgs e)
    {
        try
        {
            if (!FunPriValidateFromDate())
                return;
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@User_ID", Convert.ToString(IntUserID));
            dictParam.Add("@Start_Date", Utility_FA.StringToDate(txtFromdate.Text).ToString());
            dictParam.Add("@End_Date", Utility_FA.StringToDate(txtTodate.Text).ToString());

            DataTable dtVldt = Utility_FA.GetDefaultData("FA_BRS_ValidateBnkStmtUpldDtl", dictParam);
            if (dtVldt != null && dtVldt.Rows.Count > 0)
            {
                btnValidate.Enabled = false;
                btnSave.Enabled = (Convert.ToInt32(dtVldt.Rows[0]["Error_Code"]) == 0) ? true : false;
                btnException.Enabled = (Convert.ToInt32(dtVldt.Rows[0]["Error_Code"]) == 1) ? true : false;

                Utility_FA.FunShowAlertMsg_FA(this, (Convert.ToInt32(dtVldt.Rows[0]["Error_Code"]) == 0) ? "File Validated Successfully.Kindly proceed with save." : "File Validated Successfully.Request to correct the exceptions and upload the same.");
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void btnException_Click(object sender, EventArgs e)
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Option", "3");
            dictParam.Add("@Usr_ID", Convert.ToString(IntUserID));
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (Convert.ToInt64(ddllocation.SelectedValue) > 0 && Convert.ToString(ddllocation.SelectedText) != "")
                dictParam.Add("@Location_ID", Convert.ToString(ddllocation.SelectedValue));
            dictParam.Add("@Bank_ID", Convert.ToString(ddlbankname.SelectedValue));
            DataTable dtExcp = Utility_FA.GetDefaultData("FA_CMN_BRSLst", dictParam);

            GridView Grv = new GridView();

            Grv.DataSource = dtExcp;
            Grv.DataBind();
            Grv.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            Grv.ForeColor = System.Drawing.Color.DarkBlue;

            if (Grv.Rows.Count > 0)
            {
                string attachment = "attachment; filename=Annex-UploadException.xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.xlsx";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);

                Grv.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName, "FA");
        }
    }

    protected void hyplnkView_Click(object sender, ImageClickEventArgs e)
    {

    }

    #endregion

    #region "USER DEFINED FUNCTIONS"

    private void FunPriLoadBankDetails()
    {
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            DataTable dtBankList = Utility_FA.GetDefaultData(SPNames.Get_BankDetail_Receipt, Procparam);
            ViewState["vs_BankList"] = dtBankList;
            ddlbankname.BindDataTable_FA(dtBankList, "Bank_Detail_ID", "Bank_Name");

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunpubClear()
    {
        try
        {
            txtType.Text = lblExcelCurrentPath.Text = "";
            ViewState["ColumnList"] = null;
            lblTypeID.Text = "0";
            btnValidate.Enabled = btnException.Enabled = btnUpload.Enabled = btnSave.Enabled = false;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private string funpubcreatexml()
    {
        try
        {
            DataTable dtxml = txtType.Text == "Text" ? (DataTable)ViewState["dtStagingtable"] : (DataTable)ViewState["dsexcel"];
            StringBuilder strxml = new StringBuilder();
            strxml.Append("<Root>");

            for (int j = 0; j <= dtxml.Rows.Count - 1; j++)
            {
                strxml.Append("<Details ");
                strxml.Append("Location_id = '" + ddllocation.SelectedValue + " '");
                strxml.Append(" Bank_id = '" + ddlbankname.SelectedValue + " '");
                for (int i = 0; i <= dtxml.Columns.Count - 1; i++)
                {
                    strxml.Append(" " + dtxml.Columns[i].ColumnName + "= '" + (dtxml.Rows[j][dtxml.Columns[i].ColumnName] ==
                        DBNull.Value ? (0).ToString() : dtxml.Rows[j][dtxml.Columns[i].ColumnName]).ToString() + " '");

                }
                strxml.Append("/>");
            }

            strxml.Append("</Root>");
            return strxml.ToString();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    //this function copies the excel data to a dataset//
    private void fungetexceldata()
    {
        try
        {
            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            //string filename = fpd.FileName;
            string filename = "BRS_Chennai43_ABNAMROBANK_01JAN31JAN20161.xlsx";
            string strfolder = (Server.MapPath(".") + "\\PDF Files\\BRS File\\");
            fullpath = strfolder + filename;

            DataSet dset = new DataSet();
            string constr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;

            constr = String.Format(constr, (strfolder + filename), "Yes");
            OleDbConnection connexcel = new OleDbConnection(constr);
            OleDbCommand command = new OleDbCommand();
            OleDbDataAdapter adapter = new OleDbDataAdapter();

            command.Connection = connexcel;

            connexcel.Open();

            DataTable dtExcelSchema = connexcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            string SheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
            connexcel.Close();

            connexcel.Open();
            command.CommandText = "SELECT *  From [" + SheetName + "]";
            adapter.SelectCommand = command;
            adapter.Fill(dset);
            int k = 0;
            int r = 0;
            int l = 0;
            int s = 0;
            int row = 0;
            DataRow drdcol = dtcol.NewRow();
            dtcol.Rows.Add(drdcol);

            DataRow drcol1 = null;

            foreach (DataRow drowcol in dset.Tables[0].Rows)
            {
                drcol1 = dtcol.NewRow();
                dtcol.Rows.Add(drcol1);
                foreach (DataColumn dcol in dset.Tables[0].Columns)
                {
                    if (dtfintable.Columns.Contains(dcol.ColumnName))
                    {
                        if (row != 1)
                            dtcol.Columns.Add(dcol.ColumnName);
                        drcol1[dcol.ColumnName] = drowcol[dcol.ColumnName];
                        col = 1;
                    }
                }
                row = 1;
            }

            if (col != 1)
            {
                for (int i = 0; i <= dset.Tables[0].Rows.Count - 1; i++)
                {
                    for (int j = 0; j <= dset.Tables[0].Columns.Count - 1; j++)
                    {
                        l = j;
                        if ((dset.Tables[0].Rows[i][j].ToString().Trim() == dtfintable.Columns[k].ColumnName.Trim()) && ((m != dtfintable.Columns.Count)))
                        {
                            dtcol.Columns.Add(dset.Tables[0].Rows[i][j].ToString());
                            drdcol[dset.Tables[0].Rows[i][j].ToString()] = dset.Tables[0].Rows[i + 1][j].ToString();
                            m++;
                            k++;
                            k = (k > dtfintable.Columns.Count - 1) ? 0 : k;
                            r = i;
                            s = i;
                        }
                        else if ((dset.Tables[0].Rows[s][l].ToString().Trim() == dtfintable.Columns[k].ColumnName.Trim()) && (m == dtfintable.Columns.Count))
                        {
                            if (i > r && i != dset.Tables[0].Rows.Count - 1)
                            {
                                drdcol = null;
                                drdcol = dtcol.NewRow();
                                dtcol.Rows.Add(drdcol);
                            }
                            if (i != dset.Tables[0].Rows.Count - 1)
                            {
                                drdcol[dset.Tables[0].Rows[s][j].ToString()] = dset.Tables[0].Rows[i + 1][j].ToString();
                                r = i;
                                k++;
                                k = (k > dtfintable.Columns.Count - 1) ? 0 : k;
                            }
                        }
                        //l = (l) ? 0 : l + 1;
                        //j= (j>=dset.Tables[0].Columns.Count - 1 && )
                    }
                    i = (m == 1) ? i + 1 : i;
                }
            }

            connexcel.Close();
            for (int h = 0; (h < dtcol.Rows.Count && dtcol.Columns.Count > 0); h++)
            {
                if (dtcol.Rows[h].IsNull(0) == true)
                {
                    dtcol.Rows[h].Delete();
                    h = ((h) == dtcol.Rows.Count) ? h : h - 1;
                }
            }
            //dtcol.AcceptChanges();

            ViewState["dsexcel"] = dtcol;
        }
        catch (Exception objException)
        {
            throw objException;
        }

    }
    //this function copies the text data to a dataset//
    private void fungettextdata()
    {
        try
        {
            StreamReader strm = new StreamReader(strfolder + filename);
            fullpath = strfolder + filename;
            string Line = "";
            while ((Line = strm.ReadLine()) != null)
            {
                if (Line.Trim() != string.Empty)
                {
                    int linelength = Line.Length;
                    DataRow dfinalrow = dtfintable.NewRow();
                    foreach (DataRow drow in ds.Tables[0].Rows)
                    {
                        string strValue = string.Empty, strColumnname = string.Empty;
                        int intstart = 0, intlength = 0;
                        if (!string.IsNullOrEmpty(drow["BRS_Format_Begin"].ToString()))
                            intstart = Convert.ToInt16(drow["BRS_Format_Begin"].ToString());
                        if (!string.IsNullOrEmpty(drow["BRS_Format_Length"].ToString()))
                            intlength = Convert.ToInt16(drow["BRS_Format_Length"].ToString());
                        if (!string.IsNullOrEmpty(drow["Field_Desc"].ToString()))
                            strColumnname = drow["Field_Desc"].ToString().ToUpper();
                        if (((intstart - 1) + intlength) <= linelength)
                        {
                            strValue = Line.Substring(intstart - 1, intlength);
                            if (!string.IsNullOrEmpty(strValue))
                                dfinalrow[strColumnname] = strValue;
                        }

                    }
                    dtfintable.Rows.Add(dfinalrow);
                }
            }

            ViewState["dtStagingtable"] = dtfintable;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private string Funsetsuffix()
    {
        try
        {
            int suffix = 1;
            FASession ObjSession = new FASession();
            suffix = ObjSession.ProGpsSuffixRW;

            //Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Company_Id", intCompanyID.ToString());
            //if (ddlCurrency.SelectedIndex > 0)
            //{
            //    if (Convert.ToInt16(ddlCurrency.SelectedValue) > 0)
            //        Procparam.Add("@Currency_Id", ddlCurrency.SelectedValue);
            //}
            //DataTable dt = new DataTable();
            //dt = Utility_FA.GetDefaultData("FA_GET_CURR_DCMLS", Procparam);
            //if (dt.Rows.Count > 0)
            //{
            //    if (!string.IsNullOrEmpty(dt.Rows[0]["DecimalSuffix"].ToString()))
            //        suffix = Convert.ToInt16(dt.Rows[0]["DecimalSuffix"].ToString());
            //}

            string strformat = "0.";
            for (int i = 1; i <= suffix; i++)
            {
                strformat += "0";
            }
            return strformat;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriFileUpload(string FileNameFormat, string filepath, string Extension)
    {
        try
        {
            // Utility_FA.FunShowAlertMsg_FA(this, FileNameFormat + "," + filepath + "," + Extension);

            FunProImportExcelData_To_DBTable(filepath, Extension, "Yes");
            if (Flag == 1)
            {
                btnValidate.Enabled = true; btnUpload.Enabled = false;
                strAlert = strAlert.Replace("__ALERT__", "File uploaded successfully");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
            else
            {
                btnValidate.Enabled = false;
                strAlert = strAlert.Replace("__ALERT__", "File upload Failed");
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected int FunProImportExcelData_To_DBTable(string FilePath, string Extension, string isHDR)
    {
        string strErrorMsg = "Please Correct The Validations <br/>";
        try
        {

            string filename = fpd.FileName;
            string strfolder = (Server.MapPath(".") + "\\PDF Files\\BRS File\\");
            fullpath = strfolder + filename;

            DataTable dtXLData = new DataTable();
            DataTable dtValidateXLData = new DataTable();
            DataTable ObjDtColumnList = (DataTable)ViewState["ColumnList"];
            //string conStr = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;

            string conStr = "";
            switch (Extension)
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
            OleDbConnection connExcel = new OleDbConnection(conStr);
            OleDbCommand cmdExcel = new OleDbCommand();
            OleDbDataAdapter oda = new OleDbDataAdapter();
            DataTable dt = new DataTable();

            cmdExcel.Connection = connExcel;
            //Get the name of First Sheet
            connExcel.Open();
            DataTable dtExcelSchema;
            dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
            SheetName = FunProGetSheetName(dtExcelSchema);
            connExcel.Close();

            //Read Data from First Sheet
            connExcel.Open();
            cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + ObjDtColumnList.Rows[0][1].ToString() + "] IS NOT NULL";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dtXLData);

            cmdExcel.CommandText = "SELECT * From [" + SheetName + "] WHERE [" + ObjDtColumnList.Rows[0][1].ToString() + "] IS NULL";
            oda.SelectCommand = cmdExcel;
            oda.Fill(dtValidateXLData);

            connExcel.Close();

            if (dtValidateXLData.Rows.Count >= 0 && dtXLData.Rows.Count == 0)
            {
                strErrorMsg += ObjDtColumnList.Rows[0][1].ToString() + "  is Blank ;";
                lblUploadErrorMsg.InnerHtml = strErrorMsg;
                dtValidateXLData.Dispose();
                Flag = 2;
            }

            //dtXLData.AsEnumerable().ToList()
            // .ForEach(row =>
            // {
            //     var cellList = row.ItemArray.ToList();
            //     row.ItemArray = cellList.Select(x => x.ToString().Trim()).ToArray();
            // });

            if (Flag == 0)
                Flag = FunProValidateExcelColumnHeaderDetails(dtXLData, ObjDtColumnList, FilePath);

        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
            if (objException.Message.Contains("No value given for one or more required parameters."))
            {
                strErrorMsg = "Please Correct The Validations";
                lblUploadErrorMsg.InnerHtml = strErrorMsg + "Uploaded File Contains Empty Rows and Columns";
                lblUploadErrorMsg.InnerHtml = objException.Message;
            }
            else
            {
                strErrorMsg = "Please Correct The Validations";
                lblUploadErrorMsg.InnerHtml = strErrorMsg + "Uploaded File is in Invalid Format";
                lblUploadErrorMsg.InnerHtml = objException.Message;
            }

            //if (File.Exists(Convert.ToString(ViewState["FilePath"])))
            //{
            //    File.Delete(Convert.ToString(ViewState["FilePath"]));
            //}
            btnUpload.Enabled = false;
        }
        return Flag;
    }

    //method added to get the valid sheet name
    protected string FunProGetSheetName(DataTable dtExcelSchema)
    {
        try
        {
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
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected int FunProValidateExcelColumnHeaderDetails(DataTable XLData, DataTable DBXLcolumnHeaderNames, string FilePath)
    {
        StringBuilder StrIncorrectColumn = new StringBuilder();
        StringBuilder StrColumnLength = new StringBuilder();
        if (XLData.Columns.Count >= DBXLcolumnHeaderNames.Select("Is_ExcelColumn = 1").Length)
        {
            foreach (DataRow ObjDR in DBXLcolumnHeaderNames.Select("Is_ExcelColumn = 1"))
            {
                string StrExcelColumn = "";
                StrExcelColumn = Convert.ToString(ObjDR["Excel_ColumnName"]).Trim().ToUpper();
                if (!XLData.Columns.Contains(StrExcelColumn))
                {
                    if (StrIncorrectColumn.Length == 0)
                        StrIncorrectColumn.Append("Unmatched Column(s) : ");

                    StrIncorrectColumn.Append(ObjDR["Excel_ColumnName"].ToString() + "; <BR/>");
                }
                //else
                //{
                //    int maxlength = 0;
                //    int intColNo = XLData.Columns.IndexOf(StrExcelColumn);
                //    XLData.Rows.OfType<DataRow>().ToList()
                //        .ForEach(ss =>
                //        {
                //            maxlength = Convert.ToString(ss.ItemArray[intColNo]).Length > maxlength ?
                //                Convert.ToString(ss.ItemArray[intColNo]).Length : maxlength;
                //        });

                //    if (!String.IsNullOrEmpty(ObjDR["Column_Length"].ToString()) && Convert.ToInt32(ObjDR["Column_Length"].ToString()) < maxlength)
                //    {
                //        if (StrColumnLength.Length == 0)
                //            StrColumnLength.Append("Column Length Exceed : ");

                //        StrColumnLength.Append(ObjDR["Excel_ColumnName"].ToString() +
                //            "; Valid Length - " + ObjDR["Column_Length"].ToString() +
                //            "; Available Length - " + maxlength + " <BR/>");
                //    }
                //}
            }
            if (StrIncorrectColumn.Length == 0 && StrColumnLength.Length == 0)
            {
                FunPriClearTempUpload();
                FunProBindDefaultColumns(XLData);
                string conn = FunPriGetConnectionString();
                SqlBulkCopy sbcd = new SqlBulkCopy(conn, SqlBulkCopyOptions.Default);
                sbcd.DestinationTableName = "FA_Tmp_BRSBankStmtDtl";
                foreach (DataRow row in DBXLcolumnHeaderNames.Rows)
                {
                    sbcd.ColumnMappings.Add(row["Excel_ColumnName"].ToString(), row["Db_ColumnName"].ToString());
                }
                sbcd.BatchSize = 1000;
                sbcd.WriteToServer(XLData);
                
                XLData.Clear();
                Flag = 1;
            }
            else
            {
                if (File.Exists(FilePath))
                {
                    File.Delete(FilePath);
                }
                lblUploadErrorMsg.InnerHtml = "File contains invalid column / data." + "<br/>" + StrIncorrectColumn.ToString() + "<br/>" + StrColumnLength.ToString();
            }
        }
        else
        {
            if (File.Exists(FilePath))
            {
                File.Delete(FilePath);
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Invalid file For Selected Template...');", true);
        }
        return Flag;
    }

    protected void FunProBindDefaultColumns(DataTable XL)
    {
        try
        {
            Int32 count = 0;
            XL.Columns.Add(new DataColumn("Company_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("Status_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("USR_ID", typeof(Int32)));
            XL.Columns.Add(new DataColumn("Uploaded_On", typeof(DateTime)));
            foreach (DataRow row in XL.Rows)
            {
                row["Company_ID"] = Convert.ToString(intCompanyID);
                row["Status_ID"] = 1;
                row["USR_ID"] = Convert.ToString(IntUserID);
                row["Uploaded_On"] = Convert.ToDateTime(DateTime.Now);
                count = count + 1;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriClearTempUpload()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Option", "1");
            dictParam.Add("@Usr_ID", Convert.ToString(IntUserID));
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));

            Utility_FA.GetDefaultData("FA_CMN_BRSLst", dictParam);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private string FunPriGetConnectionString()
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
                //FA_1_20152016
                String strFinYear = ObjFASession.ProFinYearRW;
                strFinYear = strFinYear.Replace('-', ' ');
                string[] strFinYearArray = strFinYear.Split(' ');
                strFinYear = "FA_" + Convert.ToString(intCompanyID) + "_" + strFinYearArray[0] + strFinYearArray[1];
                ConnectionString = conxmlDoc.ChildNodes[0].SelectSingleNode(strFinYear).ChildNodes[0].Attributes["connectionString"].Value;
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

    private void FunPriEnblDsblCtrl()
    {
        try
        {
            switch (strMode)
            {
                case "C":
                    FunPriLoadDocUpldPath();
                    btnUpload.Enabled = btnValidate.Enabled = btnException.Enabled =
                        btnSave.Enabled = btnView.Visible = btndelete.Visible = lblTypeID.Visible = false;
                    break;
                case "M":
                    trUpload.Visible = btnValidate.Visible = btnException.Visible = btnSave.Enabled =
                       lblTypeID.Visible = CEFromDate.Enabled = caltodate.Enabled = false;
                    txtUploadPath.Style["Display"] = "none";
                    lblUploadPath.Text = "Document Name";
                    FunPriLoadUploadDtl();

                    ddlbankname.ClearDropDownList_FA();
                    ddllocation.ReadOnly = true;
                    txtFromdate.ReadOnly = txtTodate.ReadOnly = txtType.ReadOnly = txtUploadPath.ReadOnly = true;
                    lblTypeID.Visible = false;
                    break;
                case "Q":
                    trUpload.Visible = btnValidate.Visible = btnException.Visible = btnSave.Enabled =
                        btndelete.Visible = CEFromDate.Enabled = caltodate.Enabled = false;
                    txtUploadPath.Style["Display"] = "none";
                    lblUploadPath.Text = "Document Name";
                    FunPriLoadUploadDtl();

                    ddlbankname.ClearDropDownList_FA();
                    ddllocation.ReadOnly = true;
                    txtFromdate.ReadOnly = txtTodate.ReadOnly = txtType.ReadOnly = txtUploadPath.ReadOnly = true;
                    lblTypeID.Visible = false;

                    break;
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriLoadUploadDtl()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Option", "4");
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Usr_ID", Convert.ToString(IntUserID));
            dictParam.Add("@Upload_Hdr_ID", Convert.ToString(intUploadID));

            DataSet dsUpld = Utility_FA.GetDataset("FA_CMN_BRSLst", dictParam);
            if (dsUpld != null)
            {
                DataTable dtUpldDtl = dsUpld.Tables[0];
                ddlbankname.SelectedValue = Convert.ToString(dtUpldDtl.Rows[0]["Bank_id"]);
                txtUploadPath.Text = Convert.ToString(dtUpldDtl.Rows[0]["Document_Path"]);
                txtFromdate.Text = Convert.ToString(dtUpldDtl.Rows[0]["From_Date"]);
                txtTodate.Text = Convert.ToString(dtUpldDtl.Rows[0]["To_Date"]);
                txtType.Text = Convert.ToString(dtUpldDtl.Rows[0]["Doc_Type"]);
                lblTypeID.Text = Convert.ToString(dtUpldDtl.Rows[0]["Type_ID"]);
                lblUpldFileName.Text = Convert.ToString(dtUpldDtl.Rows[0]["File_Name"]);
                ddllocation.SelectedText = Convert.ToString(dtUpldDtl.Rows[0]["Location_desc"]);
                ddllocation.SelectedValue = Convert.ToString(dtUpldDtl.Rows[0]["Location_ID"]);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriLoadDocUpldPath()
    {
        try
        {
            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            string strUpldDocPath = (string)AppReader.GetValue("BRS_Upload_Path", typeof(string));
            txtUploadPath.Text = Convert.ToString(strUpldDocPath);
            txtUploadPath.ReadOnly = true;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private int FunPriInsertTextFileData(DataTable TxtData, DataTable DBXLcolumnHeaderNames)
    {
        try
        {
            FunPriClearTempUpload();
            FunProBindDefaultColumns(TxtData);
            string conn = FunPriGetConnectionString();
            SqlBulkCopy sbcd = new SqlBulkCopy(conn, SqlBulkCopyOptions.Default);
            sbcd.DestinationTableName = "FA_Tmp_BRSBankStmtDtl";
            foreach (DataRow row in DBXLcolumnHeaderNames.Rows)
            {
                sbcd.ColumnMappings.Add(row["Db_ColumnName"].ToString(), row["Db_ColumnName"].ToString());
            }
            sbcd.BatchSize = 1000;
            sbcd.WriteToServer(TxtData);
            TxtData.Clear();
            Flag = 1;
        }
        catch (Exception objException)
        {
            Flag = 0;
            throw objException;
        }
        return Flag;
    }

    private bool FunPriGetUploadFormatDtls()
    {
        bool blnRslt = true;
        try
        {
            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            dictparam.Add("@Option", "2");
            dictparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictparam.Add("@Usr_ID", Convert.ToString(IntUserID));
            dictparam.Add("@Bank_ID", Convert.ToString(ddlbankname.SelectedValue));
            dictparam.Add("@Location_ID", Convert.ToString(ddllocation.SelectedValue));

            DataSet dsClmnLst = Utility_FA.GetDataset("FA_CMN_BRSLst", dictparam);
            if (dsClmnLst != null && dsClmnLst.Tables.Count > 0)
            {
                blnRslt = true;
                txtType.Text = Convert.ToString(dsClmnLst.Tables[0].Rows[0]["Doc_Type"]);
                lblTypeID.Text = Convert.ToString(dsClmnLst.Tables[0].Rows[0]["Type_ID"]);

                ViewState["ColumnList"] = dsClmnLst.Tables[1];
            }
            else
            {
                blnRslt = false;
                FunpubClear();
                Utility_FA.FunShowAlertMsg_FA(this, "BRS File Format not yet defined for the Selected Bank");
            }
        }
        catch (Exception objException)
        {
            blnRslt = false;
            throw objException;
        }
        return blnRslt;
    }

    private bool FunPriValidateFromDate()
    {
        bool blnResult = true;
        try
        {
            if (Convert.ToString(txtFromdate.Text) != "" && Convert.ToString(txtTodate.Text) != "")
            {
                if (Utility_FA.StringToDate(txtFromdate.Text) > Utility_FA.StringToDate(txtTodate.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Bank Statement End Date should be greater than Bank Statement Start Date");
                    blnResult = false;
                }
            }
        }
        catch (Exception objException)
        {
            blnResult = false;
        }
        return blnResult;
    }

    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetBranchList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        UserInfo_FA Ufo = new UserInfo_FA();

        Procparam.Clear();
        Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
        Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
        Procparam.Add("@Program_Id", "100");
        Procparam.Add("@Is_Operational", "1");
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_Loca_List_AGT", Procparam));

        return suggetions.ToArray();
    }



}