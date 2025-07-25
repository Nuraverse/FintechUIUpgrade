using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using S3GDALayer.Collection.ClnReceivableMgtServices;
using S3GDALayer.LoanAdmin.ContractMgtServices;
using S3GDALayer.LoanAdmin.LoanAdminAccMgtServices;
using System.Text;
using System.Configuration;
using System.IO;
using System.Xml;
using System.Timers;
using S3GBusEntity;
using iTextSharp.text;
using System.Net;
using S3GDALayer.S3GAdminServices;
using System.IO.Compression;
using S3GDALayer.LoanAdmin;

namespace SISLS3GCommonWS
{
    public partial class MFC_S3G_Service : ServiceBase
    {
        int intErrCode = 0;
        string strErrMsg = string.Empty;
        int intODIId = 0;
        string strBranchId, strType = string.Empty;
        DateTime ODIDate = DateTime.Today;
        int intCompanyID, intLOBID, intBranchID, intFrequencyID, intUserID, intAction;
        int intIncome_Recognition_ID = 0;
        string strCutoffDate = string.Empty;
        string strProcName = "S3G_LOANAD_InsertIncomeRecognition";
        string strFTBTemplate = string.Empty;
        string strDocPath = string.Empty;
        string StrFileName = string.Empty;

        public static string strMasterPath = "";
        public static string strTranPath = "";
        public static string strProcessPath = "";
        public static string strReportmonth = string.Empty;
        public static string strDateFormate = string.Empty;
        public static string StrLocation_Name = string.Empty;
        int intTotalRows = 42;
        const Int32 ConPageRow = 5;

        int intSMS_ID = 0;
        string strTemplate = string.Empty;
        string strMobileNumber = string.Empty;
        int intSMS_Status = 0;
        string strErrorMsg = string.Empty;

        int Icount = 0;
        int IEqualCount = 0;

        Timer tmtStart = new Timer();
        ClsPubAssignDc objAssignDc = new ClsPubAssignDc();
        ClsPubBulkRevision ObjBulkRev;
        S3GDALayer.S3GAdminServices.ClsPubS3GAdmin ObjDAL = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
        ClsPubManualJournal GetDal = new ClsPubManualJournal();
        DataTable SPOOL_DATA = null;
        DataTable SPOOL_DATAONE = null;
        DataTable SPOOL_DATATWO = null;
        Treasury_Bucket objDealMaster = new Treasury_Bucket(string.Empty);
        public MFC_S3G_Service()
        {
            InitializeComponent();
            //methodName();
            FunCallAssignDCService();
            //FunCallSendSMS();
            //FunPriRunReportScheduler();
            //FunProcessTerriostProcess();
            //FileCopyTerriostDataCHK();
        }

        //Call Calculate method on Operating Depriciation.
        protected override void OnStart(string[] args)
        {
            //EventLog.WriteEntry("Operating Lease Depresiation Log");
            tmtStart.Interval = 60000; //60000;
            tmtStart.Enabled = true;
            tmtStart.Elapsed += new ElapsedEventHandler(tmtStart_Elapsed);
            tmtStart.Start();
        }
        void tmtStart_Elapsed(object sender, ElapsedEventArgs e)
        {

            if (funCheckTimer())
            {
                FunPriRunReportScheduler();
                FunProcessTerriostProcess();//Created Date : 11-12-2019, Description : Terriost Data Uplaod Process done.
                FunPriDunninLetterforCheqReturn();//Added by Sathish
                FunCalculateDePreciation();
                methodName();
                FunCallAssignDCService();
                //FunCallBulk();
                TimerMethodIncome();
                //FunIncomeRecognitionSave();
                //   SchedulemethodName();
                //FunOverDueSave(intCompanyID, intUserID, intLOBID, strBranchId, ODIDate, strType, intODIId);
                FunCallOdiTimer();
                CibilmethodName();
                FunCallSendSMS();


            }
        }

        protected bool funCheckTimer()
        {
            string[] strTimerGap = ConfigurationSettings.AppSettings.Get("TimerGap").Trim().Split(',');
            int intGraceTime = Convert.ToInt32(ConfigurationSettings.AppSettings.Get("GraceTime"));

            if (strTimerGap.Length == 1 && string.IsNullOrEmpty(strTimerGap[0]))  // Means undefined schedule. It will run every tick.
            {
                return true;
            }
            for (int i = 0; i <= strTimerGap.Length - 1; i++)  // Will run in given timing
            {
                DateTime dtStart = Convert.ToDateTime(DateTime.Today.ToShortDateString() + " " + strTimerGap[i].ToString());
                DateTime dtEnd = Convert.ToDateTime(DateTime.Today.ToShortDateString() + " " + strTimerGap[i].ToString()).AddMinutes(intGraceTime);
                if (DateTime.Now >= dtStart && DateTime.Now <= dtEnd)
                {
                    return true;
                }
            }
            return false;
        }

        private void FunCallServiceMethod(out DataSet dsDepreciation)
        {
            dsDepreciation = new DataSet();
            Dictionary<string, string> objProcedureParameter = new Dictionary<string, string>();
            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3gAdminClient = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
            try
            {
                objProcedureParameter.Add("@Service_Name", "OLD");
                dsDepreciation = objS3gAdminClient.FunPubFillDataset("S3G_LOANAD_GETSERIVCE", objProcedureParameter);
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "OPERATING LEASE DEPRECIATION", "WINSERVICE");
            }

