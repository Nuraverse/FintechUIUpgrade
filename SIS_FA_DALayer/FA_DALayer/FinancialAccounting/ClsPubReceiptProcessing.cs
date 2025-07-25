#region PageHeader

/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Receipt Processing 
/// Created By			: Tamilselvan.S
/// Created Date		: 20/03/2012
/// Purpose	            : To Create/Update and to retrive Receipt Processing details

/// <Program Summary>
#endregion

#region [Namespace]
using System;
using FA_DALayer.SysAdmin;
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
    public class ClsPubReceiptProcessing
    {
        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable ObjTranHeaderDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubReceiptProcessing(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Receipt Process]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 20/03/2012
        /// for Receipt Processing details insert/update.
        public int FunPubInsertUpdateReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing, string strMode, int intUpdateOption, out string Receiptno, out string strErrorMsg)
        {
            int intOutPutValue = 0;
            strErrorMsg = "";
            Receiptno = string.Empty;
            ObjTranHeaderDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_ReceiptProcessing, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjHeaderTranRow = ObjTranHeaderDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdate_ReceiptProcessing);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjHeaderTranRow.Company_ID);
                db.AddInParameter(command, "@Page_Mode", DbType.String, strMode);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjHeaderTranRow.Location_ID);
                if (!ObjHeaderTranRow.IsActivityNull())
                    db.AddInParameter(command, "@Activity", DbType.Int32, ObjHeaderTranRow.Activity);
                if (!ObjHeaderTranRow.IsTran_Header_IDNull())
                    db.AddInParameter(command, "@Document_Header_ID", DbType.Int64, ObjHeaderTranRow.Tran_Header_ID);
                if (!ObjHeaderTranRow.IsDocument_NoNull())
                    db.AddInParameter(command, "@Document_No", DbType.String, ObjHeaderTranRow.Document_No);
                db.AddInParameter(command, "@Document_Date", DbType.DateTime, ObjHeaderTranRow.Document_Date);
                db.AddInParameter(command, "@Value_Date", DbType.DateTime, ObjHeaderTranRow.Value_Date);
                db.AddInParameter(command, "@Mode_Code", DbType.String, ObjHeaderTranRow.Mode);
                db.AddInParameter(command, "@Payment_Mode", DbType.Int32, ObjHeaderTranRow.Mode_ID);
                db.AddInParameter(command, "@Transaction_Amount", DbType.Decimal, ObjHeaderTranRow.Tran_Currency_Amount);
                db.AddInParameter(command, "@Document_Type", DbType.String, ObjHeaderTranRow.Document_Type);
                db.AddInParameter(command, "@Entity_ID", DbType.Int32, ObjHeaderTranRow.Entity_ID);

                db.AddInParameter(command, "@Entity_Code", DbType.String, ObjHeaderTranRow.Party_Code);
                db.AddInParameter(command, "@Entity_Type", DbType.Int32, ObjHeaderTranRow.Entity_Type);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjHeaderTranRow.User_ID);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjHeaderTranRow.User_ID);
                db.AddInParameter(command, "@Tran_Currency_ID", DbType.Int32, ObjHeaderTranRow.Tran_Currency_ID);
                db.AddInParameter(command, "@Tran_Currency_Code", DbType.String, ObjHeaderTranRow.Tran_Currency_Code);

                if (!ObjHeaderTranRow.IsDim1Null())
                    db.AddInParameter(command, "@HeadDim1", DbType.String, ObjHeaderTranRow.Dim1);
                if (!ObjHeaderTranRow.IsDim2Null())
                    db.AddInParameter(command, "@HeadDim2", DbType.String, ObjHeaderTranRow.Dim2);

                if (!ObjHeaderTranRow.IsXML_Tran_MGNull())
                    db.AddInParameter(command, "@XML_Receipt_Det", DbType.String, ObjHeaderTranRow.XML_Tran_MG);
                if (!ObjHeaderTranRow.IsXML_Tran_ALNull())
                    db.AddInParameter(command, "@XML_ReceiptAddLess_Det", DbType.String, ObjHeaderTranRow.XML_Tran_AL);
                if (!ObjHeaderTranRow.IsXML_Tran_BANKNull())
                    db.AddInParameter(command, "@XML_ReceiptBank_Det", DbType.String, ObjHeaderTranRow.XML_Tran_BANK);
                if (!ObjHeaderTranRow.IsXML_Tran_OTHNull())
                    db.AddInParameter(command, "@XML_ReceiptOther_Det", DbType.String, ObjHeaderTranRow.XML_Tran_OTH);
                if (!ObjHeaderTranRow.IsXML_Tran_AUTHNull())
                    db.AddInParameter(command, "@XML_Tran_AUTH", DbType.String, ObjHeaderTranRow.XML_Tran_AUTH);
                if (!ObjHeaderTranRow.IsXmlDenominationNull())
                {
                    db.AddInParameter(command, "@XmlDenomination", DbType.String, ObjHeaderTranRow.XmlDenomination);
                }
               
                db.AddInParameter(command, "@tran_type", DbType.String, ObjHeaderTranRow.Tran_Type);
                db.AddInParameter(command, "@name", DbType.String, ObjHeaderTranRow.Name);
                db.AddInParameter(command, "@address", DbType.String, ObjHeaderTranRow.Address);
                db.AddInParameter(command, "@phone", DbType.String, ObjHeaderTranRow.Phone);
                db.AddInParameter(command, "@mobile", DbType.String, ObjHeaderTranRow.Mobile);
                db.AddInParameter(command, "@email", DbType.String, ObjHeaderTranRow.EMail);
                db.AddInParameter(command, "@website", DbType.String, ObjHeaderTranRow.Website);
                db.AddOutParameter(command, "@Receiptno", DbType.String, 50);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                db.AddInParameter(command, "@IS_IB", DbType.String, ObjHeaderTranRow.ISIB);
                db.AddInParameter(command, "@Ref_ID", DbType.String, ObjHeaderTranRow.Ref_ID);
                if (!ObjHeaderTranRow.IsReceived_FromNull())
                    db.AddInParameter(command, "@Rec_From", DbType.String, ObjHeaderTranRow.Received_From);
                if (!ObjHeaderTranRow.IsReceived_AddressNull())
                    db.AddInParameter(command, "@Rec_Address", DbType.String, ObjHeaderTranRow.Received_Address);
                if (!ObjHeaderTranRow.IsPostal_CodeNull())
                    db.AddInParameter(command, "@Postal_code", DbType.String, ObjHeaderTranRow.Postal_Code);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intOutPutValue = (int)command.Parameters["@ReturnOutput"].Value;
                        @Receiptno = (string)command.Parameters["@Receiptno"].Value;
                        //strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;

                        if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                        {
                            strErrorMsg = "";
                        }
                        else
                            strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;

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


        #endregion [Receipt Process

        #region [Receipt Cancelling]

        public int FunPubCancelReceiptProcessing(FASerializationMode SerMode, byte[] byteObjFA_ReceiptProcessing)
        {
            int intOutPutValue = 0;
            ObjTranHeaderDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_ReceiptProcessing, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERDataTable));
            FA_BusEntity.FinancialAccounting.FATransactions.FA_TRANSACTION_HEADERRow ObjHeaderTranRow = ObjTranHeaderDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.Receipt_Cancel);
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

        #endregion [Receipt Cancelling]
    }
}
