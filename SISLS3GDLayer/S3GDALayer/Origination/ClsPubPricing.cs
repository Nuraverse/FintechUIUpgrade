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

namespace S3GDALayer.Origination
{
    namespace PricingMgtServices
    {
        public class ClsPubPricing
        {
            #region Intialize
            int intRowsAffected;
            S3GBusEntity.Origination.PricingMgtServices.S3G_ORG_PricingDataTable ObjPricing_DAL;
            //S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_AssetMasterDataTable ObjAssetMaster_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubPricing()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            #endregion

            public int FunPubCreatePricingInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Pricing, out string strOfferNumber_Out, out int IntPricing_Id)
            {
                strOfferNumber_Out = string.Empty;
                IntPricing_Id = 0;
                try
                {
                    ObjPricing_DAL = (ORG.PricingMgtServices.S3G_ORG_PricingDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_Pricing, SerMode, typeof(ORG.PricingMgtServices.S3G_ORG_PricingDataTable));
                    foreach (ORG.PricingMgtServices.S3G_ORG_PricingRow ObjPricingRow in ObjPricing_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_OR_INS_PRICGDET");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjPricingRow.Company_ID);
                        if (!ObjPricingRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjPricingRow.Customer_ID);
                        }
                        db.AddInParameter(command, "@Pricing_Id", DbType.Int32, ObjPricingRow.Pricing_ID);
                        db.AddInParameter(command, "@Consitution_ID", DbType.Int32, ObjPricingRow.Constitution_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjPricingRow.Lob_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjPricingRow.Location_ID);
                        if (!ObjPricingRow.IsSub_Location_IdNull())
                        db.AddInParameter(command, "@Sub_Location_Id", DbType.Int32, ObjPricingRow.Sub_Location_Id);
                        db.AddInParameter(command, "@Customer_Type", DbType.Int32, ObjPricingRow.Customer_Type);
                        db.AddInParameter(command, "@Appraisal_Type", DbType.Int32, ObjPricingRow.Appraisal_Type);
                        db.AddInParameter(command, "@Contract_Type", DbType.Int32, ObjPricingRow.Contract_Type);
                        db.AddInParameter(command, "@Deal_Type", DbType.Int32, ObjPricingRow.Deal_Type);
                        db.AddInParameter(command, "@Dealer_Id", DbType.Int32, ObjPricingRow.Dealer_Id);
                        db.AddInParameter(command, "@Dob", DbType.String, ObjPricingRow.Dob);
                        db.AddInParameter(command, "@Offer_Date", DbType.DateTime, ObjPricingRow.Offer_Date);
                        db.AddInParameter(command, "@OFFER_VALID_TILL", DbType.DateTime, ObjPricingRow.Offer_Valid_Till);
                        if(!ObjPricingRow.IsFacility_AmountNull())
                        db.AddInParameter(command, "@FacilityAmount", DbType.Decimal, ObjPricingRow.Facility_Amount);
                        db.AddInParameter(command, "@Tenure", DbType.Int32, ObjPricingRow.Tenure);
                        db.AddInParameter(command, "@Tenure_Type", DbType.String, ObjPricingRow.Tenure_Type);
                        db.AddInParameter(command, "@Dealer_Sales_Person_Id", DbType.Int32, ObjPricingRow.Dealer_Sales_Person_Id);
                        db.AddInParameter(command, "@Sales_Person_Id", DbType.Int32, ObjPricingRow.Sales_Person_Id);
                        db.AddInParameter(command, "@Seller_Name", DbType.String, ObjPricingRow.Seller_Name);
                        db.AddInParameter(command, "@Seller_Code", DbType.String, ObjPricingRow.Seller_Code);
                        db.AddInParameter(command, "@Proposal_Status", DbType.Int32, ObjPricingRow.Proposal_Status);
                        db.AddInParameter(command, "@PDC_Type", DbType.Int32, ObjPricingRow.PDC_Type);
                        if (!ObjPricingRow.IsNo_of_PdcNull())
                        db.AddInParameter(command, "@No_Of_PDC", DbType.Int32, ObjPricingRow.No_of_Pdc);
                        if (!ObjPricingRow.IsPDC_Start_DateNull())
                        db.AddInParameter(command, "@PDC_Start_Date", DbType.DateTime, ObjPricingRow.PDC_Start_Date);
                        db.AddInParameter(command, "@Proposal_Number", DbType.String, ObjPricingRow.Proposal_Number);
                        db.AddInParameter(command, "@Account_Number", DbType.String, ObjPricingRow.Account_Number);
                        db.AddInParameter(command, "@Insurar", DbType.Int32, ObjPricingRow.Insurar_Id);
                        db.AddInParameter(command, "@Insurance_Policy_No", DbType.String, ObjPricingRow.Insurance_Policy_Number);
                        db.AddInParameter(command, "@Insurance_By", DbType.Int32, ObjPricingRow.Insurance_By);
                        db.AddInParameter(command, "@Insurance_Coverage", DbType.Int32, ObjPricingRow.Insurance_Coverage);
                        db.AddInParameter(command, "@Insurance_Remarks", DbType.String, ObjPricingRow.Insurance_Remarks);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjPricingRow.Product_ID);
                        db.AddInParameter(command, "@Is_DMS", DbType.Int32, ObjPricingRow.Is_DMS);
                        db.AddInParameter(command, "@Template_Language", DbType.Int32, ObjPricingRow.Template_Language);

                        if(!ObjPricingRow.IsDealer_Sales_Person_NameNull())
                        db.AddInParameter(command, "@Dealer_Sales_Person_Name", DbType.String, ObjPricingRow.Dealer_Sales_Person_Name);
                        //db.AddInParameter(command, "@General_Remarks", DbType.String, ObjPricingRow.General_Remarks);


                        OracleParameter param4;
                        if (!ObjPricingRow.IsGeneral_RemarksNull())
                        {
                            param4 = new OracleParameter("@General_Remarks",
                                                              OracleType.Clob, ObjPricingRow.General_Remarks.Length,
                                                              ParameterDirection.Input, true, 0, 0, String.Empty,
                                                              DataRowVersion.Default, ObjPricingRow.General_Remarks);
                            command.Parameters.Add(param4);
                        }

                     
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                param = new OracleParameter("@XMLPDC",
                                                                  OracleType.Clob, ObjPricingRow.Xml_Installment_PDC.Length,
                                                                  ParameterDirection.Input, true, 0, 0, String.Empty,
                                                                  DataRowVersion.Default, ObjPricingRow.Xml_Installment_PDC);
                                command.Parameters.Add(param);
                            }

