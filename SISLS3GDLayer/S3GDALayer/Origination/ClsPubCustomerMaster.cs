#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Customer Master
/// Created By			: Narayanan
/// Created Date		: 28-05-2010
/// <Program Summary>
#endregion

using System;using S3GDALayer.S3GAdminServices;
using System.IO;
using System.Data;
using System.Text;
using S3GBusEntity;
using System.Data.Common;
using System.Xml.Serialization;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Runtime.Serialization.Formatters.Binary;
using System.Data.OracleClient;

namespace S3GDALayer.Origination
{
    namespace OrgMasterMgtServices
    {
        public class ClsPubCustomerMaster
        {
            int intRowsAffected;
            string strConnectionString = "S3GConnectionString";
            string strStatusLookUp = SPNames.S3G_ORG_GetCustomerLookUp;
            string strCustomerInsertUpDate = SPNames.S3G_ORG_CustomerInsertUpDate;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubCustomerMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            /// <summary>
            /// This method to get common query result
            /// </summary>
            /// <param name="ObjParam">Pass Parameter Objects</param>
            /// <returns>Should object is Datatable</returns>
            public DataTable FunPub_GetS3GStatusLookUp(S3G_Status_Parameters ObjParam)
            {
                try
                {
                    DataSet ObjDS = new DataSet();
                    //Database db = DatabaseFactory.CreateDatabase(strConnectionString);
                    DbCommand command = db.GetStoredProcCommand(strStatusLookUp);

                    db.AddInParameter(command, "@Option", DbType.Int32, ObjParam.Option);
                    db.AddInParameter(command, "@Param1", DbType.String, ObjParam.Param1);
                    db.AddInParameter(command, "@Param2", DbType.String, ObjParam.Param2);
                    db.AddInParameter(command, "@Param3", DbType.String, ObjParam.Param3);
                    db.AddInParameter(command, "@Param4", DbType.String, ObjParam.Param4);
                    db.AddInParameter(command, "@Param5", DbType.String, ObjParam.Param5);

                    db.FunPubLoadDataSet(command, ObjDS, strStatusLookUp);
                    return (DataTable)ObjDS.Tables[strStatusLookUp];

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            /// <summary>
            /// To Insert Record into Customer Master
            /// </summary>
            /// <param name="SMode">Pass Serialization Mode</param>
            /// <param name="byteEnquiryService">Pass byte Object</param>
            public int FunPubCreateCustomerInt(CustomerMasterBusEntity ObjCustomerMaster, out string strCustomerCodeOut)
            {
                string strCustomerCode = "";
                try
                {
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    //Database db = DatabaseFactory.CreateDatabase(strConnectionString);
                    DbCommand command = db.GetStoredProcCommand(strCustomerInsertUpDate);

                    db.AddOutParameter(command, "@ID", DbType.Int64, sizeof(Int64));
                    db.AddOutParameter(command, "@CustomerCode", DbType.String, 200);
                    db.AddInParameter(command, "@CustomerType_ID", DbType.String, ObjCustomerMaster.CustomerType_ID);
                    db.AddInParameter(command, "@GROUP_ID", DbType.Int64, ObjCustomerMaster.GROUP_ID);
                    db.AddInParameter(command, "@GroupCode", DbType.String, ObjCustomerMaster.GroupCode);
                    db.AddInParameter(command, "@Groupname", DbType.String, ObjCustomerMaster.Groupname);
                    db.AddInParameter(command, "@IndustryCode", DbType.String, ObjCustomerMaster.IndustryCode);
                    db.AddInParameter(command, "@IndustryName", DbType.String, ObjCustomerMaster.IndustryName);
                    db.AddInParameter(command, "@SubIndustry", DbType.String, ObjCustomerMaster.SubIndustryCode);//SubIndustry
                    db.AddInParameter(command, "@SubIndustryName", DbType.String, ObjCustomerMaster.SubIndustryName);//SubIndustryName
                    db.AddInParameter(command, "@Constitution_ID", DbType.String, ObjCustomerMaster.Constitution_ID);
                    db.AddInParameter(command, "@Title", DbType.String, ObjCustomerMaster.Title);
                    db.AddInParameter(command, "@CustomerName", DbType.String, ObjCustomerMaster.CustomerName);
                    db.AddInParameter(command, "@CustomerPostingGroupCode_ID", DbType.String, ObjCustomerMaster.CustomerPostingGroupCode_ID);
                    //db.AddInParameter(command, "@Comm_Address1", DbType.String, ObjCustomerMaster.Comm_Address1);
                    //db.AddInParameter(command, "@Comm_Address2", DbType.String, ObjCustomerMaster.Comm_Address2);
                    //db.AddInParameter(command, "@Comm_City", DbType.String, ObjCustomerMaster.Comm_City);
                    //db.AddInParameter(command, "@Comm_State", DbType.String, ObjCustomerMaster.Comm_State);
                    //db.AddInParameter(command, "@Comm_Country", DbType.String, ObjCustomerMaster.Comm_Country);
                    //db.AddInParameter(command, "@Comm_PINCode", DbType.String, ObjCustomerMaster.Comm_PINCode);
                    //db.AddInParameter(command, "@Comm_Mobile", DbType.String, ObjCustomerMaster.Comm_Mobile);
                    //db.AddInParameter(command, "@Comm_Telephone", DbType.String, ObjCustomerMaster.Comm_Telephone);
                    //db.AddInParameter(command, "@Comm_Email", DbType.String, ObjCustomerMaster.Comm_Email);
                    //db.AddInParameter(command, "@Comm_Website", DbType.String, ObjCustomerMaster.Comm_Website);
                    //db.AddInParameter(command, "@Perm_Address1", DbType.String, ObjCustomerMaster.Perm_Address1);
                    //db.AddInParameter(command, "@Perm_Address2", DbType.String, ObjCustomerMaster.Perm_Address2);
                    //db.AddInParameter(command, "@Perm_City", DbType.String, ObjCustomerMaster.Perm_City);
                    //db.AddInParameter(command, "@Perm_State", DbType.String, ObjCustomerMaster.Perm_State);
                    //db.AddInParameter(command, "@Perm_Country", DbType.String, ObjCustomerMaster.Perm_Country);
                    //db.AddInParameter(command, "@Perm_PINCode", DbType.String, ObjCustomerMaster.Perm_PINCode);
                    //db.AddInParameter(command, "@Perm_Mobile", DbType.String, ObjCustomerMaster.Perm_Mobile);
                    //db.AddInParameter(command, "@Perm_Telephone", DbType.String, ObjCustomerMaster.Perm_Telephone);
                    //db.AddInParameter(command, "@Perm_Email", DbType.String, ObjCustomerMaster.Perm_Email);
                    //db.AddInParameter(command, "@Perm_Website", DbType.String, ObjCustomerMaster.Perm_Website);
                    db.AddInParameter(command, "@Customer_ID", DbType.Int64, ObjCustomerMaster.ID);
                    // Added By R. Manikandan to Bring Customer Code as User Enterable
                    db.AddInParameter(command, "@Customer_Code", DbType.String, ObjCustomerMaster.CustomerCode);
                    // Added End
                    if (ObjCustomerMaster.Gender != "-1")
                    {
                        db.AddInParameter(command, "@Gender", DbType.String, ObjCustomerMaster.Gender);
                    }

                    if (!(Convert.ToString(ObjCustomerMaster.DateofBirth).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@DateofBirth", DbType.DateTime, ObjCustomerMaster.DateofBirth);
                    }
                    db.AddInParameter(command, "@MaritalStatus_ID", DbType.String, ObjCustomerMaster.MaritalStatus_ID);
                    db.AddInParameter(command, "@Qualification", DbType.String, ObjCustomerMaster.Qualification);
                    db.AddInParameter(command, "@Profession", DbType.String, ObjCustomerMaster.Profession);
                    db.AddInParameter(command, "@SpouseName", DbType.String, ObjCustomerMaster.SpouseName);
                    db.AddInParameter(command, "@Children", DbType.Decimal, ObjCustomerMaster.Children);
                    db.AddInParameter(command, "@TotalDependents", DbType.Decimal, ObjCustomerMaster.TotalDependents);
                    if (!(Convert.ToString(ObjCustomerMaster.WeddingAnniversaryDate).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@WeddingAnniversaryDate", DbType.DateTime, ObjCustomerMaster.WeddingAnniversaryDate);
                    }
                    if (ObjCustomerMaster.HouseORFlat_ID > 0)
                    {
                        db.AddInParameter(command, "@HouseORFlat_ID", DbType.String, ObjCustomerMaster.HouseORFlat_ID);
                    }
                    db.AddInParameter(command, "@TAX_Applicable", DbType.String, ObjCustomerMaster.Cust_Tax_App);
                    db.AddInParameter(command, "@Cust_VAT_TIN", DbType.String, ObjCustomerMaster.Cust_VAT_TIN);

                    db.AddInParameter(command, "@ISOwn", DbType.Int16, ObjCustomerMaster.ISOwn);
                    db.AddInParameter(command, "@CurrentMarketValue", DbType.String, ObjCustomerMaster.CurrentMarketValue);
                    db.AddInParameter(command, "@RemainingLoanValue", DbType.String, ObjCustomerMaster.RemainingLoanValue);
                    db.AddInParameter(command, "@TotalNetMorth", DbType.String, ObjCustomerMaster.TotalNetMorth);
                    db.AddInParameter(command, "@PublicCloselyheld_ID", DbType.String, ObjCustomerMaster.PublicCloselyheld_ID);
                    db.AddInParameter(command, "@NoOfDirectors", DbType.Decimal, ObjCustomerMaster.NoOfDirectors);
                    db.AddInParameter(command, "@ListedAtStockExchange", DbType.String, ObjCustomerMaster.ListedAtStockExchange);
                    db.AddInParameter(command, "@PaidupCapital", DbType.Decimal, ObjCustomerMaster.PaidupCapital);
                    db.AddInParameter(command, "@FaceValueofShares", DbType.Decimal, ObjCustomerMaster.FaceValueofShares);
                    db.AddInParameter(command, "@BookValueofShares", DbType.Decimal, ObjCustomerMaster.BookValueofShares);
                    db.AddInParameter(command, "@BusinessProfile", DbType.String, ObjCustomerMaster.BusinessProfile);
                    db.AddInParameter(command, "@Geographicalcoverage", DbType.String, ObjCustomerMaster.Geographicalcoverage);
                    db.AddInParameter(command, "@NoOfBranches", DbType.Decimal, ObjCustomerMaster.NoOfBranches);
                    db.AddInParameter(command, "@GovInstParticipation_ID", DbType.String, ObjCustomerMaster.GovernmentInstitutionalParticipation_ID);
                    db.AddInParameter(command, "@PercentageOfStake", DbType.Decimal, ObjCustomerMaster.PercentageOfStake);
                    db.AddInParameter(command, "@JVPartnerName", DbType.String, ObjCustomerMaster.JVPartnerName);
                    db.AddInParameter(command, "@JVPartnerStake", DbType.Decimal, ObjCustomerMaster.JVPartnerStake);
                    db.AddInParameter(command, "@CEOName", DbType.String, ObjCustomerMaster.CEOName);
                    db.AddInParameter(command, "@CEOAge", DbType.Decimal, ObjCustomerMaster.CEOAge);
                    db.AddInParameter(command, "@CEOExperienceInYears", DbType.Decimal, ObjCustomerMaster.CEOExperienceInYears);
                    // Added By R. MANIKANDAN
                    // To Bring CR Expr Date
                    if(! string.IsNullOrEmpty( ObjCustomerMaster.ExprDate))
                        db.AddInParameter(command, "@EXPR_DATE", DbType.String, ObjCustomerMaster.ExprDate);
                    if (!(Convert.ToString(ObjCustomerMaster.CEOWeddingDate).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@CEOWeddingDate", DbType.DateTime, ObjCustomerMaster.CEOWeddingDate);
                    }
                    //db.AddInParameter(command, "@ResidentialAddress", DbType.String, ObjCustomerMaster.ResidentialAddress);

                    //Modified By  :  Thanagm M
                    //Reason       :  To add multiple Bank Details   

                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlBankDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlBankDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlBankDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlBankDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlBankDetails", DbType.String, ObjCustomerMaster.XmlBankDetails);
                    }
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlSubLimitDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLSubLimitDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlSubLimitDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlSubLimitDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    db.AddInParameter(command, "@LOB_ID", DbType.String, ObjCustomerMaster.LOB_ID);
                    db.AddInParameter(command, "@Type_ID", DbType.String, ObjCustomerMaster.Type_ID);
                    if (!(Convert.ToString(ObjCustomerMaster.Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Date", DbType.DateTime, ObjCustomerMaster.Date);
                    }
                    db.AddInParameter(command, "@Reason", DbType.String, ObjCustomerMaster.Reason);
                    if (!(Convert.ToString(ObjCustomerMaster.ReleaseDate).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@ReleaseDate", DbType.DateTime, ObjCustomerMaster.ReleaseDate);
                    }
                    if (!(Convert.ToString(ObjCustomerMaster.ValidUpto).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@ValidUpto", DbType.DateTime, ObjCustomerMaster.ValidUpto);
                    }
                    db.AddInParameter(command, "@Created_By", DbType.String, ObjCustomerMaster.Created_By);
                    db.AddInParameter(command, "@Modified_By", DbType.String, ObjCustomerMaster.Modified_By);
                    db.AddInParameter(command, "@Company_ID", DbType.String, ObjCustomerMaster.Company_ID);
                    //Modified By  :  Saranya I
                    //Reason       :  To add Relation Type   
                    db.AddInParameter(command, "@Customer", DbType.Boolean, ObjCustomerMaster.Customer);
                    db.AddInParameter(command, "@Guarantor1", DbType.Boolean, ObjCustomerMaster.Guarantor1);
                    db.AddInParameter(command, "@Guarantor2", DbType.Boolean, ObjCustomerMaster.Guarantor2);
                    db.AddInParameter(command, "@CoApplicant", DbType.Boolean, ObjCustomerMaster.CoApplicant);
                    //end

                    //BCA Changes - Kuppu - Aug-17-2012 -- Starts
                    db.AddInParameter(command, "@Family_Name", DbType.String, ObjCustomerMaster.Family_Name);
                    db.AddInParameter(command, "@Notes", DbType.String, ObjCustomerMaster.Notes);
                    //Ends

                    //BDO Changes - Thangam M - 03-Oct-2012 -- Starts
                    db.AddInParameter(command, "@CreditType", DbType.Int32, ObjCustomerMaster.CreditType);
                    //End here
                    //BDO Changes - Thangam M - 03-Oct-2012 -- Starts
                    db.AddInParameter(command, "@BlockListed", DbType.Boolean, ObjCustomerMaster.IS_BlockListed);
                    //End here

                    ////BW changes - Saran - 24-Jul-2013 Start
                    if (ObjCustomerMaster.Stock_Stmt_Frequency != null)
                    {
                        if (ObjCustomerMaster.Stock_Stmt_Frequency > 0)
                            db.AddInParameter(command, "@Stock_Stmt_Frequency", DbType.Int32, ObjCustomerMaster.Stock_Stmt_Frequency);
                    }
                    if (ObjCustomerMaster.Is_BW != null)
                    {
                        if (ObjCustomerMaster.Is_BW > 0)
                            db.AddInParameter(command, "@Is_BW", DbType.Int32, ObjCustomerMaster.Is_BW);
                    }
                    //BW changes - Saran - 24-Jul-2013 End 


                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlConstitutionalDocuments))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlConstitutionalDocuments",
                                 OracleType.Clob, ObjCustomerMaster.XmlConstitutionalDocuments.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlConstitutionalDocuments);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlConstitutionalDocuments", DbType.String, ObjCustomerMaster.XmlConstitutionalDocuments);
                    }

                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlTrackDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlTrackDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlTrackDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlTrackDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlTrackDetails", DbType.String, ObjCustomerMaster.XmlTrackDetails);
                    }

                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlCreditDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlCreditDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlCreditDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlCreditDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlCreditDetails", DbType.String, ObjCustomerMaster.XmlCreditDetails);
                    }


                    //Code Added By Ganapathy on 13-Nov-2013 BEGINS

                    if (ObjCustomerMaster.Enquiry_ID != null)
                    {
                        if (ObjCustomerMaster.Enquiry_ID > 0)
                        {
                            db.AddInParameter(command, "@Enquiry_ID", DbType.Int32, ObjCustomerMaster.Enquiry_ID);
                        }
                    }

                    //Code Added By Ganapathy on 13-Nov-2013 ENDS
                    //Created By : Anbuvel.T Date : 18-MAY-2018, Description : MFC Customer Master Achanges Done.
                    db.AddInParameter(command, "@Customer_Group", DbType.Boolean, ObjCustomerMaster.Customer_Group);
                    db.AddInParameter(command, "@Nationality", DbType.Int32, ObjCustomerMaster.Nationality);
                    db.AddInParameter(command, "@CUSTOMER_NAME1", DbType.String, ObjCustomerMaster.CUSTOMER_NAME1);
                    db.AddInParameter(command, "@CUSTOMER_NAME2", DbType.String, ObjCustomerMaster.CUSTOMER_NAME2);
                    db.AddInParameter(command, "@CUSTOMER_NAME3", DbType.String, ObjCustomerMaster.CUSTOMER_NAME3);
                    db.AddInParameter(command, "@CUSTOMER_NAME4", DbType.String, ObjCustomerMaster.CUSTOMER_NAME4);
                    db.AddInParameter(command, "@CUSTOMER_NAME5", DbType.String, ObjCustomerMaster.CUSTOMER_NAME5);
                    db.AddInParameter(command, "@CUSTOMER_NAME6", DbType.String, ObjCustomerMaster.CUSTOMER_NAME6);
                    db.AddInParameter(command, "@Customer_Branch", DbType.Int32, ObjCustomerMaster.Customer_Branch);
                    db.AddInParameter(command, "@Passport_Number", DbType.String, ObjCustomerMaster.Passport_Number);
                    if (!(Convert.ToString(ObjCustomerMaster.Passport_Issue_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Passport_Issue_Date", DbType.DateTime, ObjCustomerMaster.Passport_Issue_Date);
                    }
                    if (!(Convert.ToString(ObjCustomerMaster.Passport_Exp_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Passport_Exp_Date", DbType.DateTime, ObjCustomerMaster.Passport_Exp_Date);
                    }
                    db.AddInParameter(command, "@TOTAL_DEPENDENTS", DbType.Int32, ObjCustomerMaster.TOTAL_DEPENDENTS);
                    db.AddInParameter(command, "@Visa_Number", DbType.String, ObjCustomerMaster.Visa_Number);
                    db.AddInParameter(command, "@Labour_Card_No", DbType.String, ObjCustomerMaster.Labour_Card_No);
                    if (!(Convert.ToString(ObjCustomerMaster.Labour_Card_Issue_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Labour_Card_Issue_Date", DbType.DateTime, ObjCustomerMaster.Labour_Card_Issue_Date);
                    }
                    if (!(Convert.ToString(ObjCustomerMaster.Labour_Card_Exp_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Labour_Card_Exp_Date", DbType.DateTime, ObjCustomerMaster.Labour_Card_Exp_Date);
                    }
                    db.AddInParameter(command, "@Occupation", DbType.Int32, ObjCustomerMaster.Occupation);
                    db.AddInParameter(command, "@MFC_Employee_Indi", DbType.Int32, ObjCustomerMaster.MFC_Employee_Indi);
                    db.AddInParameter(command, "@MFC_Employee_ID", DbType.Int32, ObjCustomerMaster.MFC_Employee_ID);
                    db.AddInParameter(command, "@Employer_Name", DbType.Int32, ObjCustomerMaster.Employer_Name);
                    db.AddInParameter(command, "@Employer_Eco_Act_Code", DbType.Int32, ObjCustomerMaster.Employer_Eco_Act_Code);
                    db.AddInParameter(command, "@Employee_Code", DbType.String, ObjCustomerMaster.Employee_Code);
                    db.AddInParameter(command, "@Department_Name", DbType.String, ObjCustomerMaster.Department_Name);
                    db.AddInParameter(command, "@Designation", DbType.String, ObjCustomerMaster.Designation);
                    db.AddInParameter(command, "@Place_of_Work", DbType.String, ObjCustomerMaster.Place_of_Work);
                    if (!(Convert.ToString(ObjCustomerMaster.Date_Of_Join).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Date_Of_Join", DbType.DateTime, ObjCustomerMaster.Date_Of_Join);
                    }
                    db.AddInParameter(command, "@Monthily_Income", DbType.Decimal, ObjCustomerMaster.Monthily_Income);
                    db.AddInParameter(command, "@VIP_Customer", DbType.Decimal, ObjCustomerMaster.VIP_Customer);
                    db.AddInParameter(command, "@Financial_required", DbType.Decimal, ObjCustomerMaster.Financial_required);
                    db.AddInParameter(command, "@Financial_received", DbType.Int32, ObjCustomerMaster.Financial_received);
                    if (!(Convert.ToString(ObjCustomerMaster.OCCI_Issue_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@OCCI_Issue_Date", DbType.DateTime, ObjCustomerMaster.OCCI_Issue_Date);
                    }
                    if (!(Convert.ToString(ObjCustomerMaster.OCCI_Exp_Date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@OCCI_Exp_Date", DbType.DateTime, ObjCustomerMaster.OCCI_Exp_Date);
                    }
                    db.AddInParameter(command, "@Fac_Applicable", DbType.Int32, ObjCustomerMaster.Fac_Applicable);                    
                    db.AddInParameter(command, "@Fac_Type", DbType.Int32, ObjCustomerMaster.Fac_Type);
                    db.AddInParameter(command, "@Fac_Limit", DbType.Decimal, ObjCustomerMaster.Fac_Limit);
                    db.AddInParameter(command, "@Covenants_Applicable", DbType.Int32, ObjCustomerMaster.Covenants_Applicable);
                    db.AddInParameter(command, "@Covenants_Clause", DbType.String, ObjCustomerMaster.Covenants_Clause);
                    db.AddInParameter(command, "@Assignment_Collection", DbType.Decimal, ObjCustomerMaster.Assignment_Collection);
                    if (!(Convert.ToString(ObjCustomerMaster.Fact_Limit_Exp_date).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Fact_Limit_Exp_date", DbType.DateTime, ObjCustomerMaster.Fact_Limit_Exp_date);
                    }
                    db.AddInParameter(command, "@Customer_Industry", DbType.Int32, ObjCustomerMaster.Customer_Industry);
                    db.AddInParameter(command, "@Seni_Mem_Applicable", DbType.Int32, ObjCustomerMaster.Seni_Mem_Applicable);
                    db.AddInParameter(command, "@Seni_Mem_Status", DbType.Int32, ObjCustomerMaster.Seni_Mem_Applicable);
                    db.AddInParameter(command, "@Seni_Mem_Rela_Indi", DbType.Int32, ObjCustomerMaster.Seni_Mem_Applicable);
                    db.AddInParameter(command, "@Max_Lend_Amount", DbType.Decimal, ObjCustomerMaster.Max_Lend_Amount);
                    db.AddInParameter(command, "@Related_Parti_Indi", DbType.Int32, ObjCustomerMaster.Related_Parti_Indi);
                    if (!(Convert.ToString(ObjCustomerMaster.Max_Lend_Limit_Exp).Contains("1/1/0001")))
                    {
                        db.AddInParameter(command, "@Max_Lend_Limit_Exp", DbType.DateTime, ObjCustomerMaster.Max_Lend_Limit_Exp);
                    }
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlShareDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlShareDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlShareDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlShareDetails);
                            command.Parameters.Add(param);
                        }
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlAddressDetails))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlAddressDetails",
                                 OracleType.Clob, ObjCustomerMaster.XmlAddressDetails.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlAddressDetails);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlShareDetails", DbType.String, ObjCustomerMaster.XmlShareDetails);
                    }
                    //Created By : Anbuvel.T Date : 11-SEP-2018, Description : MFC Customer Master changes Done.
                    db.AddInParameter(command, "@NID_CR_RID_Number", DbType.String, ObjCustomerMaster.NID_CR_RID_Number);
                    db.AddInParameter(command, "@NID_CR_RID_ISSUE_DATE", DbType.DateTime, ObjCustomerMaster.NID_CR_RID_Issue_Date);
                    db.AddInParameter(command, "@NID_CR_RID_EXP_DATE", DbType.DateTime, ObjCustomerMaster.NID_CR_RID_Exp_Date);
                    db.AddInParameter(command, "@DRIVING_LIC_NUMBER", DbType.String, ObjCustomerMaster.Driving_Lic_Number);
                    db.AddInParameter(command, "@BUSINESS_FIRM_NAME", DbType.String, ObjCustomerMaster.Business_Firm_Name);
                    db.AddInParameter(command, "@EMPLOYER_CR_NUMBER", DbType.String, ObjCustomerMaster.Employer_CR_Number);
                    db.AddInParameter(command, "@NRID_NUMBER", DbType.String, ObjCustomerMaster.NRID_Number);
                    db.AddInParameter(command, "@ANNUAL_SALE", DbType.Decimal, ObjCustomerMaster.Annual_Sale);
                    db.AddInParameter(command, "@TOTAL_ASSET", DbType.Decimal, ObjCustomerMaster.Total_Asset);
                    db.AddInParameter(command, "@KEY_DECI_MAKER", DbType.String, ObjCustomerMaster.Key_deci_Maker);
                    db.AddInParameter(command, "@BUSINESS_ACTIVITY", DbType.String, ObjCustomerMaster.Business_Activity);
                    db.AddInParameter(command, "@AUDITOR_NAME", DbType.String, ObjCustomerMaster.Auditor_Name);
                    db.AddInParameter(command, "@NON_MOCI", DbType.Decimal, ObjCustomerMaster.Non_MOCI);
                    db.AddInParameter(command, "@SME_INDICATOR", DbType.Int32, ObjCustomerMaster.SME_Indicator);
                    db.AddInParameter(command, "@SENI_MEM_PROFESSION", DbType.Int32, ObjCustomerMaster.Seni_Mem_Profession);
                    db.AddInParameter(command, "@LAND_COLLATERAL", DbType.String, ObjCustomerMaster.Land_Collateral);
                    db.AddInParameter(command, "@OTHER_EMPLOYER_NAME", DbType.String, ObjCustomerMaster.Other_Employer_Name);
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        if (!string.IsNullOrEmpty(ObjCustomerMaster.XmlAdditionalInfo))
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XmlAdditionalInfo",
                                 OracleType.Clob, ObjCustomerMaster.XmlAdditionalInfo.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                  DataRowVersion.Default, ObjCustomerMaster.XmlAdditionalInfo);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlAdditionalInfo", DbType.String, ObjCustomerMaster.XmlAdditionalInfo);
                    }
                    db.AddInParameter(command, "@IS_SME_FORCED", DbType.Int32, ObjCustomerMaster.IS_SME_FORCED);
                    db.AddInParameter(command, "@Mode", DbType.String, ObjCustomerMaster.Mode);
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
                                if (ObjCustomerMaster.Mode.ToUpper() == "INSERT")
                                {
                                    strCustomerCode = Convert.ToString(command.Parameters["@ID"].Value) + "~" + (string)command.Parameters["@CustomerCode"].Value;
                                }
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intRowsAffected == 0)
                                intRowsAffected = 50;
                            //trans.Rollback();
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
                strCustomerCodeOut = strCustomerCode;
                return intRowsAffected;
            }


        }
    }
}

