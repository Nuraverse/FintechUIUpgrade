#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Application Process
/// Created By			: Anbuvel.T
/// Created Date		: 26-11-2019
/// <Program Summary>
#endregion

using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using S3GBusEntity;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.OracleClient;

namespace S3GDALayer.FileTrack
{
    namespace FileTrackMgtServices
    {
        public class clsPupFileTracking
        {
            int intRowsAffected;
            S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_GEN_MSTDataTable ObjFILETR_GEN_MSTDataTable_DAL;
            S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_REQ_MSTDataTable ObjS3G_FILETR_REQ_MSTDataTable_DAL;
            S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_DASHBOARD_ENTRYDataTable ObjS3G_FILETR_DASHBOARD_ENTRYDataTable_DAL;
            S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_INWARD_ENTRYDataTable ObjS3G_FILETR_INWARD_ENTRYDataTable_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public clsPupFileTracking()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #region Create New File Request
            /// <summary>
            /// Creates a new User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateFileGenerateMstInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable)
            {
                try
                {

                    ObjFILETR_GEN_MSTDataTable_DAL = (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_GEN_MSTDataTable)ClsPubSerialize.DeSerialize(bytesObjFILETR_GEN_MSTDataTable, SerMode, typeof(S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_GEN_MSTDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_GEN_MSTRow ObjS3G_FILETR_GEN_MSTRow in ObjFILETR_GEN_MSTDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_FILETR_INS_FILGENMST");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjS3G_FILETR_GEN_MSTRow.Company_ID);
                        db.AddInParameter(command, "@FILE_GEN_MST_ID", DbType.Int32, ObjS3G_FILETR_GEN_MSTRow.FILE_GEN_MST_ID);
                        db.AddInParameter(command, "@FILE_TYPE_ID", DbType.Int32, ObjS3G_FILETR_GEN_MSTRow.FILE_TYPE_ID);
                        db.AddInParameter(command, "@BR_RF_FILE_NUMBER", DbType.String, ObjS3G_FILETR_GEN_MSTRow.BR_RF_FILE_NUMBER);
                        db.AddInParameter(command, "@APPLICATION_PROCESS_ID", DbType.String, ObjS3G_FILETR_GEN_MSTRow.APPLICATION_PROCESS_ID);
                        if (!ObjS3G_FILETR_GEN_MSTRow.IsPA_SA_REF_IDNull())
                        {
                            db.AddInParameter(command, "@PA_SA_REF_ID", DbType.String, ObjS3G_FILETR_GEN_MSTRow.PA_SA_REF_ID);
                        }
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjS3G_FILETR_GEN_MSTRow.CREATED_BY);
                        if (!ObjS3G_FILETR_GEN_MSTRow.IsBR_RF_FILE_NUMBER_CPOUCHNull())
                        {
                            db.AddInParameter(command, "@BR_RF_FILE_NUMBER_CPOUCH", DbType.String, ObjS3G_FILETR_GEN_MSTRow.BR_RF_FILE_NUMBER_CPOUCH);
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
                    throw ex;
                }
                return intRowsAffected;

            }
            #endregion

            #region Create New File Generation
            /// <summary>
            /// Creates a new User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateFileRequestInt(out string strReqNumber_Out, SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable)
            {
                strReqNumber_Out = string.Empty;
                try
                {

                    ObjS3G_FILETR_REQ_MSTDataTable_DAL = (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_REQ_MSTDataTable)ClsPubSerialize.DeSerialize(bytesObjFILETR_GEN_MSTDataTable, SerMode, typeof(S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_REQ_MSTDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_REQ_MSTRow ObjS3G_FILETR_REQ_MSTRow in ObjS3G_FILETR_REQ_MSTDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_FILETR_INS_FILREQMST");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjS3G_FILETR_REQ_MSTRow.Company_ID);
                        db.AddInParameter(command, "@FILE_REQ_ID", DbType.Int32, ObjS3G_FILETR_REQ_MSTRow.FILE_REQ_ID);
                        db.AddInParameter(command, "@FILE_TYPE_ID", DbType.Int32, ObjS3G_FILETR_REQ_MSTRow.FILE_TYPE_ID);
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjS3G_FILETR_REQ_MSTRow.LOCATION_ID);
                        db.AddInParameter(command, "@APPLICATION_PROCESS_ID", DbType.String, ObjS3G_FILETR_REQ_MSTRow.APPLICATION_PROCESS_ID);
                        if (!ObjS3G_FILETR_REQ_MSTRow.IsPA_SA_REF_IDNull())
                        {
                            db.AddInParameter(command, "@PA_SA_REF_ID", DbType.String, ObjS3G_FILETR_REQ_MSTRow.PA_SA_REF_ID);
                        }
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjS3G_FILETR_REQ_MSTRow.CREATED_BY);
                        if (!ObjS3G_FILETR_REQ_MSTRow.IsReason_For_RequestNull())
                        {
                            db.AddInParameter(command, "@Reason_For_Request", DbType.String, ObjS3G_FILETR_REQ_MSTRow.Reason_For_Request);
                        }
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@Request_Number", DbType.String, 100);
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);

                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else
                                {
                                    strReqNumber_Out = (string)command.Parameters["@Request_Number"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            }
                            finally
                            {
                                conn.Close();
                            }
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
            #endregion

            #region Create BashboardEntries
            /// <summary>
            /// Creates a new User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateFileDashBoardInt(SerializationMode SerMode, byte[] bytesObjFILETR_GEN_MSTDataTable)
            {
                try
                {

                    ObjS3G_FILETR_DASHBOARD_ENTRYDataTable_DAL = (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_DASHBOARD_ENTRYDataTable)ClsPubSerialize.DeSerialize(bytesObjFILETR_GEN_MSTDataTable, SerMode, typeof(S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_DASHBOARD_ENTRYDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_DASHBOARD_ENTRYRow ObjS3G_FILETR_DASHBOARD_ENTRYRow in ObjS3G_FILETR_DASHBOARD_ENTRYDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_FILETR_INS_DASHBDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjS3G_FILETR_DASHBOARD_ENTRYRow.Company_ID);
                        if (!ObjS3G_FILETR_DASHBOARD_ENTRYRow.IsRequest_Date_FromNull())
                        {
                            db.AddInParameter(command, "@Request_Date_From", DbType.String, ObjS3G_FILETR_DASHBOARD_ENTRYRow.Request_Date_From);
                        }
                        if (!ObjS3G_FILETR_DASHBOARD_ENTRYRow.IsRequest_Date_ToNull())
                        {
                            db.AddInParameter(command, "@Request_Date_To", DbType.String, ObjS3G_FILETR_DASHBOARD_ENTRYRow.Request_Date_To);
                        }
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (ObjS3G_FILETR_DASHBOARD_ENTRYRow.XML_File_Request != null)
                            {
                                param = new OracleParameter("@XML_File_Request", OracleType.Clob,
                                    ObjS3G_FILETR_DASHBOARD_ENTRYRow.XML_File_Request.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjS3G_FILETR_DASHBOARD_ENTRYRow.XML_File_Request);
                                command.Parameters.Add(param);
                            }
                        }
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjS3G_FILETR_DASHBOARD_ENTRYRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            }
                            finally
                            {
                                conn.Close();
                            }
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
            #endregion

            #region Create Manual Inward Update
            /// <summary>
            /// Creates a new User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateFileInwardInt(SerializationMode SerMode, byte[] bytesObjS3G_FILETR_INWARD_ENTRYDataTable)
            {
                try
                {

                    ObjS3G_FILETR_INWARD_ENTRYDataTable_DAL = (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_INWARD_ENTRYDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_FILETR_INWARD_ENTRYDataTable, SerMode, typeof(S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_INWARD_ENTRYDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.FileTrack.FileTrackingMgtServices.S3G_FILETR_INWARD_ENTRYRow ObjS3G_FILETR_INWARD_ENTRYRow in ObjS3G_FILETR_INWARD_ENTRYDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_FILETR_INS_INWARDDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjS3G_FILETR_INWARD_ENTRYRow.Company_ID);
                        db.AddInParameter(command, "@APPLICATION_PROCESS_ID", DbType.String, ObjS3G_FILETR_INWARD_ENTRYRow.APPLICATION_PROCESS_ID);
                        if (!ObjS3G_FILETR_INWARD_ENTRYRow.IsPA_SA_REF_IDNull())
                        {
                            db.AddInParameter(command, "@PA_SA_REF_ID", DbType.String, ObjS3G_FILETR_INWARD_ENTRYRow.PA_SA_REF_ID);
                        }
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (ObjS3G_FILETR_INWARD_ENTRYRow.XML_Inward_Dtl != null)
                            {
                                param = new OracleParameter("@XML_Inward_Dtl", OracleType.Clob,
                                    ObjS3G_FILETR_INWARD_ENTRYRow.XML_Inward_Dtl.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjS3G_FILETR_INWARD_ENTRYRow.XML_Inward_Dtl);
                                command.Parameters.Add(param);
                            }
                        }
                        db.AddInParameter(command, "@FILE_TYPE_ID", DbType.String, ObjS3G_FILETR_INWARD_ENTRYRow.FILE_TYPE_ID);
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjS3G_FILETR_INWARD_ENTRYRow.Created_By);
                        db.AddInParameter(command, "@CREATED_ON", DbType.String, ObjS3G_FILETR_INWARD_ENTRYRow.CREATED_ON);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            }
                            finally
                            {
                                conn.Close();
                            }
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
            #endregion
        }
    }
}
