using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using S3GBusEntity;
using S3GBusEntity.Origination;
using System.Data;
using System.IO;
using System.Globalization;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using iTextSharp.text.html;
using System.Text;
using System.Windows.Forms;
using System.Configuration;
using System.Collections;
using System.Diagnostics;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.SqlServer.Server;
using System.Diagnostics.Eventing;
using Microsoft.Office.Interop.Excel;

namespace SISLS3GCommonWS
{
   
        public class ClsCIBILService
        {
            static string strSERVICE_NAME = "CIBIL";
            Dictionary<string, string> ProcParam = null;
            S3GDALayer.S3GAdminServices.ClsPubS3GAdmin objAdmin;
            public ClsCIBILService()
            {

            }

            public void FunPubGetSchedules()
            {
                try
                {
                    objAdmin = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
                    ProcParam = new Dictionary<string, string>();

                    ProcParam.Add("@SERVICE_NAME", strSERVICE_NAME);
                    DataSet dsService = objAdmin.FunPubFillDataset("S3g_LoanAd_GetSerivce", ProcParam);

                    System.Data.DataTable dtService = new System.Data.DataTable();
                    if (dsService != null && dsService.Tables.Count > 0)
                    {
                        dtService = dsService.Tables[0];
                    }

                    if (dtService != null && dtService.Rows.Count > 0)
                    {
                        for (int i = 0; i <= dtService.Rows.Count - 1; i++)
                        {
                            FunGenerateCIBILReport(dtService.Rows[i][1].ToString(), dtService.Rows[i][2].ToString(), dtService.Rows[i][3].ToString());
                        }
                    }
                }
                catch (Exception ex)
                {

                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "Unable to create CIBIL Report");
                    throw ex;

                }

            }




            public void FunGenerateCIBILReport(string CIBILMaster_Id, string StrFilePathName, string repMonth)
            {
                try
                {
                    string strFolder = "";
                    StringBuilder strbuilder = new StringBuilder();

                    ProcParam = new Dictionary<string, string>();
                    ProcParam.Add("@CIBILMaster_Id", CIBILMaster_Id);
                    objAdmin = new S3GDALayer.S3GAdminServices.ClsPubS3GAdmin();
                    DataSet DSet = objAdmin.FunPubFillDataset("S3G_RPT_GetCIBILAccounts", ProcParam);
                    strFolder = (StrFilePathName + "\\");
                    System.Data.DataTable DTbl = DSet.Tables[0];
                    for (int i = 0; i <= DTbl.Rows.Count - 1; i++)
                    {
                        strbuilder.Append(DTbl.Rows[i][0].ToString());

                        if (!(System.IO.Directory.Exists(strFolder)))
                        {
                            DirectoryInfo di = Directory.CreateDirectory(strFolder);
                        }
                    }
                    string mydocpath = (strFolder);

                    ProcParam = new Dictionary<string, string>();
                    ProcParam.Add("@CIBILMaster_Id", CIBILMaster_Id);
                    DataSet dsFile = objAdmin.FunPubFillDataset("S3G_RPT_getCIBILFiles", ProcParam);


                    System.Data.DataTable dtFile = dsFile.Tables[0];
                    DataRow dRowFile = dtFile.Rows[0];
                    string strFileName = dRowFile["FILENAMES"].ToString();

                    if (strFileName != null)
                    {
                        System.Data.DataTable dtExcel = DSet.Tables[1];
                        if (dtExcel.Rows.Count > 0)
                        {
                            string strFile = (strFolder + strFileName + ".xls");
                            if (File.Exists(strFile))
                            {
                                File.Delete(strFile);
                            }
                            ExportToExcel(dtExcel, strFolder + strFileName);
                        }

                        if (DSet.Tables[0].Rows.Count > 0 && DSet.Tables[2].Rows[0][0].ToString() == "G")
                        {
                            using (StreamWriter outfile = new StreamWriter(mydocpath + strFileName + ".txt"))
                            {
                                outfile.Write(strbuilder.ToString());
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLog.CustomErrorRoutine(ex, "Unable to create CIBIL Report");
                    throw ex;
                }

            }

            public void ExportToExcel(System.Data.DataTable dt, string outputPath)
            {
                // Create the Excel Application object
                ApplicationClass excelApp = new ApplicationClass();

                // Create a new Excel Workbook
                Workbook excelWorkbook = excelApp.Workbooks.Add(Type.Missing);

                int sheetIndex = 0;

                // Copy each DataTable
                //foreach (System.Data.DataTable dt in dataSet.Tables)
                //{

                // Copy the DataTable to an object array
                object[,] rawData = new object[dt.Rows.Count + 1, dt.Columns.Count];

                // Copy the column names to the first row of the object array
                for (int col = 0; col < dt.Columns.Count; col++)
                {
                    rawData[0, col] = dt.Columns[col].ColumnName;
                }

                // Copy the values to the object array
                for (int col = 0; col < dt.Columns.Count; col++)
                {
                    for (int row = 0; row < dt.Rows.Count; row++)
                    {
                        rawData[row + 1, col] = dt.Rows[row].ItemArray[col];
                    }
                }

                // Calculate the final column letter
                string finalColLetter = string.Empty;
                string colCharset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                int colCharsetLen = colCharset.Length;

                if (dt.Columns.Count > colCharsetLen)
                {
                    finalColLetter = colCharset.Substring(
                        (dt.Columns.Count - 1) / colCharsetLen - 1, 1);
                }

                finalColLetter += colCharset.Substring(
                        (dt.Columns.Count - 1) % colCharsetLen, 1);

                // Create a new Sheet
                Worksheet excelSheet = (Worksheet)excelWorkbook.Sheets.Add(
                    excelWorkbook.Sheets.get_Item(++sheetIndex),
                    Type.Missing, 1, XlSheetType.xlWorksheet);

                excelSheet.Name = dt.TableName;

                // Fast data export to Excel
                string excelRange = string.Format("A1:{0}{1}",
                    finalColLetter, dt.Rows.Count + 1);

                excelSheet.get_Range(excelRange, Type.Missing).Value2 = rawData;

                // Mark the first row as BOLD
                ((Range)excelSheet.Rows[1, Type.Missing]).Font.Bold = true;
                //}

                // Save and Close the Workbook
                excelWorkbook.SaveAs(outputPath, XlFileFormat.xlWorkbookNormal, Type.Missing,
                    Type.Missing, Type.Missing, Type.Missing, XlSaveAsAccessMode.xlExclusive,
                    Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);

                excelWorkbook.Close(true, Type.Missing, Type.Missing);
                excelWorkbook = null;

                // Release the Application object
                excelApp.Quit();
                excelApp = null;

                // Collect the unreferenced objects
                GC.Collect();
                GC.WaitForPendingFinalizers();

            }
        }
       
    
}
