using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using S3GBusEntity;
using System.Data.OracleClient;
using Entity_LoanAdmin = S3GBusEntity.LoanAdmin;
namespace S3GDALayer.Collection
{
    public class Legal
    {
        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
        Database db;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        //S3GBusEntity.Collection.Legal_Module.Lawyer_FollowUp_EntryDataTable ObjFollowUp_EntryDataTable;
        //FA_BusEntity.Legal.Legal_Module.Legal_Lawyer_MappingDataTable objLawyer_MappingDataTable;
        S3GBusEntity.Collection.Legal_Module.NFB_Exposure_EntryDataTable objNFB_Exposure_EntryDataTable;
        //FA_BusEntity.Legal.Legal_Module.FA_ExpensesbookingDataTable objExpensesbookingDataTable;        
        int intRowsAffected;
        public Legal(string strConnectionName)
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            strConnection = strConnectionName;
        }
        //public int FunPubCreateLegalMatrix(SerializationMode SerMode, byte[] bytesLegal_Pay_MatrixDataTable, out string strDocNumber)
        //{
        //    strDocNumber = "";
        //    try
        //    {

        //        FA_BusEntity.Legal.Legal_Module.Legal_Pay_MatrixDataTable ObjLegal_Pay_MatrixDataTable;
        //        ObjLegal_Pay_MatrixDataTable = (FA_BusEntity.Legal.Legal_Module.Legal_Pay_MatrixDataTable)ClsPubSerialize.DeSerialize(bytesLegal_Pay_MatrixDataTable, SerMode, typeof(FA_BusEntity.Legal.Legal_Module.Legal_Pay_MatrixDataTable));
        //        DbCommand command = db.GetStoredProcCommand("FA_INSUPD_LEGAL_MATRIX");
        //        foreach (FA_BusEntity.Legal.Legal_Module.Legal_Pay_MatrixRow ObjRow in ObjLegal_Pay_MatrixDataTable.Rows)
        //        {
        //            db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjRow.Company_Id);
        //            db.AddInParameter(command, "@Lawyer_Code", DbType.String, ObjRow.Lawyer_Code);
        //            db.AddInParameter(command, "@Case_Charge_Type", DbType.Int32, ObjRow.Case_Charge_Type);
        //            db.AddInParameter(command, "@Court_Type", DbType.Int32, ObjRow.Court_Type);
        //            db.AddInParameter(command, "@Min_Amount", DbType.Int64, ObjRow.Min_Amount);
        //            db.AddInParameter(command, "@Max_Amount", DbType.Int64, ObjRow.Max_Amount);
        //            db.AddInParameter(command, "@Effective_Start_Date", DbType.String, ObjRow.Effetive_Start_Date);
        //            db.AddInParameter(command, "@Effective_End_Date", DbType.String, ObjRow.Effetive_End_Date);
        //            db.AddInParameter(command, "@IsActive", DbType.Int32, ObjRow.Active);
        //            db.AddInParameter(command, "@Tran_Id", DbType.Int32, ObjRow.Tran_Id);
        //            db.AddInParameter(command, "@SchemeType", DbType.String, ObjRow.Scheme_Type);
        //            if (enumDBType == S3GDALDBType.ORACLE)
        //            {
        //                OracleParameter param = new OracleParameter("@XML_Lawyer_Slab", OracleType.Clob,
        //                       ObjRow.XML_Lawyer_Slab.Length, ParameterDirection.Input, true,
        //                       0, 0, String.Empty, DataRowVersion.Default, ObjRow.XML_Lawyer_Slab);
        //                command.Parameters.Add(param);

        //                OracleParameter param1 = new OracleParameter("@XML_Matrix_Breakup", OracleType.Clob,
        //                    ObjRow.XML_Matrix_Breakup.Length, ParameterDirection.Input, true,
        //                  0, 0, String.Empty, DataRowVersion.Default, ObjRow.XML_Matrix_Breakup);
        //                command.Parameters.Add(param1);

