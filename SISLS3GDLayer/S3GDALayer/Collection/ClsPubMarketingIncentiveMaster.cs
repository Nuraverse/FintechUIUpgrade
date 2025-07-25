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

namespace S3GDALayer.Collection
{
    namespace ClnReceiptMgtServices
    {
        public class ClsPubMarketingIncentiveMaster
        {
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingIncentiveMasterDataTable objMaster_DTB;
            Database db;
            public ClsPubMarketingIncentiveMaster()
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
            public int FunPubCreateOrModifyIncentiveMaster(SerializationMode SerMode, byte[] bytesObjMaster_DataTable, out string strIncentiveDocNumber)
            {
                int intErrorCode = 0;
                strIncentiveDocNumber = string.Empty;
                try
                {
                    objMaster_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingIncentiveMasterDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjMaster_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingIncentiveMasterDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingIncentiveMasterRow objMasterrow in objMaster_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_MRKTINCMSTR");
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objMasterrow.Company_ID);
                        db.AddInParameter(command, "@INCENTIVE_MASTER_ID", DbType.Int32, objMasterrow.Incentive_Master_ID);
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objMasterrow.Txn_ID);
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, objMasterrow.Location_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objMasterrow.LOB_ID);
                        db.AddInParameter(command, "@IS_ACTIVE", DbType.Int32, objMasterrow.Is_Active);
                        db.AddInParameter(command, "@GROUP_NAME", DbType.String, objMasterrow.Group_Name);
                        db.AddInParameter(command, "@GROUP_CODE", DbType.String, objMasterrow.Group_Code);
                        db.AddInParameter(command, "@IMAGE_PATH", DbType.String, objMasterrow.Image_Path);
                        db.AddInParameter(command, "@START_DATE", DbType.DateTime, objMasterrow.Start_Date);
                        db.AddInParameter(command, "@END_DATE", DbType.DateTime, objMasterrow.End_Date);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!objMasterrow.IsXML_Slab_DetailsNull())
                            {
                                param1 = new OracleParameter("@XML_SLAB_DETAILS", OracleType.Clob,
                                    objMasterrow.XML_Slab_Details.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_Slab_Details);
                                command.Parameters.Add(param1);
                            }

                            if (!objMasterrow.IsXML_Executive_DetialsNull())
                            {
                                param1 = new OracleParameter("@XML_EXECUTIVE_DETAILS", OracleType.Clob,
                                    objMasterrow.XML_Slab_Details.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_Executive_Detials);
                                command.Parameters.Add(param1);
                            }

                            if (!objMasterrow.IsXML_Holding_DetailsNull())
                            {
                                param1 = new OracleParameter("@XML_HOLDING_DETAILS", OracleType.Clob,
                                    objMasterrow.XML_Slab_Details.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_Holding_Details);
                                command.Parameters.Add(param1);
                            }
                        }
                        else
                        {
                            if (!objMasterrow.IsXML_Slab_DetailsNull())
                            {
                                db.AddInParameter(command, "@XML_SLAB_DETAILS", DbType.String, objMasterrow.XML_Slab_Details);
                            }

                            if (!objMasterrow.IsXML_Executive_DetialsNull())
                            {
                                db.AddInParameter(command, "@XML_EXECUTIVE_DETAILS", DbType.String, objMasterrow.XML_Executive_Detials);
                            }

                            if (!objMasterrow.IsXML_Holding_DetailsNull())
                            {
                                db.AddInParameter(command, "@XML_HOLDING_DETAILS", DbType.String, objMasterrow.XML_Holding_Details);
                            }
                        }

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@GROUP_DOC_NO", DbType.String, 200);

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
                                    strIncentiveDocNumber = Convert.ToString(command.Parameters["@GROUP_DOC_NO"].Value);
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
