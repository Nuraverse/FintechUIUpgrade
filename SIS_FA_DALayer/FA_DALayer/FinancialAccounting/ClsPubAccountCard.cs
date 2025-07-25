#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Account card
/// Created By			: M.saran
/// Created Date		: 
/// Purpose	            : To Create/Update Account Card

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
    public class ClsPubAccountCard
    {

        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        FA_BusEntity.FinancialAccounting.AccountManagement.FA_AccountCardDataTable objAccountCardDataTable;
        OracleParameter param;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubAccountCard(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region "Insert Accountcard"
        public int FunPubInsertAccountCard(FASerializationMode SerMode, byte[] bytesobjAccountCardDataTable)
        {
            try
            {

                objAccountCardDataTable = (FA_BusEntity.FinancialAccounting.AccountManagement.FA_AccountCardDataTable)FAClsPubSerialize.DeSerialize(bytesobjAccountCardDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.AccountManagement.FA_AccountCardDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.AccountManagement.FA_AccountCardRow ObjAccountCardRow in objAccountCardDataTable.Rows)
                {
                    command = db.GetStoredProcCommand(SPNames.INSERTACCOUNTDETAILS);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccountCardRow.Company_ID);
                    db.AddInParameter(command, "@Account_ID ", DbType.Int32, ObjAccountCardRow.Account_ID);
                    db.AddInParameter(command, "@GL_Code", DbType.String, ObjAccountCardRow.GL_Code);
                    db.AddInParameter(command, "@GL_Desc", DbType.String, ObjAccountCardRow.GL_Desc);
                    db.AddInParameter(command, "@Acct_Type_ID", DbType.Int32, ObjAccountCardRow.Acct_Type_ID);
                    db.AddInParameter(command, "@Posit_Type_ID", DbType.Int32, ObjAccountCardRow.Posit_Type_ID);
                    db.AddInParameter(command, "@Nature_Type_ID", DbType.Int32, ObjAccountCardRow.Nature_Type_ID);
                    db.AddInParameter(command, "@Acct_Leg_ID ", DbType.Int32, ObjAccountCardRow.Acct_Leg_ID);
                    db.AddInParameter(command, "@Acct_Char_ID", DbType.Int32, ObjAccountCardRow.Acct_Char_ID);
                    db.AddInParameter(command, "@User_Id", DbType.Int32, ObjAccountCardRow.User_Id);
                  
                    db.AddInParameter(command, "@SL_Active", DbType.Boolean, ObjAccountCardRow.SL_Active);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjAccountCardRow.Is_Active);
                    db.AddInParameter(command, "@Line_Number", DbType.Int32, ObjAccountCardRow.Line_number);
                    db.AddInParameter(command, "@IS_MJV", DbType.Boolean, ObjAccountCardRow.Is_MJV);
                    db.AddInParameter(command, "@Auto_SL", DbType.Boolean, ObjAccountCardRow.Auto_SL);
                    db.AddInParameter(command, "@Is_Tax", DbType.Boolean, ObjAccountCardRow.Is_Tax);
                    db.AddInParameter(command, "@Is_Lending", DbType.Boolean, ObjAccountCardRow.IS_Lending);
                    db.AddInParameter(command, "@Related_Party", DbType.Boolean, ObjAccountCardRow.Related_party);
                    if (!ObjAccountCardRow.IsNationalityNull())
                    db.AddInParameter(command, "@Nationality", DbType.Int32, ObjAccountCardRow.Nationality);
                    if (!ObjAccountCardRow.IsConstitutionNull())
                    db.AddInParameter(command, "@Constitution", DbType.Int32, ObjAccountCardRow.Constitution);
                    if (!ObjAccountCardRow.IsCR_NumberNull())
                    db.AddInParameter(command, "@CR_Number", DbType.String, ObjAccountCardRow.CR_Number);
                    if (!ObjAccountCardRow.IsCredit_periodNull())
                    db.AddInParameter(command, "@Credit_period", DbType.String, ObjAccountCardRow.Credit_period);
                    if (!ObjAccountCardRow.IsInvestor_TypeNull())
                    db.AddInParameter(command, "@Investor_Type", DbType.Int32, ObjAccountCardRow.Investor_Type);
                    if (!ObjAccountCardRow.IsNo_Of_SharesNull())
                    db.AddInParameter(command, "@No_Of_Shares", DbType.Decimal, ObjAccountCardRow.No_Of_Shares);
                    if (!ObjAccountCardRow.IsInvester_SecurityNull())
                    db.AddInParameter(command, "@Invester_Security", DbType.Int32, ObjAccountCardRow.Invester_Security);
                    if (!ObjAccountCardRow.IsShares_Holding_PerNull())
                    db.AddInParameter(command, "@Shares_Holding_Per", DbType.Decimal, ObjAccountCardRow.Shares_Holding_Per);
                    if (!ObjAccountCardRow.IsPosition_in_CompanyNull())
                    db.AddInParameter(command, "@Position_in_Company", DbType.String, ObjAccountCardRow.Position_in_Company);
                    if (!ObjAccountCardRow.IsRepresent_CompanyNull())
                    db.AddInParameter(command, "@Represent_Company", DbType.String, ObjAccountCardRow.Represent_Company);
                    if (!ObjAccountCardRow.IsGroup_nameNull())
                        db.AddInParameter(command, "@Group_Name", DbType.String, ObjAccountCardRow.Group_name);
                    db.AddInParameter(command, "@Is_Payment", DbType.Boolean, ObjAccountCardRow.Is_Payment);
                    db.AddInParameter(command, "@Is_receipt", DbType.Boolean, ObjAccountCardRow.Is_Receipt);
                    db.AddInParameter(command, "@Is_BRS", DbType.Boolean, ObjAccountCardRow.Is_BRS);
                    //db.AddInParameter(command, "@Bank_Effective_From", DbType.DateTime, ObjAccountCardRow.Bank_Effective_From);
                    //db.AddInParameter(command, "@Bank_Effective_To", DbType.DateTime, ObjAccountCardRow.Bank_Effective_To);
                  
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
                    db.AddInParameter(command, "@Is_SubGL", DbType.Boolean, ObjAccountCardRow.Is_SubGL);
                    db.AddInParameter(command, "@Budget_APPl", DbType.Int32, ObjAccountCardRow.Budget_APPl);
                    if (enumDBType == FADALDBType.ORACLE)
                    {


                        param = new OracleParameter("@XMLBankDetails", OracleType.Clob,
                                 ObjAccountCardRow.XMLBankDetails.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XMLBankDetails);
                        command.Parameters.Add(param);

                        param = new OracleParameter("@XMLEntityDetails", OracleType.Clob,
                                ObjAccountCardRow.XMLEntityDetails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XMLEntityDetails);
                        command.Parameters.Add(param);


                        param = new OracleParameter("@XMLAccountDetails", OracleType.Clob,
                                ObjAccountCardRow.XMLAccountDetails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XMLAccountDetails);
                        command.Parameters.Add(param);


                        param = new OracleParameter("@XMLInstrumentDetails", OracleType.Clob,
                                ObjAccountCardRow.XMLInstrumentDetails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XMLInstrumentDetails);
                        command.Parameters.Add(param);


                        param = new OracleParameter("@XMLLocationDetails", OracleType.Clob,
                                ObjAccountCardRow.XMLLocationDetails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XMLLocationDetails);
                        command.Parameters.Add(param);

                        param = new OracleParameter("@XMLCheque_Leaf", OracleType.Clob,
                                ObjAccountCardRow.XML_Cheque_Leaf.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XML_Cheque_Leaf);
                        command.Parameters.Add(param);

                        param = new OracleParameter("@XML_Activity", OracleType.Clob,
                              ObjAccountCardRow.XML_Activity.Length, ParameterDirection.Input, true,
                              0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XML_Activity);
                        command.Parameters.Add(param);

                        param = new OracleParameter("@XmlAddressDetails", OracleType.Clob,
                            ObjAccountCardRow.XML_Activity.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjAccountCardRow.XmlAddressDetails);
                        command.Parameters.Add(param);

                    }
                    else
                    {
                        db.AddInParameter(command, "@XMLBankDetails", DbType.String, ObjAccountCardRow.XMLBankDetails);
                        db.AddInParameter(command, "@XMLEntityDetails", DbType.String, ObjAccountCardRow.XMLEntityDetails);
                        db.AddInParameter(command, "@XMLAccountDetails", DbType.String, ObjAccountCardRow.XMLAccountDetails);
                        db.AddInParameter(command, "@XMLInstrumentDetails", DbType.String, ObjAccountCardRow.XMLInstrumentDetails);
                        db.AddInParameter(command, "@XMLLocationDetails", DbType.String, ObjAccountCardRow.XMLLocationDetails);
                        db.AddInParameter(command, "@XMLCheque_Leaf", DbType.String, ObjAccountCardRow.XML_Cheque_Leaf);
                        db.AddInParameter(command, "@XML_Activity", DbType.String, ObjAccountCardRow.XML_Activity);
                    }

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //Modified By Chandrasekar K On 22-Sep-2012
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
                        { 
                            conn.Close(); 
                        }
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
