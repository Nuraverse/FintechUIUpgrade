#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Exchange Master 
/// Created By			: Muni Kavitha
/// Created Date		: 23-Jan-2012
/// Purpose	            : DAL Class for Exchange Master
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
#endregion

    namespace FA_DALayer.SysAdmin
    {
        public class ClsPubExchangeMaster
        {
            #region Initialization
            int intErrorCode, int_OutResult;
            string strConnection = string.Empty;
            FA_BusEntity .SysAdmin .SystemAdmin.FA_Sys_ExchangeMasterDataTable objExchangeMaster_DTB;
            FA_BusEntity .SysAdmin .SystemAdmin .FA_Sys_ExchangeMasterRow objExchangeMasterRow;
           
            //Code added for getting common connection string from config file
            Database db;
            public ClsPubExchangeMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion

            #region Insert/Update Exchange Rate Details

            /// <summary>
            /// Insert/Update Exchange Rate Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_LOBMasterDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubInsertExchangeMaster(FASerializationMode SerMode, byte[] bytesobjExchangeMaster_DTB, string strConnectionName, out int intExchangeRate_ID)
            {
                try
                {
                    intExchangeRate_ID = intErrorCode = 0;

                    objExchangeMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjExchangeMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterDataTable));
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_ExchangeMasterRow objExchangeMasterRow in objExchangeMaster_DTB.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand(SPNames.InsertExchangeRate);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objExchangeMasterRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objExchangeMasterRow.User_ID);
                        db.AddInParameter(command, "@Exch_Rate_ID", DbType.Int32, objExchangeMasterRow.Exch_Rate_ID);
                        db.AddInParameter(command, "@XML_ExchRate", DbType.String, objExchangeMasterRow.XML_ExchRate_DTL);
                        //db.AddInParameter(command, "@option ", DbType.Int32, objExchangeMasterRow.option);
                        db.AddOutParameter(command, "@outExch_Rate_ID", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));

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
                                    throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                    if ((int)command.Parameters["@outExch_Rate_ID"].Value >0)
                                        intExchangeRate_ID = Convert.ToInt32(command.Parameters["@outExch_Rate_ID"].Value);
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

        }
    }


