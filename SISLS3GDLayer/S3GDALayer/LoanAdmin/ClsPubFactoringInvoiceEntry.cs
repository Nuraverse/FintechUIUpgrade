#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: LoanAdmin
/// Screen Name			: Factoring Invoice Loading DAL class
/// Created By			: Irsathameen K
/// Created Date		: 19-Jul-2010
/// Purpose	            : To access Factoring Invoice  db methods

/// <Program Summary>
#endregion

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


namespace S3GDALayer.LoanAdmin
{
    namespace LoanAdminMgtServices
    {

        public class ClsPubFactoringInvoiceEntry
        {
            int intRowsAffected;
            S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_FACT_Inv_FollowupDataTable ObjFactoringInvoice_DAL;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubFactoringInvoiceEntry()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            public int FunPubCreateFactoringFollowEntryDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_FactoringInvoiceDataTable, out string strFILNo, out string strInvoiceNo, out string strPartyName)
            {
                try
                {
                    strFILNo = "";
                    strInvoiceNo = "";
                    strPartyName = "";
                    ObjFactoringInvoice_DAL = (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_FACT_Inv_FollowupDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_FactoringInvoiceDataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_FACT_Inv_FollowupDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.LoanAdminMgtServices.S3G_LAD_FACT_Inv_FollowupRow ObjFactoringInvoiceRow in ObjFactoringInvoice_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LAD_INS_FACT_FWENTRY");
                        db.AddInParameter(command, "@FACT_INV_FU_ID", DbType.Int32, ObjFactoringInvoiceRow.FACT_INV_FU_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjFactoringInvoiceRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjFactoringInvoiceRow.LOB_ID);
                        db.AddInParameter(command, "@FACTORING_INV_LOAD_ID", DbType.Int32, ObjFactoringInvoiceRow.FACTORING_INV_LOAD_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjFactoringInvoiceRow.Branch_ID);
                        db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjFactoringInvoiceRow.Customer_ID);
                        db.AddInParameter(command, "@ENTITY_ID", DbType.Int32, ObjFactoringInvoiceRow.ENTITY_ID);
                        db.AddInParameter(command, "@PANum", DbType.String, ObjFactoringInvoiceRow.PANum);
                        db.AddInParameter(command, "@PA_SA_REF_ID", DbType.Int32, ObjFactoringInvoiceRow.PA_SA_REF_ID);
                        db.AddInParameter(command, "@VISIT_BY", DbType.Int32, ObjFactoringInvoiceRow.VISIT_BY);
                        db.AddInParameter(command, "@VISIT_DATE", DbType.DateTime, ObjFactoringInvoiceRow.VISIT_DATE);
                        db.AddInParameter(command, "@NEXT_FOLLOWUP_DATE", DbType.DateTime, ObjFactoringInvoiceRow.NEXT_FOLLOWUP_DATE);
                        db.AddInParameter(command, "@REMARKS", DbType.String, ObjFactoringInvoiceRow.Remarks);
                     
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_FACTORING_INV_LOAD_ID", OracleType.Clob,
                                ObjFactoringInvoiceRow.XML_FACTORING_INV_LOAD_ID.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, ObjFactoringInvoiceRow.XML_FACTORING_INV_LOAD_ID);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_FACTORING_INV_LOAD_ID", DbType.String,
                                ObjFactoringInvoiceRow.XML_FACTORING_INV_LOAD_ID);
                        }
                        db.AddOutParameter(command, "@FACT_INV_FU_No", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    //throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else if ((int)command.Parameters["@ErrorCode"].Value < 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (intRowsAffected == -1)
                                        throw new Exception("Document Sequence no not-defined");
                                    if (intRowsAffected == -2)
                                        throw new Exception("Document Sequence no exceeds defined limit");
                                }
                                else
                                {
                                    strFILNo = (string)command.Parameters["@FACT_INV_FU_No"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
                                strInvoiceNo = (string)command.Parameters["@FACT_INV_FU_No"].Value;
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                trans.Rollback();
                            }
                            finally
                            { conn.Close(); }
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
        }
    }

}
