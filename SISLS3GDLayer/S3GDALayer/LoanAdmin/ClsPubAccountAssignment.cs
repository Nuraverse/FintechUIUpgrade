
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
#endregion

namespace S3GDALayer.LoanAdmin
{
    namespace LoanAdminAccMgtServices
    {
        public class ClsPubAccountAssignment
        {
            #region [Initialization]

            int intErrorCode;
            //int intRowsAffected;
            Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable ObjAccountAssignmtDataTable_DAL = null;
            Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtRow ObjAccountAssignmtRow = null;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubAccountAssignment()
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
            public int FunPubAccountAssignmtCreate(SerializationMode SerMode, byte[] bytesObjAccountAssignmtDataTable, string strMode, out string strErrMsg, out string strAssNo)
            {
                strErrMsg = string.Empty;
                strAssNo = string.Empty;
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_LA_INSUPD_ACC_ASSIGNMT");

                    ObjAccountAssignmtDataTable_DAL = (Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable)ClsPubSerialize.DeSerialize(bytesObjAccountAssignmtDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable));
                    ObjAccountAssignmtRow = ObjAccountAssignmtDataTable_DAL.Rows[0] as Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtRow;

                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccountAssignmtRow.COMPANY_ID);
                    if (!ObjAccountAssignmtRow.IsLOB_IDNull())
                    {
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjAccountAssignmtRow.LOB_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsLOCATION_IDNull())
                    {
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, ObjAccountAssignmtRow.LOCATION_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsPRICING_IDNull())
                    {
                        db.AddInParameter(command, "@Pricing_Id", DbType.Int32, ObjAccountAssignmtRow.PRICING_ID);
                    }
                    db.AddInParameter(command, "@Pasaref_Id", DbType.Int32, ObjAccountAssignmtRow.PASAREF_ID);
                    if (!ObjAccountAssignmtRow.IsACC_ASSIGNMENT_NONull())
                    {
                        db.AddInParameter(command, "@Acc_Assignment_No", DbType.String, ObjAccountAssignmtRow.ACC_ASSIGNMENT_NO);
                    }
                    if (!ObjAccountAssignmtRow.IsACC_ASSIGNMENT_IDNull())
                    {
                        db.AddInParameter(command, "@Acc_Assignment_Id", DbType.Int32, ObjAccountAssignmtRow.ACC_ASSIGNMENT_ID);
                    }
                    if (!ObjAccountAssignmtRow.IsASSIGNMENT_DATENull())
                    {
                        db.AddInParameter(command, "@Assignment_Date", DbType.DateTime, ObjAccountAssignmtRow.ASSIGNMENT_DATE);
                    }
                    db.AddInParameter(command, "@Assignor_Id", DbType.Int32, ObjAccountAssignmtRow.ASSIGNOR_ID);
                    db.AddInParameter(command, "@Assignee_Id", DbType.Int32, ObjAccountAssignmtRow.ASSIGNEE_ID);
                    db.AddInParameter(command, "@Assignment_Charges", DbType.Decimal, ObjAccountAssignmtRow.ASSIGNMENT_CHARGES);
                    db.AddInParameter(command, "@Remarks", DbType.String, ObjAccountAssignmtRow.REMARKS);
                    if (!ObjAccountAssignmtRow.IsIS_INDORSEMENT_DONENull())
                    {
                        db.AddInParameter(command, "@Is_Indorsement_Done", DbType.String, ObjAccountAssignmtRow.IS_INDORSEMENT_DONE);
                    }
                    if (!ObjAccountAssignmtRow.IsCREATED_BYNull())
                    {
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjAccountAssignmtRow.CREATED_BY);
                    }
                    if (!ObjAccountAssignmtRow.IsMODIFIED_BYNull())
                    {
                        db.AddInParameter(command, "@Modified_By", DbType.String, ObjAccountAssignmtRow.MODIFIED_BY);
                    }
                    if (!ObjAccountAssignmtRow.IsXML_Guarantor_DetNull())
                    {
                        db.AddInParameter(command, "@Xml_Guarantor", DbType.String, ObjAccountAssignmtRow.XML_Guarantor_Det);
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
            public int FunPubRevokeAccountAssignment(SerializationMode SerMode, byte[] bytesObjAccountAssignmtDataTable)
            {
                int intErrorCode = 0;
                try
                {
                    ObjAccountAssignmtDataTable_DAL = (Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable)ClsPubSerialize.DeSerialize(bytesObjAccountAssignmtDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtDataTable));
                    ObjAccountAssignmtRow = ObjAccountAssignmtDataTable_DAL.Rows[0] as Entity_LoanAdmin.LoanAdminAccMgtServices.S3g_Lad_AccassignmtRow;

                    DbCommand command = db.GetStoredProcCommand("S3G_CLN_REVOKE_ACCASSIGNMT");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccountAssignmtRow.COMPANY_ID);
                    db.AddInParameter(command, "@Acc_Assignment_Id", DbType.Int32, ObjAccountAssignmtRow.ACC_ASSIGNMENT_ID);
                    db.AddInParameter(command, "@UserId", DbType.Int32, ObjAccountAssignmtRow.CREATED_BY);
                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ERRORCODE"].Value != 0)
                            {
                                intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
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
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intErrorCode;
            }

            #endregion [Revoke Account Assignmnet]
        }
    }
}
