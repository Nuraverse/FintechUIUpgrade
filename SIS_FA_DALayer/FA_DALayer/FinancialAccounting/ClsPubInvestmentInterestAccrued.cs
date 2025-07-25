#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Investment Interest Accrued
/// Created By			: Tamilselvan.S
/// Created Date		: 10/04/2012
/// Purpose	            : To Create/Update and to retrive Investment Interest Accrued details

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
    public class ClsPubInvestmentInterestAccrued
    {
        #region [Initialization]
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable ObjInvestmentAccruedDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubInvestmentInterestAccrued(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Investment Investment Accrued]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 24/04/2012
        /// for Investment Interest Accrued details Post(insert/update).
        public int FunPubPostInvestmentInterestAccrued(FASerializationMode SerMode, byte[] byteObjFA_InvestmentAccrued, out int Inv_int_id, string strConnectionName, out string strDocNo)
        {
            strDocNo = "";
            //int intOutPutValue = 0;
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable dtInvestmentAccruedDataTable = new FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable();
            ObjInvestmentAccruedDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_InvestmentAccrued, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjInvestmentAccruedRow = ObjInvestmentAccruedDataTable[0];
            try
            {
                Inv_int_id = intErrorCode = 0;
                DbCommand command = db.GetStoredProcCommand(SPNames.Post_Investment_Interest_Accrued);
                if (!ObjInvestmentAccruedRow.IsTran_Header_IDNull())
                    db.AddInParameter(command, "@Tran_Header_ID", DbType.Int64, ObjInvestmentAccruedRow.Tran_Header_ID);
                if (!ObjInvestmentAccruedRow.IsDocument_NoNull())
                    db.AddInParameter(command, "@Document_No", DbType.String, ObjInvestmentAccruedRow.Document_No);
                db.AddInParameter(command, "@Document_Date", DbType.DateTime, ObjInvestmentAccruedRow.Document_Date);
                db.AddInParameter(command, "@Value_Date", DbType.DateTime, ObjInvestmentAccruedRow.Value_Date);
                db.AddInParameter(command, "@Activity", DbType.Int32, ObjInvestmentAccruedRow.Activity);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjInvestmentAccruedRow.Company_ID);
                db.AddInParameter(command, "@Tran_Currency_Code", DbType.String, ObjInvestmentAccruedRow.Tran_Currency_Code);
                db.AddInParameter(command, "@Tran_Currency_ID", DbType.Int32, ObjInvestmentAccruedRow.Tran_Currency_ID);
                db.AddInParameter(command, "@Tran_Currency_Amount", DbType.Decimal, ObjInvestmentAccruedRow.Tran_Currency_Amount);
                db.AddInParameter(command, "@Def_Currency_Amount", DbType.Decimal, ObjInvestmentAccruedRow.Def_Currency_Amount);
                //db.AddInParameter(command, "@Page_Mode", DbType.String, strMode);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjInvestmentAccruedRow.Location_ID);
                db.AddInParameter(command, "@Investment_Type", DbType.Int32, ObjInvestmentAccruedRow.Entity_Type);
                if (!ObjInvestmentAccruedRow.IsFrom_DateNull())
                db.AddInParameter(command, "@Last_Calculate_Date", DbType.DateTime, ObjInvestmentAccruedRow.From_Date);
                if (!ObjInvestmentAccruedRow.IsTo_DateNull())
                db.AddInParameter(command, "@Period_Ending_Date", DbType.DateTime, ObjInvestmentAccruedRow.To_Date);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjInvestmentAccruedRow.User_ID);
                if (!ObjInvestmentAccruedRow.IsXML_Tran_MGNull() || ObjInvestmentAccruedRow.XML_Tran_MG != string.Empty)
                    db.AddInParameter(command, "@XML_Invst_Accrued_Det", DbType.String, ObjInvestmentAccruedRow.XML_Tran_MG);
                db.AddOutParameter(command, "@outInterest_ID", DbType.Int64, sizeof(Int64));
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        //int_OutResult = (int)command.Parameters["@ReturnOutput"].Value;
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        {
                            int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                            throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                        }
                        else
                        {
                            trans.Commit();
                            if ((int)command.Parameters["@OutResult"].Value > 0)
                                int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                           Inv_int_id = Convert.ToInt32(command.Parameters["@outInterest_ID"].Value);
                            strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                        }
                    }
                    catch (Exception ex)
                    {
                        //if (intOutPutValue == 0)
                        //    intOutPutValue = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception Ex)
            {
                //intOutPutValue = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return int_OutResult;
        }


        #endregion [Investment Transaction]

        #region [Receipt Cancelling]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 24/04/2012
        /// To Cancel the Investment Interest Accrued details.
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_InvestmentAccrued"></param>
        /// <returns></returns>
        public int FunPubCancelInterestAccrued(FASerializationMode SerMode, byte[] byteObjFA_InvestmentAccrued)
        {
            int intOutPutValue = 0;
            //ObjTranHeaderDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_ReceiptProcessing, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            //FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjHeaderTranRow = ObjTranHeaderDataTable[0];
            //try
            //{
            //    DbCommand command = db.GetStoredProcCommand(SPNames.Receipt_Cancel);
            //    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjHeaderTranRow.Company_ID);
            //    db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, ObjHeaderTranRow.Tran_Header_ID);
            //    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjHeaderTranRow.User_ID);
            //    db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
            //    db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

            //    using (DbConnection conn = db.CreateConnection())
            //    {
            //        conn.Open();
            //        DbTransaction trans = conn.BeginTransaction();
            //        try
            //        {
            //            db.ExecuteNonQuery(command, trans);
            //            intOutPutValue = (int)command.Parameters["@ReturnOutput"].Value;
            //            if ((int)command.Parameters["@ErrorValue"].Value > 0)
            //            {
            //                throw new Exception("Error thrown Error No" + intOutPutValue.ToString());
            //            }
            //            else
            //            {
            //                trans.Commit();
            //            }
            //        }
            //        catch (Exception ex)
            //        {
            //            if (intOutPutValue == 0)
            //                intOutPutValue = 50;
            //              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            //            trans.Rollback();
            //        }
            //        finally
            //        { conn.Close(); }
            //    }
            //}
            //catch (Exception Ex)
            //{
            //    intOutPutValue = 50;
            //      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            //    throw Ex;
            //}
            return intOutPutValue;
        }

        #endregion [Receipt Cancelling]
    }
}