            finally
            {
                objS3gAdminClient = null;
            }
        }
        public void FunCalculateDePreciation()
        {
            DataSet dsDepreciation;
            try
            {
                FunCallServiceMethod(out dsDepreciation);
                if (dsDepreciation != null)
                {
                    if (dsDepreciation.Tables[0].Rows.Count > 0)
                    {
                        for (int DepreIndex = 0; DepreIndex <= dsDepreciation.Tables[0].Rows.Count - 1; DepreIndex++)
                        {
                            Dictionary<string, string> objProcParam = new Dictionary<string, string>();
                            objProcParam.Add("@Company_ID", dsDepreciation.Tables[0].Rows[DepreIndex]["Company_ID"].ToString());
                            objProcParam.Add("@Depreciation_ID", dsDepreciation.Tables[0].Rows[DepreIndex]["DEPRECIATION_ID"].ToString());
                            DataSet dsDep = new DataSet();
                            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3gAdminClient = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
                            try
                            {
                                dsDep = objS3gAdminClient.FunPubFillDataset("S3G_LOANAD_GetDepreciationDetail", objProcParam);
                            }
                            catch (Exception ex)
                            {
                                ClsPubCommErrorLog.CustomErrorRoutine(ex, "OPERATING LEASE DEPRECIATION", "WINSERVICE");
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "OPERATING LEASE DEPRECIATION", "WINSERVICE");
            }

        }
        protected int funChkPendingJobs()
        {
            DataSet dsSCHJOBs;
            int intVal;
            Dictionary<string, string> ObjDictionary = new Dictionary<string, string>();
            ObjDictionary.Add("@Company_ID", Convert.ToString(intCompanyID));
            dsSCHJOBs = GetDal.FunPubChkPendingJobs(ObjDictionary);
            intVal = Convert.ToInt32(dsSCHJOBs.Tables[0].Rows[0][0].ToString());
            return intVal;
            //return GetDal.FunPubChkPendingJobs(ObjDictionary);
        }
        private void FunPriRunReportScheduler()
        {
            if (funChkPendingJobs() > 0)
            {
                DataSet dsSCHDet;
                Dictionary<string, string> objProcedureParameter = new Dictionary<string, string>();
                ClsPubManualJournal GetDal = new ClsPubManualJournal();
                S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable ObjMJVClientDataTable;
                string StrScheduleId = string.Empty;
                string StrLobId = string.Empty;
                string StrReportMonth = string.Empty;
                string StrReportFormate = string.Empty;
                string StrScheduleat = string.Empty;
                string StrReportId = string.Empty;
                string StrUserId = string.Empty;
                string StrCraetedOn = string.Empty;
                string StrStatus = string.Empty;
                string StrReportPath = string.Empty;
                string StrLocationId = string.Empty;
                try
                {
                    objProcedureParameter.Add("@Company_Id", "1");
                    dsSCHDet = GetDal.FunPubReportScheduleJob(objProcedureParameter);
                    if (dsSCHDet.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in dsSCHDet.Tables[0].Rows)
                        {
                            Icount = 0;
                            IEqualCount = 0;
                            StrScheduleId = dr["SCHEDULER_ID"].ToString();
                            StrLobId = dr["LOB_ID"].ToString();
                            StrReportMonth = dr["REPORT_MONTH"].ToString();
                            StrReportFormate = dr["REPORT_FORMAT"].ToString();
                            StrScheduleat = dr["SCHEDULED_AT"].ToString();
                            StrReportId = dr["REPORT_ID"].ToString();
                            StrUserId = dr["USER_ID"].ToString();
                            StrCraetedOn = dr["CREATE_ON"].ToString();
                            StrStatus = dr["STATUS_ID"].ToString();
                            StrReportPath = dr["REPORT_PATH"].ToString();
                            StrLocationId = dr["LOCATION_ID"].ToString();
                            strDateFormate = dr["DATEFORMATE"].ToString();
                            if (StrReportId == "1")//Indicative Arear
                            {
                                if (StrReportFormate == "2")//FlatFile
                                {
                                    if (StrLocationId.Length > 0)
                                    {
                                        string[] StrLocationIds = StrLocationId.Split(',');
                                        IEqualCount = StrLocationIds.Count();
                                        for (int i = 0; i <= StrLocationIds.Count() - 1; i++)
                                        {
                                            Icount = Icount + 1;
                                            try
                                            {
                                                FunPriGetScheduleData(StrReportId, StrUserId, StrLocationIds[i].ToString().Trim(), StrLobId, StrReportMonth, StrReportFormate, StrScheduleId, StrReportPath);

                                            }
                                            catch (Exception ex)
                                            {
                                                S3GDALayer.S3GAdminServices.ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "FLATFILEGENERATION", "WINSERVICE");
                                            }
                                        }
                                    }
                                }
                                else//1-Excel File
                                {
                                    try
                                    {
                                        FunPriGetScheduleData(StrReportId, StrUserId, StrLocationId.Trim(), StrLobId, StrReportMonth, StrReportFormate, StrScheduleId, StrReportPath);

                                    }
                                    catch (Exception ex)
                                    {
                                        S3GDALayer.S3GAdminServices.ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "EXCELGENERATION", "WINSERVICE");
                                    }
                                }
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    S3GDALayer.S3GAdminServices.ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "SAPMJV", "WINSERVICE");
                }
                finally
                {
                }
            }
        }

        public void FunPriGetScheduleData(string StrReportId, string StrUserId, string StrLocationId, string StrLobId, string StrReportMonth, string StrReportFormate, string StrScheduleId, string StrReportPath)
        {
            try
            {
                DataSet dsGetReportData;
                Dictionary<string, string> Procparam;
                SPOOL_DATA = null;
                SPOOL_DATAONE = null;
                SPOOL_DATATWO = null;
                dsGetReportData = null;
                ClsPubManualJournal GetDal = new ClsPubManualJournal();
                S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable ObjMJVClientDataTable;
                Procparam = new Dictionary<string, string>();
                Procparam.Clear();
                Procparam.Add("@Program_Id", "694");
                Procparam.Add("@User_Id", StrUserId);
                Procparam.Add("@Location_IDS", StrLocationId);
                Procparam.Add("@Lob_IDS", StrLobId);
                Procparam.Add("@IsFromSchduler", "1");
                Procparam.Add("@DemandMonth", StrReportMonth);
                Procparam.Add("@ReportFormate", StrReportFormate);
                Procparam.Add("@ReportId", StrReportId);

                dsGetReportData = GetDal.GetDefaultDataSet(Procparam, "S3G_GET_REPORT_SCHDLR_RPT_DTLS");
                strReportmonth = string.Empty;
                strReportmonth = StrReportMonth;
                SPOOL_DATA = dsGetReportData.Tables[0];
                SPOOL_DATAONE = dsGetReportData.Tables[1];
                SPOOL_DATATWO = dsGetReportData.Tables[2];
                FunPriGenerateDataFile(StrReportId, StrUserId, StrLocationId, StrLobId, StrReportMonth, StrReportFormate, StrScheduleId, StrReportPath);

            }
            catch (Exception ex)
            {
                S3GDALayer.S3GAdminServices.ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "RPSHEDULE", "WINSERVICE");
            }
            finally
            {
            }
        }
        private void FunPriGenerateDataFile(string StrReportId, string StrUserId, string StrLocationId, string StrLobId, string StrReportMonth, string StrReportFormaten, string strScheduleId, string strReportPath)
        {
            try
            {

                if (StrReportFormaten == "2")//FlatFile
                {
                    //FunPriGenSFLFlatfile(dsGetReportData.Tables[0], StrReportMonth, StrLocationId, strScheduleId, ReportId, strReportPath);
                }
                else if (StrReportFormaten == "1")//Excel 
                {
                    FunPubFormDataExcel(SPOOL_DATA, strScheduleId, strReportPath);
                }
            }
            catch (Exception ex)
            {
                S3GDALayer.S3GAdminServices.ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "RPSHEDULE", "WINSERVICE");
            }
            finally
            {
            }
        }
        // End Operating
        protected override void OnStop()
        {
            // TODO: Add code here to perform any tear-down necessary to stop your service.
        }
        public void FunPubFormDataExcel(DataTable DtSpoolData, string strScheduleId, string strReportPath)
        {
            try
            {
                if (DtSpoolData.Columns.Count > 1 && DtSpoolData.Columns.Contains("PANUM"))
                {
                    DtSpoolData.Columns.Remove("PANUM");
                }
                StringBuilder str = new StringBuilder();
                str.Append("<table border='1' width='100%'>");
                DataView DVDCLOB = new DataView(DtSpoolData);
                str.Append("<tr><td align='center' style=' font-weight:bold;' colspan='" + (DtSpoolData.Columns.Count - 1).ToString() + "' >");
                str.Append("RM3I Report");
                str.Append("</tr>");
                str.Append(System.Environment.NewLine);
                str.Append(System.Environment.NewLine);
                for (int i = 1; i <= DtSpoolData.Columns.Count - 1; i++)
                {
                    string strHeaderText = DtSpoolData.Columns[i].Caption;
                    strHeaderText = DtSpoolData.Columns[i].Caption;
                    str.Append("<td align='center' style=' font-weight:bold;' >");
                    str.AppendFormat("{0,-20}", strHeaderText.Replace("_", " ").ToUpper());
                    str.Append("</td>");
                }
                str.Append("</tr>");
                DataRow[] DRDCREC = DtSpoolData.Select("");
                if (DRDCREC.Length > 0)
                {
                    for (int rowidx = 0; rowidx < DRDCREC.Length; rowidx++)
                    {
                        str.Append("<tr>");
                        for (int j = 1; j <= DtSpoolData.Columns.Count - 1; j++)
                        {
                            str.Append("<td>" + DRDCREC[rowidx][j].ToString() + "</td>");
                        }
                        str.Append("</tr>");
                    }
                }
                str.Append("</tr>");
                str.Append("</table>");
                FunPubGenerateExcel(str, strReportPath, strScheduleId);
            }
            catch (Exception ex)
            {
            }
        }


