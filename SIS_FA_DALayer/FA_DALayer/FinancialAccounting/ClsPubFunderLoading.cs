
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Funder Loading 
/// Created By			: Muni Kavitha
/// Created Date		: 14-Feb-2012
/// Purpose	            : DAL Class for Funder Loading
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

namespace FA_DALayer.FinancialAccounting
{
   public class ClsPubFunderLoading
    {
        #region Initialization
            int intErrorCode;
            int int_OutResult;
            string strConnection = string.Empty;

       FA_BusEntity .FinancialAccounting .FunderInvestment .FA_FUNDER_LOADING_MSTDataTable objFunderLoading_DTB;
       //FA_BusEntity .FinancialAccounting .FunderInvestment .FA_FUNDER_LOADING_MSTRow  objFunderLoadingRow;


            //Code added for getting common connection string from config file
            Database db;
            public ClsPubFunderLoading(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion
            #region Insert/Update Funder Loading Details

            /// <summary>
            /// Insert/Update Funder Loading Details 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesobjFunderLoading_DTB"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubInsertFunderLoading(FASerializationMode SerMode, byte[] bytesobjFunderLoading_DTB, string strConnectionName, out int intFunder_Loading_ID, out string strDocNo)
            {
                strDocNo = "";
                try
                {
                    intFunder_Loading_ID = intErrorCode = 0;
                    objFunderLoading_DTB = (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_LOADING_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjFunderLoading_DTB, SerMode, typeof(FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_LOADING_MSTDataTable ));
                    DbCommand command = null;
                    command = db.GetStoredProcCommand(SPNames.InsertFunderLoading);
                    foreach (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_FUNDER_LOADING_MSTRow objFunderLoadingRow in objFunderLoading_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFunderLoadingRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objFunderLoadingRow.Created_By);
                        db.AddInParameter(command, "@Funder_ID", DbType.Int32, objFunderLoadingRow.Funder_ID);
                        db.AddInParameter(command, "@Funder_Loading_ID", DbType.String, objFunderLoadingRow.Funder_Loading_ID );
                        if(!string .IsNullOrEmpty (objFunderLoadingRow.Funder_Loading_No))
                            db.AddInParameter(command, "@Funder_Loading_No", DbType.String, objFunderLoadingRow.Funder_Loading_No);
                        if (!string .IsNullOrEmpty(objFunderLoadingRow.Location_ID.ToString ()))
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, objFunderLoadingRow.Location_ID);
                        db.AddInParameter(command, "@Last_Allocated_Date", DbType.String, objFunderLoadingRow.Last_Allocated_Date);
                        db.AddInParameter(command, "@Allocation_Date", DbType.String, objFunderLoadingRow.Allocation_Date);
                        db.AddInParameter(command, "@Option", DbType.String, objFunderLoadingRow.Option);
                        db.AddInParameter(command, "@XML_Loading_DTL", DbType.String, objFunderLoadingRow.XML_Loading_DTL);
                        
                        db.AddOutParameter(command, "@OutFunder_Loading_ID", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);


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
                                    intFunder_Loading_ID = Convert.ToInt32(command.Parameters["@OutFunder_Loading_ID"].Value);
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

    }
}
