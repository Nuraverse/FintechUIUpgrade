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
        public class ClsPubOcbException
        {
            #region Initialization
            int intRowsAffected;
            S3GBusEntity.OCB_Exception_Upload.Ocb_ExceptionDataTable ObjS3G_OCB_Exception_Upload;


            Database db;
            public ClsPubOcbException()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            #endregion

            #region Create Customer Alert
            public int FunPubSaveOcbExceptions(DataTable ObjS3G_OCB_Exception_Upload)
            {
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_Insert_Ocb_Exception");
                    foreach (S3GBusEntity.OCB_Exception_Upload.Ocb_ExceptionRow ObjCustomerRow in ObjS3G_OCB_Exception_Upload.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCustomerRow.Company_Id);
                        db.AddInParameter(command, "@FileName", DbType.String, ObjCustomerRow.File_Name);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (ObjCustomerRow.XML_OCB_Exception_Data != null)
                            {
                                param = new OracleParameter("@XML_OCB_Exception_Data", OracleType.Clob,
                                    ObjCustomerRow.XML_OCB_Exception_Data.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCustomerRow.XML_OCB_Exception_Data);
                                command.Parameters.Add(param);
                            }
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;

            }
            public int FunPubSaveOcbManualUploadStage(DataTable ObjS3G_OCB_Exception_Upload)
            {
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_INSERT_OCB_UPLD_STG");
                    foreach (S3GBusEntity.OCB_Exception_Upload.Ocb_ExceptionRow ObjCustomerRow in ObjS3G_OCB_Exception_Upload.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCustomerRow.Company_Id);
                        db.AddInParameter(command, "@FileName", DbType.String, ObjCustomerRow.File_Name);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (ObjCustomerRow.XML_OCB_Exception_Data != null)
                            {
                                param = new OracleParameter("@XML_OCB_Exception_Data", OracleType.Clob,
                                    ObjCustomerRow.XML_OCB_Exception_Data.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCustomerRow.XML_OCB_Exception_Data);
                                command.Parameters.Add(param);
                            }
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                    }
                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;

            }
            #endregion

        }
    }
}
