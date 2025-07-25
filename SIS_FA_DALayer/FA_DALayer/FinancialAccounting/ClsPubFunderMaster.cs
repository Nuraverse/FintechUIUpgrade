#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Funder Master 
/// Created By			: Muni Kavitha
/// Created Date		: 3-Feb-2012
/// Purpose	            : DAL Class for Funder Master
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;
#endregion


namespace FA_DALayer.FinancialAccounting
{
   public class ClsPubFunderMaster
    {
        #region Initialization
            int intErrorCode;
            int int_OutResult;
            string strConnection = string.Empty;
       //FA_BusEntity .FinancialAccounting .FunderInvestment .FA_FUNDER_MSTDataTable objFunderMaster_DTB;
       //FA_BusEntity .FinancialAccounting .FunderInvestment .FA_FUNDER_MSTRow objFunderMasterRow;
            FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_FUNDER_MSTDataTable objFunderMaster_DTB;
            FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_FUNDER_MSTRow objFunderMasterRow;
            FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
            //Code added for getting common connection string from config file
            Database db;
            public ClsPubFunderMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion


            #region Insert/Update Funder Master Details

            /// <summary>
            /// Insert/Update Funder Master Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_LOBMasterDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubInsertFunderMaster(FASerializationMode SerMode, byte[] bytesobjFunderMaster_DTB, string strConnectionName, out int intFunder_ID, out string strDocNo)
            {
                strDocNo = "";
                try
                {
                    intFunder_ID = intErrorCode = 0;
                    objFunderMaster_DTB = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_FUNDER_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjFunderMaster_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_FUNDER_MSTDataTable));
                    DbCommand command = null;
                    foreach (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_FUNDER_MSTRow objFunderMasterRow in objFunderMaster_DTB.Rows)
                    {
                        command = db.GetStoredProcCommand(SPNames.InsertFunderMaster);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFunderMasterRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFunderMasterRow.Created_By);
                        db.AddInParameter(command, "@Funder_ID", DbType.Int32, objFunderMasterRow.Funder_ID);
                        db.AddInParameter(command, "@Funder_Code", DbType.String, objFunderMasterRow.Funder_Code);
                        db.AddInParameter(command, "@Funder_Name", DbType.String, objFunderMasterRow.Funder_Name);
                        if (objFunderMasterRow.Location_ID != null)
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, objFunderMasterRow.Location_ID);
                        db.AddInParameter(command, "@GL_Code", DbType.String, objFunderMasterRow.GL_Code);
                        db.AddInParameter(command, "@SL_Code", DbType.String, objFunderMasterRow.SL_Code);
                        db.AddInParameter(command, "@base_rate", DbType.Int32, objFunderMasterRow.Base_Rate_Type);
                        db.AddInParameter(command, "@base_rate_value", DbType.String, objFunderMasterRow.Base_Rate_Value);
                        db.AddInParameter(command, "@Comm_Address1", DbType.String, objFunderMasterRow.Comm_Address1);
                        db.AddInParameter(command, "@Comm_Address2", DbType.String, objFunderMasterRow.Comm_Address2);
                        db.AddInParameter(command, "@Comm_City", DbType.String, objFunderMasterRow.Comm_City);
                        db.AddInParameter(command, "@Comm_State", DbType.String, objFunderMasterRow.Comm_State);
                        db.AddInParameter(command, "@Comm_Country", DbType.String, objFunderMasterRow.Comm_Country);
                        db.AddInParameter(command, "@Comm_EMail", DbType.String, objFunderMasterRow.Comm_EMail);
                        db.AddInParameter(command, "@Comm_Mobile", DbType.String, objFunderMasterRow.Comm_Mobile);
                        db.AddInParameter(command, "@Comm_Pincode", DbType.String, objFunderMasterRow.Comm_Pincode);
                        db.AddInParameter(command, "@Comm_Telephone", DbType.String, objFunderMasterRow.Comm_Telephone);
                        db.AddInParameter(command, "@Comm_Website", DbType.String, objFunderMasterRow.Comm_Website);

                        db.AddInParameter(command, "@Perm_Address1", DbType.String, objFunderMasterRow.Perm_Address1);
                        db.AddInParameter(command, "@Perm_Address2", DbType.String, objFunderMasterRow.Perm_Address2);
                        db.AddInParameter(command, "@Perm_City", DbType.String, objFunderMasterRow.Perm_City);
                        db.AddInParameter(command, "@Perm_State", DbType.String, objFunderMasterRow.Perm_State);
                        db.AddInParameter(command, "@Perm_Country", DbType.String, objFunderMasterRow.Perm_Country);
                        db.AddInParameter(command, "@Perm_EMail", DbType.String, objFunderMasterRow.Perm_EMail);
                        db.AddInParameter(command, "@Perm_Mobile", DbType.String, objFunderMasterRow.Perm_Mobile);
                        db.AddInParameter(command, "@Perm_Pincode", DbType.String, objFunderMasterRow.Perm_Pincode);
                        db.AddInParameter(command, "@Perm_Telephone", DbType.String, objFunderMasterRow.Perm_Telephone);
                        db.AddInParameter(command, "@Perm_Website", DbType.String, objFunderMasterRow.Perm_Website);

                        db.AddInParameter(command, "@TAX_Number", DbType.String, objFunderMasterRow.TAX_Number);
                        db.AddInParameter(command, "@VAT_Number", DbType.String, objFunderMasterRow.VAT_Number);
                        db.AddInParameter(command, "@Remarks", DbType.String, objFunderMasterRow.Remarks);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, objFunderMasterRow.Is_Active);
                        db.AddInParameter(command, "@XML_Conditions", DbType.String, objFunderMasterRow.XML_Conditions);
                        db.AddInParameter(command, "@XML_Bank", DbType.String, objFunderMasterRow.XML_Bank);
                        db.AddInParameter(command, "@XML_AcctMap", DbType.String, objFunderMasterRow.XML_AcctMap);
                        db.AddOutParameter(command, "@OutFunder_ID", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                        if (enumDBType == FADALDBType.ORACLE)
                        {

                            OracleParameter param = new OracleParameter("@XML_CONTACT_PER_DTL", OracleType.Clob,
                                   objFunderMasterRow.XML_CONTACT_PER_DTL.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFunderMasterRow.XML_CONTACT_PER_DTL);
                            command.Parameters.Add(param);

                        }
                        else
                            db.AddInParameter(command, "@XML_CONTACT_PER_DTL", DbType.String, objFunderMasterRow.XML_CONTACT_PER_DTL);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
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
                                    intFunder_ID = Convert.ToInt32(command.Parameters["@OutFunder_ID"].Value);
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

    }
}