        //                if (!ObjRow.IsXML_OTH_Matrix_BreakupNull())
        //                {
        //                    OracleParameter param2 = new OracleParameter("@XML_OTH_Matrix_Breakup", OracleType.Clob,
        //                           ObjRow.XML_OTH_Matrix_Breakup.Length, ParameterDirection.Input, true,
        //                           0, 0, String.Empty, DataRowVersion.Default, ObjRow.XML_OTH_Matrix_Breakup);
        //                    command.Parameters.Add(param2);
        //                }

        //            }

        //            else
        //            {
        //                db.AddInParameter(command, "@XML_Lawyer_Slab", DbType.String, ObjRow.XML_Lawyer_Slab);
        //                db.AddInParameter(command, "@XML_Matrix_Breakup", DbType.String, ObjRow.XML_Matrix_Breakup);
        //                db.AddInParameter(command, "@XML_OTH_Matrix_Breakup", DbType.String, ObjRow.XML_OTH_Matrix_Breakup);
        //            }
        //            db.AddInParameter(command, "@Created_By", DbType.Int32, ObjRow.Created_By);
        //            db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjRow.Created_By);
        //            db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
        //            db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

        //            using (DbConnection conn = db.CreateConnection())
        //            {
        //                conn.Open();
        //                DbTransaction trans = conn.BeginTransaction();
        //                try
        //                {
        //                    db.FunPubExecuteNonQuery(command, ref trans);
        //                    strDocNumber = (string)command.Parameters["@OutDocNo"].Value;
        //                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
        //                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
        //                    if (intRowsAffected == 0)
        //                        trans.Commit();
        //                    else
        //                        trans.Rollback();

        //                }
        //                catch (Exception ex)
        //                {
        //                    intRowsAffected = 20;
        //                    trans.Rollback();
        //                    ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);

