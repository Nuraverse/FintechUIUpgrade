
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Bank Reconciliation Screen
/// Created By			: M.Saran
/// Created Date		: 03-Sep-2013
/// Purpose	            : 
/// Reason              : Bank Reconciliation creation
/// <Program Summary>
#endregion

#region Namespaces
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

#endregion

public partial class Financial_Accounting_FABRS_Add : ApplyThemeForProject_FA
{
    #region Initialization
    int intCompanyID, intUserID = 0;
    Dictionary<string, string> Procparam = null;
    string strBRS_Id = string.Empty;
    int intErrCode = 0;
    string validationCode;
    string strDateFormat = "";
    string strSuffixFormat = "0.00";
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    FASerializationMode ObjSerMode = FASerializationMode.Binary;
    DataTable dtAdjustmentDetails;
    DataTable dtPaymentDtls;
    DataTable dtReceiptDtls;
    DataTable dtInvestment;
    DataTable dtDim;
    DataTable dtStagingtable;
    StringBuilder sbConditionsXML;
    StringBuilder sbBudget_XML = new StringBuilder();
    string[] arrSortCol = new string[] { "Add_Less_Type", "Group_Doc_Ref", "Document_Number", "Document_Date", "Description", "Amount" };
    string strSearchValue = string.Empty;
    string[] arraySearch;
    static string strProcName = "FA_BRS_GETReceiptDetails";
    //static string strProcName = "FA_BRS_GETReceiptDetails_POC";

    string strConnectionName = string.Empty;
    int intBRS_Id = 0;
    string strBRS_No = "";

    FATransactionServiceReference.FATransactionServiceClient objFATranMasterMgt = new FATransactionServiceReference.FATransactionServiceClient();
    FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable objFA_BRSDataTable = new FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable();
    FA_BusEntity.FinancialAccounting.Hedging.FA_BRSRow objFA_BRSRow;


    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "~/BRS/FATransLander.aspx?Code=FABRS";
    string strRedirectPageAdd = "window.location.href='../BRS/FABRS_Add.aspx';";
    string strRedirectPageView = "window.location.href='../BRS/FATransLander.aspx?Code=FABRS';";
    string strRedirectDIM = "../BRS/FATransLander.aspx?Code=FABRS";

    static string strPageName = "BRS";
    //User Authorization
    string strMode = "C";
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bMakerChecker = false;
    //Code end

    #region "Page Variables"

    FAPagingValues ObjRcptPaging = new FAPagingValues();
    public delegate void PageAssignValue(int ProRcptPageNumRW, int intRcptPageSize);

    public int ProRcptPageNumRW
    {
        get;
        set;
    }

    public int ProRcptPageSizeRW
    {
        get;
        set;
    }

    protected void AssignValue(int intRcptPageNum, int intRcptPageSize)
    {
        ProRcptPageNumRW = intRcptPageNum;
        ProRcptPageSizeRW = intRcptPageSize;
        FunPriGetRcptDtls();
    }

    //Payment Details
    FAPagingValues ObjPmtPaging = new FAPagingValues();
    public delegate void PagePaymentAssignValue(int ProPmtPageNumRW, int intPmtPageSize);

    public int ProPmtPageNumRW
    {
        get;
        set;
    }

    public int ProPmtPageSizeRW
    {
        get;
        set;
    }

    protected void PmtAssignValue(int intPmtPageNum, int intPmtPageSize)
    {
        ProPmtPageNumRW = intPmtPageNum;
        ProPmtPageSizeRW = intPmtPageSize;
        FunPriGetPmtDtls();
    }

    //Manual Adjustments
    FAPagingValues ObjAdjstPaging = new FAPagingValues();
    public delegate void PageAdjstAssignValue(int ProAdjstPageNumRW, int intAdjstPageSize);

    public int ProAdjstPageNumRW
    {
        get;
        set;
    }

    public int ProAdjstPageSizeRW
    {
        get;
        set;
    }

    protected void AdjstAssignValue(int intAdjstPageNum, int intAdjstPageSize)
    {
        ProAdjstPageNumRW = intAdjstPageNum;
        ProAdjstPageSizeRW = intAdjstPageSize;
        FunPriGetManualAdjustmentDtls();
    }

    //Probable Match
    FAPagingValues ObjpblMtchPaging = new FAPagingValues();
    public delegate void PagePblMtchAssignValue(int ProPblMtchPageNumRW, int intPblMtchPageSize);

    public int ProPblMtchPageNumRW
    {
        get;
        set;
    }

    public int ProPblMtchPageSizeRW
    {
        get;
        set;
    }

    protected void PblMtchAssignValue(int intPblMtchPageNum, int intPblMtchPageSize)
    {
        ProPblMtchPageNumRW = intPblMtchPageNum;
        ProPblMtchPageSizeRW = intPblMtchPageSize;
        FunPriGetPblMatchDtls();
    }

