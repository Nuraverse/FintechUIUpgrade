#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: LoanAdmin
/// Screen Name			: Manual Journal
/// Created By			: Kaliraj K
/// Created Date		: 07-Sep-2010
/// Purpose	            : To access and Insert Manual Journal Details

/// <Program Summary>
#endregion
using System;using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using S3GBusEntity;
using System.Data.OracleClient;
namespace S3GDALayer.LoanAdmin
{
    namespace LoanAdminAccMgtServices
    {
        public class ClsPubManualJournal
        {
            int intRowsAffected;
            S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable ObjMJV_DAL;
            S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_CRDRDTDataTable ObjCRDRDT;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubManualJournal()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateManualJournal(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_ManualJournalDataTable, out string strMJVNumber)
            {
                strMJVNumber = string.Empty;
                try
                {
                    ObjMJV_DAL = (S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_ManualJournalDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_ManualJournalRow ObjMJVRow in ObjMJV_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertMJVDetails");
                        db.AddInParameter(command, "@MJV_ID", DbType.Int32, ObjMJVRow.MJV_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjMJVRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjMJVRow.LOB_ID);
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, ObjMJVRow.Branch_ID);
                        db.AddInParameter(command, "@MJVDate", DbType.DateTime, ObjMJVRow.Approved_Date);
                        db.AddInParameter(command, "@ValueDate", DbType.DateTime, ObjMJVRow.Value_Date);
                        
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLMJVDetails",
                                   OracleType.Clob, ObjMJVRow.XMLMJVDetails.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjMJVRow.XMLMJVDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLMJVDetails", DbType.String, ObjMJVRow.XMLMJVDetails);
                        }
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjMJVRow.Created_By);
                        db.AddInParameter(command, "@CancelStatus", DbType.Int32, ObjMJVRow.CancelStatus);
                        //if (!ObjMJVRow.IsRefValue_dateNull())
                        //{
                        //    db.AddInParameter(command, "@RefValue_date", DbType.DateTime, ObjMJVRow.RefValue_date);
                        //}
                        //if (!ObjMJVRow.IsRefVoucherNoNull())
                        //{
                        //    db.AddInParameter(command, "@RefVoucherNo", DbType.String, ObjMJVRow.RefVoucherNo);
                        //}
                        //if (!ObjMJVRow.IsReferDateNull())
                        //{
                        //    db.AddInParameter(command, "@ReferDate", DbType.DateTime, ObjMJVRow.ReferDate);
                        //}
                        //if (!ObjMJVRow.IsCheqNoNull())
                        //{
                        //    db.AddInParameter(command, "@CheqNo", DbType.String, ObjMJVRow.CheqNo);
                        //}
                        //if (!ObjMJVRow.IsCheqDateNull())
                        //{
                        //    db.AddInParameter(command, "@CheqDate", DbType.DateTime, ObjMJVRow.CheqDate);
                        //}
                        if (!ObjMJVRow.IsXML_InstDetailsNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param;
                                param = new OracleParameter("@XML_InstDetails",
                                       OracleType.Clob, ObjMJVRow.XML_InstDetails.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjMJVRow.XML_InstDetails);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_InstDetails", DbType.String, ObjMJVRow.XML_InstDetails);
                            }
                        }