        //                }
        //                conn.Close();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        intRowsAffected = 20;
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //    }
        //    return intRowsAffected;
        //}
        //public int FunPubInsertFollowupEntry(SerializationMode SerMode, byte[] bytesobjFollowupEntry, string strConnectionName, out string strDocNo)
        //{
        //    strDocNo = "";
        //    try
        //    {
        //        ObjFollowUp_EntryDataTable = (FA_BusEntity.Legal.Legal_Module.Lawyer_FollowUp_EntryDataTable)ClsPubSerialize.DeSerialize(bytesobjFollowupEntry, SerMode, typeof(FA_BusEntity.Legal.Legal_Module.Lawyer_FollowUp_EntryDataTable));
        //        DbCommand command = null;
        //        foreach (FA_BusEntity.Legal.Legal_Module.Lawyer_FollowUp_EntryRow objLawyer_FollowUp_EntryRow in ObjFollowUp_EntryDataTable.Rows)
        //        {
        //            command = db.GetStoredProcCommand("FA_INSUPD_LEGAL_FOLLOUP_ENTRY");
        //            db.AddInParameter(command, "@Company_ID", DbType.Int32, objLawyer_FollowUp_EntryRow.Company_Id);
        //            db.AddInParameter(command, "@Created_By", DbType.Int32, objLawyer_FollowUp_EntryRow.Created_By);
        //            if (objLawyer_FollowUp_EntryRow.Legal_Document_Id > 0)
        //            {
        //                db.AddInParameter(command, "@Legal_Document_Id", DbType.Int64, objLawyer_FollowUp_EntryRow.Legal_Document_Id);
        //            }
        //            db.AddInParameter(command, "@Lawyer_Code", DbType.String, objLawyer_FollowUp_EntryRow.Lawyer_Code);
        //            if(!objLawyer_FollowUp_EntryRow.IsCustomer_CodeNull())
        //            db.AddInParameter(command, "@Customer_Code", DbType.String, objLawyer_FollowUp_EntryRow.Customer_Code);
        //            if (!objLawyer_FollowUp_EntryRow.IsCase_NoNull())
        //            db.AddInParameter(command, "@Case_No", DbType.String, objLawyer_FollowUp_EntryRow.Case_No);
        //            if(!objLawyer_FollowUp_EntryRow.IsLegal_Document_NoNull())
        //            {
        //                db.AddInParameter(command, "@Document_No", DbType.String, objLawyer_FollowUp_EntryRow.Legal_Document_No);
        //            }
        //            db.AddInParameter(command, "@Scheme_Type", DbType.String, objLawyer_FollowUp_EntryRow.Scheme_Type);
        //            db.AddInParameter(command, "@Auth_Status", DbType.Int32, objLawyer_FollowUp_EntryRow.Auth_Status);
        //            db.AddInParameter(command, "@Invoice_No", DbType.String, objLawyer_FollowUp_EntryRow.Invoice_Number);
        //            db.AddInParameter(command, "@Invoice_Date", DbType.String, objLawyer_FollowUp_EntryRow.Invoice_Date);
        //            db.AddInParameter(command, "@Invoice_Amount", DbType.Decimal, objLawyer_FollowUp_EntryRow.Invoice_Amount);
        //            if (!objLawyer_FollowUp_EntryRow.IsInvoice_Amount_OthersNull())
        //            {
        //                db.AddInParameter(command, "@Invoice_OTH_Amount", DbType.Decimal, objLawyer_FollowUp_EntryRow.Invoice_Amount_Others);
        //            }
        //            if (enumDBType == FADALDBType.ORACLE)
        //            {
        //                OracleParameter param = new OracleParameter("@XMLCaseDetails", OracleType.Clob,
        //                            objLawyer_FollowUp_EntryRow.XML_Case_Details.Length, ParameterDirection.Input, true,
        //                            0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_Case_Details);
        //                command.Parameters.Add(param);
        //            }
        //            else
        //            {
        //                db.AddInParameter(command, "@XMLCaseDetails", DbType.String, objLawyer_FollowUp_EntryRow.XML_Case_Details);
        //            }
        //            if (enumDBType == FADALDBType.ORACLE)
        //            {
        //                OracleParameter param = new OracleParameter("@XML_Invoice_Doc_Dtls", OracleType.Clob,
        //                            objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls.Length, ParameterDirection.Input, true,
        //                            0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls);
        //                command.Parameters.Add(param);
        //            }
        //            else
        //            {
        //                db.AddInParameter(command, "@XML_Invoice_Doc_Dtls", DbType.String, objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls);
        //            }
        //            if (!objLawyer_FollowUp_EntryRow.IsXML_OtherExpenseDetailsNull())
        //            {
        //                if (enumDBType == FADALDBType.ORACLE)
        //                {
        //                    OracleParameter param = new OracleParameter("@XMLOtherExpenseDetails", OracleType.Clob,
        //                                objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails.Length, ParameterDirection.Input, true,
        //                                0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails);
        //                    command.Parameters.Add(param);
        //                }
        //                else
        //                {
        //                    db.AddInParameter(command, "@XMLOtherExpenseDetails", DbType.String, objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails);
        //                }
        //            }
                    
        //            db.AddOutParameter(command, "@OutDocNo", DbType.String, 200);
        //            db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));


        //            using (DbConnection conn = db.CreateConnection())
        //            {
        //                conn.Open();
        //                DbTransaction trans = conn.BeginTransaction();
        //                try
        //                {
        //                    db.FunPubExecuteNonQuery(command, ref trans);
        //                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
        //                    {
        //                        int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
        //                        throw new Exception("Error thrown Error No" + int_OutResult.ToString());
        //                    }
        //                    else
        //                    {
        //                        trans.Commit();
        //                        strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                    trans.Rollback();
        //                    int_OutResult = 50;
        //                }
        //                finally
        //                { conn.Close(); }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //        int_OutResult = 50;
        //    }
        //    return int_OutResult;
        //}
      
        //public int FunPubInsertExpensesbook(SerializationMode SerMode, byte[] bytesobjexpensebookDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        //{
        //    strDocNo = "";
        //    try
        //    {
        //        intHT_ID = intErrorCode = 0;
        //        objExpensesbookingDataTable = (FA_BusEntity.Legal.Legal_Module.FA_ExpensesbookingDataTable)ClsPubSerialize.DeSerialize(bytesobjexpensebookDataTable, SerMode, typeof(FA_BusEntity.Legal.Legal_Module.FA_ExpensesbookingDataTable));
        //        DbCommand command = null;

