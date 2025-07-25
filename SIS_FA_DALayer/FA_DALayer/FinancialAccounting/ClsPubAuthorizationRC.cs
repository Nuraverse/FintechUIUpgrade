using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubAuthorizationRC
    {
        int intRowsAffected;
        string strConnection = string.Empty;
        //S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterDataTable ObjConstitutionMster_Datatable;
        //S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPDataTable ObjTransactionType_Datatable;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable ObjAuthorization_DataTable;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubAuthorizationRC(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        //public S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterDataTable FunQueryConstitutionMaster(FASerializationMode Sermode, byte[] bytesConstitutionMaster)
        //{
        //    S3GBusEntity.Origination.RuleCardMgtServices DsConstitutionMaster = new S3GBusEntity.Origination.RuleCardMgtServices();
        //    ObjConstitutionMster_Datatable = (S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterDataTable)FAClsPubSerialize.DeSerialize(bytesConstitutionMaster, Sermode, typeof(S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterDataTable));
        //    try
        //    {
        //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
        //        DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetStatusLookUp");
        //        foreach (S3GBusEntity.Origination.RuleCardMgtServices.S3G_ORG_ConstitutionMasterRow ObjRow in ObjConstitutionMster_Datatable.Rows)
        //        {
        //            db.AddInParameter(command, "@Option", DbType.Int32, ObjRow.ID);
        //        }
        //        db.FunPubLoadDataSet(command, DsConstitutionMaster, DsConstitutionMaster.S3G_ORG_ConstitutionMaster.TableName);
        //    }
        //    catch (Exception ex)
        //    {
        //          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //    }
        //    return DsConstitutionMaster.S3G_ORG_ConstitutionMaster;

        //}
        //public S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPDataTable FunQueryTransactionTypeMaster(FASerializationMode Sermode, byte[] bytesTransactionTypeMaster)
        //{
        //    S3GBusEntity.Origination.RuleCardMgtServices DsTransactionType = new S3GBusEntity.Origination.RuleCardMgtServices();
        //    ObjTransactionType_Datatable = (S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPDataTable)FAClsPubSerialize.DeSerialize(bytesTransactionTypeMaster, Sermode, typeof(S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPDataTable));
        //    try
        //    {
        //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
        //        DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetTransactionType");
        //        foreach (S3GBusEntity.Origination.RuleCardMgtServices.S3G_Status_LookUPRow ObjRow in ObjTransactionType_Datatable.Rows)
        //        {
        //            db.AddInParameter(command, "@TransactionType", DbType.String, ObjRow.Type);

        //        }
        //        db.FunPubLoadDataSet(command, DsTransactionType, DsTransactionType.S3G_Status_LookUP.TableName);
        //    }
        //    catch (Exception ex)
        //    {
        //          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //    }
        //    return DsTransactionType.S3G_Status_LookUP;
        //}
        public DataSet FunQueryAuthorizationRuleCard(FASerializationMode Sermode, byte[] bytesAuthorizationRuleCard)
        {
            DataSet DsAuthorizationRulecard = new DataSet();
            ObjAuthorization_DataTable = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable)FAClsPubSerialize.DeSerialize(bytesAuthorizationRuleCard, Sermode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable));
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_SYS_GetAuthrc");
                foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCRow ObjRow in ObjAuthorization_DataTable.Rows)
                {
                    if (!ObjRow.IsAuthorization_Rule_Card_IDNull())
                        db.AddInParameter(command, "@Authorization_Rule_Card_ID", DbType.Int32, ObjRow.Authorization_Rule_Card_ID);
                    if (!ObjRow.IsCompany_IDNull())
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRow.Company_ID);
                    //if (!ObjRow.IsLOB_IDNull())
                    //    db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjRow.LOB_ID);
                    //if (!ObjRow.IsConstitution_IDNull())
                    //    db.AddInParameter(command, "@Constitution_ID", DbType.Int32, ObjRow.Constitution_ID);
                    //if (!ObjRow.IsProduct_IDNull())
                    //    db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjRow.Product_ID);
                    //db.AddInParameter(command, "@Activity", DbType.Int32, ObjRow.Activity_Id);
                    if (!ObjRow.IsTransaction_TypeNull())
                        db.AddInParameter(command, "@Transaction_Type", DbType.Int32, ObjRow.Transaction_Type);
                    if (!ObjRow.IsProgram_IdNull())
                        db.AddInParameter(command, "@Program_Id", DbType.Int32, ObjRow.Program_Id);
                    DsAuthorizationRulecard = db.FunPubExecuteDataSet(command);

                }
                return DsAuthorizationRulecard;
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            finally
            {
                DsAuthorizationRulecard.Dispose();
                DsAuthorizationRulecard = null;
            }

        }
        public int FunPubCreateAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesAuthorizationRuleCard_Datatable)
        {
            try
            {
                ObjAuthorization_DataTable = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable)FAClsPubSerialize.DeSerialize(bytesAuthorizationRuleCard_Datatable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable));
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_INSERT_AUTHRC");
                foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCRow ObjRow in ObjAuthorization_DataTable.Rows)
                {
                    db.AddInParameter(command, "@Activity", DbType.Int32, ObjRow.Activity_Id);
                    db.AddInParameter(command, "@Transaction_Type", DbType.Int32, ObjRow.Transaction_Type);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRow.Company_ID);
                    db.AddInParameter(command, "@Program_Id", DbType.Int32, ObjRow.Program_Id);
                    //db.AddInParameter(command, "@XML_RuleCard_Approvals", DbType.String, ObjRow.XMLRuleCardApprovals);
                    //Modified By Chandrasekar K On 18-Dec-2012
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XML_RuleCard_Detail", OracleType.Clob,
                               ObjRow.XMLRulecardDetail.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjRow.XMLRulecardDetail);
                        command.Parameters.Add(param);

                        OracleParameter param1 = new OracleParameter("@XML_RuleCard_Approvals", OracleType.Clob,
                                    ObjRow.XMLRuleCardApprovals.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjRow.XMLRuleCardApprovals);
                        command.Parameters.Add(param1);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_RuleCard_Detail", DbType.String, ObjRow.XMLRulecardDetail);
                        db.AddInParameter(command, "@XML_RuleCard_Approvals", DbType.String, ObjRow.XMLRuleCardApprovals);
                    }
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjRow.Created_By);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjRow.Is_Active);
                    db.AddInParameter(command, "@Entity_Type_ID", DbType.Int32, ObjRow.Entity_Type);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            if (intRowsAffected == 0)
                                trans.Commit();
                            else
                                trans.Rollback();

                        }
                        catch (Exception ex)
                        {
                            // Roll back the transaction. 
                            intRowsAffected = 20;
                            trans.Rollback();
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);

                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 20;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            }
            return intRowsAffected;
        }
        public int FunPubModifyAuthorizationRuleCard(FASerializationMode SerMode, byte[] bytesAuthorizationRulecard_DataTable)
        {
            try
            {
                ObjAuthorization_DataTable = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable)FAClsPubSerialize.DeSerialize(bytesAuthorizationRulecard_DataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCDataTable));
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_UPDATE_AUTHRC");
                foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_SYS_AuthRCRow ObjRow in ObjAuthorization_DataTable.Rows)
                {
                    db.AddInParameter(command, "@Authorization_Rule_Card_ID", DbType.Int32, ObjRow.Authorization_Rule_Card_ID);
                    db.AddInParameter(command, "@Activity", DbType.Int32, ObjRow.Activity_Id);
                    db.AddInParameter(command, "@Transaction_Type", DbType.Int32, ObjRow.Transaction_Type);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRow.Company_ID);
                    db.AddInParameter(command, "@Program_Id", DbType.Int32, ObjRow.Program_Id);
                    
                    //db.AddInParameter(command, "@XML_RuleCard_Approvals", DbType.String, ObjRow.XMLRuleCardApprovals);
                    //Modified By Chandrasekar K On 18-Dec-2012
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XML_RuleCard_Detail", OracleType.Clob,
                               ObjRow.XMLRulecardDetail.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjRow.XMLRulecardDetail);
                        command.Parameters.Add(param);

                        OracleParameter param1 = new OracleParameter("@XML_RuleCard_Approvals", OracleType.Clob,
                                    ObjRow.XMLRuleCardApprovals.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjRow.XMLRuleCardApprovals);
                        command.Parameters.Add(param1);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_RuleCard_Detail", DbType.String, ObjRow.XMLRulecardDetail);
                        db.AddInParameter(command, "@XML_RuleCard_Approvals", DbType.String, ObjRow.XMLRuleCardApprovals);
                    }
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjRow.Is_Active);
                    db.AddInParameter(command, "@Entity_Type_ID", DbType.Int32, ObjRow.Entity_Type);
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjRow.Modified_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            if (intRowsAffected == 0)
                                trans.Commit();
                            else
                                trans.Rollback();
                        }
                        catch (Exception ex)
                        {
                            // Roll back the transaction. 
                            intRowsAffected = 20;
                            trans.Rollback();
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);

                        }
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 20;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            }
            return intRowsAffected;
        }

    }
}
