#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Payment Request
/// Created By			: M.saran
/// Created Date		: 
/// Purpose	            : To Create/Update Payment Request

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
using System.Data.OracleClient;
using System.Data;
#endregion [Namespace]


namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubPaymentRequest
    {
        #region [Initialization]
        int intRowsAffected;
        int intErrorCode;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable objFATran_Header_DTB;

        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubPaymentRequest(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }


        #endregion

        #region Insert/Update Payment Request Details

        /// <summary>
        /// Insert/Update Payment Request Details 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjFATran_Header_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubInsertPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB, out string PayReqNo, out int request_No, out string strErrorMsg)
        {
            try
            {
                request_No = intErrorCode = 0;
                strErrorMsg = "";
                PayReqNo = "";
                objFATran_Header_DTB = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(bytesobjFATran_Header_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow objFATran_Header_Row in objFATran_Header_DTB.Rows)
                {

                    command = db.GetStoredProcCommand("FA_Insert_PaymentRequest");


                    FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFATran_Header_Row.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFATran_Header_Row.User_ID);
                    db.AddInParameter(command, "@Document_Header_ID", DbType.Int64, objFATran_Header_Row.Tran_Header_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objFATran_Header_Row.Location_ID);
                    db.AddInParameter(command, "@Activity", DbType.Int32, objFATran_Header_Row.Activity);

                    if (!objFATran_Header_Row.IsDocument_NoNull())
                        db.AddInParameter(command, "@Document_No", DbType.String, objFATran_Header_Row.Document_No);
                    if (!objFATran_Header_Row.IsDocument_DateNull())
                        db.AddInParameter(command, "@Document_Date", DbType.DateTime, objFATran_Header_Row.Document_Date);
                    if (!objFATran_Header_Row.IsValue_DateNull())
                        db.AddInParameter(command, "@Value_Date", DbType.DateTime, objFATran_Header_Row.Value_Date);
                    if (!objFATran_Header_Row.IsAuth_StatusNull())
                        db.AddInParameter(command, "@Auth_Status", DbType.String, objFATran_Header_Row.Auth_Status);
                    if (!objFATran_Header_Row.IsDocument_TypeNull())
                        db.AddInParameter(command, "@Document_Type", DbType.String, objFATran_Header_Row.Document_Type);
                    if (!objFATran_Header_Row.IsFrom_DateNull())
                        db.AddInParameter(command, "@From_Date", DbType.DateTime, objFATran_Header_Row.From_Date);
                    if (!objFATran_Header_Row.IsTo_DateNull())
                        db.AddInParameter(command, "@To_Date", DbType.DateTime, objFATran_Header_Row.To_Date);
                    if (!objFATran_Header_Row.IsEntity_TypeNull())
                        db.AddInParameter(command, "@Entity_Type", DbType.Int32, objFATran_Header_Row.Entity_Type);
                    if (!objFATran_Header_Row.IsEntity_IDNull())
                        db.AddInParameter(command, "@Entity_ID", DbType.Int32, objFATran_Header_Row.Entity_ID);
                    if (!objFATran_Header_Row.IsParty_CodeNull())
                        db.AddInParameter(command, "@Entity_Code", DbType.String, objFATran_Header_Row.Party_Code);
                    if (!objFATran_Header_Row.IsModeNull())
                        db.AddInParameter(command, "@Mode_Code", DbType.String, objFATran_Header_Row.Mode);
                    if (!objFATran_Header_Row.IsMode_IDNull())
                        db.AddInParameter(command, "@Payment_Mode", DbType.Int32, objFATran_Header_Row.Mode_ID);
                    if (!objFATran_Header_Row.IsTran_Currency_CodeNull())
                        db.AddInParameter(command, "@Tran_Currency_Code", DbType.String, objFATran_Header_Row.Tran_Currency_Code);
                    if (!objFATran_Header_Row.IsTran_Currency_IDNull())
                        db.AddInParameter(command, "@Tran_Currency_ID", DbType.Int32, objFATran_Header_Row.Tran_Currency_ID);
                    if (!objFATran_Header_Row.IsTran_Currency_AmountNull())
                        db.AddInParameter(command, "@Transaction_Amount", DbType.Decimal, objFATran_Header_Row.Tran_Currency_Amount);
                    if (!objFATran_Header_Row.IsDef_Currency_AmountNull())
                        db.AddInParameter(command, "@Def_Currency_Amount", DbType.Decimal, objFATran_Header_Row.Def_Currency_Amount);
                    if (!objFATran_Header_Row.IsExchange_Rate_IDNull())
                        db.AddInParameter(command, "@Exchange_Rate_ID", DbType.Int32, objFATran_Header_Row.Exchange_Rate_ID);
                    if (!objFATran_Header_Row.IsDocument_StatusNull())
                        db.AddInParameter(command, "@Document_Status", DbType.String, objFATran_Header_Row.Document_Status);
                    if (!objFATran_Header_Row.IsDocument_Update_StatusNull())
                        db.AddInParameter(command, "@Document_Update_Status", DbType.String, objFATran_Header_Row.Document_Update_Status);
                    if (!objFATran_Header_Row.IsDim1Null())
                        db.AddInParameter(command, "@Dim1", DbType.String, objFATran_Header_Row.Dim1);
                    if (!objFATran_Header_Row.IsDim2Null())
                        db.AddInParameter(command, "@Dim2", DbType.String, objFATran_Header_Row.Dim2);
                    if (!objFATran_Header_Row.IsDim3Null())
                        db.AddInParameter(command, "@Dim3", DbType.String, objFATran_Header_Row.Dim3);
                    if (!objFATran_Header_Row.IsPrint_CountNull())
                        db.AddInParameter(command, "@Print_Count", DbType.Int32, objFATran_Header_Row.Print_Count);
                    if (!objFATran_Header_Row.IsPaid_StatusNull())
                        db.AddInParameter(command, "@Paid_Status", DbType.String, objFATran_Header_Row.Paid_Status);

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param;
                        if (!objFATran_Header_Row.IsXML_Tran_MGNull())
                        {
                            param = new OracleParameter("@XML_Tran_Det", OracleType.Clob,
                                objFATran_Header_Row.XML_Tran_MG.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_MG);
                            command.Parameters.Add(param);
                        }

                        if (!objFATran_Header_Row.IsXML_Tran_ALNull())
                        {
                            param = new OracleParameter("@XML_Tran_AL", OracleType.Clob,
                               objFATran_Header_Row.XML_Tran_AL.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_AL);
                            command.Parameters.Add(param);
                        }

                        if (!objFATran_Header_Row.IsXML_Tran_BANKNull())
                        {
                            param = new OracleParameter("@XML_Tran_BANK", OracleType.Clob,
                              objFATran_Header_Row.XML_Tran_BANK.Length, ParameterDirection.Input, true,
                              0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_BANK);
                            command.Parameters.Add(param);
                        }
                        if (!objFATran_Header_Row.IsXML_Tran_AUTHNull())
                        {
                            param = new OracleParameter("@XML_Tran_AUTH", OracleType.Clob,
                                  objFATran_Header_Row.XML_Tran_AUTH.Length, ParameterDirection.Input, true,
                                  0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_AUTH);
                            command.Parameters.Add(param);
                        }
                        if (!objFATran_Header_Row.IsXML_Tran_OTHNull())
                        {
                            param = new OracleParameter("@XML_Tran_OTH", OracleType.Clob,
                                  objFATran_Header_Row.XML_Tran_OTH.Length, ParameterDirection.Input, true,
                                  0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XML_Tran_OTH);
                            command.Parameters.Add(param);
                        }

                        if (!objFATran_Header_Row.IsXmlDenominationNull())
                        {
                            param = new OracleParameter("@XmlDenomination", OracleType.Clob,
                                  objFATran_Header_Row.XmlDenomination.Length, ParameterDirection.Input, true,
                                  0, 0, String.Empty, DataRowVersion.Default, objFATran_Header_Row.XmlDenomination);
                            command.Parameters.Add(param);
                        }

                    }
                    else
                    {
                        if (!objFATran_Header_Row.IsXML_Tran_MGNull())
                            db.AddInParameter(command, "@XML_Tran_Det", DbType.String, objFATran_Header_Row.XML_Tran_MG);

                        if (!objFATran_Header_Row.IsXML_Tran_ALNull())
                            db.AddInParameter(command, "@XML_Tran_AL", DbType.String, objFATran_Header_Row.XML_Tran_AL);

                        if (!objFATran_Header_Row.IsXML_Tran_BANKNull())
                            db.AddInParameter(command, "@XML_Tran_BANK", DbType.String, objFATran_Header_Row.XML_Tran_BANK);

                        if (!objFATran_Header_Row.IsXML_Tran_AUTHNull())
                            db.AddInParameter(command, "@XML_Tran_AUTH", DbType.String, objFATran_Header_Row.XML_Tran_AUTH);

                        if (!objFATran_Header_Row.IsXML_Tran_OTHNull())
                            db.AddInParameter(command, "@XML_Tran_OTH", DbType.String, objFATran_Header_Row.XML_Tran_OTH);

                        if (!objFATran_Header_Row.IsXmlDenominationNull())
                        {
                            db.AddInParameter(command, "@XmlDenomination", DbType.String, objFATran_Header_Row.XmlDenomination);
                        }
                    }



                    db.AddInParameter(command, "@Is_Hold_Cheque", DbType.Int32, objFATran_Header_Row.IS_Hold_Cheque);
                    db.AddInParameter(command, "@Chq_Replace", DbType.Int32, objFATran_Header_Row.Chq_replace);
                    db.AddInParameter(command, "@tran_type", DbType.String, objFATran_Header_Row.Tran_Type);
                    db.AddInParameter(command, "@name", DbType.String, objFATran_Header_Row.Name);
                    db.AddInParameter(command, "@address", DbType.String, objFATran_Header_Row.Address);
                    db.AddInParameter(command, "@phone", DbType.String, objFATran_Header_Row.Phone);
                    db.AddInParameter(command, "@mobile", DbType.String, objFATran_Header_Row.Mobile);
                    db.AddInParameter(command, "@email", DbType.String, objFATran_Header_Row.EMail);
                    db.AddInParameter(command, "@website", DbType.String, objFATran_Header_Row.Website);
                    db.AddInParameter(command, "@Ref_ID", DbType.String, objFATran_Header_Row.Ref_ID);
                    db.AddInParameter(command, "@ISIB", DbType.String, objFATran_Header_Row.ISIB);
                    db.AddInParameter(command, "@Remarks", DbType.String, objFATran_Header_Row.Towards);


                    db.AddOutParameter(command, "@request_No", DbType.Int64, sizeof(Int64));
                    db.AddOutParameter(command, "@PayReqNo", DbType.String, 50);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            PayReqNo = (string)command.Parameters["@PayReqNo"].Value;
                            //strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;
                            if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                            {
                                strErrorMsg = "";
                            }
                            else
                                strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;

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


        #region Cancel Payment Request Details

        /// <summary>
        /// Insert/Update Payment Request Details 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjFATran_Header_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubCancelPaymentRequest(FASerializationMode SerMode, byte[] bytesobjFATran_Header_DTB)
        {
            try
            {
                intErrorCode = 0;

                objFATran_Header_DTB = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(bytesobjFATran_Header_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow objFATran_Header_Row in objFATran_Header_DTB.Rows)
                {

                    command = db.GetStoredProcCommand("FA_Cancel_PaymentRequest");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFATran_Header_Row.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFATran_Header_Row.User_ID);
                    db.AddInParameter(command, "@Document_Header_ID", DbType.Int64, objFATran_Header_Row.Tran_Header_ID);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int32));

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
