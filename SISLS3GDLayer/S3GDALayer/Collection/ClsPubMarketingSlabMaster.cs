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
        public class ClsPubMarketingSlabMaster
        {
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingSlabMasterDataTable objSlabmaster_DTB;
            Database db;
            public ClsPubMarketingSlabMaster()
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
            public int FunPubCreateOrModifySlabMaster(SerializationMode SerMode, byte[] bytesObjSlabMaster_DataTable, out string strSlabDocNumber)
            {
                int intErrorCode = 0;
                strSlabDocNumber = string.Empty;
                try
                {
                    objSlabmaster_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingSlabMasterDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjSlabMaster_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingSlabMasterDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_MarketingSlabMasterRow objslabmasterrow in objSlabmaster_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_MKTSLABMST");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objslabmasterrow.Company_ID);
                        db.AddInParameter(command, "@Is_Active", DbType.Int32, objslabmasterrow.Is_Active);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objslabmasterrow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objslabmasterrow.Location_ID);
                        db.AddInParameter(command, "@Slab_ID", DbType.Int32, objslabmasterrow.Slab_ID);
                        db.AddInParameter(command, "@Txn_ID", DbType.Int32, objslabmasterrow.Txn_ID);
                        if (!objslabmasterrow.IsCopy_Profile_IDNull())
                            db.AddInParameter(command, "@COPY_PROFILE_ID", DbType.Int32, objslabmasterrow.Copy_Profile_ID);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!objslabmasterrow.IsXML_Slab_DetailsNull())
                            {
                                param1 = new OracleParameter("@XML_Slab_Details", OracleType.Clob,
                                    objslabmasterrow.XML_Slab_Details.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objslabmasterrow.XML_Slab_Details);
                                command.Parameters.Add(param1);
                            }
                        }
                        else
                        {
                            if (!objslabmasterrow.IsXML_Slab_DetailsNull())
                            {
                                db.AddInParameter(command, "@XML_Slab_Details", DbType.String, objslabmasterrow.XML_Slab_Details);
                            }
                        }
                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@Slab_Doc_No", DbType.String, 200);

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
                                    strSlabDocNumber = Convert.ToString(command.Parameters["@Slab_Doc_No"].Value);
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
