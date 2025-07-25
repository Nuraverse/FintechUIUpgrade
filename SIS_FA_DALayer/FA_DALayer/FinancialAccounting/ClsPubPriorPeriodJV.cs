
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Prior Period JV
/// Created By			: Muni Kavitha
/// Created Date		: 26-Mar-2012
/// Purpose	            : DAL Class for Prior Period JV
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
   public class ClsPubPriorPeriodJV
    {
        #region Initialization

            int intErrorCode, int_OutResult, intRowsAffected;
            //int int_OutResult;
            //int intRowsAffected;
            string strConnection = string.Empty;
            FA_BusEntity .FinancialAccounting .FATransactions .FA_TRANSACTION_HEADERDataTable objFA_PPJV_HDR_DTB;
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable objFA_TRANSACTION_AUTHDataTable;

            //Code added for getting common connection string from config file
            Database db;
            public ClsPubPriorPeriodJV(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion


            #region Insert/Update Prior Period JV Details

            /// <summary>
            /// Insert/Update Prior Period JV Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesobjFA_PPJV_HDR_DTB"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubInsertPriorPeriodJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName, out int intPP_JV_ID, out string strDocNo)
            {
                strDocNo = "";
                try
                {
                    intPP_JV_ID = intErrorCode = 0;
                    objFA_PPJV_HDR_DTB = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_PPJV_HDR_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
                    DbCommand command = null;
                    foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow  objFAPPJV_Header_Row in objFA_PPJV_HDR_DTB.Rows)
                    {
                        if (objFAPPJV_Header_Row.Option == 1)
                            command = db.GetStoredProcCommand(SPNames.InsertPPJV);
                        else if (objFAPPJV_Header_Row.Option == 2)
                            command = db.GetStoredProcCommand(SPNames.UpdatePPJV);
                        
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFAPPJV_Header_Row.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFAPPJV_Header_Row.User_ID);
                        if (objFAPPJV_Header_Row.Tran_Header_ID > 0)
                        {
                            db.AddInParameter(command, "@PP_JV_ID", DbType.Int64, objFAPPJV_Header_Row.Tran_Header_ID);
                            //db.AddInParameter(command, "@Link_Key", DbType.Int64, objFAPPJV_Header_Row.Link_Key);
                        }

                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objFAPPJV_Header_Row.Location_ID );
                       // if(objFAPPJV_Header_Row.Location_Code !=null )
                        //db.AddInParameter(command, "@Location_Code", DbType.String, objFAPPJV_Header_Row.Location_Code);

                        db.AddInParameter(command, "@Activity", DbType.Int32, objFAPPJV_Header_Row.Activity);
                        db.AddInParameter(command, "@Tran_Type", DbType.String, objFAPPJV_Header_Row.Tran_Type);

                        if (objFAPPJV_Header_Row.Document_No != null)
                        {
                            db.AddInParameter(command, "@Document_No", DbType.String, objFAPPJV_Header_Row.Document_No);
                        }
                        db.AddInParameter(command, "@Document_Date", DbType.DateTime , objFAPPJV_Header_Row.Document_Date);
                        db.AddInParameter(command, "@Value_Date", DbType.DateTime, objFAPPJV_Header_Row.Value_Date);

                        db.AddInParameter(command, "@Auth_Status", DbType.String, objFAPPJV_Header_Row.Auth_Status);
                       // db.AddInParameter(command, "@Auth_Status_Lookup", DbType.Int32, objFAPPJV_Header_Row.Auth_Status_Lookup);
                        //db.AddInParameter(command, "@Auth_Status_ID", DbType.String, objFAPPJV_Header_Row.Auth_Status_ID);
                        //db.AddInParameter(command, "@Document_Type", DbType.String, objFAPPJV_Header_Row.Document_Type);

                        //db.AddInParameter(command, "@EntityType_Lookup", DbType.Int32, objFAPPJV_Header_Row.EntityType_Lookup );
                        //db.AddInParameter(command, "@Entity_Type", DbType.Int32, objFAPPJV_Header_Row.Entity_Type );
                        //db.AddInParameter(command, "@Entity_ID", DbType.Int32, objFAPPJV_Header_Row.Entity_ID );
                        //db.AddInParameter(command, "@Party_Code", DbType.String, objFAPPJV_Header_Row.Party_Code);
                        
                        //db.AddInParameter(command, "@Mode", DbType.String, objFAPPJV_Header_Row.Mode);
                        //db.AddInParameter(command, "@Mode_Lookup", DbType.Int32, objFAPPJV_Header_Row.Mode_Lookup);
                        //db.AddInParameter(command, "@Mode_ID", DbType.Int32, objFAPPJV_Header_Row.Mode_ID);

                        //db.AddInParameter(command, "@Tran_Currency_Code", DbType.String, objFAPPJV_Header_Row.Tran_Currency_Code);
                        //db.AddInParameter(command, "@Tran_Currency_ID", DbType.Int32, objFAPPJV_Header_Row.Tran_Currency_ID);
                        db.AddInParameter(command, "@Tran_Currency_Amount", DbType.Decimal , objFAPPJV_Header_Row.Tran_Currency_Amount);
                        db.AddInParameter(command, "@Def_Currency_Amount", DbType.Decimal, objFAPPJV_Header_Row.Def_Currency_Amount);
                        //db.AddInParameter(command, "@Document_Status", DbType.String, objFAPPJV_Header_Row.Document_Status);
                        //db.AddInParameter(command, "@Document_Update_Status", DbType.String, objFAPPJV_Header_Row.Document_Update_Status);

                        db.AddInParameter(command, "@Dim1", DbType.String, objFAPPJV_Header_Row.Dim1);
                        db.AddInParameter(command, "@Dim2", DbType.String, objFAPPJV_Header_Row.Dim2);
                        db.AddInParameter(command, "@Dim3", DbType.String, objFAPPJV_Header_Row.Dim3);

                        //db.AddInParameter(command, "@From_Date", DbType.DateTime, objFAPPJV_Header_Row.From_Date);
                        //db.AddInParameter(command, "@To_Date", DbType.DateTime, objFAPPJV_Header_Row.To_Date);
                        
                        db.AddInParameter(command, "@Print_Count", DbType.Int32, objFAPPJV_Header_Row.Print_Count);
                        //db.AddInParameter(command, "@Cross_Ref", DbType.String, objFAPPJV_Header_Row.Cross_Ref);
                        //db.AddInParameter(command, "@Paid_Status", DbType.String, objFAPPJV_Header_Row.Paid_Status);
                        //db.AddInParameter(command, "@Transaction_Date", DbType.DateTime, objFAPPJV_Header_Row.Transaction_Date);

                        db.AddInParameter(command, "@XML_Tran_MG", DbType.String, objFAPPJV_Header_Row.XML_Tran_MG);
                        //db.AddInParameter(command, "@XML_Tran_AL", DbType.String, objFAPPJV_Header_Row.XML_Tran_AL);
                        //db.AddInParameter(command, "@XML_Tran_BANK", DbType.String, objFAPPJV_Header_Row.XML_Tran_BANK);
                        //db.AddInParameter(command, "@XML_Tran_AUTH", DbType.String, objFAPPJV_Header_Row.XML_Tran_AUTH);
                        //db.AddInParameter(command, "@XML_Tran_OTH", DbType.String, objFAPPJV_Header_Row.XML_Tran_OTH);

                        db.AddInParameter(command, "@Option", DbType.Int32, objFAPPJV_Header_Row.Option);

                        db.AddOutParameter(command, "@OutPP_JV_ID", DbType.Int64, sizeof(Int64));
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
                                     int_OutResult =(int)command.Parameters["@ErrorCode"].Value;
                                     throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                    if ((int)command.Parameters["@OutResult"].Value > 0)
                                        int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                    intPP_JV_ID = Convert.ToInt32(command.Parameters["@OutPP_JV_ID"].Value);
                                    strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);

                                }
                            }
                            catch (Exception ex)
                            {
                                //if (intErrorCode == 0)
                              //  int_OutResult = 50;
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
                    //int_OutResult = 50;
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    throw ex;
                }
                return int_OutResult;
            }
            #endregion

            #region Cancel PPJV Details

            /// <summary>
            /// Insert/Update PPJV Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesobjFA_PPJV_HDR_DTB"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCancelPPJV(FASerializationMode SerMode, byte[] bytesobjFA_PPJV_HDR_DTB, string strConnectionName)
            {
                try
                {
                    intErrorCode = 0;
                    objFA_PPJV_HDR_DTB = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_PPJV_HDR_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
                    DbCommand command = null;
                    foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow objFAPPJV_Header_Row in objFA_PPJV_HDR_DTB.Rows)
                    {
                        command = db.GetStoredProcCommand(SPNames.CancelPPJV);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFAPPJV_Header_Row.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFAPPJV_Header_Row.User_ID);
                        db.AddInParameter(command, "@PP_JV_ID", DbType.Int64, objFAPPJV_Header_Row.Tran_Header_ID);
                        db.AddInParameter(command, "@Fin_Year", DbType.String, objFAPPJV_Header_Row.Dim3);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);

                                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;

                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                                }
                                else
                                {
                                    int_OutResult = (int)command.Parameters["@OutResult"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                //if (int_OutResult == 0)
                                  //  int_OutResult = 50;
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
                   // int_OutResult = 50;
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    throw ex;
                }
                return int_OutResult;
            }
            #endregion

            #region "Insert PPJV Approvals"
            public int FunPubInsertPPJVApproval(FASerializationMode SerMode, byte[] bytesobjFA_TRANSACTION_AUTHDataTable, string strConnectionName, out string strDocNo)
            {

                strDocNo = "";
                try
                {
                    objFA_TRANSACTION_AUTHDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_TRANSACTION_AUTHDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHDataTable));
                    DbCommand command = null;

                    foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_AUTHRow ObjFA_TRANSACTION_AUTHRow in objFA_TRANSACTION_AUTHDataTable.Rows)
                    {
                        command = db.GetStoredProcCommand(SPNames.InsertPPJVApproval);

                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Company_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Location_ID);
                        db.AddInParameter(command, "@PP_JV_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Header_ID);
                        db.AddInParameter(command, "@PP_JV_Auth_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Tran_Auth_ID);
                        db.AddInParameter(command, "@Tran_Type", DbType.String, ObjFA_TRANSACTION_AUTHRow.Tran_Type);
                        db.AddInParameter(command, "@Auth_Sequence_No", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_Sequence_No);
                        //db.AddInParameter(command, "@Total_No_Approval", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Total_No_Approval);
                        db.AddInParameter(command, "@Auth_Status", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_Status);
                        db.AddInParameter(command, "@Auth_User_ID", DbType.Int32, ObjFA_TRANSACTION_AUTHRow.Auth_User_ID);
                        db.AddInParameter(command, "@Remarks", DbType.String, ObjFA_TRANSACTION_AUTHRow.Remarks);
                        db.AddInParameter(command, "@Is_Revoke", DbType.String, ObjFA_TRANSACTION_AUTHRow.Is_Revoke);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

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
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intRowsAffected == 0)
                            //    intRowsAffected = 50;
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
                catch (Exception ex)
                {
                    //intRowsAffected = 50;
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    throw ex;
                }
                return intRowsAffected;
            }
            #endregion




    }
}
