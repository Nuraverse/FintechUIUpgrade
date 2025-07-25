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
using System.Data.OracleClient;
using S3GBusEntity;

namespace S3GDALayer.Collection
{
    namespace ClnDataMgtServices
    {
        public class ClsPubMarketingIncentiveProc
        {
            int intRowsAffected;
            S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_MARK_INC_PROCESSDataTable objMarketing_Inc_Proc_DAL;

            Database db;

            public ClsPubMarketingIncentiveProc()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #region Marketing Incentive Process

            /// <summary>
            /// Inserting the DC Follow UP Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>
            /// 
            public int FunPubCreateUpdateMarketing_Inc_Proc(SerializationMode SerMode, byte[] bytesobjMarketing_Inc_Proc_DataTable, out int intIncProcessID, out string strDocCode_Out)
            {
                intIncProcessID = 0;
                strDocCode_Out = "";
                try
                {
                    objMarketing_Inc_Proc_DAL = (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_MARK_INC_PROCESSDataTable)ClsPubSerialize.DeSerialize(bytesobjMarketing_Inc_Proc_DataTable,
                        SerMode, typeof(S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_MARK_INC_PROCESSDataTable));


                    foreach (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_MARK_INC_PROCESSRow objMark_Inc_ProcessRow in objMarketing_Inc_Proc_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CN_INS_MAR_INCENTIVE_PROCESS");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objMark_Inc_ProcessRow.Company_ID);

                        if (!objMark_Inc_ProcessRow.IsLob_IDNull())
                            db.AddInParameter(command, "@Lob_ID", DbType.Int32, objMark_Inc_ProcessRow.Lob_ID);

                        if (!objMark_Inc_ProcessRow.IsLocation_IDNull())
                            db.AddInParameter(command, "@Location_Id", DbType.Int32, objMark_Inc_ProcessRow.Location_ID);

                        db.AddInParameter(command, "@Proc_Hdr_Id", DbType.Int32, objMark_Inc_ProcessRow.Proc_Hdr_ID);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_INC_DTL",
                                   OracleType.Clob, objMark_Inc_ProcessRow.XML_Incentive_Dtl.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, objMark_Inc_ProcessRow.XML_Incentive_Dtl);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_INC_DTL", DbType.String, objMark_Inc_ProcessRow.XML_Incentive_Dtl);
                        }

                        db.AddInParameter(command, "@User_ID", DbType.Int32, objMark_Inc_ProcessRow.User_ID);
                        db.AddInParameter(command, "@From_Month", DbType.String, objMark_Inc_ProcessRow.From_Month);
                        db.AddInParameter(command, "@To_Month", DbType.String, objMark_Inc_ProcessRow.To_Month);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if (Convert.ToString(command.Parameters["@OutDocNo"].Value) != "")
                                    strDocCode_Out = (string)command.Parameters["@OutDocNo"].Value;

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

                                }
                                else
                                {
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                trans.Rollback();
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
