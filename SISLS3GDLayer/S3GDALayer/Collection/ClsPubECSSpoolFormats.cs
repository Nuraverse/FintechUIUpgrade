#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Collection
/// Screen Name			: ECS Details DAL Class
/// Created By			: Kannan RC
/// Created Date		: 05-Oct-2010
/// Purpose	            : 
/// <Program Summary>
#endregion


#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data.OracleClient;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using S3GBusEntity.Collection;
#endregion



namespace S3GDALayer.Collection
{
    namespace ClnReceiptMgtServices
    {
        public class ClsPubECSSpoolFormats
        {
            #region
            int intRowsAffected;
            S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolDataTable objECSSpool_DAL = null;
            S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_MovementDataTable objCheque_MovementDataTable_DAL;
            S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_RepresentationDataTable objCheque_RepresentDataTable_DAL;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubECSSpoolFormats()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            #endregion


            #region Create ECS
            public int FunPubCreateECSFormat(SerializationMode SerMode, byte[] bytesobjS3G_cln_ECSDataTable)
            {
                try
                {

                    objECSSpool_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_ECSDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolRow ObjECSRow in objECSSpool_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_InsertECSSpoolFormat");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjECSRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjECSRow.LOB_ID);
                        if (!ObjECSRow.IsBranch_IDNull())
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjECSRow.Branch_ID);
                        db.AddInParameter(command, "@Bank_ID", DbType.Int32, ObjECSRow.Bank_ID);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjECSRow.Created_By);
                        db.AddInParameter(command, "@Created_On", DbType.DateTime, ObjECSRow.Created_On);
                        //db.AddInParameter(command, "@XML_ECSDetails", DbType.String, ObjECSRow.XML_ECSDeltails);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_ECSDetails", OracleType.Clob,
                                ObjECSRow.XML_ECSDeltails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjECSRow.XML_ECSDeltails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_ECSDetails", DbType.String,
                                ObjECSRow.XML_ECSDeltails);
                        }
                        db.AddInParameter(command, "@TXN_Id", DbType.Int32, ObjECSRow.Txn_ID);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                }

                            }
                            catch (Exception exp)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }

                }

                catch (Exception exp)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                }
                return intRowsAffected;

            }
            #endregion

            //Added by Suseela -For Cheque return from vault/Vault Approval/Vault option/Vault option acknowledgement/Handing over acknowledgement by DC/legal/Cheque Handing over by Cheque custodian/-code starts
            #region Create ChequeMovement
            public int FunPubCreateChequeMovement(SerializationMode SerMode, byte[] bytesobjS3G_cln_ChequeMovementDataTable, string strConnectionName)
            {
                try
                {

                    objCheque_MovementDataTable_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_MovementDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_ChequeMovementDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_MovementDataTable));
                    foreach (S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_MovementRow ObjChequeMovementRow in objCheque_MovementDataTable_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CN_INS_CHQ_MVMNT");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjChequeMovementRow.Company_Id);
                        db.AddInParameter(command, "@Branch_Code", DbType.String, ObjChequeMovementRow.Branch_Code);
                        db.AddInParameter(command, "@Contract_Number", DbType.String, ObjChequeMovementRow.Contract_Number);
                        db.AddInParameter(command, "@Customer_Code", DbType.String, ObjChequeMovementRow.Customer_Code);
                        db.AddInParameter(command, "@Customer_Name", DbType.String, ObjChequeMovementRow.Customer_Name);
                        db.AddInParameter(command, "@DraweeBank_Code", DbType.String, ObjChequeMovementRow.DraweeBank_Code);
                        db.AddInParameter(command, "@DraweeBank_Place", DbType.String, ObjChequeMovementRow.DraweeBank_Place);
                        db.AddInParameter(command, "@Move_Code", DbType.String, ObjChequeMovementRow.Move_Mode);
                        db.AddInParameter(command, "@User_Id", DbType.Int32, ObjChequeMovementRow.User_Id);
                        db.AddInParameter(command, "@Action", DbType.String, ObjChequeMovementRow.Action);
                        db.AddInParameter(command, "@Request_By", DbType.String, ObjChequeMovementRow.Request_By);
                        db.AddInParameter(command, "@Request_Reasion", DbType.String, ObjChequeMovementRow.Request_Reasion);
                        db.AddInParameter(command, "@Request_ReasionFVault", DbType.String, ObjChequeMovementRow.Request_ReasionFVault);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Cheq_Mvmnt_Dtls", OracleType.Clob,
                                ObjChequeMovementRow.XML_Cheq_Mvmnt_Dtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjChequeMovementRow.XML_Cheq_Mvmnt_Dtls);
                            command.Parameters.Add(param);
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                }

                            }
                            catch (Exception exp)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                ClsPubCommErrorLog.CustomErrorRoutine(exp);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }

                }
                catch (Exception exp)
                {
                    ClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return intRowsAffected;
            }
            #endregion
            //Added by Suseela -For Cheque return-code ends

            //Added by Suseela -For Cheque representation-code starts
            #region Create ChequeRepresentation
            public int FunPubCreateChequeRepresentation(SerializationMode SerMode, byte[] bytesobjS3G_cln_ChequeRepresentDataTable, string strConnectionName)
            {
                try
                {

                    objCheque_RepresentDataTable_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_RepresentationDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_ChequeRepresentDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_RepresentationDataTable));
                    foreach (S3GBusEntity.Collection.ClnReceiptMgtServices.Cheque_RepresentationRow ObjChequeRepresentRow in objCheque_RepresentDataTable_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CN_INS_CHQ_REPRESENT");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjChequeRepresentRow.Company_Id);
                        db.AddInParameter(command, "@Branch_Code", DbType.String, ObjChequeRepresentRow.Branch_Code);
                        db.AddInParameter(command, "@Contract_Number", DbType.String, ObjChequeRepresentRow.Contract_Number);
                        db.AddInParameter(command, "@Customer_Code", DbType.String, ObjChequeRepresentRow.Customer_Code);
                        db.AddInParameter(command, "@Customer_Name", DbType.String, ObjChequeRepresentRow.Customer_Name);
                        db.AddInParameter(command, "@DraweeBank_Code", DbType.String, ObjChequeRepresentRow.DraweeBank_Code);
                        db.AddInParameter(command, "@DraweeBank_Place", DbType.String, ObjChequeRepresentRow.DraweeBank_Place);
                        db.AddInParameter(command, "@Move_Code", DbType.String, ObjChequeRepresentRow.Move_Mode);
                        db.AddInParameter(command, "@User_Id", DbType.Int32, ObjChequeRepresentRow.User_Id);
                        db.AddInParameter(command, "@Action", DbType.String, ObjChequeRepresentRow.Action);
                        db.AddInParameter(command, "@Request_By", DbType.String, ObjChequeRepresentRow.Request_By);
                        db.AddInParameter(command, "@Request_Reasion", DbType.String, ObjChequeRepresentRow.Request_Reasion);
                        db.AddInParameter(command, "@Request_ReasionFVault", DbType.String, ObjChequeRepresentRow.Request_ReasionFVault);
                        db.AddInParameter(command, "@Lob", DbType.String, ObjChequeRepresentRow.LOB);
                        db.AddInParameter(command, "@Receipt_No", DbType.String, ObjChequeRepresentRow.Receipt_No);
                        db.AddInParameter(command, "@Instrument_No", DbType.String, ObjChequeRepresentRow.Instrument_No);
                        db.AddInParameter(command, "@Requested_Date", DbType.String, ObjChequeRepresentRow.Requested_Date);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Cheq_Mvmnt_Dtls", OracleType.Clob,
                                ObjChequeRepresentRow.XML_Cheq_Mvmnt_Dtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjChequeRepresentRow.XML_Cheq_Mvmnt_Dtls);
                            command.Parameters.Add(param);
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                }

                            }
                            catch (Exception exp)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                ClsPubCommErrorLog.CustomErrorRoutine(exp);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }

                }
                catch (Exception exp)
                {
                    ClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return intRowsAffected;
            }
            #endregion
            //Added by Suseela -For Cheque representation-code ends

            #region Modify ECS
            public int FunPubModifyECSFormat(SerializationMode SerMode, byte[] bytesobjS3G_cln_ECSDataTable)
            {
                try
                {

                    objECSSpool_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_ECSDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_ECSSpoolRow ObjECSRow in objECSSpool_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_UpdateECSFormatDetails");
                        db.AddInParameter(command, "@ECS_Spool_ID", DbType.Int32, ObjECSRow.ECS_Spool_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjECSRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjECSRow.LOB_ID);
                        if (!ObjECSRow.IsBranch_IDNull())
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjECSRow.Branch_ID);
                        db.AddInParameter(command, "@Bank_ID", DbType.Int32, ObjECSRow.Bank_ID);
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjECSRow.Modified_By);
                        db.AddInParameter(command, "@Modified_On", DbType.DateTime, ObjECSRow.Modified_On);
                        //db.AddInParameter(command, "@XML_ECSDetails", DbType.String, ObjECSRow.XML_ECSDeltails);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_ECSDetails", OracleType.Clob,
                                ObjECSRow.XML_ECSDeltails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjECSRow.XML_ECSDeltails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_ECSDetails", DbType.String,
                                ObjECSRow.XML_ECSDeltails);
                        }
                        db.AddInParameter(command, "@TXN_Id", DbType.Int32, ObjECSRow.Txn_ID);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //                                db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                }

                            }
                            catch (Exception exp)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                                trans.Rollback();
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }

                }

                catch (Exception exp)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                }
                return intRowsAffected;

            }
            #endregion
        }
    }
}
