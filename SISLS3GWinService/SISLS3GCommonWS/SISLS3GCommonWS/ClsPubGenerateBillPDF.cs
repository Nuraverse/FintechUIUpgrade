using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using iTextSharp;
using iTextSharp.text.pdf;
using System.IO;
using System.Configuration;
using System.Web;
using System.Diagnostics;
using System.Globalization;
using System.Diagnostics.Eventing;
using iTextSharp.text;
using iTextSharp.text.html;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data;
using Microsoft.SqlServer.Server;
using S3GBusEntity;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace SISLS3GCommonWS
{
    public class ClsPubGenerateBillPDF
    {
        static string strPageName = "Bill Generation";
        public ClsPubGenerateBillPDF()
        {
        }
        public static void FunPubGeneratePDF(string strFolderNo, int intIndex, string strCustomerName, string strBranchName, string strHTMLText, string strDocPath)
        {
            string strDocumentPath = "";
            if (strDocPath != "")
            {

                strDocumentPath = strDocPath;
                string strnewFile = strDocumentPath + "\\BillNo-" + strFolderNo;
                if (!Directory.Exists(strnewFile))
                {
                    Directory.CreateDirectory(strnewFile);
                }
                strnewFile += "\\" + strCustomerName;
                if (!Directory.Exists(strnewFile))
                {
                    Directory.CreateDirectory(strnewFile);
                }
                strnewFile += "\\" + strBranchName.Replace("|", "").ToString() + "XXXX" + strFolderNo + intIndex.ToString() +".pdf";
                Document doc = new Document();
                try
                {
                    if (!File.Exists(strnewFile))
                    {
                        PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(strnewFile, FileMode.Create));
                        doc.AddCreator("Sundaram Infotech Solutions");
                        doc.AddTitle("New PDF Document");
                        doc.Open();
                        List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new

                        StringReader(strHTMLText), null);
                        for (int k = 0; k < htmlarraylist.Count; k++)
                        { doc.Add((IElement)htmlarraylist[k]); }
                        doc.AddAuthor("S3G Team");
                        doc.Close();
                        System.Diagnostics.Process.Start(strnewFile);
                    }
                }
                catch (Exception ex)
                {
                    //if (EventLog.SourceExists("Billing"))
                    //{
                    //   EventLog.CreateEventSource("Billing", "BillingService");
                    //}
                    //EventLog.WriteEntry("Billing",ex.Message,EventLogEntryType.Error);
                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "Billing", "WINSERVICE");
                }
                finally
                {

                }
            }
        }
        public void FunPubGetPDFBilling()
        {

            DataSet dsBillingDetails;
            try
            {
                FunPriGetBranchDetails(out dsBillingDetails);

                string strDocPath = "";
                if (dsBillingDetails != null)
                {
                    if (dsBillingDetails.Tables.Count > 0)
                    {

                        for (int billidx = 0; billidx <= dsBillingDetails.Tables[0].Rows.Count - 1; billidx++)
                        {
                            Dictionary<string, string> objProcParam = new Dictionary<string, string>();
                            objProcParam.Add("@Company_ID", dsBillingDetails.Tables[0].Rows[billidx]["Company_ID"].ToString());
                            objProcParam.Add("@Billing_ID", dsBillingDetails.Tables[0].Rows[billidx]["Billing_ID"].ToString());
                            objProcParam.Add("@Location", dsBillingDetails.Tables[0].Rows[billidx]["Location"].ToString());
                            if (billidx == dsBillingDetails.Tables[0].Rows.Count - 1)
                            {
                                objProcParam.Add("@Is_Final", "1");
                            }
                            DataSet dSet = FunPriGetAccount(objProcParam);

                            //for (int AccIdx = 0; AccIdx < dSet.Tables[0].Rows.Count; AccIdx++)
                            //{
                            try
                            {
                                DataTable DTAccounts = dSet.Tables[0].DefaultView.ToTable(true, "ACCOUNT_NO");

                                foreach (DataRow DRaCC in DTAccounts.Rows)
                                {
                                    DataRow[] DRAccDtls = dSet.Tables[0].Select("ACCOUNT_NO='" + DRaCC["ACCOUNT_NO"].ToString() + "'", "CashFlow");
                                    DataTable dt = dSet.Tables[0].Clone();

                                    foreach (DataRow DR in DRAccDtls)
                                    {
                                        dt.ImportRow(DR);
                                    }

                                    string strBranchName = dt.Rows[0]["Location"].ToString();
                                    string strFolderNo = dt.Rows[0]["FolderNumber"].ToString();
                                    string strBillNo = dt.Rows[0]["Bill_Number"].ToString();
                                    string strCustomerName = dt.Rows[0]["CUSTOMER_NAME"].ToString();
                                    string strDocumentPath = dt.Rows[0]["Document_Path"].ToString();
                                    string strnewFile = strDocumentPath + "\\BillNo-" + strFolderNo;
                                    decimal decGrandTotal = 0;
                                    for (int idx = 0; idx < dt.Rows.Count; idx++)
                                    {
                                        decGrandTotal = Convert.ToDecimal(dt.Rows[idx]["AMOUNT"].ToString()) + Convert.ToDecimal(dt.Rows[idx]["VAT"].ToString()) + Convert.ToDecimal(dt.Rows[idx]["Service_TAX"].ToString());
                                    }



                                    strnewFile += "\\" + strCustomerName;

                                    if (!Directory.Exists(strnewFile))
                                    {
                                        Directory.CreateDirectory(strnewFile);
                                    }
                                    strnewFile += "\\" + dSet.Tables[0].Rows[0]["LOCATION"].ToString().Replace("|", "").Replace(" ", "_").ToString();
                                    if (!Directory.Exists(strnewFile))
                                    {
                                        Directory.CreateDirectory(strnewFile);
                                    }
                                    strnewFile += "\\" + strBillNo.Replace("/", "") + ".pdf";
                                    FileInfo fl = new FileInfo(strnewFile);
                                    if (fl.Exists == true)
                                    {
                                        fl.Delete();
                                    }

                                    string ReportPath = "";
                                    //ReportPath = System.Reflection.Assembly.GetEntryAssembly().Location.Replace("\\bin\\Debug\\SISLS3GWSBilling.exe", "\\Reports\\RptBillDetails.RPT");
                                    ReportPath = System.Reflection.Assembly.GetEntryAssembly().Location.Replace("\\bin\\Debug\\SISLS3GCommonWS.exe", "\\Reports\\RptBillDetails.RPT");

                                    ReportDocument rptd = new ReportDocument();
                                    rptd.Load(ReportPath);
                                    //TextObject TxtSub = (TextObject)rptd.ReportDefinition.ReportObjects["TxtSubject"];
                                    //TxtSub.Text = "Sub : Bill for Due of INR." + decGrandTotal.ToString() + " falling on " + dSet.Tables[0].Rows[0]["INSTALLMENT_DATE"].ToString();
                                    rptd.SetDataSource(dt);
                                    rptd.ExportToDisk(ExportFormatType.PortableDocFormat, strnewFile);
                                    if (rptd != null)
                                    {
                                        rptd.Close();
                                        rptd.Dispose();
                                    }
                                }
                            }
                            catch (Exception ex)
                            {
                            }

                        }
                    }
                }
            
            }
            catch (Exception ex)
            {
                //EventLog.WriteEntry("Billing", ex.Message, EventLogEntryType.Error);
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "Billing", "WINSERVICE");
            }

        }
        
        #region GET BILL PDF
        // ADDED BY R. Manikandan For Generating Bill Service 
        // ADDED ON 31 - JAN - 2013
        private void FunPriGetBillPDFDetails(out DataSet dsBillingDetails)
        {
            dsBillingDetails = new DataSet();
            Dictionary<string, string> objProcedureParameter = new Dictionary<string, string>();

            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3gAdminClient = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
            try
            {
                objProcedureParameter.Add("@Service_Name", "BILLPDF");
                dsBillingDetails = objS3gAdminClient.FunPubFillDataset("S3g_LoanAd_GetSerivce", objProcedureParameter);
            }
            catch (Exception ex)
            {
                //EventLog.WriteEntry("Billing", ex.Message, EventLogEntryType.Error);
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "BILL PDF", "WINSERVICE");
            }
            finally
            {
                objS3gAdminClient = null;
            }

        }



        // ADDED BY R. Manikandan For Generating Bill Service 
        // ADDED ON 31 - JAN - 2013
        public void FunPubGetPDFBillPDF()
        {
            DataSet dsBILLPDF;
            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3gAdminClient = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
            try
            {
                FunPriGetBillPDFDetails(out dsBILLPDF);
                string strDocPath = "";
                if (dsBILLPDF != null)
                {
                    if (dsBILLPDF.Tables.Count > 0)
                    {

                        for (int billidx = 0; billidx <= dsBILLPDF.Tables[0].Rows.Count - 1; billidx++)
                        {
                            Dictionary<string, string> objProcParam = new Dictionary<string, string>();
                            objProcParam.Add("@Company_ID", dsBILLPDF.Tables[0].Rows[billidx]["Company_ID"].ToString());
                            objProcParam.Add("@Billing_ID", dsBILLPDF.Tables[0].Rows[billidx]["Billing_ID"].ToString());
                            objProcParam.Add("@Location", dsBILLPDF.Tables[0].Rows[billidx]["Location"].ToString());
                            if (billidx == dsBILLPDF.Tables[0].Rows.Count - 1)
                            {
                                objProcParam.Add("@Is_Final", "1");
                            }
                            try
                            {
                                dsBILLPDF = objS3gAdminClient.FunPubFillDataset("S3G_LOANAD_GET_BILL_PDF", objProcParam);
                                DataTable DTAccounts = dsBILLPDF.Tables[0].DefaultView.ToTable(true, "ACCOUNT_NO");
                                foreach (DataRow DRaCC in DTAccounts.Rows)
                                {
                                    DataRow[] DRAccDtls = dsBILLPDF.Tables[0].Select("ACCOUNT_NO='" + DRaCC["ACCOUNT_NO"].ToString() + "'", "CashFlow");
                                    DataTable dt = dsBILLPDF.Tables[0].Clone();

                                    foreach (DataRow DR in DRAccDtls)
                                    {
                                        dt.ImportRow(DR);
                                    }

                                    string strBranchName = dt.Rows[0]["Location"].ToString();
                                    string strFolderNo = dt.Rows[0]["FolderNumber"].ToString();
                                    string strBillNo = dt.Rows[0]["Bill_Number"].ToString();
                                    string strCustomerName = dt.Rows[0]["CUSTOMER_NAME"].ToString();
                                    string strDocumentPath = dt.Rows[0]["Document_Path"].ToString();
                                    string strnewFile = strDocumentPath + "\\BillNo-" + strFolderNo;
                                    decimal decGrandTotal = 0;
                                    for (int idx = 0; idx < dt.Rows.Count; idx++)
                                    {
                                        decGrandTotal = Convert.ToDecimal(dt.Rows[idx]["AMOUNT"].ToString()) + Convert.ToDecimal(dt.Rows[idx]["VAT"].ToString()) + Convert.ToDecimal(dt.Rows[idx]["Service_TAX"].ToString());
                                    }



                                    strnewFile += "\\" + strCustomerName;

                                    if (!Directory.Exists(strnewFile))
                                    {
                                        Directory.CreateDirectory(strnewFile);
                                    }
                                    strnewFile += "\\" + dsBILLPDF.Tables[0].Rows[0]["LOCATION"].ToString().Replace("|", "").Replace(" ", "_").ToString();
                                    if (!Directory.Exists(strnewFile))
                                    {
                                        Directory.CreateDirectory(strnewFile);
                                    }
                                    strnewFile += "\\" + strBillNo.Replace("/", "") + ".pdf";
                                    FileInfo fl = new FileInfo(strnewFile);
                                    if (fl.Exists == true)
                                    {
                                        fl.Delete();
                                    }

                                    string ReportPath = "";
                                    //ReportPath = System.Reflection.Assembly.GetEntryAssembly().Location.Replace("\\bin\\Debug\\SISLS3GWSBilling.exe", "\\Reports\\RptBillDetails.RPT");
                                    ReportPath = System.Reflection.Assembly.GetEntryAssembly().Location.Replace("\\bin\\Debug\\SISLS3GCommonWS.exe", "\\Reports\\RptBillDetails.RPT");
                                    ReportDocument rptd = new ReportDocument();
                                    rptd.Load(ReportPath);
                                    rptd.SetDataSource(dt);
                                    rptd.ExportToDisk(ExportFormatType.PortableDocFormat, strnewFile);
                                    if (rptd != null)
                                    {
                                        rptd.Close();
                                        rptd.Dispose();
                                    }
                                }

                            }
                            catch (Exception ex)
                            {
                                //EventLog.WriteEntry("Billing", ex.Message, EventLogEntryType.Error);
                                ClsPubCommErrorLog.CustomErrorRoutine(ex, "Billing PDF", "WINSERVICE");
                            }
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                //EventLog.WriteEntry("Billing", ex.Message, EventLogEntryType.Error);
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "Billing PDF", "WINSERVICE");
            }
           
            finally
            {
                objS3gAdminClient = null;
            }

        }
        // ADDED BY R. Manikandan to get  BILL PDF END 


        // ADDED BY R. Manikandan to get  BILL PDF END 
        #endregion


        private void FunPriGetBranchDetails(out DataSet dsBillingDetails)
        {
            dsBillingDetails = new DataSet();
            Dictionary<string, string> objProcedureParameter = new Dictionary<string, string>();

            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objS3gAdminClient = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
            try
            {
                objProcedureParameter.Add("@Service_Name", "BILL");
                dsBillingDetails = objS3gAdminClient.FunPubFillDataset("S3g_LoanAd_GetSerivce", objProcedureParameter);

            }
            catch (Exception ex)
            {
                //EventLog.WriteEntry("Billing", ex.Message, EventLogEntryType.Error);
                ClsPubCommErrorLog.CustomErrorRoutine(ex, "Billing", "WINSERVICE");
            }
            finally
            {
                objS3gAdminClient = null;
            }

        }

        private DataSet FunPriGetAccount(Dictionary<string, string> procParam)
        {
            DataSet dSet = new DataSet();
            S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling objBilling = new S3GDALayer.LoanAdmin.LoanAdminMgtServices.ClsPubBilling();
            dSet = objBilling.FunPubCalculateBillingInt(procParam);
            return dSet;

        }
    }
}
