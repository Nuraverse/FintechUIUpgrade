#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Scheduled Jobs
/// Screen Name			: Scheduled Jobs DAL Class
/// Created By			: Muni Kavitha
/// Created Date		: 
/// Purpose	            : DAL Class for Scheduled Jobs Methods
/// Last Updated By		: NULL
/// Last Updated Date   : NULL
/// Reason              : NULL
/// <Program Summary>
#endregion

#region Namespaces

using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using S3GBusEntity;
using System.Data.OracleClient;
#endregion

namespace S3GDALayer.ScheduledJobs
{
    namespace ScheduledJobs
    {
        public class ClsPubScheduledJobs
        {
            #region Initialization
            int intErrorCode = 0;
            S3GBusEntity.ScheduledJobs.ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsDataTable ObjScheduledJobsDatatable_DAL = null;
            S3GBusEntity.ScheduledJobs.ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsRow objScheduledJobsRow = null;
            Database db;
            public ClsPubScheduledJobs()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }
            #endregion

            #region Create Scheduled Jobs
            /// <summary>
            /// Insert Scheduled Jobs
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjScheduledJobsDatatable"></param>
            /// <returns></returns>
            public int FunPubCreateScheduledJobs(SerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, out string strScheduleJobID)
            {
                strScheduleJobID = "";
                int intScheduleJobid = 0;
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_InsertScheduledJobs");

                    ObjScheduledJobsDatatable_DAL = (S3GBusEntity.ScheduledJobs.ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsDataTable)ClsPubSerialize.DeSerialize(bytesObjScheduledJobsDatatable, SerMode, typeof(S3GBusEntity.ScheduledJobs.ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsDataTable));
                    objScheduledJobsRow = ObjScheduledJobsDatatable_DAL.Rows[0] as S3GBusEntity.ScheduledJobs.ScheduledJobMgtServices.S3G_SYSAD_ScheduledJobsRow;
                    db.AddInParameter(command, "@Location", DbType.String, objScheduledJobsRow.Location_Code);
                    db.AddInParameter(command, "@JobDescription", DbType.String, objScheduledJobsRow.JobDescription);
                    if (!objScheduledJobsRow.IsFrequencyNull())
                        db.AddInParameter(command, "@Frequency", DbType.Int32, Convert.ToInt32(objScheduledJobsRow.Frequency));
                    if (!objScheduledJobsRow.IsTime_In_MinsNull())
                        db.AddInParameter(command, "@TimeInMinutes", DbType.Int32, objScheduledJobsRow.Time_In_Mins);
                    db.AddInParameter(command, "@StartTime", DbType.String, objScheduledJobsRow.StartDateTime);
                    db.AddInParameter(command, "@Holiday", DbType.Boolean, objScheduledJobsRow.Holiday);
                    db.AddInParameter(command, "@Remarks", DbType.String, objScheduledJobsRow.Remarks);
                    db.AddInParameter(command, "@Job", DbType.Int32, Convert.ToInt32(objScheduledJobsRow.Schedule_Job));
                    db.AddInParameter(command, "@JobNature", DbType.Int32, Convert.ToInt32(objScheduledJobsRow.JobNature));
                    db.AddInParameter(command, "@User_ID", DbType.Int32, Convert.ToInt32(objScheduledJobsRow.Created_By));
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objScheduledJobsRow.Company_ID);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, objScheduledJobsRow.Is_Active);
                    db.AddInParameter(command, "@ID", DbType.Int32, objScheduledJobsRow.ID);
                    // Created Date : 12-11-2019, Description : File Type Added.
                    if (!objScheduledJobsRow.IsFileTypeNull())
                        db.AddInParameter(command, "@FILE_TYPE", DbType.Int32, objScheduledJobsRow.FileType);
                    db.AddOutParameter(command, "@Schedule_Job_ID", DbType.Int64, sizeof(Int64));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));


                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param;
                        if (!string.IsNullOrEmpty(objScheduledJobsRow.Mail_TO))
                        {
                            param = new OracleParameter("@Mail_TO",
                             OracleType.Clob, objScheduledJobsRow.Mail_TO.Length,
                             ParameterDirection.Input, true, 0, 0, String.Empty,
                             DataRowVersion.Default, objScheduledJobsRow.Mail_TO);
                            command.Parameters.Add(param);
                        }
                        if (!string.IsNullOrEmpty(objScheduledJobsRow.Mail_CC))
                        {
                            param = new OracleParameter("@Mail_CC",
                            OracleType.Clob, objScheduledJobsRow.Mail_CC.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, objScheduledJobsRow.Mail_CC);
                            command.Parameters.Add(param);
                        }
                        if (!string.IsNullOrEmpty(objScheduledJobsRow.Mail_BCC))
                        {
                            param = new OracleParameter("@Mail_BCC",
                            OracleType.Clob, objScheduledJobsRow.Mail_BCC.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, objScheduledJobsRow.Mail_BCC);
                            command.Parameters.Add(param);
                        }

                    }
                    else
                    {
                        db.AddInParameter(command, "@Mail_TO", DbType.String, objScheduledJobsRow.Mail_TO);
                        db.AddInParameter(command, "@Mail_CC", DbType.String, objScheduledJobsRow.Mail_CC);
                        db.AddInParameter(command, "@Mail_BCC", DbType.String, objScheduledJobsRow.Mail_BCC);
                    }
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            if (intErrorCode > 0)
                            {
                                strScheduleJobID = string.Empty;
                                trans.Rollback();
                            }
                            else
                            {
                                strScheduleJobID = Convert.ToString(command.Parameters["@Schedule_Job_ID"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            trans.Rollback();
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return intErrorCode;



            }

            public int FunPubUpdateScheduleJobStatus(int schedule_Job_StatusID, int ReRunStatusID, out int intErrorCode)
            {
                intErrorCode = 0;
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_SA_UPDATE_SCHEDULE_JOB_DET");
                    db.AddInParameter(command, "@Schedulejob_Status_Id", DbType.Int32, schedule_Job_StatusID);
                    db.AddInParameter(command, "@RERUN", DbType.Int32, ReRunStatusID);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            if (intErrorCode > 0)
                            {
                                trans.Rollback();
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            trans.Rollback();
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }
                }
                catch (Exception ex)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }

                return intErrorCode;
            }

            #endregion
        }



    }
}
