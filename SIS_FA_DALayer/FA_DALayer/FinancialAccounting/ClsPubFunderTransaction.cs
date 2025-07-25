
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Funder Transaction 
/// Created By			: Muni Kavitha
/// Created Date		: 8-Feb-2012
/// Purpose	            : DAL Class for Funder Transaction
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
#endregion


namespace FA_DALayer.FinancialAccounting
{
   public class ClsPubFunderTransaction
    {
        #region Initialization
            int intErrorCode;
            int int_OutResult;
            string strConnection = string.Empty;
       FA_BusEntity .FinancialAccounting .FunderInvestment.FA_FUNDER_TRAN_MSTDataTable objFunderTransaction_DTB;
       //FA_BusEntity .FinancialAccounting .FunderInvestment.FA_FUNDER_TRAN_MSTRow objFunderTransactionRow;

            //Code added for getting common connection string from config file
            Database db;
            public ClsPubFunderTransaction(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion


            #region Insert/Update Funder Transaction Details

            /// <summary>
            /// Insert/Update Funder Transaction Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesobjFunderTransaction_DTB"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubInsertFunderTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTransaction_DTB, string strConnectionName, out int intFund_Tran_ID, out string strDocNo)
            {
                strDocNo = "";
                try
                {
                    intFund_Tran_ID = intErrorCode = 0;
                    objFunderTransaction_DTB = (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_TRAN_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjFunderTransaction_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_TRAN_MSTDataTable));
                    DbCommand command = null;
                    foreach (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_TRAN_MSTRow objFunderTransactionRow in objFunderTransaction_DTB.Rows)
                    {
                        if (objFunderTransactionRow.Option == 1)
                            command = db.GetStoredProcCommand(SPNames.InsertFunderTransaction);
                        else if (objFunderTransactionRow.Option == 2)
                            command = db.GetStoredProcCommand(SPNames.UpdateFunderTransaction);

                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFunderTransactionRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFunderTransactionRow.User_ID);
                        if (objFunderTransactionRow.Funder_Tran_ID > 0)
                            db.AddInParameter(command, "@Funder_Tran_ID", DbType.Int32, objFunderTransactionRow.Funder_Tran_ID);
                        db.AddInParameter(command, "@Funder_ID", DbType.Int32, objFunderTransactionRow.Funder_ID);
                        db.AddInParameter(command, "@Funder_Tran_No", DbType.String, objFunderTransactionRow.Funder_Tran_No);
                        db.AddInParameter(command, "@Fund_Type", DbType.String, objFunderTransactionRow.Fund_Type);
                        db.AddInParameter(command, "@Commitment_Amt", DbType.Decimal, objFunderTransactionRow.Commitment_Amt);
                        db.AddInParameter(command, "@Tenure", DbType.Int32, objFunderTransactionRow.Tenure);

                        db.AddInParameter(command, "@Validity_Date", DbType.DateTime, objFunderTransactionRow.Validity_Date);
                        db.AddInParameter(command, "@Currency_Code", DbType.Int32, objFunderTransactionRow.Currency_Code);
                        db.AddInParameter(command, "@Option", DbType.Int32, objFunderTransactionRow.Option);
                        db.AddInParameter(command, "@XML_Tran_DTL", DbType.String, objFunderTransactionRow.XML_Tran_DTL);
                        db.AddInParameter(command, "@XML_Tran_DTL1", DbType.String, objFunderTransactionRow.XML_Tran_DTL1);

                        db.AddOutParameter(command, "@OutFund_Tran_ID", DbType.Int32, sizeof(Int32));
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
                                    intFund_Tran_ID = Convert.ToInt32(command.Parameters["@OutFund_Tran_ID"].Value);
                                    strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                }
                            }
                            catch (Exception ex)
                            {
                                //if (intErrorCode == 0)
                                //    intErrorCode = 50;
                                FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                                trans.Rollback();
                            }
                            finally
                            { conn.Close(); }
                        }
                    }
                }
                catch (Exception ex)
                {
                    //intErrorCode = 50;
                    FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    throw ex;
                }
                return int_OutResult;
            }
            #endregion

    }
}
