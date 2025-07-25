using System;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ORG = S3GBusEntity.Origination;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using System.Data;
using System.Data.OracleClient;

namespace S3GDALayer.LegalRepossession
{
    namespace LegalAndRepossessionMgtServices
    {
        public class ClsCaseGeneration : ClsPubDalLegalRepossessionBase
        {
            int intRowsAffected = 0;
            S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable ObjS3G_CASEGEN;
            S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASE_CANCELDataTable ObjS3G_CASE_CANCEL;

            #region ROP CASE FILING
            public int FunPubCreateCaseGeneration(SerializationMode SerMode, byte[] bytesCaseGen_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {
                    ObjS3G_CASEGEN = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable)ClsPubSerialize.DeSerialize(bytesCaseGen_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INS_CASEGENERATION");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONRow ObjCaseGenRow in ObjS3G_CASEGEN)
                    {
                        //if (strErrMsg == "" && ObjCaseGenRow.CASE_CODE == "")
                        //{
                        //    db.AddInParameter(command, "@CASE_CODE", DbType.String, ObjCaseGenRow.CASE_CODE);
                        //}
                        //else
                        //{
                        //    if (strErrMsg != "" && ObjCaseGenRow.CASE_CODE == "")
                        //    {
                        //        db.AddInParameter(command, "@CASE_CODE", DbType.String, strErrMsg);
                        //    }
                        //}

                        db.AddInParameter(command, "@CASEGENERATION", DbType.Int32, ObjCaseGenRow.CASE_ID);
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCaseGenRow.COMPANY_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjCaseGenRow.LOB_ID);
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjCaseGenRow.LOCATION_ID);
                        if (!ObjCaseGenRow.IsPANUMNull())
                            db.AddInParameter(command, "@PANUM", DbType.String, ObjCaseGenRow.PANUM);
                        if (!ObjCaseGenRow.IsSANUMNull())
                            db.AddInParameter(command, "@SANUM", DbType.String, ObjCaseGenRow.SANUM);
                        db.AddInParameter(command, "@CUSTOMER_ID", DbType.Int32, ObjCaseGenRow.CUSTOMER_ID);
                        if (!ObjCaseGenRow.IsLITICATION_TYPE_CODENull())
                            db.AddInParameter(command, "@LITIGATION_ID", DbType.Int32, ObjCaseGenRow.LITICATION_TYPE_CODE);
                        if (!ObjCaseGenRow.IsROP_IDNull())
                            db.AddInParameter(command, "@FIRLOCATION", DbType.String, ObjCaseGenRow.ROP_ID);
                        if (!ObjCaseGenRow.IsFIR_DATENull())
                            db.AddInParameter(command, "@FIRDATE", DbType.String, ObjCaseGenRow.FIR_DATE);
                        if (!ObjCaseGenRow.IsFIR_STATUSNull())
                            db.AddInParameter(command, "@FIRSTATUS", DbType.Int32, ObjCaseGenRow.FIR_STATUS);
                        if (!ObjCaseGenRow.IsFIR_COSTNull())
                            db.AddInParameter(command, "@FIRCOST", DbType.Decimal, ObjCaseGenRow.FIR_COST);
                        if (!ObjCaseGenRow.IsFIR_STATEMENTNull())
                            db.AddInParameter(command, "@FIRSTATEMENT", DbType.String, ObjCaseGenRow.FIR_STATEMENT);
                        if (!ObjCaseGenRow.IsFIR_REMARKSNull())
                            db.AddInParameter(command, "@FIRREMARKS", DbType.String, ObjCaseGenRow.FIR_REMARKS);
                        if (!ObjCaseGenRow.IsFIR_CLOSED_DATENull())
                            db.AddInParameter(command, "@FIR_CLOSED_DATE", DbType.String, ObjCaseGenRow.FIR_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsFIR_NUMBERNull())
                            db.AddInParameter(command, "@FIRNUMBER", DbType.String, ObjCaseGenRow.FIR_NUMBER);
                        if (!ObjCaseGenRow.IsCOURT_IDNull())
                            db.AddInParameter(command, "@COURT_ID", DbType.Int32, ObjCaseGenRow.COURT_ID);
                        if (!ObjCaseGenRow.IsCASE_FILED_DATENull())
                            db.AddInParameter(command, "@CASE_FILED_DATE", DbType.String, ObjCaseGenRow.CASE_FILED_DATE);
                        if (!ObjCaseGenRow.IsCASE_NUMBERNull())
                            db.AddInParameter(command, "@COURT_CASE_NO", DbType.String, ObjCaseGenRow.CASE_NUMBER);
                        if (!ObjCaseGenRow.IsCASE_CHARGES_AMTNull())
                            db.AddInParameter(command, "@CASE_CHARGE_AMT", DbType.Decimal, ObjCaseGenRow.CASE_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_STATUSNull())
                            db.AddInParameter(command, "@CASE_STATUS", DbType.Int32, ObjCaseGenRow.CASE_STATUS);
                        if (!ObjCaseGenRow.IsADDL_CHARGES_AMTNull())
                            db.AddInParameter(command, "@ADDL_CHARGES", DbType.Decimal, ObjCaseGenRow.ADDL_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_CLOSED_DATENull())
                            db.AddInParameter(command, "@CASE_CLOSED_DATE", DbType.String, ObjCaseGenRow.CASE_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsADVOCATE_IDNull())
                            db.AddInParameter(command, "@ADVOCATE_ID", DbType.Int32, ObjCaseGenRow.ADVOCATE_ID);
                        if (!ObjCaseGenRow.IsCASE_VERDICT_STATEMENTNull())
                            db.AddInParameter(command, "@VERDICT_STATEMENT", DbType.String, ObjCaseGenRow.CASE_VERDICT_STATEMENT);
                        if (!ObjCaseGenRow.IsUSER_IDNull())
                            db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjCaseGenRow.USER_ID);
                        if (!ObjCaseGenRow.IsXML_SUMMONDTLSNull())
                            db.AddInParameter(command, "@XML_SUMMONDTL", DbType.String, ObjCaseGenRow.XML_SUMMONDTLS);
                        if (!ObjCaseGenRow.IsXML_ACCDETAILSNull())
                            db.AddInParameter(command, "@XML_ACCDETAILS", DbType.String, ObjCaseGenRow.XML_ACCDETAILS);
                        if (!ObjCaseGenRow.IsXML_PROCECUTIONDTLSNull())
                            db.AddInParameter(command, "@XML_PROSECUTIONDTL", DbType.String, ObjCaseGenRow.XML_PROCECUTIONDTLS);
                        // Added By R. Manikandan as  per Request given by Bashyam Sir 
                        if (!ObjCaseGenRow.IsROP_CLN_DATENull())
                            db.AddInParameter(command, "@ROP_CLN_DATE", DbType.String, ObjCaseGenRow.ROP_CLN_DATE);
                        if (!ObjCaseGenRow.IsWITHDRAW_REASONNull())
                            db.AddInParameter(command, "@WITHDRAW_REASON", DbType.String, ObjCaseGenRow.WITHDRAW_REASON);
                        if (!ObjCaseGenRow.IsVERDICT_NONull())
                            db.AddInParameter(command, "@VERDICT_NO", DbType.String, ObjCaseGenRow.VERDICT_NO);
                        if (!ObjCaseGenRow.IsVERDICT_DATENull())
                            db.AddInParameter(command, "@VERDICT_DATE", DbType.String, ObjCaseGenRow.VERDICT_DATE);
                        if (!ObjCaseGenRow.IsCOURT_ORD_RECEIPT_DATENull())
                            db.AddInParameter(command, "@COURT_ORD_RCT_DATE", DbType.String, ObjCaseGenRow.COURT_ORD_RECEIPT_DATE);
                        if (!ObjCaseGenRow.IsVERDICT_AMTNull())
                            db.AddInParameter(command, "@VERDICT_AMT", DbType.Decimal, ObjCaseGenRow.VERDICT_AMT);
                        if (!ObjCaseGenRow.IsEXEC_LETTER_DATENull())
                            db.AddInParameter(command, "@EXEC_LETTER_DATE", DbType.String, ObjCaseGenRow.EXEC_LETTER_DATE);
                        if (!ObjCaseGenRow.IsMORT_DATENull())
                            db.AddInParameter(command, "@MORT_DATE", DbType.String, ObjCaseGenRow.MORT_DATE);
                        if (!ObjCaseGenRow.IsREPOSSESSION_DATENull())
                            db.AddInParameter(command, "@REPOSSESSION_DATE", DbType.String, ObjCaseGenRow.REPOSSESSION_DATE);
                        if (!ObjCaseGenRow.IsLAWYER_EFF_DATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_DATE);
                        if (!ObjCaseGenRow.IsLAWYER_EFF_TODATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_TO_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_TODATE);
                        if (!ObjCaseGenRow.IsLAWYER_GEN_IDNull())
                            db.AddInParameter(command, "@LAWYER_GEN_ID", DbType.String, ObjCaseGenRow.LAWYER_GEN_ID);
                        if (!ObjCaseGenRow.IsLAWYER_FEENull())
                            db.AddInParameter(command, "@LAWYER_FEE", DbType.String, ObjCaseGenRow.LAWYER_FEE);
                        if (!ObjCaseGenRow.IsOLD_CASE_CODENull())
                            db.AddInParameter(command, "@OLD_CASE_CODE", DbType.String, ObjCaseGenRow.OLD_CASE_CODE);
                        // Added End

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (!ObjCaseGenRow.IsXML_PDC_DETNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_PDC",
                                       OracleType.Clob, ObjCaseGenRow.XML_PDC_DET.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.XML_PDC_DET);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_PDC", DbType.String, ObjCaseGenRow.XML_PDC_DET);
                            }
                        }


                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_CHEQUE_RET",
                                   OracleType.Clob, ObjCaseGenRow.XMLCHEQUE_RET_DET.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjCaseGenRow.XMLCHEQUE_RET_DET);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_CHEQUE_RET", DbType.String, ObjCaseGenRow.XMLCHEQUE_RET_DET);
                        }

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_ROP_FileUpload",
                                   OracleType.Clob, ObjCaseGenRow.Xml_ROP_FileUpload.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjCaseGenRow.Xml_ROP_FileUpload);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_ROP_FileUpload", DbType.String, ObjCaseGenRow.Xml_ROP_FileUpload);
                        }

                        //ROP Details Start
                        if (!ObjCaseGenRow.IsXml_ROP_DetailsNull())
                        {

                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@Xml_ROP_DETAILS",
                                       OracleType.Clob, ObjCaseGenRow.Xml_ROP_Details.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.Xml_ROP_Details);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@Xml_ROP_DETAILS", DbType.String, ObjCaseGenRow.Xml_ROP_Details);
                            }
                        }
                        //ROP Details Invoice Start
                        if (!ObjCaseGenRow.IsXml_ROP_InvoiceNull())
                        {

                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@Xml_ROP_DET_INVOICE",
                                       OracleType.Clob, ObjCaseGenRow.Xml_ROP_Invoice.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.Xml_ROP_Invoice);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@Xml_ROP_DET_INVOICE", DbType.String, ObjCaseGenRow.Xml_ROP_Invoice);
                            }
                        }
                        //ROP Details Invoice End

                        //if (!ObjCaseGenRow.IsCASE_AMTNull())
                        //    db.AddInParameter(command, "@Case_Amt", DbType.Decimal, ObjCaseGenRow.CASE_AMT);

                        //if (!ObjCaseGenRow.IsCLAIM_AMTNull())
                        //    db.AddInParameter(command, "@Claim_Amt", DbType.Decimal, ObjCaseGenRow.CLAIM_AMT);

                        if (!ObjCaseGenRow.IsAUTH_SIGNNull())
                            db.AddInParameter(command, "@Auth_Sign", DbType.String, ObjCaseGenRow.AUTH_SIGN);

                        //if (!ObjCaseGenRow.IsADD_CASE_ORDER_AMTNull())
                        //    db.AddInParameter(command, "@ADD_CASE_ORDER_AMT", DbType.String, ObjCaseGenRow.ADD_CASE_ORDER_AMT);

                        if (!ObjCaseGenRow.IsROP_CASE_TYPENull())
                            db.AddInParameter(command, "@Rop_Case_Type", DbType.Int32, ObjCaseGenRow.ROP_CASE_TYPE);

                        db.AddInParameter(command, "@Case_Filing_Type", DbType.Int32, ObjCaseGenRow.CASE_FILING_TYPE);

                        if (!ObjCaseGenRow.IsCASE_AMTNull())
                        {
                            db.AddInParameter(command, "@Case_Amt", DbType.Decimal, ObjCaseGenRow.CASE_AMT);
                        }
                        if (!ObjCaseGenRow.IsCase_Filed_AgainstNull())
                        {
                            db.AddInParameter(command, "@Case_Filed_Against", DbType.String, ObjCaseGenRow.Case_Filed_Against);
                        }
                        if (!ObjCaseGenRow.IsADD_CASE_ORDER_AMTNull())
                        {
                            db.AddInParameter(command, "@ADD_CASE_ORDER_AMT", DbType.Decimal, ObjCaseGenRow.ADD_CASE_ORDER_AMT);
                        }

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DOCNO", DbType.String, 100);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if ((int)command.Parameters["@ErrorCode"].Value > 1)
                                {
                                    throw new Exception("Error in Case Generation " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    strErrMsg = Convert.ToString(command.Parameters["@DOCNO"].Value);
                                    trans.Commit();
                                }
                                command.Parameters.Clear();
                            }
                            catch (Exception ex)
                            {
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                strErrMsg = ex.ToString();
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
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
                    intRowsAffected = 20; ;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
            public int FunPubCreateCaseGenerationCourt(SerializationMode SerMode, byte[] bytesCaseGen_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {
                    ObjS3G_CASEGEN = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable)ClsPubSerialize.DeSerialize(bytesCaseGen_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INS_CASEGENERATION_COURT");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONRow ObjCaseGenRow in ObjS3G_CASEGEN)
                    {
                        //if (strErrMsg == "" && ObjCaseGenRow.CASE_CODE == "")
                        //{
                        //    db.AddInParameter(command, "@CASE_CODE", DbType.String, ObjCaseGenRow.CASE_CODE);
                        //}
                        //else
                        //{
                        //    if (strErrMsg != "" && ObjCaseGenRow.CASE_CODE == "")
                        //    {
                        //        db.AddInParameter(command, "@CASE_CODE", DbType.String, strErrMsg);
                        //    }
                        //}

                        db.AddInParameter(command, "@CASEGENERATION", DbType.Int32, ObjCaseGenRow.CASE_ID);
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCaseGenRow.COMPANY_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjCaseGenRow.LOB_ID);
                        db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjCaseGenRow.LOCATION_ID);
                        if (!ObjCaseGenRow.IsPANUMNull())
                            db.AddInParameter(command, "@PANUM", DbType.String, ObjCaseGenRow.PANUM);
                        if (!ObjCaseGenRow.IsSANUMNull())
                            db.AddInParameter(command, "@SANUM", DbType.String, ObjCaseGenRow.SANUM);
                        db.AddInParameter(command, "@CUSTOMER_ID", DbType.Int32, ObjCaseGenRow.CUSTOMER_ID);
                        if (!ObjCaseGenRow.IsLITICATION_TYPE_CODENull())
                            db.AddInParameter(command, "@LITIGATION_ID", DbType.Int32, ObjCaseGenRow.LITICATION_TYPE_CODE);
                        if (!ObjCaseGenRow.IsROP_IDNull())
                            db.AddInParameter(command, "@FIRLOCATION", DbType.String, ObjCaseGenRow.ROP_ID);
                        if (!ObjCaseGenRow.IsFIR_DATENull())
                            db.AddInParameter(command, "@FIRDATE", DbType.String, ObjCaseGenRow.FIR_DATE);
                        if (!ObjCaseGenRow.IsFIR_STATUSNull())
                            db.AddInParameter(command, "@FIRSTATUS", DbType.Int32, ObjCaseGenRow.FIR_STATUS);
                        if (!ObjCaseGenRow.IsFIR_COSTNull())
                            db.AddInParameter(command, "@FIRCOST", DbType.Decimal, ObjCaseGenRow.FIR_COST);
                        if (!ObjCaseGenRow.IsFIR_STATEMENTNull())
                            db.AddInParameter(command, "@FIRSTATEMENT", DbType.String, ObjCaseGenRow.FIR_STATEMENT);
                        if (!ObjCaseGenRow.IsFIR_REMARKSNull())
                            db.AddInParameter(command, "@FIRREMARKS", DbType.String, ObjCaseGenRow.FIR_REMARKS);
                        if (!ObjCaseGenRow.IsFIR_CLOSED_DATENull())
                            db.AddInParameter(command, "@FIR_CLOSED_DATE", DbType.String, ObjCaseGenRow.FIR_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsFIR_NUMBERNull())
                            db.AddInParameter(command, "@FIRNUMBER", DbType.String, ObjCaseGenRow.FIR_NUMBER);
                        if (!ObjCaseGenRow.IsCOURT_IDNull())
                            db.AddInParameter(command, "@COURT_ID", DbType.Int32, ObjCaseGenRow.COURT_ID);
                        if (!ObjCaseGenRow.IsCASE_FILED_DATENull())
                            db.AddInParameter(command, "@CASE_FILED_DATE", DbType.String, ObjCaseGenRow.CASE_FILED_DATE);
                        if (!ObjCaseGenRow.IsCASE_NUMBERNull())
                            db.AddInParameter(command, "@COURT_CASE_NO", DbType.String, ObjCaseGenRow.CASE_NUMBER);
                        if (!ObjCaseGenRow.IsCASE_CHARGES_AMTNull())
                            db.AddInParameter(command, "@CASE_CHARGE_AMT", DbType.Decimal, ObjCaseGenRow.CASE_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_STATUSNull())
                            db.AddInParameter(command, "@CASE_STATUS", DbType.Int32, ObjCaseGenRow.CASE_STATUS);
                        if (!ObjCaseGenRow.IsADDL_CHARGES_AMTNull())
                            db.AddInParameter(command, "@ADDL_CHARGES", DbType.Decimal, ObjCaseGenRow.ADDL_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_CLOSED_DATENull())
                            db.AddInParameter(command, "@CASE_CLOSED_DATE", DbType.String, ObjCaseGenRow.CASE_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsADVOCATE_IDNull())
                            db.AddInParameter(command, "@ADVOCATE_ID", DbType.Int32, ObjCaseGenRow.ADVOCATE_ID);
                        if (!ObjCaseGenRow.IsCASE_VERDICT_STATEMENTNull())
                            db.AddInParameter(command, "@VERDICT_STATEMENT", DbType.String, ObjCaseGenRow.CASE_VERDICT_STATEMENT);
                        if (!ObjCaseGenRow.IsUSER_IDNull())
                            db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjCaseGenRow.USER_ID);
                        //if (!ObjCaseGenRow.IsXML_SUMMONDTLSNull())
                        //    db.AddInParameter(command, "@XML_SUMMONDTL", DbType.String, ObjCaseGenRow.XML_SUMMONDTLS);
                        //if (!ObjCaseGenRow.IsXML_ACCDETAILSNull())
                        //    db.AddInParameter(command, "@XML_ACCDETAILS", DbType.String, ObjCaseGenRow.XML_ACCDETAILS);
                        //if (!ObjCaseGenRow.IsXML_PROCECUTIONDTLSNull())
                        //    db.AddInParameter(command, "@XML_PROSECUTIONDTL", DbType.String, ObjCaseGenRow.XML_PROCECUTIONDTLS);
                        // Added By R. Manikandan as  per Request given by Bashyam Sir 
                        if (!ObjCaseGenRow.IsROP_CLN_DATENull())
                            db.AddInParameter(command, "@ROP_CLN_DATE", DbType.String, ObjCaseGenRow.ROP_CLN_DATE);
                        if (!ObjCaseGenRow.IsWITHDRAW_REASONNull())
                            db.AddInParameter(command, "@WITHDRAW_REASON", DbType.String, ObjCaseGenRow.WITHDRAW_REASON);
                        if (!ObjCaseGenRow.IsVERDICT_NONull())
                            db.AddInParameter(command, "@VERDICT_NO", DbType.String, ObjCaseGenRow.VERDICT_NO);
                        if (!ObjCaseGenRow.IsVERDICT_DATENull())
                            db.AddInParameter(command, "@VERDICT_DATE", DbType.String, ObjCaseGenRow.VERDICT_DATE);
                        if (!ObjCaseGenRow.IsCOURT_ORD_RECEIPT_DATENull())
                            db.AddInParameter(command, "@COURT_ORD_RCT_DATE", DbType.String, ObjCaseGenRow.COURT_ORD_RECEIPT_DATE);
                        if (!ObjCaseGenRow.IsVERDICT_AMTNull())
                            db.AddInParameter(command, "@VERDICT_AMT", DbType.Decimal, ObjCaseGenRow.VERDICT_AMT);
                        if (!ObjCaseGenRow.IsEXEC_LETTER_DATENull())
                            db.AddInParameter(command, "@EXEC_LETTER_DATE", DbType.String, ObjCaseGenRow.EXEC_LETTER_DATE);
                        if (!ObjCaseGenRow.IsMORT_DATENull())
                            db.AddInParameter(command, "@MORT_DATE", DbType.String, ObjCaseGenRow.MORT_DATE);
                        if (!ObjCaseGenRow.IsREPOSSESSION_DATENull())
                            db.AddInParameter(command, "@REPOSSESSION_DATE", DbType.String, ObjCaseGenRow.REPOSSESSION_DATE);
                        if (!ObjCaseGenRow.IsLAWYER_EFF_DATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_DATE);
                        if (!ObjCaseGenRow.IsLAWYER_EFF_TODATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_TO_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_TODATE);
                        if (!ObjCaseGenRow.IsLAWYER_GEN_IDNull())
                            db.AddInParameter(command, "@LAWYER_GEN_ID", DbType.String, ObjCaseGenRow.LAWYER_GEN_ID);
                        if (!ObjCaseGenRow.IsLAWYER_FEENull())
                            db.AddInParameter(command, "@LAWYER_FEE", DbType.String, ObjCaseGenRow.LAWYER_FEE);
                        if (!ObjCaseGenRow.IsOLD_CASE_CODENull())
                            db.AddInParameter(command, "@OLD_CASE_CODE", DbType.String, ObjCaseGenRow.OLD_CASE_CODE);
                        // Added End


                        //if (!ObjCaseGenRow.IsXML_SUMMONDTLSNull())
                        //    db.AddInParameter(command, "@XML_SUMMONDTL", DbType.String, ObjCaseGenRow.XML_SUMMONDTLS);
                        //if (!ObjCaseGenRow.IsXML_ACCDETAILSNull())
                        //    db.AddInParameter(command, "@XML_ACCDETAILS", DbType.String, ObjCaseGenRow.XML_ACCDETAILS);
                        //if (!ObjCaseGenRow.IsXML_PROCECUTIONDTLSNull())
                        //    db.AddInParameter(command, "@XML_PROSECUTIONDTL", DbType.String, ObjCaseGenRow.XML_PROCECUTIONDTLS);


                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;



                        if (!ObjCaseGenRow.IsXML_PDC_DETNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_PDC",
                                       OracleType.Clob, ObjCaseGenRow.XML_PDC_DET.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.XML_PDC_DET);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_PDC", DbType.String, ObjCaseGenRow.XML_PDC_DET);
                            }
                        }


                        if (!ObjCaseGenRow.IsXML_SUMMONDTLSNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_SUMMONDTL",
                                       OracleType.Clob, ObjCaseGenRow.XML_SUMMONDTLS.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.XML_SUMMONDTLS);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_SUMMONDTL", DbType.String, ObjCaseGenRow.XML_SUMMONDTLS);
                            }
                        }

                        if (!ObjCaseGenRow.IsXML_ACCDETAILSNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_ACCDETAILS",
                                       OracleType.Clob, ObjCaseGenRow.XML_ACCDETAILS.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.XML_ACCDETAILS);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_ACCDETAILS", DbType.String, ObjCaseGenRow.XML_ACCDETAILS);
                            }
                        }


                        if (!ObjCaseGenRow.IsXML_PROCECUTIONDTLSNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XML_PROSECUTIONDTL",
                                       OracleType.Clob, ObjCaseGenRow.XML_PROCECUTIONDTLS.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.XML_PROCECUTIONDTLS);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XML_PROSECUTIONDTL", DbType.String, ObjCaseGenRow.XML_PROCECUTIONDTLS);
                            }
                        }


                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_CHEQUE_RET",
                                   OracleType.Clob, ObjCaseGenRow.XMLCHEQUE_RET_DET.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjCaseGenRow.XMLCHEQUE_RET_DET);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_CHEQUE_RET", DbType.String, ObjCaseGenRow.XMLCHEQUE_RET_DET);
                        }

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_ROP_FileUpload",
                                   OracleType.Clob, ObjCaseGenRow.Xml_ROP_FileUpload.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjCaseGenRow.Xml_ROP_FileUpload);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_ROP_FileUpload", DbType.String, ObjCaseGenRow.Xml_ROP_FileUpload);
                        }

                        //ROP Details Start
                        if (!ObjCaseGenRow.IsXml_ROP_DetailsNull())
                        {

                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@Xml_ROP_DETAILS",
                                       OracleType.Clob, ObjCaseGenRow.Xml_ROP_Details.Length,
                                       ParameterDirection.Input, true, 0, 0, String.Empty,
                                       DataRowVersion.Default, ObjCaseGenRow.Xml_ROP_Details);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@Xml_ROP_DETAILS", DbType.String, ObjCaseGenRow.Xml_ROP_Details);
                            }
                        }
                        //ROP Details End

                        //if (!ObjCaseGenRow.IsCASE_AMTNull())
                        //    db.AddInParameter(command, "@Case_Amt", DbType.Decimal, ObjCaseGenRow.CASE_AMT);

                        //if (!ObjCaseGenRow.IsCLAIM_AMTNull())
                        //    db.AddInParameter(command, "@Claim_Amt", DbType.Decimal, ObjCaseGenRow.CLAIM_AMT);

                        if (!ObjCaseGenRow.IsAUTH_SIGNNull())
                            db.AddInParameter(command, "@Auth_Sign", DbType.String, ObjCaseGenRow.AUTH_SIGN);

                        //if (!ObjCaseGenRow.IsADD_CASE_ORDER_AMTNull())
                        //    db.AddInParameter(command, "@ADD_CASE_ORDER_AMT", DbType.String, ObjCaseGenRow.ADD_CASE_ORDER_AMT);

                        if (!ObjCaseGenRow.IsROP_CASE_TYPENull())
                            db.AddInParameter(command, "@Rop_Case_Type", DbType.Int32, ObjCaseGenRow.ROP_CASE_TYPE);

                        db.AddInParameter(command, "@Case_Filing_Type", DbType.Int32, ObjCaseGenRow.CASE_FILING_TYPE);

                        if (!ObjCaseGenRow.IsCASE_AMTNull())
                        {
                            db.AddInParameter(command, "@Case_Amt", DbType.Decimal, ObjCaseGenRow.CASE_AMT);
                        }
                        if (!ObjCaseGenRow.IsCase_Filed_AgainstNull())
                        {
                            db.AddInParameter(command, "@Case_Filed_Against", DbType.String, ObjCaseGenRow.Case_Filed_Against);
                        }
                        if (!ObjCaseGenRow.IsADD_CASE_ORDER_AMTNull())
                        {
                            db.AddInParameter(command, "@ADD_CASE_ORDER_AMT", DbType.Decimal, ObjCaseGenRow.ADD_CASE_ORDER_AMT);
                        }

                        db.AddInParameter(command, "@LAWYER_TYPE", DbType.Int32, ObjCaseGenRow.LAWYER_TYPE);

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DOCNO", DbType.String, 100);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if ((int)command.Parameters["@ErrorCode"].Value > 1)
                                {
                                    throw new Exception("Error in Case Generation " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    strErrMsg = Convert.ToString(command.Parameters["@DOCNO"].Value);
                                    trans.Commit();
                                }
                                command.Parameters.Clear();
                            }
                            catch (Exception ex)
                            {
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                strErrMsg = ex.ToString();
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
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
                    intRowsAffected = 20; ;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }

            #endregion

            #region LABOUR CASE FILING
            public int FunPubInsertUpdLaborCaseFiiling(SerializationMode SerMode, byte[] bytesCaseGen_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {
                    ObjS3G_CASEGEN = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable)ClsPubSerialize.DeSerialize(bytesCaseGen_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INS_LAB_CASEGENERATION");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASEGENERATIONRow ObjCaseGenRow in ObjS3G_CASEGEN)
                    {
                        db.AddInParameter(command, "@CASEGENERATION", DbType.Int32, ObjCaseGenRow.CASE_ID);
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCaseGenRow.COMPANY_ID);


                        if (!ObjCaseGenRow.IsPANUMNull())
                            db.AddInParameter(command, "@PANUM", DbType.String, ObjCaseGenRow.PANUM);
                        if (!ObjCaseGenRow.IsSANUMNull())
                            db.AddInParameter(command, "@SANUM", DbType.String, ObjCaseGenRow.SANUM);
                        db.AddInParameter(command, "@CUSTOMER_ID", DbType.Int32, ObjCaseGenRow.CUSTOMER_ID);

                        if (!ObjCaseGenRow.IsROP_IDNull())
                            db.AddInParameter(command, "@FIRLOCATION", DbType.String, ObjCaseGenRow.ROP_ID);
                        if (!ObjCaseGenRow.IsFIR_DATENull())
                            db.AddInParameter(command, "@FIRDATE", DbType.String, ObjCaseGenRow.FIR_DATE);
                        if (!ObjCaseGenRow.IsFIR_STATUSNull())
                            db.AddInParameter(command, "@FIRSTATUS", DbType.Int32, ObjCaseGenRow.FIR_STATUS);
                        if (!ObjCaseGenRow.IsFIR_COSTNull())
                            db.AddInParameter(command, "@FIRCOST", DbType.Decimal, ObjCaseGenRow.FIR_COST);
                        if (!ObjCaseGenRow.IsFIR_STATEMENTNull())
                            db.AddInParameter(command, "@FIRSTATEMENT", DbType.String, ObjCaseGenRow.FIR_STATEMENT);
                        if (!ObjCaseGenRow.IsFIR_REMARKSNull())
                            db.AddInParameter(command, "@FIRREMARKS", DbType.String, ObjCaseGenRow.FIR_REMARKS);
                        if (!ObjCaseGenRow.IsFIR_CLOSED_DATENull())
                            db.AddInParameter(command, "@FIR_CLOSED_DATE", DbType.String, ObjCaseGenRow.FIR_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsFIR_NUMBERNull())
                            db.AddInParameter(command, "@FIRNUMBER", DbType.String, ObjCaseGenRow.FIR_NUMBER);
                        if (!ObjCaseGenRow.IsCOURT_IDNull())
                            db.AddInParameter(command, "@COURT_ID", DbType.Int32, ObjCaseGenRow.COURT_ID);
                        if (!ObjCaseGenRow.IsCASE_FILED_DATENull())
                            db.AddInParameter(command, "@CASE_FILED_DATE", DbType.String, ObjCaseGenRow.CASE_FILED_DATE);
                        if (!ObjCaseGenRow.IsCASE_NUMBERNull())
                            db.AddInParameter(command, "@COURT_CASE_NO", DbType.String, ObjCaseGenRow.CASE_NUMBER);
                        if (!ObjCaseGenRow.IsCASE_CHARGES_AMTNull())
                            db.AddInParameter(command, "@CASE_CHARGE_AMT", DbType.Decimal, ObjCaseGenRow.CASE_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_STATUSNull())
                            db.AddInParameter(command, "@CASE_STATUS", DbType.Int32, ObjCaseGenRow.CASE_STATUS);
                        if (!ObjCaseGenRow.IsADDL_CHARGES_AMTNull())
                            db.AddInParameter(command, "@ADDL_CHARGES", DbType.Decimal, ObjCaseGenRow.ADDL_CHARGES_AMT);
                        if (!ObjCaseGenRow.IsCASE_CLOSED_DATENull())
                            db.AddInParameter(command, "@CASE_CLOSED_DATE", DbType.String, ObjCaseGenRow.CASE_CLOSED_DATE);
                        if (!ObjCaseGenRow.IsADVOCATE_IDNull())
                            db.AddInParameter(command, "@ADVOCATE_ID", DbType.Int32, ObjCaseGenRow.ADVOCATE_ID);
                        if (!ObjCaseGenRow.IsCASE_VERDICT_STATEMENTNull())
                            db.AddInParameter(command, "@VERDICT_STATEMENT", DbType.String, ObjCaseGenRow.CASE_VERDICT_STATEMENT);
                        if (!ObjCaseGenRow.IsUSER_IDNull())
                            db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjCaseGenRow.USER_ID);
                        if (!ObjCaseGenRow.IsXML_SUMMONDTLSNull())
                            db.AddInParameter(command, "@XML_SUMMONDTL", DbType.String, ObjCaseGenRow.XML_SUMMONDTLS);
                        if (!ObjCaseGenRow.IsXML_PROCECUTIONDTLSNull())
                            db.AddInParameter(command, "@XML_PROSECUTIONDTL", DbType.String, ObjCaseGenRow.XML_PROCECUTIONDTLS);
                        // Added By R. Manikandan as  per Request given by Bashyam Sir 
                        if (!ObjCaseGenRow.IsROP_CLN_DATENull())
                            db.AddInParameter(command, "@ROP_CLN_DATE", DbType.String, ObjCaseGenRow.ROP_CLN_DATE);
                        if (!ObjCaseGenRow.IsWITHDRAW_REASONNull())
                            db.AddInParameter(command, "@WITHDRAW_REASON", DbType.String, ObjCaseGenRow.WITHDRAW_REASON);
                        if (!ObjCaseGenRow.IsVERDICT_NONull())
                            db.AddInParameter(command, "@VERDICT_NO", DbType.String, ObjCaseGenRow.VERDICT_NO);
                        if (!ObjCaseGenRow.IsVERDICT_DATENull())
                            db.AddInParameter(command, "@VERDICT_DATE", DbType.String, ObjCaseGenRow.VERDICT_DATE);
                        if (!ObjCaseGenRow.IsCOURT_ORD_RECEIPT_DATENull())
                            db.AddInParameter(command, "@COURT_ORD_RCT_DATE", DbType.String, ObjCaseGenRow.COURT_ORD_RECEIPT_DATE);
                        if (!ObjCaseGenRow.IsVERDICT_AMTNull())
                            db.AddInParameter(command, "@VERDICT_AMT", DbType.Decimal, ObjCaseGenRow.VERDICT_AMT);
                        if (!ObjCaseGenRow.IsEXEC_LETTER_DATENull())
                            db.AddInParameter(command, "@EXEC_LETTER_DATE", DbType.String, ObjCaseGenRow.EXEC_LETTER_DATE);
                        if (!ObjCaseGenRow.IsMORT_DATENull())
                            db.AddInParameter(command, "@MORT_DATE", DbType.String, ObjCaseGenRow.MORT_DATE);
                        if (!ObjCaseGenRow.IsREPOSSESSION_DATENull())
                            db.AddInParameter(command, "@REPOSSESSION_DATE", DbType.String, ObjCaseGenRow.REPOSSESSION_DATE);
                        // Added End
                        if (!ObjCaseGenRow.IsLAWYER_EFF_DATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_DATE);
                        if (!ObjCaseGenRow.IsLAWYER_EFF_TODATENull())
                            db.AddInParameter(command, "@LAWYER_EFF_TO_DATE", DbType.String, ObjCaseGenRow.LAWYER_EFF_TODATE);
                        if (!ObjCaseGenRow.IsCASE_AMTNull())
                            db.AddInParameter(command, "@Case_Amt", DbType.Decimal, ObjCaseGenRow.CASE_AMT);

                        if (!ObjCaseGenRow.IsCLAIM_AMTNull())
                            db.AddInParameter(command, "@Claim_Amt", DbType.Decimal, ObjCaseGenRow.CLAIM_AMT);

                        if (!ObjCaseGenRow.IsADD_CASE_ORDER_AMTNull())
                            db.AddInParameter(command, "@ADD_CASE_ORDER_AMT", DbType.String, ObjCaseGenRow.ADD_CASE_ORDER_AMT);

                        if (!ObjCaseGenRow.IsROP_CASE_TYPENull())
                            db.AddInParameter(command, "@Rop_Case_Type", DbType.Int32, ObjCaseGenRow.ROP_CASE_TYPE);

                        if (!ObjCaseGenRow.IsLAWYER_FEENull())
                            db.AddInParameter(command, "@LAWYER_FEE", DbType.Int32, ObjCaseGenRow.LAWYER_FEE);

                        db.AddInParameter(command, "@Case_Filing_Type", DbType.Int32, ObjCaseGenRow.CASE_FILING_TYPE);

                        if (!ObjCaseGenRow.IsLABOUR_IDNull())
                            db.AddInParameter(command, "@Labour_ID", DbType.Int32, ObjCaseGenRow.LABOUR_ID);

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DOCNO", DbType.String, 100);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                if ((int)command.Parameters["@ErrorCode"].Value > 1)
                                {
                                    throw new Exception("Error in Case Generation " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    strErrMsg = Convert.ToString(command.Parameters["@DOCNO"].Value);
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
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
                    intRowsAffected = 20; ;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
            #endregion

            #region ROP CASE CANCELLATION

            public int FunPubCreateCaseCancellation(SerializationMode SerMode, byte[] bytesCaseCancel_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {
                    ObjS3G_CASE_CANCEL = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASE_CANCELDataTable)ClsPubSerialize.DeSerialize(bytesCaseCancel_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASE_CANCELDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INS_CASE_CANCELLATION");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_CASE_CANCELRow ObjCaseCancelRow in ObjS3G_CASE_CANCEL)
                    {
                        db.AddInParameter(command, "@CASE_CANCEL_ID", DbType.Int32, ObjCaseCancelRow.CASE_CANCEL_ID);
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCaseCancelRow.COMPANY_ID);

                        if (!ObjCaseCancelRow.IsCASE_IDNull())
                            db.AddInParameter(command, "@CASE_ID", DbType.Int32, ObjCaseCancelRow.CASE_ID);
                        if (!ObjCaseCancelRow.IsCASE_CANCEL_DATENull())
                            db.AddInParameter(command, "@CASE_CANCEL_DATE", DbType.String, ObjCaseCancelRow.CASE_CANCEL_DATE);
                        if (!ObjCaseCancelRow.IsROP_WITHDRAW_DATENull())
                            db.AddInParameter(command, "@ROP_WITHDRAW_DATE", DbType.String, ObjCaseCancelRow.ROP_WITHDRAW_DATE);
                        if (!ObjCaseCancelRow.IsROP_WITHDRAW_REMARKSNull())
                            db.AddInParameter(command, "@ROP_WITHDRAW_REMARKS", DbType.String, ObjCaseCancelRow.ROP_WITHDRAW_REMARKS);
                        if (!ObjCaseCancelRow.IsMANAGE_COMMENTSNull())
                            db.AddInParameter(command, "@MANAGE_REMARKS", DbType.String, ObjCaseCancelRow.MANAGE_COMMENTS);
                        if (!ObjCaseCancelRow.IsCASE_CANCEL_STATUSNull())
                            db.AddInParameter(command, "@CANCEL_STATUS", DbType.Int32, ObjCaseCancelRow.CASE_CANCEL_STATUS);
                        if (!ObjCaseCancelRow.IsCREATED_BYNull())
                            db.AddInParameter(command, "@USER_ID", DbType.Int32, ObjCaseCancelRow.CREATED_BY);

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@DOCNO", DbType.String, 100);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                if ((int)command.Parameters["@ErrorCode"].Value > 1)
                                {
                                    throw new Exception("Error in Case Generation " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    strErrMsg = Convert.ToString(command.Parameters["@DOCNO"].Value);
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
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
                    intRowsAffected = 20; ;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }

            #endregion

        }
    }
}