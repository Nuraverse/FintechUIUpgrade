using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubHedging
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_HedgingDataTable objFA_HedgingDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_HedgingRow objFA_HedgingRow;
        Database db;
        public ClsPubHedging(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }




        #region "Hedging"
        public int FunPubInsertHedging(FASerializationMode SerMode, byte[] bytesobjFA_HedgingDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objFA_HedgingDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_HedgingDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_HedgingDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_HedgingDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_HedgingRow objFA_HedgingRow in objFA_HedgingDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_Hedging");

                    if (!objFA_HedgingRow.IsCompany_IDNull())
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_HedgingRow.Company_ID);
                    if (!objFA_HedgingRow.IsUser_IdNull())
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objFA_HedgingRow.User_Id);
                    if (!objFA_HedgingRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objFA_HedgingRow.Created_Date);
                    if (!objFA_HedgingRow.IsHA_IdNull())
                        db.AddInParameter(command, "@HA_Id", DbType.Int32, objFA_HedgingRow.HA_Id);
                    if (!objFA_HedgingRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objFA_HedgingRow.Location_ID);
                    if (!objFA_HedgingRow.IsHedAgnt_CodeNull())
                        db.AddInParameter(command, "@HedAgnt_Code", DbType.String, objFA_HedgingRow.HedAgnt_Code);
                    if (!objFA_HedgingRow.IsHA_NameNull())
                        db.AddInParameter(command, "@HA_Name", DbType.String, objFA_HedgingRow.HA_Name);
                    if (!objFA_HedgingRow.IsHA_Add1Null())
                        db.AddInParameter(command, "@HA_Add1", DbType.String, objFA_HedgingRow.HA_Add1);
                    if (!objFA_HedgingRow.IsHA_Add2Null())
                        db.AddInParameter(command, "@HA_Add2", DbType.String, objFA_HedgingRow.HA_Add2);
                    if (!objFA_HedgingRow.IsHA_MobileNull())
                        db.AddInParameter(command, "@HA_Mobile", DbType.String, objFA_HedgingRow.HA_Mobile);
                    if (!objFA_HedgingRow.IsHA_CityNull())
                        db.AddInParameter(command, "@HA_City", DbType.String, objFA_HedgingRow.HA_City);
                    if (!objFA_HedgingRow.IsHA_CntryNull())
                        db.AddInParameter(command, "@HA_Cntry", DbType.String, objFA_HedgingRow.HA_Cntry);
                    if (!objFA_HedgingRow.IsHA_contactNull())
                        db.AddInParameter(command, "@HA_contact", DbType.String, objFA_HedgingRow.HA_contact);
                    if (!objFA_HedgingRow.IsHA_emailNull())
                        db.AddInParameter(command, "@HA_email", DbType.String, objFA_HedgingRow.HA_email);
                    if (!objFA_HedgingRow.IsHA_bankNmNull())
                        db.AddInParameter(command, "@HA_bankNm", DbType.String, objFA_HedgingRow.HA_bankNm);
                    if (!objFA_HedgingRow.IsHA_BankACNull())
                        db.AddInParameter(command, "@HA_BankAC", DbType.String, objFA_HedgingRow.HA_BankAC);
                    if (!objFA_HedgingRow.IsHA_RTGSNull())
                        db.AddInParameter(command, "@HA_RTGS", DbType.String, objFA_HedgingRow.HA_RTGS);
                    if (!objFA_HedgingRow.IsHA_PANNull())
                        db.AddInParameter(command, "@HA_PAN", DbType.String, objFA_HedgingRow.HA_PAN);
                    if (!objFA_HedgingRow.IsHA_GLACNull())
                        db.AddInParameter(command, "@HA_GLAC", DbType.String, objFA_HedgingRow.HA_GLAC);
                    if (!objFA_HedgingRow.IsHA_SLACNull())
                        db.AddInParameter(command, "@HA_SLAC", DbType.String, objFA_HedgingRow.HA_SLAC);
                    if (!objFA_HedgingRow.IsHA_STax_NumberNull())
                        db.AddInParameter(command, "@HA_STax_Number", DbType.String, objFA_HedgingRow.HA_STax_Number);
                    if (!objFA_HedgingRow.IsHA_Regn_NumberNull())
                        db.AddInParameter(command, "@HA_Regn_Number", DbType.String, objFA_HedgingRow.HA_Regn_Number);
                    if (!objFA_HedgingRow.IsHA_Live_StatNull())
                        db.AddInParameter(command, "@HA_Live_Stat", DbType.String, objFA_HedgingRow.HA_Live_Stat);
                    if (!objFA_HedgingRow.IsHT_IdNull())
                        db.AddInParameter(command, "@HT_Id", DbType.Int32, objFA_HedgingRow.HT_Id);
                    if (!objFA_HedgingRow.IsHT_NONull())
                        db.AddInParameter(command, "@HT_NO", DbType.String, objFA_HedgingRow.HT_NO);
                    if (!objFA_HedgingRow.IsHT_DateNull())
                        db.AddInParameter(command, "@HT_Date", DbType.DateTime, objFA_HedgingRow.HT_Date);
                    if (!objFA_HedgingRow.IsHedge_DateNull())
                        db.AddInParameter(command, "@Hedge_Date", DbType.DateTime, objFA_HedgingRow.Hedge_Date);
                    if (!objFA_HedgingRow.IsHedge_Due_DateNull())
                        db.AddInParameter(command, "@Hedge_Due_Date", DbType.DateTime, objFA_HedgingRow.Hedge_Due_Date);
                    if (!objFA_HedgingRow.IsHedge_Curr_CodeNull())
                        db.AddInParameter(command, "@Hedge_Curr_Code", DbType.Int32, objFA_HedgingRow.Hedge_Curr_Code);
                    if (!objFA_HedgingRow.IsHedge_Cover_AmtNull())
                        db.AddInParameter(command, "@Hedge_Cover_Amt", DbType.Decimal, objFA_HedgingRow.Hedge_Cover_Amt);
                    if (!objFA_HedgingRow.IsHT_Tran_AMTNull())
                        db.AddInParameter(command, "@HT_Tran_AMT", DbType.Decimal, objFA_HedgingRow.HT_Tran_AMT);
                    if (!objFA_HedgingRow.IsHedge_PremimNull())
                        db.AddInParameter(command, "@Hedge_Premim", DbType.Decimal, objFA_HedgingRow.Hedge_Premim);
                    if (!objFA_HedgingRow.IsHead_Premim_Per_HCCNull())
                        db.AddInParameter(command, "@Head_Premim_Per_HCC", DbType.Decimal, objFA_HedgingRow.Head_Premim_Per_HCC);
                    if (!objFA_HedgingRow.IsPrem_FreqNull())
                        db.AddInParameter(command, "@Prem_Freq", DbType.Int32, objFA_HedgingRow.Prem_Freq);
                    if (!objFA_HedgingRow.IsPrem_Due_FromNull())
                        db.AddInParameter(command, "@Prem_Due_From", DbType.DateTime, objFA_HedgingRow.Prem_Due_From);
                    if (!objFA_HedgingRow.IsHedge_RemNull())
                        db.AddInParameter(command, "@Hedge_Rem", DbType.String, objFA_HedgingRow.Hedge_Rem);
                    if (!objFA_HedgingRow.IsHedge_Doc_PathNull())
                        db.AddInParameter(command, "@Hedge_Doc_Path", DbType.String, objFA_HedgingRow.Hedge_Doc_Path);
                    if (!objFA_HedgingRow.IsHT_Tran_StatNull())
                        db.AddInParameter(command, "@HT_Tran_Stat", DbType.String, objFA_HedgingRow.HT_Tran_Stat);
                    db.AddOutParameter(command, "@OutHT_ID", DbType.Int32, sizeof(Int32));
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

                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                intHT_ID = Convert.ToInt32(command.Parameters["@OutHT_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intErrorCode == 0)
                            //    intErrorCode = 50;
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion

    }
}
