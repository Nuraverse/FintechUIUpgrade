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
    namespace NmsClsPubOcbUploadSTG
    {
        public class ClsPubOcbUploadSTG
        {
            #region Initialization
            int intRowsAffected;
            S3GBusEntity.OCB_Exception_Upload.Ocb_ExceptionDataTable ObjS3G_OCB_Exception_Upload;


            Database db;
            public ClsPubOcbUploadSTG()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            #endregion

            #region Create Customer Alert
            
            public int FunPubSaveOcbManualUploadStage(DataTable ObjS3G_OCB_Exception_Upload)
            {
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_INSERT_OCB_UPLD_STG");
                    foreach (S3GBusEntity.OCB_Exception_Upload.Ocb_ExceptionRow ObjCustomerRow in ObjS3G_OCB_Exception_Upload.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCustomerRow.Company_Id);
                        db.AddInParameter(command, "@FileName", DbType.String, ObjCustomerRow.File_Name);
                        db.AddInParameter(command, "@FROM_DATE", DbType.String, ObjCustomerRow.FROM_DATE);
                        db.AddInParameter(command, "@END_DATE", DbType.String, ObjCustomerRow.END_DATE);
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
