
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Loan Admin
/// Screen Name			: Account Assignment DAL Class
/// Created By			: Tamilselvan.S
/// Created Date		: 19-Jun-2012
/// Purpose	            : DAL Class for Account Assignment Methods
/// Last Updated By		: NULL
/// Last Updated Date   : NULL
/// Reason              : NULL
/// <Program Summary>
#endregion

#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using S3GBusEntity;
using Entity_LoanAdmin = S3GBusEntity.LoanAdmin;
using System.Data.OracleClient;
#endregion

namespace S3GDALayer.LoanAdmin
{
    namespace LoanAdminAccMgtServices
    {
        public class ClsPubAssignmenttoOverDue
        {
            #region [Initialization]

            int intErrorCode;
            //int intRowsAffected;
            Entity_LoanAdmin.LoanAdminAccMgtServices.S3G_ASSIGNMENTTOOVERDUEDataTable ObjAccountAssignmtDataTable_DAL = null;
            Entity_LoanAdmin.LoanAdminAccMgtServices.S3G_ASSIGNMENTTOOVERDUERow ObjAccountAssignmtRow = null;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubAssignmenttoOverDue()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #endregion [Initialization]

            #region Create/Modified Account Assignment
            /// <summary>
            /// 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjAccountActivationDataTable"></param>
            /// <returns></returns>
            public int FunPubAccountAssignmtOverDueCreate(SerializationMode SerMode, byte[] bytesObjAccountAssignmtDataTable, string strMode, out string strErrMsg, out string strAssNo)
            {
                strErrMsg = string.Empty;
                strAssNo = string.Empty;
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_LA_INSUPD_ACC_ASSIGNMTTOOD"); //S3G_LA_INSUPD_ACC_ASSIGNMT

                    ObjAccountAssignmtDataTable_DAL = (Entity_LoanAdmin.LoanAdminAccMgtServices.S3G_ASSIGNMENTTOOVERDUEDataTable)ClsPubSerialize.DeSerialize(bytesObjAccountAssignmtDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3G_ASSIGNMENTTOOVERDUEDataTable));
                    ObjAccountAssignmtRow = ObjAccountAssignmtDataTable_DAL.Rows[0] as Entity_LoanAdmin.LoanAdminAccMgtServices.S3G_ASSIGNMENTTOOVERDUERow;

                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccountAssignmtRow.CompanyId);
                    if (!ObjAccountAssignmtRow.IsASSIGNMENTTOOD_IDNull())
                    {
                        db.AddInParameter(command, "@ASSIGNMENTTOOD_ID", DbType.Int32, ObjAccountAssignmtRow.ASSIGNMENTTOOD_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsLOB_IDNull())
                    {
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjAccountAssignmtRow.LOB_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsLOCATION_IDNull())
                    {
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjAccountAssignmtRow.LOCATION_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsASSIGNMENT_NONull())
                    {
                        db.AddInParameter(command, "@ASSIGNMENT_NO", DbType.String, ObjAccountAssignmtRow.ASSIGNMENT_NO);
                    }
                    if (!ObjAccountAssignmtRow.IsASSIGNMENT_DATENull())
                    {
                        db.AddInParameter(command, "@ASSIGNMENT_DATE", DbType.DateTime, ObjAccountAssignmtRow.ASSIGNMENT_DATE);
                    }
                    if (!ObjAccountAssignmtRow.IsCUSTOMER_IDNull())
                    {
                        db.AddInParameter(command, "@CUSTOMER_ID", DbType.Int32, ObjAccountAssignmtRow.CUSTOMER_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsFROM_PANUMNull())
                    {
                        db.AddInParameter(command, "@FROM_PANUM", DbType.String, ObjAccountAssignmtRow.FROM_PANUM);
                    }
                    if (!ObjAccountAssignmtRow.IsTO_PANUMNull())
                    {
                        db.AddInParameter(command, "@TO_PANUM", DbType.String, ObjAccountAssignmtRow.TO_PANUM);
                    }
                    if (!ObjAccountAssignmtRow.IsASSIGNMENT_FLAGNull())
                    {
                        db.AddInParameter(command, "@ASSIGNMENT_FLAG", DbType.Int32, ObjAccountAssignmtRow.ASSIGNMENT_FLAG);
                    }
                    if (!ObjAccountAssignmtRow.IsACCOUNT_LINK_KEYNull())
                    {
                        db.AddInParameter(command, "@ACCOUNT_LINK_KEY", DbType.Int32, ObjAccountAssignmtRow.ACCOUNT_LINK_KEY);
                    }
                    if (!ObjAccountAssignmtRow.IsCREATED_BYNull())
                    {
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjAccountAssignmtRow.CREATED_BY);
                    }
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param;

                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_From_DetNull())
                        {
                            param = new OracleParameter("@S3G_LAD_Assignment_From_Det", OracleType.Clob,
                               ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Det.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Det);
                            command.Parameters.Add(param);
                        }

                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_To_DetNull())
                        {
                            param = new OracleParameter("@S3G_LAD_Assignment_To_Det", OracleType.Clob,
                               ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Det.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Det);
                            command.Parameters.Add(param);
                        }
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_From_InsNull())
                        {
                            param = new OracleParameter("@S3G_LAD_Assignment_From_Ins", OracleType.Clob,
                               ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Ins.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Ins);
                            command.Parameters.Add(param);
                        }
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_To_InsNull())
                        {
                            param = new OracleParameter("@S3G_LAD_Assignment_To_Ins", OracleType.Clob,
                               ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Ins.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Ins);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_From_DetNull())
                        {
                            db.AddInParameter(command, "@S3G_LAD_Assignment_From_Det", DbType.String, ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Det);
                        }
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_To_DetNull())
                        {
                            db.AddInParameter(command, "@S3G_LAD_Assignment_To_Det", DbType.String, ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Det);
                        }
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_From_InsNull())
                        {
                            db.AddInParameter(command, "@S3G_LAD_Assignment_From_Ins", DbType.String, ObjAccountAssignmtRow.S3G_LAD_Assignment_From_Ins);
                        }
                        if (!ObjAccountAssignmtRow.IsS3G_LAD_Assignment_To_InsNull())
                        {
                            db.AddInParameter(command, "@S3G_LAD_Assignment_To_Ins", DbType.String, ObjAccountAssignmtRow.S3G_LAD_Assignment_To_Ins);
                        }
                    }
                    db.AddInParameter(command, "@Mode", DbType.String, strMode);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 200);
                    db.AddOutParameter(command, "@DSNO", DbType.String, 200);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command,trans);
                            db.FunPubExecuteNonQuery(command, ref trans);

                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                            }
                            else if ((int)command.Parameters["@ErrorCode"].Value < 0)
                            {
                                intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                                if (intErrorCode == -1)
                                    throw new Exception("Document Sequence no not-defined");
                                if (intErrorCode == -2)
                                    throw new Exception("Document Sequence no exceeds defined limit");
                            }
                            else
                            {
                                if (strMode != "M")
                                {
                                    strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                    strAssNo = (string)command.Parameters["@DSNO"].Value;
                                }
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                            {
                                intErrorCode = 50;
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
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intErrorCode;
            }

            #endregion

            #region [Revoke Account Assignmnet]

            /// <summary>
            /// Created By Tamilselvan.S
            /// Created Date 20/06/2012
            /// For Revoke the Account Assignment Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjAccountAssignmtDataTable"></param>
            /// <returns></returns>
            //public int FunPubRevokeAccountAssignment(SerializationMode SerMode, byte[] bytesObjAccountAssignmtDataTable)
            //{
            //    int intErrorCode = 0;
            //    try
            //    {
            //        ObjAccountAssignmtDataTable_DAL = (Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable)ClsPubSerialize.DeSerialize(bytesObjAccountAssignmtDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable));
            //        ObjAccountAssignmtRow = ObjAccountAssignmtDataTable_DAL.Rows[0] as Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtRow;

            //        DbCommand command = db.GetStoredProcCommand("S3G_CLN_REVOKE_ACCASSIGNMT");
            //        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccountAssignmtRow.COMPANY_ID);
            //        db.AddInParameter(command, "@Acc_Assignment_Id", DbType.Int32, ObjAccountAssignmtRow.ACC_ASSIGNMENT_ID);
            //        db.AddInParameter(command, "@UserId", DbType.Int32, ObjAccountAssignmtRow.CREATED_BY);
            //        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));

            //        using (DbConnection conn = db.CreateConnection())
            //        {
            //            conn.Open();
            //            DbTransaction trans = conn.BeginTransaction();
            //            try
            //            {
            //                db.FunPubExecuteNonQuery(command, ref trans);
            //                if ((int)command.Parameters["@ERRORCODE"].Value != 0)
            //                {
            //                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
            //                }
            //                else
            //                {
            //                    trans.Commit();
            //                }
            //            }
            //            catch (Exception ex)
            //            {
            //                if (intErrorCode == 0)
            //                    intErrorCode = 50;
            //                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
            //                trans.Rollback();
            //            }
            //            finally
            //            {
            //                conn.Close();
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        intErrorCode = 50;
            //        ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
            //        throw ex;
            //    }
            //    return intErrorCode;
            //}

            #endregion [Revoke Account Assignmnet]
        }
    }
}
