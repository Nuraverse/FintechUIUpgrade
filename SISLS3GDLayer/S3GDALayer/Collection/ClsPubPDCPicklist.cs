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
        public class ClsPubPDCPicklist
        {
            S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PICKLISTDataTable objPDCPicklist_DTB;
            Database db;
            public ClsPubPDCPicklist()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            public int FunPubCreatePDCPicklistDetails(SerializationMode SerMode, byte[] bytesObjPDCPicklist_DataTable, out Int32 intPicklistID, out string strPicklistNumber)
            {
                intPicklistID = 0;
                int intErrorCode = 0;
                strPicklistNumber = string.Empty;

                try
                {
                    objPDCPicklist_DTB = (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PICKLISTDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjPDCPicklist_DataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PICKLISTDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.Collection.ClnMasterMgtServices.S3G_CLN_PICKLISTRow objrow in objPDCPicklist_DTB)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_PDCPICKLIST");
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objrow.Company_ID);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, objrow.Program_ID);
                        if (!objrow.IsLOB_IDNull())
                            db.AddInParameter(command, "@LOB_ID", DbType.Int32, objrow.LOB_ID);
                        if (!objrow.IsLocation_IDNull())
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, objrow.Location_ID);
                        if (!objrow.IsDeposit_Bank_IDNull())
                            db.AddInParameter(command, "@Deposit_Bank_ID", DbType.Int32, objrow.Deposit_Bank_ID);
                        if (!objrow.IsBanking_From_DateNull())
                            db.AddInParameter(command, "@Banking_From_Date", DbType.DateTime, objrow.Banking_From_Date);
                        if (!objrow.IsBanking_To_DateNull())
                            db.AddInParameter(command, "@Banking_To_Date", DbType.DateTime, objrow.Banking_To_Date);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objrow.Created_By);

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@PICKLIST_NO", DbType.String, 500);

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
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    strPicklistNumber = (string)command.Parameters["@PICKLIST_NO"].Value;
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
