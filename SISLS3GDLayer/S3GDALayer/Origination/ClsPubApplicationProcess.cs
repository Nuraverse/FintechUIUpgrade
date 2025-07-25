#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Application Process
/// Created By			: Narayanan
/// Created Date		: 06-07-2010
/// <Program Summary>
#endregion

using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using S3GBusEntity;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.OracleClient;

namespace S3GDALayer.Origination
{
    public class ApplicationProcessDAL
    {
        int intRowsAffected;


        //Code added for getting common connection string  from config file
        Database db;
        public ApplicationProcessDAL()
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
        }


        /// <summary>
        /// FunPubCreateApplicationProcessInt
        /// </summary>
        /// <returns>
        /// strAppNumber_Out
        /// </returns>
        /// <seealso cref="SomeMethod(string)">
        /// Out Parameter used for Return Document No.
        /// </seealso>
        public int FunPubCreateApplicationProcessIntVer(S3GBusEntity.ApplicationProcess.ApplicationProcess ObjApp, out string strAppNumber_Out)
        {
            strAppNumber_Out = string.Empty;
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_OR_INS_APPDET_VER");
                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);//NM
                db.AddInParameter(command, "@User_Id", DbType.Int32, ObjApp.Created_By);//NM
                db.AddInParameter(command, "@Stage_Status", DbType.Int32, ObjApp.Stage_Status);//NM
                db.AddInParameter(command, "@RootBack", DbType.Int32, ObjApp.Rootback);//NM

                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                if (enumDBType == S3GDALDBType.ORACLE)
                {
                    OracleParameter param;
                    if (ObjApp.XMLRepaymentStructure != null)
                    {
                        param = new OracleParameter("@XML_APPLICATION_VER", OracleType.Clob,
                            ObjApp.XMLRepaymentStructure.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XMLRepaymentStructure);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XMLRepayDetailsOthers != null)
                    {
                        param = new OracleParameter("@XML_APPLICATION_ASSET_VER", OracleType.Clob,
                            ObjApp.XMLRepayDetailsOthers.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XMLRepayDetailsOthers);
                        command.Parameters.Add(param);
                    }

                }

