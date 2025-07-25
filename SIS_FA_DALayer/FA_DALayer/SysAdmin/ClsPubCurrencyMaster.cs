#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Currency Master
/// Created By			: Manikandan. R
/// Created Date		: 24-Jan-2012
/// Purpose	            : To Create Currency Master
/// <Program Summary>
#endregion
#region Namespaces
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
#endregion

namespace FA_DALayer.SysAdmin
{
    public class ClsPubCurrencyMaster
    {
        #region Initialization
        Database db;
        int intRowsAffected;
        string strConnection = string.Empty;
        public ClsPubCurrencyMaster(string strConnectionName)
        {
           db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
           strConnection = strConnectionName;
        }
        #endregion
        #region Create New Currency
        /// <summary>
        /// Creates a new Currency by getting Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CurrencyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubCreateCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable, string strConnectionName)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable ObjCurrencyMasterDataTable;
                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapRow ObjCurrencyMasterRow;
                DbCommand command = db.GetStoredProcCommand(SPNames.Insert_Currency);
                ObjCurrencyMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_CurrencyMasterDataTable,SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable));
                ObjCurrencyMasterRow = ObjCurrencyMasterDataTable[0];

                foreach(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapRow ObjCurrencyMaster_Row in ObjCurrencyMasterDataTable.Rows) 
                {
                    db.AddInParameter(command, "@Currency_ID", DbType.Int32, ObjCurrencyMasterRow.Currency_ID);
                    db.AddInParameter(command, "@Precision", DbType.Int32, ObjCurrencyMasterRow.Precision);
                    db.AddInParameter(command, "@Active", DbType.Boolean, ObjCurrencyMasterRow.Is_Active);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjCurrencyMasterRow.User_ID);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
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
        #region Modify Currency Details
        /// <summary>
        /// Modifies an Exsisting Currency by getting Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CurrencyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubModifyCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable,string strConnectionName)
        {
            try
            {

                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable ObjCurrencyMasterDataTable;
                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapRow ObjCurrencyMasterRow;
                DbCommand command = db.GetStoredProcCommand(SPNames.Update_Currency);
                ObjCurrencyMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_CurrencyMasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapDataTable));
                ObjCurrencyMasterRow = ObjCurrencyMasterDataTable[0];

                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyCurrencyMapRow ObjCurrencyMaster_Row in ObjCurrencyMasterDataTable.Rows)
                {
                    db.AddInParameter(command, "@Curruency_Map_ID", DbType.Int32, ObjCurrencyMasterRow.Currency_Map_ID);
                    db.AddInParameter(command, "@Precision", DbType.Int32, ObjCurrencyMasterRow.Precision);
                    db.AddInParameter(command, "@Active", DbType.Boolean, ObjCurrencyMasterRow.Is_Active);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjCurrencyMasterRow.User_ID);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                }

            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intRowsAffected;

        }
        #endregion


        public int FunPubUpdateItemProfSetUp(FASerializationMode SerMode, byte[] bytesObjS3G_Sys_ManualLookupDataTable)
        {
            try
            {
                FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPDataTable objmstItemtbl;
               // FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPRow objmstitemRow;
                objmstItemtbl = (FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_Sys_ManualLookupDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPDataTable));
                DbCommand command = db.GetStoredProcCommand("FA_SYSAD_UPD_ITM_PRF_STUP");
                foreach (FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPRow ObjS3G_SYSAD_ITEM_PROF_SETUPRow in objmstItemtbl.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Company_ID);
                    db.AddInParameter(command, "@Program_Id", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Program_Id);
                    db.AddInParameter(command, "@Pagesetupid", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.PAGESETUPID);
                    db.AddInParameter(command, "@Displaytext", DbType.String, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.DISPLAYTEXT);
                    db.AddInParameter(command, "@Tooltip", DbType.String, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.TOOLTIP);
                    db.AddInParameter(command, "@DATATYPE", DbType.String, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.DATATYPE);
                    if (!ObjS3G_SYSAD_ITEM_PROF_SETUPRow.IsCOLUMNWIDTHNull())
                        db.AddInParameter(command, "@COLUMNWIDTH", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.COLUMNWIDTH);
                    if (!ObjS3G_SYSAD_ITEM_PROF_SETUPRow.IsCOLUMNDECIMALNull())
                        db.AddInParameter(command, "@COLUMNDECIMAL", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.COLUMNDECIMAL);
                    db.AddInParameter(command, "@EFFECTIVEFROM", DbType.String, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVEFROM);
                    db.AddInParameter(command, "@EFFECTIVETO", DbType.String, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVETO);
                    db.AddInParameter(command, "@Updated_by", DbType.Int32, ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Updated_by);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
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
                          //  ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return intRowsAffected;
        }
    }
}
