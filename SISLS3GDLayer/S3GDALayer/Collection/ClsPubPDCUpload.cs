using System;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using S3GDALayer.Common;
using S3GBusEntity;
using System.Data.OracleClient;


namespace S3GDALayer.Collection
{
    namespace ClnReceiptMgtServices
    {
        public class ClsPubPDCUpload
        {
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable objPDCUpload_DTB;
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_ChequeReturnUploadDataTable objCHQRTNUpload_DTB;
            Database db;
            public ClsPubPDCUpload()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            /// <summary>
            /// To Upload PDC Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjPDCUpload_DataTable"></param>
            /// <param name="intUploadID"></param>
            /// <returns></returns>
            public int FunPubCreateFileUpload(SerializationMode SerMode, byte[] bytesObjPDCUpload_DataTable, out Int32 intUploadID)
            {
                intUploadID = 0;
                int intErrorCode = 0;

                try
                {
                    objPDCUpload_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjPDCUpload_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadRow objrow in objPDCUpload_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_FILEUPLDDTLS");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objrow.Company_ID);
                        db.AddInParameter(command, "@File_Name", DbType.String, objrow.File_Name);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, objrow.Program_ID);
                        db.AddInParameter(command, "@Txn_ID", DbType.Int32, objrow.Txn_ID);
                        db.AddInParameter(command, "@Upload_Path", DbType.String, objrow.Upload_Path);
                        if (!objrow.IsPDC_NatureNull())
                            db.AddInParameter(command, "@PDC_Nature", DbType.Int32, objrow.PDC_Nature);

                        if (!objrow.IsDeposit_Bank_IDNull())
                            db.AddInParameter(command, "@Deposit_Bank_ID", DbType.Int32, objrow.Deposit_Bank_ID);

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@Upload_ID", DbType.Int32, sizeof(Int32));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    intUploadID = Convert.ToInt32(command.Parameters["@Upload_ID"].Value);
                                    trans.Commit();
                                }
                            }
                            catch (Exception objException)
                            {
                                if (intErrorCode == 0)
                                    intErrorCode = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception objException)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                }
                return intErrorCode;
            }

            /// <summary>
            /// To Save PDC data
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjPDCUpload_DataTable"></param>
            /// <param name="intUploadID"></param>
            /// <returns></returns>
            public int FunPubCreatePDCUploadDetails(SerializationMode SerMode, byte[] bytesObjPDCUpload_DataTable, out Int32 intUploadID)
            {
                intUploadID = 0;
                int intErrorCode = 0;

                try
                {
                    objPDCUpload_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjPDCUpload_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PDCUploadRow objrow in objPDCUpload_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_PDCUPLDDTLS");
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objrow.Company_ID);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, objrow.Program_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objrow.Txn_ID);
                        db.AddInParameter(command, "@PDC_NATURE_TYPE", DbType.Int32, objrow.PDC_Nature);
                        db.AddInParameter(command, "@UPLOAD_ID", DbType.Int32, objrow.Upload_ID);

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception objException)
                            {
                                if (intErrorCode == 0)
                                    intErrorCode = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception objException)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                }
                return intErrorCode;
            }


            public int FunPubCreateChequeReturnUploadDetails(SerializationMode SerMode, byte[] bytesObjUpload_DataTable, out Int32 intUploadID)
            {
                intUploadID = 0;
                int intErrorCode = 0;

                try
                {
                    objCHQRTNUpload_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_ChequeReturnUploadDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjUpload_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_ChequeReturnUploadDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_ChequeReturnUploadRow objrow in objCHQRTNUpload_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_CHEQRTNUPLDDTLS");
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objrow.Company_ID);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, objrow.Program_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objrow.Txn_ID);
                        db.AddInParameter(command, "@UPLOAD_ID", DbType.Int32, objrow.Upload_ID);

                        db.AddInParameter(command, "@Bank_Advice_Number", DbType.String, objrow.Bank_Advice_Number);

                        db.AddInParameter(command, "@Bank_Advice_Date", DbType.DateTime, objrow.Bank_Advice_Date);

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception objException)
                            {
                                if (intErrorCode == 0)
                                    intErrorCode = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception objException)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                }
                return intErrorCode;
            }

        }
    }
}
