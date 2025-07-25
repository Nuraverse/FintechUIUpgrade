#region Namespaces
using System;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;
using S3GDALayer.S3GAdminServices;
#endregion

namespace S3GDALayer
{    
    public class ClsPubManualLookup
    {
        int intRowsAffected;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubManualLookup()
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
        }

        S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable objManualLookup_DAL;
        S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPDataTable objS3G_SYSAD_ITEM_PROF_SETUPDataTable;

        public int FunPubCreateManualLookupDetails(SerializationMode SerMode, byte[] bytesObjS3G_Sys_ManualLookupDataTable)
        {
            try
            {
                objManualLookup_DAL = (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_Sys_ManualLookupDataTable, SerMode, typeof(S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable));

                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                DbCommand command = db.GetStoredProcCommand("S3G_Insert_Manual_Lookup");

                foreach (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupRow ObjManualLookupRow in objManualLookup_DAL.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjManualLookupRow.Company_ID);
                    db.AddInParameter(command, "@Lookup_Desc", DbType.String, ObjManualLookupRow.Lookup_Desc);
                    db.AddInParameter(command, "@Lookup_Def_ID", DbType.Int32, ObjManualLookupRow.Lookup_Def_ID);

                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param;
                        param = new OracleParameter("@Lookup_Name",
                            OracleType.Clob, ObjManualLookupRow.Lookup_Name.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjManualLookupRow.Lookup_Name);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@Lookup_Name", DbType.String,
                            ObjManualLookupRow.Lookup_Name);
                    }

                   // db.AddInParameter(command, "@Lookup_Name", DbType.String, ObjManualLookupRow.Lookup_Name);
                    //db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjManualLookupRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjManualLookupRow.Created_By);
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
                            ClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return intRowsAffected;
        }

        public int FunPubUpdateItemProfSetUp(SerializationMode SerMode, byte[] bytesObjS3G_Sys_ManualLookupDataTable)
        {
            try
            {
                objS3G_SYSAD_ITEM_PROF_SETUPDataTable = (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_Sys_ManualLookupDataTable, SerMode, typeof(S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPDataTable));
                DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_UPD_ITM_PRF_STUP");
                foreach (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPRow ObjS3G_SYSAD_ITEM_PROF_SETUPRow in objS3G_SYSAD_ITEM_PROF_SETUPDataTable.Rows)
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
                    db.AddOutParameter(command,"@ErrorCode", DbType.Int32, sizeof(Int64));
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
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return intRowsAffected;
        }
        public int FunPubModifyManualLookupDetails(SerializationMode SerMode, byte[] bytesObjS3G_Sys_ManualLookupDataTable)
        {
            try
            {
                objManualLookup_DAL = (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_Sys_ManualLookupDataTable, SerMode, typeof(S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable));

                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                DbCommand command = db.GetStoredProcCommand("S3G_Modify_Manual_Lookup");

                foreach (S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupRow ObjManualLookupRow in objManualLookup_DAL.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjManualLookupRow.Company_ID);
                    db.AddInParameter(command, "@ID", DbType.Int32, ObjManualLookupRow.ID);                    
                    db.AddInParameter(command, "@Lookup_Type", DbType.String, ObjManualLookupRow.Lookup_Type);                    
                    db.AddInParameter(command, "@Lookup_Name", DbType.String, ObjManualLookupRow.Lookup_Name);
                    db.AddInParameter(command, "@Table_Name", DbType.String, ObjManualLookupRow.Table_Name);
                    //db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjManualLookupRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjManualLookupRow.Created_By);
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
                            ClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                ClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return intRowsAffected;
        }


    }
    
}