        //        foreach (FA_BusEntity.Legal.Legal_Module.FA_ExpensesbookingRow objexpensebookrow in objExpensesbookingDataTable.Rows)
        //        {
        //            command = db.GetStoredProcCommand("FA_INS_EXP_Trans");

        //            db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objexpensebookrow.Company_id);
        //            db.AddInParameter(command, "@EXP_TRAN_ID", DbType.Int32, objexpensebookrow.Tran_ID);
        //            db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, objexpensebookrow.Location_id);
        //            db.AddInParameter(command, "@DOCNO", DbType.String, objexpensebookrow.Doc_no);
        //            db.AddInParameter(command, "@DOCDT", DbType.String, objexpensebookrow.Doc_Date);
        //            db.AddInParameter(command, "@ENTITY_ID", DbType.Int32, objexpensebookrow.Entity_ID);
        //            db.AddInParameter(command, "@ENTITY_CODE", DbType.String, objexpensebookrow.Entity_code);
        //            db.AddInParameter(command, "@EXP_BK_DT", DbType.String, objexpensebookrow.expbookdt);
        //            db.AddInParameter(command, "@DOC_STAT", DbType.String, objexpensebookrow.status);
        //            db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objexpensebookrow.created_by);
        //            db.AddInParameter(command, "@INV_NO", DbType.String, objexpensebookrow.inv_no);
        //            db.AddInParameter(command, "@INV_DT", DbType.String, objexpensebookrow.inv_dt);
        //            db.AddInParameter(command, "@INV_AMT", DbType.String, objexpensebookrow.Invoice_Amt);
        //            db.AddInParameter(command, "@Is_lpo", DbType.Int32, objexpensebookrow.is_lpo);
        //            db.AddInParameter(command, "@Remarks", DbType.String, objexpensebookrow.descr);
        //            db.AddInParameter(command, "@XMLEXPDTLS", DbType.String, objexpensebookrow.XMLExpDtls);
        //            db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
        //            db.AddOutParameter(command, "@OUTHT_ID", DbType.Int32, sizeof(Int32));
        //            db.AddOutParameter(command, "@OUTRESULT", DbType.Int32, sizeof(Int32));
        //            db.AddOutParameter(command, "@OUTDOCNO", DbType.String, 100);
        //            using (DbConnection conn = db.CreateConnection())
        //            {
        //                conn.Open();
        //                DbTransaction trans = conn.BeginTransaction();
        //                try
        //                {
        //                    db.FunPubExecuteNonQuery(command, ref trans);
        //                    if ((int)command.Parameters["@ERRORCODE"].Value > 0)
        //                    {
        //                        int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
        //                        throw new Exception("Error thrown Error No" + int_OutResult.ToString());
        //                    }
        //                    else
        //                    {

