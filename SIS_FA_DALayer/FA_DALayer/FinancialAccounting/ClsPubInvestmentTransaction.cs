#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Investment Transaction details
/// Created By			: Tamilselvan.S
/// Created Date		: 10/02/2012
/// Purpose	            : To Create/Update and to retrive Investment Transaction details

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
    public class ClsPubInvestmentTransaction
    {
        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable ObjInvestmentTransDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubInvestmentTransaction(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Investment Transaction]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 10/02/2012
        /// for Investment transaction details insert/update.
        public int FunPubInsertUpdateInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction, string strMode, int intUpdateOption, out string strDocNo)
        {
            strDocNo = string .Empty ;
            int intOutPutValue = 0;
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable dtInvestmentTranHdrTable = new FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable();
            ObjInvestmentTransDataTable = (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_InvestmentTransaction, SerMode, typeof(FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable));
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRRow ObjInvestmentTranRow = ObjInvestmentTransDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdate_InvestmentTransaction);
                if (ObjInvestmentTranRow.Invest_Header_ID != 0)
                    db.AddInParameter(command, "@Invest_Header_ID", DbType.Int32, ObjInvestmentTranRow.Invest_Header_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjInvestmentTranRow.Company_ID);
                db.AddInParameter(command, "@Mode", DbType.String, strMode);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjInvestmentTranRow.Location_ID);
                //if (!ObjInvestmentTranRow.IsActivityNull())
                //    db.AddInParameter(command, "@Activity", DbType.Int32, ObjInvestmentTranRow.Activity);
                db.AddInParameter(command, "@Investment_Type", DbType.Int32, ObjInvestmentTranRow.Investment_Type);
                db.AddInParameter(command, "@Investment_Code", DbType.String, ObjInvestmentTranRow.Investment_Code);
                if (!ObjInvestmentTranRow.IsInvestment_Tran_NoNull())
                    db.AddInParameter(command, "@Investment_Tran_No", DbType.String, ObjInvestmentTranRow.Investment_Tran_No);
                if (!ObjInvestmentTranRow.IsInvestment_Serial_NoNull())
                    db.AddInParameter(command, "@Investment_Serial_No", DbType.String, ObjInvestmentTranRow.Investment_Serial_No);
                db.AddInParameter(command, "@Date", DbType.DateTime, ObjInvestmentTranRow.Date);
                db.AddInParameter(command, "@Invest_Trans_Date", DbType.DateTime, ObjInvestmentTranRow.Invest_Trans_Date);
                db.AddInParameter(command, "@Transaction_Type", DbType.Int32, ObjInvestmentTranRow.Transaction_Type);

                db.AddInParameter(command, "@Entity_Code", DbType.String, ObjInvestmentTranRow.Entity_Code);
                db.AddInParameter(command, "@Entity_Detail_ID", DbType.Int32, ObjInvestmentTranRow.Entity_Detail_ID);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjInvestmentTranRow.Created_By);
                if (!ObjInvestmentTranRow.IsXML_InvestTranDetNull() || ObjInvestmentTranRow.XML_InvestTranDet != string.Empty)
                    db.AddInParameter(command, "@XML_InvestTranDet", DbType.String, ObjInvestmentTranRow.XML_InvestTranDet);
                //Modified By Chandrasekar K On 3-Dec-2012
                if (enumDBType == FADALDBType.ORACLE)
                {
                    if (!ObjInvestmentTranRow.IsXML_InvestTranDetOthNull())
                    {
                        OracleParameter param = new OracleParameter("@XML_InvestTranDetOth", OracleType.Clob,
                                    ObjInvestmentTranRow.XML_InvestTranDetOth.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjInvestmentTranRow.XML_InvestTranDetOth);
                        command.Parameters.Add(param);
                    }
                }
                else
                {
                    if (!ObjInvestmentTranRow.IsXML_InvestTranDetOthNull())
                        db.AddInParameter(command, "@XML_InvestTranDetOth", DbType.String, ObjInvestmentTranRow.XML_InvestTranDetOth);
                }

                
                if (!ObjInvestmentTranRow.IsXML_InvestTranROINull())
                    db.AddInParameter(command, "@XML_InvestTranDet", DbType.String, ObjInvestmentTranRow.XML_InvestTranROI);
                if (!ObjInvestmentTranRow.IsXML_Interest_DetNull())
                    db.AddInParameter(command, "@XML_Interest_Det", DbType.String, ObjInvestmentTranRow.XML_Interest_Det);
                if (!ObjInvestmentTranRow.IsXML_InvestDocumentDetNull())
                    db.AddInParameter(command, "@XML_Document_Det", DbType.String, ObjInvestmentTranRow.XML_InvestDocumentDet);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

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
                            strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
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


        /// <summary>
        /// created By Tamilselvan.s
        /// created date 25/06/2012
        /// for Investment transaction details Canceling.
        public int FunPubCancelingInvestmentTransaction(FASerializationMode SerMode, byte[] byteObjFA_InvestmentTransaction)
        {
            int intOutPutValue = 0;
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable dtInvestmentTranHdrTable = new FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable();
            ObjInvestmentTransDataTable = (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_InvestmentTransaction, SerMode, typeof(FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRDataTable));
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_TRAN_HDRRow ObjInvestmentTranRow = ObjInvestmentTransDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.Cancelling_Investment_Transaction);
                db.AddInParameter(command, "@Invest_Header_ID", DbType.Int32, ObjInvestmentTranRow.Invest_Header_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjInvestmentTranRow.Company_ID);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjInvestmentTranRow.Location_ID);
                db.AddInParameter(command, "@Investment_Code", DbType.String, ObjInvestmentTranRow.Investment_Code);
                db.AddInParameter(command, "@Investment_Tran_No", DbType.String, ObjInvestmentTranRow.Investment_Tran_No);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjInvestmentTranRow.Created_By);
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


        #endregion [Investment Transaction]
    }
}
