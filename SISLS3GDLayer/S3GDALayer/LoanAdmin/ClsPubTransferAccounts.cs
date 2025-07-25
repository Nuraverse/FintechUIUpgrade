#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Loan Admin
/// Screen Name			: Account Assignment DAL Class
/// Created By			: Tamilselvan.S
/// Created Date		: 19-Jun-2012
/// Purpose	            : DAL Class for Account Assignment Methods
/// Last Updated By		: NULL
/// Last Updated Date   : NULL
/// Reason              : NULL
/// <Program Summary>
#endregion

#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using S3GBusEntity;
using System.Data.OracleClient;
using Entity_LoanAdmin = S3GBusEntity.LoanAdmin;
#endregion

namespace S3GDALayer.LoanAdmin
{
    public class ClsPubTransferAccounts
    {
        #region [Initialization]
        int intRowsAffected;
        int intErrorCode;
        //int intRowsAffected;
        Entity_LoanAdmin.ContractMgtServices.S3G_Sys_TransferAccountsDataTable ObjTransferAccountsDataTable_DAL = null;
        Entity_LoanAdmin.ContractMgtServices.S3G_Sys_TransferAccountsRow ObjTransferAccountsRow = null;

        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubTransferAccounts()
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
        }

        #endregion [Initialization]

        public int FunPubCreateTransferAccountDetails(SerializationMode SerMode, byte[] bytesObjS3G_Sys_TransferAccounts1DataTable, out int strTotalCount)
        {
            try
            {
                strTotalCount = 0;
                ObjTransferAccountsDataTable_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_Sys_TransferAccountsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_Sys_TransferAccounts1DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_Sys_TransferAccountsDataTable));

                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_Sys_TransferAccountsRow ObjTransferofAccountsRow in ObjTransferAccountsDataTable_DAL.Rows)
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_LAD_INS_TRANS_ACC");
                    db.AddInParameter(command, "@TRANS_ACC_HDR_ID", DbType.Int32, ObjTransferofAccountsRow.TRANS_ACC_HDR_ID);
                    db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjTransferofAccountsRow.Company_ID);
                    db.AddInParameter(command, "@ACCOUNT_STATUS", DbType.Int32, ObjTransferofAccountsRow.ACCOUNT_STATUS);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjTransferofAccountsRow.LOB_ID);
                    db.AddInParameter(command, "@FROM_LOCATION_ID", DbType.Int32, ObjTransferofAccountsRow.FROM_LOCATION_ID);
                    db.AddInParameter(command, "@TO_LOCATION_ID", DbType.Int32, ObjTransferofAccountsRow.TO_LOCATION_ID);
                    db.AddInParameter(command, "@PANUM", DbType.String, ObjTransferofAccountsRow.PANum);
                    db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjTransferofAccountsRow.CREATED_BY);
                    db.AddInParameter(command, "@Effective_Date", DbType.DateTime, ObjTransferofAccountsRow.EFFECTIVE_DATE);
                    db.AddInParameter(command, "@PA_SA_REF_ID", DbType.String, ObjTransferofAccountsRow.PA_SA_REF_ID);
                    db.AddInParameter(command, "@TRANSFER_REASON", DbType.String, ObjTransferofAccountsRow.XMLArchDetails);
                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@Totalcount", DbType.Int32, sizeof(Int64));
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    if (!ObjTransferofAccountsRow.IsXMLACCOUNTTRANSFERNull())
                    {
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {

                            OracleParameter param;
                            param = new OracleParameter("@XMLTransferDetails",
                                OracleType.Clob, ObjTransferofAccountsRow.XMLACCOUNTTRANSFER.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjTransferofAccountsRow.XMLACCOUNTTRANSFER);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLTransferDetails", DbType.String, ObjTransferofAccountsRow.XMLACCOUNTTRANSFER);
                        }
                    }

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                            {
                                intRowsAffected = (int)command.Parameters["@ERRORCODE"].Value;
                                throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                            }
                            else
                            {
                                strTotalCount = (int)command.Parameters["@TotalCount"].Value;
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intRowsAffected == 0)
                                intRowsAffected = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                intRowsAffected = 50;
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                throw ex;
            }
            return intRowsAffected;
        }
    }
}
