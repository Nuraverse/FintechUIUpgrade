#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Transaction Approval
/// Created By			: M.saran
/// Created Date		: 
/// Purpose	            : To Approve the Approval Screens

/// <Program Summary>
#endregion

#region [Namespace]
using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
using System.Data.OracleClient;
#endregion [Namespace]

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubApproval
    {
        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;

        FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable objFA_TRANSACTION_AUTHDataTable;
        FA_BusEntity.FinancialAccounting.FATransactions.FA_Approval_HDRDataTable objFA_Approval_HDRDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubApproval(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region "Insert Approvals"
        public int FunPubInsertApproval(FASerializationMode SerMode, byte[] bytesobjFA_TRANSACTION_AUTHDataTable)
        {
            try
            {
                objFA_TRANSACTION_AUTHDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_TRANSACTION_AUTHDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHRow ObjFA_TRANSACTION_AUTHRow in objFA_TRANSACTION_AUTHDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Insert_Approvals");

                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Company_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Location_ID);
                    db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Header_ID);
                    db.AddInParameter(command, "@Tran_Auth_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Auth_ID);
                    db.AddInParameter(command, "@Tran_Type", DbType.String, ObjFA_TRANSACTION_AUTHRow.Tran_Type);
                    db.AddInParameter(command, "@Auth_Seq_No", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_Sequence_No);
                    db.AddInParameter(command, "@Total_No_Approval", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Total_No_Approval);
                    db.AddInParameter(command, "@Auth_Status", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_Status);
                    db.AddInParameter(command, "@Auth_User_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_User_ID);
                    db.AddInParameter(command, "@Remarks", DbType.String, ObjFA_TRANSACTION_AUTHRow.Remarks);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));

                }


                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                        if ((int)command.Parameters["@ReturnTranValue"].Value > 0)
                        {
                            throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intRowsAffected == 0)
                            intRowsAffected = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intRowsAffected;
        }



        public int FunPubCommonCreateApprovals(FASerializationMode SerMode, byte[] bytesobjFA_TRANSACTION_AUTHDataTable, out string strTran_RefNO, out string strErrorMsg)
        {
            strTran_RefNO = string.Empty;
            strErrorMsg = string.Empty;
            FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
            try
            {
                objFA_TRANSACTION_AUTHDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_TRANSACTION_AUTHDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable));
                DbCommand command = db.GetStoredProcCommand("FA_LAD_TRAN_COMMON_INS_APPR");
                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHRow ObjFA_TRANSACTION_AUTHRow in objFA_TRANSACTION_AUTHDataTable.Rows)
                {

                   
                    if (!ObjFA_TRANSACTION_AUTHRow.IsLocation_IDNull())
                    {
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Location_ID);
                    }
                    //if (!ObjFA_TRANSACTION_AUTHRow.IsApproval_IDNull())
                    //{
                    //    db.AddInParameter(command, "@Approval_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Approval_ID);
                    //}
                    db.AddInParameter(command, "@Tran_Type", DbType.String, ObjFA_TRANSACTION_AUTHRow.Tran_Type);
                   
                    //db.AddInParameter(command, "@Task_Status_Type_Code", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Task_Status_Type_Code);
                    //db.AddInParameter(command, "@Task_Status_Code", DbType.String, ObjFA_TRANSACTION_AUTHRow.Task_Status_Code);
                    //if (!ObjFA_TRANSACTION_AUTHRow.IsTask_StatusDateNull())
                    //{
                    //    db.AddInParameter(command, "@TASK_STATUSDATE", DbType.String, ObjFA_TRANSACTION_AUTHRow.Task_StatusDate);
                    //}
                  
                   
                    
                    db.AddInParameter(command, "@Company_ID", DbType.String, ObjFA_TRANSACTION_AUTHRow.Company_ID);
                    db.AddInParameter(command, "@ACTION_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Action);
                   
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_User_ID);
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjFA_TRANSACTION_AUTHRow.XML_ApprovalDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XML_ApprovalDetails",
                                 OracleType.Clob, ObjFA_TRANSACTION_AUTHRow.XML_ApprovalDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjFA_TRANSACTION_AUTHRow.XML_ApprovalDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_ApprovalDetails", DbType.String, ObjFA_TRANSACTION_AUTHRow.XML_ApprovalDetails);
                    }
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
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
                                if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                                {
                                    strErrorMsg = "";
                                }
                                else
                                    strErrorMsg = Convert.ToString(command.Parameters["@ErrorMsg"].Value);

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
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);

                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 20;
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
            return intRowsAffected;
        }


        public int FunPubCommonRevokeApprovals(FASerializationMode SerMode, byte[] bytesobjFA_TRANSACTION_AUTHDataTable, out string strExceptionMessage)
        {
            strExceptionMessage = string.Empty;
            FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
            try
            {
                objFA_TRANSACTION_AUTHDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_TRANSACTION_AUTHDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHRow ObjRevokeRow in objFA_TRANSACTION_AUTHDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_LAD_TRAN_COMMON_REVOKE");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRevokeRow.Company_ID);
                    db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjRevokeRow.Auth_User_ID);

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjRevokeRow.XML_ApprovalDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XML_TRAN_DETAILS",
                                 OracleType.Clob, ObjRevokeRow.XML_ApprovalDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjRevokeRow.XML_ApprovalDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_TRAN_DETAILS", DbType.String, ObjRevokeRow.XML_ApprovalDetails);
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
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);

                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 20;
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            }
            return intRowsAffected;
        }
        #endregion

        #region "Revoke"
        public int FunPubRevokeOrUpdateApprovedDetails(FASerializationMode SerMode, byte[] bytesobjFA_TRANSACTION_AUTHDataTable)
        {
            try
            {
                objFA_TRANSACTION_AUTHDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_TRANSACTION_AUTHDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHRow ObjFA_TRANSACTION_AUTHRow in objFA_TRANSACTION_AUTHDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Revoke_Approval");

                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Company_ID);
                    db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Header_ID);
                    db.AddInParameter(command, "@Tran_Auth_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Auth_ID);
                    db.AddInParameter(command, "@Tran_Type", DbType.String, ObjFA_TRANSACTION_AUTHRow.Tran_Type);
                    db.AddInParameter(command, "@Auth_Seq_No", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_Sequence_No);
                    db.AddInParameter(command, "@Total_No_Approval", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Total_No_Approval);
                    db.AddInParameter(command, "@Is_Revoke", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Is_Revoke);
                    db.AddInParameter(command, "@Auth_User_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_User_ID);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));

                }


                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                        if ((int)command.Parameters["@ReturnTranValue"].Value > 0)
                        {
                            throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intRowsAffected == 0)
                            intRowsAffected = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intRowsAffected;
        }
        
        #endregion


     

    }
}
