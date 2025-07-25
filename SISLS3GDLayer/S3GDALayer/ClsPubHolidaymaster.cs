#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;
#endregion
namespace S3GDALayer
{
    namespace CompanyMgtServices
    {
        public class ClsPubHolidaymaster
        {
            #region "Initialization
            int intRowsAffected;
            string strConnection = string.Empty;
            S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstDataTable ObjMasterDataTable;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubHolidaymaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();               
            }

            #endregion

            public int FunPubInsertHolidayMaster(SerializationMode SerMode, byte[] byteObjFA_Master, string strMode)
            {
                int intOutPutValue = 0;
                S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstDataTable dtmaster = new S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstDataTable();
                ObjMasterDataTable = (S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstDataTable)ClsPubSerialize.DeSerialize(byteObjFA_Master, SerMode, typeof(S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstDataTable));
                S3GBusEntity.SystemAdmin.S3G_SYSAD_Holiday_MstRow ObjMasterRow = ObjMasterDataTable[0];
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_INS_HOLIDAY_MST");
                    db.AddInParameter(command, "@distinct_id", DbType.Int32, Convert.ToInt32(ObjMasterRow.Distinct_ID));
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, Convert.ToInt32(ObjMasterRow.Company_ID));
                    db.AddInParameter(command, "@user_id", DbType.Int32,Convert.ToInt32(ObjMasterRow.User_ID));
                    db.AddInParameter(command, "@location_id", DbType.Int32, Convert.ToInt32(ObjMasterRow.Location_ID));
                    db.AddInParameter(command, "@year", DbType.String, ObjMasterRow.Year);
                    db.AddInParameter(command, "@date", DbType.DateTime, ObjMasterRow.Date);
                     S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                     if (enumDBType == S3GDALDBType.ORACLE)
                     {
                         OracleParameter param;
                         if (ObjMasterRow.XML_Weekend != null)
                         {
                             param = new OracleParameter("@XML_Weekend", OracleType.Clob,
                                 ObjMasterRow.XML_Weekend.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjMasterRow.XML_Weekend);
                             command.Parameters.Add(param);
                         }

                         if (ObjMasterRow.XML_Holiday != null)
                         {
                             param = new OracleParameter("@XML_HOliday", OracleType.Clob,
                                 ObjMasterRow.XML_Holiday.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjMasterRow.XML_Holiday);
                             command.Parameters.Add(param);
                         }
                     }

                    //db.AddInParameter(command, "@XML_Weekend", DbType.String, ObjMasterRow.XML_Weekend);
                    //db.AddInParameter(command, "@XML_HOliday", DbType.String, ObjMasterRow.XML_Holiday);
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, intOutPutValue);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intOutPutValue = (int)command.Parameters["@ErrorCode"].Value;
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intOutPutValue.ToString());
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intOutPutValue == 0)
                                intOutPutValue = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
                catch (Exception Ex)
                {
                    intOutPutValue = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(Ex, strConnection);
                    throw Ex;
                }
                return intOutPutValue;
            }

        }
    }
}