        public void FunPubGenerateExcel(StringBuilder strHTMLText, string strDocPath, string strSheduleId)
        {
            ClsPubManualJournal GetDal = new ClsPubManualJournal();
            string fileName = strDocPath + "\\" + strSheduleId;
            string fileNameZip = string.Empty;

            try
            {
                if (!Directory.Exists(fileName))
                {
                    Directory.CreateDirectory(fileName);
                }
                fileNameZip = fileName + "\\" + strSheduleId + ".zip";
                fileName = fileName + "\\" + strSheduleId + ".xls";

                FileInfo fi = new FileInfo(fileName);
                if (fi.Exists)
                {
                    fi.Delete();
                }
                using (StreamWriter sw = fi.CreateText())
                {
                    sw.WriteLine(strHTMLText.ToString());
                }
                try
                {
                    FunPubCreateZip(strDocPath, strSheduleId, fileNameZip);
                }
                catch (Exception ex)
                {

                }
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@SheduleId", strSheduleId.ToString());
                Procparam.Add("@Is_Update", "1");
                DataSet dsDMDSP1 = GetDal.GetDefaultDataSet(Procparam, "S3G_GET_RP_SCHJOB");

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        //public string FunProFixedColumn(string Type)
        //{
        //    DataTable dtSFL_FLATFILE;
        //    if (Type == "BILLSP")
        //        dtSFL_FLATFILE = FunPubGetDMDSPDatatable();
        //    else if (Type == "DMDSP1")
        //        dtSFL_FLATFILE = FunPubGetdsDMDSP1DataTable();
        //    else
        //        dtSFL_FLATFILE = FunPubGetdsDMDSP2DataTable();
        //    string strRetValue = string.Empty;
        //    StringBuilder str = new StringBuilder();

        //    str.Append(System.Environment.NewLine);
        //    str.Append("------------------------------------------------------------------------------------------------------------------------------------------------------------");
        //    str.Append(System.Environment.NewLine);
        //    for (int i = 0; i <= dtSFL_FLATFILE.Rows.Count - 1; i++)
        //    {
        //        int intLen = 0;
        //        strRetValue = dtSFL_FLATFILE.Rows[i]["DISPLAY_NAME"].ToString();
        //        int intFxdLength = Convert.ToInt32(dtSFL_FLATFILE.Rows[i]["SPAN"].ToString());
        //        int intAlign = Convert.ToInt32(dtSFL_FLATFILE.Rows[i]["ALIGN"].ToString());
        //        intLen = strRetValue.Length;
        //        str.Append(FunProFormatedSpace(strRetValue, intFxdLength, intAlign) + " ");
        //    }
        //    str.Append(System.Environment.NewLine);
        //    str.Append("------------------------------------------------------------------------------------------------------------------------------------------------------------");
        //    str.Append(System.Environment.NewLine);
        //    return strRetValue = str.ToString();
        //}
        public static void FunPubGenerateTextFile(string strDemandmonth, StringBuilder strHTMLText, string strDocPath, string strSheduleId, int ICount)
        {
            ClsPubManualJournal GetDal = new ClsPubManualJournal();
            string fileName = strDocPath + "\\" + strSheduleId;
            try
            {
                if (!Directory.Exists(fileName))
                {
                    Directory.CreateDirectory(fileName);
                }
                fileName = fileName + "\\" + strSheduleId + "_" + ICount + ".txt";
                FileInfo fi = new FileInfo(fileName);
                if (fi.Exists)
                {
                    fi.Delete();
                }
                using (StreamWriter sw = fi.CreateText())
                {
                    sw.WriteLine(strHTMLText.ToString());
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
        public void FunPubCreateZip(string strPath, string StrScheduleId, string strFileName)
        {
            if (!File.Exists(strPath))
            {
                ZipFile.CreateFromDirectory(strPath, strFileName);
            }

        }
        protected string FunProFormatedSpace(string strVal, int intFxdLength, int intAlign)
        {
            int intLen = 0;
            string strRetValue = string.Empty;
            intLen = strVal.Length;
            if (strVal.Length > intFxdLength)
            {
                strRetValue = strVal.Substring(0, intFxdLength).ToString();
            }
            else
            {
                strRetValue = strVal;
            }
            if (intAlign == 3)
            {
                int intStartPoint = 0;
                intStartPoint = (intFxdLength - intLen) / 2;

                for (int i = 0; i < intStartPoint; i++)
                {
                    strRetValue = " " + strRetValue;
                }
                for (int i = 0; i < (intFxdLength - intLen) - intStartPoint; i++)
                {
                    strRetValue = strRetValue + " ";
                }
            }

            for (int i = 0; i < intFxdLength - intLen; i++)
            {
                if (intAlign == 1)
                {
                    strRetValue = strRetValue + " ";
                }
                else if (intAlign == 2)
                {
                    strRetValue = " " + strRetValue;
                }
            }
            return strRetValue;
        }
        public string FunProAddSpacingType(int type, int intIteration)
        {
            StringBuilder str = new StringBuilder();
            string returntype = string.Empty;
            if (type == 1)
            {
                for (int i = 1; i <= intIteration; i++)
                {
                    str.Append(System.Environment.NewLine);
                    returntype = str.ToString();
                }
            }

            if (type == 2)
            {
                for (int i = 1; i <= intIteration; i++)
                {
                    str.Append("\t");
                    returntype = str.ToString();
                }
            }

            if (type == 3)
            {
                for (int i = 1; i <= intIteration; i++)
                {
                    str.Append("\f");
                    returntype = str.ToString();
                }
            }

            return returntype;
        }
        //Billing Method
        void methodName()
        {
            ClsPubGenerateBillPDF objGeneratePDF = new ClsPubGenerateBillPDF();
            objGeneratePDF.FunPubGetPDFBilling();
            objGeneratePDF.FunPubGetPDFBillPDF();
        }
        // Billing End

        //Assign Dc

        public void FunCallAssignDCService()
        {
            try
            {
                //Function will return Assign DC related details for S3g_Services table

                ClsPubDemandProcessing ObjDemandProcess = new ClsPubDemandProcessing();
                DataSet dsServiceInfo = ObjDemandProcess.FunPubGetService("ASSIGN DC");

                //DataSet dsServiceInfo = DemandProcessing.FunPubGetService("ASSIGN DC");
                if (dsServiceInfo.Tables[0].Rows.Count > 0)
                {
                    int intCompanyId = int.Parse(dsServiceInfo.Tables[0].Rows[0]["Company_ID"].ToString());
                    int intDemandId = int.Parse(dsServiceInfo.Tables[0].Rows[0]["Demand_Process_ID"].ToString());
                    int intUserId = int.Parse(dsServiceInfo.Tables[0].Rows[0]["User_ID"].ToString());
                    int intProgramId = int.Parse(dsServiceInfo.Tables[0].Rows[0]["Program_Id"].ToString());
                    objAssignDc.FunPubAssignDC(intCompanyId, intDemandId, intUserId, intProgramId);
                }
            }
            catch (Exception ex)
            {
                //S3GLogger.LogMessage(ex.Message, "Demand");
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "ASSIGN DC", "WINSERVICE");
            }
        }

        public static class DemandProcessing
        {
            static ClsPubDemandProcessing ObjDemandProcess = new ClsPubDemandProcessing();

            public static DataTable FunPubAssignDC(int param1, int param2, int param3, int param4)
            {
                DataTable DemandTable = new DataTable();
                return ObjDemandProcess.FunPubAssignDC(param1, param2, param3, param4);
            }
            public static void FunPriAssignDemandCollector(string param1, string param2, int? param3, int? param4, int? param5, int? param12, int? param6, string param7, string param8, string param9, string param10, int param11)
            {
                ObjDemandProcess.FunPriAssignDemandCollector(param1, param2, param3, param4, param5, param12, param6, param7, param8, param9, param10, param11);
            }

            public static DataTable FunPriGetDcRuleDetails(int param1, int param2, string param3, int? param4, int? param5, string param6, int param7, int param8)
            {
                DataTable RulesTable = new DataTable();
                return ObjDemandProcess.FunPriGetDcRuleDetails(param1, param2, param3, param4, param5, param6, param7, param8);
            }
            public static void FunPubUpdateService(string strParam1, int param2, int param3)
            {
                ObjDemandProcess.FunPubUpdateService("ASSIGN DC", strParam1, param3.ToString(), null, param2);
            }
            public static DataSet FunPubGetService(string param1)
            {
                DataSet dsServiceInfo = ObjDemandProcess.FunPubGetService(param1);
                return dsServiceInfo;
            }
            public static void FunPubUpdateAssignDC(int param1)
            {
                ObjDemandProcess.FunPubUpdateAssignDC(param1);
            }
        }

        public class ClsPubAssignDc
        {
            //public Mutex PutLock = new Mutex();
            public void FunPubAssignDC(int intCompanyId, int intDemandId, int intUserId, int intProgramId)
            {
                //PutLock.WaitOne();
                try
                {

                    DemandProcessing.FunPubUpdateService("WIP", intCompanyId, intDemandId);
                    //Option is Sent as 1 since used it in SP
                    DataTable dtDcRules = DemandProcessing.FunPubAssignDC(intCompanyId, 1, intUserId, intProgramId);
                    ClsPubGetDcRuleDetails objClsPubDcRuleDetails;
                    //Thread[] threads_DCHdr = new Thread[dtDcRules.Rows.Count];   // Main Thread 
                    foreach (DataRow drDcRule in dtDcRules.Rows)
                    {
                        int i = 0;
                        objClsPubDcRuleDetails = new ClsPubGetDcRuleDetails();
                        objClsPubDcRuleDetails.CompanyId = intCompanyId;
                        objClsPubDcRuleDetails.DCRuleCardNo = drDcRule["DebtCollectorRuleCard_ID"].ToString();
                        objClsPubDcRuleDetails.Sequence = drDcRule["Sequence_String"].ToString();
                        objClsPubDcRuleDetails.DemandId = intDemandId;
                        objClsPubDcRuleDetails.UserId = intUserId;
                        objClsPubDcRuleDetails.ProgramId = intProgramId;
                        if (drDcRule["Location_ID"].ToString() != string.Empty)
                            objClsPubDcRuleDetails.BranchId = Convert.ToInt32(drDcRule["Location_ID"].ToString());
                        if (drDcRule["LOB_ID"].ToString() != string.Empty)
                            objClsPubDcRuleDetails.LobId = Convert.ToInt32(drDcRule["LOB_ID"].ToString());
                        if (drDcRule["Region_ID"].ToString() != string.Empty)
                            objClsPubDcRuleDetails.RegionId = Convert.ToInt32(drDcRule["Region_ID"].ToString());
                        objClsPubDcRuleDetails.FunPriGetDcRuleDetails();
                        //Thread t = new Thread(new ThreadStart(objClsPubDcRuleDetails.FunPriGetDcRuleDetails));   // Transactions method for getting DC details
                        //threads_DCHdr[i] = t;
                        //threads_DCHdr[i].Start();

                        i++;

                    }
                    //foreach (Thread Child in threads_DCHdr)
                    //{
                    //    if (Child != null)
                    //        Child.Join();
                    //}

                    //ClsPubCommErrorLog.CustomErrorRoutine(new Exception("Here no of rules is " + dtDcRules.Rows.Count.ToString()),  "ASSIGN DC", "WINSERVICE");

                    DemandProcessing.FunPubUpdateAssignDC(intDemandId);
                    //CLOSING SERVICE ONCE DONE
                    DemandProcessing.FunPubUpdateService("C", intCompanyId, intDemandId);
                }
                catch (Exception ex)
                {
                    DemandProcessing.FunPubUpdateService("CL", intCompanyId, intDemandId);
                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "ASSIGN DC", "WINSERVICE");
                }
                finally
                {

                }
                //PutLock.ReleaseMutex();

            }
        }

        public class ClsPubGetDcRuleDetails
        {

            public string DCRuleCardNo
            {
                get;
                set;
            }

            public int? LobId
            {
                get;
                set;
            }

            public int? BranchId
            {
                get;
                set;
            }

            public int? RegionId
            {
                get;
                set;
            }

            public string Sequence
            {
                get;
                set;
            }

            public int CompanyId
            {
                get;
                set;
            }

            public int DemandId
            {
                get;
                set;
            }


            public int ProgramId
            {
                get;
                set;
            }

            public int UserId
            {
                get;
                set;
            }

            public void FunPriGetDcRuleDetails()
            {
                //Mutex NewCheck = new Mutex(); -- This is commanded by nataraj

                lock (this)
                {

                    ClsPubGetDebtCollector objGetDebtCollector;
                    try
                    {
                        //Option is Sent as 2 since used it in SP
                        DataTable dtDcRulesDetails = DemandProcessing.FunPriGetDcRuleDetails(CompanyId, 2, DCRuleCardNo, LobId, BranchId, Sequence, UserId, ProgramId);
                        //Thread[] threads_DCDlts = new Thread[dtDcRulesDetails.Rows.Count];   // Sub Thread
                        foreach (DataRow drDCRuleDtlsRow in dtDcRulesDetails.Rows)
                        {
                            objGetDebtCollector = new ClsPubGetDebtCollector();

                            objGetDebtCollector.BranchId = BranchId;
                            objGetDebtCollector.RegionId = RegionId;
                            objGetDebtCollector.LobId = LobId;
                            objGetDebtCollector.DCRuleCard_ID = DCRuleCardNo;
                            objGetDebtCollector.CompanyId = CompanyId;
                            objGetDebtCollector.DemandId = DemandId;
                            objGetDebtCollector.Debt_Collector = drDCRuleDtlsRow["DebtCollector"].ToString();
                            if (dtDcRulesDetails.Columns.Contains("Pin_Code"))
                                if (Convert.ToString(drDCRuleDtlsRow["Pin_Code"]).Trim() != "")
                                    objGetDebtCollector.Pin_Code = drDCRuleDtlsRow["Pin_Code"].ToString();

                            if (dtDcRulesDetails.Columns.Contains("Product_ID"))
                                if (Convert.ToString(drDCRuleDtlsRow["Product_ID"]).Trim() != "")
                                    objGetDebtCollector.Product_ID = Convert.ToInt32(drDCRuleDtlsRow["Product_ID"].ToString());

                            if (dtDcRulesDetails.Columns.Contains("Rule_Period"))
                                if (Convert.ToString(drDCRuleDtlsRow["Rule_Period"]).Trim() != "")
                                    objGetDebtCollector.Rule_Period = drDCRuleDtlsRow["Rule_Period"].ToString();

                            if (dtDcRulesDetails.Columns.Contains("Rule_Value"))
                                if (Convert.ToString(drDCRuleDtlsRow["Rule_Value"]).Trim() != "")
                                    objGetDebtCollector.Rule_Value = drDCRuleDtlsRow["Rule_Value"].ToString();

                            if (dtDcRulesDetails.Columns.Contains("Sale_Person_ID"))
                                if (Convert.ToString(drDCRuleDtlsRow["Sale_Person_ID"]).Trim() != "")
                                    objGetDebtCollector.Sale_Person_ID = Convert.ToInt32(drDCRuleDtlsRow["Sale_Person_ID"].ToString());

                            if (dtDcRulesDetails.Columns.Contains("Category_Type"))
                                if (Convert.ToString(drDCRuleDtlsRow["Category_Type"]).Trim() != "")
                                    objGetDebtCollector.Category_Type = drDCRuleDtlsRow["Category_Type"].ToString();

                            int i = 0;

                            objGetDebtCollector.FunPriAssignDemandCollector();
                            //Thread t = new Thread(new ThreadStart(objGetDebtCollector.FunPriAssignDemandCollector));   // Transactions method for getting DC details
                            //threads_DCDlts[i] = t;
                            //threads_DCDlts[i].Start();                        
                            i++;
                        }
                        //S3GLogger.LogMessage("For the Rule " + DCRuleCardNo + " no of dtls rules count is " + dtDcRulesDetails.Rows.Count.ToString(), "ASSIGN DC");
                        //foreach (Thread Child in threads_DCDlts)
                        //{
                        //    if(Child!=null)
                        //        Child.Join();
                        //}

                    }

                    catch (Exception ex)
                    {

                        ClsPubCommErrorLog.CustomErrorRoutine(ex, "ASSIGN DC", "WINSERVICE");

                    }
                }
            }
        }

        public class ClsPubGetDebtCollector
        {
            //public Mutex PutLock = new Mutex();

            public string Pin_Code
            {
                get;
                set;
            }

            public int? Product_ID
            {
                get;
                set;
            }

            public string Rule_Period
            {
                get;
                set;
            }

            public string Rule_Value
            {
                get;
                set;
            }

            public string Category_Type
            {
                get;
                set;
            }

            public int? Sale_Person_ID
            {
                get;
                set;
            }

            public int? LobId
            {
                get;
                set;
            }

            public int? BranchId
            {
                get;
                set;
            }

            public int? RegionId
            {
                get;
                set;
            }

            public string Debt_Collector
            {
                get;
                set;
            }

            public string DCRuleCard_ID
            {
                get;
                set;
            }

            public int CompanyId
            {
                get;
                set;
            }

            public int DemandId
            {
                get;
                set;
            }

            public void FunPriAssignDemandCollector()
            {
                //PutLock.WaitOne();
                try
                {

                    DemandProcessing.FunPriAssignDemandCollector(DCRuleCard_ID, Debt_Collector, Sale_Person_ID, LobId, BranchId, RegionId, Product_ID, Pin_Code, Rule_Period, Rule_Value, Category_Type, DemandId);

                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "ASSIGN DC", "WINSERVICE");
                }
                //PutLock.ReleaseMutex();
            }
        }

        // end Assign DC

        //Bulk Revision
        //public void FunCallBulk()
        //{
        //    try
        //    {
        //        ObjBulkRev = new ClsPubBulkRevision();
        //        //Function will return Bukrevision related details for S3g_Services table
        //        DataSet ds = ObjBulkRev.FunPubGetService("BULK REVISION");

        //        if (ds.Tables.Count > 0)
        //        {
        //            if (ds.Tables[0].Rows.Count > 0)
        //            {
        //                FunPriProcess(ds.Tables[0]);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, "Bulk Revision", "WINSERVICE");
        //    }

        //}

        //private void FunPriProcess(DataTable dtTable)
        //{
        //    DataSet dsAccountDetails, dsInflowOutFlow = null;
        //    DataTable dtBulkRevProcess, dtUpdatedEMIDetails,
        //    dtRepaymentStructure, dtCashInflow, dtCashOutflow = null;
        //    DateTime dtStartdate, dtEffectiveDate;
        //    int intTenure, intBulkRowCount, intErrorCode, intCompany_Id = 0, intBulkRevId = 0;
        //    decimal decFinanceAmount, decRate, decRevisedRate, decRoundOff, decinterInterest;
        //    string strTenure, strFrequency, strTime_value, strBulkRevNo, strPANum, strSANum, stInter_Interest, strLOB_Code = null;
        //    CommonS3GBusLogic ObjBusinessLogic = null;

        //    try
        //    {
        //        ObjBulkRev = new ClsPubBulkRevision();
        //        //loop for n number of bulk revision.Processing One by one bulk revision
        //        for (int inLoopCount = 0; inLoopCount < dtTable.Rows.Count; inLoopCount++)
        //        {
        //            try
        //            {
        //                intCompany_Id = Convert.ToInt32(dtTable.Rows[inLoopCount]["Company_ID"].ToString());
        //                intBulkRevId = Convert.ToInt32(dtTable.Rows[inLoopCount]["Bulk_Revision_ID"].ToString());

        //                //Updating Services table as WIP (Work in progress) against each row which is taken for process
        //                ObjBulkRev.FunPubUpdateService("BULK REVISION", "WIP", intBulkRevId.ToString(), null, intCompany_Id);

        //                //Getting Account details for every bulk revision
        //                dtBulkRevProcess = ObjBulkRev.FunPubGetBulkRevDetails(intCompany_Id, intBulkRevId);
        //                strLOB_Code = Convert.ToString(dtBulkRevProcess.Rows[0]["LOB_CODE"]); //Added by Tamilselvan on 07/01/2012 for IRR Calculation changes for OL
        //                //Processing One by one accounts in each revision.
        //                for (intBulkRowCount = 0; intBulkRowCount < dtBulkRevProcess.Rows.Count; intBulkRowCount++)
        //                {
        //                LoopRepeat:

        //                    if (intBulkRowCount < dtBulkRevProcess.Rows.Count)
        //                    {

        //                        #region Assigning Values for each row form the Bulk revision Service table
        //                        strBulkRevNo = dtBulkRevProcess.Rows[intBulkRowCount]["Bulk_Revision_Number"].ToString();
        //                        strPANum = dtBulkRevProcess.Rows[intBulkRowCount]["PANum"].ToString();
        //                        strSANum = dtBulkRevProcess.Rows[intBulkRowCount]["SANum"].ToString();
        //                        dtEffectiveDate = Convert.ToDateTime(dtBulkRevProcess.Rows[intBulkRowCount]["Bulk_Revision_Effective_Date"]);
        //                        dsAccountDetails = ObjBulkRev.FunPubGetOldEMIStructure(strPANum, strSANum, dtEffectiveDate, intCompany_Id);
        //                        if (dsAccountDetails.Tables[0].Rows.Count > 0)
        //                        {
        //                            dtStartdate = Convert.ToDateTime(dsAccountDetails.Tables[0].Rows[0]["Installment_Date"].ToString());
        //                            decFinanceAmount = Convert.ToDecimal(dsAccountDetails.Tables[1].Rows[0]["Loan_Amount"].ToString());
        //                            decRate = Convert.ToDecimal(dsAccountDetails.Tables[1].Rows[0]["Rate"].ToString());
        //                            intTenure = Convert.ToInt32(dsAccountDetails.Tables[1].Rows[0]["Tenure"].ToString());
        //                            strTenure = dsAccountDetails.Tables[1].Rows[0]["Tenure_type"].ToString();
        //                            strFrequency = dsAccountDetails.Tables[1].Rows[0]["Frequency"].ToString();
        //                            decRevisedRate = Convert.ToDecimal(dtBulkRevProcess.Rows[intBulkRowCount]["Changed_Interest_Rate"].ToString());
        //                            stInter_Interest = dtBulkRevProcess.Rows[intBulkRowCount]["Intervening_Interest"].ToString();//Bug ID 3297 Intervening Period Interest
        //                            strTime_value = dsAccountDetails.Tables[1].Rows[0]["TIME_VALUE"].ToString();
        //                            decRoundOff = Convert.ToDecimal(dsAccountDetails.Tables[2].Rows[0]["Roundoff"].ToString());
        //                            if (strTime_value.ToLower().Contains("advance"))
        //                            {
        //                                strTime_value = "advance";
        //                            }
        //                            else
        //                            {
        //                                strTime_value = "arrears";
        //                            }

        //                            //Checking weather the resulting Rate is greater than 0
        //                            if ((decRate + decRevisedRate) > 0)
        //                            {
        //                                #region Arriving at a Updated repay structure
        //                                ObjBusinessLogic = new CommonS3GBusLogic();

        //                                //Getting EMI Details for New rate
        //                                //dtUpdatedEMIDetails = ObjBusinessLogic.FunPubGetRevisedEmiDetails(strFrequency, intTenure, strTenure, decFinanceAmount, decRate, RepaymentType.EMI, null, dtStartdate, dtStartdate, 0, strTime_value, dtEffectiveDate, decRevisedRate, decFinanceAmount);

        //                                dtUpdatedEMIDetails = ObjBusinessLogic.FunPubGetRevisedEmiDetails(dsAccountDetails.Tables[0], intTenure, strTenure, decFinanceAmount, decRate, dtEffectiveDate, decRevisedRate, decFinanceAmount, stInter_Interest, decRoundOff, out decinterInterest);
        //                                //Getting new Updated Repayment Structure
        //                                #endregion

        //                                #region Getting Inflow Outflow details
        //                                //Getting Cash Inflow/Outflow Details for the Account Number
        //                                dsInflowOutFlow = ObjBulkRev.FunPubGetCashInflowOutflow(strPANum, strSANum, dtEffectiveDate, intCompany_Id);

        //                                dtCashInflow = dsInflowOutFlow.Tables[0];
        //                                dtCashOutflow = dsInflowOutFlow.Tables[1];
        //                                #endregion

        //                                #region Calculation IRR
        //                                double decAccountingIrr;
        //                                double decComapnyIrr;
        //                                double decBusinessIrr;
        //                                try
        //                                {
        //                                    //Arriving at new IRR
        //                                    dtRepaymentStructure = ObjBusinessLogic.FunPubGenerateRepaymentStructure(dtUpdatedEMIDetails, dtCashInflow, dtCashOutflow, strFrequency, intTenure, strTenure, "dd/MM/yyyy", decFinanceAmount, decRevisedRate, "daily", "Empty", strTime_value, Convert.ToDecimal(0.10), Convert.ToDecimal(10.05), Convert.ToDecimal(10.05), dtStartdate, null, null, RepaymentType.EMI, out decAccountingIrr, out decBusinessIrr, out decComapnyIrr, "", null, strLOB_Code);

        //                                    #region Processing bulk revision

        //                                    //Processing Bulk Revsion
        //                                    intErrorCode = ObjBulkRev.FunPubProcessBulkRevision(intCompany_Id, strBulkRevNo, strPANum, strSANum, decComapnyIrr, decBusinessIrr, decAccountingIrr, decinterInterest, ObjBusinessLogic.FunPubFormXml(dtRepaymentStructure, true), decRevisedRate, ObjBusinessLogic.FunPubFormXml(dtUpdatedEMIDetails, true));

        //                                    if (intErrorCode != 0)
        //                                    {
        //                                        if (intErrorCode == 1)
        //                                            throw new Exception("Repayment Structure not available for bulk revision Number " + strBulkRevNo + " at line no " + (intBulkRowCount + 1).ToString() + " for Revision Number " + strBulkRevNo);
        //                                        else
        //                                            throw new Exception("Error in Revising for bulk revision Number " + strBulkRevNo + " at line no " + (intBulkRowCount + 1).ToString() + " for Revision Number " + strBulkRevNo);
        //                                    }
        //                                    #endregion

        //                                }
        //                                catch (Exception ex)
        //                                {
        //                                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "Bulk Revision");
        //                                    // ObjBulkRev.FunPubLogErrorBulkRevision(intCompany_Id, strBulkRevNo, strPANum, strSANum);
        //                                    if (intBulkRowCount < dtBulkRevProcess.Rows.Count)//incrementing only upto datatable rows count
        //                                        intBulkRowCount++;
        //                                    goto LoopRepeat;
        //                                }

        //                                #endregion
        //                            }
        //                            else
        //                            {
        //                                ClsPubCommErrorLog.CustomErrorRoutine(new Exception("Revised rate resulted in unrealistic rate for Account " + strPANum + " and Sub Account " + strSANum + " for Revision Number " + strBulkRevNo), "Bulk Revision");
        //                                //ObjBulkRev.FunPubLogErrorBulkRevision(intCompany_Id, strBulkRevNo, strPANum, strSANum);
        //                                if (intBulkRowCount < dtBulkRevProcess.Rows.Count)//incrementing only upto datatable rows count
        //                                    intBulkRowCount++;
        //                                goto LoopRepeat;
        //                            }
        //                        }
        //                        else
        //                        {
        //                            ClsPubCommErrorLog.CustomErrorRoutine(new Exception("No Repayment Structure for Account " + strPANum + " and Sub Account " + strSANum), "Bulk Revision");
        //                            //ObjBulkRev.FunPubLogErrorBulkRevision(intCompany_Id, strBulkRevNo, strPANum, strSANum);
        //                            if (intBulkRowCount < dtBulkRevProcess.Rows.Count)//incrementing only upto datatable rows count
        //                                intBulkRowCount++;
        //                            goto LoopRepeat;

        //                        }
        //                        #endregion
        //                    }

        //                }
        //                //Updating Service table against the reviusion number as "C" (Completed)
        //                ObjBulkRev.FunPubUpdateService("BULK REVISION", "C", intBulkRevId.ToString(), null, intCompany_Id);
        //            }
        //            catch (Exception ex)
        //            {
        //                ObjBulkRev.FunPubUpdateService("BULK REVISION", "CA", intBulkRevId.ToString(), null, intCompany_Id);
        //                //ClsPubCommErrorLog.CustomErrorRoutine(ex);
        //                ClsPubCommErrorLog.CustomErrorRoutine(ex, "Bulk Revision", "WINSERVICE");
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        //ClsPubCommErrorLog.CustomErrorRoutine(ex);
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, "Bulk Revision", "WINSERVICE");
        //    }
        //    finally
        //    {
        //        ObjBulkRev = null;
        //        dtBulkRevProcess = null;
        //        dsAccountDetails = null;
        //        ObjBusinessLogic = null;
        //    }
        //}

        // end Bulk Revision 

        //Income Recog

        private void TimerMethodIncome()
        {

            string strTime = string.Empty;
            string strDate = string.Empty;
            ClsPubODICalculations ObjODICalculations = null;
            try
            {
                ObjODICalculations = new ClsPubODICalculations();
                DataSet ds = ObjODICalculations.FunPubGetService(1, "CIR", DateTime.Now);

                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        strTime = ds.Tables[0].Rows[i]["Schedule_Time"].ToString();
                        strDate = ds.Tables[0].Rows[i]["Schedule_Date"].ToString();
                        string strCurrrntTime = DateTime.Now.Hour + ":" + DateTime.Now.Minute;
                        intUserID = Convert.ToInt32(ds.Tables[0].Rows[i]["User_ID"].ToString());
                        intCompanyID = Convert.ToInt32(ds.Tables[0].Rows[i]["Company_ID"].ToString());
                        intLOBID = Convert.ToInt32(ds.Tables[0].Rows[i]["LOB_ID"].ToString());
                        intBranchID = Convert.ToInt32(ds.Tables[0].Rows[i]["Location_Id"].ToString());
                        intFrequencyID = Convert.ToInt32(ds.Tables[0].Rows[i]["Frequency_Id"].ToString());
                        strCutoffDate = ds.Tables[0].Rows[i]["Cutoff_Date"].ToString();
                        intIncome_Recognition_ID = Convert.ToInt32(ds.Tables[0].Rows[i]["Income_Recognition_ID"].ToString());
                        FunIncomeRecognitionSave();

                    }
                }
            }
            catch (Exception ex)
            {
                // System.Windows.Forms.MessageBox.Show(ex.Message);
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "IncomeRecognition", "WINSERVICE");
            }
            finally
            {
                ObjODICalculations = null;
            }
        }

        private void FunIncomeRecognitionSave()
        {
            //System.Windows.Forms.MessageBox.Show("Save Start");
            string strErrorLog = string.Empty;
            //System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            //string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));// @"D:\S3G\SISLS3GPLayer\SISLS3GPLayer\Config.ini";// 
            //XmlDocument _xmlDoc = new XmlDocument();
            //if (File.Exists(strFileName))
            //{
            //    _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
            //}
            //else
            //{
            //    throw new FileNotFoundException("Configuration file not found");
            //}

            //string strPath = _xmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[6].Attributes["FilePath"].Value;// @"C:\S3Glog.txt";

            //time.Stop();
            //time.Enabled = false;

            Dictionary<string, string> ObjDictionary = new Dictionary<string, string>();
            ObjDictionary.Add("@Company_ID", Convert.ToString(intCompanyID));
            ObjDictionary.Add("@LOB_ID", intLOBID.ToString());
            ObjDictionary.Add("@Location_ID", intBranchID.ToString());
            ObjDictionary.Add("@Frequency_Code", intFrequencyID.ToString());
            ObjDictionary.Add("@CutOff_Date", strCutoffDate.ToString());
            ObjDictionary.Add("@User_ID", intUserID.ToString());
            ObjDictionary.Add("@Action_Flag", "3");
            ObjDictionary.Add("@IncomeCalculation_ID", intIncome_Recognition_ID.ToString());


            ClsPubIncomeRecognition ObjIncomeRecog = null;
            try
            {
                ObjIncomeRecog = new ClsPubIncomeRecognition();
                DataSet dsIncome = new DataSet();
                dsIncome = ObjIncomeRecog.FunPubGetIncomeRecognition(strProcName, ObjDictionary, out intErrCode, out strErrMsg);
                dsIncome = null;
                //System.Windows.Forms.MessageBox.Show(intErrCode.ToString());
                //System.Windows.Forms.MessageBox.Show(strErrMsg);

                //System.IO.StreamWriter file = new System.IO.StreamWriter(strPath + @"\InComeRecognotion.txt");
                //file.WriteLine(strErrMsg);
                //file.Close();

                //System.Windows.Forms.MessageBox.Show("Save Complete");
            }
            catch (Exception ex)
            {

                //ClsPubCommErrorLog.strLogFilePath = strPath + @"\ODICalculations.txt";
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "IncomeRecognition", "WINSERVICE");
                //System.Windows.Forms.MessageBox.Show(ex.Message);
            }
            finally
            {
                ObjIncomeRecog = null;
                //this.Stop();
            }
        }






        void SchedulemethodName()
        {
            DataSet dsScheduledJob = new DataSet();
            Dictionary<string, string> objParameters = new Dictionary<string, string>();
            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3GAdmin = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
            dsScheduledJob = objS3GAdmin.FunPubFillDataset("S3G_SCH_ExecuteJob", objParameters);
        }

        //end Schedule jobs

        //odi
        private void FunOverDueSave(int intCompany_Id, int intUserId, int intLobId, string strBranchId, DateTime ODIDate, string strType, int intODIId)
        {
            //System.Windows.Forms.MessageBox.Show("Save Start");
            string strFile = string.Empty;
            string strErrorLog = string.Empty;
            //string strPath = ConfigurationManager.AppSettings["LogFilePath"].ToString();

            System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
            string strFileName = (string)AppReader.GetValue("INIFILEPATH", typeof(string));// @"D:\S3G\SISLS3GPLayer\SISLS3GPLayer\Config.ini";// 
            XmlDocument _xmlDoc = new XmlDocument();
            if (File.Exists(strFileName))
            {
                _xmlDoc.LoadXml(File.ReadAllText(strFileName).Trim());
            }
            else
            {
                throw new FileNotFoundException("Configuration file not found");
            }

            string strPath = _xmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[5].Attributes["FilePath"].Value;// @"C:\S3Glog.txt";

            Dictionary<string, string> ObjDictionary = new Dictionary<string, string>();
            ObjDictionary.Add("@Company_ID", intCompany_Id.ToString());
            ObjDictionary.Add("@User_ID", intUserId.ToString());
            ObjDictionary.Add("@Lob_Id", intLobId.ToString());
            ObjDictionary.Add("@Location_Id", strBranchId);
            ObjDictionary.Add("@ODIDATE", ODIDate.ToString());
            ObjDictionary.Add("@Type", strType);
            ObjDictionary.Add("@ODIID", intODIId.ToString());
            //For Bellweather uncomment it
            //ObjDictionary.Add("@Is_BW", "1");


            strFile = @"\CM" + intCompany_Id.ToString() + "_LB" + intLobId.ToString();
            strFile = strFile + "_BR" + strBranchId + "_DT" + ODIDate.ToString() + "_ODI" + intODIId.ToString();

            ClsPubODICalculations ObjODICalculations = null;
            try
            {
                ObjODICalculations = new ClsPubODICalculations();
                int intResult = ObjODICalculations.FunPubSaveODI(SerializationMode.Binary, ClsPubSerialize.Serialize(ObjDictionary, SerializationMode.Binary), out strErrorLog);

                System.IO.StreamWriter file = new System.IO.StreamWriter(strPath);// + strFile + ".txt");
                file.WriteLine(strErrorLog);
                file.Close();
            }
            catch (Exception ex)
            {
                // ClsPubCommErrorLog.strLogFilePath = strPath + strFile + ".txt";
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "ODI", "WINSERVICE");
            }
            finally
            {
                ObjODICalculations = null;
            }
        }
        public void FunCallOdiTimer()
        {
            string strTime = string.Empty;
            string strDate = string.Empty;
            ClsPubODICalculations ObjODICalculations = null;
            try
            {
                ObjODICalculations = new ClsPubODICalculations();
                DataSet ds = ObjODICalculations.FunPubGetService(1, "ODI", DateTime.Now);

                if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        strTime = ds.Tables[0].Rows[i]["Schedule_Time"].ToString();
                        strDate = ds.Tables[0].Rows[i]["Schedule_Date"].ToString();

                        intCompanyID = Convert.ToInt32(ds.Tables[0].Rows[i]["Company_ID"].ToString());
                        intUserID = Convert.ToInt32(ds.Tables[0].Rows[i]["User_ID"].ToString());
                        intLOBID = Convert.ToInt32(ds.Tables[0].Rows[i]["LOB_ID"].ToString());
                        strBranchId = ds.Tables[0].Rows[i]["Location_Id"].ToString();
                        ODIDate = Convert.ToDateTime(ds.Tables[0].Rows[i]["ODI_Calculation_Date"].ToString());
                        intODIId = Convert.ToInt32(ds.Tables[0].Rows[i]["ODI_Calculation_ID"].ToString());
                        FunOverDueSave(intCompanyID, intUserID, intLOBID, strBranchId, ODIDate, "A", intODIId);
                    }
                }
            }
            catch (Exception ex)
            {
                //System.Windows.Forms.MessageBox.Show(ex.Message);
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
            finally
            {
                ObjODICalculations = null;
            }
        }
        //end odi

        //Cibil
        public void CibilmethodName()
        {
            ClsCIBILService objCIBILGeneration = new ClsCIBILService();
            objCIBILGeneration.FunPubGetSchedules();
        }

        private void FunPriDunninLetterforCheqReturn()
        {

            try
            {
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", "1");
                DataSet DS = new DataSet();
                DataTable dtHeader = new DataTable();
                DataTable dtDetails = new DataTable();
                DataTable dtSubDetails = new DataTable();
                string strNewHTML = string.Empty;
                DS = ObjDAL.FunPubFillDataset("S3G_DUNNING_CHKRETSERVICE", Procparam);
                if (DS != null)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                        dtHeader = DS.Tables[0].Copy();
                    if (DS.Tables[1].Rows.Count > 0)
                        dtDetails = DS.Tables[1].Copy();
                }
                if (dtHeader.Rows.Count > 0)
                {
                    foreach (DataRow dr in dtHeader.Rows)
                    {
                        strNewHTML = FunPriLoadTemplateModification(dr["LOBID"].ToString(), dr["LOCATION_CODE"].ToString());
                        StrFileName = dr["Cheque Return Number"].ToString();

                        foreach (DataColumn dcol in dtHeader.Columns)
                        {
                            string strColname = string.Empty;
                            strColname = "~" + dcol.ColumnName + "~";
                            strColname = strColname.Replace("PANUM", "Loan No");
                            if (strNewHTML.Contains(strColname))
                                strNewHTML = strNewHTML.Replace(strColname, dr[dcol].ToString());
                        }
                        DataRow[] drCustDetails = dtDetails.Select("PANUM ='" + dr["PANUM"].ToString() + "'");
                        if (drCustDetails != null)
                        {
                            if (drCustDetails.Length > 0)
                            {
                                dtSubDetails = drCustDetails.CopyToDataTable();
                            }
                        }
                        int intstartindex = 0;
                        int intEndindex = 0;
                        int inttbodysize = 0;
                        if (strNewHTML.Contains("<TBODY>"))
                            intstartindex = strNewHTML.IndexOf("<TBODY>");
                        if (strNewHTML.Contains("</TBODY>"))
                        {
                            intEndindex = strNewHTML.IndexOf("</TBODY>");
                            inttbodysize = 8;
                        }
                        string strCutString = strNewHTML.Substring(intstartindex, intEndindex - intstartindex + inttbodysize);
                        string strCutStringTD = string.Empty;
                        string[] stringSeparators1 = new string[] { "<TR>" };
                        string[] strCutSplit = strCutString.Split(stringSeparators1, StringSplitOptions.None);

                        if (strCutSplit.Length > 2)
                        {
                            int intEndindx = strCutSplit[2].IndexOf("</TR>");
                            strCutStringTD = "<TR>" + strCutSplit[2].Substring(0, intEndindx) + "</TR>";
                        }
                        if (dtSubDetails.Rows.Count > 0)
                        {
                            int i = 1;
                            int j = 1;
                            string strSubHTml = string.Empty;
                            foreach (DataRow drsub in dtSubDetails.Rows)
                            {
                                strSubHTml += strCutStringTD.Replace("~", i + "~");
                                ++i;
                            }
                            foreach (DataRow drsub1 in dtSubDetails.Rows)
                            {
                                foreach (DataColumn dcolsub1 in dtSubDetails.Columns)
                                {
                                    string strColnamesub = string.Empty;
                                    strColnamesub = j.ToString() + "~" + dcolsub1.ColumnName + j.ToString() + "~";
                                    strColnamesub = strColnamesub.Replace("PANUM", "Loan No");
                                    if (strSubHTml.Contains(strColnamesub))
                                    {
                                        strSubHTml = strSubHTml.Replace(strColnamesub, drsub1[dcolsub1].ToString());
                                    }
                                }
                                j++;
                            }
                            if ((!string.IsNullOrEmpty(strCutStringTD)) && (!string.IsNullOrEmpty(strSubHTml)))
                                strNewHTML = strNewHTML.Replace(strCutStringTD, strSubHTml);
                        }
                        else
                        {
                            strNewHTML = ((strNewHTML.Replace("~Due Date~", "")).Replace("~Due Amount~", "")).Replace("~Loan No~", "");
                        }
                        FunPriGeneratePDF(strNewHTML, StrFileName);
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
        }
        private void FunPriGeneratePDF(string strNewHTML, string FileName)
        {
            FileName = FileName.Replace("/", "-");
            String htmlText = strNewHTML.Replace("</P>", "</P></BR>");
            htmlText = htmlText.Replace("<HR>", "<HR width=\"100\">");
            string strnewFile = strDocPath.Replace("\\", "/").Trim() + "\\Template Files" + "\\CHEQ_DUNNING_FILES" + FileName;
            iTextSharp.text.Document doc = new iTextSharp.text.Document();
            if (Directory.Exists(strnewFile))
            {
                Directory.Delete(strnewFile, true);
            }
            Directory.CreateDirectory(strnewFile);
            strnewFile = strnewFile + "\\" + FileName + ".pdf";
            iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(doc, new FileStream(strnewFile, FileMode.Create));
            doc.AddCreator("Sundaram Infotech Solutions Limited");
            doc.AddTitle("Dunning Letter_" + FileName);
            doc.Open();
            List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(htmlText), null);
            for (int k = 0; k < htmlarraylist.Count; k++)
            { doc.Add((IElement)htmlarraylist[k]); }
            doc.AddAuthor("S3G Team");
            doc.Close();
        }
        private string FunPriLoadTemplateModification(string strLobId, string strLocationCode)
        {
            try
            {
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", "1");
                Procparam.Add("@IS_FROMSERVICE", "1");
                Procparam.Add("@LobId", strLobId);
                Procparam.Add("@LocationCode", strLocationCode);
                DataSet ds = ObjDAL.FunPubFillDataset("S3G_SYSAD_GET_TMPL_DTLS", Procparam);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = ds.Tables[0];
                    strFTBTemplate = dt.Rows[0]["Template_Content"].ToString();
                    strDocPath = dt.Rows[0]["DOC_PATH"].ToString();

                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "");
            }

            return strFTBTemplate;
        }

        #region SMS Setup
        public void FunCallSendSMS()
        {
            ClsPubS3GAdmin objClsPubS3GAdmin = new ClsPubS3GAdmin();

            string strXMLSmsData = string.Empty;

            try
            {
                DataSet dsData = new DataSet();
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_Id", "1");
                dsData = ObjDAL.FunPubFillDataset("S3G_GET_SCHEDULED_SMS_DET", Procparam);
                if (dsData.Tables[0].Rows.Count > 0 && dsData.Tables[0].Rows != null)
                {
                    DataTable dtSMSData = dsData.Tables[0];

                    DataTable dtTemp = new DataTable();
                    DataRow dr;

                    dtTemp.Columns.Add("SMS_ID", typeof(int));
                    dtTemp.Columns.Add("SMS_Status", typeof(int));
                    dtTemp.Columns.Add("Error_Msg", typeof(string));

                    int intRowCnt = 0;

                    for (int i = 0; i < dtSMSData.Rows.Count; i++)
                    {
                        intSMS_ID = Convert.ToInt32(dtSMSData.Rows[i]["SMS_ID"]);
                        strMobileNumber = dtSMSData.Rows[i]["SMS_NUMBER"].ToString();
                        strTemplate = dtSMSData.Rows[i]["SMS_MESSAGE"].ToString();

                        try
                        {
                            SendSMS(strMobileNumber, strTemplate);
                            intSMS_Status = 2; //2 - Completed
                            strErrorMsg = "SUCCESS";
                        }
                        catch (Exception ex)
                        {
                            intSMS_Status = 3; //3 - Error
                            strErrorMsg = ex.Message.ToString();
                        }

                        dr = dtTemp.NewRow();
                        dr["SMS_ID"] = intSMS_ID;
                        dr["SMS_Status"] = intSMS_Status;
                        dr["Error_Msg"] = strErrorMsg;
                        dtTemp.Rows.Add(dr);

                        intRowCnt++;

                        if (intRowCnt == 5)
                        {
                            strXMLSmsData = FunPubFormXml(dtTemp);
                            int intResult = objClsPubS3GAdmin.FunPubUpdateSMSStatus(strXMLSmsData); //Updating Scheduled SMS Status
                            dtTemp.Clear();
                            intRowCnt = 0;
                        }

                    }

                    if (dtTemp.Rows.Count > 0)
                    {
                        strXMLSmsData = FunPubFormXml(dtTemp);
                        int intResult = objClsPubS3GAdmin.FunPubUpdateSMSStatus(strXMLSmsData); //Updating Scheduled SMS Status
                        dtTemp.Clear();
                        intRowCnt = 0;
                    }

                }

            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "FunCallSendSMS");
            }
            finally
            {
                objClsPubS3GAdmin = null;
            }
        }

        #region Common method to send SMS through API
        public static void SendSMS(string strMobileNumber, string strMessage)
        {
            try
            {

                string userName = System.Configuration.ConfigurationManager.AppSettings["SMSUserName"].ToString();
                string password = System.Configuration.ConfigurationManager.AppSettings["SMSPassword"].ToString();
                string addressfrom = System.Configuration.ConfigurationManager.AppSettings["SMSAddressFrom"].ToString();


                string URL = "http://globalapi.myvaluefirst.com/psms/servlet/psms.Eservice2?data=<?xml version='1.0' encoding='ISO-8859-1'?><!DOCTYPE MESSAGE SYSTEM 'http://127.0.0.1/psms/dtd/message.dtd'><MESSAGE><USER USERNAME='" + userName + "' PASSWORD='" + password + "' /><SMS UDH='0' CODING='1' TEXT='" + strMessage + "' PROPERTY='0' ID='1'><ADDRESS FROM='" + addressfrom + "' TO='" + strMobileNumber + "' SEQ='1' TAG='some customer end random data' /></SMS></MESSAGE>&action=send";

                WebRequest myWebRequest = WebRequest.Create(URL);
                myWebRequest.ContentType = "text/xml; encoding=utf-8";
                //myWebRequest.Proxy = GetProxy();
                WebResponse myWebResponse = myWebRequest.GetResponse();
                Stream ReceiveStream = myWebResponse.GetResponseStream();
                Encoding encode = System.Text.Encoding.GetEncoding("utf-8");
                StreamReader readStream = new StreamReader(ReceiveStream, encode);
                string strResponse = readStream.ReadToEnd();
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
        }
        #endregion

        #endregion

        /// <summary>
        /// This method will form XML for DataTable its is a extended method available for 
        /// all Datatable.
        /// </summary>
        /// <param name="DtXml"></param>
        /// <returns></returns>
        /// 
        public static string FunPubFormXml(DataTable DtXml)
        {
            int intcolcount = 0;
            string strColValue = string.Empty;
            StringBuilder strbXml = new StringBuilder();
            strbXml.Append("<Root>");
            foreach (DataRow grvRow in DtXml.Rows)
            {
                intcolcount = 0;
                strbXml.Append(" <Details ");
                foreach (DataColumn dtCols in DtXml.Columns)
                {
                    strColValue = grvRow.ItemArray[intcolcount].ToString();
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    if (!string.IsNullOrEmpty(strColValue))
                    {
                        if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                        {

                            if (dtCols.ColumnName.ToUpper().Contains("DATE"))
                            {
                                //strbXml.Append(dtCols.ColumnName + "='" + StringToDate(strColValue).ToString() + "' ");
                            }
                            else
                            {
                                if (dtCols.ColumnName.ToUpper().Contains("REMARKS") || dtCols.ColumnName.ToUpper().Contains("NARRATION"))
                                {
                                    strbXml.Append(dtCols.ColumnName + "='" + strColValue + "' ");
                                }
                                else
                                {
                                    strbXml.Append(dtCols.ColumnName + "='" + strColValue.ToUpper() + "' ");
                                }
                            }

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


        private void FunProcessTerriostProcess()
        {

            string strConnectionName = string.Empty;
            string strErrorMessage = string.Empty;
            string strFilePath = string.Empty;
            string strFileNames;
            string strXMLFileNames;
            string strDestionationPath = string.Empty;
            string strExcelFilename=string.Empty;
            strFilePath = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TERRORIST_FILE_PATH"]);
            strDestionationPath = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TERRORIST_FILE_ARCPATH"]);
            strFileNames = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TA_FILE_NAME"]);
            strXMLFileNames = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TA_XML_FILE_NAME"]);
            try
            {
                ClsPubManualJournal GetDal = new ClsPubManualJournal();
                S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable ObjMJVClientDataTable;
                Dictionary<string, string> Procparam = new Dictionary<string, string>();
                DataSet dsGetReportData = GetDal.GetDefaultDataSet(Procparam, "S3G_GET_SCHJOB_DET");
                if (dsGetReportData.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToString(dsGetReportData.Tables[0].Rows[0]["FILE_TYPE"]) == "1") // CSV
                    {
                        string CSVFilePathName = strFilePath + "\\" + strFileNames.Trim() + ".csv";
                        strExcelFilename = strFileNames.Trim() + ".csv";
                        string[] Lines = (File.ReadAllLines(CSVFilePathName, Encoding.UTF8));
                        if (Lines == null)
                        {
                            //Utility.FunShowAlertMsg(this, "Invalid File");
                            return;
                        }
                        string[] Fields;
                        Fields = Lines[0].Split(new char[] { '\t' });
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
                                dt.Columns.Add(Fields[i].Replace(" ", "_"), typeof(string));
                            }
                        }

                        DataRow Row;
                        for (int i = 1; i < Lines.GetLength(0); i++)//Lines.GetLength(0)
                        {
                            Fields = Lines[i].Split(new char[] { '\t' });
                            Row = dt.NewRow();
                            for (int f = 0; f < Cols; f++)
                                Row[f] = Fields[f];
                            dt.Rows.Add(Row);
                        }
                        if (dt.Rows.Count > 0)
                        {
                            DataTable dt2 = dt;
                            int intrecordcount = 0;
                            Dictionary<string, string> str1 = new Dictionary<string, string>();
                            str1.Clear();
                            str1.Add("@COMPANY_ID", intCompanyID.ToString());
                            str1.Add("@USER_ID", intUserID.ToString());
                            str1.Add("@FILE_TYPE_ID", "1");
                            DataTable bytesPaymentRequestDetails1 = objDealMaster.FunPubFillDropdownUpload("LAD_DELETE_PEP_XML", strConnectionName, str1, string.Empty, string.Empty, out strErrorMessage);

                            try
                            {
                                foreach (DataRow dr in dt2.Rows)
                                {
                                    int is_delete = 0;
                                    if (intrecordcount == 0)
                                    {
                                        is_delete = 1;
                                    }
                                    else
                                    {
                                        is_delete = 0;
                                    }
                                    intrecordcount = intrecordcount + 1;
                                    DataTable dt6 = new DataTable();
                                    dt6 = dt2.Clone();
                                    dt6.ImportRow(dr);
                                    string strCSV = FunPubFormXmlInnerCSV(dt6);

                                    Dictionary<string, string> str2 = new Dictionary<string, string>();
                                    str2.Clear();
                                    str2.Add("@COMPANY_ID", intCompanyID.ToString());
                                    str2.Add("@USER_ID", intUserID.ToString());
                                    str2.Add("@IS_XMLTABLES_IS_DELETE", is_delete.ToString());
                                    try
                                    {
                                        DataTable dts = objDealMaster.FunPubFillDropdownUpload("LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL", strCSV, out strErrorMessage);
                                        //byte[] bytesPaymentRequestDetails = objDealMaster.FunPubFillDropdownXML(out strErrorMessage, "LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL", strCSV);
                                        if (dts.Rows.Count > 0)
                                        {
                                            DataTable dts1 = objDealMaster.FunPubFillDropdownUpload("LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL_ERRORRECORDS", strCSV, out strErrorMessage);
                                            //byte[] bytesPaymentRequestDetails2 = objDealMaster.FunPubFillDropdownXML(out strErrorMessage, "LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL_ERRORRECORDS", strCSV);
                                        }
                                    }
                                    catch (Exception objException)
                                    {
                                        ClsPubCommErrorLogDal.CustomErrorRoutine(objException, "Terrorist File Upload");
                                    }
                                }
                            }
                            catch (Exception objException)
                            {
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException, "Terrorist File Upload");
                            }
                            // File Copy and Delete
                            try
                            {
                                FileCopyTerriostData(strFilePath, strDestionationPath, strExcelFilename);
                            }
                            catch
                            {
                            }
                        }
                    }
                    else
                    {
                        string CSVFilePathName = strFilePath + "\\" + strXMLFileNames.Trim() + ".xml";
                        DataSet dsTerroristData = new DataSet();
                        dsTerroristData.ReadXml(CSVFilePathName);
                        Dictionary<string, string> str1 = new Dictionary<string, string>();
                        str1.Clear();
                        str1.Add("@COMPANY_ID", intCompanyID.ToString());
                        str1.Add("@USER_ID", intUserID.ToString());
                        str1.Add("@FILE_TYPE_ID", "2");
                        DataTable bytesPaymentRequestDetails1 = objDealMaster.FunPubFillDropdownUpload("LAD_DELETE_PEP_XML", strConnectionName, str1, string.Empty, string.Empty, out strErrorMessage);
                        try
                        {
                            for (int i = 0; i < dsTerroristData.Tables.Count; i++)
                            {
                                int intrecordcount = 0;
                                foreach (DataRow dr in dsTerroristData.Tables[i].Rows)
                                {
                                    int is_delete = 0;
                                    if (intrecordcount == 0)
                                    {
                                        is_delete = 1;
                                    }
                                    else
                                    {
                                        is_delete = 0;
                                    }
                                    intrecordcount = intrecordcount + 1;
                                    DataTable dt2 = new DataTable();
                                    dt2 = dsTerroristData.Tables[i].Clone();
                                    dt2.ImportRow(dr);
                                    string strXML = FunPubFormXmlInner2(dt2);
                                    Dictionary<string, string> str2 = new Dictionary<string, string>();
                                    str2.Clear();
                                    str2.Add("@COMPANY_ID", intCompanyID.ToString());
                                    str2.Add("@USER_ID", intUserID.ToString());
                                    str2.Add("@IS_XMLTABLES_IS_DELETE", is_delete.ToString());
                                    //byte[] bytesPaymentRequestDetails2 = objDealMaster.FunPubFillDropdownXML(out strErrorMessage, "LAD_INS_PEP_XML", strConnectionName, str2, "@S3G_XML_" + dsTerroristData.Tables[i].TableName, strXML);
                                    DataTable dts = objDealMaster.FunPubFillDropdownUpload("LAD_INS_PEP_XML", strConnectionName, str2, "@S3G_XML_" + dsTerroristData.Tables[i].TableName, strXML, out strErrorMessage);
                                    if (strErrorMessage != "" || !string.IsNullOrEmpty(strErrorMessage))
                                    {
                                        //byte[] bytesPaymentRequestDetails = objDealMaster.FunPubFillDropdownXML(out strErrorMessage, "LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL_ERRORRECORDS", strXML);
                                        DataTable bytesPaymentRequestDetails = objDealMaster.FunPubFillDropdownUpload("LAD_INS_PEP_XML", strConnectionName, str2, "@XML_INDIVIDUAL_ERRORRECORDS", strXML, out strErrorMessage);
                                    }
                                }
                                if (i == (dsTerroristData.Tables.Count) - 1)
                                {
                                    Dictionary<string, string> str3 = new Dictionary<string, string>();
                                    str3.Clear();
                                    str3.Add("@COMPANY_ID", intCompanyID.ToString());
                                    str3.Add("@USER_ID", intUserID.ToString());
                                    str3.Add("@IS_XMLTABLES_COUNT", i.ToString()); // For Insert Final Stage Only XML
                                    str3.Add("@FILE_TYPE_ID", "2");
                                    //byte[] bytesPaymentRequestDetails3 = objDealMaster.FunPubFillDropdownXML(out strErrorMessage, "LAD_INS_PEP_XML_DET", strConnectionName, str3, "", "");
                                    DataTable bytesPaymentRequestDetails = objDealMaster.FunPubFillDropdownUpload("LAD_INS_PEP_XML_DET", strConnectionName, str3, "", "", out strErrorMessage);                                   
                                }
                                //Dictionary<string, string> str2 = new Dictionary<string, string>();
                                //str2.Add("@COMPANY_ID", intCompanyID.ToString());
                                //DataTable dt5 = clsPubFAAdmin.FunPubFillDropdown("FA_INS_PEP_XML", strConnectionName, str2, "@S3G_XML_" + dsTerroristData.Tables[i].TableName, FunPubFormXmlInner2(dsTerroristData.Tables[i]));
                            }
                        }
                        catch (Exception objException)
                        {                           
                            return;
                        }
                    }
                   
                    // To update Schedule JOB Status
                    if (dsGetReportData.Tables[0].Rows.Count > 0)
                    {
                        Procparam = new Dictionary<string, string>();
                        Procparam.Add("@Company_Id", "1");
                        Procparam.Add("@SCHEDULEJOB_STATUS_ID", Convert.ToString(dsGetReportData.Tables[0].Rows[0]["SCHEDULEJOB_STATUS_ID"]));
                        DataSet dsUpdData = GetDal.GetDefaultDataSet(Procparam, "S3G_GET_SCHJOB_STATUS_UPD");
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "Terriost Data Upload Process");
            }
        }

        public static string FunPubFormXmlInnerCSV(DataTable DtXml)
        {

            int intcolcount = 0;
            string strColValue = string.Empty;
            StringBuilder strbXml = new StringBuilder();
            strbXml.Append("<Root>");
            foreach (DataRow grvRow in DtXml.Rows)
            {
                intcolcount = 0;
                strbXml.Append(" <Details ");
                foreach (DataColumn dtCols in DtXml.Columns)
                {
                    strColValue = grvRow.ItemArray[intcolcount].ToString();
                    int strLength = strColValue.Length;
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    strColValue = strColValue.Replace("(", "");
                    strColValue = strColValue.Replace(")", "");
                    strColValue = strColValue.Replace("[", "");
                    strColValue = strColValue.Replace("]", "");
                    if (!string.IsNullOrEmpty(strColValue))
                    {
                        if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                        {
                            if (strColValue.Length > 1000)
                            {
                                strColValue = strColValue.Substring(0, 1000);
                            }
                            //if (dtCols.ColumnName.ToUpper().Contains("DATE"))
                            string strColName = dtCols.ColumnName.ToUpper();

                            strColName = strColName.Replace("(", "");
                            strColName = strColName.Replace(")", "");
                            strColName = strColName.Replace("[", "");
                            strColName = strColName.Replace("]", "");
                            strColName = strColName.Replace("-", "_");



                            strbXml.Append(strColName + "_ " + "='" + strColValue + "' ");

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

        private void FileCopyTerriostData(string strSourcePath, string strDestinationPath, string strFilename)
        {
            try
            {
                string fileName = strFilename;
                string sourcePath = strSourcePath;
                string targetPath = strDestinationPath;
                string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
                string destFile = System.IO.Path.Combine(targetPath, strFilename);
                if (!System.IO.Directory.Exists(targetPath))
                {
                    System.IO.Directory.CreateDirectory(targetPath);
                }
                System.IO.File.Copy(sourceFile, destFile, true);
                if (System.IO.Directory.Exists(sourcePath))
                {
                    string[] files = System.IO.Directory.GetFiles(sourcePath);
                    foreach (string s in files)
                    {
                        fileName = System.IO.Path.GetFileName(s);
                        destFile = System.IO.Path.Combine(targetPath, fileName);
                        System.IO.File.Copy(s, destFile, true);
                    }
                    File.Delete(sourceFile);
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "Terriost Data Upload Process");
            }
        }

        public static string FunPubFormXmlInner2(DataTable DtXml)
        {

            int intcolcount = 0;
            string strColValue = string.Empty;
            StringBuilder strbXml = new StringBuilder();
            strbXml.Append("<Root>");
            foreach (DataRow grvRow in DtXml.Rows)
            {
                intcolcount = 0;
                strbXml.Append(" <Details ");
                foreach (DataColumn dtCols in DtXml.Columns)
                {
                    strColValue = grvRow.ItemArray[intcolcount].ToString();
                    int strLength = strColValue.Length;
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    strColValue = strColValue.Replace("(", "");
                    strColValue = strColValue.Replace(")", "");
                    strColValue = strColValue.Replace("[", "");
                    strColValue = strColValue.Replace("]", "");
                    if (!string.IsNullOrEmpty(strColValue))
                    {
                        if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                        {
                            if (strColValue.Length > 1000)
                            {
                                strColValue = strColValue.Substring(0, 1000);
                            }
                            //if (dtCols.ColumnName.ToUpper().Contains("DATE"))
                            strbXml.Append(dtCols.ColumnName.ToUpper().Replace("-", "_") + "_ " + "='" + strColValue + "' ");

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

        //private void FileCopyTerriostDataCHK()
        //{
        //    try
        //    {
        //        string fileName = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TA_FILE_NAME"]) + ".csv";
        //        string sourcePath = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TERRORIST_FILE_PATH"]);
        //        string targetPath = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["TERRORIST_FILE_ARCPATH"]);
        //        string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
        //        string destFile = System.IO.Path.Combine(targetPath, fileName);
        //        if (!System.IO.Directory.Exists(targetPath))
        //        {
        //            System.IO.Directory.CreateDirectory(targetPath);
        //        }
        //        System.IO.File.Copy(sourceFile, destFile, true);
        //        if (System.IO.Directory.Exists(sourcePath))
        //        {
        //            string[] files = System.IO.Directory.GetFiles(sourcePath);
        //            foreach (string s in files)
        //            {
        //                fileName = System.IO.Path.GetFileName(s);
        //                destFile = System.IO.Path.Combine(targetPath, fileName);
        //                System.IO.File.Copy(s, destFile, true);
        //            }
        //            File.Delete(sourceFile);
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "Terriost Data Upload Process");
        //    }
        //}
    }
}
