#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Debit Credit Note
/// Created By			: JeyaGomathi M
/// Created Date		: 13-Mar-2012
/// Purpose	            : DAL Class for Debit Credit Note
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion



using System;
using System.Data;
using FA_DALayer.FA_SysAdmin;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;


namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubDebitCreditNote
    {
      #region Initialization
            int intErrorCode;
            int int_OutResult;
            string strConnection = string.Empty;
            FA_BusEntity .FinancialAccounting.FATransactions .FA_TRANSACTION_HEADERDataTable objFATran_Header_DTB;
            FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
            //Code added for getting common connection string from config file
            Database db;
            public ClsPubDebitCreditNote(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion

            public int FunPubInsertDebitCredit(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out int intDebit_ID, string strConnectionName, out string strDocNo,out string strErrorMsg)
            {
                strDocNo = "";
                strErrorMsg = "";
                try
                {
                    intDebit_ID = intErrorCode = 0;
                   
                    objFATran_Header_DTB = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(bytesobjFATran_Header_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
                    DbCommand command = null;
                    foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow objFATran_Header_Row in objFATran_Header_DTB.Rows)
                    {
                        if (objFATran_Header_Row.Option == 1)
                            command = db.GetStoredProcCommand(SPNames.InsertDebitNote);
                        else if (objFATran_Header_Row.Option == 2)
                            command = db.GetStoredProcCommand(SPNames.UpdateDCNote);

                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFATran_Header_Row.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFATran_Header_Row.User_ID);
                        if (objFATran_Header_Row.Tran_Header_ID > 0)
                        {
                            db.AddInParameter(command, "@Tran_Header_ID", DbType.Int64, objFATran_Header_Row.Tran_Header_ID);
                            //db.AddInParameter(command, "@Link_Key", DbType.Int64, objFATran_Header_Row.Link_Key);
                        }

                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objFATran_Header_Row.Location_ID);
                        // if(objFATran_Header_Row.Location_Code !=null )
                       // db.AddInParameter(command, "@Location_Code", DbType.String, objFATran_Header_Row.Location_Code);

                        db.AddInParameter(command, "@Activity", DbType.Int32, objFATran_Header_Row.Activity);
                        db.AddInParameter(command, "@Tran_Type", DbType.String, objFATran_Header_Row.Tran_Type);
                        if (!objFATran_Header_Row.IsDocument_NoNull())
                            db.AddInParameter(command, "@Document_No", DbType.String, objFATran_Header_Row.Document_No);
                        db.AddInParameter(command, "@Document_Date", DbType.DateTime, objFATran_Header_Row.Document_Date);
                        db.AddInParameter(command, "@Value_Date", DbType.DateTime, objFATran_Header_Row.Value_Date);

                        db.AddInParameter(command, "@Auth_Status", DbType.String, objFATran_Header_Row.Auth_Status);
                        // db.AddInParameter(command, "@Auth_Status_Lookup", DbType.Int32, objFATran_Header_Row.Auth_Status_Lookup);
                        //db.AddInParameter(command, "@Auth_Status_ID", DbType.String, objFATran_Header_Row.Auth_Status_ID);
                        db.AddInParameter(command, "@Document_Type", DbType.String, objFATran_Header_Row.Document_Type);

                       
                        db.AddInParameter(command, "@Entity_Type", DbType.Int32, objFATran_Header_Row.Entity_Type);
                        db.AddInParameter(command, "@Entity_ID", DbType.Int32, objFATran_Header_Row.Entity_ID);
                        db.AddInParameter(command, "@Party_Code", DbType.String, objFATran_Header_Row.Party_Code);

                        db.AddInParameter(command, "@Mode", DbType.String, objFATran_Header_Row.Mode);
                        db.AddInParameter(command, "@Mode_Lookup", DbType.Int32, objFATran_Header_Row.Mode_Lookup);
                        db.AddInParameter(command, "@Mode_ID", DbType.Int32, objFATran_Header_Row.Mode_ID);

                        db.AddInParameter(command, "@Tran_Currency_Code", DbType.String, objFATran_Header_Row.Tran_Currency_Code);
                        db.AddInParameter(command, "@Tran_Currency_ID", DbType.Int32, objFATran_Header_Row.Tran_Currency_ID);
                        db.AddInParameter(command, "@Tran_Currency_Amount", DbType.Decimal, objFATran_Header_Row.Tran_Currency_Amount);
                        db.AddInParameter(command, "@Def_Currency_Amount", DbType.Decimal, objFATran_Header_Row.Def_Currency_Amount);
                        db.AddInParameter(command, "@Document_Status", DbType.String, objFATran_Header_Row.Document_Status);
                        db.AddInParameter(command, "@Document_Update_Status", DbType.String, objFATran_Header_Row.Document_Update_Status);

                        db.AddInParameter(command, "@Dim1", DbType.String, objFATran_Header_Row.Dim1);
                        db.AddInParameter(command, "@Dim2", DbType.String, objFATran_Header_Row.Dim2);
                        db.AddInParameter(command, "@Dim3", DbType.String, objFATran_Header_Row.Dim3);

                        db.AddInParameter(command, "@From_Date", DbType.DateTime, objFATran_Header_Row.From_Date);
                        db.AddInParameter(command, "@To_Date", DbType.DateTime, objFATran_Header_Row.To_Date);

                        db.AddInParameter(command, "@Print_Count", DbType.Int32, objFATran_Header_Row.Print_Count);
                        db.AddInParameter(command, "@Cross_Ref", DbType.String, objFATran_Header_Row.Cross_Ref);
                        db.AddInParameter(command, "@Paid_Status", DbType.String, objFATran_Header_Row.Paid_Status);
                        db.AddInParameter(command, "@Transaction_Date", DbType.DateTime, objFATran_Header_Row.Transaction_Date);

                        //Modified By Chandrasekar K On 1-Jan-2013
                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Tran_MG", OracleType.Clob,
                                        objFATran_Header_Row.XML_Tran_MG.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_MG);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_Tran_MG", DbType.String, objFATran_Header_Row.XML_Tran_MG);
                        }
                        if (!objFATran_Header_Row.IsXML_Tran_OTHNull())
                        {
                            if (enumDBType == FADALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_Tran_OTH", OracleType.Clob,
                                            objFATran_Header_Row.XML_Tran_OTH.Length, ParameterDirection.Input, true,
                                            0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_OTH);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_Tran_OTH", DbType.String, objFATran_Header_Row.XML_Tran_OTH);
                            }
                        }


                        db.AddInParameter(command, "@Option", DbType.Int32, objFATran_Header_Row.Option);
                        db.AddInParameter(command, "@ISIB", DbType.String, objFATran_Header_Row.ISIB);
                        db.AddOutParameter(command, "@OutDebit_ID", DbType.Int64, sizeof(Int64));
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);
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
                                    if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                                    {
                                        strErrorMsg = "";
                                    }
                                    else
                                        strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                    throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                    if ((int)command.Parameters["@OutResult"].Value > 0)
                                        int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                    intDebit_ID = Convert.ToInt32(command.Parameters["@OutDebit_ID"].Value);
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
                            { 
                                conn.Close();
                            }
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


            public int FunPubDeleteDCNote(int TranHeaderId, string strConnectionName)
            {
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand(SPNames.DeleteDCNote);
                    db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, TranHeaderId);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.FunPubExecuteNonQuery(command);
                    //db.ExecuteNonQuery(command);
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
                        {
                            conn.Close();
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

    }
}
