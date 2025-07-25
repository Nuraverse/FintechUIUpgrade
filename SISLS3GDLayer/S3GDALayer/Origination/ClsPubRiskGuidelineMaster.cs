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
using S3GDALayer.Common;
using S3GBusEntity;
using System.Data.OracleClient;

namespace S3GDALayer.Origination
{
    namespace OrgMasterMgtServices
    {
        public class ClsPubRiskGuidelineMaster
        {
            S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_RiskGuideLineLimitDataTable objMaster_DTB;
            Database db;
            public ClsPubRiskGuidelineMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            /// <summary>
            /// To Save or Modify Marketing Slab Master Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjSlabMaster_DataTable"></param>
            /// <param name="strSlabDocNumber"></param>
            /// <returns></returns>
            public int FunPubCreateOrModifyRiskLimitGuideMaster(SerializationMode SerMode, byte[] bytesObjMaster_DataTable, out string strRiskGuideLineDocNumber)
            {
                int intErrorCode = 0;
                strRiskGuideLineDocNumber = string.Empty;
                try
                {
                    objMaster_DTB =  (S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_RiskGuideLineLimitDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjMaster_DataTable,
                                        SerMode, typeof(S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_RiskGuideLineLimitDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_RiskGuideLineLimitRow objMasterrow in objMaster_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_INS_RISK_LIMIT_GL");
                        db.AddInParameter(command, "@Risk_Limit_Master_ID", DbType.Int32, objMasterrow.Risk_Limit_Master_ID);
                        db.AddInParameter(command, "@From_Month", DbType.Int32, objMasterrow.From_Month);
                        db.AddInParameter(command, "@To_Month", DbType.Int32, objMasterrow.To_Month);
                        db.AddInParameter(command, "@CreditRiskH", DbType.Int32, objMasterrow.CreditRiskH);
                        db.AddInParameter(command, "@CreditRiskM", DbType.Int32, objMasterrow.CreditRiskM);
                        db.AddInParameter(command, "@CreditRiskML", DbType.String, objMasterrow.CreditRiskML);
                        db.AddInParameter(command, "@CreditRiskL", DbType.String, objMasterrow.CreditRiskL);
                        db.AddInParameter(command, "@LongTermMax", DbType.String, objMasterrow.LongTermMax);
                        db.AddInParameter(command, "@LongTermMin", DbType.DateTime, objMasterrow.LongTermMin);
                        db.AddInParameter(command, "@ShortTermMax", DbType.DateTime, objMasterrow.ShortTermMax);
                        db.AddInParameter(command, "@ShortTermMin", DbType.String, objMasterrow.ShortTermMin);
                        db.AddInParameter(command, "@Trading", DbType.Decimal, objMasterrow.Trading);
                        db.AddInParameter(command, "@Construction", DbType.Decimal, objMasterrow.Construction);
                        db.AddInParameter(command, "@Services", DbType.Decimal, objMasterrow.Services);
                        db.AddInParameter(command, "@Manufacturing", DbType.Decimal, objMasterrow.Manufacturing);
                        db.AddInParameter(command, "@Personal", DbType.Decimal, objMasterrow.Personal);
                        db.AddInParameter(command, "@Quick_Mortality_Months", DbType.Int32, objMasterrow.Quick_Mortality_Months);
                        

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!objMasterrow.IsXML_DtlNull())
                            {
                                param1 = new OracleParameter("@XML_DETAILS", OracleType.Clob,
                                    objMasterrow.XML_Dtl.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_Dtl);
                                command.Parameters.Add(param1);
                            }

                            if (!objMasterrow.IsXML_FAMap_DetailsNull())
                            {
                                param1 = new OracleParameter("@XML_FAMap_Details", OracleType.Clob,
                                    objMasterrow.XML_FAMap_Details.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_FAMap_Details);
                                command.Parameters.Add(param1);
                            }

                            
                        }

                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objMasterrow.Created_By);
                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@Risk_Limit_DOC_NO", DbType.String, 200);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    strRiskGuideLineDocNumber = Convert.ToString(command.Parameters["@Risk_Limit_DOC_NO"].Value);
                                    trans.Commit();
                                }
                            }
                            catch (Exception objException)
                            {
                                if (intErrorCode == 0)
                                    intErrorCode = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception objException)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                }
                return intErrorCode;
            }
        }
    }
}
