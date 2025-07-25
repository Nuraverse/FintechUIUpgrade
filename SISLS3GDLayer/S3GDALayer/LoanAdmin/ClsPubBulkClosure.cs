using System;using S3GDALayer.S3GAdminServices;
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

namespace S3GDALayer.LoanAdmin
{
    namespace ContractMgtServices
    {
        public class ClsPubBulkClosure
        {
            Database db;
            public ClsPubBulkClosure()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            int intRowsAffected;            
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_BulkClosureDataTable objBulkClosure_DAL;
            
         
            #region Create Bulk Closure
            public int FunPubCreateBulkClosure(SerializationMode SerMode, byte[] bytesobjS3G_cln_BulkClosureDataTable,out string strBulkClosureNo)
            {
                strBulkClosureNo = "";
                intRowsAffected = 0;
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    objBulkClosure_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_BulkClosureDataTable)ClsPubSerialize.DeSerialize(bytesobjS3G_cln_BulkClosureDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCBulkReceiptDataTable));

                    foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_BulkClosureRow ObjBulkClosureRow in objBulkClosure_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_BULK_CLOSURE");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjBulkClosureRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjBulkClosureRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjBulkClosureRow.Branch_ID);
                        db.AddInParameter(command, "@ClosureDate", DbType.DateTime, ObjBulkClosureRow.ClosureDate);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjBulkClosureRow.Created_By);
                        //db.AddInParameter(command, "@XML_ReceiptsDeltails", DbType.String, ObjBulkClosureRow.XML_ReceiptsDeltails);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_ClosureDetails", OracleType.Clob,
                                ObjBulkClosureRow.XML_ClosureDetails.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjBulkClosureRow.XML_ClosureDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_ClosureDetails", DbType.String,
                                ObjBulkClosureRow.XML_ClosureDetails);
                        }
                        db.AddOutParameter(command, "@Bulk_CLOSURE_NO", DbType.String, 2000);
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
                                    strBulkClosureNo = (string)command.Parameters["@Bulk_CLOSURE_NO"].Value;
                                    trans.Rollback();
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    strBulkClosureNo = (string)command.Parameters["@Bulk_CLOSURE_NO"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                trans.Rollback();
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                 ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                
                            }
                            finally
                            { conn.Close(); }
                        }
                    }
                }
                catch (Exception ex)
                {
                    if (intRowsAffected == 0)
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
