using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;
using FA_BusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace FA_DALayer.FinancialAccounting
{
   public  class ClsPubCollateralMaster
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralMasterDataTable objCollateralMaster_DTB;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralMasterRow objCollateralMasterRow;
       
        Database db;
        public ClsPubCollateralMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }
        public int FunPubCreateCollateralMaster(FASerializationMode SerMode, byte[] bytesobjCollateralMaster_DTB, string strConnectionName, out int intCLTMst_ID,out string strCollateralRefNo)
        {
            strCollateralRefNo=string.Empty;
            try
            {
                intCLTMst_ID=intErrorCode=0;
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                objCollateralMaster_DTB=(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjCollateralMaster_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralMasterDataTable));
                DbCommand dbcmd = null;
                foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralMasterRow objCollateralMasterRow in objCollateralMaster_DTB.Rows)
                {
                    dbcmd = db.GetStoredProcCommand("FA_INS_CLT_MST");
                     db.AddInParameter(dbcmd, "@Collateral_ID", DbType.Int32, objCollateralMasterRow.Collateral_ID);
                     db.AddInParameter(dbcmd, "@Company_ID", DbType.Int32, objCollateralMasterRow.Company_ID);
                     db.AddInParameter(dbcmd, "@Level_Desc", DbType.String, objCollateralMasterRow.Collateral_Level_Description);
                     db.AddInParameter(dbcmd, "@Is_Active", DbType.Boolean, objCollateralMasterRow.Is_Active);
                     db.AddInParameter(dbcmd, "@User_ID", DbType.Int32, objCollateralMasterRow.Created_By);
                        db.AddInParameter(dbcmd, "@XmlCollateralDetails", DbType.String,objCollateralMasterRow.XmlCollateralDetails);
                        db.AddOutParameter(dbcmd, "@OutResult", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(dbcmd, "@Collateral_Ref_No", DbType.String, 50);
                        db.AddOutParameter(dbcmd, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(dbcmd, "@OutCLTMst_ID", DbType.Int32, sizeof(Int32));
                    //db.AddInParameter(dbcmd, "@XmlCollateralDetails", DbType.String, objDealMasterRow.XmlCollateralDetails);

                    using (DbConnection con =db.CreateConnection())
                    {
                        con.Open();
                        DbTransaction trans = con.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(dbcmd, ref trans);
                            if ((int)dbcmd.Parameters["@ErrorCode"].Value!= 0)
                            {
                                int_OutResult = (int)dbcmd.Parameters["@ErrorCode"].Value;
                                trans.Rollback();

                            }
                            else
                            {
                                trans.Commit();
                                if ((int)dbcmd.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(dbcmd.Parameters["@OutResult"].Value);
                                intCLTMst_ID = Convert.ToInt32(dbcmd.Parameters["@OutCLTMst_ID"].Value);
                                strCollateralRefNo = Convert.ToString(dbcmd.Parameters["@Collateral_Ref_No"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
                            
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        {
                            con.Close();
                        }
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
      
    }
    
}
