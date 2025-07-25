#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: LoanAdmin
/// Screen Name			:  NOC Termination DAL class
/// Created By			: Irsathameen K
/// Created Date		: 07-sep-2010
/// Purpose	            : Stpre Noc Termination Details

/// <Program Summary>
#endregion

using System;
using S3GDALayer.S3GAdminServices;
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

namespace S3GDALayer.LoanAdmin
{
    namespace LoanAdminMgtServices
    {
        public class ClsPubNOCTermination
        {
            int intRowsAffected;
            S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_NOCTerminationDetailsDataTable ObjNOCTermination_DAL;
            S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailDataTable ObjNOCEmailDataTable_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubNOCTermination()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateNocTerminationDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_NOCTerminationDataTable, out string strNOCNo)
            {
                try
                {
                    strNOCNo = "";
                    ObjNOCTermination_DAL = (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_NOCTerminationDetailsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_NOCTerminationDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_NOCTerminationDetailsDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LOANAD_NOCTerminationDetailsRow ObjNOCTerminationRow in ObjNOCTermination_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertNOCTerminationDetails");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjNOCTerminationRow.Company_ID);
                        db.AddInParameter(command, "@NOCTERMINATN_ID", DbType.Int32, ObjNOCTerminationRow.NOCTERMINATN_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjNOCTerminationRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjNOCTerminationRow.Branch_ID);
                        db.AddInParameter(command, "@NOC_Date", DbType.DateTime, ObjNOCTerminationRow.NOC_Date);
                        db.AddInParameter(command, "@PANum", DbType.String, ObjNOCTerminationRow.PANum);
                        db.AddInParameter(command, "@SANum", DbType.String, ObjNOCTerminationRow.SANum);
                        db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjNOCTerminationRow.Customer_ID);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjNOCTerminationRow.Created_By);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjNOCTerminationRow.IsXML_AssetDetailsNull())
                            {
                                param = new OracleParameter("@XML_AssetDeltails", OracleType.Clob,
                                   ObjNOCTerminationRow.XML_AssetDetails.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, ObjNOCTerminationRow.XML_AssetDetails);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!ObjNOCTerminationRow.IsXML_AssetDetailsNull())
                            {
                                db.AddInParameter(command, "@XML_AssetDeltails", DbType.String, ObjNOCTerminationRow.XML_AssetDetails);
                            }
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjNOCTerminationRow.IsSANumNull())
                            {
                                param = new OracleParameter("@CUST_NAME", OracleType.NVarChar,
                                   ObjNOCTerminationRow.Arab_Customer_Name.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, ObjNOCTerminationRow.Arab_Customer_Name);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!ObjNOCTerminationRow.IsSANumNull())
                            {
                                db.AddInParameter(command, "@CUST_NAME", DbType.String, ObjNOCTerminationRow.Arab_Customer_Name);
                            }
                        }
                        db.AddInParameter(command, "@ASSETRELEASETYPE", DbType.Int32, ObjNOCTerminationRow.ASSETRELEASETYPE);
                        db.AddInParameter(command, "@ASSETRELEASETO", DbType.Int32, ObjNOCTerminationRow.ASSETRELEASETO);
                        db.AddOutParameter(command, "@NOC_No", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
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
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else if ((int)command.Parameters["@ErrorCode"].Value < 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (intRowsAffected == -1)
                                        throw new Exception("Document Sequence no not-defined");
                                    if (intRowsAffected == -2)
                                        throw new Exception("Document Sequence no exceeds defined limit");
                                }
                                else
                                {
                                    trans.Commit();
                                    strNOCNo = (string)command.Parameters["@NOC_No"].Value;
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

            public int FunPubInsMailDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_NOCEmailDataTable)
            {

                try
                {
                    //ObjNOCEmailDataTable_DAL = (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailDataTable)
                    //    ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_NOCEmailDataTable, SerMode,
                    //    typeof(S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailDataTable));
                    ObjNOCEmailDataTable_DAL = (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_NOCEmailDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    //foreach (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailRow objNOCEmailDataRow in ObjNOCEmailDataTable_DAL.Rows)
                    foreach (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_EmailRow objNOCEmailDataRow in ObjNOCEmailDataTable_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CMN_INS_MAILDETAILS");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objNOCEmailDataRow.Company_ID);
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objNOCEmailDataRow.Created_By);
                        db.AddInParameter(command, "@PROGRAM_ID", DbType.Int32, objNOCEmailDataRow.Program_ID);
                        db.AddInParameter(command, "@Mail_ID", DbType.Int32, objNOCEmailDataRow.Mail_ID);
                        db.AddInParameter(command, "@Doc_ID", DbType.Int32, objNOCEmailDataRow.Doc_ID);
                        db.AddInParameter(command, "@From_User", DbType.String, objNOCEmailDataRow.From_User);
                        db.AddInParameter(command, "@TO_USER", DbType.String, objNOCEmailDataRow.To_User);
                        db.AddInParameter(command, "@CC_USER", DbType.String, objNOCEmailDataRow.CC_User);
                        db.AddInParameter(command, "@BCC_USER", DbType.String, objNOCEmailDataRow.BCC_User);
                        db.AddInParameter(command, "@SUBJECT", DbType.String, objNOCEmailDataRow.Subject);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;

                            if (!objNOCEmailDataRow.IsBodyNull())
                            {
                                param = new OracleParameter("@BODY", OracleType.NClob,
                                   objNOCEmailDataRow.Body.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objNOCEmailDataRow.Body);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!objNOCEmailDataRow.IsBodyNull())
                            {
                                db.AddInParameter(command, "@BODY", DbType.String, objNOCEmailDataRow.Body);
                            }
                        }

                        db.AddInParameter(command, "@STATUS", DbType.Int32, objNOCEmailDataRow.Status);
                        db.AddInParameter(command, "@MESSAGETYPE", DbType.String, objNOCEmailDataRow.MessageType);
                        db.AddInParameter(command, "@CREATED_BY", DbType.String, objNOCEmailDataRow.UserId);
                        db.AddInParameter(command, "@CREATED_ON", DbType.String, objNOCEmailDataRow.Created_On);
                        db.AddInParameter(command, "@STATUS_MESSAGE", DbType.String, objNOCEmailDataRow.Status_Message);
                        db.AddInParameter(command, "@SCHEDULED_DATE", DbType.String, objNOCEmailDataRow.Scheduled_Date);

                        db.AddInParameter(command, "@MAIL_SEND_DATE", DbType.String, objNOCEmailDataRow.Mail_Send_Date);
                        db.AddInParameter(command, "@MAIL_LANGUAGE", DbType.String, objNOCEmailDataRow.Mail_Language);
                        db.AddInParameter(command, "@SCHEDULE_TYPE", DbType.String, objNOCEmailDataRow.Schedule_Type);
                        db.AddInParameter(command, "@ATTACHMENT_PATH", DbType.String, objNOCEmailDataRow.Attachment_Path);
                        db.AddInParameter(command, "@ATTACHMENT_FILENAME", DbType.String, objNOCEmailDataRow.Attachment_FileName);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        //db.ExecuteNonQuery(command);
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                    }
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }

        }
    }
}
