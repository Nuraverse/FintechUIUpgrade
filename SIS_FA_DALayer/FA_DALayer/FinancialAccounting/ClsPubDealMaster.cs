using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubDealMaster
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTDataTable objDealMaster_DTB;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTRow objDealMasterRow;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranDataTable objFA_Fund_TranDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranRow objFA_Fund_TranRow;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Actual_IntDataTable objFA_Actual_IntDataTable;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Actual_IntRow objFA_Actual_IntRow;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CALLPUT_TranDataTable objFA_CALLPUT_TranDataTable;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CALLPUT_TranRow objFA_CALLPUT_TranRow;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_NCD_ClosureDataTable objFA_NCD_ClosureDataTable;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_NCD_ClosureRow objFA_NCD_ClosureRow;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_IRS_FUND_TRAN_DTLDataTable objFA_Fund_IRS_TranDataTable;
        //Code added for getting common connection string from config file
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubDealMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }


        public int FunPubInsertDealMaster(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intDeal_ID = intErrorCode = 0;
                objDealMaster_DTB = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjDealMaster_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTRow objDealMasterRow in objDealMaster_DTB.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_DEAL_MST");

                    if (!objDealMasterRow.IsCompany_IDNull())
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objDealMasterRow.Company_ID);
                    if (!objDealMasterRow.IsUser_IdNull())
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objDealMasterRow.User_Id);
                    if (!objDealMasterRow.IsDeal_IdNull())
                        db.AddInParameter(command, "@Deal_Id", DbType.Int32, objDealMasterRow.Deal_Id);
                    if (!objDealMasterRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objDealMasterRow.Location_ID);
                    if (!objDealMasterRow.IsLocation_CodeNull())
                        db.AddInParameter(command, "@Location_Code", DbType.String, objDealMasterRow.Location_Code);
                    if (!objDealMasterRow.IsFunder_IdNull())
                        db.AddInParameter(command, "@Funder_Id", DbType.Int32, objDealMasterRow.Funder_Id);
                    if (!objDealMasterRow.IsDeal_NoNull())
                        db.AddInParameter(command, "@Deal_No", DbType.String, objDealMasterRow.Deal_No);
                    if (!objDealMasterRow.IsDeal_DateNull())
                        db.AddInParameter(command, "@Deal_Date", DbType.DateTime, objDealMasterRow.Deal_Date);
                    if (!objDealMasterRow.IsRemarksNull())
                        db.AddInParameter(command, "@Remarks", DbType.String, objDealMasterRow.Remarks);
                    if (!objDealMasterRow.IsFunder_TypeNull())
                        db.AddInParameter(command, "@Funder_Type", DbType.Int32, objDealMasterRow.Funder_Type);
                    if (!objDealMasterRow.IsCurrency_codeNull())
                        db.AddInParameter(command, "@Currency_code", DbType.String, objDealMasterRow.Currency_code);
                    if (!objDealMasterRow.IsCurrency_ValueNull())
                        db.AddInParameter(command, "@Currency_Value", DbType.Decimal, objDealMasterRow.Currency_Value);
                    if (!objDealMasterRow.IsCommitment_AmtNull())
                        db.AddInParameter(command, "@Commitment_Amt", DbType.Decimal, objDealMasterRow.Commitment_Amt);
                    if (!objDealMasterRow.IsXML_Fund_DTLNull())
                        db.AddInParameter(command, "@XML_Fund_DTL", DbType.String, objDealMasterRow.XML_Fund_DTL);
                    if (!objDealMasterRow.IsXML_Int_DTLNull())
                        db.AddInParameter(command, "@XML_Int_DTL", DbType.String, objDealMasterRow.XML_Int_DTL);
                    if (!objDealMasterRow.IsXML_Rate_DTLNull())
                        db.AddInParameter(command, "@XML_Rate_DTL", DbType.String, objDealMasterRow.XML_Rate_DTL);
                    if (!objDealMasterRow.IsXML_Board_DTLNull())
                        db.AddInParameter(command, "@XML_Board_DTL", DbType.String, objDealMasterRow.XML_Board_DTL);
                    if (!objDealMasterRow.IsXML_Secur_DTLNull())
                        db.AddInParameter(command, "@XML_Secur_DTL", DbType.String, objDealMasterRow.XML_Secur_DTL);
                    if (!objDealMasterRow.IsXML_Cons_DTLNull())
                        db.AddInParameter(command, "@XML_Cons_DTL", DbType.String, objDealMasterRow.XML_Cons_DTL);
                    if (!objDealMasterRow.IsXML_Tranche_DTLNull())
                        db.AddInParameter(command, "@XML_Tranche_DTL", DbType.String, objDealMasterRow.XML_Tranche_DTL);
                    if (!objDealMasterRow.IsXML_Docs_DTLNull())
                        db.AddInParameter(command, "@XML_Docs_DTL", DbType.String, objDealMasterRow.XML_Docs_DTL);
                    if (!objDealMasterRow.IsIs_ActiveNull())
                        db.AddInParameter(command, "@Is_Active", DbType.String, objDealMasterRow.Is_Active);
                    if (!objDealMasterRow.IsCreated_ByNull())
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objDealMasterRow.Created_By);
                    if (!objDealMasterRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objDealMasterRow.Created_Date);
                    if (!objDealMasterRow.IsModified_byNull())
                        db.AddInParameter(command, "@Modified_by", DbType.Int32, objDealMasterRow.Modified_by);
                    if (!objDealMasterRow.IsModified_DateNull())
                        db.AddInParameter(command, "@Modified_Date", DbType.DateTime, objDealMasterRow.Modified_Date);

                    if (!objDealMasterRow.IsSubscription_FromNull())
                        db.AddInParameter(command, "@Subscription_From", DbType.DateTime, objDealMasterRow.Subscription_From);
                    if (!objDealMasterRow.IsSubscription_ToNull())
                        db.AddInParameter(command, "@Subscription_To", DbType.DateTime, objDealMasterRow.Subscription_To);
                    if (!objDealMasterRow.IsCall_PutNull())
                        db.AddInParameter(command, "@Call_Put", DbType.Int32, objDealMasterRow.Call_Put);

                    
                    db.AddOutParameter(command, "@OutDeal_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                           
                              
                            db.FunPubExecuteNonQuery(command,ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {

                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                intDeal_ID = Convert.ToInt32(command.Parameters["@OutDeal_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                trans.Commit();
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



        #region "Funder Transactions"
        public int FunPubInsertFunderTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intFunderTran_ID = intErrorCode = 0;
                objFA_Fund_TranDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranDataTable)FAClsPubSerialize.DeSerialize(bytesobjFunderTran_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Fund_TranRow objFA_Fund_TranRow in objFA_Fund_TranDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_FUNDER_TRANS");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_Fund_TranRow.Company_Id);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_Fund_TranRow.User_ID);
                    if (!objFA_Fund_TranRow.IsFunder_IDNull())
                        db.AddInParameter(command, "@Funder_ID", DbType.Int32, objFA_Fund_TranRow.Funder_ID);
                    db.AddInParameter(command, "@Deal_id", DbType.Int32, objFA_Fund_TranRow.Deal_Id);
                    if (!objFA_Fund_TranRow.IsTranche_IdNull())
                        db.AddInParameter(command, "@Tranche_Id", DbType.Int32, objFA_Fund_TranRow.Tranche_Id);
                    db.AddInParameter(command, "@Funder_Tran_ID", DbType.Int32, objFA_Fund_TranRow.Funder_Tran_Id);
                    if (!objFA_Fund_TranRow.IsLocation_IdNull())
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, objFA_Fund_TranRow.Location_Id);
                    if (!objFA_Fund_TranRow.IsPrev_Tran_IdNull())
                        db.AddInParameter(command, "@Prev_Tran_Id", DbType.Int32, objFA_Fund_TranRow.Prev_Tran_Id);
                    if (!objFA_Fund_TranRow.IsFunder_Tran_NoNull())
                        db.AddInParameter(command, "@Funder_Tran_No", DbType.String, objFA_Fund_TranRow.Funder_Tran_No);
                    if (!objFA_Fund_TranRow.IsFunder_Tran_dateNull())
                        db.AddInParameter(command, "@Funder_Tran_date", DbType.DateTime, objFA_Fund_TranRow.Funder_Tran_date); ;
                    db.AddInParameter(command, "@Base_Rate", DbType.Decimal, objFA_Fund_TranRow.Base_Rate);
                    db.AddInParameter(command, "@Spread_Rate", DbType.Decimal, objFA_Fund_TranRow.Spread_Rate);
                    db.AddInParameter(command, "@Total_Rate", DbType.Decimal, objFA_Fund_TranRow.Total_Rate);
                    if (!objFA_Fund_TranRow.IsCurrency_CodeNull())
                        db.AddInParameter(command, "@Currency_Code", DbType.String, objFA_Fund_TranRow.Currency_Code); ;
                    db.AddInParameter(command, "@Currency_Value", DbType.Decimal, objFA_Fund_TranRow.Currency_Value);
                    if (!objFA_Fund_TranRow.IsCommitment_AmtNull())
                        db.AddInParameter(command, "@Commitment_Amt", DbType.Decimal, objFA_Fund_TranRow.Commitment_Amt);
                    if (!objFA_Fund_TranRow.IsCommitment_Amt_INRNull())
                        db.AddInParameter(command, "@Commitment_Amt_INR", DbType.Decimal, objFA_Fund_TranRow.Commitment_Amt_INR);
                    if (!objFA_Fund_TranRow.IsTenure_TypeNull())
                        db.AddInParameter(command, "@Tenure_Type", DbType.String, objFA_Fund_TranRow.Tenure_Type);
                    if (!objFA_Fund_TranRow.IsTenureNull())
                        db.AddInParameter(command, "@Tenure", DbType.Int32, objFA_Fund_TranRow.Tenure);
                    if (!objFA_Fund_TranRow.IsInt_CalculationNull())
                        db.AddInParameter(command, "@Int_Calculation", DbType.Int32, objFA_Fund_TranRow.Int_Calculation);
                    if (!objFA_Fund_TranRow.IsInt_CreditNull())
                        db.AddInParameter(command, "@Int_Credit", DbType.Int32, objFA_Fund_TranRow.Int_Credit);
                    if (!objFA_Fund_TranRow.IsInvestment_LeinNull())
                        db.AddInParameter(command, "@Investment_Lein", DbType.Int32, objFA_Fund_TranRow.Investment_Lein);
                    if (!objFA_Fund_TranRow.IsArrangementNull())
                        db.AddInParameter(command, "@Arrangement", DbType.Int32, objFA_Fund_TranRow.Arrangement);
                    if (!objFA_Fund_TranRow.IsValid_UptoNull())
                        db.AddInParameter(command, "@Valid_Upto", DbType.DateTime, objFA_Fund_TranRow.Valid_Upto);
                    if (!objFA_Fund_TranRow.IsInflow_TypeNull())
                        db.AddInParameter(command, "@Inflow_Type", DbType.Int32, objFA_Fund_TranRow.Inflow_Type);
                    if (!objFA_Fund_TranRow.IsReceving_FreqNull())
                        db.AddInParameter(command, "@Receving_Freq", DbType.Int32, objFA_Fund_TranRow.Receving_Freq);
                    if (!objFA_Fund_TranRow.IsReceving_DateNull())
                        db.AddInParameter(command, "@Receving_Date", DbType.DateTime, objFA_Fund_TranRow.Receving_Date);
                    if (!objFA_Fund_TranRow.IsOutFlow_TypeNull())
                        db.AddInParameter(command, "@OutFlow_Type", DbType.Int32, objFA_Fund_TranRow.OutFlow_Type);
                    if (!objFA_Fund_TranRow.IsRepay_FreqNull())
                        db.AddInParameter(command, "@Repay_Freq", DbType.Int32, objFA_Fund_TranRow.Repay_Freq);
                    if (!objFA_Fund_TranRow.IsRepay_DateNull())
                        db.AddInParameter(command, "@Repay_Date", DbType.DateTime, objFA_Fund_TranRow.Repay_Date);
                    if (!objFA_Fund_TranRow.IsInt_Appl_MoneyNull())
                        db.AddInParameter(command, "@Int_Appl_Money", DbType.Decimal, objFA_Fund_TranRow.Int_Appl_Money);
                    if (!objFA_Fund_TranRow.IsAppl_MoneyNull())
                        db.AddInParameter(command, "@Appl_Maoney", DbType.Decimal, objFA_Fund_TranRow.Appl_Money);
                    if (!objFA_Fund_TranRow.IsDate_AvailmentNull())
                        db.AddInParameter(command, "@Date_Availment", DbType.DateTime, objFA_Fund_TranRow.Date_Availment);
                    if (!objFA_Fund_TranRow.IsAvailment_AmountNull())
                        db.AddInParameter(command, "@Availment_Amount", DbType.Decimal, objFA_Fund_TranRow.Availment_Amount);
                    if (!objFA_Fund_TranRow.IsAllotment_DateNull())
                        db.AddInParameter(command, "@Allotment_Date", DbType.DateTime, objFA_Fund_TranRow.Allotment_Date);
                    //if (!objFA_Fund_TranRow.IsXML_Receving_DTLNull())//vinodh
                    //    db.AddInParameter(command, "@XML_Receving_DTL", DbType.String, objFA_Fund_TranRow.XML_Receving_DTL);
                    //if (!objFA_Fund_TranRow.IsXML_Repay_DTLNull())//vinodh
                    //    db.AddInParameter(command, "@XML_Repay_DTL", DbType.String, objFA_Fund_TranRow.XML_Repay_DTL);
                    //if (!objFA_Fund_TranRow.IsXML_CashFlow_DTLNull())//vinodh
                    //    db.AddInParameter(command, "@XML_CashFlow_DTL", DbType.String, objFA_Fund_TranRow.XML_CashFlow_DTL);

                    //if (!objFA_Fund_TranRow.IsXML_Mort_DTLNull())//vinodh
                    //    db.AddInParameter(command, "@XML_Mort_DTL", DbType.String, objFA_Fund_TranRow.XML_Mort_DTL);
                    if (!objFA_Fund_TranRow.IsAppl_MaoneyISINNull())
                        db.AddInParameter(command, "@Appl_MaoneyISIN", DbType.String, objFA_Fund_TranRow.Appl_MaoneyISIN);
                    if (!objFA_Fund_TranRow.IsAvailmentISINNull())
                        db.AddInParameter(command, "@AvailmentISIN", DbType.String, objFA_Fund_TranRow.AvailmentISIN);
                    if (!objFA_Fund_TranRow.IsTranche_Ref_NoNull())
                        db.AddInParameter(command, "@Tranche_Ref_No", DbType.String, objFA_Fund_TranRow.Tranche_Ref_No);
                    if (!objFA_Fund_TranRow.IsTrans_AmtNull())
                        db.AddInParameter(command, "@Trans_Amt", DbType.Decimal, objFA_Fund_TranRow.Trans_Amt);
                    if (!objFA_Fund_TranRow.IsTrans_Amt_INRNull())
                        db.AddInParameter(command, "@Trans_Amt_INR", DbType.Decimal, objFA_Fund_TranRow.Trans_Amt_INR);
                    if (!objFA_Fund_TranRow.IsInt_Calc_dateNull())
                        db.AddInParameter(command, "@Int_Calc_date", DbType.DateTime, objFA_Fund_TranRow.Int_Calc_date);
                    if (!objFA_Fund_TranRow.IsInt_Credit_dateNull())
                        db.AddInParameter(command, "@Int_Credit_date", DbType.DateTime, objFA_Fund_TranRow.Int_Credit_date);

                    if (!objFA_Fund_TranRow.IsLC_TypeNull())
                        db.AddInParameter(command, "@LC_Type", DbType.String, objFA_Fund_TranRow.LC_Type);
                    if (!objFA_Fund_TranRow.IsAvailment_DateNull())
                        db.AddInParameter(command, "@Availment_Date", DbType.DateTime, objFA_Fund_TranRow.Availment_Date);
                    if (!objFA_Fund_TranRow.IsPurposeNull())
                        db.AddInParameter(command, "@Purpose", DbType.String, objFA_Fund_TranRow.Purpose);
                    if (!objFA_Fund_TranRow.IsFavouring_OfNull())
                        db.AddInParameter(command, "@Favouring_Of", DbType.String, objFA_Fund_TranRow.Favouring_Of);
                    if (!objFA_Fund_TranRow.IsLCAmountNull())
                        db.AddInParameter(command, "@LCAmount", DbType.Decimal, objFA_Fund_TranRow.LCAmount);
                    if (!objFA_Fund_TranRow.IsLCValidityNull())
                        db.AddInParameter(command, "@LCValidity", DbType.DateTime, objFA_Fund_TranRow.LCValidity);

                    //if (!objFA_Fund_TranRow.IsXML_HedgingNull())//vinodh
                    //    db.AddInParameter(command, "@XML_Hedging", DbType.DateTime, objFA_Fund_TranRow.XML_Hedging);
                    
                    
                    if (!objFA_Fund_TranRow.IsOTH_Cost_PerNull())
                        db.AddInParameter(command, "@OTH_Cost_Per", DbType.Decimal, objFA_Fund_TranRow.OTH_Cost_Per);
                    if (!objFA_Fund_TranRow.IsHedge_Cost_PerNull())
                        db.AddInParameter(command, "@Hedge_Cost_Per", DbType.Decimal, objFA_Fund_TranRow.Hedge_Cost_Per);
                    if (!objFA_Fund_TranRow.IsMA_Int_PerNull())
                        db.AddInParameter(command, "@MA_Int_Per", DbType.Decimal, objFA_Fund_TranRow.MA_Int_Per);
                    if (!objFA_Fund_TranRow.IsCOF_PerNull())
                        db.AddInParameter(command, "@COF_Per", DbType.Decimal, objFA_Fund_TranRow.COF_Per);
                    if (!objFA_Fund_TranRow.IsTDS_Section_RefNull())
                        db.AddInParameter(command, "@TDS_Section_Ref", DbType.String, objFA_Fund_TranRow.TDS_Section_Ref);
                    if (!objFA_Fund_TranRow.IsSD_Ref_NoNull())
                        db.AddInParameter(command, "@SD_Ref_No", DbType.String, objFA_Fund_TranRow.SD_Ref_No);
                    if (!objFA_Fund_TranRow.IsAuth_StatNull())
                        db.AddInParameter(command, "@Auth_Stat", DbType.String, objFA_Fund_TranRow.Auth_Stat);
                    ///////////////////////
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        if (!objFA_Fund_TranRow.IsXML_Receving_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Receving_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Receving_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Receving_DTL);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Repay_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Repay_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Repay_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Repay_DTL);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_CashFlow_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_CashFlow_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_CashFlow_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_CashFlow_DTL);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Mort_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Mort_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Mort_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Mort_DTL);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_HedgingNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Hedging", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Hedging.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Hedging);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        if (!objFA_Fund_TranRow.IsXML_Receving_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_Receving_DTL", DbType.String, objFA_Fund_TranRow.XML_Receving_DTL);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Repay_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_Repay_DTL", DbType.String, objFA_Fund_TranRow.XML_Repay_DTL);
                        }

                        if (!objFA_Fund_TranRow.IsXML_CashFlow_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_CashFlow_DTL", DbType.String, objFA_Fund_TranRow.XML_CashFlow_DTL);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Mort_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_Mort_DTL", DbType.String, objFA_Fund_TranRow.XML_Mort_DTL);
                        }

                        if (!objFA_Fund_TranRow.IsXML_HedgingNull())
                        {
                            db.AddInParameter(command, "@XML_Hedging", DbType.String, objFA_Fund_TranRow.XML_Hedging);
                        }
                    }




                    ////////////////////////

                    db.AddOutParameter(command, "@OutFunderTran_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command,ref trans);
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
                                intFunderTran_ID = Convert.ToInt32(command.Parameters["@OutFunderTran_ID"].Value);
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

        #region "Actual Interest"
        public int FunPubInsertActualInterest(FASerializationMode SerMode, byte[] bytesobjActualInterest_DTB, string strConnectionName, out int intFundInt_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intFundInt_ID = intErrorCode = 0;
                objFA_Actual_IntDataTable = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Actual_IntDataTable)FAClsPubSerialize.DeSerialize(bytesobjActualInterest_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Actual_IntDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Actual_IntRow objFA_Actual_IntRow in objFA_Actual_IntDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Ins_FUN_ACTUAL_INT");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_Actual_IntRow.Company_Id);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_Actual_IntRow.User_ID);
                    if (!objFA_Actual_IntRow.IsFunder_IdNull())
                        db.AddInParameter(command, "@Funder_Id", DbType.Int32, objFA_Actual_IntRow.Funder_Id);
                    if (!objFA_Actual_IntRow.IsDeal_IdNull())
                        db.AddInParameter(command, "@Deal_id", DbType.Int32, objFA_Actual_IntRow.Deal_Id);
                    if (!objFA_Actual_IntRow.IsTranche_NoNull())
                        db.AddInParameter(command, "@Tranche_No", DbType.String, objFA_Actual_IntRow.Tranche_No);
                    if (!objFA_Actual_IntRow.IsInt_From_dateNull())
                        db.AddInParameter(command, "@Int_From_date", DbType.DateTime, objFA_Actual_IntRow.Int_From_date);
                    if (!objFA_Actual_IntRow.IsInt_To_dateNull())
                        db.AddInParameter(command, "@Int_To_date", DbType.DateTime, objFA_Actual_IntRow.Int_To_date);
                    if (!objFA_Actual_IntRow.IsXML_Int_DtlsNull())
                        db.AddInParameter(command, "@XML_Int_Dtls", DbType.String, objFA_Actual_IntRow.XML_Int_Dtls);

                    db.AddOutParameter(command, "@OutFunderInt_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.ExecuteNonQuery(command, trans);
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
                                intFundInt_ID = Convert.ToInt32(command.Parameters["@OutFunderInt_ID"].Value);
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

        #region "Call Put"
        public int FunPubInsertCallPut(FASerializationMode SerMode, byte[] bytesobjCallPut_DTB, string strConnectionName, out int intCallPut_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intCallPut_ID = intErrorCode = 0;
                objFA_CALLPUT_TranDataTable = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CALLPUT_TranDataTable)FAClsPubSerialize.DeSerialize(bytesobjCallPut_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CALLPUT_TranDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CALLPUT_TranRow objFA_CALLPUT_TranRow in objFA_CALLPUT_TranDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Ins_CALLPUT_Tran");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_CALLPUT_TranRow.Company_id);
                    if (!objFA_CALLPUT_TranRow.IsCreated_ByNull())
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_CALLPUT_TranRow.Created_By);
                    if (!objFA_CALLPUT_TranRow.IsCallPut_idNull())
                        db.AddInParameter(command, "@CallPut_id", DbType.Int32, objFA_CALLPUT_TranRow.CallPut_id);
                    if (!objFA_CALLPUT_TranRow.IsFund_Tran_IdNull())
                        db.AddInParameter(command, "@Fund_Tran_Id", DbType.Int32, objFA_CALLPUT_TranRow.Fund_Tran_Id);
                    if (!objFA_CALLPUT_TranRow.IsCAPUNONull())
                        db.AddInParameter(command, "@CAPUNO", DbType.String, objFA_CALLPUT_TranRow.CAPUNO);
                    if (!objFA_CALLPUT_TranRow.IsDOCDTNull())
                        db.AddInParameter(command, "@DOCDT", DbType.DateTime, objFA_CALLPUT_TranRow.DOCDT);
                    if (!objFA_CALLPUT_TranRow.IsOption_idNull())
                        db.AddInParameter(command, "@Option_id", DbType.Int32, objFA_CALLPUT_TranRow.Option_id);
                    if (!objFA_CALLPUT_TranRow.IsPartFull_IdNull())
                        db.AddInParameter(command, "@PartFull_Id", DbType.Int32, objFA_CALLPUT_TranRow.PartFull_Id);
                    if (!objFA_CALLPUT_TranRow.IsFDDON_IdNull())
                        db.AddInParameter(command, "@FDDON_Id", DbType.Int32, objFA_CALLPUT_TranRow.FDDON_Id);
                    if (!objFA_CALLPUT_TranRow.IsCallPutAmtNull())
                        db.AddInParameter(command, "@CallPutAmt", DbType.Decimal, objFA_CALLPUT_TranRow.CallPutAmt);
                    if (!objFA_CALLPUT_TranRow.IsApprov_RefNull())
                        db.AddInParameter(command, "@Approv_Ref", DbType.String, objFA_CALLPUT_TranRow.Approv_Ref);
                    if (!objFA_CALLPUT_TranRow.IsApprov_StatNull())
                        db.AddInParameter(command, "@Approv_Stat", DbType.String, objFA_CALLPUT_TranRow.Approv_Stat);
                    if (!objFA_CALLPUT_TranRow.IsDoc_StatNull())
                        db.AddInParameter(command, "@Doc_Stat", DbType.String, objFA_CALLPUT_TranRow.Doc_Stat);
                    if (!objFA_CALLPUT_TranRow.IsSys_JvNull())
                        db.AddInParameter(command, "@Sys_Jv", DbType.String, objFA_CALLPUT_TranRow.Sys_Jv);
                    if (!objFA_CALLPUT_TranRow.IsRemarksNull())
                        db.AddInParameter(command, "@Remarks", DbType.String, objFA_CALLPUT_TranRow.Remarks);
                    if (!objFA_CALLPUT_TranRow.IsIs_ActiveNull())
                        db.AddInParameter(command, "@Is_Active", DbType.Int32, objFA_CALLPUT_TranRow.Is_Active);
                    if (!objFA_CALLPUT_TranRow.IsCreated_ByNull())
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objFA_CALLPUT_TranRow.Created_By);
                    if (!objFA_CALLPUT_TranRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objFA_CALLPUT_TranRow.Created_Date);
                    if (!objFA_CALLPUT_TranRow.IsModified_byNull())
                        db.AddInParameter(command, "@Modified_by", DbType.Int32, objFA_CALLPUT_TranRow.Modified_by);
                    if (!objFA_CALLPUT_TranRow.IsModified_DateNull())
                        db.AddInParameter(command, "@Modified_Date", DbType.DateTime, objFA_CALLPUT_TranRow.Modified_Date);
                    if (!objFA_CALLPUT_TranRow.IsXML_ReapyDtlsNull())
                        db.AddInParameter(command, "@XML_ReapyDtls", DbType.String, objFA_CALLPUT_TranRow.XML_ReapyDtls);

                    db.AddOutParameter(command, "@OutCallPut_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.ExecuteNonQuery(command, trans);
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
                                intCallPut_ID = Convert.ToInt32(command.Parameters["@OutCallPut_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
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


        #region "NCD Closure"
        public int FunPubInsertNCDClosure(FASerializationMode SerMode, byte[] bytesobjNCDClosure_DTB, string strConnectionName, out int intClosure_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intClosure_ID = intErrorCode = 0;
                objFA_NCD_ClosureDataTable = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_NCD_ClosureDataTable)FAClsPubSerialize.DeSerialize(bytesobjNCDClosure_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_NCD_ClosureDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_NCD_ClosureRow objFA_NCD_ClosureRow in objFA_NCD_ClosureDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Ins_NCD_Closure");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_NCD_ClosureRow.Company_ID);
                    if (!objFA_NCD_ClosureRow.IsUser_IdNull())
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_NCD_ClosureRow.User_Id);
                    if (!objFA_NCD_ClosureRow.IsClosure_IdNull())
                        db.AddInParameter(command, "@Closure_Id", DbType.Int32, objFA_NCD_ClosureRow.Closure_Id);
                    if (!objFA_NCD_ClosureRow.IsFunder_Tran_IdNull())
                        db.AddInParameter(command, "@Fund_Tran_Id", DbType.Int32, objFA_NCD_ClosureRow.Funder_Tran_Id);
                    if (!objFA_NCD_ClosureRow.IsClosure_NoNull())
                        db.AddInParameter(command, "@Closure_No", DbType.String, objFA_NCD_ClosureRow.Closure_No);
                    if (!objFA_NCD_ClosureRow.IsClosure_DateNull())
                        db.AddInParameter(command, "@Closure_Date", DbType.DateTime, objFA_NCD_ClosureRow.Closure_Date);
                    if (!objFA_NCD_ClosureRow.IsClosure_AmountNull())
                        db.AddInParameter(command, "@Closure_Amount", DbType.Decimal, objFA_NCD_ClosureRow.Closure_Amount);
                    if (!objFA_NCD_ClosureRow.IsClosure_Int_RateNull())
                        db.AddInParameter(command, "@Closure_Int_Rate", DbType.Int32, objFA_NCD_ClosureRow.Closure_Int_Rate);


                    db.AddOutParameter(command, "@OutClosure_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
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
                                intClosure_ID = Convert.ToInt32(command.Parameters["@OutClosure_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
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


        #region "IRS Transaction"
        public int FunPubInsertFunderIRSTransaction(FASerializationMode SerMode, byte[] bytesobjFunderTran_DTB, string strConnectionName, out int intFunderTran_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intFunderTran_ID = intErrorCode = 0;
                objFA_Fund_IRS_TranDataTable = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_IRS_FUND_TRAN_DTLDataTable)FAClsPubSerialize.DeSerialize(bytesobjFunderTran_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_IRS_FUND_TRAN_DTLDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_IRS_FUND_TRAN_DTLRow objFA_Fund_TranRow in objFA_Fund_IRS_TranDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_FUNDER_IRS_TRANS");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_Fund_TranRow.Company_Id);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_Fund_TranRow.User_ID);
                    if (!objFA_Fund_TranRow.IsFunder_IDNull())
                        db.AddInParameter(command, "@Funder_ID", DbType.Int32, objFA_Fund_TranRow.Funder_ID);
                    if (!objFA_Fund_TranRow.IsLocation_IdNull())
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, objFA_Fund_TranRow.Location_Id);
                    if (!objFA_Fund_TranRow.IsFunder_Tran_IdNull())
                        db.AddInParameter(command, "@Funder_Tran_ID", DbType.Int32, objFA_Fund_TranRow.Funder_Tran_Id);
                    if (!objFA_Fund_TranRow.IsIRS_Tran_IdNull())
                        db.AddInParameter(command, "@IRS_Tran_Id", DbType.String, objFA_Fund_TranRow.IRS_Tran_Id);
                    if (!objFA_Fund_TranRow.IsFunder_Tran_NoNull())
                        db.AddInParameter(command, "@Funder_Tran_No", DbType.String, objFA_Fund_TranRow.Funder_Tran_No);
                    if (!objFA_Fund_TranRow.IsFunder_Tran_dateNull())
                        db.AddInParameter(command, "@Funder_Tran_date", DbType.String, objFA_Fund_TranRow.Funder_Tran_date);
                    if (!objFA_Fund_TranRow.IsNature_of_Fund_IdNull())
                        db.AddInParameter(command, "@Funder_Nature_Id", DbType.Int32, objFA_Fund_TranRow.Nature_of_Fund_Id);
                    if (!objFA_Fund_TranRow.IsIRS_NumberNull())
                        db.AddInParameter(command, "@IRS_No", DbType.String, objFA_Fund_TranRow.IRS_Number);
                    if (!objFA_Fund_TranRow.IsIRS_Document_DateNull())
                        db.AddInParameter(command, "@IRS_Document_Date", DbType.String, objFA_Fund_TranRow.IRS_Document_Date);
                    if (!objFA_Fund_TranRow.IsIRS_Deal_AmountNull())
                        db.AddInParameter(command, "@IRS_Deal_Amount", DbType.Decimal, objFA_Fund_TranRow.IRS_Deal_Amount);
                    if (!objFA_Fund_TranRow.IsIRS_Value_DateNull())
                        db.AddInParameter(command, "@IRS_Value_Date", DbType.String, objFA_Fund_TranRow.IRS_Value_Date);
                    if (!objFA_Fund_TranRow.IsIRS_Maturity_DateNull())
                        db.AddInParameter(command, "@IRS_Maturity_Date", DbType.String, objFA_Fund_TranRow.IRS_Maturity_Date);
                    if (!objFA_Fund_TranRow.IsTenureNull())
                        db.AddInParameter(command, "@IRS_Tenure", DbType.Int32, objFA_Fund_TranRow.Tenure);
                    if (!objFA_Fund_TranRow.IsIRS_With_Funder_IdNull())
                        db.AddInParameter(command, "@IRS_IRSWith_Funder_Id", DbType.Int32, objFA_Fund_TranRow.IRS_With_Funder_Id);
                    if (!objFA_Fund_TranRow.IsTranche_IdNull())
                        db.AddInParameter(command, "@Tranche_Id", DbType.Int32, objFA_Fund_TranRow.Tranche_Id);
                    if (!objFA_Fund_TranRow.IsDeal_IdNull())
                        db.AddInParameter(command, "@Deal_id", DbType.Int32, objFA_Fund_TranRow.Deal_Id);

                    if (!objFA_Fund_TranRow.IsIs_CancelNull())
                        db.AddInParameter(command, "@is_Cancel", DbType.Int32, objFA_Fund_TranRow.Is_Cancel);
                    if (!objFA_Fund_TranRow.IsAuth_StatusNull())
                        db.AddInParameter(command, "@Auth_Status", DbType.String, objFA_Fund_TranRow.Auth_Status);


                    //Receiving Shedule details
                    db.AddInParameter(command, "@IRS_Rec_Interest_Type", DbType.Int32, objFA_Fund_TranRow.Rec_Interest_Type);
                    db.AddInParameter(command, "@IRS_Rec_Interest_Basis", DbType.Int32, objFA_Fund_TranRow.Rec_Interest_Basis);
                    db.AddInParameter(command, "@IRS_Rec_Base_Rate", DbType.Decimal, objFA_Fund_TranRow.Rec_Base_Rate);
                    db.AddInParameter(command, "@IRS_Rec_Spread_Rate", DbType.Decimal, objFA_Fund_TranRow.Rec_Spread_Rate);
                    db.AddInParameter(command, "@IRS_Rec_Total_Rate", DbType.Decimal, objFA_Fund_TranRow.Rec_Total_Rate);
                    db.AddInParameter(command, "@IRS_Rec_Inflow_Type", DbType.Int32, objFA_Fund_TranRow.Rec_Inflow_Type);
                    db.AddInParameter(command, "@IRS_Rec_Frequency", DbType.Int32, objFA_Fund_TranRow.Rec_Receipt_Frequency);
                    db.AddInParameter(command, "@IRS_Rec_First_Date", DbType.String, objFA_Fund_TranRow.First_Receipt_Date);
                    //Pay Shedule Details
                    db.AddInParameter(command, "@IRS_Pay_Interest_Type", DbType.Int32, objFA_Fund_TranRow.Pay_Interest_Type);
                    db.AddInParameter(command, "@IRS_Pay_Interest_Basis", DbType.Int32, objFA_Fund_TranRow.Pay_Interest_Basis);
                    db.AddInParameter(command, "@IRS_Pay_Base_Rate", DbType.Decimal, objFA_Fund_TranRow.Pay_Base_Rate);
                    db.AddInParameter(command, "@IRS_Pay_Spread_Rate", DbType.Decimal, objFA_Fund_TranRow.Pay_Spread_Rate);
                    db.AddInParameter(command, "@IRS_Pay_Total_Rate", DbType.Decimal, objFA_Fund_TranRow.Pay_Total_Rate);
                    db.AddInParameter(command, "@IRS_Pay_Inflow_Type", DbType.Int32, objFA_Fund_TranRow.Pay_Inflow_Type);
                    db.AddInParameter(command, "@IRS_Pay_Frequency", DbType.Int32, objFA_Fund_TranRow.Payment_Frequency);
                    db.AddInParameter(command, "@IRS_Pay_First_Date", DbType.String, objFA_Fund_TranRow.First_Payment_Date);
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        if (!objFA_Fund_TranRow.IsXML_Receving_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Receving_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Receving_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Receving_DTL);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Repay_DTLNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Repay_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Repay_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Repay_DTL);
                            command.Parameters.Add(param);
                        }
                        if (!objFA_Fund_TranRow.IsXML_Document_DetailsNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Doc_DTL", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Document_Details.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Document_Details);
                            command.Parameters.Add(param);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Rece_Int_Rate_DetailsNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Rece_Int_Rate_Details", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Rece_Int_Rate_Details.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Rece_Int_Rate_Details);
                            command.Parameters.Add(param);
                        }
                        if (!objFA_Fund_TranRow.IsXML_Pay_Int_Rate_DetailsNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_Pay_Int_Rate_Details", OracleType.Clob,
                                   objFA_Fund_TranRow.XML_Pay_Int_Rate_Details.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_Fund_TranRow.XML_Pay_Int_Rate_Details);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        if (!objFA_Fund_TranRow.IsXML_Receving_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_Receving_DTL", DbType.String, objFA_Fund_TranRow.XML_Receving_DTL);
                        }

                        if (!objFA_Fund_TranRow.IsXML_Repay_DTLNull())
                        {
                            db.AddInParameter(command, "@XML_Repay_DTL", DbType.String, objFA_Fund_TranRow.XML_Repay_DTL);
                        }

                    }
                    db.AddOutParameter(command, "@OutFunderTran_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
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
                                intFunderTran_ID = Convert.ToInt32(command.Parameters["@OutFunderTran_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
                            trans.Rollback();
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex, strConnection);


                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion

    }
}