                db.AddOutParameter(command, "@Application_Number", DbType.String, 100);
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
                        }
                        else
                        {
                            strAppNumber_Out = (string)command.Parameters["@Application_Number"].Value;
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intRowsAffected == 0)
                            intRowsAffected = 50;
                        trans.Rollback();
                        ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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

        public int FunPubCreateApplicationProcessInt(S3GBusEntity.ApplicationProcess.ApplicationProcess ObjApp, out string strAppNumber_Out)
        {
            strAppNumber_Out = string.Empty;
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_InsertApplicationDetails");
                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);//NM
                db.AddInParameter(command, "@Application_No", DbType.String, ObjApp.Application_Number);//M
                db.AddInParameter(command, "@Status_ID", DbType.String, ObjApp.Status_ID);//M
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjApp.Company_ID);//M
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApp.Created_By);//M
                db.AddInParameter(command, "@Constitution_ID", DbType.Int32, ObjApp.Constitution_ID);//M
                db.AddInParameter(command, "@Lease_Type", DbType.Int32, ObjApp.Lease_Type);//M
                db.AddInParameter(command, "@PaymentRuleCardId", DbType.String, ObjApp.Payment_RuleCard_ID);//M
                db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApp.LOB_ID);//M
                db.AddInParameter(command, "@Business_Offer_Number", DbType.String, ObjApp.Business_Offer_Number);//M
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjApp.Branch_ID);//M
                db.AddInParameter(command, "@PRICING_PRO_ID", DbType.Int32, ObjApp.Pricing_Id);//M
                db.AddInParameter(command, "@Sub_Location_ID", DbType.Int32, ObjApp.Sub_Location);//M
                if (ObjApp.Credit_Purpose != null)
                    db.AddInParameter(command, "@Credit_Purpose", DbType.Int32, ObjApp.Credit_Purpose);//M
                if (ObjApp.Product_ID != null)
                    db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjApp.Product_ID);//M
                if (ObjApp.Date != null)
                    db.AddInParameter(command, "@Date", DbType.DateTime, ObjApp.Date);//M
                if (ObjApp.Contract_Type != null)
                    db.AddInParameter(command, "@Contract_Type", DbType.Int32, ObjApp.Contract_Type);//M
                if (ObjApp.Sales_Person_ID != null)
                    db.AddInParameter(command, "@Sales_Person_ID", DbType.Int32, ObjApp.Sales_Person_ID);//M
                if (ObjApp.Covenants != null)
                    db.AddInParameter(command, "@Covenants", DbType.Int32, ObjApp.Covenants);//NM
                if (ObjApp.Covenants_Terms != null)
                    db.AddInParameter(command, "@Covenants_Terms", DbType.String, ObjApp.Covenants_Terms);//NM
                if (ObjApp.Customer_ID != null)
                    db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjApp.Customer_ID);//M
                if (ObjApp.Credit_Limit != null)
                    db.AddInParameter(command, "@Credit_Limit", DbType.Int32, ObjApp.Credit_Limit);//M
                if (ObjApp.DealTransfer != null)
                    db.AddInParameter(command, "@DealTransfer", DbType.Int32, ObjApp.DealTransfer);//M
                if (ObjApp.Deal_Type != null)
                    db.AddInParameter(command, "@Deal_Type", DbType.Int32, ObjApp.Deal_Type);//M
                if (ObjApp.Dealer_Id != null)
                    db.AddInParameter(command, "@Dealer_Id", DbType.Int32, ObjApp.Dealer_Id);//M
                if (ObjApp.Dealer_Sales_Persion_Id != null)
                    db.AddInParameter(command, "@Dealer_Sales_Persion_Id", DbType.Int32, ObjApp.Dealer_Sales_Persion_Id);//M
                if (ObjApp.Debt_Collector_Name_Id != null)
                    db.AddInParameter(command, "@Debt_Collector_Name_Id", DbType.Int32, ObjApp.Debt_Collector_Name_Id);//M
                if (ObjApp.Lead_Source_Type != null)
                    db.AddInParameter(command, "@Lead_Source_Type", DbType.Int32, ObjApp.Lead_Source_Type);//M
                if (ObjApp.Lead_Source_Name_Id != null)
                    db.AddInParameter(command, "@Lead_Source_Name_Id", DbType.Int32, ObjApp.Lead_Source_Name_Id);//M
                if (ObjApp.Lead_Other_Source_Name != null)
                    db.AddInParameter(command, "@Lead_Other_Source_Name", DbType.String, ObjApp.Lead_Other_Source_Name);//M
                if (ObjApp.Business_Source_Id != null)
                    db.AddInParameter(command, "@Business_Source_Id", DbType.Int32, ObjApp.Business_Source_Id);//M
                if (ObjApp.Dealer_Scheme_Name_Id != null)
                    db.AddInParameter(command, "@Dealer_Scheme_Name_Id", DbType.Int32, ObjApp.Dealer_Scheme_Name_Id);//M
                if (ObjApp.Seller_Code != null)
                    db.AddInParameter(command, "@Seller_Code", DbType.String, ObjApp.Seller_Code);//M
                if (ObjApp.Seller_Name != null)
                    db.AddInParameter(command, "@Seller_Name", DbType.String, ObjApp.Seller_Name);//M
                if (ObjApp.Dealer_Commission_Applicable != null)
                    db.AddInParameter(command, "@Dealer_Commission_Applicable", DbType.Int32, ObjApp.Dealer_Commission_Applicable);//M
                if (ObjApp.Finance_Amount != null)
                    db.AddInParameter(command, "@Finance_Amount", DbType.Decimal, ObjApp.Finance_Amount);//M
                if (ObjApp.Tenure != null)
                    db.AddInParameter(command, "@Tenure", DbType.Int32, ObjApp.Tenure);//M
                if (ObjApp.Tenure_Type != null)
                    db.AddInParameter(command, "@Tenure_Type", DbType.Int32, ObjApp.Tenure_Type);//M
                if (ObjApp.Refinance_Contract != null)
                    db.AddInParameter(command, "@Refinance_Contract", DbType.Int32, ObjApp.Refinance_Contract);//M
                if (ObjApp.Margin_Amount != null)
                    db.AddInParameter(command, "@Margin_Amount", DbType.Decimal, ObjApp.Margin_Amount);//M
                if (ObjApp.Residual_Value != null)
                    db.AddInParameter(command, "@Residual_Value", DbType.Int32, ObjApp.Residual_Value);//M
                if (ObjApp.Arear_Advance != null)
                    db.AddInParameter(command, "@Arear_Advance", DbType.Int32, ObjApp.Arear_Advance);//M
                if (ObjApp.Discount != null)
                    db.AddInParameter(command, "@Discount", DbType.Decimal, ObjApp.Discount);//M
                if (ObjApp.First_Installment_Date != null)
                    db.AddInParameter(command, "@First_Installment_Date", DbType.DateTime, ObjApp.First_Installment_Date);//M
                if (ObjApp.Income_Book_Start_Date != null)
                    db.AddInParameter(command, "@Income_Book_Start_Date", DbType.DateTime, ObjApp.Income_Book_Start_Date);//M
                if (ObjApp.Tentative_Account_Date != null)
                    db.AddInParameter(command, "@Tentative_Account_Date", DbType.DateTime, ObjApp.Tentative_Account_Date);//M
                if (ObjApp.Repayment_Mode != null)
                    db.AddInParameter(command, "@Repayment_Mode", DbType.Int32, ObjApp.Repayment_Mode);//M
                if (ObjApp.PNTD != null)
                    db.AddInParameter(command, "@PNTD", DbType.Int32, ObjApp.PNTD);//M
                if (ObjApp.Employer_Bank_Name != null)
                    db.AddInParameter(command, "@Employer_Bank_Name", DbType.Int32, ObjApp.Employer_Bank_Name);//M
                if (ObjApp.Business_IRR != null)
                    db.AddInParameter(command, "@Business_IRR", DbType.Decimal, ObjApp.Business_IRR);//M
                if (ObjApp.Accounting_IRR != null)
                    db.AddInParameter(command, "@Accounting_IRR", DbType.Decimal, ObjApp.Accounting_IRR);//M
                if (ObjApp.Company_IRR != null)
                    db.AddInParameter(command, "@Company_IRR", DbType.Decimal, ObjApp.Company_IRR);//M
                if (ObjApp.Existence_of_First_Charge != null)
                    db.AddInParameter(command, "@Existence_of_First_Charge", DbType.Int32, ObjApp.Existence_of_First_Charge);//NM
                if (ObjApp.Existence_of_Second_Charge != null)
                    db.AddInParameter(command, "@Existence_of_Second_Charge", DbType.Int32, ObjApp.Existence_of_Second_Charge);//NM
                if (ObjApp.No_of_Days_to_be_considered != null)
                    db.AddInParameter(command, "@No_of_Days_to_be_considered", DbType.Int32, ObjApp.No_of_Days_to_be_considered);//NM
                if (ObjApp.Start_delay_charges_Applicable != null)
                    db.AddInParameter(command, "@Start_dly_chrg_Applicable", DbType.Int32, ObjApp.Start_delay_charges_Applicable);//NM
                if (ObjApp.Delay_Days != null)
                    db.AddInParameter(command, "@Delay_Days", DbType.Int32, ObjApp.Delay_Days);//NM
                if (ObjApp.Start_Date_delay_rate != null)
                    db.AddInParameter(command, "@Start_Date_delay_rate", DbType.Decimal, ObjApp.Start_Date_delay_rate);//NM
                if (ObjApp.Start_delay_charges != null)
                    db.AddInParameter(command, "@Start_delay_charges", DbType.Decimal, ObjApp.Start_delay_charges);//NM
                if (ObjApp.Over_Due_Charges != null)
                    db.AddInParameter(command, "@Over_Due_Charges", DbType.Decimal, ObjApp.Over_Due_Charges);//NM
                if (ObjApp.Life_Insurance_Applicable != null)
                    db.AddInParameter(command, "@Life_Insurance_Applicable", DbType.Int32, ObjApp.Life_Insurance_Applicable);//NM
                if (ObjApp.Life_Insurance_Entity != null)
                    db.AddInParameter(command, "@Life_Insurance_Entity", DbType.Int32, ObjApp.Life_Insurance_Entity);//NM
                if (ObjApp.Life_Insurance_Premium_Customer_Amount != null)
                    db.AddInParameter(command, "@Life_Ins_Pre_Customer", DbType.Decimal, ObjApp.Life_Insurance_Premium_Customer_Amount);//NM
                if (ObjApp.Life_Insurance_Premium_Company_Amount != null)
                    db.AddInParameter(command, "@Life_Ins_Prem_Amount ", DbType.Decimal, ObjApp.Life_Insurance_Premium_Company_Amount);//NM

                db.AddInParameter(command, "@Insurance_Tax_Rate", DbType.Decimal, ObjApp.Life_Insurance_Tax_Rate);//NM
                db.AddInParameter(command, "@Life_Ins_Company_Tax_Amt", DbType.Decimal, ObjApp.Life_Insurance_Company_Tax_Amount);//NM
                db.AddInParameter(command, "@Life_Ins_Cust_Tax_Amt", DbType.Decimal, ObjApp.Life_Insurance_Customer_Tax_Amount);//NM
                db.AddInParameter(command, "@Life_Ins_Pre_Customer_WT", DbType.Decimal, ObjApp.Life_Insurance_Premium_Customer_Amount_WT);//NM
                db.AddInParameter(command, "@Life_Ins_Prem_Company_WT", DbType.Decimal, ObjApp.Life_Insurance_Premium_Company_Amount_WT);//NM

                if (ObjApp.Risk_Rating != null)
                    db.AddInParameter(command, "@Risk_Rating", DbType.Int32, ObjApp.Risk_Rating);//NM
                if (ObjApp.Risk_Remarks != null)
                    db.AddInParameter(command, "@Risk_Remarks", DbType.String, ObjApp.Risk_Remarks);//NM
                if (ObjApp.Risk_Score != null)
                    db.AddInParameter(command, "@Risk_Score", DbType.Int32, ObjApp.Risk_Score);//NM
                if (ObjApp.Risk_Document_No != null)
                    db.AddInParameter(command, "@Risk_Document_No", DbType.String, ObjApp.Risk_Document_No);//NM
                if (ObjApp.Risk_Quality_Value != null)
                    db.AddInParameter(command, "@Risk_Quality_Value", DbType.Int32, ObjApp.Risk_Quality_Value);//NM
                if (ObjApp.Risk_AML_Classification != null)
                    db.AddInParameter(command, "@Risk_AML_Classification", DbType.String, ObjApp.Risk_AML_Classification);//NM

                if (ObjApp.Offer_Residual_Value != null)
                    db.AddInParameter(command, "@Offer_Residual_Value", DbType.Decimal, ObjApp.Offer_Residual_Value);//NM
                if (ObjApp.Offer_Residual_Value_Amount != null)
                    db.AddInParameter(command, "@Offer_Residual_Value_Amount", DbType.Decimal, ObjApp.Offer_Residual_Value_Amount);
                if (ObjApp.Offer_Margin != null)
                    db.AddInParameter(command, "@Offer_Margin", DbType.Decimal, ObjApp.Offer_Margin);
                if (ObjApp.Offer_Margin_Amount != null)
                    db.AddInParameter(command, "@Offer_Margin_Amount", DbType.Decimal, ObjApp.Offer_Margin_Amount);
                if (ObjApp.MLA_Applicable != null)
                    db.AddInParameter(command, "@MLA_Applicable", DbType.Int32, ObjApp.MLA_Applicable);
                if (ObjApp.MLA_Number != null)
                    db.AddInParameter(command, "@MLA_Number", DbType.Int32, ObjApp.MLA_Number);
                if (ObjApp.MLA_Validity_To != null)
                    db.AddInParameter(command, "@MLA_Validity_To", DbType.String, ObjApp.MLA_Validity_To);
                if (ObjApp.MLA_Validity_From != null)
                    db.AddInParameter(command, "@MLA_Validity_From", DbType.String, ObjApp.MLA_Validity_From);

                //FT 

                //Main Tab-FT
                if (ObjApp.EVALUATOR != null)
                    db.AddInParameter(command, "@EVALUATOR", DbType.String, ObjApp.EVALUATOR);
                if (ObjApp.AUDITOR != null)
                    db.AddInParameter(command, "@AUDITOR", DbType.String, ObjApp.AUDITOR);
                if (ObjApp.Facility_Start_Date != null)
                    db.AddInParameter(command, "@Facility_Start_Date  ", DbType.DateTime, ObjApp.Facility_Start_Date);
                if (ObjApp.Facility_End_Date != null)
                    db.AddInParameter(command, "@Facility_End_Date  ", DbType.DateTime, ObjApp.Facility_End_Date);
                if (ObjApp.RelationShipManager != null)
                    db.AddInParameter(command, "@RelationShipManager", DbType.String, ObjApp.RelationShipManager);




                //--Offer Tab-FT

                if (ObjApp.RemarksFWC != null)
                    db.AddInParameter(command, "@RemarksFWC  ", DbType.String, ObjApp.RemarksFWC);


                if (ObjApp.DEBT_PURCHASE_LIMIT != null)
                    db.AddInParameter(command, "@DEBT_PURCHASE_LIMIT", DbType.Decimal, ObjApp.DEBT_PURCHASE_LIMIT);
                if (ObjApp.PREPAYMENT_LIMIT != null)
                    db.AddInParameter(command, "@PREPAYMENT_LIMIT", DbType.Decimal, ObjApp.PREPAYMENT_LIMIT);
                if (ObjApp.INVOICE_CAP_VALUE != null)
                    db.AddInParameter(command, "@INVOICE_CAP_VALUE", DbType.Decimal, ObjApp.INVOICE_CAP_VALUE);
                if (ObjApp.DISCOUNT_RATE_LOC != null)
                    db.AddInParameter(command, "@DISCOUNT_RATE_LOC", DbType.Decimal, ObjApp.DISCOUNT_RATE_LOC);
                if (ObjApp.PENAL_RATE != null)
                    db.AddInParameter(command, "@PENAL_RATE", DbType.Decimal, ObjApp.PENAL_RATE);
                if (ObjApp.CREDIT_PERIOD_DAYS != null)
                    db.AddInParameter(command, "@CREDIT_PERIOD_DAYS", DbType.Int32, ObjApp.CREDIT_PERIOD_DAYS);
                if (ObjApp.GRACE_PERIOD_DAYS != null)
                    db.AddInParameter(command, "@GRACE_PERIOD_DAYS", DbType.Int32, ObjApp.GRACE_PERIOD_DAYS);
                if (ObjApp.DISGP_PERIOD_DAYS != null)
                    db.AddInParameter(command, "@DISP_PERIOD_DAYS", DbType.Int32, ObjApp.DISGP_PERIOD_DAYS);
                if (ObjApp.RESUL_PERIOD_DAYS != null)
                    db.AddInParameter(command, "@RESUL_PERIOD_DAYS", DbType.Int32, ObjApp.RESUL_PERIOD_DAYS);

                if (ObjApp.Rootback != null)
                    db.AddInParameter(command, "@Rootback", DbType.Int32, ObjApp.Rootback);




                if (ObjApp.GenRemarks != null)
                    db.AddInParameter(command, "@GenRemarks", DbType.String, ObjApp.GenRemarks);

                if (ObjApp.Stage_Status != null)
                    db.AddInParameter(command, "@Stage_Status", DbType.Int32, ObjApp.Stage_Status);
                if (ObjApp.InstallmentRoundofPosition != null)
                    db.AddInParameter(command, "@InstallmentRoundofPosition", DbType.Int32, ObjApp.InstallmentRoundofPosition);










                if (ObjApp.INSURANCE_AMOUNT != null)
                    db.AddInParameter(command, "@INSURANCE_AMOUNT", DbType.Decimal, ObjApp.INSURANCE_AMOUNT);
                if (ObjApp.INSURANCE_COVERAGE_DAY != null)
                    db.AddInParameter(command, "@INSURANCE_COVERAGE_DAY", DbType.Int32, ObjApp.INSURANCE_COVERAGE_DAY);
                if (ObjApp.Life_Insurance_Premium_Comapny_Rate != null)
                    db.AddInParameter(command, "@INSURANCE_COMPANY_RATE", DbType.Decimal, ObjApp.Life_Insurance_Premium_Comapny_Rate);
                if (ObjApp.INSURANCE_COMPANY_RATE != null)
                    db.AddInParameter(command, "@INSURANCE_CUST_RATE", DbType.Decimal, ObjApp.Life_Insurance_Premium_Customer_Rate);

                if (ObjApp.DELAY_CHARGE_GRACE_DAYS != null)
                    db.AddInParameter(command, "@DELAY_CHARGE_GRACE_DAYS", DbType.Int32, ObjApp.DELAY_CHARGE_GRACE_DAYS);
                if (ObjApp.DELAY_CHARGE_RATE != null)
                    db.AddInParameter(command, "@DELAY_CHARGE_RATE", DbType.Decimal, ObjApp.DELAY_CHARGE_RATE);
                if (ObjApp.DELAY_CHARGE_AMOUNT != null)
                    db.AddInParameter(command, "@DELAY_CHARGE_AMOUNT  ", DbType.Decimal, ObjApp.DELAY_CHARGE_AMOUNT);












                if (ObjApp.CRM_ID != 0)
                {
                    db.AddInParameter(command, "@CRM_ID", DbType.Int64, ObjApp.CRM_ID);
                }
                //Added By Chandru K On 18-Sep-2013 For ISFC Customization
                //db.AddInParameter(command, "@Mortgage_Type", DbType.Int32, ObjApp.Mortgage_Type);
                //db.AddInParameter(command, "@Mortgage_Fees", DbType.Decimal, ObjApp.Mortgage_Fees);
                //db.AddInParameter(command, "@StepDown_RevisionType", DbType.Int32, ObjApp.StepDown_RevisionType);
                //db.AddInParameter(command, "@XMLMortgage", DbType.String, strXMLMortgage);
                //End
                if (ObjApp.intFBDate != 0)
                {
                    db.AddInParameter(command, "@FBDate", DbType.Int32, ObjApp.intFBDate);
                }
                if (ObjApp.Loan_Type != 0)
                {
                    db.AddInParameter(command, "@Loan_Type", DbType.Int32, ObjApp.Loan_Type);
                }
                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                if (enumDBType == S3GDALDBType.ORACLE)
                {
                    OracleParameter param;
                    if (ObjApp.XMLRepaymentStructure != null)
                    {
                        param = new OracleParameter("@XML_RepaymentStructure", OracleType.Clob,
                            ObjApp.XMLRepaymentStructure.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XMLRepaymentStructure);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_Constitution != null)
                    {
                        param = new OracleParameter("@XML_Constitution", OracleType.Clob,
                            ObjApp.XML_Constitution.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Constitution);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_AssetDetails != null)
                    {
                        param = new OracleParameter("@XML_AssetDetails", OracleType.Clob,
                            ObjApp.XML_AssetDetails.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_AssetDetails);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_AssetLoanDetails != null)
                    {
                        param = new OracleParameter("@XML_AssetLoanDetails", OracleType.Clob,
                            ObjApp.XML_AssetLoanDetails.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_AssetLoanDetails);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_ROIRULE != null)
                    {
                        param = new OracleParameter("@XML_ROIRULE", OracleType.Clob,
                            ObjApp.XML_ROIRULE.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_ROIRULE);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Inflow != null)
                    {
                        param = new OracleParameter("@XML_Inflow", OracleType.Clob,
                            ObjApp.XML_Inflow.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Inflow);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_OutFlow != null)
                    {
                        param = new OracleParameter("@XML_OutFlow", OracleType.Clob,
                            ObjApp.XML_OutFlow.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_OutFlow);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XML_Repayment != null)
                    {
                        param = new OracleParameter("@XML_Repayment", OracleType.Clob,
                            ObjApp.XML_Repayment.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Repayment);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Guarantor != null)
                    {
                        param = new OracleParameter("@XML_Guarantor", OracleType.Clob,
                            ObjApp.XML_Guarantor.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Guarantor);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Invoice != null)
                    {
                        param = new OracleParameter("@XML_Invoice", OracleType.Clob,
                            ObjApp.XML_Invoice.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Invoice);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_ALERT != null)
                    {
                        param = new OracleParameter("@XML_ALERT", OracleType.Clob,
                            ObjApp.XML_ALERT.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_ALERT);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_PDD != null)
                    {
                        param = new OracleParameter("@XML_PDD", OracleType.Clob,
                            ObjApp.XML_PDD.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_PDD);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_FollowDetail != null)
                    {
                        param = new OracleParameter("@XML_FollowDetail", OracleType.Clob,
                            ObjApp.XML_FollowDetail.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_FollowDetail);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Moratorium != null)
                    {
                        param = new OracleParameter("@XML_Moratorium", OracleType.Clob,
                            ObjApp.XML_Moratorium.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Moratorium);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XMLRepayDetailsOthers != null)
                    {
                        param = new OracleParameter("@XMLRepayDetailsOthers",
                            OracleType.Clob, ObjApp.XMLRepayDetailsOthers.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.XMLRepayDetailsOthers);
                        command.Parameters.Add(param);

                    }
                    if (ObjApp.XMLDealTransfer != null)
                    {
                        param = new OracleParameter("@XMLDealTransfer",
                            OracleType.Clob, ObjApp.XMLDealTransfer.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.XMLDealTransfer);
                        command.Parameters.Add(param);

                    }

                    if (ObjApp.XMLLienAccount != null)
                    {
                        param = new OracleParameter("@XMLLienAccount",
                            OracleType.Clob, ObjApp.XMLLienAccount.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.XMLLienAccount);
                        command.Parameters.Add(param);

                    }

                    if (ObjApp.XMLCovenants != null)
                    {
                        param = new OracleParameter("@XMLCovenants",
                            OracleType.Clob, ObjApp.XMLCovenants.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.XMLCovenants);
                        command.Parameters.Add(param);
                    }
                    //




                    if (ObjApp.strXMLCustomerMap != null)
                    {
                        param = new OracleParameter("@XMLCustomerMap",
                            OracleType.Clob, ObjApp.strXMLCustomerMap.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.strXMLCustomerMap);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.strXMLOtherCharges != null)
                    {
                        param = new OracleParameter("@strXMLOtherCharges",
                            OracleType.Clob, ObjApp.strXMLOtherCharges.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.strXMLOtherCharges);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.strXMLDiscountRateforUtilization != null)
                    {
                        param = new OracleParameter("@XMLDisRatforUtil",
                            OracleType.Clob, ObjApp.strXMLDiscountRateforUtilization.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.strXMLDiscountRateforUtilization);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.strXMLAppraisalInfo != null)
                    {
                        param = new OracleParameter("@XMLAppraisalInfo",
                            OracleType.Clob, ObjApp.strXMLAppraisalInfo.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.strXMLAppraisalInfo);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.strXMLAppraisalInfoPropmoter != null)
                    {
                        param = new OracleParameter("@XMLAppraisalInfoPropmoter",
                            OracleType.Clob, ObjApp.strXMLAppraisalInfoPropmoter.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.strXMLAppraisalInfoPropmoter);
                        command.Parameters.Add(param);
                    }
                    if (ObjApp.XmlAdditionalInfo != null)
                    {
                        param = new OracleParameter("@XmlAdditionalInfo",
                            OracleType.Clob, ObjApp.XmlAdditionalInfo.Length,
                            ParameterDirection.Input, true, 0, 0, String.Empty,
                            DataRowVersion.Default, ObjApp.XmlAdditionalInfo);
                        command.Parameters.Add(param);
                    }

                }
                else
                {
                    db.AddInParameter(command, "@XML_RepaymentStructure", DbType.String,
                        ObjApp.XMLRepaymentStructure);
                    db.AddInParameter(command, "@XML_Constitution", DbType.String, ObjApp.XML_Constitution);
                    db.AddInParameter(command, "@XML_AssetDetails", DbType.String, ObjApp.XML_AssetDetails);
                    db.AddInParameter(command, "@XML_AssetLoanDetails", DbType.String, ObjApp.XML_AssetLoanDetails);
                    db.AddInParameter(command, "@XML_ROIRULE", DbType.String, ObjApp.XML_ROIRULE);
                    db.AddInParameter(command, "@XML_Inflow", DbType.String, ObjApp.XML_Inflow);
                    db.AddInParameter(command, "@XML_OutFlow", DbType.String, ObjApp.XML_OutFlow);
                    db.AddInParameter(command, "@XML_Repayment", DbType.String, ObjApp.XML_Repayment);
                    db.AddInParameter(command, "@XML_Guarantor", DbType.String, ObjApp.XML_Guarantor);
                    db.AddInParameter(command, "@XML_Invoice", DbType.String, ObjApp.XML_Invoice);
                    db.AddInParameter(command, "@XML_ALERT", DbType.String, ObjApp.XML_ALERT);
                    db.AddInParameter(command, "@XML_PDD", DbType.String, ObjApp.XML_PDD);
                    db.AddInParameter(command, "@XML_FollowDetail", DbType.String, ObjApp.XML_FollowDetail);
                    db.AddInParameter(command, "@XML_Moratorium", DbType.String, ObjApp.XML_Moratorium);
                    if (ObjApp.XMLRepayDetailsOthers != null)
                    {
                        db.AddInParameter(command, "@XMLRepayDetailsOthers", DbType.String, ObjApp.XMLRepayDetailsOthers);
                    }
                }
                db.AddOutParameter(command, "@Application_Number", DbType.String, 100);
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

                        }
                        else
                        {
                            strAppNumber_Out = (string)command.Parameters["@Application_Number"].Value;
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intRowsAffected == 0)
                            intRowsAffected = 50;
                        strAppNumber_Out = ex.ToString();
                        trans.Rollback();
                        ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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

        public int FunPubUpdateApplicationStatus(S3GBusEntity.ApplicationProcess.ApplicationProcess objApplicationProcessEntity)
        {
            int intErrorCode = 0;
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_LoanAd_CancelApplication");

                db.AddInParameter(command, "@ApplicationProcessId", DbType.Int32, objApplicationProcessEntity.Application_Process_ID);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = Convert.ToInt32(command.Parameters["@ErrorCode"].Value);
                }
                return intErrorCode;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int FunPubCreateApplicationProcessGoldLoanInt(S3GBusEntity.ApplicationProcess.ApplicationProcess ObjApp, out string strAppNumber_Out)
        {
            strAppNumber_Out = string.Empty;
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_InsertApplicationDetailsGL");
                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@PaymentRuleCardId", DbType.String, ObjApp.Payment_RuleCard_ID);
                db.AddInParameter(command, "@Date", DbType.DateTime, ObjApp.Date);
                db.AddInParameter(command, "@Business_Offer_Number", DbType.String, ObjApp.Business_Offer_Number);
                db.AddInParameter(command, "@Status_ID", DbType.String, ObjApp.Status_ID);
                db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjApp.Customer_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjApp.Company_ID);
                db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApp.LOB_ID);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjApp.Branch_ID);
                db.AddInParameter(command, "@Product_ID", DbType.Int32, ObjApp.Product_ID);
                db.AddInParameter(command, "@Sales_Person_ID", DbType.Int32, ObjApp.Sales_Person_ID);
                db.AddInParameter(command, "@Business_IRR", DbType.Decimal, ObjApp.Business_IRR);
                db.AddInParameter(command, "@Company_IRR", DbType.Decimal, ObjApp.Company_IRR);
                db.AddInParameter(command, "@Accounting_IRR", DbType.Decimal, ObjApp.Accounting_IRR);
                db.AddInParameter(command, "@Finance_Amount", DbType.Decimal, ObjApp.Finance_Amount);
                db.AddInParameter(command, "@Tenure", DbType.Decimal, ObjApp.Tenure);
                db.AddInParameter(command, "@Tenure_Type", DbType.Int32, ObjApp.Tenure_Type);
                db.AddInParameter(command, "@Margin_Amount", DbType.Decimal, ObjApp.Margin_Amount);
                db.AddInParameter(command, "@Residual_Value", DbType.Decimal, ObjApp.Residual_Value);
                db.AddInParameter(command, "@Refinance_Contract", DbType.Int32, ObjApp.Refinance_Contract);
                db.AddInParameter(command, "@Constitution_ID", DbType.Int32, ObjApp.Constitution_ID);
                db.AddInParameter(command, "@Lease_Type", DbType.Int32, ObjApp.Lease_Type);
                db.AddInParameter(command, "@Offer_Residual_Value", DbType.Decimal, ObjApp.Offer_Residual_Value);
                db.AddInParameter(command, "@Offer_Residual_Value_Amount", DbType.Int32, ObjApp.Offer_Residual_Value_Amount);
                db.AddInParameter(command, "@Offer_Margin", DbType.Decimal, ObjApp.Offer_Margin);
                db.AddInParameter(command, "@Offer_Margin_Amount", DbType.Decimal, ObjApp.Offer_Margin_Amount);
                db.AddInParameter(command, "@MLA_Applicable", DbType.Int32, ObjApp.MLA_Applicable);
                db.AddInParameter(command, "@MLA_Number", DbType.Int32, ObjApp.MLA_Number);
                db.AddInParameter(command, "@MLA_Validity_To", DbType.String, ObjApp.MLA_Validity_To);
                db.AddInParameter(command, "@MLA_Validity_From", DbType.String, ObjApp.MLA_Validity_From);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApp.Created_By);
                if (ObjApp.intFBDate != 0)
                {
                    db.AddInParameter(command, "@FBDate", DbType.Int32, ObjApp.intFBDate);
                }


                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                if (enumDBType == S3GDALDBType.ORACLE)
                {
                    OracleParameter param;
                    if (ObjApp.XMLRepaymentStructure != null)
                    {
                        param = new OracleParameter("@XML_RepaymentStructure", OracleType.Clob,
                            ObjApp.XMLRepaymentStructure.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XMLRepaymentStructure);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Constitution != null)
                    {
                        param = new OracleParameter("@XML_Constitution", OracleType.Clob,
                            ObjApp.XML_Constitution.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Constitution);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_AssetDetails != null)
                    {
                        param = new OracleParameter("@XML_AssetDetails", OracleType.Clob,
                            ObjApp.XML_AssetDetails.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_AssetDetails);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_ROIRULE != null)
                    {
                        param = new OracleParameter("@XML_ROIRULE", OracleType.Clob,
                            ObjApp.XML_ROIRULE.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_ROIRULE);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Inflow != null)
                    {
                        param = new OracleParameter("@XML_Inflow", OracleType.Clob,
                            ObjApp.XML_Inflow.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Inflow);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_OutFlow != null)
                    {
                        param = new OracleParameter("@XML_OutFlow", OracleType.Clob,
                            ObjApp.XML_OutFlow.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_OutFlow);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Repayment != null)
                    {
                        param = new OracleParameter("@XML_Repayment", OracleType.Clob,
                            ObjApp.XML_Repayment.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Repayment);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Guarantor != null)
                    {
                        param = new OracleParameter("@XML_Guarantor", OracleType.Clob,
                            ObjApp.XML_Guarantor.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Guarantor);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Invoice != null)
                    {
                        param = new OracleParameter("@XML_Invoice", OracleType.Clob,
                            ObjApp.XML_Invoice.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Invoice);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_ALERT != null)
                    {
                        param = new OracleParameter("@XML_ALERT", OracleType.Clob,
                            ObjApp.XML_ALERT.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_ALERT);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_PDD != null)
                    {
                        param = new OracleParameter("@XML_PDD", OracleType.Clob,
                            ObjApp.XML_PDD.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_PDD);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_FollowDetail != null)
                    {
                        param = new OracleParameter("@XML_FollowDetail", OracleType.Clob,
                            ObjApp.XML_FollowDetail.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_FollowDetail);
                        command.Parameters.Add(param);
                    }

                    if (ObjApp.XML_Moratorium != null)
                    {
                        param = new OracleParameter("@XML_Moratorium", OracleType.Clob,
                            ObjApp.XML_Moratorium.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjApp.XML_Moratorium);
                        command.Parameters.Add(param);
                    }
                }
                else
                {
                    db.AddInParameter(command, "@XML_RepaymentStructure", DbType.String,
                        ObjApp.XMLRepaymentStructure);
                    db.AddInParameter(command, "@XML_Constitution", DbType.String, ObjApp.XML_Constitution);
                    db.AddInParameter(command, "@XML_AssetDetails", DbType.String, ObjApp.XML_AssetDetails);
                    db.AddInParameter(command, "@XML_ROIRULE", DbType.String, ObjApp.XML_ROIRULE);
                    db.AddInParameter(command, "@XML_Inflow", DbType.String, ObjApp.XML_Inflow);
                    db.AddInParameter(command, "@XML_OutFlow", DbType.String, ObjApp.XML_OutFlow);
                    db.AddInParameter(command, "@XML_Repayment", DbType.String, ObjApp.XML_Repayment);
                    db.AddInParameter(command, "@XML_Guarantor", DbType.String, ObjApp.XML_Guarantor);
                    db.AddInParameter(command, "@XML_Invoice", DbType.String, ObjApp.XML_Invoice);
                    db.AddInParameter(command, "@XML_ALERT", DbType.String, ObjApp.XML_ALERT);
                    db.AddInParameter(command, "@XML_PDD", DbType.String, ObjApp.XML_PDD);
                    db.AddInParameter(command, "@XML_FollowDetail", DbType.String, ObjApp.XML_FollowDetail);
                    db.AddInParameter(command, "@XML_Moratorium", DbType.String, ObjApp.XML_Moratorium);
                }

                db.AddOutParameter(command, "@Application_Number", DbType.String, 100);
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
                        }
                        else
                        {
                            strAppNumber_Out = (string)command.Parameters["@Application_Number"].Value;
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
        public int FunPubSaveFactroingIncomeandInterest(S3GBusEntity.ApplicationProcess.ApplicationProcess ObjApp, out string strAppNumber_Out)
        {
            strAppNumber_Out = string.Empty;
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_FACT_REGULAR_INT_POST");
                db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjApp.Company_ID);//NM
                db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, ObjApp.Branch_ID);//NM
                db.AddInParameter(command, "@CUT_OFF_DATE", DbType.String, ObjApp.Offer_Date);//NM
                db.AddInParameter(command, "@SCHEDULEJOB_STATUS_ID", DbType.Int32, ObjApp.Application_Process_ID);//NM
                db.AddInParameter(command, "@JobPost_Type", DbType.Int32, ObjApp.Sales_Person_ID);//1-Income  and 2 ODI
                db.AddOutParameter(command, "@Application_Number", DbType.String, 100);
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
                            strAppNumber_Out = (string)command.Parameters["@Application_Number"].Value;
                        }
                        else
                        {
                            strAppNumber_Out = (string)command.Parameters["@Application_Number"].Value;
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intRowsAffected == 0)
                            intRowsAffected = 50;
                        trans.Rollback();
                        ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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

        /*public void FunPub_Insert_ROI(S3GBusEntity.ApplicationProcess.Offer_ROI_Details ObjApp)
        {
            try
            {
                Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessOffer_ROI_Details_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@ROI_Rules_ID", DbType.Int32, ObjApp.ROI_Rules_ID);
                db.AddInParameter(command, "@Model_Description", DbType.String, ObjApp.Model_Description);
                db.AddInParameter(command, "@Rate_Type", DbType.Int32, ObjApp.Rate_Type);
                db.AddInParameter(command, "@ROI_Rule_Number", DbType.String, ObjApp.ROI_Rule_Number);
                db.AddInParameter(command, "@Return_Pattern", DbType.Int32, ObjApp.Return_Pattern);
                db.AddInParameter(command, "@Time_Value", DbType.Int32, ObjApp.Time_Value);
                db.AddInParameter(command, "@Frequency", DbType.Int32, ObjApp.Frequency);
                db.AddInParameter(command, "@Repayment_Mode", DbType.Int32, ObjApp.Repayment_Mode);
                db.AddInParameter(command, "@Rate", DbType.Decimal, ObjApp.Rate);
                db.AddInParameter(command, "@IRR_Rest", DbType.Int32, ObjApp.IRR_Rest);
                db.AddInParameter(command, "@Interest_Calculation", DbType.Int32, ObjApp.Interest_Calculation);
                db.AddInParameter(command, "@Interest_Levy", DbType.Int32, ObjApp.Interest_Levy);
                db.AddInParameter(command, "@Recovery_Pattern_Year1", DbType.Decimal, ObjApp.Recovery_Pattern_Year1);
                db.AddInParameter(command, "@Recovery_Pattern_Year2", DbType.Decimal, ObjApp.Recovery_Pattern_Year2);
                db.AddInParameter(command, "@Recovery_Pattern_Year3", DbType.Decimal, ObjApp.Recovery_Pattern_Year3);
                db.AddInParameter(command, "@Recovery_Pattern_Rest", DbType.Decimal, ObjApp.Recovery_Pattern_Rest);
                db.AddInParameter(command, "@Insurance", DbType.Int32, ObjApp.Insurance);
                db.AddInParameter(command, "@Residual_Value", DbType.Int32, ObjApp.Residual_Value);
                db.AddInParameter(command, "@Margin", DbType.Int32, ObjApp.Margin);
                db.AddInParameter(command, "@Margin_Percentage", DbType.Decimal, ObjApp.Margin_Percentage);

                db.FunPubExecuteNonQuery(command, DBTrans);

                Commit();

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }
        }*/

        /*

        public void FunPub_Insert_ConstituionDocuments(S3GBusEntity.ApplicationProcess.DocumentsDetails ObjApp)
        {
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessDocDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@ConstitutionDocumentCategory_ID", DbType.Int32, ObjApp.ConstitutionDocumentCategory_ID);
                db.AddInParameter(command, "@Remarks", DbType.String, ObjApp.Remarks);
                db.AddInParameter(command, "@Is_Collected", DbType.Int32, ObjApp.Is_Collected);
                db.AddInParameter(command, "@Is_Scanned", DbType.Int32, ObjApp.Is_Scanned);
                db.AddInParameter(command, "@Value", DbType.String, ObjApp.Value);
                db.AddInParameter(command, "@Is_FollowUp", DbType.Int32, ObjApp.Is_FollowUp);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }
        }

        public void FunPub_Insert_AssetDetail(S3GBusEntity.ApplicationProcess.AssetDetails ObjApp)
        {
            try
            {
                //  Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessAssetDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Asset_ID", DbType.Int32, ObjApp.Asset_ID);
                db.AddInParameter(command, "@Required_From", DbType.String, ObjApp.Required_From);
                db.AddInParameter(command, "@No_Of_Units", DbType.Decimal, ObjApp.No_Of_Units);
                db.AddInParameter(command, "@Unit_Value", DbType.Decimal, ObjApp.Unit_Value);
                db.AddInParameter(command, "@Margin_Percentage", DbType.Decimal, ObjApp.Margin_Percentage);
                db.AddInParameter(command, "@Margin_Amount", DbType.Decimal, ObjApp.Margin_Amount);
                db.AddInParameter(command, "@Book_Depreciation_Percentage", DbType.Decimal, ObjApp.Book_Depreciation_Percentage);
                db.AddInParameter(command, "@Block_Depreciation_Percentage", DbType.Decimal, ObjApp.Block_Depreciation_Percentage);
                db.AddInParameter(command, "@Finance_Amount", DbType.Decimal, ObjApp.Finance_Amount);
                db.AddInParameter(command, "@Capital_Portion", DbType.Decimal, ObjApp.Capital_Portion);
                db.AddInParameter(command, "@Non_Capital_Portion", DbType.Decimal, ObjApp.Non_Capital_Portion);
                db.AddInParameter(command, "@Pay_To", DbType.Int32, ObjApp.Pay_To);
                db.AddInParameter(command, "@Payment_Percentage", DbType.Decimal, ObjApp.Payment_Percentage);
                db.AddInParameter(command, "@Is_Proforma", DbType.Int32, ObjApp.Is_Proforma);
                db.AddInParameter(command, "@Entity_ID", DbType.Int32, ObjApp.Entity_ID);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }
        }
        
        public void FunPub_Insert_PaymentRuleCard(S3GBusEntity.ApplicationProcess.Offer_PaymentRuleCard ObjApp)
        {
            try
            {
                //   Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessOffer_PaymentRuleCard_Details_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Payment_RuleCard_ID", DbType.Int32, ObjApp.Payment_RuleCard_ID);
                //db.AddInParameter(command, "@Payment_Rule_Number", DbType.Int32, ObjApp.Payment_Rule_Number);
                //db.AddInParameter(command, "@AccountType_ID", DbType.Int32, ObjApp.AccountType_ID);
                //db.AddInParameter(command, "@Entity_ID", DbType.Int32, ObjApp.Entity_ID);
                //db.AddInParameter(command, "@Compensation_Percentage", DbType.Int32, ObjApp.Compensation_Percentage);
                //db.AddInParameter(command, "@Compensation_Levy_Pattern", DbType.Int32, ObjApp.Compensation_Levy_Pattern);
                //db.AddInParameter(command, "@Levy_Frequency", DbType.Int32, ObjApp.Levy_Frequency);
                //db.AddInParameter(command, "@Is_OnTap_Refinance", DbType.Int32, ObjApp.Is_OnTap_Refinance);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }
        }

        public void FunPub_Insert_RepaymentDetails(S3GBusEntity.ApplicationProcess.RepaymentDetails ObjApp)
        {
            try
            {
                //  Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessRepayDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Repayment_CashFlow", DbType.Int32, ObjApp.Repayment_CashFlow);
                db.AddInParameter(command, "@Amount", DbType.Decimal, ObjApp.Amount);
                db.AddInParameter(command, "@Per_Instalment_Amount", DbType.Decimal, ObjApp.Per_Instalment_Amount);
                db.AddInParameter(command, "@Breakup_Percentage", DbType.Decimal, ObjApp.Breakup_Percentage);
                db.AddInParameter(command, "@From_Instalment", DbType.Decimal, ObjApp.From_Instalment);
                db.AddInParameter(command, "@To_Instalment", DbType.Decimal, ObjApp.To_Instalment);
                db.AddInParameter(command, "@From_Date", DbType.String, ObjApp.From_Date);
                db.AddInParameter(command, "@To_Date", DbType.String, ObjApp.To_Date);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }

        public void FunPub_Insert_GuarantorDetails(S3GBusEntity.ApplicationProcess.GuarantorDetails ObjApp)
        {
            try
            {
                //  Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessGuarantorDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Guarantee_ID", DbType.Int32, ObjApp.Guarantee_ID);
                db.AddInParameter(command, "@Guarantee_Amount", DbType.Int32, ObjApp.Guarantee_Amount);
                db.AddInParameter(command, "@Charge_Sequence", DbType.Int32, ObjApp.Charge_Sequence);
                db.AddInParameter(command, "@Guarantee_Type_ID", DbType.Int32, ObjApp.Guarantee_Type_ID);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }
        }

        public void FunPub_Insert_Alerts(S3GBusEntity.ApplicationProcess.AlertDetails ObjApp)
        {
            try
            {
                //   Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessAlertDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Alerts_Type", DbType.Int32, ObjApp.Alerts_Type);
                db.AddInParameter(command, "@Alerts_UserContact", DbType.Int32, ObjApp.Alerts_UserContact);
                db.AddInParameter(command, "@Alerts_SMS", DbType.Int32, ObjApp.Alerts_SMS);
                db.AddInParameter(command, "@Alerts_EMail", DbType.Int32, ObjApp.Alerts_EMail);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }

        public Int32 FunPub_Insert_Follow_Header(S3GBusEntity.ApplicationProcess.FollowUp_Header ObjApp)
        {
            try
            {
                Int32 Id;

                //   Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_Application_FollowUp_Header_Save");

                db.AddInParameter(command, "@Program_ID", DbType.Int32, ObjApp.Program_ID);
                db.AddInParameter(command, "@Program_PK_ID", DbType.Int32, ObjApp.Program_PK_ID);
                db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjApp.LOB_ID);
                db.AddInParameter(command, "@Branch_ID", DbType.Int32, ObjApp.Branch_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjApp.Company_ID);
                db.AddInParameter(command, "@Application_Number", DbType.Int32, ObjApp.Application_Number);
                //db.AddInParameter(command, "@Date", DbType.Int32, ObjApp.Date);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApp.Created_By);
                db.AddOutParameter(command, "@FollowID", DbType.Int32, ObjApp.Created_By);

                db.FunPubExecuteNonQuery(command, DBTrans);
                Id = Convert.ToInt32(command.Parameters["@FollowID"].Value);
                
                command.Parameters.Clear();

                return Id;
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }

        public void FunPub_Insert_Follow_Details(S3GBusEntity.ApplicationProcess.FollowUp_Detail ObjApp)
        {
            try
            {
               // Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessFollowUp_Detail_Save");

                db.AddInParameter(command, "@Follow_Up_ID", DbType.Int32, ObjApp.Follow_Up_ID);
                db.AddInParameter(command, "@From_UserID", DbType.Int32, ObjApp.From_UserID);
                db.AddInParameter(command, "@To_UserID", DbType.Int32, ObjApp.To_UserID);
                db.AddInParameter(command, "@Action", DbType.String, ObjApp.Action);
                db.AddInParameter(command, "@Date", DbType.String, ObjApp.Date);
                db.AddInParameter(command, "@Action_Date", DbType.String, ObjApp.Action_Date);
                db.AddInParameter(command, "@Customer_Response", DbType.String, ObjApp.Customer_Response);
                db.AddInParameter(command, "@Remarks", DbType.String, ObjApp.Remarks);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjApp.Created_By);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }

        public void FunPub_Insert_MoratoriumDetails(S3GBusEntity.ApplicationProcess.MoratoriumDetails ObjApp)
        {
            try
            {
               // Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessMoratoriumDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@Moratorium_Type", DbType.Int32, ObjApp.Moratorium_Type);
                db.AddInParameter(command, "@From_Date", DbType.String, ObjApp.From_Date);
                db.AddInParameter(command, "@To_Date", DbType.String, ObjApp.To_Date);

                db.FunPubExecuteNonQuery(command, DBTrans);

                command.Parameters.Clear();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }

        public void FunPub_Insert_OfferDetails_CashFlow(S3GBusEntity.ApplicationProcess.OfferDetails_CashFlow ObjApp, bool DoCommit)
        {
            try
            {
               // Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_ORG_ApplicationProcessOfferDetails_Save");

                db.AddInParameter(command, "@Application_Process_ID", DbType.Int32, ObjApp.Application_Process_ID);
                db.AddInParameter(command, "@CashFlow_ID", DbType.Int32, ObjApp.CashFlow_ID);
                db.AddInParameter(command, "@Date", DbType.String, ObjApp.Date);
                db.AddInParameter(command, "@Entity", DbType.Int32, ObjApp.Entity);
                db.AddInParameter(command, "@Amount", DbType.Int32, ObjApp.Amount);
                db.AddInParameter(command, "@InFlow_PayTo", DbType.Int32, ObjApp.InFlow_PayTo);

                db.FunPubExecuteNonQuery(command, DBTrans);
                command.Parameters.Clear();

                if (DoCommit)
                    Commit();
            }
            catch (Exception ex)
            {
                RollBack();
                throw ex;
            }

        }
        
         */



    }

}