                        db.AddOutParameter(command,"@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@MJV_No", DbType.String,30);
                        
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                               // db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value!=0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    //strMJVNumber = command.Parameters["@MJV_No"].Value.ToString();
                                    trans.Rollback();
                                }
                                else
                                {
                                    strMJVNumber = command.Parameters["@MJV_No"].Value.ToString();
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
                                 ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;
            }
            public DataSet FunPubChkPendingJobs(Dictionary<string, string> dctProcParams)  // By NarasimhaRao on 30-Sep-14 To check the pending jobs of Report Schedular
            {
                DataSet ds = new DataSet();

                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_RP_CHK_PENDING_JOBS");
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                    }
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        try
                        {
                            ds = db.FunPubExecuteDataSet(command);
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                        }
                        finally
                        {
                            conn.Close();
                        }


                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return ds;
            }
            public DataSet FunPubGetReportDatas(Dictionary<string, string> dctProcParams)
            {
                DataSet ds = new DataSet();

                try
                {
                    DbCommand command = db.GetStoredProcCommand("CN_BILL_SFL_PROC_LST");
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                    }
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        try
                        {
                            ds = db.FunPubExecuteDataSet(command);
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                        }
                        finally
                        {
                            conn.Close();
                        }

                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return ds;

            }
            public DataSet GetDefaultDataSet(Dictionary<string, string> dctProcParams, string ProceName)//Added By Sathish For windows service
            {
                DataSet ds = new DataSet();

                try
                {
                    DbCommand command = db.GetStoredProcCommand(ProceName);
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                    }
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        try
                        {
                            ds = db.FunPubExecuteDataSet(command);
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                        }
                        finally
                        {
                            conn.Close();
                        }

                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return ds;

            }
            public DataSet FunPubReportScheduleJob(Dictionary<string, string> dctProcParams)
            {
                DataSet ds = new DataSet();

                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_GET_RP_SCHJOB");
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                    }
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        try
                        {
                            ds = db.FunPubExecuteDataSet(command);
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                        }
                        finally
                        {
                            conn.Close();
                        }

                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return ds;

            }
            public int FunPubInsertDebitCredit(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_CRDRDataTable, out string strMJVNumber, out int drCr_No)//Crdeit Debit Note
            {
                strMJVNumber = string.Empty;
                drCr_No = 0;
                try
                {
                    ObjCRDRDT = (S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_CRDRDTDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_CRDRDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_CRDRDTDataTable));
                    foreach (S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_LOANAD_CRDRDTRow ObjMJVRow in ObjCRDRDT.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("LA_INS_CRDRNDET");
                        db.AddInParameter(command, "@User_Id", DbType.Int32, ObjMJVRow.USRID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjMJVRow.CompanyId);
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, ObjMJVRow.Location_Id);
                        db.AddInParameter(command, "@TxnType", DbType.String, ObjMJVRow.Tran_Type);
                        db.AddInParameter(command, "@Doc_Id", DbType.String, ObjMJVRow.DocumentNo);
                        db.AddInParameter(command, "@DocumentDate", DbType.DateTime, ObjMJVRow.Document_Date);
                        db.AddInParameter(command, "@EntityType", DbType.String, ObjMJVRow.Entity_Type);
                        db.AddInParameter(command, "@EntityId", DbType.Int32, ObjMJVRow.Entity_Id);
                        db.AddInParameter(command, "@EntityCode", DbType.String, ObjMJVRow.Entity_Code);
                        db.AddInParameter(command, "@TxtnDate", DbType.DateTime, ObjMJVRow.Txn_Date);
                        db.AddInParameter(command, "@TxnAmount", DbType.String, ObjMJVRow.TxnAmoun);
                        db.AddInParameter(command, "@AccountCode", DbType.String, ObjMJVRow.Account_Code);
                        if (!ObjMJVRow.IsIS_DELETENull())
                        {
                            db.AddInParameter(command, "@IS_DELETE", DbType.String, ObjMJVRow.IS_DELETE);
                        }
                        db.AddInParameter(command, "@Remarks", DbType.String, ObjMJVRow.Remarks);
                        db.AddInParameter(command, "@GLAccount", DbType.String, ObjMJVRow.GL_Account);
                        db.AddInParameter(command, "@SLAccount", DbType.String, ObjMJVRow.SL_Account);
                        db.AddInParameter(command, "@Lob_Id", DbType.String, ObjMJVRow.Lob_Id);
                        db.AddInParameter(command, "@Reference_Number", DbType.String, ObjMJVRow.Reference_Number);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLAccountDetail",
                                   OracleType.Clob, ObjMJVRow.XMlAccountDetails.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjMJVRow.XMlAccountDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLAccountDetail", DbType.String, ObjMJVRow.XMlAccountDetails);
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@CRDRNO_OUT", DbType.String, 30);
                        db.AddOutParameter(command, "@CRDRNO_No", DbType.Int32, sizeof(Int32));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (intRowsAffected == 3)
                                    {
                                        trans.Commit();
                                    }
                                    else
                                        trans.Rollback();
                                }
                                else
                                {
                                    strMJVNumber = command.Parameters["@CRDRNO_OUT"].Value.ToString();
                                    drCr_No = (int)command.Parameters["@CRDRNO_No"].Value;
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;
            }
        }
    }
}
