using System;
using FA_DALayer.FA_SysAdmin;
using System.Text;
using FA_BusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubDeliveryInstruction
    {
       
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
       
       FA_BusEntity.FinancialAccounting.FATransactions.FA_InsertDeliveryInstructionDataTable objLPO_List;
         Database db;
         public ClsPubDeliveryInstruction(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }
         public int FunPubCreateLPO(FASerializationMode SerMode, byte[] bytesobjLPO_List, string strConnectionName, out string strDocNo)
         {
             try
             {
                 strDocNo = "";
                 intErrorCode = 0;
                 objLPO_List = (FA_BusEntity.FinancialAccounting.FATransactions.FA_InsertDeliveryInstructionDataTable)FAClsPubSerialize.DeSerialize(bytesobjLPO_List, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable));
                 DbCommand command = null;
                 foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_InsertDeliveryInstructionRow objLPOmstrow in objLPO_List.Rows)
                 {
                    command = db.GetStoredProcCommand(SPNames.Fa_Ins_Di);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objLPOmstrow.Company_ID);
                    db.AddInParameter(command, "@Activity_ID", DbType.Int32, objLPOmstrow.Activity_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objLPOmstrow.Location_ID);
                    db.AddInParameter(command, "@Is_Fixed ", DbType.Int32, objLPOmstrow.IS_Fixed);
                    db.AddInParameter(command, "@Auth_Status", DbType.Int32, objLPOmstrow.Auth_Status);
                    if (objLPOmstrow.LPO_ID > 0)
                        db.AddInParameter(command, "@LPO_ID", DbType.Int32, objLPOmstrow.LPO_ID);
                    db.AddInParameter(command, "@Vendor_ID", DbType.Int32, objLPOmstrow.Vendor_ID);
                    db.AddInParameter(command, "@DI_Date", DbType.DateTime, objLPOmstrow.DI_Date);
                    if (!objLPOmstrow.IsDeliveryInstruction_Statustype_CodeNull())
                    db.AddInParameter(command, "@Di_Statustype_Code", DbType.Int32, objLPOmstrow.DeliveryInstruction_Statustype_Code);
                    if (!objLPOmstrow.IsDeliveryInstruction_Status_CodeNull())
                    db.AddInParameter(command, "@DI_Status_Code", DbType.Int32, objLPOmstrow.DeliveryInstruction_Status_Code);
                    db.AddInParameter(command, "@Created_by", DbType.Int32, objLPOmstrow.Created_By);
                    db.AddInParameter(command, "@Created_On", DbType.DateTime, objLPOmstrow.Created_On);
                    if (!objLPOmstrow.IsModified_ByNull())
                    db.AddInParameter(command, "@Modified_by", DbType.Int32, objLPOmstrow.Modified_By);
                    if (!objLPOmstrow.IsModified_OnNull())
                    db.AddInParameter(command, "@Modified_On", DbType.DateTime, objLPOmstrow.Modified_On);
                    if (!objLPOmstrow.IsTXN_IdNull())
                    db.AddInParameter(command, "@Txn_Id", DbType.Int32, objLPOmstrow.TXN_Id);
                    FADALDBType enumDBType=Common.ClsIniFileAccess.FA_DBType;
                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            if (!objLPOmstrow.IsXML_DeliveryDeltailsNull())
                            {
                                OracleParameter param;
                                param = new OracleParameter("@XML_DeliveryDeltails", OracleType.Clob,
                                           objLPOmstrow.XML_DeliveryDeltails.Length, ParameterDirection.Input, true,
                                           0, 0, String.Empty, DataRowVersion.Default, objLPOmstrow.XML_DeliveryDeltails);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!objLPOmstrow.IsXML_DeliveryDeltailsNull())
                            db.AddInParameter(command, "@XML_DeliveryDeltails", DbType.String, objLPOmstrow.XML_DeliveryDeltails);
                        }
                    if (!objLPOmstrow.IsLPO_NoNull())
                    db.AddInParameter(command, "@LPO_NO", DbType.String, objLPOmstrow.LPO_No);
                    if (!objLPOmstrow.IsQuotation_NoNull())
                    db.AddInParameter(command, "@Quotation_No", DbType.String, objLPOmstrow.Quotation_No);
                    if (!objLPOmstrow.IsQuotation_DateNull())
                        db.AddInParameter(command, "@Quotation_Date", DbType.DateTime, objLPOmstrow.Quotation_Date);
                    if (!objLPOmstrow.IsCredit_daysNull())
                        db.AddInParameter(command, "@Credit_Days", DbType.Int32, objLPOmstrow.Credit_days);
                    if (!objLPOmstrow.IsTermsNull())
                        db.AddInParameter(command, "@Terms", DbType.String, objLPOmstrow.Terms);
                    if (!objLPOmstrow.IsBill_TypeNull())
                        db.AddInParameter(command, "@Bill_Type", DbType.Int32, objLPOmstrow.Bill_Type);
                     db.AddOutParameter(command, "@Outdocno", DbType.String, 100);
                     db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                     db.AddOutParameter(command, "@Errorcode", DbType.Int32, sizeof(Int64));
                     if (!objLPOmstrow.IsNarrationNull())
                         db.AddInParameter(command, "@Narration", DbType.String, objLPOmstrow.Narration);
                     if (!objLPOmstrow.IsFavouring_NameNull())
                         db.AddInParameter(command, "@Favouring_Name", DbType.String, objLPOmstrow.Favouring_Name);
                    
                     using (DbConnection conn = db.CreateConnection())
                     {
                         conn.Open();
                         DbTransaction trans = conn.BeginTransaction();
                         try
                         {
                             //db.ExecuteNonQuery(command, trans);
                             db.FunPubExecuteNonQuery(command, ref trans);
                             if ((int)command.Parameters["@Errorcode"].Value > 0)
                             {
                                 int_OutResult = (int)command.Parameters["@Errorcode"].Value;
                                 throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                             }
                             else
                             {
                                 trans.Commit();
                                 if ((int)command.Parameters["@OutResult"].Value > 0)
                                     int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                 strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                             }
                         }
                          catch (Exception ex)
                            {
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


             
             catch (Exception exp)
             {
                 
                 FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                 throw exp;
             }
             return int_OutResult;

         }
    }
}
