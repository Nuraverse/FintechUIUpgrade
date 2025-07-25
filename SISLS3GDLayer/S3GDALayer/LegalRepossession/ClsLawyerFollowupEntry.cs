
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
        public class ClsLawyerFollowupEntry: ClsPubDalLegalRepossessionBase
        {

            int intRowsAffected = 0;
            S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
            S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Lawyer_FollowUp_EntryDataTable objLawyer_FollowUp_EntryDataTable;

            #region Lawyer Followup Entry

            public int FunPubInsertLawyerFollowupEntry(SerializationMode SerMode, byte[] bytesobjLawyerFollowupEntry, out string strDocNo)
            {
                strDocNo = "";
                try
                {
                    objLawyer_FollowUp_EntryDataTable = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Lawyer_FollowUp_EntryDataTable)ClsPubSerialize.DeSerialize(bytesobjLawyerFollowupEntry, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Lawyer_FollowUp_EntryDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INSUPD_LEGAL_FOLLOUP_ENTRY");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Lawyer_FollowUp_EntryRow objLawyer_FollowUp_EntryRow in objLawyer_FollowUp_EntryDataTable)
                    {
                        command = db.GetStoredProcCommand("LR_INSUPD_LEGAL_FOLLOUP_ENTRY");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objLawyer_FollowUp_EntryRow.Company_Id);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objLawyer_FollowUp_EntryRow.Created_By);
                        if (objLawyer_FollowUp_EntryRow.Legal_Document_Id > 0)
                        {
                            db.AddInParameter(command, "@Legal_Document_Id", DbType.Int64, objLawyer_FollowUp_EntryRow.Legal_Document_Id);
                        }
                        db.AddInParameter(command, "@Lawyer_Code", DbType.String, objLawyer_FollowUp_EntryRow.Lawyer_Code);
                        if (!objLawyer_FollowUp_EntryRow.IsCustomer_CodeNull())
                            db.AddInParameter(command, "@Customer_Code", DbType.String, objLawyer_FollowUp_EntryRow.Customer_Code);
                        if (!objLawyer_FollowUp_EntryRow.IsCase_NoNull())
                            db.AddInParameter(command, "@Case_No", DbType.String, objLawyer_FollowUp_EntryRow.Case_No);
                        if (!objLawyer_FollowUp_EntryRow.IsLegal_Document_NoNull())
                        {
                            db.AddInParameter(command, "@Document_No", DbType.String, objLawyer_FollowUp_EntryRow.Legal_Document_No);
                        }
                        db.AddInParameter(command, "@Scheme_Type", DbType.String, objLawyer_FollowUp_EntryRow.Scheme_Type);
                        db.AddInParameter(command, "@Auth_Status", DbType.Int32, objLawyer_FollowUp_EntryRow.Auth_Status);
                        db.AddInParameter(command, "@Invoice_No", DbType.String, objLawyer_FollowUp_EntryRow.Invoice_Number);
                        db.AddInParameter(command, "@Invoice_Date", DbType.String, objLawyer_FollowUp_EntryRow.Invoice_Date);
                        db.AddInParameter(command, "@Invoice_Amount", DbType.Decimal, objLawyer_FollowUp_EntryRow.Invoice_Amount);
                        if (!objLawyer_FollowUp_EntryRow.IsInvoice_Amount_OthersNull())
                        {
                            db.AddInParameter(command, "@Invoice_OTH_Amount", DbType.Decimal, objLawyer_FollowUp_EntryRow.Invoice_Amount_Others);
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XMLCaseDetails", OracleType.Clob,
                                        objLawyer_FollowUp_EntryRow.XML_Case_Details.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_Case_Details);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLCaseDetails", DbType.String, objLawyer_FollowUp_EntryRow.XML_Case_Details);
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Invoice_Doc_Dtls", OracleType.Clob,
                                        objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_Invoice_Doc_Dtls", DbType.String, objLawyer_FollowUp_EntryRow.XML_Invoice_Doc_Dtls);
                        }
                        if (!objLawyer_FollowUp_EntryRow.IsXML_OtherExpenseDetailsNull())
                        {
                            if (enumDBType == S3GDALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter("@XMLOtherExpenseDetails", OracleType.Clob,
                                            objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails.Length, ParameterDirection.Input, true,
                                            0, 0, String.Empty, DataRowVersion.Default, objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, "@XMLOtherExpenseDetails", DbType.String, objLawyer_FollowUp_EntryRow.XML_OtherExpenseDetails);
                            }
                        }

                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 200);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));


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
                                    trans.Commit();
                                    strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
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
                            { conn.Close(); }
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
