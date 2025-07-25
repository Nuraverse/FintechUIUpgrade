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
        public class ClsPubDSCMaster
        {
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_DealerSaleCommissionMasterDataTable objMaster_DTB;
            S3GBusEntity.Collection.ClnDebtMgtServices.S3G_CLN_DealerSpecialSchemeMasterDataTable objDebtMaster_DTB;
           
            Database db;
            public ClsPubDSCMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateOrModifyDSCMaster(SerializationMode SerMode, byte[] bytesObjMaster_DataTable, out string strDSCCode)
            {
                int intErrorCode = 0;
                strDSCCode = string.Empty;
                try
                {
                    objMaster_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_DealerSaleCommissionMasterDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjMaster_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_DealerSaleCommissionMasterDataTable));

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_DealerSaleCommissionMasterRow objMasterrow in objMaster_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_DSCMASTER");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objMasterrow.Company_ID);
                        db.AddInParameter(command, "@Dealer_Sale_Master_ID", DbType.Int32, objMasterrow.Dealer_Sale_Master_ID);
                        db.AddInParameter(command, "@From_Date", DbType.DateTime, objMasterrow.From_Date);
                        db.AddInParameter(command, "@Is_Active", DbType.String, objMasterrow.Is_Active);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objMasterrow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objMasterrow.Location_ID);
                        db.AddInParameter(command, "@Scheme_ID", DbType.Int32, objMasterrow.Scheme_ID);
                        db.AddInParameter(command, "@Slab_Name", DbType.String, objMasterrow.Slab_Name);
                        db.AddInParameter(command, "@To_Date", DbType.DateTime, objMasterrow.To_Date);
                        db.AddInParameter(command, "@Txn_ID", DbType.Int32, objMasterrow.Txn_ID);
                        
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!objMasterrow.IsXML_NewAssetDetailsNull())
                            {
                                param1 = new OracleParameter("@XML_NewAssetDetails", OracleType.Clob,
                                    objMasterrow.XML_NewAssetDetails.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_NewAssetDetails);
                                command.Parameters.Add(param1);
                            }
                            
                            if (!objMasterrow.IsXML_UsedAssetDetailsNull())
                            {
                                param1 = new OracleParameter("@XML_UsedAssetDetails", OracleType.Clob,
                                    objMasterrow.XML_UsedAssetDetails.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objMasterrow.XML_UsedAssetDetails);
                                command.Parameters.Add(param1);
                            }
                        }
                        else
                        {
                            if (!objMasterrow.IsXML_UsedAssetDetailsNull())
                            {
                                db.AddInParameter(command, "@XML_UsedAssetDetails", DbType.String, objMasterrow.XML_UsedAssetDetails);
                            }
                        }
                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DSCMaster_Code", DbType.String, 500);

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
                                    strDSCCode = Convert.ToString(command.Parameters["@DSCMaster_Code"].Value);
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    strDSCCode = Convert.ToString(command.Parameters["@DSCMaster_Code"].Value);
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
            public int FunPubCreateOrModifyDSScheme(SerializationMode SerMode, byte[] bytesObjMaster_DataTable, out string strDSCCode)
            {
                int intErrorCode = 0;
                strDSCCode = string.Empty;
                try
                {
                    objDebtMaster_DTB = (S3GBusEntity.Collection.ClnDebtMgtServices.S3G_CLN_DealerSpecialSchemeMasterDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjMaster_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnDebtMgtServices.S3G_CLN_DealerSpecialSchemeMasterDataTable));

                    foreach (S3GBusEntity.Collection.ClnDebtMgtServices.S3G_CLN_DealerSpecialSchemeMasterRow objDebtMasterrow in objDebtMaster_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_DSSCHMEEASTER");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objDebtMasterrow.Company_ID);
                        db.AddInParameter(command, "@Dealer_Sale_Master_ID", DbType.Int32, objDebtMasterrow.Dealer_Sale_Master_ID);
                        db.AddInParameter(command, "@From_Date", DbType.DateTime, objDebtMasterrow.From_Date);
                        db.AddInParameter(command, "@Is_Active", DbType.String, objDebtMasterrow.Is_Active);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objDebtMasterrow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objDebtMasterrow.Location_ID);
                        db.AddInParameter(command, "@Scheme_ID", DbType.Int32, objDebtMasterrow.Scheme_ID);
                        db.AddInParameter(command, "@Slab_Name", DbType.String, objDebtMasterrow.Slab_Name);
                        db.AddInParameter(command, "@To_Date", DbType.DateTime, objDebtMasterrow.To_Date);
                        db.AddInParameter(command, "@Txn_ID", DbType.Int32, objDebtMasterrow.Txn_ID);
                        db.AddInParameter(command, "@Dealer_Id", DbType.Int32, objDebtMasterrow.Dealer_Id);
                        db.AddInParameter(command, "@Asset_Id", DbType.Int32, objDebtMasterrow.Asset_Id);
                        db.AddInParameter(command, "@Model_Year", DbType.Int32, objDebtMasterrow.Model_Year);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!objDebtMasterrow.IsXML_NewAssetDetailsNull())
                            {
                                param1 = new OracleParameter("@XML_NewAssetDetails", OracleType.Clob,
                                    objDebtMasterrow.XML_NewAssetDetails.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objDebtMasterrow.XML_NewAssetDetails);
                                command.Parameters.Add(param1);
                            }

                            if (!objDebtMasterrow.IsXML_UsedAssetDetailsNull())
                            {
                                param1 = new OracleParameter("@XML_UsedAssetDetails", OracleType.Clob,
                                    objDebtMasterrow.XML_UsedAssetDetails.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objDebtMasterrow.XML_UsedAssetDetails);
                                command.Parameters.Add(param1);
                            }
                        }
                        else
                        {
                            if (!objDebtMasterrow.IsXML_UsedAssetDetailsNull())
                            {
                                db.AddInParameter(command, "@XML_UsedAssetDetails", DbType.String, objDebtMasterrow.XML_UsedAssetDetails);
                            }
                        }
                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DSCMaster_Code", DbType.String, 500);

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
                                    strDSCCode = Convert.ToString(command.Parameters["@DSCMaster_Code"].Value);
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    strDSCCode = Convert.ToString(command.Parameters["@DSCMaster_Code"].Value);
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
