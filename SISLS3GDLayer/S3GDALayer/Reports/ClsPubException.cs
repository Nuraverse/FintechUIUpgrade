using System;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ORG = S3GBusEntity.Origination;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using System.Data;
using System.Data.OracleClient;

namespace S3GDALayer.Reports
{
    public class ClsPubException
    {
        int intRowsAffected;
        S3GBusEntity.Origination.PricingMgtServices.S3G_RPT_EXCEPTION_TBLDataTable ObjException_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubException()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateExceptionDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_ExceptionDataTable)
            {
                try
                {

                    ObjException_DAL = (S3GBusEntity.Origination.PricingMgtServices.S3G_RPT_EXCEPTION_TBLDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_ExceptionDataTable, SerMode, typeof(S3GBusEntity.Origination.PricingMgtServices.S3G_RPT_EXCEPTION_TBLDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Origination.PricingMgtServices.S3G_RPT_EXCEPTION_TBLRow ObjExceptionRow in ObjException_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_RPT_INS_EXCEPRPT");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjExceptionRow.Company_ID);
                        db.AddInParameter(command, "@MonthLock", DbType.String, ObjExceptionRow.Month_Lock);
                        db.AddInParameter(command, "@PROGRAM_ID", DbType.Int32, ObjExceptionRow.Program_ID);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjExceptionRow.Created_By);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjExceptionRow.IsXMLExceptionNull())
                            {
                                param = new OracleParameter("@XMLException", OracleType.Clob,
                                    ObjExceptionRow.XMLException.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjExceptionRow.XMLException);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLException", DbType.String, ObjExceptionRow.XMLException);
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        {
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
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
