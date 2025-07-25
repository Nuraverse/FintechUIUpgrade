using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
   public  class Treasury_Bucket
    {
        int intErrorCode;
        int int_OutResult;
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Treasury_BucketDataTable objDealMaster_DTB;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_ALMPARAMETERDataTable objalm_DTB;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_ALMPARAMETERRow Objalmrow;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_DEAL_MSTRow objDealMasterRow;
       public Treasury_Bucket(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

       public int FunPubInsertTreasuryBucket(FASerializationMode SerMode, byte[] bytesobjDealMaster_DTB, string strConnectionName, out int intDeal_ID)
       {
          
           try
           {
               intDeal_ID = intErrorCode = 0;
               objDealMaster_DTB = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Treasury_BucketDataTable)FAClsPubSerialize.DeSerialize(bytesobjDealMaster_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Treasury_BucketDataTable));
               DbCommand command = null;
               foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_Treasury_BucketRow objDealMasterRow in objDealMaster_DTB.Rows)
               {
                   command = db.GetStoredProcCommand("FA_Insert_Bucket");

                   if (!objDealMasterRow.IsCompany_idNull())
                       db.AddInParameter(command, "@Company_ID", DbType.Int32, objDealMasterRow.Company_id);
                   if (!objDealMasterRow.IsUser_idNull())
                       db.AddInParameter(command, "@User_Id", DbType.Int32, objDealMasterRow.User_id);
                   if (!objDealMasterRow.IsXml_DetNull())
                       db.AddInParameter(command, "@Xml_Det", DbType.String, objDealMasterRow.Xml_Det);
                   db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, int_OutResult);
                   db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                   using (DbConnection conn = db.CreateConnection())
                   {
                       conn.Open();
                       DbTransaction trans = conn.BeginTransaction();
                       try
                       {


                           db.FunPubExecuteNonQuery(command, ref trans);
                           if ((int)command.Parameters["@ErrorValue"].Value > 0)
                           {
                               int_OutResult = (int)command.Parameters["@ErrorValue"].Value;
                               throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                           }
                           else
                           {

                               if ((int)command.Parameters["@ReturnOutput"].Value > 0)
                                   int_OutResult = Convert.ToInt32(command.Parameters["@ReturnOutput"].Value);
                              // intDeal_ID = Convert.ToInt32(command.Parameters["@OutDeal_ID"].Value);
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

       public int FunPubInsertALMParameter(FASerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID)
       {

           try
           {
               intDeal_ID = intErrorCode = 0;
               objalm_DTB = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_ALMPARAMETERDataTable)FAClsPubSerialize.DeSerialize(bytesobjalm_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_ALMPARAMETERRow));
               DbCommand command = null;
               foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_ALMPARAMETERRow Objalmrow in objalm_DTB.Rows)
               {
                   command = db.GetStoredProcCommand("FA_Insert_ALM_Parameter");

                   if (!Objalmrow.IsCompany_IDNull())
                       db.AddInParameter(command, "@Company_ID", DbType.Int32, Objalmrow.Company_ID);
                   if (!Objalmrow.IsUser_idNull())
                       db.AddInParameter(command, "@User_Id", DbType.Int32, Objalmrow.User_id);
                   if (!Objalmrow.IsXml_DetNull())
                       db.AddInParameter(command, "@Xml_Det", DbType.String, Objalmrow.Xml_Det);
                   db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, int_OutResult);
                   db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                   using (DbConnection conn = db.CreateConnection())
                   {
                       conn.Open();
                       DbTransaction trans = conn.BeginTransaction();
                       try
                       {


                           db.FunPubExecuteNonQuery(command, ref trans);
                           if ((int)command.Parameters["@ErrorValue"].Value > 0)
                           {
                               int_OutResult = (int)command.Parameters["@ErrorValue"].Value;
                               throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                           }
                           else
                           {

                               if ((int)command.Parameters["@ReturnOutput"].Value > 0)
                                   int_OutResult = Convert.ToInt32(command.Parameters["@ReturnOutput"].Value);
                               // intDeal_ID = Convert.ToInt32(command.Parameters["@OutDeal_ID"].Value);
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



    }
}
