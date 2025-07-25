#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;
using S3GBusEntity.Collection;
#endregion

namespace S3GDALayer.Collection
{
    namespace ClnReceivableMgtServices
    {
        public class ClsPubDealerCommRateMaster
        {
            int intRowsAffected;
            S3GBusEntity.Collection.ClnReceivableMgtServices.S3G_Col_Dealer_Comm_RateDataTable objDCRMParameter_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubDealerCommRateMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #region Create Memo
            public int FunPubCreateandModifyDCRDetails(SerializationMode SerMode, byte[] bytesobjS3G_cln_DCRDataTable)
            {
                try
                {

                    objDCRMParameter_DAL = (S3GBusEntity.Collection.ClnReceivableMgtServices.S3G_Col_Dealer_Comm_RateDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_DCRDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceivableMgtServices.S3G_Col_Dealer_Comm_RateDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnReceivableMgtServices.S3G_Col_Dealer_Comm_RateRow objDCRMRow in objDCRMParameter_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("CN_INS_DEALER_COMM_RATE_MAST");
                        db.AddInParameter(command, "@DEALER_COMM_ID", DbType.Int32, objDCRMRow.DEALER_COMM_ID);
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objDCRMRow.COMPANY_ID);
                        db.AddInParameter(command, "@ENTITY_ID", DbType.String, objDCRMRow.ENTITY_ID);
                        db.AddInParameter(command, "@RATE_TYPE_DESC", DbType.String, objDCRMRow.RATE_TYPE_DESC);
                        db.AddInParameter(command, "@IS_ACTIVE", DbType.String, objDCRMRow.IS_ACTIVE);
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objDCRMRow.CREATED_BY);
                        
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1 = new OracleParameter("@XMLS3G_Col_Dealer_Comm_Const", OracleType.Clob,
                                objDCRMRow.XMLS3G_Col_Dealer_Comm_Const.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objDCRMRow.XMLS3G_Col_Dealer_Comm_Const);
                            command.Parameters.Add(param1);

                            OracleParameter param2 = new OracleParameter("@XMLS3G_Col_Dealer_Comm_TCSMP", OracleType.Clob,
                                objDCRMRow.XMLS3G_Col_Dealer_Comm_TCSMP.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objDCRMRow.XMLS3G_Col_Dealer_Comm_TCSMP);
                            command.Parameters.Add(param2);

                            OracleParameter param3 = new OracleParameter("@XMLS3G_Col_Dealer_Comm_CT", OracleType.Clob,
                                objDCRMRow.XMLS3G_Col_Dealer_Comm_CT.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objDCRMRow.XMLS3G_Col_Dealer_Comm_CT);
                            command.Parameters.Add(param3);

                            OracleParameter param4 = new OracleParameter("@XMLS3G_Col_Dealer_Comm_Rate", OracleType.Clob,
                                objDCRMRow.XMLS3G_Col_Dealer_Comm_Rate.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objDCRMRow.XMLS3G_Col_Dealer_Comm_Rate);
                            command.Parameters.Add(param4);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLS3G_Col_Dealer_Comm_Const", DbType.String,
                                objDCRMRow.XMLS3G_Col_Dealer_Comm_Const);

                            db.AddInParameter(command, "@XMLS3G_Col_Dealer_Comm_TCSMP", DbType.String,
                            objDCRMRow.XMLS3G_Col_Dealer_Comm_TCSMP);

                            db.AddInParameter(command, "@XMLS3G_Col_Dealer_Comm_CT", DbType.String,
                            objDCRMRow.XMLS3G_Col_Dealer_Comm_CT);

                            db.AddInParameter(command, "@XMLS3G_Col_Dealer_Comm_Rate", DbType.String,
                            objDCRMRow.XMLS3G_Col_Dealer_Comm_Rate);
                        }


                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));

                        //using (DbConnection conn = db.CreateConnection())
                        //{
                        //    conn.Open();
                        //    DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command);
                            intRowsAffected = (int)command.Parameters["@ERRORCODE"].Value;


                            //    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                            //}
                            //else
                            //{
                            //    trans.Commit();
                            //}

                        }
                        catch (Exception exp)
                        {
                            if (intRowsAffected == 0)
                                intRowsAffected = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                            // trans.Rollback();
                        }
                        //finally
                        //{
                        //    conn.Close();
                        //}
                    }

                }



                catch (Exception exp)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(exp);
                }
                return intRowsAffected;

            }
            #endregion

        }
    }
}
