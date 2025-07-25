#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Under Writing Master
/// Created By			: Anbuvel.T
/// Created Date		: 28-July-2016
/// Purpose	            : 

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
using S3GBusEntity;
using System.Data.OracleClient;

namespace S3GDALayer.UnderWriting
{
    namespace UnderWritingMgtServices
    {
        public class ClsUnderWriting
        {
            int intRowsAffected;
            S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTDataTable ObjUW_MST_DAL;
            S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_ApprovalDataTable ObjUW_ApprovalMST_DAL;
            S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransDataTable ObjUnderWriteTransaction_DataTable;
            S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UserGroup_AccessDataTable ObjUW_AccessMST_DAL;
            S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_Approval_TranDataTable ObjUW_ApproveTrans_DAL;
            Database db;
            public ClsUnderWriting()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubUnderWritingMSTDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_MST_DAL, out int outNoofYear, out int outCreditScoreID)
            {
                try
                {
                    outNoofYear = 0;
                    outCreditScoreID = 0;
                    ObjUW_MST_DAL = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_UW_MST_DAL, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTRow ObjUWMstRow in ObjUW_MST_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_UW_INSUPD_DTL");
                        db.AddInParameter(command, "@CreditScore_ID", DbType.Int32, ObjUWMstRow.CreditScore_Guide_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUWMstRow.Company_ID);
                        if (!ObjUWMstRow.IsLOB_IDNull())
                        {
                            db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjUWMstRow.LOB_ID);
                        }
                        //if (command.Parameters["@outNoofYear"].Value != null)
                        if (!ObjUWMstRow.IsProduct_IDNull())
                        {
                            db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjUWMstRow.Product_ID);
                        }
                        if (!ObjUWMstRow.IsConstitution_IDNull())
                        {
                            db.AddInParameter(command, "@Constitution_ID", DbType.Int32, ObjUWMstRow.Constitution_ID);
                        }
                        db.AddInParameter(command, "@NoOfYears", DbType.Int32, ObjUWMstRow.NoOfYears);
                        db.AddInParameter(command, "@PastYears", DbType.Int32, ObjUWMstRow.PastYear);
                        db.AddInParameter(command, "@CurrentYear", DbType.Int32, ObjUWMstRow.CurrentYear);
                        db.AddInParameter(command, "@FutYears", DbType.Int32, ObjUWMstRow.FutureYear);
                        db.AddInParameter(command, "@Past_Year_Start_From", DbType.String, ObjUWMstRow.Past_Year_Start_From);
                        db.AddInParameter(command, "@ShortName", DbType.String, ObjUWMstRow.ShortName);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjUWMstRow.IsXMLYearsDetNull())
                            {
                                param = new OracleParameter("@XMLYearsDet", OracleType.Clob,
                                    ObjUWMstRow.XMLCreditScoreParameterValues.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjUWMstRow.XMLYearsDet);
                                command.Parameters.Add(param);
                            }
                            if (!ObjUWMstRow.IsXMLCreditScoreGroupDetNull())
                            {
                                param = new OracleParameter("@XMLCreditScoreGroupDet", OracleType.Clob,
                                    ObjUWMstRow.XMLCreditScoreParameterValues.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjUWMstRow.XMLCreditScoreGroupDet);
                                command.Parameters.Add(param);
                            }
                            if (!ObjUWMstRow.IsXMLCreditScoreParameterValuesNull())
                            {
                                param = new OracleParameter("@XMLCreditScoreParamDet", OracleType.Clob,
                                    ObjUWMstRow.XMLCreditScoreParameterValues.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjUWMstRow.XMLCreditScoreParameterValues);
                                command.Parameters.Add(param);
                            }
                            if (!ObjUWMstRow.IsXMLNumberDetNull())
                            {
                                param = new OracleParameter("@XMLNumberDet", OracleType.Clob,
                                    ObjUWMstRow.XMLNumberDet.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjUWMstRow.XMLNumberDet);
                                command.Parameters.Add(param);
                            }

                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLYearsDet", DbType.String, ObjUWMstRow.XMLYearsDet);
                            db.AddInParameter(command, "@XMLCreditScoreGroupDet", DbType.String, ObjUWMstRow.XMLCreditScoreGroupDet);
                            db.AddInParameter(command, "@XMLCreditScoreParamDet", DbType.String, ObjUWMstRow.XMLCreditScoreParameterValues);
                            db.AddInParameter(command, "@XMLNumberDet", DbType.String, ObjUWMstRow.XMLNumberDet);
                        }
                        db.AddInParameter(command, "@YearValue", DbType.String, ObjUWMstRow.YearValue);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUWMstRow.Created_By);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjUWMstRow.Is_Active);
                        db.AddInParameter(command, "@Is_Used", DbType.Int32, ObjUWMstRow.Is_Used);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@outNoofYear", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@outCreditScoreID", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command,trans);
                                db.FunPubExecuteNonQuery(command, ref trans);

                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    //strErrMsg = (string)command.Parameters["@ErrorMsg"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());

                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (command.Parameters["@outNoofYear"].Value != null)
                                        outNoofYear = (int)command.Parameters["@outNoofYear"].Value;
                                    if (command.Parameters["@outCreditScoreID"].Value != null)
                                        outCreditScoreID = (int)command.Parameters["@outCreditScoreID"].Value;

                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }

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

            #region Under Writing Transaction
            public int FunPubCreateUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjUnderWritingTransaction_DataTable, out string strUWNumber_Out)
            {
                strUWNumber_Out = string.Empty;
                try
                {
                    ObjUnderWriteTransaction_DataTable = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransDataTable)ClsPubSerialize.DeSerialize(bytesObjUnderWritingTransaction_DataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransDataTable));
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_UW_INSERT_TRANS");
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransRow ObjunderWriteTransactionRow in ObjUnderWriteTransaction_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@Enq_Cus_App_ID", DbType.Int32, ObjunderWriteTransactionRow.Enq_Cus_App_ID);
                        db.AddInParameter(command, "@UnderWritingMST_ID", DbType.Int32, ObjunderWriteTransactionRow.UnderWritingMST_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjunderWriteTransactionRow.LOB_ID);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjunderWriteTransactionRow.Product_ID);
                        db.AddInParameter(command, "@Constitution", DbType.Int32, ObjunderWriteTransactionRow.Constitution);
                        db.AddInParameter(command, "@Past_Years", DbType.Decimal, ObjunderWriteTransactionRow.Past_Years);
                        db.AddInParameter(command, "@Future_Years", DbType.Decimal, ObjunderWriteTransactionRow.Future_Years);
                        db.AddInParameter(command, "@PastYear_StartingFrom", DbType.String, ObjunderWriteTransactionRow.PastYear_StartingFrom);
                        db.AddInParameter(command, "@Is_CustomerID_EnquiryNumber", DbType.Int32, ObjunderWriteTransactionRow.Is_CustomerID_EnquiryNumber);
                        if (!ObjunderWriteTransactionRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjunderWriteTransactionRow.Customer_ID);
                        }
                        db.AddInParameter(command, "@TRANS_TYPE", DbType.Int32, ObjunderWriteTransactionRow.Tran_TYPE);
                        db.AddInParameter(command, "@TRAN_REF_NO", DbType.Int32, ObjunderWriteTransactionRow.TRAN_REF_NO);
                        db.AddInParameter(command, "@TRAN_REF_DOC_NO", DbType.String, ObjunderWriteTransactionRow.TRAN_REF_DOC_NO);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjunderWriteTransactionRow.Company_ID);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjunderWriteTransactionRow.IsXMLCreditGuideTransaction_Year_ValuesNull())
                            {
                                param = new OracleParameter("@XmlCGT_Year_Values", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLAddtionalNull())
                            {
                                param = new OracleParameter("@sXMLAddtional", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLAddtional.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLAddtional);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLProcYearsNull())
                            {
                                param = new OracleParameter("@XMLProcYears", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLProcYears.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLProcYears);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWGroupValueNull())
                            {
                                param = new OracleParameter("@XMLUWGroupValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWGroupValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWGroupValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWParamValueNull())
                            {
                                param = new OracleParameter("@XMLUWParamValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWParamValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWParamValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWANSIValueNull())
                            {
                                param = new OracleParameter("@XMLUWANSIValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWANSIValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWANSIValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWOTHERValueNull())
                            {
                                param = new OracleParameter("@XMLUWOTHERValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWOTHERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWOTHERValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWFIValueNull())
                            {
                                param = new OracleParameter("@XMLUWFIValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFIValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWFIValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWFINNERValueNull())
                            {
                                param = new OracleParameter("@XMLUWFINNERValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFINNERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWFINNERValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLFileUploadValueNull())
                            {
                                param = new OracleParameter("@XMLFileUploadValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFINNERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLFileUploadValue);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XmlCGT_Year_Values", DbType.String, ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values);
                            if (!ObjunderWriteTransactionRow.IsXMLAddtionalNull())
                                db.AddInParameter(command, "@sXMLAddtional", DbType.String, ObjunderWriteTransactionRow.XMLAddtional);
                            db.AddInParameter(command, "@XMLProcYears", DbType.String, ObjunderWriteTransactionRow.XMLProcYears);
                            db.AddInParameter(command, "@XMLUWGroupValue", DbType.String, ObjunderWriteTransactionRow.XMLUWGroupValue);
                            db.AddInParameter(command, "@XMLUWParamValue", DbType.String, ObjunderWriteTransactionRow.XMLUWParamValue);
                            db.AddInParameter(command, "@XMLUWANSIValue", DbType.String, ObjunderWriteTransactionRow.XMLUWANSIValue);
                            db.AddInParameter(command, "@XMLUWOTHERValue", DbType.String, ObjunderWriteTransactionRow.XMLUWOTHERValue);
                            db.AddInParameter(command, "@XMLUWFIValue", DbType.String, ObjunderWriteTransactionRow.XMLUWFIValue);
                            db.AddInParameter(command, "@XMLUWFINNERValue", DbType.String, ObjunderWriteTransactionRow.XMLUWFINNERValue);
                            db.AddInParameter(command, "@XMLFileUploadValue", DbType.String, ObjunderWriteTransactionRow.XMLFileUploadValue);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjunderWriteTransactionRow.Created_By);
                        db.AddInParameter(command, "@Financial_Year", DbType.String, ObjunderWriteTransactionRow.FinancialYear);
                        db.AddOutParameter(command, "@UW_Tran_Doc_NO", DbType.String, 100);
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
                                {
                                    strUWNumber_Out = (string)command.Parameters["@UW_Tran_Doc_NO"].Value;
                                    trans.Commit();
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Rollback();
                                }

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
            public int FunPubModifyUnderWritingTransaction(SerializationMode SerMode, byte[] bytesObjUnderWritingTransaction_DataTable)
            {
                try
                {
                    ObjUnderWriteTransaction_DataTable = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransDataTable)ClsPubSerialize.DeSerialize(bytesObjUnderWritingTransaction_DataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransDataTable));
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_UW_UPDATE_TRANS");
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWritingTransRow ObjunderWriteTransactionRow in ObjUnderWriteTransaction_DataTable.Rows)
                    {
                        db.AddInParameter(command, "@UnderWritingTran_ID", DbType.Int32, ObjunderWriteTransactionRow.UnderWritingTransaction_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjunderWriteTransactionRow.LOB_ID);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjunderWriteTransactionRow.Product_ID);
                        db.AddInParameter(command, "@Constitution", DbType.Int32, ObjunderWriteTransactionRow.Constitution);
                        db.AddInParameter(command, "@Past_Years", DbType.Decimal, ObjunderWriteTransactionRow.Past_Years);
                        db.AddInParameter(command, "@Future_Years", DbType.Decimal, ObjunderWriteTransactionRow.Future_Years);
                        db.AddInParameter(command, "@PastYear_StartingFrom", DbType.String, ObjunderWriteTransactionRow.PastYear_StartingFrom);
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjunderWriteTransactionRow.Modified_By);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjunderWriteTransactionRow.Company_ID);
                        if (!ObjunderWriteTransactionRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.String, ObjunderWriteTransactionRow.Customer_ID);
                        }
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjunderWriteTransactionRow.IsXMLCreditGuideTransaction_Year_ValuesNull())
                            {
                                param = new OracleParameter("@XmlCGT_Year_Values", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLAddtionalNull())
                            {
                                param = new OracleParameter("@sXMLAddtional", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLAddtional.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLAddtional);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLProcYearsNull())
                            {
                                param = new OracleParameter("@XMLProcYears", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLProcYears.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLProcYears);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWGroupValueNull())
                            {
                                param = new OracleParameter("@XMLUWGroupValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWGroupValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWGroupValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWParamValueNull())
                            {
                                param = new OracleParameter("@XMLUWParamValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWParamValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWParamValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWANSIValueNull())
                            {
                                param = new OracleParameter("@XMLUWANSIValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWANSIValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWANSIValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWOTHERValueNull())
                            {
                                param = new OracleParameter("@XMLUWOTHERValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWOTHERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWOTHERValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWFIValueNull())
                            {
                                param = new OracleParameter("@XMLUWFIValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFIValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWFIValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLUWFINNERValueNull())
                            {
                                param = new OracleParameter("@XMLUWFINNERValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFINNERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLUWFINNERValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjunderWriteTransactionRow.IsXMLFileUploadValueNull())
                            {
                                param = new OracleParameter("@XMLFileUploadValue", OracleType.Clob,
                                    ObjunderWriteTransactionRow.XMLUWFINNERValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjunderWriteTransactionRow.XMLFileUploadValue);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XmlCGT_Year_Values", DbType.String, ObjunderWriteTransactionRow.XMLCreditGuideTransaction_Year_Values);
                            db.AddInParameter(command, "@XMLProcYears", DbType.String, ObjunderWriteTransactionRow.XMLProcYears);
                            if (!ObjunderWriteTransactionRow.IsXMLAddtionalNull())
                                db.AddInParameter(command, "@sXMLAddtional", DbType.String, ObjunderWriteTransactionRow.XMLAddtional);
                            db.AddInParameter(command, "@XMLUWGroupValue", DbType.String, ObjunderWriteTransactionRow.XMLUWGroupValue);
                            db.AddInParameter(command, "@XMLUWParamValue", DbType.String, ObjunderWriteTransactionRow.XMLUWParamValue);
                            db.AddInParameter(command, "@XMLUWANSIValue", DbType.String, ObjunderWriteTransactionRow.XMLUWANSIValue);
                            db.AddInParameter(command, "@XMLUWOTHERValue", DbType.String, ObjunderWriteTransactionRow.XMLUWOTHERValue);
                            db.AddInParameter(command, "@XMLUWFIValue", DbType.String, ObjunderWriteTransactionRow.XMLUWFIValue);
                            db.AddInParameter(command, "@XMLUWFINNERValue", DbType.String, ObjunderWriteTransactionRow.XMLUWFINNERValue);
                            db.AddInParameter(command, "@XMLFileUploadValue", DbType.String, ObjunderWriteTransactionRow.XMLFileUploadValue);
                        }
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
            public DataSet FunPubQueryUnderWritingMstParameterDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_MSTDataTable)
            {
                DataSet dsCreditScore = new DataSet();
                ObjUW_MST_DAL = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_UW_MSTDataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTDataTable));
                try
                {
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_MSTRow ObjUnderWritingRow in ObjUW_MST_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_Get_UW_MstDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUnderWritingRow.Company_ID);
                        //db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUnderWritingRow.Created_By);
                        db.AddInParameter(command, "@CreditScore_ID", DbType.Int32, ObjUnderWritingRow.CreditScore_Guide_ID);
                        db.AddInParameter(command, "@YearValue", DbType.String, ObjUnderWritingRow.YearValue);

                        dsCreditScore = db.FunPubExecuteDataSet(command);
                    }
                    return dsCreditScore;
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                finally
                {
                    dsCreditScore.Dispose();
                    dsCreditScore = null;
                }

            }
            #endregion

            #region under Writing Master Approval
            public int FunPubCreateUnderWritingAprovalMstDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_ApprovalMstDataTable, out int outCreditScoreID)
            {
                try
                {
                    outCreditScoreID = 0;
                    ObjUW_ApprovalMST_DAL = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_ApprovalDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_UW_ApprovalMstDataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_ApprovalDataTable));
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UnderWriting_ApprovalRow ObjApprovalMstRow in ObjUW_ApprovalMST_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_INSCSAPRDTL");
                        db.AddInParameter(command, "@CreditScore_ID", DbType.Int32, ObjApprovalMstRow.CreditScore_Guide_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjApprovalMstRow.Company_ID);
                        if (!ObjApprovalMstRow.IsLOB_IDNull())
                        {
                            db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApprovalMstRow.LOB_ID);
                        }
                        if (!ObjApprovalMstRow.IsProduct_IDNull())
                        {
                            db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjApprovalMstRow.Product_ID);
                        }
                        if (!ObjApprovalMstRow.IsConstitution_IDNull())
                        {
                            db.AddInParameter(command, "@Constitution_ID", DbType.Int32, ObjApprovalMstRow.Constitution_ID);
                        }
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjApprovalMstRow.IsXMLAprGroupDtlNull())
                            {
                                param = new OracleParameter("@XMLAprGroupDtl", OracleType.Clob,
                                    ObjApprovalMstRow.XMLAprGroupDtl.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjApprovalMstRow.XMLAprGroupDtl);
                                command.Parameters.Add(param);
                            }
                            if (!ObjApprovalMstRow.IsXMLAprAuthDtlNull())
                            {
                                param = new OracleParameter("@XMLAprAuthDtl", OracleType.Clob,
                                    ObjApprovalMstRow.XMLAprAuthDtl.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjApprovalMstRow.XMLAprAuthDtl);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLAprGroupDtl", DbType.String, ObjApprovalMstRow.XMLAprGroupDtl);
                            db.AddInParameter(command, "@XMLAprAuthDtl", DbType.String, ObjApprovalMstRow.XMLAprAuthDtl);
                        }
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjApprovalMstRow.Created_By);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjApprovalMstRow.Is_Active);
                        db.AddInParameter(command, "@Mode", DbType.String, ObjApprovalMstRow.Mode);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@outCreditScoreID", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (command.Parameters["@outCreditScoreID"].Value != null)
                                        outCreditScoreID = (int)command.Parameters["@outCreditScoreID"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }

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

            #region under Writing User Group Access
            public int FunPubCreateUnderWritingAccessMstDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_AccessMstDataTable, out int outUserAccessID)
            {
                try
                {
                    outUserAccessID = 0;
                    ObjUW_AccessMST_DAL = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UserGroup_AccessDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_UW_AccessMstDataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UserGroup_AccessDataTable));
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_UserGroup_AccessRow ObjAccessMstRow in ObjUW_AccessMST_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_UW_INSUPDUSERGRP_ACESS");
                        db.AddInParameter(command, "@UW_Access_ID", DbType.Int32, ObjAccessMstRow.UW_Access_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAccessMstRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjAccessMstRow.User_ID);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjAccessMstRow.IsXMLUWMstValueNull())
                            {
                                param = new OracleParameter("@XMLUWMstValue", OracleType.Clob,
                                    ObjAccessMstRow.XMLUWMstValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjAccessMstRow.XMLUWMstValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjAccessMstRow.IsXMLUWGroupValueNull())
                            {
                                param = new OracleParameter("@XMLUWGroupValue", OracleType.Clob,
                                    ObjAccessMstRow.XMLUWGroupValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjAccessMstRow.XMLUWGroupValue);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUWMstValue", DbType.String, ObjAccessMstRow.XMLUWMstValue);
                            db.AddInParameter(command, "@XMLUWGroupValue", DbType.String, ObjAccessMstRow.XMLUWGroupValue);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjAccessMstRow.Created_By);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjAccessMstRow.Is_Active);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@OutAccess_ID", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (command.Parameters["@OutAccess_ID"].Value != null)
                                        outUserAccessID = (int)command.Parameters["@OutAccess_ID"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }

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

            #region Under Writing Transaction Approval
            public int FunPubCreateUnderWritingAprTranDetails(SerializationMode SerMode, byte[] bytesObjS3G_UW_AprTransDataTable, out int outAprTransID)
            {
                try
                {
                    outAprTransID = 0;
                    ObjUW_ApproveTrans_DAL = (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_Approval_TranDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_UW_AprTransDataTable, SerMode, typeof(S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_Approval_TranDataTable));
                    foreach (S3GBusEntity.UnderWriting.UnderWritingMgtServices.S3G_UW_Approval_TranRow ObjAprTranRow in ObjUW_ApproveTrans_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_UW_APRINSUPD_TRANS");
                        db.AddInParameter(command, "@APR_UATH_Link_ID", DbType.Int32, ObjAprTranRow.APR_UATH_Link_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjAprTranRow.Company_ID);
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjAprTranRow.LOCATION_ID);
                        db.AddInParameter(command, "@UW_Tran_SLNO", DbType.Int32, ObjAprTranRow.UW_Tran_SLNO);
                        db.AddInParameter(command, "@UnderWriting_Guide_ID", DbType.Int32, ObjAprTranRow.UnderWriting_Guide_ID);
                        db.AddInParameter(command, "@Approv_Seq", DbType.Int32, ObjAprTranRow.Approv_Seq);
                        db.AddInParameter(command, "@Approver_Type", DbType.Int32, ObjAprTranRow.Approver_Type);
                        if (!ObjAprTranRow.IsLimit_SoughtNull())
                        {
                            db.AddInParameter(command, "@Limit_Sought", DbType.Decimal, ObjAprTranRow.Limit_Sought);
                        }
                        if (!ObjAprTranRow.IsLimit_EligibleNull())
                        {
                            db.AddInParameter(command, "@Limit_Eligible", DbType.Decimal, ObjAprTranRow.Limit_Eligible);
                        }
                        if (!ObjAprTranRow.IsLimit_SantionedNull())
                        {
                            db.AddInParameter(command, "@Limit_Santioned", DbType.Decimal, ObjAprTranRow.Limit_Santioned);
                        }
                        db.AddInParameter(command, "@Limit_Remarks", DbType.String, ObjAprTranRow.Limit_Remarks);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjAprTranRow.IsXMLUWGroupValueNull())
                            {
                                param = new OracleParameter("@XMLUWGroupValue", OracleType.Clob,
                                    ObjAprTranRow.XMLUWGroupValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjAprTranRow.XMLUWGroupValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjAprTranRow.IsXMLUWGROUPAPRValueNull())
                            {
                                param = new OracleParameter("@XMLUWGROUPAPRValue", OracleType.Clob,
                                    ObjAprTranRow.XMLUWGROUPAPRValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjAprTranRow.XMLUWGROUPAPRValue);
                                command.Parameters.Add(param);
                            }
                            if (!ObjAprTranRow.IsXMLUWLIMITValueNull())
                            {
                                param = new OracleParameter("@XMLUWLIMITValue", OracleType.Clob,
                                    ObjAprTranRow.XMLUWLIMITValue.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjAprTranRow.XMLUWLIMITValue);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUWGroupValue", DbType.String, ObjAprTranRow.XMLUWGroupValue);
                            db.AddInParameter(command, "@XMLUWGROUPAPRValue", DbType.String, ObjAprTranRow.XMLUWGROUPAPRValue);
                            db.AddInParameter(command, "@XMLUWLIMITValue", DbType.String, ObjAprTranRow.XMLUWLIMITValue);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjAprTranRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@OutAprTranID", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (command.Parameters["@OutAprTranID"].Value != null)
                                        outAprTransID = (int)command.Parameters["@OutAprTranID"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }

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
