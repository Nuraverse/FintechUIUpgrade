#region PageHeader

/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Cheque Return Processing
/// Created By			: Tamilselvan.S
/// Created Date		: 03/04/2012
/// Purpose	            : To Create/Update and to retrive Cheque Return Processing details

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
#endregion [Namespace]

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubChequeReturnProcessing
    {
        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;

        FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable ObjTranHeaderDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubChequeReturnProcessing(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Cheque Return Process]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 03/04/2012
        /// for Cheque Return Processing details insert/update.
        public int FunPubInsertUpdateChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn, string strMode, int intUpdateOption)
        {
            int intOutPutValue = 0;
            ObjTranHeaderDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_ChequeReturn, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjHeaderTranRow = ObjTranHeaderDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdate_Cheque_Return);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjHeaderTranRow.Company_ID);
                db.AddInParameter(command, "@Page_Mode", DbType.String, strMode);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjHeaderTranRow.Location_ID);
                if (!ObjHeaderTranRow.IsTran_Header_IDNull())
                    db.AddInParameter(command, "@Document_Header_ID", DbType.Int64, ObjHeaderTranRow.Tran_Header_ID);
                if (!ObjHeaderTranRow.IsDocument_NoNull())
                    db.AddInParameter(command, "@Document_No", DbType.String, ObjHeaderTranRow.Document_No);
                db.AddInParameter(command, "@Receipt_No", DbType.String, ObjHeaderTranRow.Cross_Ref);
                db.AddInParameter(command, "@Bank_Charges", DbType.Decimal, ObjHeaderTranRow.Def_Currency_Amount);
                db.AddInParameter(command, "@Document_Date", DbType.DateTime, ObjHeaderTranRow.Document_Date);
                db.AddInParameter(command, "@Value_Date", DbType.DateTime, ObjHeaderTranRow.Value_Date);
                db.AddInParameter(command, "@CHR_Reasons", DbType.Int32, ObjHeaderTranRow.CHR_Reasons);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjHeaderTranRow.User_ID);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjHeaderTranRow.User_ID);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intOutPutValue = (int)command.Parameters["@ReturnOutput"].Value;
                        if ((int)command.Parameters["@ErrorValue"].Value > 0)
                        {
                            throw new Exception("Error thrown Error No" + intOutPutValue.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intOutPutValue == 0)
                            intOutPutValue = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception Ex)
            {
                intOutPutValue = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return intOutPutValue;
        }
        
        #endregion [Cheque Return Process]

        #region [Cheque Return Cancelling]

        public int FunPubCancelChequeReturnProcessing(FASerializationMode SerMode, byte[] byteObjFA_ChequeReturn)
        {
            int intOutPutValue = 0;
            ObjTranHeaderDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_ChequeReturn, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjHeaderTranRow = ObjTranHeaderDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.Cancel_Cheque_Return_Processing);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjHeaderTranRow.Company_ID);
                db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, ObjHeaderTranRow.Tran_Header_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjHeaderTranRow.User_ID);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intOutPutValue = (int)command.Parameters["@ReturnOutput"].Value;
                        if ((int)command.Parameters["@ErrorValue"].Value > 0)
                        {
                            throw new Exception("Error thrown Error No" + intOutPutValue.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intOutPutValue == 0)
                            intOutPutValue = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception Ex)
            {
                intOutPutValue = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return intOutPutValue;
        }

        #endregion [Cheque Return Cancelling]
    }
}