    #endregion

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to Load";
            CVBRS.IsValid = false;
        }
    }

    #region "Button Events"

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(lblTotBankStamt.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Enter Bank Statement in BRS details");
                return;
            }

            if (Convert.ToDecimal(txtUnclearedAdjust.Text) != Convert.ToDecimal(lblTotBankStamt.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Bank Statement and Arrived should be equal");
                return;
            }

            #region "Commented on 18Apr2016"
            /*
            //Receipts
            foreach (GridViewRow grvR in grvReceiptDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvR.FindControl("chkClearingStatus");
                TextBox txtRealizationDate = (TextBox)grvR.FindControl("txtRealizationDate");
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = (AjaxControlToolkit.CalendarExtender)grvR.FindControl("CEtxtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvR.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvR.FindControl("txtRemarks");

                if (chkClearingStatus.Checked)
                {
                    if (string.IsNullOrEmpty(txtRealizationDate.Text))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "Enter Realization Date in receipt details");
                        return;
                    }
                    //if (string.IsNullOrEmpty(txtBank_Charges.Text))
                    //{
                    //    Utility_FA.FunShowAlertMsg_FA(this, "Enter Bank Charges in receipt details");
                    //    return;
                    //}
                }
            }
            //Payments
            foreach (GridViewRow grvR in grvPaymentDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvR.FindControl("chkClearingStatus");
                TextBox txtRealizationDate = (TextBox)grvR.FindControl("txtRealizationDate");
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = (AjaxControlToolkit.CalendarExtender)grvR.FindControl("CEtxtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvR.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvR.FindControl("txtRemarks");
                if (chkClearingStatus.Checked)
                {
                    if (string.IsNullOrEmpty(txtRealizationDate.Text))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "Enter Realization Date in payment details");
                        return;
                    }
                    //if (string.IsNullOrEmpty(txtBank_Charges.Text))
                    //{
                    //    Utility_FA.FunShowAlertMsg_FA(this, "Enter Bank Charges in payment details");
                    //    return;
                    //}
                }

            }
             * 
             * */
            #endregion

            if (!FunPriCheckReconDtl())
            {
                return;
            }

            FunPriSaveDetails();
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to save BRS";
            CVBRS.IsValid = false;
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Popup"] != null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "window.close();", true);
        }
        else
        {
            Response.Redirect(strRedirectPage, false);
        }

    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriClearPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to Clear_FA BRS";
            CVBRS.IsValid = false;
        }
    }

    protected void btnAutoMatch_Click(object sender, EventArgs e)
    {
        try
        {
            Dictionary<string, string> dictparam = new Dictionary<string, string>();
            Dictionary<string, string> dictparameter = new Dictionary<string, string>();
            DataTable dtautomatch = new DataTable();
            foreach (GridViewRow grow in grvPaymentDtls.Rows)
            {
                dictparameter.Add("@No", ((Label)grow.FindControl("lblPayment_No")).Text);
                dictparam.Add("@Bank_id", ddlBankName.SelectedValue);
                dictparam.Add("@Instrument_No", (Utility_FA.GetDefaultData("FA_BRS_Get_IntruNo", dictparameter).Rows[0]["Instrument_no"]).ToString());
                dictparam.Add("@Amount", ((Label)grow.FindControl("lblAmount")).Text);
                dictparam.Add("@mode", "1");
                dtStagingtable = Utility_FA.GetDefaultData("FA_BRS_GetMatchedData", dictparam);
                if (dtStagingtable != null)
                {
                    if (dtStagingtable.Rows.Count > 0)
                    {
                        if (dtStagingtable.Rows.Count > 1)
                        {
                            break;
                        }

                        if (dtautomatch.Rows.Count == 0)
                        {
                            dtautomatch = dtStagingtable.Copy();
                        }
                        else
                        {
                            DataRow dr = dtautomatch.NewRow();
                            dr.BeginEdit();
                            dr = dtStagingtable.Rows[0];
                            dr.EndEdit();
                            dtautomatch.Rows.Add(dr);
                        }
                    }
                }
                dictparameter.Clear();
                dictparam.Clear();
            }
            dtautomatch.AcceptChanges();

            foreach (GridViewRow grecow in grvReceiptDtls.Rows)
            {
                dictparameter.Clear();
                dictparameter.Add("@No", ((Label)grecow.FindControl("lblReceipt_No")).Text);
                dictparam.Add("@Bank_id", ddlBankName.SelectedValue);
                dictparam.Add("@Instrument_No", (Utility_FA.GetDefaultData("FA_BRS_Get_IntruNo", dictparameter).Rows[0]["Instrument_no"]).ToString());
                dictparam.Add("@Amount", ((Label)grecow.FindControl("lblAmount")).Text);
                dictparam.Add("@mode", "2");
                dtStagingtable = Utility_FA.GetDefaultData("FA_BRS_GetMatchedData", dictparam);
                if (dtStagingtable != null)
                {
                    if (dtStagingtable.Rows.Count > 0)
                    {
                        if (dtStagingtable.Rows.Count > 1)
                        {
                            break;
                        }

                        if (dtautomatch.Rows.Count == 0)
                        {
                            dtautomatch = dtStagingtable.Copy();
                        }
                        else
                        {
                            DataRow dr = dtautomatch.NewRow();
                            dr.BeginEdit();
                            dr = dtStagingtable.Rows[0];
                            dr.EndEdit();
                            dtautomatch.Rows.Add(dr);
                        }
                    }
                }
                dictparameter.Clear();
                dictparam.Clear();
            }
            dtautomatch.AcceptChanges();

            if (dtautomatch.Rows.Count > 0 && dtautomatch != null)
            {

                //foreach (DataRow dr in dtautomatch.Rows)
                //{
                //    foreach (DataColumn dc in dtautomatch.Columns)
                //    {
                //        dr[dc.ColumnName] = ((dc.ColumnName == "Location_Code" && dr[dc.ColumnName] == null) ? "N/A" : dr[dc.ColumnName]);

                //    }
                //}


                //for (int i = 0; i <= dtautomatch.Rows.Count; i++)
                //{
                //    for (int j = 1; j <= dtautomatch.Columns.Count; j++)
                //    {
                //        if (dtautomatch.Columns[j].ToString() == "Location_Code" && dtautomatch.Rows[i]["Location_Code"] == DBNull.Value)
                //        {
                //            dtautomatch.

                //        }

                //    }
                //}
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", intCompanyID.ToString());
                Procparam.Add("@Location_Id", null);
                Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
                DataSet ds = Utility_FA.GetDataset("FA_BRS_Get_FileFormat", Procparam);
                DataTable dtFileFormat = ds.Tables[0];
                DataTable dtSearchCriteria = ds.Tables[1];

                //Dictionary<string, string> dictprm = new Dictionary<string, string>();
                //Procparam = new Dictionary<string, string>();
                //Procparam.Add("@Company_Id", intCompanyID.ToString());
                //Procparam.Add("@Location_Id", null);
                //Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
                //DataSet ds = Utility_FA.GetDataset("FA_BRS_Get_FileFormat", Procparam);
                //DataTable dtFileFormat = ds.Tables[0];
                //DataTable dtSearchCriteria = ds.Tables[1];
                //dtStagingtable = new DataTable();
                //if (dtFileFormat.Rows.Count > 0)
                //{
                //    //converting Column value as dynamic columned datatable
                //    foreach (DataRow dr in dtFileFormat.Rows)
                //    {
                //        string strcolumn = dr["Field_Desc"].ToString().ToUpper();
                //        if (!dtStagingtable.Columns.Contains(strcolumn))
                //        {
                //            dtStagingtable.Columns.Add(strcolumn, typeof(string));
                //        }
                //    }


                //    dictprm.Add("@Bank_Id", ddlBankName.SelectedValue);
                //    dictprm.Add("@Location_id", ddlLocation.SelectedValue == "0" ? null : ddlLocation.SelectedValue);

                //    dtStagingtable = Utility_FA.GetDefaultData("FA_Get_BRSFileDetails", Procparam);

                if (!dtautomatch.Columns.Contains("Aut_Man"))
                {
                    dtautomatch.Columns.Add("Aut_Man", typeof(string));
                }
                if (!dtautomatch.Columns.Contains("File_Name"))
                {
                    dtautomatch.Columns.Add("File_Name", typeof(string));
                }
                if (!dtautomatch.Columns.Contains("Temp_Ref_No"))
                {
                    dtautomatch.Columns.Add("Temp_Ref_No", typeof(string));
                }
                if (!dtautomatch.Columns.Contains("Adjust_Amount"))
                {
                    dtautomatch.Columns.Add("Adjust_Amount", typeof(string));
                }
                if (!dtautomatch.Columns.Contains("Status"))
                {
                    dtautomatch.Columns.Add("Status", typeof(string));
                }

                int tempvar = 1;

                foreach (DataRow drow in dtautomatch.Rows)
                {
                    drow["Temp_Ref_No"] = "Ref_No" + tempvar.ToString();
                    drow["Status"] = "N";
                    tempvar++;
                }

                #region "Reading data from Notepad"
                //string str = string.Empty;
                //string strFolder = (Server.MapPath(".") + "\\PDF Files\\BRS File\\");
                //DirectoryInfo Sourcedir = new DirectoryInfo(strFolder);
                ////DirectoryInfo Destdir = new DirectoryInfo(@"D:\For Saran\Saran backup\BRS\BRS File\");

                //FileInfo[] files = Sourcedir.GetFiles();

                //foreach (FileInfo file in files)
                //{
                //    if (file.Length > 0)
                //    {
                //        string strsourceFile = Sourcedir + "\\" + file.Name;
                //        //string strdestinationFile = Destdir + "\\" + file.Name;
                //        if (File.Exists(strsourceFile))
                //        {
                //            StreamReader sr = new StreamReader(strsourceFile);
                //            String line;
                //            int inttemp = 1;
                //            while ((line = sr.ReadLine()) != null)
                //            {
                //                if (line.Trim() != string.Empty)
                //                {
                //                    int intlinelength = line.Length;
                //                    DataRow drStagingtable = dtStagingtable.NewRow();
                //                    foreach (DataRow drFileFormat in dtFileFormat.Rows)
                //                    {
                //                        string strValue = string.Empty, strColumnname = string.Empty;
                //                        int intstart = 0, intlength = 0;
                //                        if (!string.IsNullOrEmpty(drFileFormat["BRS_Format_Begin"].ToString()))
                //                            intstart = Convert.ToInt16(drFileFormat["BRS_Format_Begin"].ToString());
                //                        //if (!string.IsNullOrEmpty(drFileFormat["BRS_Format_End"].ToString()))
                //                        //    intend = Convert.ToInt16(drFileFormat["BRS_Format_End"].ToString());
                //                        if (!string.IsNullOrEmpty(drFileFormat["BRS_Format_Length"].ToString()))
                //                            intlength = Convert.ToInt16(drFileFormat["BRS_Format_Length"].ToString());
                //                        if (!string.IsNullOrEmpty(drFileFormat["Field_Desc"].ToString()))
                //                            strColumnname = drFileFormat["Field_Desc"].ToString().ToUpper();
                //                        if (((intstart - 1) + intlength) <= intlinelength)
                //                        {
                //                            strValue = line.Substring(intstart - 1, intlength);
                //                            if (!string.IsNullOrEmpty(strValue))
                //                                drStagingtable[strColumnname] = strValue;
                //                        }

                //                    }
                //                    //adding file name 
                //                    drStagingtable["File_Name"] = file.Name;
                //                    drStagingtable["Temp_Ref_No"] = "Ref_No" + inttemp.ToString();
                //                    drStagingtable["Status"] = "N";
                //                    dtStagingtable.Rows.Add(drStagingtable);

                //                }
                //                inttemp++;
                //            }
                //        }
                //        else
                //        {
                //            Utility_FA.FunShowAlertMsg_FA(this, "File not exists");
                //            return;
                //        }
                //    }
                //}
                ViewState["dtStagingtable"] = dtautomatch;

                #endregion

                #region "serch criteria"
                if (dtStagingtable != null && dtStagingtable.Rows.Count > 0)
                {
                    DataRow[] drSearchCriteriaD = dtSearchCriteria.Select("DORW='D'");
                    DataRow[] drSearchCriteriaW = dtSearchCriteria.Select("DORW='W'");

                    if (ViewState["ReceiptDtls"] != null)
                        dtReceiptDtls = (DataTable)ViewState["ReceiptDtls"];
                    if (ViewState["PaymentDtls"] != null)
                        dtPaymentDtls = (DataTable)ViewState["PaymentDtls"];

                    if (dtSearchCriteria.Rows.Count > 0)
                    {
                        if (drSearchCriteriaD.Length > 0)//Receipt search criteria
                        {
                            if (dtReceiptDtls != null)
                            {
                                //from fourth search First_Scrh,Sec_Scrh,Thrd_Scrh,Frth_Scrh
                                string strSearchCol1 = string.Empty, strSearchCol2 = string.Empty, strSearchCol3 = string.Empty, strSearchCol4 = string.Empty;
                                int intdtstagecount = 0;

                                if (!string.IsNullOrEmpty(drSearchCriteriaD[0]["First_Scrh"].ToString()))
                                    strSearchCol1 = drSearchCriteriaD[0]["First_Scrh"].ToString();
                                if (!string.IsNullOrEmpty(drSearchCriteriaD[0]["Sec_Scrh"].ToString()))
                                    strSearchCol2 = drSearchCriteriaD[0]["Sec_Scrh"].ToString();
                                if (!string.IsNullOrEmpty(drSearchCriteriaD[0]["Thrd_Scrh"].ToString()))
                                    strSearchCol3 = drSearchCriteriaD[0]["Thrd_Scrh"].ToString();
                                if (!string.IsNullOrEmpty(drSearchCriteriaD[0]["Frth_Scrh"].ToString()))
                                    strSearchCol4 = drSearchCriteriaD[0]["Frth_Scrh"].ToString();
                                DataRow[] drcheck = dtStagingtable.Select("Aut_Man is null");
                                DataTable dtStagingtableNew = new DataTable();
                                if (drcheck.Length > 0)
                                    dtStagingtableNew = dtStagingtable.Select("Aut_Man is null").CopyToDataTable();

                                foreach (DataRow drStageNew in dtStagingtableNew.Rows)
                                {
                                    string strValue1 = string.Empty, strValue2 = string.Empty, strValue3 = string.Empty, strValue4 = string.Empty;

                                    if (dtStagingtableNew.Columns.Contains(strSearchCol1) && dtReceiptDtls.Columns.Contains(strSearchCol1))
                                    {
                                        if (!string.IsNullOrEmpty(drStageNew[strSearchCol1].ToString().Trim()))
                                            strValue1 = drStageNew[strSearchCol1].ToString().Trim();
                                    }
                                    if (dtStagingtableNew.Columns.Contains(strSearchCol2) && dtReceiptDtls.Columns.Contains(strSearchCol2))
                                    {
                                        if (!string.IsNullOrEmpty(drStageNew[strSearchCol2].ToString().Trim()))
                                            strValue2 = drStageNew[strSearchCol2].ToString().Trim();
                                    }
                                    if (dtStagingtableNew.Columns.Contains(strSearchCol3) && dtReceiptDtls.Columns.Contains(strSearchCol3))
                                    {
                                        if (!string.IsNullOrEmpty(drStageNew[strSearchCol3].ToString().Trim()))
                                            strValue3 = drStageNew[strSearchCol3].ToString().Trim();
                                    }
                                    if (dtStagingtableNew.Columns.Contains(strSearchCol4) && dtReceiptDtls.Columns.Contains(strSearchCol4))
                                    {
                                        if (!string.IsNullOrEmpty(drStageNew[strSearchCol4].ToString().Trim()))
                                            strValue4 = drStageNew[strSearchCol4].ToString().Trim();
                                    }

                                    #region "search Process"

                                    DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
                                    dtformat.ShortDatePattern = "MM/dd/yy";
                                    string strFBDate = string.Empty;


                                    //Fourth search

                                    if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2) && !string.IsNullOrEmpty(strValue3) && !string.IsNullOrEmpty(strValue4))
                                    {
                                        string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and " + strSearchCol3 + "='" + strValue3 + "' and "
                                            + strSearchCol4 + "='" + strValue4 + "' and Aut_Man is null";
                                        DataRow[] drreceiptdtls = dtReceiptDtls.Select(strexp);
                                        if (drreceiptdtls.Length > 0)
                                        {
                                            foreach (DataRow drrec in drreceiptdtls)
                                            {
                                                drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                //For remarks and realization date
                                                if (dtStagingtable.Columns.Contains("REMARKS"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                        drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                        drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                    {
                                                        string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                        try
                                                        {
                                                            strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                            drrec["Realization_date"] = strFBDate;
                                                        }
                                                        catch (Exception ex)
                                                        {

                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    //third
                                    if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2) && !string.IsNullOrEmpty(strValue3))
                                    {
                                        string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and " + strSearchCol3 + "='" + strValue3 + "' and "
                                            + "Aut_Man is null";
                                        DataRow[] drreceiptdtls = dtReceiptDtls.Select(strexp);
                                        if (drreceiptdtls.Length > 0)
                                        {
                                            foreach (DataRow drrec in drreceiptdtls)
                                            {
                                                drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                //For remarks and realization date
                                                if (dtStagingtable.Columns.Contains("REMARKS"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                        drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                        drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                    {
                                                        string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                        try
                                                        {
                                                            strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                            drrec["Realization_date"] = strFBDate;
                                                        }
                                                        catch (Exception ex)
                                                        {

                                                        }
                                                    }
                                                }
                                            }

                                        }


                                    }

                                    //second
                                    if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2))
                                    {
                                        string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and "
                                            + "Aut_Man is null";
                                        DataRow[] drreceiptdtls = dtReceiptDtls.Select(strexp);
                                        if (drreceiptdtls.Length > 0)
                                        {
                                            foreach (DataRow drrec in drreceiptdtls)
                                            {
                                                drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                //For remarks and realization date
                                                if (dtStagingtable.Columns.Contains("REMARKS"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                        drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                        drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                    {
                                                        string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                        try
                                                        {
                                                            strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                            drrec["Realization_date"] = strFBDate;
                                                        }
                                                        catch (Exception ex)
                                                        {

                                                        }
                                                    }
                                                }
                                            }

                                        }


                                    }

                                    //one
                                    if (!string.IsNullOrEmpty(strValue1))
                                    {
                                        string strexp = strSearchCol1 + "='" + strValue1 + "' and "
                                            + "Aut_Man is null";
                                        DataRow[] drreceiptdtls = dtReceiptDtls.Select(strexp);
                                        if (drreceiptdtls.Length > 0)
                                        {
                                            foreach (DataRow drrec in drreceiptdtls)
                                            {
                                                drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                //For remarks and realization date
                                                if (dtStagingtable.Columns.Contains("REMARKS"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                        drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                        drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                }
                                                if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                {
                                                    if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                    {
                                                        string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                        try
                                                        {
                                                            strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                            drrec["Realization_date"] = strFBDate;
                                                        }
                                                        catch (Exception ex)
                                                        {

                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    intdtstagecount = intdtstagecount + 1;
                                }
                                    #endregion

                                #region "grid updation"

                                foreach (GridViewRow grvReceiptDtlsView in grvReceiptDtls.Rows)
                                {
                                    Label lblReceipt_No = (Label)grvReceiptDtlsView.FindControl("lblReceipt_No");
                                    Label lblAut_Man = (Label)grvReceiptDtlsView.FindControl("lblAut_Man");
                                    CheckBox chkClearingStatus = (CheckBox)grvReceiptDtlsView.FindControl("chkClearingStatus");
                                    TextBox txtBank_Charges = (TextBox)grvReceiptDtlsView.FindControl("txtBank_Charges");
                                    TextBox txtRemarks = (TextBox)grvReceiptDtlsView.FindControl("txtRemarks");
                                    TextBox txtRealizationDate = (TextBox)grvReceiptDtlsView.FindControl("txtRealizationDate");
                                    if (lblReceipt_No != null)
                                    {
                                        DataRow[] drReceipt = dtReceiptDtls.Select("DocNo='" + lblReceipt_No.Text + "' and Aut_Man='A'");
                                        if (drReceipt.Length > 0)
                                        {
                                            chkClearingStatus.Checked = true;
                                            lblAut_Man.Text = "A";
                                            if (!string.IsNullOrEmpty(drReceipt[0]["Bank_Charges"].ToString()))
                                                txtBank_Charges.Text = drReceipt[0]["Bank_Charges"].ToString();
                                            if (!string.IsNullOrEmpty(drReceipt[0]["Remarks"].ToString()))
                                                txtRemarks.Text = drReceipt[0]["Remarks"].ToString();
                                            if (!string.IsNullOrEmpty(drReceipt[0]["Realization_date"].ToString()))
                                                txtRealizationDate.Text = drReceipt[0]["Realization_date"].ToString();
                                        }


                                    }
                                }




                                #endregion
                            }
                        }
                        if (drSearchCriteriaW.Length > 0)//Payment search criteria
                        {
                            if (dtPaymentDtls != null)
                            {
                                foreach (DataRow dr in drSearchCriteriaW)
                                {
                                    //from fourth search First_Scrh,Sec_Scrh,Thrd_Scrh,Frth_Scrh
                                    string strSearchCol1 = string.Empty, strSearchCol2 = string.Empty, strSearchCol3 = string.Empty, strSearchCol4 = string.Empty;
                                    int intdtstagecount = 0;

                                    if (!string.IsNullOrEmpty(drSearchCriteriaW[0]["First_Scrh"].ToString()))
                                        strSearchCol1 = drSearchCriteriaW[0]["First_Scrh"].ToString();
                                    if (!string.IsNullOrEmpty(drSearchCriteriaW[0]["Sec_Scrh"].ToString()))
                                        strSearchCol2 = drSearchCriteriaW[0]["Sec_Scrh"].ToString();
                                    if (!string.IsNullOrEmpty(drSearchCriteriaW[0]["Thrd_Scrh"].ToString()))
                                        strSearchCol3 = drSearchCriteriaW[0]["Thrd_Scrh"].ToString();
                                    if (!string.IsNullOrEmpty(drSearchCriteriaW[0]["Frth_Scrh"].ToString()))
                                        strSearchCol4 = drSearchCriteriaW[0]["Frth_Scrh"].ToString();

                                    DataRow[] drcheck = dtStagingtable.Select("Aut_Man is null");
                                    DataTable dtStagingtableNew = new DataTable();
                                    if (drcheck.Length > 0)
                                        dtStagingtableNew = dtStagingtable.Select("Aut_Man is null").CopyToDataTable();

                                    foreach (DataRow drStageNew in dtStagingtableNew.Rows)
                                    {
                                        string strValue1 = string.Empty, strValue2 = string.Empty, strValue3 = string.Empty, strValue4 = string.Empty;

                                        if (dtStagingtableNew.Columns.Contains(strSearchCol1) && dtPaymentDtls.Columns.Contains(strSearchCol1))
                                        {
                                            if (!string.IsNullOrEmpty(drStageNew[strSearchCol1].ToString().Trim()))
                                                strValue1 = drStageNew[strSearchCol1].ToString().Trim();
                                        }
                                        if (dtStagingtableNew.Columns.Contains(strSearchCol2) && dtPaymentDtls.Columns.Contains(strSearchCol2))
                                        {
                                            if (!string.IsNullOrEmpty(drStageNew[strSearchCol2].ToString().Trim()))
                                                strValue2 = drStageNew[strSearchCol2].ToString().Trim();
                                        }
                                        if (dtStagingtableNew.Columns.Contains(strSearchCol3) && dtPaymentDtls.Columns.Contains(strSearchCol3))
                                        {
                                            if (!string.IsNullOrEmpty(drStageNew[strSearchCol3].ToString().Trim()))
                                                strValue3 = drStageNew[strSearchCol3].ToString().Trim();
                                        }
                                        if (dtStagingtableNew.Columns.Contains(strSearchCol4) && dtPaymentDtls.Columns.Contains(strSearchCol4))
                                        {
                                            if (!string.IsNullOrEmpty(drStageNew[strSearchCol4].ToString().Trim()))
                                                strValue4 = drStageNew[strSearchCol4].ToString().Trim();
                                        }

                                        #region "search Process"

                                        DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
                                        dtformat.ShortDatePattern = "MM/dd/yy";
                                        string strFBDate = string.Empty;

                                        //Fourth search

                                        if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2) && !string.IsNullOrEmpty(strValue3) && !string.IsNullOrEmpty(strValue4))
                                        {
                                            string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and " + strSearchCol3 + "='" + strValue3 + "' and "
                                                + strSearchCol4 + "='" + strValue4 + "' and Aut_Man is null";
                                            DataRow[] drreceiptdtls = dtPaymentDtls.Select(strexp);
                                            if (drreceiptdtls.Length > 0)
                                            {
                                                foreach (DataRow drrec in drreceiptdtls)
                                                {
                                                    drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                    dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                    dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                    //For remarks and realization date
                                                    if (dtStagingtable.Columns.Contains("REMARKS"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                            drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                            drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                        {
                                                            string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                            try
                                                            {
                                                                strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                                drrec["Realization_date"] = strFBDate;
                                                            }
                                                            catch (Exception ex)
                                                            {

                                                            }
                                                        }
                                                    }
                                                }

                                            }


                                        }

                                        //third
                                        if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2) && !string.IsNullOrEmpty(strValue3))
                                        {
                                            string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and " + strSearchCol3 + "='" + strValue3 + "' and "
                                                + "Aut_Man is null";
                                            DataRow[] drreceiptdtls = dtPaymentDtls.Select(strexp);
                                            if (drreceiptdtls.Length > 0)
                                            {
                                                foreach (DataRow drrec in drreceiptdtls)
                                                {
                                                    drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                    dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                    dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                    //For remarks and realization date
                                                    if (dtStagingtable.Columns.Contains("REMARKS"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                            drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                            drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                        {
                                                            string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                            try
                                                            {
                                                                strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                                drrec["Realization_date"] = strFBDate;
                                                            }
                                                            catch (Exception ex)
                                                            {

                                                            }
                                                        }
                                                    }
                                                }

                                            }


                                        }

                                        //second
                                        if (!string.IsNullOrEmpty(strValue1) && !string.IsNullOrEmpty(strValue2))
                                        {
                                            string strexp = strSearchCol1 + "='" + strValue1 + "' and " + strSearchCol2 + "='" + strValue2 + "' and "
                                                + "Aut_Man is null";
                                            DataRow[] drreceiptdtls = dtPaymentDtls.Select(strexp);
                                            if (drreceiptdtls.Length > 0)
                                            {
                                                foreach (DataRow drrec in drreceiptdtls)
                                                {
                                                    drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                    dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                    dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                    //For remarks and realization date
                                                    if (dtStagingtable.Columns.Contains("REMARKS"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                            drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                            drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                        {
                                                            string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                            try
                                                            {
                                                                strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                                drrec["Realization_date"] = strFBDate;
                                                            }
                                                            catch (Exception ex)
                                                            {

                                                            }
                                                        }
                                                    }
                                                }

                                            }


                                        }

                                        //one
                                        if (!string.IsNullOrEmpty(strValue1))
                                        {
                                            string strexp = strSearchCol1 + "='" + strValue1 + "' and "
                                                + "Aut_Man is null";
                                            DataRow[] drreceiptdtls = dtPaymentDtls.Select(strexp);
                                            if (drreceiptdtls.Length > 0)
                                            {
                                                foreach (DataRow drrec in drreceiptdtls)
                                                {
                                                    drrec["Aut_Man"] = "A"; drrec["Clearing_Status"] = 1;
                                                    dtStagingtable.Rows[intdtstagecount]["Aut_Man"] = "A";
                                                    dtStagingtable.Rows[intdtstagecount]["Status"] = "C";
                                                    //For remarks and realization date
                                                    if (dtStagingtable.Columns.Contains("REMARKS"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString()))
                                                            drrec["Remarks"] = dtStagingtable.Rows[intdtstagecount]["REMARKS"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("BANK CHARGES"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString()))
                                                            drrec["Bank_Charges"] = dtStagingtable.Rows[intdtstagecount]["BANK CHARGES"].ToString();
                                                    }
                                                    if (dtStagingtable.Columns.Contains("Realisation Date"))
                                                    {
                                                        if (!string.IsNullOrEmpty(dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString()))
                                                        {
                                                            string strRelDate = dtStagingtable.Rows[intdtstagecount]["Realisation Date"].ToString();
                                                            try
                                                            {
                                                                strFBDate = DateTime.Parse(strRelDate.Substring(2, 2) + "/" + strRelDate.Substring(0, 2) + "/" + strRelDate.Substring(4, 2), dtformat).ToString(strDateFormat);
                                                                drrec["Realization_date"] = strFBDate;
                                                            }
                                                            catch (Exception ex)
                                                            {

                                                            }
                                                        }
                                                    }
                                                }

                                            }

                                        }


                                    }
                                        #endregion

                                    #region "grid updation"

                                    foreach (GridViewRow grvPaymentDtlsView in grvPaymentDtls.Rows)
                                    {
                                        Label lblPayment_No = (Label)grvPaymentDtlsView.FindControl("lblPayment_No");
                                        Label lblAut_Man = (Label)grvPaymentDtlsView.FindControl("lblAut_Man");
                                        CheckBox chkClearingStatus = (CheckBox)grvPaymentDtlsView.FindControl("chkClearingStatus");
                                        TextBox txtBank_Charges = (TextBox)grvPaymentDtlsView.FindControl("txtBank_Charges");
                                        TextBox txtRemarks = (TextBox)grvPaymentDtlsView.FindControl("txtRemarks");
                                        TextBox txtRealizationDate = (TextBox)grvPaymentDtlsView.FindControl("Realization_date");
                                        if (lblPayment_No != null)
                                        {
                                            DataRow[] drReceipt = dtPaymentDtls.Select("DocNo='" + lblPayment_No.Text + "' and Aut_Man='A'");
                                            if (drReceipt.Length > 0)
                                            {
                                                chkClearingStatus.Checked = true;
                                                lblAut_Man.Text = "A";
                                                if (!string.IsNullOrEmpty(drReceipt[0]["Bank_Charges"].ToString()))
                                                    txtBank_Charges.Text = drReceipt[0]["Bank_Charges"].ToString();
                                                if (!string.IsNullOrEmpty(drReceipt[0]["Remarks"].ToString()))
                                                    txtRemarks.Text = drReceipt[0]["Remarks"].ToString();
                                                if (!string.IsNullOrEmpty(drReceipt[0]["Realization_date"].ToString()))
                                                    txtRealizationDate.Text = drReceipt[0]["Realization_date"].ToString();
                                            }


                                        }
                                    }




                                    #endregion

                                    intdtstagecount = intdtstagecount + 1;
                                }
                            }
                        }
                    }
                }
                #endregion


                ViewState["dtStagingtable"] = dtautomatch;
                if (dtStagingtable != null && dtStagingtable.Rows.Count > 0)
                {
                    DataRow[] drStat = dtStagingtable.Select("Recon_Status <> 'False'");
                    if (drStat.Length > 0)
                    {
                        grvStagingtbl.DataSource = drStat.CopyToDataTable();
                        grvStagingtbl.DataBind();
                        for (int i = 0; ((i < grvStagingtbl.Rows.Count) | (i < grvStagingtbl.HeaderRow.Cells.Count)); i++)
                        {
                            if (grvStagingtbl.HeaderRow.Cells[i].Text.Equals("Recon_Status"))
                            {
                                grvStagingtbl.HeaderRow.Cells[i].Visible = false;
                                grvStagingtbl.Rows[i >= grvStagingtbl.Rows.Count ? grvStagingtbl.Rows.Count - 1 : i].Cells[i].Visible = false;
                                //grvStagingtbl.Rows[i >= grvStagingtbl.Rows.Count ? grvStagingtbl.Rows.Count - 1 : i].Cells[i].Text =

                                //    ((CheckBox)grvStagingtbl.Rows[i >= grvStagingtbl.Rows.Count ? grvStagingtbl.Rows.Count - 1 : i].Cells[i]).c
                                //    (Convert.ToBoolean(grvStagingtbl.Rows[i >= grvStagingtbl.Rows.Count ? grvStagingtbl.Rows.Count - 1 : i].Cells[i].Text).ToString());
                                break;
                            }
                            grvStagingtbl.HeaderRow.Cells[i].Text = grvStagingtbl.HeaderRow.Cells[i].Text.Replace("_", " ");

                        }
                    }
                }
                //clearing and reallocating Adjustments
                FunPriGenerateAdjustments();
            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Matched Records not found");

            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to process Auto match";
            CVBRS.IsValid = false;
        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        try
        {
            //if (!string.IsNullOrEmpty(lblTotBankStamt.Text) && !string.IsNullOrEmpty(txtUnclearedAdjust.Text))
            //{
            //    if (Convert.ToDecimal(lblTotBankStamt.Text) != Convert.ToDecimal(txtUnclearedAdjust.Text))
            //    {
            //        Utility_FA.FunShowAlertMsg_FA(this, "Bank Statement and arrived should be equal");
            //        return;
            //    }
            //}

            string strnewFile = "";
            string strFileName = "";
            string strFolder = "";
            Guid objGuid;
            objGuid = Guid.NewGuid();
            ReportDocument rptd = new ReportDocument();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@User_Id", intUserID.ToString());
            if (@strBRS_Id != null || @strBRS_Id != "")
            {
                Procparam.Add("@BRS_ID", strBRS_Id);
                Procparam.Add("@Option", "2");
            }
            else
            {
                Procparam.Add("@Option", "1");
                Procparam.Add("@Bank_ID", ddlBankName.SelectedValue);
                Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
                Procparam.Add("@StartDate", txtStartDate.Text);
                Procparam.Add("@Enddate", txtEndDate.Text);
                Procparam.Add("@Bal_Amt", txtOpeningBalance.Text);
            }

            DataSet DS = Utility_FA.GetDataset("FA_RPT_BRSPRINT", Procparam);
            rptd.Load(Server.MapPath("Print Formats/BRS_Print.rpt"));

            rptd.SetDataSource(DS.Tables[0]);
            //rptd.Subreports["BRS_Print_dtl.rpt"].SetDataSource(DS.Tables[1]);
            //rptd.Subreports[0].SetDataSource(DS.Tables[1]);

            #region "Comment"
            ////DS.Tables[0].TableName = "HDR";
            ////DS.Tables[1].TableName = "DTL";

            //foreach (DataRow dr in DS.Tables[0].Rows)
            //{

            //    if (ddlLocation.SelectedText != "--Select--")
            //    {
            //        dr["Location"] = ddlLocation.SelectedText;
            //    }
            //    if (ddlBankName.SelectedItem.Text != "--Select--")
            //    {
            //        dr["Bank_Name"] = ddlBankName.SelectedItem.Text;
            //    }
            //    if (!string.IsNullOrEmpty(txtStartDate.Text))
            //    {
            //        dr["Start_Date"] = txtStartDate.Text;
            //    }
            //    if (!string.IsNullOrEmpty(txtEndDate.Text))
            //    {
            //        dr["End_Date"] = txtEndDate.Text;
            //    }

            //}

            //decimal sum = 0, decACr = 0, decADr = 0, decMCr = 0, decMDr = 0, decPCr = 0, decPDr = 0, decopenbal = 0;
            //foreach (GridViewRow grvAdjustmentsRow in grvAdjustments.Rows)
            //{
            //    Label txtAmount = (Label)grvAdjustmentsRow.FindControl("lblAmount");
            //    Label lblAddOrLess = (Label)grvAdjustmentsRow.FindControl("lblAddOrLess");
            //    Label lblAutoManual = (Label)grvAdjustmentsRow.FindControl("lblAutoManual");

            //    if (!(string.IsNullOrEmpty(txtAmount.Text)))
            //    {
            //        //sum += (Convert.ToDecimal(txtAmount.Text));
            //        if (lblAutoManual.Text == "A")
            //        {
            //            //credit
            //            if (lblAddOrLess.Text.ToUpper() == "ADD")
            //                decACr += (Convert.ToDecimal(txtAmount.Text));

            //            //debit
            //            if (lblAddOrLess.Text.ToUpper() == "LESS")
            //                decADr += (Convert.ToDecimal(txtAmount.Text));
            //        }
            //        else if (lblAutoManual.Text == "M")
            //        {
            //            //credit
            //            if (lblAddOrLess.Text.ToUpper() == "ADD")
            //                decMCr += (Convert.ToDecimal(txtAmount.Text));

            //            //debit
            //            if (lblAddOrLess.Text.ToUpper() == "LESS")
            //                decMDr += (Convert.ToDecimal(txtAmount.Text));
            //        }
            //    }
            //}

            //foreach (GridViewRow grvPrevAdjustRow in grvPrevAdjustments.Rows)
            //{
            //    Label txtAmount = (Label)grvPrevAdjustRow.FindControl("lblAmount");
            //    Label lblAddOrLess = (Label)grvPrevAdjustRow.FindControl("lblAddOrLess");
            //    //credit
            //    if (lblAddOrLess.Text.ToUpper() == "ADD")
            //        decPCr += (Convert.ToDecimal(txtAmount.Text));

            //    //debit
            //    if (lblAddOrLess.Text.ToUpper() == "LESS")
            //        decPDr += (Convert.ToDecimal(txtAmount.Text));
            //}

            //if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
            //    DS.Tables[1].Rows[0]["Amount"] = txtOpeningBalance.Text;

            //DS.Tables[1].Rows[1]["Amount"] = decACr.ToString();
            //DS.Tables[1].Rows[2]["Amount"] = decMCr.ToString();

            //DS.Tables[1].Rows[3]["Amount"] = decPCr.ToString();

            //DS.Tables[1].Rows[4]["Amount"] = decADr.ToString();
            //DS.Tables[1].Rows[5]["Amount"] = decMDr.ToString();
            //DS.Tables[1].Rows[6]["Amount"] = decPDr.ToString();

            //if (!string.IsNullOrEmpty(txtUnclearedAdjust.Text))
            //    DS.Tables[1].Rows[7]["Amount"] = txtUnclearedAdjust.Text;

            #endregion

            strFolder = (Server.MapPath(".") + "\\PDF Files\\");
            if (!(System.IO.Directory.Exists(strFolder)))
            {
                DirectoryInfo di = Directory.CreateDirectory(strFolder);
            }
            strnewFile = strFolder + "BRS_" + objGuid.ToString() + ".pdf";
            string strScipt = "";
            if (strnewFile != "")
            {
                rptd.SetDataSource(DS.Tables[0]);
                //rptd.Subreports["BRS_Print_dtl.rpt"].SetDataSource(DS.Tables[1]);
                rptd.ExportToDisk(ExportFormatType.PortableDocFormat, strnewFile); //ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "DeliveryInstruction");
            }
            if (File.Exists(strnewFile))
            {
                // strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to print pdf";
            CVBRS.IsValid = false;
        }

    }

    protected void btnFetch_Click(object sender, EventArgs e)
    {
        try
        {
            btnExcel.Visible = false;
            grvReceiptDtls.DataSource = null;
            grvReceiptDtls.DataBind();
            grvPaymentDtls.DataSource = null;
            grvPaymentDtls.DataBind();
            grvAdjustments.DataSource = null;
            grvAdjustments.DataBind();

            if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtStartDate, txtStartDate.Text, "Start Date"))
            {
                return;
            }

            if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtEndDate, txtEndDate.Text, "End Date"))
            {
                return;
            }

            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                if (Utility_FA.StringToDate(txtStartDate.Text) > Utility_FA.StringToDate(txtEndDate.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "End date should be greater than Start date");
                    return;
                }
            }

            //Added On 22Aug2016 Starts Here
            //To address Bug ID TC_049

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Option", "10");
            Procparam.Add("@Start_Date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            Procparam.Add("@End_Date", Utility_FA.StringToDate(txtEndDate.Text).ToString());
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Bank_ID", Convert.ToString(ddlBankName.SelectedValue));
            Procparam.Add("@Location_ID", Convert.ToString(ddlLocation.SelectedValue));

            DataTable dtValidate = Utility_FA.GetDefaultData("FA_CMN_BRSLst", Procparam);
            //if (Convert.ToString(dtValidate.Rows[0]["Error_Msg"]) != "")
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(dtValidate.Rows[0]["Error_Msg"]));
            //    return;
            //}

            ////Added On 22Aug2016 Ends Here

            //ProRcptPageSizeRW = ProPmtPageSizeRW = 10;
            //ProRcptPageNumRW = ProPmtPageNumRW = 1;

            FunPriGetRcptDtls();
            FunPriGetPmtDtls();
            FunPriCalcUnclearedAmt();
            FunpriGetUpldStatement();
            //FunPriBtnFetchDtls();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to Load";
            CVBRS.IsValid = false;
        }
    }

    protected void btnGetAdj_Click(object sender, EventArgs e)
    {
        try
        {
            FunPriGetManualAdjustmentDtls();
            btnExcel.Visible = true;
            //FunPriGenerateAdjustments();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to Load";
            CVBRS.IsValid = false;
        }
    }

    protected void btnAutoMatchNew_Click(object sender, EventArgs e)
    {
        try
        {
            //if (ViewState["ReceiptDtls"] == null && ViewState["PaymentDtls"] == null)
            //{
            //    Utility_FA.FunShowAlertMsg_FA(this, "No Receipt and Payment Details Exists");
            //    return;
            //}

            Int64 intUploadedID = 0;
            for (int i = 0; i < gvUploadDtl.Rows.Count; i++)
            {
                CheckBox chkFileSelect = (CheckBox)gvUploadDtl.Rows[i].FindControl("chkFileSelect");
                Label lblUpldID = (Label)gvUploadDtl.Rows[i].FindControl("lblUpldID");
                intUploadedID = (chkFileSelect.Checked == true) ? Convert.ToInt64(lblUpldID.Text) : 0;
                i = (intUploadedID > 0) ? (gvUploadDtl.Rows.Count) : i;
            }

            if (intUploadedID == 0)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Select any one File Name...Unless Auto match should not be process");
                return;
            }

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Bank_ID", Convert.ToString(ddlBankName.SelectedValue));
            Procparam.Add("@Uploaded_ID", Convert.ToString(intUploadedID));
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            ViewState["FIleUploadedID"] = intUploadedID;

            //if (ViewState["ReceiptDtls"] != null && ((DataTable)ViewState["ReceiptDtls"]).Rows.Count > 0)
            //{
            //    string strXMLRcptDtls = Utility_FA.FunPubFormXml_FA(((DataTable)ViewState["ReceiptDtls"]), true, true);
            //    Procparam.Add("@XMLRcptDtl", Convert.ToString(strXMLRcptDtls));
            //}

            //if (ViewState["PaymentDtls"] != null && ((DataTable)ViewState["PaymentDtls"]).Rows.Count > 0)
            //{
            //    string strXMLPmtDtls = Utility_FA.FunPubFormXml_FA(((DataTable)ViewState["PaymentDtls"]), true, true);
            //    Procparam.Add("@XMLPmtDtl", Convert.ToString(strXMLPmtDtls));
            //}

            DataSet dsAutoMatch = Utility_FA.GetDataset("FA_BRS_GetAutoMatchDtl", Procparam);
            FunPriGetRcptDtls();
            FunPriGetPmtDtls();
            FunPriCalcUnclearedAmt();
            grvAdjustments.DataSource = null;
            grvAdjustments.DataBind();
            FunPriGetManualAdjustmentDtls();
            btnExcel.Visible = true;
            //if (dsAutoMatch == null)
            //{
            //    if (dsAutoMatch.Tables[0].Rows.Count > 0)
            //    {
            //        grvReceiptDtls.DataSource = dsAutoMatch.Tables[0];
            //        grvReceiptDtls.DataBind();
            //        ViewState["ReceiptDtls"] = dsAutoMatch.Tables[0];
            //    }

            //    if (dsAutoMatch.Tables[1].Rows.Count > 0)
            //    {
            //        grvPaymentDtls.DataSource = dsAutoMatch.Tables[1];
            //        grvPaymentDtls.DataBind();
            //        ViewState["PaymentDtls"] = dsAutoMatch.Tables[1];
            //    }

            //    DataRow[] drRcpt = dsAutoMatch.Tables[0].Select("AUT_MAN = 1");
            //    DataRow[] drPmt = dsAutoMatch.Tables[1].Select("AUT_MAN = 1");
            //    if (drRcpt.Length == 0 && drPmt.Length == 0)
            //    {
            //        Utility_FA.FunShowAlertMsg_FA(this, "No Records Matched");
            //        ViewState["FIleUploadedID"] = 0;
            //    }

            //    grvAdjustments.DataSource = null;
            //    grvAdjustments.DataBind();
            //    DataTable dtAdjustment = ((DataTable)ViewState["dtAdjustmentDetails"]).Clone();
            //    ViewState["dtAdjustmentDetails"] = dtAdjustment;
            //}
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnAdjst_Click(object sender, EventArgs e)
    {
        try
        {
            string strnewFile = "";
            string strFileName = "";
            string strFolder = "";
            Guid objGuid;
            objGuid = Guid.NewGuid();
            ReportDocument rptd = new ReportDocument();

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@BRS_ID", strBRS_Id);
            DataSet DS = Utility_FA.GetDataset("FA_RPT_BRSADJPRINT", Procparam);

            if (DS.Tables[1].Rows.Count > 0)
            {
                rptd.Load(Server.MapPath("Print Formats/BRSAdjustment.rpt"));

                rptd.SetDataSource(DS.Tables[0]);
                rptd.Subreports["BRSAdjustment_Dtl.rpt"].SetDataSource(DS.Tables[1]);

                strFolder = (Server.MapPath(".") + "\\PDF Files\\");
                if (!(System.IO.Directory.Exists(strFolder)))
                {
                    DirectoryInfo di = Directory.CreateDirectory(strFolder);
                }
                strnewFile = strFolder + "BRS_" + objGuid.ToString() + ".pdf";
                string strScipt = "";
                if (strnewFile != "")
                {
                    rptd.SetDataSource(DS.Tables[0]);
                    rptd.Subreports["BRSAdjustment_Dtl.rpt"].SetDataSource(DS.Tables[1]);
                    rptd.ExportToDisk(ExportFormatType.PortableDocFormat, strnewFile); //ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "DeliveryInstruction");
                }
                if (File.Exists(strnewFile))
                {
                    // strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strFileName + "', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                    strScipt = "window.open('../Common/FADownloadPage.aspx?qsFileName=" + strnewFile.Replace(@"\", "/") + "&qsNeedPrint=yes', 'newwindow','toolbar=no,location=no,menubar=no,width=950,height=600,resizable=yes,scrollbars=yes,top=50,left=50');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strScipt, true);
                }
            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(this, "No Records Found");
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            CVBRS.ErrorMessage = "Unable to print pdf";
            CVBRS.IsValid = false;
        }
    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {

        if (Convert.ToInt32(ddlExportType.SelectedValue) > 0)
        {
            FunPriDefaultParam();
            Procparam.Add("@Option", "15");
            Procparam.Add("@Search_Type", Convert.ToString(ddlExportType.SelectedValue));
            DataTable dtExport = Utility_FA.GetDefaultData(strProcName, Procparam);
            if (dtExport.Rows.Count > 0)
            {
                string attachment = "attachment; filename=Bank_Reconciliation_Statement.xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                GridView GridViewexcel = new GridView();
                GridViewexcel.DataSource = dtExport;
                GridViewexcel.DataBind();
                GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
                GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
                GridViewexcel.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
        }
        else
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@User_Id", intUserID.ToString());
            Procparam.Add("@Bank_ID", ddlBankName.SelectedValue);
            Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
            Procparam.Add("@StartDate", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            Procparam.Add("@Enddate", Utility_FA.StringToDate(txtEndDate.Text).ToString());
            Procparam.Add("@Bal_Amt", txtOpeningBalance.Text);
            Procparam.Add("@CL_AMT", txtUnclearedAdjust.Text);
            Procparam.Add("@Option", "1");

            DataSet DSExcel = Utility_FA.GetDataset("FA_RPT_BRSPRINT", Procparam);
            if (DSExcel.Tables[1].Rows.Count > 0)
            {
                string attachment = "attachment; filename=Bank_Reconciliation_Statement.xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.xls";
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                GridView GridViewexcel = new GridView();
                GridView grv1 = new GridView();
                GridView grv2 = new GridView();
                GridViewexcel.DataSource = DSExcel.Tables[1];
                GridViewexcel.DataBind();
                GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
                GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
                DataTable dtHeader = new DataTable();
                dtHeader.Columns.Add("Column1");

                DataRow row = dtHeader.NewRow();
                row["Column1"] = ObjUserInfo_FA.ProCompanyNameRW.ToString();
                dtHeader.Rows.Add(row);

                row = dtHeader.NewRow();
                row["Column1"] = "Bank Reconciliation Report for the period " + DSExcel.Tables[0].Rows[0]["STARTDATE"] + " to " + DSExcel.Tables[0].Rows[0]["ENDDATE"];
                dtHeader.Rows.Add(row);

                row = dtHeader.NewRow();
                dtHeader.Rows.Add(row);
                grv1.DataSource = dtHeader;
                grv1.DataBind();

                grv1.HeaderRow.Visible = false;
                grv1.GridLines = GridLines.None;

                grv1.Rows[0].Cells[0].ColumnSpan = 7;
                grv1.Rows[1].Cells[0].ColumnSpan = 7;
                grv1.Rows[2].Cells[0].ColumnSpan = 7;

                grv1.Rows[0].HorizontalAlign = HorizontalAlign.Center;
                grv1.Rows[1].HorizontalAlign = HorizontalAlign.Center;
                grv1.Rows[2].HorizontalAlign = HorizontalAlign.Center;

                grv1.Font.Bold = true;
                grv1.ForeColor = System.Drawing.Color.DarkBlue;
                grv1.Font.Name = "calibri";
                grv1.Font.Size = 11;
                grv1.RenderControl(htw);

                //GridView Grv = new GridView();
                //Grv.DataSource = dtTable;
                //Grv.DataBind();
                DataTable dtHeader2 = new DataTable();
                DataRow row2 = dtHeader2.NewRow();
                row2 = dtHeader2.NewRow();
                dtHeader2.Rows.Add(row2);

                row2 = dtHeader2.NewRow();
                dtHeader2.Columns.Add("Column1");
                row2["Column1"] = string.Empty;
                dtHeader2.Columns.Add("Column2");
                row2["Column2"] = string.Empty;
                dtHeader2.Columns.Add("Column3");
                row2["Column3"] = "BRS Summary";
                dtHeader2.Columns.Add("Column4");
                row2["Column4"] = string.Empty;
                dtHeader2.Columns.Add("Column5");
                row2["Column5"] = string.Empty;
                dtHeader2.Columns.Add("Column6");
                row2["Column6"] = string.Empty;
                dtHeader2.Columns.Add("Column7");
                row2["Column7"] = string.Empty;
                dtHeader2.Rows.Add(row2);

                row2 = dtHeader2.NewRow();
                row2["Column1"] = string.Empty;
                row2["Column2"] = string.Empty;
                row2["Column3"] = "Arrived Balance as per Bank Reconciliation";
                row2["Column4"] = string.Empty;
                row2["Column5"] = string.Empty;
                row2["Column6"] = DSExcel.Tables[0].Rows[0]["LST_OPBAL"];
                row2["Column7"] = string.Empty;
                dtHeader2.Rows.Add(row2);

                row2 = dtHeader2.NewRow();
                row2 = dtHeader2.NewRow();
                row2["Column1"] = string.Empty;
                row2["Column2"] = string.Empty;
                row2["Column3"] = "Balance as per Bank Statement as on " + DSExcel.Tables[0].Rows[0]["ENDDATE"];
                row2["Column4"] = string.Empty;
                row2["Column5"] = string.Empty;
                row2["Column6"] = DSExcel.Tables[0].Rows[0]["CL_AMT"];
                row2["Column7"] = string.Empty;
                dtHeader2.Rows.Add(row2);
                grv2.DataSource = dtHeader2;
                grv2.DataBind();
                grv2.HeaderRow.Visible = false;
                grv2.GridLines = GridLines.None;

                grv2.Font.Bold = true;
                grv2.Rows[1].Font.Underline = true;
                grv2.ForeColor = System.Drawing.Color.DarkBlue;
                grv2.Font.Name = "calibri";
                grv2.Font.Size = 11;
                GridViewexcel.RenderControl(htw);
                grv2.RenderControl(htw);
                Response.Write(sw.ToString());
                Response.End();
            }
            else
            {
                Utility_FA.FunShowAlertMsg_FA(this, "No Records Found");
                return;
            }
        }
    }

    protected void btnpblClose_Click(object sender, EventArgs e)
    {
        try
        {
            mpePblMatch.Hide();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnProbableMatch_Click(object sender, EventArgs e)
    {
        try
        {
            btnpblMatchFixed.Enabled = btnPblMtchExport.Enabled = btnpblMtchUpdate.Enabled = btnPblMtchReDup.Enabled = false;
            ucPblMatchPaging.Visible = false;
            gvpblMatchDtl.DataSource = null;
            gvpblMatchDtl.DataBind();
            mpePblMatch.Show();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnRcptShowall_Click(object sender, EventArgs e)
    {
        try
        {
            ddlRcptSearch.SelectedValue = "-1";
            txtRcptSearchText.Clear_FA();
            FunPriGetRcptDtls();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnPmtShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            ddlPaymentSearch.SelectedValue = "-1";
            txtPmtSrchTxt.Clear_FA();
            FunPriGetPmtDtls();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnpblMatchProcess_Click(object sender, EventArgs e)
    {
        try
        {
            bool blnRslt = true;

            if (gvPblMatchType != null && gvPblMatchType.Rows.Count > 0)
            {
                //Check Add Entered Text exists in Less
                for (Int32 i = 0; i < gvPblMatchType.Rows.Count; i++)
                {
                    if (blnRslt == true)
                    {
                        TextBox txtgvpblAdd = (TextBox)gvPblMatchType.Rows[i].FindControl("txtgvpblAdd");
                        if (Convert.ToString(txtgvpblAdd.Text).Trim() != "")
                        {
                            blnRslt = false;
                            for (Int32 j = 0; j < gvPblMatchType.Rows.Count; j++)
                            {
                                TextBox txtgvpblLess = (TextBox)gvPblMatchType.Rows[j].FindControl("txtgvpblLess");
                                if (txtgvpblAdd.Text == txtgvpblLess.Text)
                                {
                                    blnRslt = true;
                                }
                            }
                        }
                    }
                }

                if (blnRslt == false)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Certain Values are mismatched between Add and Less");
                    return;
                }

                //Check Less Entered Text exists in Add
                blnRslt = true;
                for (Int32 i = 0; i < gvPblMatchType.Rows.Count; i++)
                {
                    if (blnRslt == true)
                    {
                        TextBox txtgvpblLess = (TextBox)gvPblMatchType.Rows[i].FindControl("txtgvpblLess");
                        if (Convert.ToString(txtgvpblLess.Text).Trim() != "")
                        {
                            blnRslt = false;
                            for (Int32 j = 0; j < gvPblMatchType.Rows.Count; j++)
                            {
                                TextBox txtgvpblAdd = (TextBox)gvPblMatchType.Rows[j].FindControl("txtgvpblAdd");
                                if (txtgvpblLess.Text == txtgvpblAdd.Text)
                                {
                                    blnRslt = true;
                                }
                            }
                        }
                    }
                }

                if (blnRslt == false)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Certain Values are mismatched between Add and Less");
                    return;
                }

                ProPblMtchPageNumRW = 1;
                ProPblMtchPageSizeRW = 10;

                FunPriDefaultParam();
                Procparam.Add("@Option", "8");
                Procparam.Add("@XMLPblMtchType", Utility_FA.FunPubFormXml_FA(gvPblMatchType, true, true));

                DataTable dtRslt = Utility_FA.GetDefaultData(strProcName, Procparam);
                ucPblMatchPaging.Visible = true;
                FunPriGetPblMatchDtls();
            }
            mpePblMatch.Show();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnPblMtchExport_Click(object sender, EventArgs e)
    {
        FunPriDefaultParam();
        Procparam.Add("@Option", "10");
        Procparam.Add("@Search_Type", "1");

        DataTable dtExport = Utility_FA.GetDefaultData(strProcName, Procparam);
        if (dtExport.Rows.Count > 0)
        {
            string attachment = "attachment; filename=Probable_Match.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView GridViewexcel = new GridView();
            GridViewexcel.DataSource = dtExport;
            GridViewexcel.DataBind();
            GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
            GridViewexcel.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }

    protected void btnpblMtchUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            string strXML = "<Root>";
            for (Int32 i = 0; i < gvpblMatchDtl.Rows.Count; i++)
            {
                strXML = strXML + " <Details ";
                CheckBox chkSelect = (CheckBox)gvpblMatchDtl.Rows[i].FindControl("chkbxDtlSelect");
                Label lblgvMtchAdjHdrID = (Label)gvpblMatchDtl.Rows[i].FindControl("lblgvMtchAdjHdrID");
                strXML = strXML + " AdjHdrID = " + "'" + Convert.ToString(lblgvMtchAdjHdrID.Text) + "'";
                strXML = strXML + " Checked = " + "'" + ((chkSelect.Checked == true) ? "1" : "0") + "'";
                strXML = strXML + " />";
            }
            strXML = strXML + "</Root>";

            FunPriDefaultParam();
            Procparam.Add("@Option", "12");
            Procparam.Add("@XMLPblMtchType", Convert.ToString(strXML).ToUpper());
            Utility_FA.GetDefaultData(strProcName, Procparam);
            hdnPblMatchChange.Value = "0";
            mpePblMatch.Show();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnpblMatchFixed_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(hdnPblMatchChange.Value) == "1")
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Certain Values are changed. kindly click update before proceed.");
                return;
            }

            FunPriDefaultParam();
            Procparam.Add("@Option", "14");

            DataTable dtRslt = Utility_FA.GetDefaultData(strProcName, Procparam);
            if (dtRslt != null && dtRslt.Rows.Count > 0)
            {
                Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(dtRslt.Rows[0]["Error_Msg"]));
                return;
            }

            mpePblMatch.Hide();
            FunPriGetRcptDtls();
            FunPriGetPmtDtls();
            FunPriCalcUnclearedAmt();
            FunPriGetManualAdjustmentDtls();
            FunPriCalcAdjustmentAmt();
        }
        catch (Exception objException)
        {
        }
    }

    protected void btnAdjShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            strSearchValue = "";
            FunPriGetManualAdjustmentDtls();
        }
        catch (Exception objException)
        {

        }
    }

    protected void btnPblMtchReDup_Click(object sender, EventArgs e)
    {
        FunPriDefaultParam();
        Procparam.Add("@Option", "10");
        Procparam.Add("@Search_Type", "2");

        DataTable dtExport = Utility_FA.GetDefaultData(strProcName, Procparam);
        if (dtExport.Rows.Count > 0)
        {
            string attachment = "attachment; filename=ReDup_Details.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView GridViewexcel = new GridView();
            GridViewexcel.DataSource = dtExport;
            GridViewexcel.DataBind();
            GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
            GridViewexcel.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }

    #endregion

    #region "Textbox event"

    protected void txtDocDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(txtDocumentDate.Text).Trim() != "")
            {
                if (Utility_FA.StringToDate(txtDocumentDate.Text) > System.DateTime.Now.Date)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Entered Date cannot be greater than system date");
                    txtDocumentDate.Text = "";
                    return;
                }
                if (!Utility_FA.FunPubValidateWithFinYear(this.Page, txtDocumentDate, txtDocumentDate.Text, "Doc Date"))
                {
                    return;
                }

                if (FunProValidateMonthLock(txtDocumentDate.Text))
                {
                    //Utility_FA.FunShowAlertMsg_FA(this.Page, "Month locked for the selected Date");
                    Utility_FA.FunShowValidationMsg_FA(this, 1825);
                    txtDocumentDate.Text = DateTime.Now.ToString(strDateFormat);
                    return;
                }
            }
        }
        catch (Exception objException)
        {
            CVBRS.ErrorMessage = objException.Message;
            CVBRS.IsValid = false;
        }
    }

    protected void txtRealizationDateP_TextChanged(object sender, EventArgs e)
    {
        TextBox txtRealizationDate = (TextBox)sender;
        GridViewRow grvRow = (GridViewRow)txtRealizationDate.Parent.Parent;
        int i = grvRow.RowIndex;
        Label lblPayment_Date = (Label)grvPaymentDtls.Rows[i].FindControl("lblPayment_Date");
        if (!string.IsNullOrEmpty(txtRealizationDate.Text) && !string.IsNullOrEmpty(lblPayment_Date.Text))
        {
            if (Utility_FA.StringToDate(txtRealizationDate.Text) < Utility_FA.StringToDate(lblPayment_Date.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Realization date should be greater than Payment date");
                return;

            }
        }
    }

    protected void txtRealizationDateR_TextChanged(object sender, EventArgs e)
    {
        TextBox txtRealizationDate = (TextBox)sender;
        GridViewRow grvRow = (GridViewRow)txtRealizationDate.Parent.Parent;
        int i = grvRow.RowIndex;
        Label lblPayment_Date = (Label)grvReceiptDtls.Rows[i].FindControl("lblReceipt_Date");
        if (!string.IsNullOrEmpty(txtRealizationDate.Text) && !string.IsNullOrEmpty(lblPayment_Date.Text))
        {
            if (Utility_FA.StringToDate(txtRealizationDate.Text) < Utility_FA.StringToDate(lblPayment_Date.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Realization date should be greater than Receipt date");
                return;

            }
        }
    }

    #endregion

    #region "Grid events"

    protected void grvReceiptDtls_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtRealizationDate = e.Row.FindControl("txtRealizationDate") as TextBox;
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = e.Row.FindControl("CEtxtRealizationDate") as AjaxControlToolkit.CalendarExtender;
                CEtxtRealizationDate.Format = strDateFormat;

                txtRealizationDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRealizationDate.ClientID + "','" + strDateFormat + "',true,  false);");

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
            }
            //FunPricalcSumAmountR();       --Commented on 12Apr2016 due to pagination introduce
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to Bound recipt details.";
            CVBRS.IsValid = false;
        }
    }

    protected void grvPaymentDtls_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtRealizationDate = e.Row.FindControl("txtRealizationDate") as TextBox;
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = e.Row.FindControl("CEtxtRealizationDate") as AjaxControlToolkit.CalendarExtender;
                CEtxtRealizationDate.Format = strDateFormat;

                txtRealizationDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtRealizationDate.ClientID + "','" + strDateFormat + "',true,  false);");

            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {

            }
            //FunPricalcSumAmountP();   --Commented on 12Apr2016 due to pagination introduce
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to Bound payment details.";
            CVBRS.IsValid = false;
        }
    }

    protected void grvAdjustments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                //FunPriInsertAdjustDetails();
                FunPriInsertManualAdjs();
            }
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to add Adjustment details.";
            CVBRS.IsValid = false;
        }
    }

    protected void grvAdjustments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {

                TextBox txtAmount = (TextBox)e.Row.FindControl("txtAmount");
                TextBox txtAdj_Date = e.Row.FindControl("txtAdj_Date") as TextBox;
                AjaxControlToolkit.CalendarExtender CEtxtAdj_Date = e.Row.FindControl("CEtxtAdj_Date") as AjaxControlToolkit.CalendarExtender;
                CEtxtAdj_Date.Format = strDateFormat;

                //txtAdj_Date.Attributes.Add("onblur", "fnDoDate(this,'" + txtAdj_Date.ClientID + "','" + strDateFormat + "',false,  true);");
                txtAdj_Date.Attributes.Add("onblur", "fnChkMnlAdjDate(this,'" + txtAdj_Date.ClientID + "','" + strDateFormat + "');");

                if (strMode != "Q")
                {
                    txtAmount.SetDecimalPrefixSuffix_FA(ObjFASession.ProGpsPrefixRW, ObjFASession.ProGpsSuffixRW, true, "Amount");
                }



                /* if (rdbPuchaseSale.SelectedValue == "S")
                 {
                     txtAssetNumber.Visible = RFVAssetNumber.Enabled = false;
                     ddlAssetNumber.Visible = RFVddlAssetNumber.Enabled = true;
                 }
                 else
                 {
                     txtAssetNumber.Visible = RFVAssetNumber.Enabled = true;
                     ddlAssetNumber.Visible = RFVddlAssetNumber.Enabled = false;
                 }*/


            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblAutoManual = (Label)e.Row.FindControl("lblAutoManual");
                LinkButton lnkRemove = (LinkButton)e.Row.FindControl("lnkbtngvRemove");
                LinkButton lnkEdit = (LinkButton)e.Row.FindControl("lnkbtngvAdjEdit");
                LinkButton lnkCancel = (LinkButton)e.Row.FindControl("lnkbtngvAdjCancel");
                //DropDownList ddlAdjDoc_RefI = (DropDownList)e.Row.FindControl("ddlAdjDoc_RefI");
                //if (!string.IsNullOrEmpty(lblAutoManual.Text))
                //{
                //    if (lblAutoManual.Text != "M")
                //        lnkRemove.Visible = false;
                //}

                if (Convert.ToString(lblAutoManual.Text).Trim() == "M")        //Manual Entries
                {
                    lnkEdit.Visible = lnkCancel.Visible = false;
                    lnkRemove.Visible = true;
                }
                //System Entries    //Auo Matched Entries
                else if (Convert.ToString(lblAutoManual.Text).Trim() == "S" || Convert.ToString(lblAutoManual.Text).Trim() == "A")
                {
                    lnkEdit.Visible = true;
                    lnkRemove.Visible = lnkCancel.Visible = false;
                }
                else
                {
                    lnkEdit.Visible = lnkRemove.Visible = lnkCancel.Visible = false;
                }

                //DataTable dtStagingtableNew = new DataTable();
                //if (ViewState["dtStagingtable"] != null)
                //{
                //    dtStagingtableNew = ((DataTable)ViewState["dtStagingtable"]).Copy();
                //}
                //ddlAdjDoc_RefI.BindDataTable_FA(dtStagingtableNew, new string[] { "Temp_Ref_No", "Temp_Ref_No" });

                //ddlAdjDoc_RefI.DataSource = dtStagingtableNew;
                //ddlAdjDoc_RefI.DataTextField = "Temp_Ref_No";
                //ddlAdjDoc_RefI.DataValueField = "Temp_Ref_No";
                //ddlAdjDoc_RefI.DataBind();
                //System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                //ddlAdjDoc_RefI.Items.Insert(0, liSelect);

            }
            //FunPriSetMaxLength();
            //FunPriSetControlDDLToolTip();
            //FunPricalcSumAmountA();
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to Bound Adjust details.";
            CVBRS.IsValid = false;
        }
    }

    protected void grvAdjustments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            //FunPriRemoveAdjustDetails(e.RowIndex);
            //FunPriSetControlDDLToolTip();
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to Delete details.";
            CVBRS.IsValid = false;
        }
    }

    protected void grvPrevAdjustments_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    #endregion

    #region "Checkbox Events"

    protected void chkClearingStatusP_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            CheckBox chkClearingStatus = (CheckBox)sender;
            GridViewRow gvRow = (GridViewRow)chkClearingStatus.Parent.Parent;
            HiddenField hdnTran_Header_Id = (HiddenField)grvPaymentDtls.Rows[gvRow.RowIndex].FindControl("hdnTran_Header_Id");
            FunPricalcSumAmountP();
            if (hdnTran_Header_Id != null)
            {
                if (chkClearingStatus.Checked)
                    FunUpdatePaymentREceiptDT("P", hdnTran_Header_Id.Value, 1);
                else
                    FunUpdatePaymentREceiptDT("P", hdnTran_Header_Id.Value, 0);
            }

        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to load the details";
            CVBRS.IsValid = false;
        }

    }

    protected void chkClearingStatusR_CheckedChanged(object sender, EventArgs e)
    {
        try
        {

            CheckBox chkClearingStatus = (CheckBox)sender;
            GridViewRow gvRow = (GridViewRow)chkClearingStatus.Parent.Parent;
            HiddenField hdnTran_Header_Id = (HiddenField)grvReceiptDtls.Rows[gvRow.RowIndex].FindControl("hdnTran_Header_Id");

            FunPricalcSumAmountR();
            if (hdnTran_Header_Id != null)
            {
                if (chkClearingStatus.Checked)
                    FunUpdatePaymentREceiptDT("R", hdnTran_Header_Id.Value, 1);
                else
                    FunUpdatePaymentREceiptDT("R", hdnTran_Header_Id.Value, 0);
            }
            chkClearingStatus.Focus();
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to load the details";
            CVBRS.IsValid = false;
        }

    }

    protected void chkNegate_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chkNegate = (CheckBox)sender;
            GridViewRow gvRow = (GridViewRow)chkNegate.Parent.Parent;

            Label lblgvadjHdrID = (Label)gvRow.FindControl("lblgvadjHdrID");
            TextBox txtAdjDoc_Ref = (TextBox)gvRow.FindControl("txtAdjDoc_Ref");
            TextBox txtGroupDoc_Ref = (TextBox)gvRow.FindControl("txtgvadjGroupDocNo");


            if (chkNegate.Checked == true && Convert.ToString(txtAdjDoc_Ref.Text).Trim() != "")
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Document already adjusted so unable to negate");
                chkNegate.Checked = false;
                return;
            }

            if (chkNegate.Checked == true && Convert.ToString(txtGroupDoc_Ref.Text).Trim() != "")
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Document already Grouped so unable to negate");
                chkNegate.Checked = false;
                return;
            }

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "4");
            Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
            Procparam.Add("@Bank_Id", Convert.ToString(ddlBankName.SelectedValue));
            Procparam.Add("@Location_Id", Convert.ToString(ddlLocation.SelectedValue));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Is_Negate", (chkNegate.Checked == true) ? "1" : "0");
            Procparam.Add("@Adjst_Hdr_ID", Convert.ToString(lblgvadjHdrID.Text));

            DataTable dtAdjstDtl = Utility_FA.GetDefaultData("FA_BRS_InsertTmpAdjDtl", Procparam);

            if (Convert.ToInt32(dtAdjstDtl.Rows[0]["Error_Code"]) == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(dtAdjstDtl.Rows[0]["Error_Msg"]));
                return;
            }
            else
            {
                FunPriCalcAdjustmentAmt();
            }


            #region "Commented on 15Apr2016"

            //DataTable dtStagingtableNew = new DataTable();
            //if (ViewState["dtStagingtable"] != null)
            //{
            //    dtStagingtableNew = ((DataTable)ViewState["dtStagingtable"]).Copy();
            //}
            //if (chkNegate.Checked)
            //{
            //    DataRow[] drStat = dtStagingtableNew.Select("Status <> 'C'");
            //    if (drStat.Length > 0)
            //    {
            //        ddlAdjDoc_RefI.DataSource = drStat.CopyToDataTable();
            //        ddlAdjDoc_RefI.DataTextField = "Temp_Ref_No";
            //        ddlAdjDoc_RefI.DataValueField = "Temp_Ref_No";
            //        ddlAdjDoc_RefI.DataBind();
            //        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            //        ddlAdjDoc_RefI.Items.Insert(0, liSelect);
            //    }
            //}
            //else
            //{
            //    if (ddlAdjDoc_RefI.Items.Count > 0)
            //        ddlAdjDoc_RefI.SelectedIndex = -1;
            //    FunPriSetddlAdjDocRefNo(ddlAdjDoc_RefI, lblAmount, lblAdjDoc_Ref, "R");
            //    ddlAdjDoc_RefI.DataSource = null;
            //    ddlAdjDoc_RefI.DataBind();
            //    if (ddlAdjDoc_RefI.Items.Count > 0)
            //        ddlAdjDoc_RefI.Items.Clear();
            //}

            #endregion
        }
        catch (Exception ex)
        {
            CVBRS.ErrorMessage = "Unable to load the details";
            CVBRS.IsValid = false;
        }

    }

    private void FunUpdatePaymentREceiptDT(string strOption, string strTran_Hdr_Id, int chkstat)
    {
        DataTable dttemp = new DataTable();
        if (strOption == "P")//Payment
        {
            if (ViewState["PaymentDtls"] != null)
                dttemp = ((DataTable)ViewState["PaymentDtls"]);

        }
        else if (strOption == "R")//Receipt
        {
            if (ViewState["ReceiptDtls"] != null)
                dttemp = ((DataTable)ViewState["ReceiptDtls"]);
        }
        if (dttemp.Rows.Count > 0)
        {
            DataRow[] drPymnt = dttemp.Select("Tran_Header_Id=" + strTran_Hdr_Id + "");
            if (drPymnt.Length > 0)
            {
                drPymnt[0]["Clearing_Status"] = chkstat;
            }
        }

        if (strOption == "P")//Payment
            ViewState["PaymentDtls"] = dttemp;
        else if (strOption == "R")//Receipt
            ViewState["ReceiptDtls"] = dttemp;


    }

    protected void chkbxHdrSelectAll_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chkbxHdrSelectAll = (CheckBox)gvpblMatchDtl.HeaderRow.FindControl("chkbxHdrSelectAll");
            FunPriDefaultParam();
            Procparam.Add("@Option", "11");
            Procparam.Add("@Is_Checked", (chkbxHdrSelectAll.Checked == true) ? "1" : "0");

            Utility_FA.GetDefaultData(strProcName, Procparam);
            FunPriGetPblMatchDtls();
        }
        catch (Exception objException)
        {
        }

    }

    #endregion

    #region "DropDown List"

    protected void ddlLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadBankDetails();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            CVBRS.ErrorMessage = "";
            CVBRS.IsValid = false;
        }
    }

    protected void ddlAdjDoc_RefI_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlAdjDoc_RefI = (DropDownList)sender;
            GridViewRow gvRow = (GridViewRow)ddlAdjDoc_RefI.Parent.Parent;
            Label lblAdjDoc_Ref = (Label)gvRow.FindControl("lblAdjDoc_Ref");
            Label lblAmount = (Label)gvRow.FindControl("lblAmount");

            FunPriSetddlAdjDocRefNo(ddlAdjDoc_RefI, lblAmount, lblAdjDoc_Ref, "R");
            FunPriSetddlAdjDocRefNo(ddlAdjDoc_RefI, lblAmount, lblAdjDoc_Ref, "P");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            CVBRS.ErrorMessage = "";
            CVBRS.IsValid = false;
        }
    }

    private void FunPriSetddlAdjDocRefNo(DropDownList ddlAdjDoc_RefI, Label lblAmount, Label lblAdjDoc_Ref, string strProcess)
    {
        string strtemprefno = string.Empty;
        if (strProcess == "R")
        {
            strtemprefno = lblAdjDoc_Ref.Text;
        }
        else
        {
            if (ddlAdjDoc_RefI.SelectedIndex > 0)
                strtemprefno = ddlAdjDoc_RefI.SelectedValue;
        }



        DataTable dtStagingtableNew = new DataTable();
        if (ViewState["dtStagingtable"] != null)
        {
            dtStagingtableNew = ((DataTable)ViewState["dtStagingtable"]).Copy();
        }

        DataRow[] drStagin = dtStagingtableNew.Select("Temp_Ref_No='" + strtemprefno + "'");

        if (drStagin.Length > 0)
        {
            decimal decInstrumentAmount = 0, decAdjAmount = 0, decDocAmount = 0;

            if (!string.IsNullOrEmpty(drStagin[0]["INSTRUMENT AMOUNT"].ToString()))
                decInstrumentAmount = Convert.ToDecimal(drStagin[0]["INSTRUMENT AMOUNT"].ToString());
            if (!string.IsNullOrEmpty(drStagin[0]["Adjust_Amount"].ToString()))
                decAdjAmount = Convert.ToDecimal(drStagin[0]["Adjust_Amount"].ToString());
            if (!string.IsNullOrEmpty(lblAmount.Text))
                decDocAmount = Convert.ToDecimal(lblAmount.Text);



            if (strProcess == "P")
            {
                //InstrumAmt - Adj Amt should not less than Receipt/Payment Amount
                if (decDocAmount > (decInstrumentAmount - decAdjAmount))
                {
                    ddlAdjDoc_RefI.SelectedIndex = -1;
                    Utility_FA.FunShowAlertMsg_FA(this, "Amount mismatch.");
                    return;
                }
                //update Manual as Aut_Man
                drStagin[0]["Aut_Man"] = "M";


                //update Adj Amt
                drStagin[0]["Adjust_Amount"] = decAdjAmount + decDocAmount;
                decAdjAmount = decAdjAmount + decDocAmount;

                //If InstrumAmt - Adj Amt =0 then update status as C,else =instrumAmt  then None else partial;
                if (decInstrumentAmount - decAdjAmount == 0)//C
                {
                    drStagin[0]["Status"] = "C";
                }
                else if (decInstrumentAmount - decAdjAmount == decInstrumentAmount)//N
                {
                    drStagin[0]["Status"] = "N";
                }
                else//P
                {
                    drStagin[0]["Status"] = "P";
                }
                lblAdjDoc_Ref.Text = strtemprefno;
            }
            else
            {

                //update Adj Amt
                decAdjAmount = decAdjAmount - decDocAmount;
                drStagin[0]["Adjust_Amount"] = decAdjAmount;


                //If InstrumAmt - Adj Amt =0 then update status as C,else =instrumAmt  then None else partial;
                if (decInstrumentAmount - decAdjAmount == 0)//C
                {
                    drStagin[0]["Status"] = "C";
                }
                else if (decInstrumentAmount - decAdjAmount == decInstrumentAmount)//N
                {
                    drStagin[0]["Status"] = "N";
                }
                else//P
                {
                    drStagin[0]["Status"] = "P";
                }

                //update Null as Aut_Man if adj_Amt is 0
                if (Convert.ToDecimal(drStagin[0]["Adjust_Amount"]) == 0)
                    drStagin[0]["Aut_Man"] = null;

                lblAdjDoc_Ref.Text = null;
            }

            ViewState["dtStagingtable"] = dtStagingtableNew;
            DataRow[] drStat = dtStagingtableNew.Select("Status <> 'C'");
            if (drStat.Length > 0)
            {
                grvStagingtbl.DataSource = drStat.CopyToDataTable();
                grvStagingtbl.DataBind();
            }
            else
            {
                grvStagingtbl.DataSource = dtStagingtableNew;
                grvStagingtbl.DataBind();
            }
        }
    }

    protected void ddlBankName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            btnAutoMatchNew.Enabled = false;
            gvUploadDtl.DataSource = null;
            gvUploadDtl.DataBind();
            ViewState["FIleUploadedID"] = 0;
            FunPriLoadBankInfo();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            CVBRS.ErrorMessage = "";
            CVBRS.IsValid = false;
        }
    }

    protected void ddlFooterAddOrLess_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //FunPriLoadVoucherNoDetails();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            CVBRS.ErrorMessage = "";
            CVBRS.IsValid = false;
        }
    }

    protected void ddlReconStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //1	Open 2	Closed
            if (ddlReconStatus.SelectedValue == "2")//Closed
            {
                if (string.IsNullOrEmpty(lblTotBankStamt.Text))
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Enter Bank Statement");
                    ddlReconStatus.SelectedValue = "1";
                    return;
                }
                if (!string.IsNullOrEmpty(lblTotBankStamt.Text) && !string.IsNullOrEmpty(txtUnclearedAdjust.Text))
                {
                    if (Convert.ToDecimal(lblTotBankStamt.Text) != Convert.ToDecimal(txtUnclearedAdjust.Text))
                    {
                        Utility_FA.FunShowAlertMsg_FA(this, "Bank Statement and arrived should be equal");
                        ddlReconStatus.SelectedValue = "1";
                    }
                }
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            CVBRS.ErrorMessage = "";
            CVBRS.IsValid = false;
        }
    }

    protected void ddlRcptSortType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ProRcptPageNumRW = 1;
            FunPriGetRcptDtls();
        }
        catch (Exception objException)
        {
        }
    }

    protected void ddlPmtSortType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ProPmtPageNumRW = 1;
            FunPriGetPmtDtls();
        }
        catch (Exception objException)
        {
        }
    }

    #endregion

    #region "Image Button Events"

    protected void imgbtnViewStmt_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            string strSelectID = ((ImageButton)sender).ClientID;
            int _iRowIdx = Utility_FA.FunPubGetGridRowID("gvUploadDtl", strSelectID);

            Label lblUpldFilePath = (Label)gvUploadDtl.Rows[_iRowIdx].FindControl("lblUpldFilePath");
            if (!File.Exists(lblUpldFilePath.Text))
            {
                Utility_FA.FunShowAlertMsg_FA(this, "File not found");
                return;
            }

            string XlsPath = Convert.ToString(lblUpldFilePath.Text);
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
        catch (Exception objException)
        {

        }
    }

    protected void imgbtnRcptSrch_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            try
            {
                if (Convert.ToInt32(ddlRcptSearch.SelectedValue) == 2)
                {
                    Utility_FA.StringToDate(txtRcptSearchText.Text.Trim());
                }
            }
            catch (Exception objex)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Invalid Date Format");
                return;
            }
            FunPriGetRcptDtls();
        }
        catch (Exception objException)
        {
        }
    }

    protected void imgbtnPmtSrch_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            try
            {
                if (Convert.ToInt32(ddlPaymentSearch.SelectedValue) == 2)
                {
                    Utility_FA.StringToDate(txtPmtSrchTxt.Text.Trim());
                }
            }
            catch (Exception objex)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Invalid Date Format");
                return;
            }
            FunPriGetPmtDtls();
        }
        catch (Exception objException)
        {
        }
    }

    protected void imgbtnExportPayment_Click(object sender, ImageClickEventArgs e)
    {
        FunPriDefaultParam();
        Procparam.Add("@Option", "18");
        DataTable dtExport = Utility_FA.GetDefaultData(strProcName, Procparam);
        if (dtExport.Rows.Count > 0)
        {
            string attachment = "attachment; filename=Book_Payments.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView GridViewexcel = new GridView();
            GridViewexcel.DataSource = dtExport;
            GridViewexcel.DataBind();
            GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
            GridViewexcel.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }

    protected void imgbtnExportRcpt_Click(object sender, ImageClickEventArgs e)
    {
        FunPriDefaultParam();
        Procparam.Add("@Option", "17");
        DataTable dtExport = Utility_FA.GetDefaultData(strProcName, Procparam);
        if (dtExport.Rows.Count > 0)
        {
            string attachment = "attachment; filename=Book_Receipts.xls";
            Response.ClearContent();
            Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/vnd.xls";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            GridView GridViewexcel = new GridView();
            GridViewexcel.DataSource = dtExport;
            GridViewexcel.DataBind();
            GridViewexcel.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
            GridViewexcel.ForeColor = System.Drawing.Color.DarkBlue;
            GridViewexcel.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }
    }

    #endregion

    #region "Link Button Events"

    protected void lnkbtngvAdjEdit_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkbtngvAdjEdit = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lnkbtngvAdjEdit.Parent.Parent;
            int iRowIdx = gvRow.RowIndex;

            if (Convert.ToString(lnkbtngvAdjEdit.Text) == "Edit")
            {
                TextBox txtgvadjGroupDocNo = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtgvadjGroupDocNo");
                TextBox txtAdjDoc_Ref = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjDoc_Ref");
                CheckBox chkNegate = (CheckBox)grvAdjustments.Rows[iRowIdx].FindControl("chkNegate");
                LinkButton lnkEdit = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjEdit");
                LinkButton lnkCancel = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjCancel");
                TextBox txtAdjstRemarks = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjstRemarks");

                txtAdjDoc_Ref.Enabled = txtgvadjGroupDocNo.Enabled = chkNegate.Enabled =
                    txtAdjstRemarks.Enabled = true;

                lnkEdit.Text = "Update";
                lnkCancel.Visible = true;
            }
            else if (Convert.ToString(lnkbtngvAdjEdit.Text) == "Update")
            {
                TextBox txtgvadjGroupDocNo = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtgvadjGroupDocNo");
                TextBox txtAdjDoc_Ref = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjDoc_Ref");
                CheckBox chkNegate = (CheckBox)grvAdjustments.Rows[iRowIdx].FindControl("chkNegate");
                Label lblAmount = (Label)grvAdjustments.Rows[iRowIdx].FindControl("lblAmount");
                TextBox txtAdjstRemarks = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjstRemarks");
                LinkButton lnkEdit = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjEdit");
                Label lblgvadjHdrID = (Label)grvAdjustments.Rows[iRowIdx].FindControl("lblgvadjHdrID");
                LinkButton lnkCancel = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjCancel");

                if (Convert.ToString(txtAdjDoc_Ref.Text) != "" && chkNegate.Checked == true)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Both Adj Doc Ref and Negate should not be entered/checked");
                    return;
                }

                if (Convert.ToString(txtAdjDoc_Ref.Text) != "" && Convert.ToString(txtgvadjGroupDocNo.Text) != "")
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Both Group Doc Ref and Adj Doc Ref should not be Entered");
                    return;
                }

                if (Convert.ToString(txtgvadjGroupDocNo.Text) != "" && chkNegate.Checked == true)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Both Group Doc Ref and Negate should not be entered/checked");
                    return;
                }

                //if (Convert.ToString(txtgvadjGroupDocNo.Text) == "" && Convert.ToString(txtAdjDoc_Ref.Text) == "" && chkNegate.Checked == false)
                //{
                //    Utility_FA.FunShowAlertMsg_FA(this, "Either Group Doc Ref (or) Negate (or) Adj Doc Ref should be entered/checked");
                //    return;
                //}

                Procparam = new Dictionary<string, string>();

                Procparam.Add("@Option", "2");
                Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
                Procparam.Add("@Bank_Id", Convert.ToString(ddlBankName.SelectedValue));
                Procparam.Add("@Location_Id", Convert.ToString(ddlLocation.SelectedValue));
                Procparam.Add("@User_ID", Convert.ToString(intUserID));
                Procparam.Add("@Adjst_Hdr_ID", Convert.ToString(lblgvadjHdrID.Text));
                if (Convert.ToString(txtAdjDoc_Ref.Text).Trim() != "")
                    Procparam.Add("@Adjustment_Doc_No", Convert.ToString(txtAdjDoc_Ref.Text));
                Procparam.Add("@Amount", Convert.ToString(lblAmount.Text));
                if (Convert.ToString(txtgvadjGroupDocNo.Text).Trim() != "")
                    Procparam.Add("@Group_Doc_Ref", Convert.ToString(txtgvadjGroupDocNo.Text));
                Procparam.Add("@Is_Negate", (chkNegate.Checked) ? "1" : "0");
                Procparam.Add("@Remarks", Convert.ToString(txtAdjstRemarks.Text));

                DataTable dtAdjst = Utility_FA.GetDefaultData("FA_BRS_InsertTmpAdjDtl", Procparam);
                if (Convert.ToInt32(dtAdjst.Rows[0]["Error_Code"]) == 0)
                {
                    txtAdjDoc_Ref.Enabled = txtgvadjGroupDocNo.Enabled = chkNegate.Enabled =
                    txtAdjstRemarks.Enabled = lnkCancel.Visible = false;
                    lnkEdit.Text = "Edit";
                    FunPriGetManualAdjustmentDtls();
                }
                else
                {
                    Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(dtAdjst.Rows[0]["Error_Msg"]));
                    return;
                }
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void lnkbtngvRemove_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkbtngvRemove = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lnkbtngvRemove.Parent.Parent;
            int iRowIdx = gvRow.RowIndex;
            FunPriRemoveAdjustDetails(iRowIdx);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    protected void lnkbtngvAdjCancel_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkbtngvAdjCancel = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lnkbtngvAdjCancel.Parent.Parent;
            int iRowIdx = gvRow.RowIndex;

            TextBox txtgvadjGroupDocNo = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtgvadjGroupDocNo");
            TextBox txtAdjDoc_Ref = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjDoc_Ref");
            CheckBox chkNegate = (CheckBox)grvAdjustments.Rows[iRowIdx].FindControl("chkNegate");
            Label lblAmount = (Label)grvAdjustments.Rows[iRowIdx].FindControl("lblAmount");
            TextBox txtAdjstRemarks = (TextBox)grvAdjustments.Rows[iRowIdx].FindControl("txtAdjstRemarks");
            LinkButton lnkEdit = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjEdit");
            Label lblgvadjHdrID = (Label)grvAdjustments.Rows[iRowIdx].FindControl("lblgvadjHdrID");
            LinkButton lnkCancel = (LinkButton)grvAdjustments.Rows[iRowIdx].FindControl("lnkbtngvAdjCancel");

            txtAdjDoc_Ref.Enabled = txtgvadjGroupDocNo.Enabled = chkNegate.Enabled =
               txtAdjstRemarks.Enabled = false;

            lnkEdit.Text = "Edit";
            lnkCancel.Visible = false;
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    #region "User defined Methods"

    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            //Code end

            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;
            //setting date format
            strDateFormat = ObjFASession.ProDateFormatRW;

            strConnectionName = ObjFASession.ProConnectionName;

            if (!string.IsNullOrEmpty(strDateFormat))
            {
                CEDocumentDate.Format = CEStartDate.Format = CEEndDate.Format = strDateFormat;
            }
            if (Request.QueryString["qsViewId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString["qsViewId"]);
                strBRS_Id = fromTicket.Name;
            }
            if (Request.QueryString["qsMode"] != null)
                strMode = Request.QueryString.Get("qsMode");

            #region Paging Config

            TextBox txtRcptPageSize = (TextBox)ucReceiptPaging.FindControl("txtPageSize");
            if (txtRcptPageSize.Text != "")
                ProRcptPageSizeRW = Convert.ToInt32(txtRcptPageSize.Text);
            else
                ProRcptPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            TextBox txtGotoPage = (TextBox)ucReceiptPaging.FindControl("txtGotoPage");
            if (Convert.ToString(txtGotoPage.Text) != "")
                ProRcptPageNumRW = Convert.ToInt32(txtGotoPage.Text);
            else
                ProRcptPageNumRW = 1;

            PageAssignValue obj = new PageAssignValue(this.AssignValue);
            ucReceiptPaging.callback = obj;
            ucReceiptPaging.ProPageNumRW = ProRcptPageNumRW;
            ucReceiptPaging.ProPageSizeRW = ProRcptPageSizeRW;

            //Payment
            TextBox txtPmtPageSize = (TextBox)ucPaymentPaging.FindControl("txtPageSize");
            if (txtPmtPageSize.Text != "")
                ProPmtPageSizeRW = Convert.ToInt32(txtPmtPageSize.Text);
            else
                ProPmtPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            TextBox txtPmtGotoPage = (TextBox)ucPaymentPaging.FindControl("txtGotoPage");
            if (Convert.ToString(txtPmtGotoPage.Text) != "")
                ProPmtPageNumRW = Convert.ToInt32(txtPmtGotoPage.Text);
            else
                ProPmtPageNumRW = 1;

            PagePaymentAssignValue objPmt = new PagePaymentAssignValue(this.PmtAssignValue);
            ucPaymentPaging.callback = objPmt;
            ucPaymentPaging.ProPageNumRW = ProPmtPageNumRW;
            ucPaymentPaging.ProPageSizeRW = ProPmtPageSizeRW;

            //Adjustment
            TextBox txtAdjstPageSize = (TextBox)ucAdjstPaging.FindControl("txtPageSize");
            if (txtAdjstPageSize.Text != "")
                ProAdjstPageSizeRW = Convert.ToInt32(txtAdjstPageSize.Text);
            else
                ProAdjstPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            TextBox txtAdjstGotoPage = (TextBox)ucAdjstPaging.FindControl("txtGotoPage");
            if (Convert.ToString(txtAdjstGotoPage.Text) != "")
                ProAdjstPageNumRW = Convert.ToInt32(txtAdjstGotoPage.Text);
            else
                ProAdjstPageNumRW = 1;

            PageAdjstAssignValue objAdjst = new PageAdjstAssignValue(this.AdjstAssignValue);
            ucAdjstPaging.callback = objAdjst;
            ucAdjstPaging.ProPageNumRW = ProAdjstPageNumRW;
            ucAdjstPaging.ProPageSizeRW = ProAdjstPageSizeRW;

            //Probable Match
            TextBox txtPblMtchPageSize = (TextBox)ucPblMatchPaging.FindControl("txtPageSize");
            if (txtPblMtchPageSize.Text != "")
                ProPblMtchPageSizeRW = Convert.ToInt32(txtPblMtchPageSize.Text);
            else
                ProPblMtchPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

            TextBox txtPblMtchGotoPage = (TextBox)ucPblMatchPaging.FindControl("txtGotoPage");
            if (Convert.ToString(txtPblMtchGotoPage.Text) != "")
                ProPblMtchPageNumRW = Convert.ToInt32(txtPblMtchGotoPage.Text);
            else
                ProPblMtchPageNumRW = 1;

            PagePblMtchAssignValue objPblMtch = new PagePblMtchAssignValue(this.PblMtchAssignValue);
            ucPblMatchPaging.callback = objPblMtch;
            ucPblMatchPaging.ProPageNumRW = ProPblMtchPageNumRW;
            ucPblMatchPaging.ProPageSizeRW = ProPblMtchPageSizeRW;

            #endregion

            strSuffixFormat = (ObjFASession.ProGpsSuffixRW == 2) ? "0.00" : "0.000";
            lblSuffix.Text = Convert.ToString(ObjFASession.ProGpsSuffixRW);

            if (!IsPostBack)
            {

                txtDocumentDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtDocumentDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtStartDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtStartDate.ClientID + "','" + strDateFormat + "',true,  false);");
                txtEndDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtEndDate.ClientID + "','" + strDateFormat + "',true,  false);");

                //FunPriLoadLocation();
                FunPriLoadLov();

                if (strMode == "M")
                {
                    FunPriLoadControls();
                    FunPriGetBRSDetails(strBRS_Id);
                    //funprigetstagingtable();
                    FunPriDisableControls(1);
                }
                else if (strMode == "Q")
                {
                    FunPriGetBRSDetails(strBRS_Id);
                    //funprigetstagingtable();
                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriLoadControls();
                    FunPriDisableControls(0);
                }
                btnClear.Visible = false;
                lblTotBankStamt.SetDecimalPrefixSuffix_FA(ObjFASession.ProGpsPrefixRW, ObjFASession.ProGpsSuffixRW, true, "Bank Statement");
                ////Setting Dimensions Applicable or not
                //if (!ObjFASession.ProDimensionApplicableRW)
                //    FunSetDisableDimensions();
                ddlLocation.Focus();

            }
            //FunPriSetMaxLength();
            //FunPriSetControlDDLToolTip();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to load/Bind the grid for the given datatable.
    /// </summary>
    /// <param name="grv"></param>
    /// <param name="dtEntityBankdetails"></param>
    private void FunFillgrid(GridView grv, DataTable dtbl)
    {
        try
        {
            grv.DataSource = dtbl;
            grv.DataBind();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriClearPage()
    {
        try
        {
            ddlLocation.Clear_FA();
            ddlBankName.Items.Clear();
            ddlBankName.Text = "";
            txtStartDate.Text = txtEndDate.Text = txtOpeningBalance.Text = string.Empty;
            grvReceiptDtls.DataSource = null;
            grvReceiptDtls.DataBind();
            grvPaymentDtls.DataSource = null;
            grvPaymentDtls.DataBind();
            FunPriLoadEmptyAdjustDetails();
            grvPrevAdjustments.DataSource = null;
            grvPrevAdjustments.DataBind();
            lblTotBankCredit.Text =
            txtUnclearedAdjust.Text =
            lblTotBankDebit.Text =
            lblTotBankStamt.Text = "0.00";
            lnkViewStatement.Enabled = false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriClearGrid()
    {
        try
        {
            grvReceiptDtls.DataSource = null;
            grvReceiptDtls.DataBind();
            grvPaymentDtls.DataSource = null;
            grvPaymentDtls.DataBind();
            FunPriLoadEmptyAdjustDetails();
            grvPrevAdjustments.DataSource = null;
            grvPrevAdjustments.DataBind();
            ViewState["ReceiptDtls"] = null;
            ViewState["PaymentDtls"] = null;
            ViewState["dtPrevAdjustments"] = null;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriBtnFetchDtls()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", intCompanyID.ToString());
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());
            DataSet DS = Utility_FA.GetDataset("FA_GET_BRS_Dtls", Procparam);
            if (DS.Tables[0].Rows.Count > 0)
            {
                dtReceiptDtls = DS.Tables[0].Copy();
                grvReceiptDtls.DataSource = dtReceiptDtls;
                grvReceiptDtls.DataBind();
                ViewState["ReceiptDtls"] = dtReceiptDtls;
            }
            else
            {
                grvReceiptDtls.DataSource = null;
                grvReceiptDtls.DataBind();
                ViewState["ReceiptDtls"] = null;
            }
            if (DS.Tables[1].Rows.Count > 0)
            {
                dtPaymentDtls = DS.Tables[1].Copy();
                grvPaymentDtls.DataSource = dtPaymentDtls;
                grvPaymentDtls.DataBind();
                ViewState["PaymentDtls"] = dtPaymentDtls;
            }
            else
            {
                grvPaymentDtls.DataSource = null;
                grvPaymentDtls.DataBind();
                ViewState["PaymentDtls"] = null;
            }

            if (DS.Tables[2].Rows.Count > 0)
            {
                DataTable dtPrevAdjustments = DS.Tables[2].Copy();
                grvPrevAdjustments.DataSource = dtPrevAdjustments;
                grvPrevAdjustments.DataBind();
                ViewState["dtPrevAdjustments"] = dtPrevAdjustments;
            }
            else
            {
                grvPrevAdjustments.DataSource = null;
                grvPrevAdjustments.DataBind();
                ViewState["dtPrevAdjustments"] = null;
            }

            txtOpeningBalance.Text = "0";
            lblCrDr.Text = "Cr";
            if (DS.Tables[3].Rows.Count > 0)
            {
                txtOpeningBalance.Text = DS.Tables[3].Rows[0]["Opening_Bal"].ToString();
                if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
                {
                    if (Convert.ToDecimal(txtOpeningBalance.Text) < 0)
                        lblCrDr.Text = "Dr";
                }
            }

            //Added on 27Feb2016 Starts Here

            if (DS.Tables[4].Rows.Count > 0)
            {
                gvUploadDtl.DataSource = DS.Tables[4];
                gvUploadDtl.DataBind();
                btnAutoMatchNew.Enabled = true;
            }
            else
            {
                btnAutoMatchNew.Enabled = false;
                gvUploadDtl.DataSource = null;
                gvUploadDtl.DataBind();
            }

            //Added on 27Feb2016 Ends Here

            FunPriLoadEmptyAdjustDetails();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void funprigetstagingtable()
    {
        DataTable dtautomatchmodify = new DataTable();
        Dictionary<string, string> procparam1 = new Dictionary<string, string>();
        Dictionary<string, string> procparam2 = new Dictionary<string, string>();
        foreach (GridViewRow grow in grvPaymentDtls.Rows)
        {

            procparam2.Add("@No", ((Label)grow.FindControl("lblPayment_No")).Text);
            procparam1.Add("@Bank_id", ddlBankName.SelectedValue);
            procparam1.Add("@Instrument_No", (Utility_FA.GetDefaultData("FA_BRS_Get_IntruNo", procparam2).Rows[0]["Instrument_no"]).ToString());
            procparam1.Add("@Amount", ((Label)grow.FindControl("lblAmount")).Text);
            procparam1.Add("@mode", "1");
            dtStagingtable = Utility_FA.GetDefaultData("FA_BRS_GetMatchedData", procparam1);

            if (dtStagingtable != null)
            {
                if (dtStagingtable.Rows.Count > 0)
                {
                    if (dtStagingtable.Rows.Count > 1)
                    {
                        break;
                    }

                    if (dtautomatchmodify.Rows.Count == 0)
                    {
                        dtautomatchmodify = dtStagingtable.Copy();
                    }
                    else
                    {
                        DataRow dr = dtautomatchmodify.NewRow();
                        dr.BeginEdit(); procparam2.Clear();
                        dr = dtStagingtable.Rows[0];
                        dr.EndEdit();
                        dtautomatchmodify.Rows.Add(dr);
                    }
                }
            }
            procparam2.Clear();
            procparam1.Clear();
        }
        dtautomatchmodify.AcceptChanges();

        foreach (GridViewRow grecow in grvReceiptDtls.Rows)
        {
            procparam2.Clear();
            procparam1.Clear();
            procparam2.Add("@No", ((Label)grecow.FindControl("lblReceipt_No")).Text);
            procparam1.Add("@Bank_id", ddlBankName.SelectedValue);
            procparam1.Add("@Instrument_No", (Utility_FA.GetDefaultData("FA_BRS_Get_IntruNo", procparam2).Rows[0]["Instrument_no"]).ToString());
            procparam1.Add("@Amount", ((Label)grecow.FindControl("lblAmount")).Text);
            procparam1.Add("@mode", "2");
            dtStagingtable = Utility_FA.GetDefaultData("FA_BRS_GetMatchedData", procparam1);
            if (dtStagingtable != null)
            {
                if (dtStagingtable.Rows.Count > 0)
                {
                    if (dtStagingtable.Rows.Count > 1)
                    {
                        break;
                    }

                    if (dtautomatchmodify.Rows.Count == 0)
                    {
                        dtautomatchmodify = dtStagingtable.Copy();
                    }
                    else
                    {
                        DataRow dr = dtautomatchmodify.NewRow();
                        dr.BeginEdit();
                        dr = dtStagingtable.Rows[0];
                        dr.EndEdit();
                        dtautomatchmodify.Rows.Add(dr);
                    }
                }
            }
            procparam2.Clear();
            procparam1.Clear();
        }
        dtautomatchmodify.AcceptChanges();


        grvStagingtbl.DataSource = dtautomatchmodify;
        grvStagingtbl.DataBind();

    }

    private void FunPriGetBRSDetails(string strBRS_ID)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
            Procparam.Add("@BRS_Id", strBRS_ID);
            Procparam.Add("@Usr_ID", Convert.ToString(intUserID));
            DataSet DS = new DataSet();
            DS = Utility_FA.GetDataset("FA_BRS_Mod_Qry", Procparam);

            if (DS.Tables[0].Rows.Count > 0)//header part
            {
                DataTable dthdr = DS.Tables[0].Copy();
                if (!string.IsNullOrEmpty(dthdr.Rows[0]["Location_Id"].ToString()))
                {
                    ddlLocation.SelectedText = dthdr.Rows[0]["LocationCat_Description"].ToString();
                    ddlLocation.SelectedValue = dthdr.Rows[0]["Location_Id"].ToString();
                }

                //FunPriLoadBankDetails();
                if (!string.IsNullOrEmpty(dthdr.Rows[0]["Bank_Id"].ToString()))
                {
                    ListItem lstitem = new ListItem(dthdr.Rows[0]["Bank_Name"].ToString(), dthdr.Rows[0]["Bank_Id"].ToString());
                    ddlBankName.Items.Add(lstitem);
                    //ddlBankName.SelectedValue = dthdr.Rows[0]["Bank_Id"].ToString();
                }
                txtDocumentNo.Text = Convert.ToString(dthdr.Rows[0]["BRS_NO"]);
                txtDocumentDate.Text = Convert.ToString(dthdr.Rows[0]["BRS_Date"]);

                if (!string.IsNullOrEmpty(dthdr.Rows[0]["Recon_Status"].ToString()))
                {
                    if (strMode == "Q")
                    {
                        ListItem lstitem = new ListItem(dthdr.Rows[0]["Recon_Status_Desc"].ToString(), dthdr.Rows[0]["Recon_Status"].ToString());
                        ddlReconStatus.Items.Add(lstitem);
                    }
                    else
                    {
                        ddlReconStatus.SelectedValue = dthdr.Rows[0]["Recon_Status"].ToString();
                    }
                }
                if (!string.IsNullOrEmpty(dthdr.Rows[0]["Bal_Amt"].ToString()))
                    txtOpeningBalance.Text = dthdr.Rows[0]["Bal_Amt"].ToString();
                if (!string.IsNullOrEmpty(dthdr.Rows[0]["TargetAmt"].ToString()))
                    lblTotBankStamt.Text = dthdr.Rows[0]["TargetAmt"].ToString();
                if (!string.IsNullOrEmpty(dthdr.Rows[0]["RangeFM"].ToString()))
                    txtStartDate.Text = dthdr.Rows[0]["RangeFM"].ToString();

                if (!string.IsNullOrEmpty(dthdr.Rows[0]["RangeTO"].ToString()))
                    txtEndDate.Text = dthdr.Rows[0]["RangeTO"].ToString();

                if (Convert.ToString(txtUnclearedAdjust.Text) != "" && Convert.ToString(lblTotBankStamt.Text) != "")
                {
                    lblBRSDiffAmount.Text = (Convert.ToDecimal(txtUnclearedAdjust.Text) - Convert.ToDecimal(lblTotBankStamt.Text)).ToString(strSuffixFormat);
                }

            }

            #region "Commented On 19Apr2016"
            /*

            if (DS.Tables[1].Rows.Count > 0)//Receipt part
            {
                grvReceiptDtls.DataSource = DS.Tables[1];
                grvReceiptDtls.DataBind();
                ViewState["ReceiptDtls"] = DS.Tables[1];
            }
            if (DS.Tables[2].Rows.Count > 0)//Payment part
            {
                grvPaymentDtls.DataSource = DS.Tables[2];
                grvPaymentDtls.DataBind();
                ViewState["PaymentDtls"] = DS.Tables[2];
            }
            if (DS.Tables[3].Rows.Count > 0)//Adjustment part
            {
                grvAdjustments.DataSource = DS.Tables[3];
                grvAdjustments.DataBind();
                ViewState["dtAdjustmentDetails"] = DS.Tables[3];
            }
            else
            {
                FunPriLoadEmptyAdjustDetails();
            }

            if (DS.Tables[4].Rows.Count > 0)//Prev Adjustment part
            {
                grvPrevAdjustments.DataSource = DS.Tables[4];
                grvPrevAdjustments.DataBind();
                ViewState["dtPrevAdjustmentDetails"] = DS.Tables[4];
            }

            //if (DS.Tables[5].Rows.Count > 0)//Staging table part
            //{
            //    grvStagingtbl.DataSource = DS.Tables[5];
            //    grvStagingtbl.DataBind();
            //    ViewState["dtStagingtable"] = DS.Tables[5];
            //}

            */
            #endregion

            lblCrDr.Text = "Cr";
            if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
            {
                if (Convert.ToDecimal(txtOpeningBalance.Text) < 0)
                    lblCrDr.Text = "Dr";

            }

            if (DS.Tables.Count > 2)
            {
                gvUploadDtl.DataSource = DS.Tables[1];
                gvUploadDtl.DataBind();
                gvUploadDtl.Columns[gvUploadDtl.Columns.Count - 1].Visible = false;
            }
            FunPriGetRcptDtls();
            FunPriGetPmtDtls();
            FunPriCalcUnclearedAmt();
            FunPriGetManualAdjustmentDtls();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriClearAdjAmt()
    {
        if (ViewState["dtStagingtable"] != null)
        {
            dtStagingtable = (DataTable)ViewState["dtStagingtable"];
            DataRow[] drStagDtls = dtStagingtable.Select("Aut_Man ='M' or Aut_Man  is null");
            foreach (DataRow dr in drStagDtls)
            {
                dr["Adjust_Amount"] = null;
                dr["Status"] = "N"; dr["Aut_Man"] = null;
            }
        }
    }

    private void FunPriGenerateAdjustments()
    {
        try
        {
            if (ViewState["dtAdjustmentDetails"] != null)
            {
                dtAdjustmentDetails = (DataTable)ViewState["dtAdjustmentDetails"];
                DataRow[] drAjstDtls = dtAdjustmentDetails.Select("AutoManual ='A' or AutoManual  is null");
                foreach (DataRow dr in drAjstDtls)
                {
                    dr.Delete();
                }
            }

            FunPriClearAdjAmt();

            //Add-Receipts
            foreach (GridViewRow grvRow in grvReceiptDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvRow.FindControl("chkClearingStatus");

                HiddenField hdnTran_Header_Id = (HiddenField)grvRow.FindControl("hdnTran_Header_Id");
                Label lblReceipt_Date = (Label)grvRow.FindControl("lblReceipt_Date");
                Label lblReceipt_No = (Label)grvRow.FindControl("lblReceipt_No");
                Label lblChallan_No = (Label)grvRow.FindControl("lblChallan_No");
                Label lblInstrument_No = (Label)grvRow.FindControl("lblInstrument_No");
                Label lblAmount = (Label)grvRow.FindControl("lblAmount");

                TextBox txtRealizationDate = (TextBox)grvRow.FindControl("txtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvRow.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");

                if (!chkClearingStatus.Checked)
                {
                    DataRow drAdj = dtAdjustmentDetails.NewRow();
                    drAdj["AddOrLess"] = "Add";
                    drAdj["Doc_Ref"] = lblReceipt_No.Text;
                    drAdj["Adj_Date"] = lblReceipt_Date.Text;
                    //drAdj["Description"]=;
                    drAdj["Amount"] = lblAmount.Text;
                    //drAdj["Negate"]=;
                    //drAdj["Adj_Doc_Ref"]=;
                    //drAdj["Remarks"]=;
                    drAdj["AutoManual"] = "A";
                    dtAdjustmentDetails.Rows.Add(drAdj);
                }


            }

            //Less-Payments
            foreach (GridViewRow grvRow in grvPaymentDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvRow.FindControl("chkClearingStatus");

                HiddenField hdnTran_Header_Id = (HiddenField)grvRow.FindControl("hdnTran_Header_Id");
                Label lblPayment_Date = (Label)grvRow.FindControl("lblPayment_Date");
                Label lblPayment_No = (Label)grvRow.FindControl("lblPayment_No");
                Label lblAmount = (Label)grvRow.FindControl("lblAmount");

                TextBox txtRealizationDate = (TextBox)grvRow.FindControl("txtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvRow.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");
                if (!chkClearingStatus.Checked)
                {
                    DataRow drAdj = dtAdjustmentDetails.NewRow();
                    drAdj["AddOrLess"] = "Less";
                    drAdj["Doc_Ref"] = lblPayment_No.Text;
                    drAdj["Adj_Date"] = lblPayment_Date.Text;
                    //drAdj["Description"]=;
                    drAdj["Amount"] = lblAmount.Text;
                    //drAdj["Negate"]=;
                    //drAdj["Adj_Doc_Ref"]=;
                    //drAdj["Remarks"]=;
                    drAdj["AutoManual"] = "A";
                    dtAdjustmentDetails.Rows.Add(drAdj);
                }
            }

            grvAdjustments.DataSource = dtAdjustmentDetails;
            grvAdjustments.DataBind();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriLoadEmptyAdjustDetails()
    {
        try
        {
            DataRow drEmptyRow;
            dtAdjustmentDetails = new DataTable();
            dtAdjustmentDetails.Columns.Add("AddOrLess");
            dtAdjustmentDetails.Columns.Add("Doc_Ref");
            dtAdjustmentDetails.Columns.Add("Adj_Date");
            dtAdjustmentDetails.Columns.Add("Description");
            //dtAdjustmentDetails.Columns.Add("Debit_Credit");
            dtAdjustmentDetails.Columns.Add("Amount");
            dtAdjustmentDetails.Columns.Add("Negate");
            dtAdjustmentDetails.Columns.Add("Adj_Doc_Ref");
            dtAdjustmentDetails.Columns.Add("Remarks");
            dtAdjustmentDetails.Columns.Add("AutoManual");
            drEmptyRow = dtAdjustmentDetails.NewRow();
            dtAdjustmentDetails.Rows.Add(drEmptyRow);
            ViewState["dtAdjustmentDetails"] = dtAdjustmentDetails;
            FunFillgrid(grvAdjustments, dtAdjustmentDetails);
            grvAdjustments.Rows[0].Visible = false;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void FunPriInsertAdjustDetails()
    {
        try
        {
            dtAdjustmentDetails = new DataTable();
            if (ViewState["dtAdjustmentDetails"] != null)
            {
                dtAdjustmentDetails = (DataTable)ViewState["dtAdjustmentDetails"];
            }

            DropDownList ddlFooterAddOrLess = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlFooterAddOrLess");
            DropDownList ddlDoc_Ref = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlDoc_Ref");
            TextBox txtAdj_Date = (TextBox)grvAdjustments.FooterRow.FindControl("txtAdj_Date");
            TextBox txtDescription = (TextBox)grvAdjustments.FooterRow.FindControl("txtDescription");
            TextBox txtAmount = (TextBox)grvAdjustments.FooterRow.FindControl("txtAmount");
            TextBox txtRemarks = (TextBox)grvAdjustments.FooterRow.FindControl("txtRemarks");
            CheckBox chkNegateF = (CheckBox)grvAdjustments.FooterRow.FindControl("chkNegateF");
            DropDownList ddlAdjDoc_Ref = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlAdjDoc_Ref");


            //Duplication check
            if (dtAdjustmentDetails.Rows.Count > 0)
            {
                foreach (DataRow dr in dtAdjustmentDetails.Rows)
                {
                    if (!string.IsNullOrEmpty(ddlDoc_Ref.SelectedValue))
                    {
                        if (dr["Doc_Ref"].ToString() == ddlDoc_Ref.SelectedValue)
                        {
                            Utility_FA.FunShowValidationMsg_FA(this, 1817);
                            return;
                        }
                    }
                }
            }


            //deleting dummy Row
            if (dtAdjustmentDetails.Rows.Count == 1)
            {
                if (dtAdjustmentDetails.Rows[0]["Doc_Ref"].ToString() == string.Empty)
                    dtAdjustmentDetails.Rows[0].Delete();
            }

            DataRow drInvoiceDetails;
            drInvoiceDetails = dtAdjustmentDetails.NewRow();

            drInvoiceDetails["AddOrLess"] = ddlFooterAddOrLess.SelectedItem.Text;
            if (ddlDoc_Ref.SelectedIndex > 0)
                drInvoiceDetails["Doc_Ref"] = ddlDoc_Ref.SelectedItem.Text;
            drInvoiceDetails["Adj_Date"] = txtAdj_Date.Text;
            drInvoiceDetails["Description"] = txtDescription.Text;

            drInvoiceDetails["Amount"] = txtAmount.Text;
            drInvoiceDetails["Negate"] = chkNegateF.Checked;
            if (ddlAdjDoc_Ref.SelectedIndex > 0)
                drInvoiceDetails["Adj_Doc_Ref"] = ddlAdjDoc_Ref.SelectedItem.Text;
            drInvoiceDetails["Remarks"] = txtRemarks.Text;
            drInvoiceDetails["AutoManual"] = "M";
            dtAdjustmentDetails.Rows.Add(drInvoiceDetails);

            ViewState["dtAdjustmentDetails"] = dtAdjustmentDetails;
            FunFillgrid(grvAdjustments, dtAdjustmentDetails);


        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriRemoveAdjustDetails(int intRowIndex)
    {
        try
        {
            Label lblgvadjHdrID = (Label)grvAdjustments.Rows[intRowIndex].FindControl("lblgvadjHdrID");
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "3");
            Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
            Procparam.Add("@Bank_Id", Convert.ToString(ddlBankName.SelectedValue));
            Procparam.Add("@Location_Id", Convert.ToString(ddlLocation.SelectedValue));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Adjst_Hdr_ID", Convert.ToString(lblgvadjHdrID.Text));

            DataTable dtAdjst = Utility_FA.GetDefaultData("FA_BRS_InsertTmpAdjDtl", Procparam);
            FunPriGetManualAdjustmentDtls();

            //dtAdjustmentDetails = (DataTable)ViewState["dtAdjustmentDetails"];
            //dtAdjustmentDetails.Rows.RemoveAt(intRowIndex);
            //if (dtAdjustmentDetails.Rows.Count == 0)
            //{
            //    FunPriLoadEmptyAdjustDetails();
            //}
            //else
            //{
            //    FunFillgrid(grvAdjustments, dtAdjustmentDetails);
            //}

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    /// <summary>
    /// This method is used to Enable/Disable controls based on Query/Modify Mode
    /// </summary>
    /// <param name="intMode"></param>
    private void FunPriDisableControls(int intMode)
    {
        try
        {
            switch (intMode)
            {
                case 0:
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    ddlReconStatus.SelectedValue = "1";//Default Open
                    btnPrint.Visible = lnkViewStatement.Enabled = false;
                    //FunPriLoadEmptyAssetDetails();//For asset details
                    //FunPriLoadEmptyAdjustDetails();//For Invoice details
                    //ddlPaymentStatus.SelectedValue = "1";
                    btnAdjst.Visible = btnExcel.Visible = btnProbableMatch.Enabled = false;
                    ucAdjstPaging.Visible = false;
                    break;
                case 1:
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    btnClear.Enabled = false;
                    txtStartDate.ReadOnly = txtEndDate.ReadOnly = txtDocumentDate.ReadOnly = true;
                    btnFetch.Visible = false;
                    ddlLocation.Enabled = false;
                    ddlBankName.ClearDropDownList_FA();
                    imgPaymentRequestDate.Visible = imgStartDate.Visible = ImgEndDate.Visible = CEDocumentDate.Enabled =
                    CEStartDate.Enabled = CEEndDate.Enabled = false;
                    btnPrint.Visible = true;
                    btnAutoMatch.Visible = btnAutoMatchNew.Visible = false;
                    if (ddlReconStatus.SelectedValue == "2")//Closed
                    {
                        QueryView();
                        return;
                    }
                    //rdbPuchaseSale.Enabled = false;
                    //btnClear.Enabled = false;
                    //txtDocumentDate.ReadOnly = txtValueDate.ReadOnly = true;
                    //ddlLocation.ClearDropDownList_FA();
                    //CEPaymentRequestDate.Enabled = CEValueDate.Enabled = false;
                    //ddlPaymentStatus.ClearDropDownList_FA();
                    btnPrint.Visible = btnAdjst.Visible = true;
                    btnExcel.Visible = false;
                    break;
                case -1:

                    QueryView();
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    btnPrint.Visible = btnAdjst.Visible = true;
                    btnExcel.Visible = false;
                    break;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void QueryView()
    {
        try
        {
            btnAutoMatch.Visible = btnAutoMatchNew.Visible = false;
            btnFetch.Visible = btnClear.Enabled = false;
            btnPrint.Visible = true;
            txtStartDate.ReadOnly = txtEndDate.ReadOnly = txtDocumentDate.ReadOnly = true;
            ddlLocation.Enabled = false;
            ddlBankName.ClearDropDownList_FA();
            ddlReconStatus.ClearDropDownList_FA();
            imgPaymentRequestDate.Visible = imgStartDate.Visible = ImgEndDate.Visible = false;
            CEDocumentDate.Enabled = CEStartDate.Enabled = CEEndDate.Enabled = false;
            btnSave.Enabled = btnGetAdj.Enabled = false;
            lblTotBankStamt.ReadOnly = true;

            #region " Commented On 19Apr2016"
            /*
            if (grvAdjustments.FooterRow != null)
                grvAdjustments.FooterRow.Visible = false;
            grvAdjustments.Columns[grvAdjustments.Columns.Count - 1].Visible = false;
            
            //receipts
            foreach (GridViewRow grvR in grvReceiptDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvR.FindControl("chkClearingStatus");
                TextBox txtRealizationDate = (TextBox)grvR.FindControl("txtRealizationDate");
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = (AjaxControlToolkit.CalendarExtender)grvR.FindControl("CEtxtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvR.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvR.FindControl("txtRemarks");
                chkClearingStatus.Enabled = CEtxtRealizationDate.Enabled = false;
                txtRealizationDate.ReadOnly = txtBank_Charges.ReadOnly = txtRemarks.ReadOnly = true;
            }
            //Payments
            foreach (GridViewRow grvR in grvPaymentDtls.Rows)
            {
                CheckBox chkClearingStatus = (CheckBox)grvR.FindControl("chkClearingStatus");
                TextBox txtRealizationDate = (TextBox)grvR.FindControl("txtRealizationDate");
                AjaxControlToolkit.CalendarExtender CEtxtRealizationDate = (AjaxControlToolkit.CalendarExtender)grvR.FindControl("CEtxtRealizationDate");
                TextBox txtBank_Charges = (TextBox)grvR.FindControl("txtBank_Charges");
                TextBox txtRemarks = (TextBox)grvR.FindControl("txtRemarks");
                chkClearingStatus.Enabled = CEtxtRealizationDate.Enabled = false;
                txtRealizationDate.ReadOnly = txtBank_Charges.ReadOnly = txtRemarks.ReadOnly = true;
            }
            //Adjustments
            foreach (GridViewRow grvRow in grvAdjustments.Rows)
            {
                CheckBox chkNegate = (CheckBox)grvRow.FindControl("chkNegate");
                //TextBox txtAdjDoc_Ref = (TextBox)grvRow.FindControl("txtAdjDoc_Ref");
                TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");
                chkNegate.Enabled = false;
                //txtAdjDoc_Ref.ReadOnly = 
                txtRemarks.ReadOnly = true;
            }

            //Previous Adjustments
            foreach (GridViewRow grvRow in grvPrevAdjustments.Rows)
            {
                CheckBox chkNegate = (CheckBox)grvRow.FindControl("chkNegate");
                //TextBox txtAdjDoc_Ref = (TextBox)grvRow.FindControl("txtAdjDoc_Ref");
                TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");
                chkNegate.Enabled = false;
                //txtAdjDoc_Ref.ReadOnly = 
                txtRemarks.ReadOnly = true;
            }
            */
            #endregion

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadLocation()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());
            Procparam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (strMode == "C")
            {
                Procparam.Add("@Location_Active", "1");
                Procparam.Add("@Is_Operational", "1");
            }
            Procparam.Add("@Program_ID", "100");
            //ddlLocation.BindDataTable_FA(SPNames.GetLocation, Procparam, new string[] { "Location_ID", "Location" });
            Procparam = null;
            //if (ddlLocation.Items.Count == 2)
            //{
            //    ddlLocation.SelectedIndex = 1;
            //    FunPriLoadBankDetails();
            //}
        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPricalcSumAmountR()
    {
        try
        {
            if (grvReceiptDtls != null)
            {
                decimal sum = 0;
                foreach (GridViewRow grvReceiptDtlsRow in grvReceiptDtls.Rows)
                {
                    Label txtAmount = (Label)grvReceiptDtlsRow.FindControl("lblAmount");
                    CheckBox chkClearingStatus = (CheckBox)grvReceiptDtlsRow.FindControl("chkClearingStatus");
                    if (!chkClearingStatus.Checked)
                    {
                        if (!(string.IsNullOrEmpty(txtAmount.Text)))
                            sum += (Convert.ToDecimal(txtAmount.Text));
                    }
                }
                txtUnclearedReceipts.Text = (sum).ToString(strSuffixFormat);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPricalcSumAmountP()
    {
        try
        {
            if (grvPaymentDtls != null)
            {
                decimal sum = 0;
                foreach (GridViewRow grvReceiptDtlsRow in grvPaymentDtls.Rows)
                {
                    Label txtAmount = (Label)grvReceiptDtlsRow.FindControl("lblAmount");
                    CheckBox chkClearingStatus = (CheckBox)grvReceiptDtlsRow.FindControl("chkClearingStatus");
                    if (!chkClearingStatus.Checked)
                    {
                        if (!(string.IsNullOrEmpty(txtAmount.Text)))
                            sum += (Convert.ToDecimal(txtAmount.Text));
                    }
                }
                txtUnclearedPayments.Text = (sum).ToString(strSuffixFormat);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPricalcSumAmountA()
    {
        try
        {
            if (grvAdjustments != null)
            {
                decimal sum = 0, decCr = 0, decDr = 0, decopenbal = 0;
                if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
                    decopenbal = Convert.ToDecimal(txtOpeningBalance.Text);

                foreach (GridViewRow grvAdjustmentsRow in grvAdjustments.Rows)
                {
                    Label txtAmount = (Label)grvAdjustmentsRow.FindControl("lblAmount");
                    Label lblAddOrLess = (Label)grvAdjustmentsRow.FindControl("lblAddOrLess");

                    if (!(string.IsNullOrEmpty(txtAmount.Text)))
                    {
                        //sum += (Convert.ToDecimal(txtAmount.Text));
                        //credit
                        if (lblAddOrLess.Text.ToUpper() == "ADD")
                            decCr += (Convert.ToDecimal(txtAmount.Text));

                        //debit
                        if (lblAddOrLess.Text.ToUpper() == "LESS")
                            decDr += (Convert.ToDecimal(txtAmount.Text));
                    }
                }
                txtUnclearedAdjust.Text = (decopenbal + decCr - decDr).ToString(strSuffixFormat);
                lblTotBankCredit.Text = decCr.ToString(strSuffixFormat);
                lblTotBankDebit.Text = decDr.ToString(strSuffixFormat);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadControls()
    {
        try
        {
            Procparam = new Dictionary<string, string>();

            Procparam.Add("@LookupType_Code", "71");//Status
            ddlReconStatus.BindDataTable_FA(SPNames.GETLOOKUPVALUES, Procparam, new string[] { "Lookup_Code", "Lookup_Desc" });
            Procparam.Remove("@LookupType_Code");
            //txtDocumentDate.Text = DateTime.Now.ToString(strDateFormat);

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadVoucherNoDetails()
    {
        try
        {
            if (grvAdjustments.FooterRow != null)
            {
                DropDownList ddlFooterAddOrLess = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlFooterAddOrLess");
                DropDownList ddlAdjDoc_Ref = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlAdjDoc_Ref");
                DropDownList ddlDoc_Ref = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlDoc_Ref");

                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", intCompanyID.ToString());
                Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
                Procparam.Add("@Debit_Credit", ddlFooterAddOrLess.SelectedValue);
                if (!string.IsNullOrEmpty(txtEndDate.Text))
                    Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
                if (!string.IsNullOrEmpty(txtStartDate.Text))
                    Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());
                ddlAdjDoc_Ref.BindDataTable_FA("FA_Get_DocNo_BRS", Procparam, new string[] { "Id", "DocNo" });

                DataTable dtrefnos = new DataTable();
                ddlDoc_Ref.FillDataTable(dtrefnos, "DocNo", "DocNo");
                //For doc ref no Payment
                if (ddlFooterAddOrLess.SelectedValue == "1")//debit-payment-Less
                {
                    if (ViewState["PaymentDtls"] != null)
                        dtrefnos = ((DataTable)(ViewState["PaymentDtls"])).Copy();
                }
                else if (ddlFooterAddOrLess.SelectedValue == "2")//credit-ceipt-Add
                {
                    if (ViewState["ReceiptDtls"] != null)
                        dtrefnos = ((DataTable)(ViewState["ReceiptDtls"])).Copy();
                }


                DataRow[] drRefno = dtrefnos.Select("Clearing_Status <> 1");


                ddlDoc_Ref.FillDataTable(drRefno.CopyToDataTable(), "DocNo", "DocNo");

                ddlDoc_Ref.Focus();
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }

    }

    private void FunPriLoadBankDetails()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
            DataTable dtBankList = Utility_FA.GetDefaultData(SPNames.Get_BankDetail_Receipt, Procparam);
            ViewState["vs_BankList"] = dtBankList;
            ddlBankName.BindDataTable_FA(dtBankList, "Bank_Detail_ID", "Bank_Name");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    private void FunPriLoadBankInfo()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
            Procparam.Add("@Bank_ID", ddlBankName.SelectedValue);
            DataTable dtBankList = Utility_FA.GetDefaultData("FA_BRS_Bank_Start_date", Procparam);
            txtStartDate.Text = string.Empty;
            txtStartDate.ReadOnly = false; CEStartDate.Enabled = true;
            //if (dtBankList.Rows.Count > 0)
            //{
            //    if (!string.IsNullOrEmpty(dtBankList.Rows[0]["Startdate"].ToString()))
            //    {
            //        txtStartDate.Text = dtBankList.Rows[0]["Startdate"].ToString();
            //        txtStartDate.ReadOnly = true; CEStartDate.Enabled = false;
            //    }
            //}
            //lnkViewStatement.Enabled = true;            
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected bool FunProValidateMonthLock(string strDate)
    {
        FAAdminServiceReference.FAAdminServicesClient objAdminServices = new FAAdminServiceReference.FAAdminServicesClient();
        bool is_Lock = false;

        try
        {
            string strFinMonth = "";

            DateTime dt;
            dt = Utility_FA.StringToDate(strDate);

            strFinMonth = dt.ToString("yyyy") + dt.ToString("MM");

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", ObjUserInfo_FA.ProCompanyIdRW.ToString());

            Procparam.Add("@Fin_Year", ObjFASession.ProFinYearRW);
            Procparam.Add("@Lock_Month", strFinMonth);
            if (Convert.ToInt32(ddlLocation.SelectedValue) > 0)
            {
                Procparam.Add("@Location_ID", ddlLocation.SelectedValue);
                //Modified By Chandrasekar K On 27-Sep-2012
                //is_Lock = Convert.ToBoolean(objAdminServices.FunGetScalarValue("FA_Validate_Month_Lock", ObjFASession.ProConnectionName, Procparam));
                DataTable dtMonthLock = Utility_FA.GetDefaultData("FA_Validate_Month_Lock", Procparam);
                is_Lock = Convert.ToBoolean(dtMonthLock.Rows[0]["Is_Month_Lock"].ToString());
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (objAdminServices != null)
                objAdminServices.Close();
        }
        return is_Lock;

    }

    private void FunPriSaveDetails()
    {
        objFATranMasterMgt = new FATransactionServiceReference.FATransactionServiceClient();
        try
        {

            objFA_BRSDataTable = new FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable();
            objFA_BRSRow = objFA_BRSDataTable.NewFA_BRSRow();
            objFA_BRSRow.Company_Id = intCompanyID;
            objFA_BRSRow.Created_by = intUserID;
            if (!string.IsNullOrEmpty(strBRS_Id))
                objFA_BRSRow.BRS_Id = Convert.ToInt32(strBRS_Id);
            if (ddlLocation.SelectedValue != "0")
                objFA_BRSRow.Location_Id = Convert.ToInt32(ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtDocumentDate.Text))
                objFA_BRSRow.BRS_Date = Utility_FA.StringToDate(txtDocumentDate.Text);
            objFA_BRSRow.Bank_Id = Convert.ToInt32(ddlBankName.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                objFA_BRSRow.RangeFM = Utility_FA.StringToDate(txtStartDate.Text);
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                objFA_BRSRow.RangeTO = Utility_FA.StringToDate(txtEndDate.Text);

            objFA_BRSRow.Recon_Status = ddlReconStatus.SelectedValue;

            if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
                objFA_BRSRow.Bal_Amt = Convert.ToDecimal(txtOpeningBalance.Text);

            if (!string.IsNullOrEmpty(lblTotBankStamt.Text))
                objFA_BRSRow.TargetAmt = Convert.ToDecimal(lblTotBankStamt.Text);

            #region "Commenetd on 18Apr2016"

            //objFA_BRSRow.XML_BRS_Dtl = FunPriGetReceiptXML();
            //objFA_BRSRow.XML_BRS_Dtl1 = FunPriGetPaymenttXML();
            //objFA_BRSRow.XML_BRS_Others = FunPriGetAdjustXML();

            ////For Automatch
            //objFA_BRSRow.DataColumn1 = "<Root></Root>";

            //if (ViewState["dtStagingtable"] != null)
            //{
            //    DataTable dtStagingtable = (DataTable)ViewState["dtStagingtable"];

            //    if (dtStagingtable.Rows.Count > 0)
            //    {
            //        objFA_BRSRow.DataColumn1 = FunPriGetAutoManXml();
            //    }

            //}

            #endregion

            objFA_BRSRow.Bank_File_Ref = Convert.ToString(ViewState["FIleUploadedID"]);

            objFA_BRSDataTable.AddFA_BRSRow(objFA_BRSRow);

            intErrCode = objFATranMasterMgt.FunPubInsertBRS(out intBRS_Id, out strBRS_No,ObjSerMode, FAClsPubSerialize.Serialize(objFA_BRSDataTable, ObjSerMode), strConnectionName);
            switch (intErrCode)
            {
                case 3501:
                    Utility_FA.FunShowValidationMsg_FA(this.Page, intErrCode, strRedirectPageAdd, strRedirectPageView, strMode, false, strBRS_No, true);
                    break;
                case 3502:
                    Utility_FA.FunShowValidationMsg_FA(this.Page, intErrCode, strRedirectPageAdd, strRedirectPageView, strMode, false, null, false);
                    break;
                default:
                    Utility_FA.FunShowValidationMsg_FA(this, intErrCode);
                    break;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
        finally
        {
            if (objFATranMasterMgt != null)
                objFATranMasterMgt.Close();
        }

    }

    private string FunPriGetReceiptXML()
    {
        StringBuilder strXMLdetails = new StringBuilder();
        strXMLdetails.Append("<Root>");

        foreach (GridViewRow grvRow in grvReceiptDtls.Rows)
        {
            CheckBox chkClearingStatus = (CheckBox)grvRow.FindControl("chkClearingStatus");

            HiddenField hdnTran_Header_Id = (HiddenField)grvRow.FindControl("hdnTran_Header_Id");
            Label lblReceipt_Date = (Label)grvRow.FindControl("lblReceipt_Date");
            Label lblReceipt_No = (Label)grvRow.FindControl("lblReceipt_No");
            Label lblChallan_No = (Label)grvRow.FindControl("lblChallan_No");
            Label lblInstrument_No = (Label)grvRow.FindControl("lblInstrument_No");
            Label lblAmount = (Label)grvRow.FindControl("lblAmount");

            Label lblAut_Man = (Label)grvRow.FindControl("lblAut_Man");
            Label lblInstrumentDate = (Label)grvRow.FindControl("lblInstrumentDate");
            Label lblISFC = (Label)grvRow.FindControl("lblISFC");
            Label lblDraweeBank = (Label)grvRow.FindControl("lblDraweeBank");



            TextBox txtRealizationDate = (TextBox)grvRow.FindControl("txtRealizationDate");
            TextBox txtBank_Charges = (TextBox)grvRow.FindControl("txtBank_Charges");
            TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");

            strXMLdetails.Append(" <Details Doc_Type='R' ");
            strXMLdetails.Append("  TRAN_HEADER_ID='" + hdnTran_Header_Id.Value + "' ");
            if (!string.IsNullOrEmpty(lblReceipt_Date.Text))
                strXMLdetails.Append("  DOCUMENT_DATE='" + Utility_FA.StringToDate(lblReceipt_Date.Text).ToString() + "' ");
            if (!string.IsNullOrEmpty(lblReceipt_No.Text))
                strXMLdetails.Append("  DOC_NO='" + lblReceipt_No.Text + "' ");
            if (!string.IsNullOrEmpty(lblChallan_No.Text))
                strXMLdetails.Append("  CHALLAN_NO='" + lblChallan_No.Text + "' ");
            if (!string.IsNullOrEmpty(lblInstrument_No.Text))
                strXMLdetails.Append("  INSTRUMENT_NO='" + lblInstrument_No.Text + "' ");
            if (!string.IsNullOrEmpty(lblAmount.Text))
                strXMLdetails.Append("  AMOUNT='" + lblAmount.Text + "' ");
            if (!string.IsNullOrEmpty(txtRealizationDate.Text))
                strXMLdetails.Append("  REALIZATIONDATE='" + Utility_FA.StringToDate(txtRealizationDate.Text).ToString() + "' ");
            if (!string.IsNullOrEmpty(txtBank_Charges.Text))
                strXMLdetails.Append("  BANK_CHARGES='" + txtBank_Charges.Text + "' ");
            if (!string.IsNullOrEmpty(txtRemarks.Text))
                strXMLdetails.Append("  REMARKS='" + txtRemarks.Text + "' ");

            if (!string.IsNullOrEmpty(lblAut_Man.Text))
                strXMLdetails.Append("  INSTRUMENTDATE='" + lblInstrumentDate.Text + "' ");
            if (!string.IsNullOrEmpty(lblAut_Man.Text))
                strXMLdetails.Append("  ISFCCODE='" + lblISFC.Text + "' ");
            if (!string.IsNullOrEmpty(lblAut_Man.Text))
                strXMLdetails.Append("  DRAWEEBANK='" + lblDraweeBank.Text + "' ");
            if (!string.IsNullOrEmpty(lblAut_Man.Text))
                strXMLdetails.Append("  AUT_MAN='" + lblAut_Man.Text + "' ");



            if (chkClearingStatus.Checked)
                strXMLdetails.Append("  CLEARING_STATUS='1' ");
            else
                strXMLdetails.Append("  CLEARING_STATUS='0' ");

            strXMLdetails.Append(" /> ");


        }

        strXMLdetails.Append("</Root>");


        return strXMLdetails.ToString();
    }

    private string FunPriGetPaymenttXML()
    {
        StringBuilder strXMLdetails = new StringBuilder();
        strXMLdetails.Append("<Root>");

        foreach (GridViewRow grvRow in grvPaymentDtls.Rows)
        {
            CheckBox chkClearingStatus = (CheckBox)grvRow.FindControl("chkClearingStatus");

            HiddenField hdnTran_Header_Id = (HiddenField)grvRow.FindControl("hdnTran_Header_Id");
            Label lblPayment_Date = (Label)grvRow.FindControl("lblPayment_Date");
            Label lblPayment_No = (Label)grvRow.FindControl("lblPayment_No");
            Label lblAmount = (Label)grvRow.FindControl("lblAmount");

            Label lblAut_Man = (Label)grvRow.FindControl("lblAut_Man");
            Label lblInstrument_No = (Label)grvRow.FindControl("lblInstrument_No");
            Label lblInstrumentDate = (Label)grvRow.FindControl("lblInstrumentDate");
            Label lblISFC = (Label)grvRow.FindControl("lblISFC");

            TextBox txtRealizationDate = (TextBox)grvRow.FindControl("txtRealizationDate");
            TextBox txtBank_Charges = (TextBox)grvRow.FindControl("txtBank_Charges");
            TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");

            strXMLdetails.Append(" <Details Doc_Type='P' ");
            strXMLdetails.Append("  TRAN_HEADER_ID='" + hdnTran_Header_Id.Value + "' ");
            if (!string.IsNullOrEmpty(lblPayment_Date.Text))
                strXMLdetails.Append("  DOCUMENT_DATE='" + Utility_FA.StringToDate(lblPayment_Date.Text).ToString() + "' ");
            if (!string.IsNullOrEmpty(lblPayment_No.Text))
                strXMLdetails.Append("  DOC_NO='" + lblPayment_No.Text + "' ");
            if (!string.IsNullOrEmpty(lblAmount.Text))
                strXMLdetails.Append("  AMOUNT='" + lblAmount.Text + "' ");
            if (!string.IsNullOrEmpty(txtRealizationDate.Text))
                strXMLdetails.Append("  REALIZATIONDATE='" + Utility_FA.StringToDate(txtRealizationDate.Text).ToString() + "' ");
            if (!string.IsNullOrEmpty(txtBank_Charges.Text))
                strXMLdetails.Append("  BANK_CHARGES='" + txtBank_Charges.Text + "' ");
            if (!string.IsNullOrEmpty(txtRemarks.Text))
                strXMLdetails.Append("  REMARKS='" + txtRemarks.Text + "' ");


            if (!string.IsNullOrEmpty(lblInstrumentDate.Text))
                strXMLdetails.Append("  INSTRUMENTDATE='" + lblInstrumentDate.Text + "' ");
            if (!string.IsNullOrEmpty(lblISFC.Text))
                strXMLdetails.Append("  ISFCCODE='" + lblISFC.Text + "' ");
            if (!string.IsNullOrEmpty(lblInstrument_No.Text))
                strXMLdetails.Append("  INSTRUMENTNO='" + lblInstrument_No.Text + "' ");
            if (!string.IsNullOrEmpty(lblAut_Man.Text))
                strXMLdetails.Append("  AUT_MAN='" + lblAut_Man.Text + "' ");


            if (chkClearingStatus.Checked)
                strXMLdetails.Append("  CLEARING_STATUS='1' ");
            else
                strXMLdetails.Append("  CLEARING_STATUS='0' ");
            strXMLdetails.Append(" /> ");


        }

        strXMLdetails.Append("</Root>");


        return strXMLdetails.ToString();
    }

    private string FunPriGetAdjustXML()
    {
        StringBuilder strXMLdetails = new StringBuilder();
        strXMLdetails.Append("<Root>");

        foreach (GridViewRow grvRow in grvAdjustments.Rows)
        {
            CheckBox chkNegate = (CheckBox)grvRow.FindControl("chkNegate");

            Label lblAddOrLess = (Label)grvRow.FindControl("lblAddOrLess");
            Label lblDoc_Ref = (Label)grvRow.FindControl("lblDoc_Ref");
            Label lblAdj_Date = (Label)grvRow.FindControl("lblAdj_Date");
            Label lblDescription = (Label)grvRow.FindControl("lblDescription");
            //TextBox txtAdjDoc_Ref = (TextBox)grvRow.FindControl("txtAdjDoc_Ref");
            Label lblAdjDoc_Ref = (Label)grvRow.FindControl("lblAdjDoc_Ref");
            Label lblAmount = (Label)grvRow.FindControl("lblAmount");
            Label lblAutoManual = (Label)grvRow.FindControl("lblAutoManual");


            DropDownList ddlAdjDoc_RefI = (DropDownList)grvRow.FindControl("ddlAdjDoc_RefI");
            TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");

            strXMLdetails.Append(" <Details ADDORLESS='" + (lblAddOrLess.Text) + "' ");
            strXMLdetails.Append("  DOC_REF='" + lblDoc_Ref.Text + "' ");
            if (!string.IsNullOrEmpty(lblAdj_Date.Text))
                strXMLdetails.Append("  ADJ_DATE='" + Utility_FA.StringToDate(lblAdj_Date.Text).ToString() + "' ");
            if (!string.IsNullOrEmpty(lblAutoManual.Text))
                strXMLdetails.Append("  AUTOMANUAL='" + lblAutoManual.Text + "' ");
            if (!string.IsNullOrEmpty(lblDescription.Text))
                strXMLdetails.Append("  DESCRIPTION='" + lblDescription.Text + "' ");
            if (!string.IsNullOrEmpty(lblAmount.Text))
                strXMLdetails.Append("  AMOUNT='" + lblAmount.Text + "' ");

            //if (!string.IsNullOrEmpty(txtAdjDoc_Ref.Text))
            //    strXMLdetails.Append("  ADJDOC_REF='" + txtAdjDoc_Ref.Text + "' "); 
            if (!string.IsNullOrEmpty(lblAdjDoc_Ref.Text))
                strXMLdetails.Append("  ADJDOC_REF='" + lblAdjDoc_Ref.Text + "' ");
            if (!string.IsNullOrEmpty(txtRemarks.Text))
                strXMLdetails.Append("  REMARKS='" + txtRemarks.Text + "' ");
            if (chkNegate.Checked)
                strXMLdetails.Append("  NEGATE='1' ");
            else
                strXMLdetails.Append("  NEGATE='0' ");
            strXMLdetails.Append(" /> ");


        }
        foreach (GridViewRow grvRow in grvPrevAdjustments.Rows)
        {
            CheckBox chkNegate = (CheckBox)grvRow.FindControl("chkNegate");

            Label lblAddOrLess = (Label)grvRow.FindControl("lblAddOrLess");
            Label lblDoc_Ref = (Label)grvRow.FindControl("lblDoc_Ref");
            Label lblAdj_Date = (Label)grvRow.FindControl("lblAdj_Date");
            Label lblDescription = (Label)grvRow.FindControl("lblDescription");
            //TextBox txtAdjDoc_Ref = (TextBox)grvRow.FindControl("txtAdjDoc_Ref");
            Label lblAdjDoc_Ref = (Label)grvRow.FindControl("lblAdjDoc_Ref");
            Label lblAmount = (Label)grvRow.FindControl("lblAmount");



            //DropDownList ddlAdjDoc_RefI = (DropDownList)grvRow.FindControl("ddlAdjDoc_RefI");
            TextBox txtRemarks = (TextBox)grvRow.FindControl("txtRemarks");

            strXMLdetails.Append(" <Details ADDORLESS='" + (lblAddOrLess.Text) + "' ");
            strXMLdetails.Append("  DOC_REF='" + lblDoc_Ref.Text + "' ");
            if (!string.IsNullOrEmpty(lblAdj_Date.Text))
                strXMLdetails.Append("  ADJ_DATE='" + Utility_FA.StringToDate(lblAdj_Date.Text).ToString() + "' ");
            strXMLdetails.Append("  AUTOMANUAL='P' ");
            if (!string.IsNullOrEmpty(lblDescription.Text))
                strXMLdetails.Append("  DESCRIPTION='" + lblDescription.Text + "' ");
            if (!string.IsNullOrEmpty(lblAmount.Text))
                strXMLdetails.Append("  AMOUNT='" + lblAmount.Text + "' ");

            //if (!string.IsNullOrEmpty(txtAdjDoc_Ref.Text))
            //    strXMLdetails.Append("  ADJDOC_REF='" + txtAdjDoc_Ref.Text + "' ");
            if (!string.IsNullOrEmpty(lblAdjDoc_Ref.Text))
                strXMLdetails.Append("  ADJDOC_REF='" + lblAdjDoc_Ref.Text + "' ");

            if (!string.IsNullOrEmpty(txtRemarks.Text))
                strXMLdetails.Append("  REMARKS='" + txtRemarks.Text + "' ");
            if (chkNegate.Checked)
                strXMLdetails.Append("  NEGATE='1' ");
            else
                strXMLdetails.Append("  NEGATE='0' ");
            strXMLdetails.Append(" /> ");


        }
        strXMLdetails.Append("</Root>");


        return strXMLdetails.ToString();
    }

    private string FunPriGetAutoManXml()
    {
        DataTable dtStagingtable = new DataTable();
        if (ViewState["dtStagingtable"] != null)
        {
            dtStagingtable = (DataTable)ViewState["dtStagingtable"];
        }
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");
        foreach (DataRow grvRow in dtStagingtable.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            foreach (DataColumn dtCols in dtStagingtable.Columns)
            {
                strColValue = grvRow.ItemArray[intcolcount].ToString();
                strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                strColValue = strColValue.Replace("'", "\"");
                if (!string.IsNullOrEmpty(strColValue))
                {
                    if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                    {
                        strbXml.Append(dtCols.ColumnName.ToUpper().Replace(" ", "") + "='" + strColValue.ToString() + "' ");
                    }
                }
                intcolcount++;
            }
            strColValue = "";
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    private void FunPriGetRcptDtls()
    {
        try
        {
            lblRcptPageErrorMsg.InnerText = "";
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjRcptPaging.ProCompany_ID = intCompanyID;
            ObjRcptPaging.ProUser_ID = intUserID;
            ObjRcptPaging.ProTotalRecords = intTotalRecords;
            ObjRcptPaging.ProCurrentPage = ProRcptPageNumRW;
            ObjRcptPaging.ProPageSize = ProRcptPageSizeRW;
            ObjRcptPaging.ProSearchValue = "";
            ObjRcptPaging.ProOrderBy = "";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "1");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            if ((grvReceiptDtls == null || grvReceiptDtls.Rows.Count == 0) && Convert.ToString(strMode) == "C")
            {
                Procparam.Add("@Is_New", "1");
            }

            if (Convert.ToInt32(ddlRcptSearch.SelectedValue) > 0 && Convert.ToString(txtRcptSearchText.Text).Trim() != "")
            {
                Procparam.Add("@Search_Type", Convert.ToString(ddlRcptSearch.SelectedValue));
                switch (Convert.ToInt32(ddlRcptSearch.SelectedValue))
                {
                    case 2:
                        Procparam.Add("@Search_Text", Convert.ToString(Utility_FA.StringToDate(txtRcptSearchText.Text.Trim())));
                        break;
                    default:
                        Procparam.Add("@Search_Text", Convert.ToString(txtRcptSearchText.Text).Trim());
                        break;
                }
            }

            if (Convert.ToInt32(ddlRcptSortType.SelectedValue) > 0)
            {
                Procparam.Add("@Sort_Type", Convert.ToString(ddlRcptSortType.SelectedValue));
            }

            grvReceiptDtls.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjRcptPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvReceiptDtls.Rows[0].Visible = false;
            }

            ucReceiptPaging.Navigation(intTotalRecords, ProRcptPageNumRW, ProRcptPageSizeRW);
            ucReceiptPaging.setPageSize(ProRcptPageSizeRW);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetPmtDtls()
    {
        try
        {
            lblpmtPageErrorMsg.InnerText = "";
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjPmtPaging.ProCompany_ID = intCompanyID;
            ObjPmtPaging.ProUser_ID = intUserID;
            ObjPmtPaging.ProTotalRecords = intTotalRecords;
            ObjPmtPaging.ProCurrentPage = ProPmtPageNumRW;
            ObjPmtPaging.ProPageSize = ProPmtPageSizeRW;
            ObjPmtPaging.ProSearchValue = "";
            ObjPmtPaging.ProOrderBy = "";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "2");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            if ((grvPaymentDtls == null || grvPaymentDtls.Rows.Count == 0) && Convert.ToString(strMode) == "C")
            {
                Procparam.Add("@Is_New", "1");
            }

            if (Convert.ToInt32(ddlPaymentSearch.SelectedValue) > 0 && Convert.ToString(txtPmtSrchTxt.Text).Trim() != "")
            {
                Procparam.Add("@Search_Type", Convert.ToString(ddlPaymentSearch.SelectedValue));
                switch (Convert.ToInt32(ddlPaymentSearch.SelectedValue))
                {
                    case 2:
                        Procparam.Add("@Search_Text", Convert.ToString(Utility_FA.StringToDate(txtPmtSrchTxt.Text.Trim())));
                        break;
                    default:
                        Procparam.Add("@Search_Text", Convert.ToString(txtPmtSrchTxt.Text).Trim());
                        break;
                }
            }

            if (Convert.ToInt32(ddlPmtSortType.SelectedValue) > 0)
            {
                Procparam.Add("@Sort_Type", Convert.ToString(ddlPmtSortType.SelectedValue));
            }

            grvPaymentDtls.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjPmtPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvPaymentDtls.Rows[0].Visible = false;
            }

            ucPaymentPaging.Navigation(intTotalRecords, ProPmtPageNumRW, ProPmtPageSizeRW);
            ucPaymentPaging.setPageSize(ProPmtPageSizeRW);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriGetManualAdjustmentDtls()
    {
        try
        {
            lblAdjstPageError.InnerText = "";
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjAdjstPaging.ProCompany_ID = intCompanyID;
            ObjAdjstPaging.ProUser_ID = intUserID;
            ObjAdjstPaging.ProTotalRecords = intTotalRecords;
            ObjAdjstPaging.ProCurrentPage = ProAdjstPageNumRW;
            ObjAdjstPaging.ProPageSize = ProAdjstPageSizeRW;
            ObjAdjstPaging.ProSearchValue = strSearchValue;
            ObjAdjstPaging.ProOrderBy = "";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "4");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            if ((grvAdjustments == null || grvAdjustments.Rows.Count == 0) && Convert.ToString(strMode) == "C")
            {
                Procparam.Add("@Is_New", "1");
            }

            if (ViewState["FIleUploadedID"] != null && Convert.ToString(ViewState["FIleUploadedID"]) != "")
            {
                Procparam.Add("@Bank_Statement_UpldID", Convert.ToString(ViewState["FIleUploadedID"]));
            }

            //if (Convert.ToString(strSearchValue) != "")
            //{
            //    Procparam.Add("@Search_Text", Convert.ToString(strSearchValue));
            //}

            grvAdjustments.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjAdjstPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvAdjustments.Rows[0].Visible = false;
            }

            ucAdjstPaging.Navigation(intTotalRecords, ProAdjstPageNumRW, ProAdjstPageSizeRW);
            ucAdjstPaging.setPageSize(ProAdjstPageSizeRW);

            if (strMode == "Q")
            {
                grvAdjustments.FooterRow.Visible = grvAdjustments.Columns[grvAdjustments.Columns.Count - 1].Visible = false;
            }

            FunPriCalcAdjustmentAmt();
            btnProbableMatch.Enabled = true;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriCalcUnclearedAmt()
    {
        try
        {
            FunPriDefaultParam();
            Procparam.Add("@Option", "3");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            DataSet dsAmt = Utility_FA.GetDataset(strProcName, Procparam);
            txtUnclearedReceipts.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Uncleared_Receipt_Amount"]);
            lblClearedReceiptAmt.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Cleared_Receipts_Amount"]);
            lblClearedPmtAmount.Text = Convert.ToString(dsAmt.Tables[1].Rows[0]["Cleared_Payment_Amount"]);
            txtUnclearedPayments.Text = Convert.ToString(dsAmt.Tables[1].Rows[0]["Uncleared_Payment_Amount"]);
            lblMatchedRcptCnt.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Matched_Cnt"]);
            lblUnMatchedRcptCnt.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["UnMatched_Cnt"]);
            lblMatchedPmtCnt.Text = Convert.ToString(dsAmt.Tables[1].Rows[0]["Matched_Cnt"]);
            lblUnMatchedPmtCnt.Text = Convert.ToString(dsAmt.Tables[1].Rows[0]["UnMatched_Cnt"]);

        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunpriGetUpldStatement()
    {
        try
        {
            FunPriDefaultParam();
            Procparam.Add("@Option", "5");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            DataSet dsAmt = Utility_FA.GetDataset(strProcName, Procparam);
            txtOpeningBalance.Text = "0";
            lblCrDr.Text = "Cr";
            if (dsAmt.Tables[0].Rows.Count > 0)
            {
                txtOpeningBalance.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Opening_Bal"]);
                if (!string.IsNullOrEmpty(txtOpeningBalance.Text))
                {
                    lblCrDr.Text = (Convert.ToDecimal(txtOpeningBalance.Text) < 0) ? "Dr" : "Cr";
                }
            }

            gvUploadDtl.DataSource = dsAmt.Tables[1];
            gvUploadDtl.DataBind();
            btnAutoMatchNew.Enabled = (Convert.ToInt32(dsAmt.Tables[1].Rows.Count) > 0) ? true : false;
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriInsertManualAdjs()
    {
        try
        {
            if (grvAdjustments.FooterRow != null)
            {
                DropDownList ddlFtrAddLess = (DropDownList)grvAdjustments.FooterRow.FindControl("ddlFooterAddOrLess");
                TextBox txtFtrGroupDocRefNo = (TextBox)grvAdjustments.FooterRow.FindControl("txtgvadjFtrGroupDocRefNo");
                TextBox txtDocRef = (TextBox)grvAdjustments.FooterRow.FindControl("txtftrgvadjDocumentNo");
                TextBox txtFtrAdjDate = (TextBox)grvAdjustments.FooterRow.FindControl("txtAdj_Date");
                TextBox txtFtrDescription = (TextBox)grvAdjustments.FooterRow.FindControl("txtDescription");
                TextBox txtFtrAmount = (TextBox)grvAdjustments.FooterRow.FindControl("txtAmount");
                TextBox txtFtrAdjDocRef = (TextBox)grvAdjustments.FooterRow.FindControl("txtftrgvAdjstDocRefNo");
                TextBox txtFtrRemarks = (TextBox)grvAdjustments.FooterRow.FindControl("txtAdjstFtrRemarks");
                CheckBox ChkFtrNegate = (CheckBox)grvAdjustments.FooterRow.FindControl("chkNegateF");

                if (Convert.ToString(txtFtrGroupDocRefNo.Text).Trim() != "" && Convert.ToString(txtDocRef.Text).Trim() != "")
                {
                    Utility_FA.FunShowAlertMsg_FA(this, "Both Group Doc Ref and Doc Ref Should not be Entered");
                    return;
                }

                //if (Convert.ToString(txtFtrGroupDocRefNo.Text).Trim() == "" && Convert.ToString(txtDocRef.Text).Trim() == "")
                //{
                //    Utility_FA.FunShowAlertMsg_FA(this, "Either Group Doc Ref or Doc Ref Should be Enter");
                //}

                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Option", "1");
                Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
                Procparam.Add("@Bank_Id", Convert.ToString(ddlBankName.SelectedValue));
                Procparam.Add("@Location_Id", Convert.ToString(ddlLocation.SelectedValue));
                Procparam.Add("@User_ID", Convert.ToString(intUserID));
                Procparam.Add("@Add_Less_Type", Convert.ToString(ddlFtrAddLess.SelectedValue));
                Procparam.Add("@Group_Doc_Ref", Convert.ToString(txtFtrGroupDocRefNo.Text));
                Procparam.Add("@Document_Ref_No", Convert.ToString(txtDocRef.Text));
                Procparam.Add("@Adjustment_Date", Convert.ToString(Utility_FA.StringToDate(txtFtrAdjDate.Text)));
                Procparam.Add("@Description", Convert.ToString(txtFtrDescription.Text));
                Procparam.Add("@Amount", Convert.ToString(txtFtrAmount.Text));
                Procparam.Add("@Is_Negate", Convert.ToString((ChkFtrNegate.Checked == true) ? "1" : "0"));
                Procparam.Add("@Adjustment_Doc_No", Convert.ToString(txtFtrAdjDocRef.Text));
                Procparam.Add("@Remarks", Convert.ToString(txtFtrRemarks.Text));

                DataTable dtAdjstDtl = Utility_FA.GetDefaultData("FA_BRS_InsertTmpAdjDtl", Procparam);

                if (Convert.ToInt32(dtAdjstDtl.Rows[0]["Error_Code"]) == 1)
                {
                    Utility_FA.FunShowAlertMsg_FA(this, Convert.ToString(dtAdjstDtl.Rows[0]["Error_Msg"]));
                    return;
                }

                FunPriGetManualAdjustmentDtls();

            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriCalcAdjustmentAmt()
    {
        try
        {
            FunPriDefaultParam();
            Procparam.Add("@Option", "6");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Opening_Balance", Convert.ToString(txtOpeningBalance.Text));

            DataSet dsAmt = Utility_FA.GetDataset(strProcName, Procparam);
            txtUnclearedAdjust.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Opening_Balance"]);
            lblTotBankCredit.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Credit_Amount"]);
            lblTotBankDebit.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["Debit_Amount"]);
            //lblAMCreditCount.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["MRCPTCNT"]);
            //lblAMDebitCount.Text = Convert.ToString(dsAmt.Tables[0].Rows[0]["MPMTCNT"]);

            if (Convert.ToString(txtUnclearedAdjust.Text) != "" && Convert.ToString(lblTotBankStamt.Text) != "")
            {
                lblBRSDiffAmount.Text = (Convert.ToDecimal(txtUnclearedAdjust.Text) - Convert.ToDecimal(lblTotBankStamt.Text)).ToString(strSuffixFormat);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private bool FunPriCheckReconDtl()
    {
        bool blnRslt = true;
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "16");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));

            DataTable dtRcn = Utility_FA.GetDefaultData(strProcName, Procparam);
            if (Convert.ToInt32(dtRcn.Rows[0]["Error_Code"]) == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Group Entry amounts are mismatched");
                blnRslt = false;
            }
        }
        catch (Exception objException)
        {
            blnRslt = false;
            throw objException;
        }
        return blnRslt;
    }

    private void FunPriGetPblMatchDtls()
    {
        try
        {
            if (Convert.ToString(hdnPblMatchChange.Value) == "1")
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Certain Values are changed. kindly click update before proceed.");
                return;
            }

            hdnPblMatchChange.Value = "0";
            lblPblPageError.InnerText = "";
            //Paging Properties set
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjpblMtchPaging.ProCompany_ID = intCompanyID;
            ObjpblMtchPaging.ProUser_ID = intUserID;
            ObjpblMtchPaging.ProTotalRecords = intTotalRecords;
            ObjpblMtchPaging.ProCurrentPage = ProPblMtchPageNumRW;
            ObjpblMtchPaging.ProPageSize = ProPblMtchPageSizeRW;
            ObjpblMtchPaging.ProSearchValue = "";
            ObjpblMtchPaging.ProOrderBy = "";
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "9");
            Procparam.Add("@BRS_ID", Convert.ToString(intBRS_Id));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
            if (!string.IsNullOrEmpty(txtStartDate.Text))
                Procparam.Add("@Start_date", Utility_FA.StringToDate(txtStartDate.Text).ToString());
            if (!string.IsNullOrEmpty(txtEndDate.Text))
                Procparam.Add("@End_date", Utility_FA.StringToDate(txtEndDate.Text).ToString());

            gvpblMatchDtl.BindGridView_FA(strProcName, Procparam, out intTotalRecords, ObjpblMtchPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                gvpblMatchDtl.Rows[0].Visible = btnpblMatchFixed.Enabled = btnPblMtchExport.Enabled =
                    btnpblMtchUpdate.Enabled = btnPblMtchReDup.Enabled = false;
            }
            else
            {
                btnpblMatchFixed.Enabled = btnPblMtchExport.Enabled = btnpblMtchUpdate.Enabled = btnPblMtchReDup.Enabled = true;
            }

            ucPblMatchPaging.Navigation(intTotalRecords, ProPblMtchPageNumRW, ProPblMtchPageSizeRW);
            ucPblMatchPaging.setPageSize(ProPblMtchPageSizeRW);

            FunPriDefaultParam();
            Procparam.Add("@Option", "13");
            Procparam.Add("@CurrentPage", Convert.ToString(ProPblMtchPageNumRW));
            Procparam.Add("@PageSize", Convert.ToString(ProPblMtchPageSizeRW));

            DataTable dtPblMatch = Utility_FA.GetDefaultData(strProcName, Procparam);
            CheckBox chkbxHdrSelectAll = (CheckBox)gvpblMatchDtl.HeaderRow.FindControl("chkbxHdrSelectAll");
            chkbxHdrSelectAll.Checked = (Convert.ToInt32(dtPblMatch.Rows[0]["Is_SelectedAll"]) == 1) ? true : false;
            lblpblMtchAddAmt.Text = Convert.ToString(dtPblMatch.Rows[0]["Total_Add"]);
            lblpblMtchLessAmt.Text = Convert.ToString(dtPblMatch.Rows[0]["Total_Less"]);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriLoadLov()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Usr_ID", Convert.ToString(intUserID));
            Procparam.Add("@Option", "6");
            DataSet dsLOV = Utility_FA.GetDataset("FA_CMN_BRSLst", Procparam);

            if (dsLOV != null)
            {
                ddlRcptSearch.FillDLL(dsLOV.Tables[0], true);
                ddlPaymentSearch.FillDLL(dsLOV.Tables[1], true);
                if (gvPblMatchType != null)
                {
                    gvPblMatchType.DataSource = dsLOV.Tables[2];
                    gvPblMatchType.DataBind();
                }
                ddlRcptSortType.FillDLL(dsLOV.Tables[3], true);
                ddlPmtSortType.FillDLL(dsLOV.Tables[4], true);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriDefaultParam()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_Id", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Bank_Id", ddlBankName.SelectedValue);
            Procparam.Add("@Location_Id", ddlLocation.SelectedValue);
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    private void FunPriSetHeaderSearch()
    {
        try
        {
            if (grvAdjustments != null && grvAdjustments.Rows.Count > 0)
            {
                for (Int32 i = 0; i < arrSortCol.Length; i++)
                {
                    if (Convert.ToString(arraySearch[i]) != "")
                    {
                        TextBox txtHeaderSearch = (TextBox)grvAdjustments.HeaderRow.FindControl("txtHeaderSearch" + (i + 1).ToString());
                        txtHeaderSearch.Text = Convert.ToString(arraySearch[i]);
                    }
                }
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {
        try
        {
            strSearchValue = "";
            arraySearch = new string[arrSortCol.Length];
            if (grvAdjustments != null && grvAdjustments.Rows.Count > 0)
            {
                for (Int32 i = 0; i < arrSortCol.Length; i++)
                {
                    TextBox txtHeaderSearch = (TextBox)grvAdjustments.HeaderRow.FindControl("txtHeaderSearch" + (i + 1).ToString());
                    if (Convert.ToString(txtHeaderSearch.Text).Trim() != "")
                    {
                        arraySearch[i] = Convert.ToString(txtHeaderSearch.Text);
                        if (i == 3)
                        {
                            try
                            {
                                strSearchValue = strSearchValue + "and " + Convert.ToString(arrSortCol[i])
                                               + " = '" + Convert.ToString(Utility_FA.StringToDate(txtHeaderSearch.Text)).Trim() + "'";
                            }
                            catch (Exception objException)
                            {
                                Utility_FA.FunShowAlertMsg_FA(this, "Invalid Date Format");
                                return;
                            }
                        }
                        else
                        {
                            strSearchValue = strSearchValue + "and " + Convert.ToString(arrSortCol[i])
                                        + " like '%" + Convert.ToString(txtHeaderSearch.Text).Trim() + "%'";
                        }
                    }
                }
            }

            FunPriGetManualAdjustmentDtls();
            FunPriSetHeaderSearch();
        }
        catch (Exception objException)
        {
            throw objException;
        }
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

    protected void grvStagingtbl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[e.Row.RowIndex].Equals("Recon_Status"))
            {
                e.Row.Cells[e.Row.RowIndex].Text = Convert.ToBoolean(e.Row.Cells[e.Row.RowIndex].Text).ToString();
            }
        }
    }

    protected void lnkViewStatement_Click(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ddlLocation.SelectedValue) == 0 || Convert.ToString(ddlLocation.SelectedText) == "")
            {
                CVBRS.ErrorMessage = "Select the Location";
                CVBRS.IsValid = false;
                return;
            }

            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Option", "5");
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@Usr_ID", Convert.ToString(intUserID));
            dictParam.Add("@Location_ID", Convert.ToString(ddlLocation.SelectedValue));
            dictParam.Add("@Bank_ID", Convert.ToString(ddlBankName.SelectedValue));

            DataTable dtRecon = Utility_FA.GetDefaultData("FA_CMN_BRSLst", dictParam);
            if (dtRecon != null && dtRecon.Rows.Count > 0)
            {
                GridView Grv = new GridView();

                Grv.DataSource = dtRecon;
                Grv.DataBind();
                Grv.HeaderRow.Attributes.Add("Style", "background-color: #ebf0f7; font-family: calibri; font-size: 13px; font-weight: bold;");
                Grv.ForeColor = System.Drawing.Color.DarkBlue;

                if (Grv.Rows.Count > 0)
                {
                    string attachment = "attachment; filename = Bank Statement.xls";
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
        }
        catch (Exception objException)
        {

        }
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }


}
