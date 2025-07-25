
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Template Master 
/// Created By			: Chandrasekar K
/// Created Date		: 11-Feb-2013
/// Purpose	            : DAL Class for Template Master
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
    public class ClsPubTemplateMaster
    {
        #region Initialization
        
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.master.FATemplate_MstDataTable objTemplateMaster;
        FA_BusEntity.SysAdmin.master.FATemplate_MstRow objTemplateMasterRow;

        //Code added for getting common connection string from config file
        Database db;
        public ClsPubTemplateMaster(string strConnectionName)
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
        public int FunPubInsertTemplateMaster(FASerializationMode SerMode, byte[] bytesobjTemplateMaster, string strConnectionName, out int intTemplate_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intTemplate_ID = intErrorCode = 0;
                objTemplateMaster = (FA_BusEntity.SysAdmin.master.FATemplate_MstDataTable)FAClsPubSerialize.DeSerialize(bytesobjTemplateMaster, SerMode, typeof(FA_BusEntity.SysAdmin.master.FATemplate_MstDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.SysAdmin.master.FATemplate_MstRow objTemplateMasterRow in objTemplateMaster.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_TemplateMaster");
                    db.AddInParameter(command, "@Template_ID", DbType.Int32, objTemplateMasterRow.Template_ID);
                    db.AddInParameter(command, "@Template_Name", DbType.String, objTemplateMasterRow.Template_Name);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objTemplateMasterRow.Company_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objTemplateMasterRow.Location_ID);
                    db.AddInParameter(command, "@Template_Date", DbType.DateTime, objTemplateMasterRow.Template_Date);
                    db.AddInParameter(command, "@FromDate", DbType.DateTime, objTemplateMasterRow.Template_Date);
                    db.AddInParameter(command, "@ToDate", DbType.DateTime, objTemplateMasterRow.ToDate);
                    db.AddInParameter(command, "@XMLTemplate_Dtl", DbType.String, objTemplateMasterRow.XMLTemplate_Dtl);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, objTemplateMasterRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, objTemplateMasterRow.Created_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
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
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion

    }
}