        //                        if ((int)command.Parameters["@OUTRESULT"].Value > 0)
        //                            int_OutResult = Convert.ToInt32(command.Parameters["@OUTRESULT"].Value);
        //                        intHT_ID = Convert.ToInt32(command.Parameters["@OUTHT_ID"].Value);
        //                        strDocNo = Convert.ToString(command.Parameters["@OUTDOCNO"].Value);
        //                        trans.Commit();
        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    ClsPubCommErrorLog.CustomErrorRoutine(ex);
        //                    trans.Rollback();
        //                }
        //                finally
        //                { conn.Close(); }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex);
        //        throw ex;
        //    }
        //    return int_OutResult;
        //}
        //public int FunPubInsertLawyerMapping(SerializationMode SerMode, byte[] bytesobjLawyerMapping, string strConnectionName, out string strDNCOut)
        //{            
        //    try
        //    {
        //        objLawyer_MappingDataTable = (FA_BusEntity.Legal.Legal_Module.Legal_Lawyer_MappingDataTable)ClsPubSerialize.DeSerialize(bytesobjLawyerMapping, SerMode, typeof(FA_BusEntity.Legal.Legal_Module.Legal_Lawyer_MappingDataTable));
        //        DbCommand command = null;
        //        strDNCOut = "";
        //        foreach (FA_BusEntity.Legal.Legal_Module.Legal_Lawyer_MappingRow objLawyer_MappingRow in objLawyer_MappingDataTable.Rows)
        //        {
        //            command = db.GetStoredProcCommand("S3G_LEGAL_INS_LAWYER_MAP");
        //            db.AddInParameter(command, "@LAWYER_MAPPING_HDR_ID", DbType.Int32, objLawyer_MappingRow.LAWYER_MAPPING_HDR_ID);
        //            db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objLawyer_MappingRow.Company_Id);
        //            db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objLawyer_MappingRow.Created_By);
        //            db.AddInParameter(command, "@LAWYER_CODE", DbType.String, objLawyer_MappingRow.Lawyer_Code);
        //            db.AddInParameter(command, "@FROM_LAWYER_CODE", DbType.String, objLawyer_MappingRow.From_Lawyer_Code);
        //            db.AddInParameter(command, "@CASE_TYPE_ID", DbType.Int32, objLawyer_MappingRow.Case_Type_ID);
        //            db.AddInParameter(command, "@SCHEME_TYPE", DbType.String, objLawyer_MappingRow.Scheme_Type);
        //            db.AddInParameter(command, "@Start_DATE", DbType.String, objLawyer_MappingRow.Start_Date);
        //            db.AddInParameter(command, "@End_DATE", DbType.String, objLawyer_MappingRow.End_Date);
        //            db.AddInParameter(command, "@IS_ACTIVE", DbType.Int32, objLawyer_MappingRow.Is_Active);                   
        //            if (enumDBType == FADALDBType.ORACLE)
        //            {
        //                OracleParameter param = new OracleParameter("@XML_CASEDTL", OracleType.Clob,
        //                            objLawyer_MappingRow.XML_CaseDtl.Length, ParameterDirection.Input, true,
        //                            0, 0, String.Empty, DataRowVersion.Default, objLawyer_MappingRow.XML_CaseDtl);
        //                command.Parameters.Add(param);


        //                if (!objLawyer_MappingRow.IsXML_Case_Account_DtlNull())
        //                {
        //                    OracleParameter param1 = new OracleParameter("@XML_CASE_Account", OracleType.Clob,
        //                               objLawyer_MappingRow.XML_Case_Account_Dtl.Length, ParameterDirection.Input, true,
        //                               0, 0, String.Empty, DataRowVersion.Default, objLawyer_MappingRow.XML_Case_Account_Dtl);
        //                    command.Parameters.Add(param1);
        //                }
        //            }
        //            else
        //            {
        //                db.AddInParameter(command, "@XML_CASEDTL", DbType.String, objLawyer_MappingRow.XML_CaseDtl);
        //                if (!objLawyer_MappingRow.IsXML_Case_Account_DtlNull())
        //                {
        //                    db.AddInParameter(command, "@XML_CASE_Account", DbType.String, objLawyer_MappingRow.XML_Case_Account_Dtl);
        //                }
        //            }                                      
        //            db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int32));
        //            db.AddOutParameter(command, "@DNC", DbType.String, 200);


        //            using (DbConnection conn = db.CreateConnection())
        //            {
        //                conn.Open();
        //                DbTransaction trans = conn.BeginTransaction();
        //                try
        //                {
        //                    db.FunPubExecuteNonQuery(command, ref trans);
        //                    if ((int)command.Parameters["@ERRORCODE"].Value > 0)
        //                    {
        //                        int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
                                
        //                    }
        //                    else
        //                    {
        //                        trans.Commit();
        //                        int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
        //                        strDNCOut = (string)command.Parameters["@DNC"].Value;
                                
        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                    trans.Rollback();
        //                    int_OutResult = 50;
        //                }
        //                finally
        //                { conn.Close(); }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //        int_OutResult = 50;
        //    }
        //    return int_OutResult;
        //}

