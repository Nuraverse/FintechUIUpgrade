using System;using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System;using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using S3GBusEntity;
using System.Data.OracleClient;
namespace S3GDALayer.Insurance
{
    namespace InsuranceMgtServices
    {

        public class ClsPubInsuranceRemainder : ClsPubDalInsuranceBase
        {
            #region Initialization
            int intErrorCode;
            S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryDataTable objAssetInsuranceEntry_DAL;
            #endregion

            #region InsuranceRemainder
            public int FunPubModifyInsDetails(SerializationMode SerMode, byte[] byteObjS3G_Insurance_AssetInsuranceEntry_DataTable)
            {
                
                try
                {
                    objAssetInsuranceEntry_DAL = (S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryDataTable)
                        ClsPubSerialize.DeSerialize(byteObjS3G_Insurance_AssetInsuranceEntry_DataTable, SerMode,
                        typeof(S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryRow objAssetEntryRow in objAssetInsuranceEntry_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_INS_UpdateInsuranceDetails");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objAssetEntryRow.Company_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objAssetEntryRow.Created_By);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objAssetEntryRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objAssetEntryRow.Branch_ID);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;

                            if (!objAssetEntryRow.IsXmlPolicyDetailsNull())
                            {
                                param = new OracleParameter("@XMLACCOUNTDETAILS", OracleType.Clob,
                                   objAssetEntryRow.XmlPolicyDetails.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objAssetEntryRow.XmlPolicyDetails);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!objAssetEntryRow.IsXmlPolicyDetailsNull())
                            {
                                db.AddInParameter(command, "@XMLACCOUNTDETAILS", DbType.String, objAssetEntryRow.XmlPolicyDetails);
                            }
                        }

                        //db.AddInParameter(command, "@XMLACCOUNTDETAILS", DbType.String, objAssetEntryRow.XmlPolicyDetails);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        //db.ExecuteNonQuery(command);
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intErrorCode;
            }
            #endregion

            public int FunPubInsMailDetails(SerializationMode SerMode, byte[] byteObjS3G_Insurance_AssetInsuranceEntry_DataTable)
            {

                try
                {
                    objAssetInsuranceEntry_DAL = (S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryDataTable)
                        ClsPubSerialize.DeSerialize(byteObjS3G_Insurance_AssetInsuranceEntry_DataTable, SerMode,
                        typeof(S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Insurance.InsuranceMgtServices.S3G_INS_AssetInsuranceEntryRow objAssetEntryRow in objAssetInsuranceEntry_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CMN_INS_MAILDETAILS");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objAssetEntryRow.Company_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objAssetEntryRow.Created_By);
                        db.AddInParameter(command, "@PROGRAM_ID", DbType.Int32, objAssetEntryRow.Program_ID);
                        db.AddInParameter(command, "@Mail_ID", DbType.Int32, objAssetEntryRow.Mail_ID);
                        db.AddInParameter(command, "@Doc_ID", DbType.Int32, objAssetEntryRow.Doc_ID);
                        db.AddInParameter(command, "@From_User", DbType.String, objAssetEntryRow.From_User);
                        db.AddInParameter(command, "@TO_USER", DbType.String, objAssetEntryRow.To_User);
                        db.AddInParameter(command, "@CC_USER", DbType.String, objAssetEntryRow.CC_User);
                        db.AddInParameter(command, "@BCC_USER", DbType.String, objAssetEntryRow.BCC_User);
                        db.AddInParameter(command, "@SUBJECT", DbType.String, objAssetEntryRow.Subject);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;

                            if (!objAssetEntryRow.IsBodyNull())
                            {
                                param = new OracleParameter("@BODY", OracleType.NClob,
                                   objAssetEntryRow.Body.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objAssetEntryRow.Body);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!objAssetEntryRow.IsBodyNull())
                            {
                                db.AddInParameter(command, "@BODY", DbType.String, objAssetEntryRow.Body);
                            }
                        }

                        db.AddInParameter(command, "@STATUS", DbType.Int32, objAssetEntryRow.Status);
                        db.AddInParameter(command, "@MESSAGETYPE", DbType.String, objAssetEntryRow.MessageType);
                        db.AddInParameter(command, "@CREATED_BY", DbType.String, objAssetEntryRow.UserId);
                        db.AddInParameter(command, "@CREATED_ON", DbType.String, objAssetEntryRow.Created_On);
                        db.AddInParameter(command, "@STATUS_MESSAGE", DbType.String, objAssetEntryRow.Status_Message);
                        db.AddInParameter(command, "@SCHEDULED_DATE", DbType.String, objAssetEntryRow.Scheduled_Date);
             
                        db.AddInParameter(command, "@MAIL_SEND_DATE", DbType.String, objAssetEntryRow.Mail_Send_Date);
                        db.AddInParameter(command, "@MAIL_LANGUAGE", DbType.String, objAssetEntryRow.Mail_Language);
                        db.AddInParameter(command, "@SCHEDULE_TYPE", DbType.String, objAssetEntryRow.Schedule_Type);
                        db.AddInParameter(command, "@ATTACHMENT_PATH", DbType.String, objAssetEntryRow.Attachment_Path);
                        db.AddInParameter(command, "@ATTACHMENT_FILENAME", DbType.String, objAssetEntryRow.Attachment_FileName);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        //db.ExecuteNonQuery(command);
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intErrorCode;
            }
        }
    }
}
