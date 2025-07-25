﻿using System;
using S3GDALayer.S3GAdminServices;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using System.Linq;
using System.Text;
using S3GBusEntity;
using System.Data.OracleClient;

namespace S3GDALayer.Origination
{
    namespace CreditMgtServices
    {
        public class ClsPubCreditGuideTransaction
        {
            int intRowsAffected;
            S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionDataTable ObjCreditGuideTransaction_DataTable;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubCreditGuideTransaction()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            public int FunPubCreateCreditGuideTransaction(SerializationMode SerMode, byte[] bytesObjCreditGuideTransaction_DataTable)
            {
                try
                {
                    ObjCreditGuideTransaction_DataTable = (S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionDataTable)ClsPubSerialize.DeSerialize(bytesObjCreditGuideTransaction_DataTable, SerMode, typeof(S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_InsertCreditGuideTransaction");
                    foreach (S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionRow ObjCreditGuideTransactionRow in ObjCreditGuideTransaction_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@Enq_Cus_App_ID", DbType.Int32, ObjCreditGuideTransactionRow.Enq_Cus_App_ID);
                        db.AddInParameter(command, "@CreditScore_Guide_ID", DbType.Int32, ObjCreditGuideTransactionRow.CreditScore_Guide_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjCreditGuideTransactionRow.LOB_ID);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjCreditGuideTransactionRow.Product_ID);
                        if (!ObjCreditGuideTransactionRow.IsConstitutionNull())
                        {
                            db.AddInParameter(command, "@Constitution", DbType.Int32, ObjCreditGuideTransactionRow.Constitution);
                        }
                        db.AddInParameter(command, "@Past_Years", DbType.Decimal, ObjCreditGuideTransactionRow.Past_Years);
                        db.AddInParameter(command, "@Future_Years", DbType.Decimal, ObjCreditGuideTransactionRow.Future_Years);
                        db.AddInParameter(command, "@PastYear_StartingFrom", DbType.String, ObjCreditGuideTransactionRow.PastYear_StartingFrom);
                        db.AddInParameter(command, "@Is_CustomerID_EnquiryNumber", DbType.Int32, ObjCreditGuideTransactionRow.Is_CustomerID_EnquiryNumber);
                        if (!ObjCreditGuideTransactionRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjCreditGuideTransactionRow.Customer_ID);
                        }
                        db.AddInParameter(command, "@Document_Type", DbType.Int32, ObjCreditGuideTransactionRow.Document_Type);
                        db.AddInParameter(command, "@Document_Type_ID", DbType.Int32, ObjCreditGuideTransactionRow.Document_Type_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCreditGuideTransactionRow.Company_ID);
                        db.AddInParameter(command, "@Actual_score", DbType.Decimal, ObjCreditGuideTransactionRow.Actual_Score);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjCreditGuideTransactionRow.IsXMLCreditGuideTransaction_Year_ValuesNull())
                            {
                                param = new OracleParameter("@XmlCGT_Year_Values", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLAddtionalNull())
                            {
                                param = new OracleParameter("@sXMLAddtional", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLAddtional.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLAddtional);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLCredidNumberValueNull())
                            {
                                param = new OracleParameter("@XMLCredidNumberValue", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLCredidNumberValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLCredidNumberValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLProcYearsNull())
                            {
                                param = new OracleParameter("@XMLProcYears", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLProcYears.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLProcYears);
                                command.Parameters.Add(param);
                            }

                        }
                        else
                        {
                            db.AddInParameter(command, "@XmlCGT_Year_Values", DbType.String, ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values);
                            if (!ObjCreditGuideTransactionRow.IsXMLAddtionalNull())
                                db.AddInParameter(command, "@sXMLAddtional", DbType.String, ObjCreditGuideTransactionRow.XMLAddtional);
                            db.AddInParameter(command, "@XMLCredidNumberValue", DbType.String, ObjCreditGuideTransactionRow.XMLCredidNumberValue);
                            db.AddInParameter(command, "@XMLProcYears", DbType.String, ObjCreditGuideTransactionRow.XMLProcYears);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjCreditGuideTransactionRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();

                            }
                            catch (Exception ex)
                            {
                                // Roll back the transaction. 
                                intRowsAffected = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }

                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
            public int FunPubModifyCreditGuideTransaction(SerializationMode SerMode, byte[] bytesObjCreditGuideTransaction_DataTable)
            {
                try
                {
                    ObjCreditGuideTransaction_DataTable = (S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionDataTable)ClsPubSerialize.DeSerialize(bytesObjCreditGuideTransaction_DataTable, SerMode, typeof(S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_UpdateCreditGuideTransaction");
                    foreach (S3GBusEntity.Origination.CreditMgtServices.S3G_ORG_CreditGuideTransactionRow ObjCreditGuideTransactionRow in ObjCreditGuideTransaction_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@CreditScoreTran_ID", DbType.Int32, ObjCreditGuideTransactionRow.CreditGuideTransaction_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjCreditGuideTransactionRow.LOB_ID);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjCreditGuideTransactionRow.Product_ID);
                        db.AddInParameter(command, "@Constitution", DbType.Int32, ObjCreditGuideTransactionRow.Constitution);
                        db.AddInParameter(command, "@Past_Years", DbType.Decimal, ObjCreditGuideTransactionRow.Past_Years);
                        db.AddInParameter(command, "@Future_Years", DbType.Decimal, ObjCreditGuideTransactionRow.Future_Years);
                        db.AddInParameter(command, "@PastYear_StartingFrom", DbType.String, ObjCreditGuideTransactionRow.PastYear_StartingFrom);
                        db.AddInParameter(command, "@Actual_score", DbType.Decimal, ObjCreditGuideTransactionRow.Actual_Score);
                        if (!ObjCreditGuideTransactionRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.String, ObjCreditGuideTransactionRow.Customer_ID);
                        }
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjCreditGuideTransactionRow.IsXMLCreditGuideTransaction_Year_ValuesNull())
                            {
                                param = new OracleParameter("@XmlCGT_Year_Values", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLCredidNumberValueNull())
                            {
                                param = new OracleParameter("@XMLCredidNumberValue", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLCredidNumberValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLCredidNumberValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLProcYearsNull())
                            {
                                param = new OracleParameter("@XMLProcYears", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLProcYears.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLProcYears);
                                command.Parameters.Add(param);
                            }
                            if (!ObjCreditGuideTransactionRow.IsXMLAddtionalNull())
                            {
                                param = new OracleParameter("@sXMLAddtional", OracleType.Clob,
                                    ObjCreditGuideTransactionRow.XMLAddtional.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjCreditGuideTransactionRow.XMLAddtional);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XmlCGT_Year_Values", DbType.String, ObjCreditGuideTransactionRow.XMLCreditGuideTransaction_Year_Values);
                            db.AddInParameter(command, "@XMLCredidNumberValue", DbType.String, ObjCreditGuideTransactionRow.XMLCredidNumberValue);
                            db.AddInParameter(command, "@XMLProcYears", DbType.String, ObjCreditGuideTransactionRow.XMLProcYears);
                            if (!ObjCreditGuideTransactionRow.IsXMLAddtionalNull())
                                db.AddInParameter(command, "@sXMLAddtional", DbType.String, ObjCreditGuideTransactionRow.XMLAddtional);
                        }
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjCreditGuideTransactionRow.Modified_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();

                            }
                            catch (Exception ex)
                            {
                                // Roll back the transaction. 
                                intRowsAffected = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }

                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
        }
    }
}
