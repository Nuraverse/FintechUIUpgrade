#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Entity Master
/// Created By			: Nataraj Y
/// Created Date		: 05-Jun-2010
/// Purpose	            : 
/// <Program Summary>
#endregion

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
using System.IO;
using System.Data;
using S3GBusEntity;
using System.Data.OracleClient;

namespace S3GDALayer.Origination
{
    namespace OrgMasterMgtServices
    {
        public class ClsPubEntityMaster
        {
            #region Intialize
            int intRowsAffected;
            ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable ObjEntityMaster_DAL;
            ORG.OrgMasterMgtServices.S3G_ORG_EntityBankMappingDataTable ObjEntityBankMappingMaster_DAL;


            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubEntityMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }


            #endregion

            #region Creating New Entity
            /// <summary>
            /// To Insert Entity Details
            /// </summary>
            /// <param name="bytesObjS3G_ORG_Entity_MasterDataTable">to get all entity related details</param>
            /// /// <param name="strEntityCode_Out">can be Entity Code</param>
            /// <returns></returns>
            public int FunPubCreateEntityInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Entity_MasterDataTable, out string strEntityCode_Out)
            {
                string strEntityCode = "";
                try
                {

                    ObjEntityMaster_DAL = (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_Entity_MasterDataTable, SerMode, typeof(ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterRow ObjEnitytMasterRow in ObjEntityMaster_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_InsertEntityDetails");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjEnitytMasterRow.Company_Id);
                        db.AddInParameter(command, "@EntityType", DbType.Int32, ObjEnitytMasterRow.Entity_Type);
                        db.AddInParameter(command, "@GLPostingCode", DbType.String, ObjEnitytMasterRow.GL_Code);
                        db.AddInParameter(command, "@Customer_Type_Id", DbType.Int32, ObjEnitytMasterRow.Customer_Type_ID);
                        db.AddInParameter(command, "@Nationality", DbType.Int32, ObjEnitytMasterRow.Nationality);
                        db.AddInParameter(command, "@Constitution_Id", DbType.Int32, ObjEnitytMasterRow.Constitution_ID);
                        db.AddInParameter(command, "@EntityName", DbType.String, ObjEnitytMasterRow.Entity_Name);
                        db.AddInParameter(command, "@Entity_Name1", DbType.String, ObjEnitytMasterRow.Entity_Name1);
                        db.AddInParameter(command, "@Entity_Name2", DbType.String, ObjEnitytMasterRow.Entity_Name2);
                        db.AddInParameter(command, "@Entity_Name3", DbType.String, ObjEnitytMasterRow.Entity_Name3);
                        db.AddInParameter(command, "@Entity_Name4", DbType.String, ObjEnitytMasterRow.Entity_Name4);
                        db.AddInParameter(command, "@Entity_Name5", DbType.String, ObjEnitytMasterRow.Entity_Name5);
                        db.AddInParameter(command, "@Entity_Name6", DbType.String, ObjEnitytMasterRow.Entity_Name6);

                        if (!ObjEnitytMasterRow.IsTax_Account_NumberNull())
                        {
                            db.AddInParameter(command, "@TaxAccountNumber", DbType.String, ObjEnitytMasterRow.Tax_Account_Number);
                        }
                        if (!ObjEnitytMasterRow.IsVAT_NumberNull())
                        {
                            db.AddInParameter(command, "@VAT_Number", DbType.String, ObjEnitytMasterRow.VAT_Number);
                        }
                        if (!ObjEnitytMasterRow.IsROC_NumberNull())
                        {
                            db.AddInParameter(command, "@ROC_Number", DbType.String, ObjEnitytMasterRow.ROC_Number);
                        }
                        if (!ObjEnitytMasterRow.IsIMPEXP_CodeNull())
                        {
                            db.AddInParameter(command, "@IMPEXP_Code", DbType.String, ObjEnitytMasterRow.IMPEXP_Code);
                        }


                        db.AddInParameter(command, "@Cr_Number", DbType.String, ObjEnitytMasterRow.CR_Number);
                        db.AddInParameter(command, "@Service_Branch", DbType.Int32, ObjEnitytMasterRow.Service_Branch);
                        db.AddInParameter(command, "@Credit_Period_Allowed", DbType.Int32, ObjEnitytMasterRow.Credit_Period_Allowed);
                        db.AddInParameter(command, "@Col_Charges_PM", DbType.Decimal, ObjEnitytMasterRow.Col_Charges_PM);
                        db.AddInParameter(command, "@Related_Party_Indi", DbType.Int32, ObjEnitytMasterRow.Related_Party_Indic);

                        //if (!ObjEnitytMasterRow.IsDealer_GroupNull())
                        //{
                        db.AddInParameter(command, "@Dealer_Group", DbType.String, ObjEnitytMasterRow.Dealer_Group);
                        //}
                        db.AddInParameter(command, "@Cust_VAT_TIN", DbType.String, ObjEnitytMasterRow.Cust_VAT_TIN);
                        db.AddInParameter(command, "@Consumer_Dealer", DbType.Int32, ObjEnitytMasterRow.Consumer_Dealer);
                        db.AddInParameter(command, "@Delivery_Location", DbType.Int32, ObjEnitytMasterRow.Delivery_Loc);
                        db.AddInParameter(command, "@Effective_From", DbType.DateTime, ObjEnitytMasterRow.Effective_From);
                        db.AddInParameter(command, "@Effective_To", DbType.DateTime, ObjEnitytMasterRow.Effective_To);

                        if (!ObjEnitytMasterRow.IsEmployee_IDNull())
                        {
                            db.AddInParameter(command, "@Employee_Id", DbType.Int32, ObjEnitytMasterRow.Employee_ID);
                        }
                        if (!ObjEnitytMasterRow.IsEmployee_RatingNull())
                        {
                            db.AddInParameter(command, "@Employee_Rating", DbType.Int32, ObjEnitytMasterRow.Employee_Rating);
                        }
                        db.AddInParameter(command, "@Entity_Abbr", DbType.String, ObjEnitytMasterRow.Entity_Abbr);
                        db.AddInParameter(command, "@Is_Active", DbType.Int32, ObjEnitytMasterRow.Is_Active);
                        //db.AddInParameter(command, "@Branch_Code", DbType.String, ObjEnitytMasterRow.Branch_Code);
                        //db.AddInParameter(command, "@Branch_Name", DbType.String, ObjEnitytMasterRow.Branch_Name);

                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjEnitytMasterRow.Created_By);
                        //Added By Thangam M on 14/Feb/2012 to change the XML to CLOB
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XMLBankDetails",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLBank_Details.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLBank_Details);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLBankDetails", DbType.String, ObjEnitytMasterRow.XMLBank_Details);
                        }
                        //Thangam M on 15/Nov/2012 for Trade Advance
                        db.AddInParameter(command, "@Is_TradeAdvance", DbType.Int32, ObjEnitytMasterRow.Is_TradeAdvance);
                        //End here

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Operation_Hist_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLOperationHistDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLOperationHistDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Operation_Hist_Det", DbType.String, ObjEnitytMasterRow.XMLOperationHistDet);
                        }

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Employee_Hist_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLEmployeeHistDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLEmployeeHistDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Employee_Hist_Det", DbType.String, ObjEnitytMasterRow.XMLEmployeeHistDet);
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Address_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLAddressDetails.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLAddressDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Address_Det", DbType.String, ObjEnitytMasterRow.XMLAddressDetails);
                        }
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Ins_Policy_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLInsurancePolicyDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLInsurancePolicyDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Ins_Policy_Det", DbType.String, ObjEnitytMasterRow.XMLInsurancePolicyDet);
                        }

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Entity_Type_Doc_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLEntityTypeDocDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLEntityTypeDocDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Entity_Type_Doc_Det", DbType.String, ObjEnitytMasterRow.XMLEntityTypeDocDet);
                        }

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_Additional_Param_Det",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLAdditionalParamDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLAdditionalParamDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_Additional_Param_Det", DbType.String, ObjEnitytMasterRow.XMLAdditionalParamDet);
                        }

                        db.AddInParameter(command, "@SLPosting_Code", DbType.String, ObjEnitytMasterRow.SL_Posting_Code);
                        db.AddOutParameter(command, "@EntityCode", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 4);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);

                                if (Convert.ToString(command.Parameters["@EntityCode"].Value) != "")
                                    strEntityCode = (string)command.Parameters["@EntityCode"].Value;

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
                    if (intRowsAffected == 0)
                        intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                strEntityCode_Out = strEntityCode;
                return intRowsAffected;
            }
            #endregion

            #region Modifiy Entity
            /// <summary>
            /// to modify entity details
            /// </summary>
            /// <param name="bytesObjS3G_ORG_Entity_MasterDataTable">to get all entity related details</param>
            /// <returns></returns>
            public int FunPubModifyEntityInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Entity_MasterDataTable)
            {

                try
                {

                    ObjEntityMaster_DAL = (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_Entity_MasterDataTable, SerMode, typeof(ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            foreach (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterRow ObjEnitytMasterRow in ObjEntityMaster_DAL.Rows)
                            {
                                DbCommand command = db.GetStoredProcCommand("S3G_ORG_UpdateEntityDetails");
                                db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjEnitytMasterRow.Company_Id);
                                db.AddInParameter(command, "@EntityType", DbType.Int32, ObjEnitytMasterRow.Entity_Type);
                                db.AddInParameter(command, "@GLPostingCode", DbType.String, ObjEnitytMasterRow.GL_Code);
                                db.AddInParameter(command, "@Entity_Master_ID", DbType.Int32, ObjEnitytMasterRow.Entity_Master_ID);
                                db.AddInParameter(command, "@Nationality", DbType.Int32, ObjEnitytMasterRow.Nationality);
                                db.AddInParameter(command, "@Constitution_Id", DbType.Int32, ObjEnitytMasterRow.Constitution_ID);
                                db.AddInParameter(command, "@EntityCode", DbType.String, ObjEnitytMasterRow.Entity_Code);
                                db.AddInParameter(command, "@EntityName", DbType.String, ObjEnitytMasterRow.Entity_Name);
                                db.AddInParameter(command, "@Entity_Name1", DbType.String, ObjEnitytMasterRow.Entity_Name1);
                                db.AddInParameter(command, "@Entity_Name2", DbType.String, ObjEnitytMasterRow.Entity_Name2);
                                db.AddInParameter(command, "@Entity_Name3", DbType.String, ObjEnitytMasterRow.Entity_Name3);
                                db.AddInParameter(command, "@Entity_Name4", DbType.String, ObjEnitytMasterRow.Entity_Name4);
                                db.AddInParameter(command, "@Entity_Name5", DbType.String, ObjEnitytMasterRow.Entity_Name5);
                                db.AddInParameter(command, "@Entity_Name6", DbType.String, ObjEnitytMasterRow.Entity_Name6);


                                if (!ObjEnitytMasterRow.IsTax_Account_NumberNull())
                                {
                                    db.AddInParameter(command, "@TaxAccountNumber", DbType.String, ObjEnitytMasterRow.Tax_Account_Number);
                                }
                                if (!ObjEnitytMasterRow.IsVAT_NumberNull())
                                {
                                    db.AddInParameter(command, "@VAT_Number", DbType.String, ObjEnitytMasterRow.VAT_Number);
                                }
                                if (!ObjEnitytMasterRow.IsROC_NumberNull())
                                {
                                    db.AddInParameter(command, "@ROC_Number", DbType.String, ObjEnitytMasterRow.ROC_Number);
                                }
                                if (!ObjEnitytMasterRow.IsIMPEXP_CodeNull())
                                {
                                    db.AddInParameter(command, "@IMPEXP_Code", DbType.String, ObjEnitytMasterRow.IMPEXP_Code);
                                }

                                db.AddInParameter(command, "@Cust_VAT_TIN", DbType.String, ObjEnitytMasterRow.Cust_VAT_TIN);
                                db.AddInParameter(command, "@Cr_Number", DbType.String, ObjEnitytMasterRow.CR_Number);
                                db.AddInParameter(command, "@Service_Branch", DbType.Int32, ObjEnitytMasterRow.Service_Branch);
                                db.AddInParameter(command, "@Credit_Period_Allowed", DbType.Int32, ObjEnitytMasterRow.Credit_Period_Allowed);
                                db.AddInParameter(command, "@Col_Charges_PM", DbType.Decimal, ObjEnitytMasterRow.Col_Charges_PM);
                                db.AddInParameter(command, "@Related_Party_Indi", DbType.Int32, ObjEnitytMasterRow.Related_Party_Indic);
                                db.AddInParameter(command, "@Dealer_Group", DbType.String, ObjEnitytMasterRow.Dealer_Group);
                                db.AddInParameter(command, "@Consumer_Dealer", DbType.Int32, ObjEnitytMasterRow.Consumer_Dealer);
                                db.AddInParameter(command, "@Delivery_Location", DbType.Int32, ObjEnitytMasterRow.Delivery_Loc);
                                db.AddInParameter(command, "@Effective_From", DbType.DateTime, ObjEnitytMasterRow.Effective_From);
                                db.AddInParameter(command, "@Effective_To", DbType.DateTime, ObjEnitytMasterRow.Effective_To);

                                if (!ObjEnitytMasterRow.IsEmployee_IDNull())
                                {
                                    db.AddInParameter(command, "@Employee_Id", DbType.Int32, ObjEnitytMasterRow.Employee_ID);
                                }
                                if (!ObjEnitytMasterRow.IsEmployee_RatingNull())
                                {
                                    db.AddInParameter(command, "@Employee_Rating", DbType.Int32, ObjEnitytMasterRow.Employee_Rating);
                                }
                                db.AddInParameter(command, "@Entity_Abbr", DbType.String, ObjEnitytMasterRow.Entity_Abbr);
                                db.AddInParameter(command, "@Is_Active", DbType.Int32, ObjEnitytMasterRow.Is_Active);
                                db.AddInParameter(command, "@Branch_Code", DbType.String, ObjEnitytMasterRow.Branch_Code);
                                db.AddInParameter(command, "@Branch_Name", DbType.String, ObjEnitytMasterRow.Branch_Name);



                                db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjEnitytMasterRow.Modified_By);
                                //Added By Thangam M on 14/Feb/2012 to change the XML to CLOB
                                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@XMLBankDetails",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLBank_Details.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLBank_Details);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@XMLBankDetails", DbType.String, ObjEnitytMasterRow.XMLBank_Details);
                                }

                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Operation_Hist_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLOperationHistDet.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLOperationHistDet);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Operation_Hist_Det", DbType.String, ObjEnitytMasterRow.XMLOperationHistDet);
                                }

                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Employee_Hist_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLEmployeeHistDet.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLEmployeeHistDet);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Employee_Hist_Det", DbType.String, ObjEnitytMasterRow.XMLEmployeeHistDet);
                                }
                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Address_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLAddressDetails.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLAddressDetails);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Address_Det", DbType.String, ObjEnitytMasterRow.XMLAddressDetails);
                                }
                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Ins_Policy_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLInsurancePolicyDet.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLInsurancePolicyDet);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Ins_Policy_Det", DbType.String, ObjEnitytMasterRow.XMLInsurancePolicyDet);
                                }

                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Entity_Type_Doc_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLEntityTypeDocDet.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLEntityTypeDocDet);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Entity_Type_Doc_Det", DbType.String, ObjEnitytMasterRow.XMLEntityTypeDocDet);
                                }

                                if (enumDBType == S3GDALDBType.ORACLE)
                                {
                                    OracleParameter param = new OracleParameter("@Xml_Additional_Param_Det",
                                           OracleType.Clob, ObjEnitytMasterRow.XMLAdditionalParamDet.Length,
                                           ParameterDirection.Input, true, 0, 0, String.Empty,
                                           DataRowVersion.Default, ObjEnitytMasterRow.XMLAdditionalParamDet);
                                    command.Parameters.Add(param);
                                }
                                else
                                {
                                    db.AddInParameter(command, "@Xml_Additional_Param_Det", DbType.String, ObjEnitytMasterRow.XMLAdditionalParamDet);
                                }

                                db.AddInParameter(command, "@SLPosting_Code", DbType.String, ObjEnitytMasterRow.SL_Posting_Code);

                                //Thangam M on 15/Nov/2012 for Trade Advance
                                db.AddInParameter(command, "@Is_TradeAdvance", DbType.Int32, ObjEnitytMasterRow.Is_TradeAdvance);
                                //End here
                                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 4);
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                            }
                            trans.Commit();

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
            #endregion

            #region Get Entity Details
            /// <summary>
            /// to get entity code details
            /// </summary>
            /// <param name="intCompanyId">Company Id to whcich entity belongs</param>
            /// <param name="intEntityId">Entity Id for which dat to be obtained</param>
            /// <param name="blnTranExists">Boolen to check trans exists for Enityt selected</param>
            /// <returns></returns>
            public DataSet FunPubQueryEntityDetails(int? intCompany_Id, int? intEntity_id, out bool blnTranExists)
            {
                DataSet dsEntityDetails = new DataSet();
                blnTranExists = false;
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetEntityDetails");
                    if (intCompany_Id.HasValue && intCompany_Id.Value != 0)
                    {
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, intCompany_Id);
                    }
                    if (intEntity_id.HasValue && intEntity_id.Value != 0)
                    {
                        db.AddInParameter(command, "@Entity_Id", DbType.Int32, intEntity_id);
                    }
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@RecordExists", DbType.Boolean, sizeof(Boolean));
                    //dsEntityDetails = db.ExecuteDataSet(command);

                    //dsEntityDetails = db.FunPubExecuteDataSet(command);

                    db.FunPubLoadDataSet(command, dsEntityDetails, "Table0");

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        throw new Exception("Error in Getting Entity details");
                    blnTranExists = Convert.ToBoolean(command.Parameters["@RecordExists"].Value);
                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }

                return dsEntityDetails;
            }
            #endregion

            //Added by deepika for Customer group--starts
            #region Creating New CustomerGroup
            /// <summary>
            /// To Insert CustomerGroup Details
            /// </summary>
            public int FunPubCreateCustomerGroupInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Entity_MasterDataTable)
            {
                string strGroupCode = "";
                try
                {

                    ObjEntityMaster_DAL = (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_ORG_Entity_MasterDataTable, SerMode, typeof(ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (ORG.OrgMasterMgtServices.S3G_ORG_Entity_MasterRow ObjEnitytMasterRow in ObjEntityMaster_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_INS_CUSTGROUP");
                        db.AddInParameter(command, "@CompanyId", DbType.Int32, ObjEnitytMasterRow.Company_Id);
                        db.AddInParameter(command, "@CustGroupName", DbType.String, ObjEnitytMasterRow.Entity_Name);
                        db.AddInParameter(command, "@CustGroupCode", DbType.String, ObjEnitytMasterRow.Entity_Code);
                        db.AddInParameter(command, "@CustGroupId", DbType.Int32, ObjEnitytMasterRow.Entity_Master_ID);
                        db.AddInParameter(command, "@CustGroupLimit", DbType.Int64, ObjEnitytMasterRow.Group_Limit);
                        db.AddInParameter(command, "@CustGroupLimitExp", DbType.DateTime, ObjEnitytMasterRow.Effective_To);
                        db.AddInParameter(command, "@Status", DbType.Int32, ObjEnitytMasterRow.Is_Active); 
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjEnitytMasterRow.Created_By);

                        //Limit Transfer Start by Praba On 29-12-2020
                        db.AddInParameter(command, "@From_Customer_ID", DbType.Int32, ObjEnitytMasterRow.From_Customer_ID);
                        db.AddInParameter(command, "@To_Customer_ID", DbType.Int32, ObjEnitytMasterRow.To_Customer_ID);
                        db.AddInParameter(command, "@Transfer_Amount", DbType.Decimal, ObjEnitytMasterRow.Transfer_Amount);
                        //Limit Transfer End by Praba

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                         
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@Xml_CustomerDetails",
                                   OracleType.Clob, ObjEnitytMasterRow.XMLAdditionalParamDet.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, ObjEnitytMasterRow.XMLAdditionalParamDet);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@Xml_CustomerDetails", DbType.String, ObjEnitytMasterRow.XMLAdditionalParamDet);
                        }

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 4);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            { 
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                if (intRowsAffected == 0)
                                    intRowsAffected = 20;
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
                    if (intRowsAffected == 0)
                        intRowsAffected = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                }
                return intRowsAffected;
            }
            #endregion
            //Added by deepika for Customer group--end
        }
    }
}