        public int FunPubInsertNFBExposureEntry(SerializationMode SerMode, byte[] bytesobjNFBExposureEntry, string strConnectionName, out string strDNCOut)
        {
            try
            {
                strDNCOut = "";
                objNFB_Exposure_EntryDataTable = (S3GBusEntity.Collection.Legal_Module.NFB_Exposure_EntryDataTable)ClsPubSerialize.DeSerialize(bytesobjNFBExposureEntry, SerMode, typeof(S3GBusEntity.Collection.Legal_Module.NFB_Exposure_EntryDataTable));
                DbCommand command = null;
                foreach (S3GBusEntity.Collection.Legal_Module.NFB_Exposure_EntryRow objNFB_Exposure_EntryRow in objNFB_Exposure_EntryDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("S3G_INS_NFBExposureENTRY");
                    db.AddInParameter(command, "@NONFUNGTEE_DTL_ID", DbType.Int32, objNFB_Exposure_EntryRow.NONFUNGTEE_DTL_ID);
                    db.AddInParameter(command, "@Product_ID", DbType.Int32, objNFB_Exposure_EntryRow.Product_ID);
                    db.AddInParameter(command, "@Bank_ID", DbType.Int32, objNFB_Exposure_EntryRow.Bank_ID);
                    db.AddInParameter(command, "@Guarantee_No", DbType.String, objNFB_Exposure_EntryRow.Guarantee_No);
                    db.AddInParameter(command, "@Customer_ID", DbType.Int32, objNFB_Exposure_EntryRow.Customer_ID);
                    db.AddInParameter(command, "@Customer_Code", DbType.String, objNFB_Exposure_EntryRow.Customer_Code);
                    db.AddInParameter(command, "@Guarantee_ID", DbType.Int32, objNFB_Exposure_EntryRow.Guarantee_ID);
                    db.AddInParameter(command, "@Guarantee_Code", DbType.String, objNFB_Exposure_EntryRow.Guarantee_Code);
                    db.AddInParameter(command, "@Guarantee_Type", DbType.Int32, objNFB_Exposure_EntryRow.Guarantee_Type);
                    db.AddInParameter(command, "@Application_Date", DbType.DateTime, objNFB_Exposure_EntryRow.Application_Date);
                    if (!objNFB_Exposure_EntryRow.IsIssue_DateNull())
                    {
                        db.AddInParameter(command, "@Issue_Date", DbType.DateTime, objNFB_Exposure_EntryRow.Issue_Date);
                    }
                    db.AddInParameter(command, "@Expiry_Month", DbType.DateTime, objNFB_Exposure_EntryRow.Expiry_Month);
                    db.AddInParameter(command, "@Amount", DbType.Decimal, objNFB_Exposure_EntryRow.Amount);
                    db.AddInParameter(command, "@Sub_Gl_Account", DbType.String, objNFB_Exposure_EntryRow.Sub_Gl_Account);
                    if (!objNFB_Exposure_EntryRow.IsBank_Issue_DateNull())
                    {
                        db.AddInParameter(command, "@Bank_Issue_Date", DbType.String, objNFB_Exposure_EntryRow.Bank_Issue_Date);
                    }
                    db.AddInParameter(command, "@Auto_Renewal", DbType.Int32, objNFB_Exposure_EntryRow.Auto_Renewal);
                    db.AddInParameter(command, "@Status_ID", DbType.Int32, objNFB_Exposure_EntryRow.Status_ID);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, objNFB_Exposure_EntryRow.Created_By);

                    if (!objNFB_Exposure_EntryRow.IsCR_NUMBERNull())
                    {
                        db.AddInParameter(command, "@CRNUMBER", DbType.String, objNFB_Exposure_EntryRow.CR_NUMBER);
                    }
                    if (!objNFB_Exposure_EntryRow.IsCREDIT_PERIODNull())
                    {
                        db.AddInParameter(command, "@CreditPeriod", DbType.Int32, objNFB_Exposure_EntryRow.CREDIT_PERIOD);
                    }
                    if (!objNFB_Exposure_EntryRow.IsLC_TypeNull())
                    {
                        db.AddInParameter(command, "@LCType", DbType.Int32, objNFB_Exposure_EntryRow.LC_Type);
                    }
                    

                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@DOCUMENT_NO", DbType.String, 200);
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 500);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
                                //throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {
                                trans.Commit();
                                int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
                                strDNCOut = (string)command.Parameters["@DOCUMENT_NO"].Value.ToString();
                            }
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                            int_OutResult = 50;
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
                int_OutResult = 50;
            }
            return int_OutResult;
        }
    }
}
