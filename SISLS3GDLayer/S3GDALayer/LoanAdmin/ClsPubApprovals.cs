using System;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ORG = S3GBusEntity.Origination;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using System.Data;
using System.Data.OracleClient;

namespace S3GDALayer.LoanAdmin
{
    namespace ApprovalMgtServices
    {
        public class ClsPubApprovals
        {

            int intRowsAffected = 0;

            S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_ApprovalDataTable ObjS3G_ORG_Approval_DataTable;
            S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_SUBLMTAPPRDataTable ObjS3G_ORG_SubLimitApproval_DataTable;
            S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_Approval_HDRDataTable ObjS3G_ORG_Approval_HdrDataTable;
            S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LAD_REVOKE_APVLDataTable ObjS3G_ORG_Revoke_HdrDataTable;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubApprovals()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateApprovals(SerializationMode SerMode, byte[] bytesApproval_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {

                    ObjS3G_ORG_Approval_DataTable = (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_ApprovalDataTable)ClsPubSerialize.DeSerialize(bytesApproval_Datatable, SerMode, typeof(S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_ApprovalDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertApproval");
                    foreach (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_ApprovalRow ObjApprovalRow in ObjS3G_ORG_Approval_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApprovalRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjApprovalRow.Branch_ID);
                        db.AddInParameter(command, "@Approval_ID", DbType.Int32, ObjApprovalRow.Approval_ID);
                        db.AddInParameter(command, "@Task_Number", DbType.String, ObjApprovalRow.Task_Number);
                        db.AddInParameter(command, "@Task_Type", DbType.String, ObjApprovalRow.Task_Type);
                        db.AddInParameter(command, "@Task_Status_Type_Code", DbType.Int32, ObjApprovalRow.Task_Status_Type_Code);
                        db.AddInParameter(command, "@Task_Status_Code", DbType.String, ObjApprovalRow.Task_Status_Code);
                        if (!ObjApprovalRow.IsTask_StatusDateNull())
                        {
                            db.AddInParameter(command, "@TASK_STATUSDATE", DbType.String, ObjApprovalRow.Task_StatusDate);
                        }
                        db.AddInParameter(command, "@Approval_Serial_Number", DbType.String, ObjApprovalRow.Task_Approval_Serialvalue);
                        db.AddInParameter(command, "@Remarks", DbType.String, ObjApprovalRow.Remarks);
                        db.AddInParameter(command, "@Password", DbType.String, ObjApprovalRow.Password);
                        db.AddInParameter(command, "@Company_ID", DbType.String, ObjApprovalRow.Company_ID);
                        if (!ObjApprovalRow.IsImage_PathNull())
                        {
                            db.AddInParameter(command, "@Image_Path", DbType.String, ObjApprovalRow.Image_Path);
                        }
                        if (!ObjApprovalRow.IsIs_MobileNull())
                        {
                            db.AddInParameter(command, "@Is_mobile", DbType.String, ObjApprovalRow.Is_Mobile);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApprovalRow.Created_By);

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@ErrorMsg", DbType.String, 500);//Journal
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                // Roll back the transaction. 
                                // To identify if journal entry is failed
                                //7466 Start
                                //@ Param will not read in Oracle , so commented this 
                                //if (command.Parameters["@ErrorCode"].Value != null)
                                //{
                                //    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                //    strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                //}
                                //else
                                //{
                                //    intRowsAffected = 20;
                                //}
                                //7466 End
                                intRowsAffected = 20;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
            
            public int FunPubCreateSubLimitApprovals(SerializationMode SerMode, byte[] bytesApproval_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {

                    ObjS3G_ORG_SubLimitApproval_DataTable = (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_SUBLMTAPPRDataTable)ClsPubSerialize.DeSerialize(bytesApproval_Datatable, SerMode, typeof(S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_SUBLMTAPPRDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertApproval");
                    foreach (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_SUBLMTAPPRRow ObjApprovalRow in ObjS3G_ORG_SubLimitApproval_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApprovalRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjApprovalRow.Branch_ID);
                        db.AddInParameter(command, "@Approval_ID", DbType.Int32, ObjApprovalRow.Approval_ID);
                        db.AddInParameter(command, "@Task_Number", DbType.String, ObjApprovalRow.Task_Number);
                        db.AddInParameter(command, "@Task_Type", DbType.String, ObjApprovalRow.Task_Type);
                        db.AddInParameter(command, "@Task_Status_Type_Code", DbType.Int32, ObjApprovalRow.Task_Status_Type_Code);
                        db.AddInParameter(command, "@Task_Status_Code", DbType.String, ObjApprovalRow.Task_Status_Code);
                        db.AddInParameter(command, "@Approval_Serial_Number", DbType.String, ObjApprovalRow.Task_Approval_Serialvalue);
                        db.AddInParameter(command, "@Remarks", DbType.String, ObjApprovalRow.Remarks);
                        db.AddInParameter(command, "@Password", DbType.String, ObjApprovalRow.Password);
                        db.AddInParameter(command, "@Company_ID", DbType.String, ObjApprovalRow.Company_ID);
                        db.AddInParameter(command, "@CustomerId", DbType.String, ObjApprovalRow.Customer_ID);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApprovalRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@ErrorMsg", DbType.String, 500);//Journal
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                // Roll back the transaction. 
                                // To identify if journal entry is failed
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                }
                                else
                                {
                                    intRowsAffected = 20;
                                }
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
            
            public int FunPubRevokeOrUpdateApprovedDetails(Dictionary<string, string> dicParam)
            {
                int intRowsAffected = 0;
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_RevokeApproval");
                try
                {
                    foreach (KeyValuePair<string, string> Param in dicParam)
                    {
                        db.AddInParameter(command, Param.Key, DbType.String, Param.Value);
                    }

                    db.AddOutParameter(command, "@Result", DbType.Int32, sizeof(Int32));

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@Result"].Value > 0)
                                intRowsAffected = (int)command.Parameters["@Result"].Value;
                            if (intRowsAffected == 0)
                                trans.Commit();
                            else
                                trans.Rollback();

                        }
                        catch (Exception ex)
                        {
                            // Roll back the transaction. 
                            intRowsAffected = 50;
                            trans.Rollback();
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return intRowsAffected;
            }
            //Created By : Anbuvel,Date : 25-MAy-2018, Description: Transaction Approval for Common for all Screens
            public int FunPubCommonCreateApprovals(SerializationMode SerMode, byte[] bytesApproval_Datatable, out string strTran_RefNO)
            {
                strTran_RefNO = string.Empty;
                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                try
                {
                    ObjS3G_ORG_Approval_HdrDataTable = (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_Approval_HDRDataTable)ClsPubSerialize.DeSerialize(bytesApproval_Datatable, SerMode, typeof(S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_Approval_HDRDataTable));
                    DbCommand command = db.GetStoredProcCommand("S3G_LAD_TRAN_COMMON_INS_APPR");
                    foreach (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LOANAD_Approval_HDRRow ObjApprovalRow in ObjS3G_ORG_Approval_HdrDataTable.Rows)
                    {
                        if (!ObjApprovalRow.IsLOB_IDNull())
                        {
                            db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApprovalRow.LOB_ID);
                        }
                        if (!ObjApprovalRow.IsLocation_IDNull())
                        {
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjApprovalRow.Location_ID);
                        }
                        if (!ObjApprovalRow.IsApproval_IDNull())
                        {
                            db.AddInParameter(command, "@Approval_ID", DbType.Int32, ObjApprovalRow.Approval_ID);
                        }
                        db.AddInParameter(command, "@Task_Number", DbType.String, ObjApprovalRow.Task_Number);
                        db.AddInParameter(command, "@Task_Type", DbType.String, ObjApprovalRow.Task_Type);
                        db.AddInParameter(command, "@Task_Status_Type_Code", DbType.Int32, ObjApprovalRow.Task_Status_Type_Code);
                        db.AddInParameter(command, "@Task_Status_Code", DbType.String, ObjApprovalRow.Task_Status_Code);
                        if (!ObjApprovalRow.IsTask_StatusDateNull())
                        {
                            db.AddInParameter(command, "@TASK_STATUSDATE", DbType.String, ObjApprovalRow.Task_StatusDate);
                        }
                        db.AddInParameter(command, "@Approval_Serial_Number", DbType.String, ObjApprovalRow.Task_Approval_Serialvalue);
                        db.AddInParameter(command, "@Remarks", DbType.String, ObjApprovalRow.REMARKS);
                        db.AddInParameter(command, "@Password", DbType.String, ObjApprovalRow.Password);
                        db.AddInParameter(command, "@Company_ID", DbType.String, ObjApprovalRow.Company_ID);
                        db.AddInParameter(command, "@ACTION_ID", DbType.Int32, ObjApprovalRow.Action);
                        if (!ObjApprovalRow.IsIMAGE_PATHNull())
                        {
                            db.AddInParameter(command, "@Image_Path", DbType.String, ObjApprovalRow.IMAGE_PATH);
                        }
                        if (!ObjApprovalRow.IsIS_MOBILENull())
                        {
                            db.AddInParameter(command, "@Is_mobile", DbType.String, ObjApprovalRow.IS_MOBILE);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApprovalRow.Created_By);

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            if (!string.IsNullOrEmpty(ObjApprovalRow.XML_ApprovalDetails))
                            {
                                OracleParameter param;
                                param = new OracleParameter("@XML_ApprovalDetails",
                                     OracleType.Clob, ObjApprovalRow.XML_ApprovalDetails.Length,
                                     ParameterDirection.Input, true, 0, 0, String.Empty,
                                      DataRowVersion.Default, ObjApprovalRow.XML_ApprovalDetails);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_ApprovalDetails", DbType.String, ObjApprovalRow.XML_ApprovalDetails);
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            if (!string.IsNullOrEmpty(ObjApprovalRow.XML_DeviationDtls))
                            {
                                OracleParameter param;
                                param = new OracleParameter("@XML_DeviationDetails",
                                     OracleType.Clob, ObjApprovalRow.XML_DeviationDtls.Length,
                                     ParameterDirection.Input, true, 0, 0, String.Empty,
                                      DataRowVersion.Default, ObjApprovalRow.XML_DeviationDtls);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_DeviationDetails", DbType.String, ObjApprovalRow.XML_DeviationDtls);
                        }

                        //Added on 06-Dec-2018 Starts here WRF Force Approval
                        db.AddInParameter(command, "@Is_ForceApproval", DbType.Int32, ObjApprovalRow.Is_ForceApproval);
                        //Added on 06-Dec-2018 Ends here

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@TASK_APPROVAL_NO", DbType.String, 500);//Journal
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    strTran_RefNO = (string)command.Parameters["@TASK_APPROVAL_NO"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                intRowsAffected = 20;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }


            //Added on 27-Sep-2018 Starts Here

            public int FunPubCommonRevokeApprovals(SerializationMode SerMode, byte[] bytesRevoke_Datatable, out string strExceptionMessage)
            {
                strExceptionMessage = string.Empty;
                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                try
                {
                    ObjS3G_ORG_Revoke_HdrDataTable = (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LAD_REVOKE_APVLDataTable)ClsPubSerialize.DeSerialize(bytesRevoke_Datatable, SerMode, typeof(S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LAD_REVOKE_APVLDataTable));
                    DbCommand command = db.GetStoredProcCommand("S3G_LAD_TRAN_COMMON_REVOKE");
                    foreach (S3GBusEntity.LoanAdmin.ApprovalMgtServices.S3G_LAD_REVOKE_APVLRow ObjRevokeRow in ObjS3G_ORG_Revoke_HdrDataTable.Rows)
                    {
                        db.AddInParameter(command, "@OPTION", DbType.Int32, ObjRevokeRow.Option);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRevokeRow.Company_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjRevokeRow.User_ID);

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            if (!string.IsNullOrEmpty(ObjRevokeRow.XML_RevokeDetails))
                            {
                                OracleParameter param;
                                param = new OracleParameter("@XML_TRAN_DETAILS",
                                     OracleType.Clob, ObjRevokeRow.XML_RevokeDetails.Length,
                                     ParameterDirection.Input, true, 0, 0, String.Empty,
                                      DataRowVersion.Default, ObjRevokeRow.XML_RevokeDetails);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_TRAN_DETAILS", DbType.String, ObjRevokeRow.XML_RevokeDetails);
                        }
                        db.AddOutParameter(command, "@RESULT", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@Exception_Message", DbType.String, 500);//Journal
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@RESULT"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@RESULT"].Value;
                                    strExceptionMessage = (string)command.Parameters["@Exception_Message"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                intRowsAffected = 20;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }

            //Added on 27-Sep-2018 Ends Here
        }
    }
}