                            if (!ObjPricingRow.IsXML_DOWNPAYMENT_DTLSNull())
                            {
                                param = new OracleParameter("@XML_DOWNPAYMENT_DTLS",
                                                                  OracleType.Clob, ObjPricingRow.XML_DOWNPAYMENT_DTLS.Length,
                                                                  ParameterDirection.Input, true, 0, 0, String.Empty,
                                                                  DataRowVersion.Default, ObjPricingRow.XML_DOWNPAYMENT_DTLS);
                                command.Parameters.Add(param);
                            }


                            if (!ObjPricingRow.IsXMLAssetNull())
                            {
                                param = new OracleParameter("@XMLAsset",
                                    OracleType.Clob, ObjPricingRow.XMLAsset.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XMLAsset);
                                command.Parameters.Add(param);
                            }
                            param = new OracleParameter("@XMLAlerts",
                                OracleType.Clob, ObjPricingRow.XMLAlerts.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjPricingRow.XMLAlerts);
                            command.Parameters.Add(param);
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                param = new OracleParameter("@XML_PDD",
                                    OracleType.Clob, ObjPricingRow.XMLPDD.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XMLPDD);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXmlAdditionalInfoNull())
                            {
                                param = new OracleParameter("@XmlAdditionalInfo",
                                    OracleType.Clob, ObjPricingRow.XmlAdditionalInfo.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XmlAdditionalInfo);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXml_ChekList_FileUploadNull())
                            {
                                param = new OracleParameter("@Xml_ChekList_FileUpload",
                                    OracleType.Clob, ObjPricingRow.Xml_ChekList_FileUpload.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.Xml_ChekList_FileUpload);
                                command.Parameters.Add(param);
                            }

                        }
                        else
                        {
                            if (!ObjPricingRow.IsXMLAssetNull())
                            {
                                db.AddInParameter(command, "@XMLAsset", DbType.String, ObjPricingRow.XMLAsset);
                            }
                            db.AddInParameter(command, "@XMLAlerts", DbType.String, ObjPricingRow.XMLAlerts);
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                db.AddInParameter(command, "@XML_PDD", DbType.String, ObjPricingRow.XMLPDD);
                            }
                            if (!ObjPricingRow.IsXmlAdditionalInfoNull())
                            {
                                db.AddInParameter(command, "@XmlAdditionalInfo", DbType.String, ObjPricingRow.XmlAdditionalInfo);
                            }
                            if (!ObjPricingRow.IsXml_ChekList_FileUploadNull())
                            {
                                db.AddInParameter(command, "@Xml_ChekList_FileUpload", DbType.String, ObjPricingRow.Xml_ChekList_FileUpload);
                            }
                        }

                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjPricingRow.Created_By);
                        db.AddOutParameter(command, "@Offer_No", DbType.String, 100);
                        db.AddOutParameter(command, "@Pricing_Out_Id", DbType.Int32, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                strOfferNumber_Out = (string)command.Parameters["@Offer_No"].Value;
                                IntPricing_Id = (int)command.Parameters["@Pricing_Out_Id"].Value;
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
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
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
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

                }
                return intRowsAffected;
            }

            public int FunPubModifyPricingInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Pricing)
            {

                try
                {
                    ObjPricing_DAL = (ORG.PricingMgtServices.S3G_ORG_PricingDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_Pricing, SerMode, typeof(ORG.PricingMgtServices.S3G_ORG_PricingDataTable));
                    foreach (ORG.PricingMgtServices.S3G_ORG_PricingRow ObjPricingRow in ObjPricing_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_OR_Upd_PricgDet");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjPricingRow.Company_ID);
                        if (!ObjPricingRow.IsCustomer_IDNull())
                        {
                            db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjPricingRow.Customer_ID);
                        }
                        db.AddInParameter(command, "@Consitution_ID", DbType.Int32, ObjPricingRow.Constitution_ID);
                        db.AddInParameter(command, "@Pricing_Id", DbType.Int32, ObjPricingRow.Pricing_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjPricingRow.Lob_ID);
                        if (!ObjPricingRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjPricingRow.Location_ID);
                        if (!ObjPricingRow.IsSub_Location_IdNull())
                        db.AddInParameter(command, "@Sub_Location_Id", DbType.Int32, ObjPricingRow.Sub_Location_Id);
                        db.AddInParameter(command, "@Customer_Type", DbType.Int32, ObjPricingRow.Customer_Type);
                        db.AddInParameter(command, "@Appraisal_Type", DbType.Int32, ObjPricingRow.Appraisal_Type);
                        db.AddInParameter(command, "@Contract_Type", DbType.Int32, ObjPricingRow.Contract_Type);
                        db.AddInParameter(command, "@Deal_Type", DbType.Int32, ObjPricingRow.Deal_Type);
                        db.AddInParameter(command, "@Dealer_Id", DbType.Int32, ObjPricingRow.Dealer_Id);
                        db.AddInParameter(command, "@Dob", DbType.String, ObjPricingRow.Dob);
                        db.AddInParameter(command, "@Offer_Date", DbType.DateTime, ObjPricingRow.Offer_Date);
                        db.AddInParameter(command, "@OFFER_VALID_TILL", DbType.DateTime, ObjPricingRow.Offer_Valid_Till);
                        if (!ObjPricingRow.IsFacility_AmountNull())
                        db.AddInParameter(command, "@FacilityAmount", DbType.Decimal, ObjPricingRow.Facility_Amount);
                        db.AddInParameter(command, "@Tenure", DbType.Int32, ObjPricingRow.Tenure);
                        db.AddInParameter(command, "@Tenure_Type", DbType.String, ObjPricingRow.Tenure_Type);
                        db.AddInParameter(command, "@Dealer_Sales_Person_Id", DbType.Int32, ObjPricingRow.Dealer_Sales_Person_Id);
                        db.AddInParameter(command, "@Sales_Person_Id", DbType.Int32, ObjPricingRow.Sales_Person_Id);
                        db.AddInParameter(command, "@Seller_Name", DbType.String, ObjPricingRow.Seller_Name);
                        db.AddInParameter(command, "@Seller_Code", DbType.String, ObjPricingRow.Seller_Code);
                        db.AddInParameter(command, "@Proposal_Status", DbType.Int32, ObjPricingRow.Proposal_Status);
                        db.AddInParameter(command, "@PDC_Type", DbType.Int32, ObjPricingRow.PDC_Type);
                        if (!ObjPricingRow.IsNo_of_PdcNull())
                        db.AddInParameter(command, "@No_Of_PDC", DbType.Int32, ObjPricingRow.No_of_Pdc);
                        if (!ObjPricingRow.IsPDC_Start_DateNull())
                        db.AddInParameter(command, "@PDC_Start_Date", DbType.DateTime, ObjPricingRow.PDC_Start_Date);
                        db.AddInParameter(command, "@Proposal_Number", DbType.String, ObjPricingRow.Proposal_Number);
                        db.AddInParameter(command, "@Account_Number", DbType.String, ObjPricingRow.Account_Number);
                        db.AddInParameter(command, "@Insurar", DbType.Int32, ObjPricingRow.Insurar_Id);
                        db.AddInParameter(command, "@Insurance_Policy_No", DbType.String, ObjPricingRow.Insurance_Policy_Number);
                        db.AddInParameter(command, "@Insurance_By", DbType.Int32, ObjPricingRow.Insurance_By);
                        db.AddInParameter(command, "@Insurance_Coverage", DbType.Int32, ObjPricingRow.Insurance_Coverage);
                        db.AddInParameter(command, "@Insurance_Remarks", DbType.String, ObjPricingRow.Insurance_Remarks);
                        db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjPricingRow.Product_ID);
                        db.AddInParameter(command, "@Template_Language", DbType.Int32, ObjPricingRow.Template_Language);

                        if (!ObjPricingRow.IsDealer_Sales_Person_NameNull())
                            db.AddInParameter(command, "@Dealer_Sales_Person_Name", DbType.String, ObjPricingRow.Dealer_Sales_Person_Name);
                        //db.AddInParameter(command, "@General_Remarks", DbType.String, ObjPricingRow.General_Remarks);


                        OracleParameter param4;
                        if (!ObjPricingRow.IsGeneral_RemarksNull())
                        {
                            param4 = new OracleParameter("@General_Remarks",
                                                              OracleType.Clob, ObjPricingRow.General_Remarks.Length,
                                                              ParameterDirection.Input, true, 0, 0, String.Empty,
                                                              DataRowVersion.Default, ObjPricingRow.General_Remarks);
                            command.Parameters.Add(param4);
                        }


                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                param = new OracleParameter("@XMLPDC",
                                                                  OracleType.Clob, ObjPricingRow.Xml_Installment_PDC.Length,
                                                                  ParameterDirection.Input, true, 0, 0, String.Empty,
                                                                  DataRowVersion.Default, ObjPricingRow.Xml_Installment_PDC);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXMLAssetNull())
                            {
                                param = new OracleParameter("@XMLAsset",
                                    OracleType.Clob, ObjPricingRow.XMLAsset.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XMLAsset);
                                command.Parameters.Add(param);
                            }
                            param = new OracleParameter("@XMLAlerts",
                                OracleType.Clob, ObjPricingRow.XMLAlerts.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjPricingRow.XMLAlerts);
                            command.Parameters.Add(param);
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                param = new OracleParameter("@XML_PDD",
                                    OracleType.Clob, ObjPricingRow.XMLPDD.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XMLPDD);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXML_DOWNPAYMENT_DTLSNull())
                            {
                                param = new OracleParameter("@XML_DOWNPAYMENT_DTLS",
                                                                  OracleType.Clob, ObjPricingRow.XML_DOWNPAYMENT_DTLS.Length,
                                                                  ParameterDirection.Input, true, 0, 0, String.Empty,
                                                                  DataRowVersion.Default, ObjPricingRow.XML_DOWNPAYMENT_DTLS);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXmlAdditionalInfoNull())
                            {
                                param = new OracleParameter("@XmlAdditionalInfo",
                                    OracleType.Clob, ObjPricingRow.XmlAdditionalInfo.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.XmlAdditionalInfo);
                                command.Parameters.Add(param);
                            }
                            if (!ObjPricingRow.IsXml_ChekList_FileUploadNull())
                            {
                                param = new OracleParameter("@Xml_ChekList_FileUpload",
                                    OracleType.Clob, ObjPricingRow.Xml_ChekList_FileUpload.Length,
                                    ParameterDirection.Input, true, 0, 0, String.Empty,
                                    DataRowVersion.Default, ObjPricingRow.Xml_ChekList_FileUpload);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            if (!ObjPricingRow.IsXMLAssetNull())
                            {
                                db.AddInParameter(command, "@XMLAsset", DbType.String, ObjPricingRow.XMLAsset);
                            }
                            db.AddInParameter(command, "@XMLAlerts", DbType.String, ObjPricingRow.XMLAlerts);
                            if (!ObjPricingRow.IsXMLPDDNull())
                            {
                                db.AddInParameter(command, "@XML_PDD", DbType.String, ObjPricingRow.XMLPDD);
                            }
                            if (!ObjPricingRow.IsXmlAdditionalInfoNull())
                            {
                                db.AddInParameter(command, "@XmlAdditionalInfo", DbType.String, ObjPricingRow.XmlAdditionalInfo);
                            }
                            if (!ObjPricingRow.IsXml_ChekList_FileUploadNull())
                            {
                                db.AddInParameter(command, "@Xml_ChekList_FileUpload", DbType.String, ObjPricingRow.Xml_ChekList_FileUpload);
                            }
                        }

                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjPricingRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
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
                                }
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 50;
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

                }
                return intRowsAffected;
            }

            public DataSet FunPubGetPricingDetails(int intPricingId, int intCompanyId)
            {
                DataSet dsPricingDetails = new DataSet();
                try
                {

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetPricingDetails");
                    db.AddInParameter(command, "@Company_Id", DbType.Int32, intCompanyId);
                    db.AddInParameter(command, "@Pricing_Id", DbType.Int32, intPricingId);
                    dsPricingDetails = db.FunPubExecuteDataSet(command);

                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return dsPricingDetails;
            }

            public int FunPubWithDrawPricingInt(int intPricingId, int intCompanyId, int intCreatedBy)
            {

                try
                {

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");


                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_WithdrawPricing");
                    db.AddInParameter(command, "@Company_Id", DbType.Int32, intCompanyId);
                    db.AddInParameter(command, "@Pricing_Id", DbType.Int32, intPricingId);
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, intCreatedBy);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
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
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intRowsAffected == 0)
                                intRowsAffected = 50;
                            ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                            trans.Rollback();
                        }
                        finally
                        {
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
