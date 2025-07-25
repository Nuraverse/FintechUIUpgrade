using System;using S3GDALayer.S3GAdminServices;
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
namespace S3GDALayer.LoanAdmin
{
    namespace ContractMgtServices
    {
        public class ClsPubPreMatureClosure
        {
            int intRowsAffected;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDataTable objAccountClosure_DAL;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsDataTable objClosureDetails_DAL;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureRow objAccountClosureRow;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsRow objClosureDetailsRow;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureDataTable objCancelClaosure_DAL;
            S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureRow objClosureRow;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubPreMatureClosure()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            /// <summary>
            /// To get PANum , SANum Related Account Details
            /// </summary>
            /// <param name="Asset_Verification_No">Pass PAN, SAN</param>
            /// <returns></returns>

            public DataSet FunGetAccountDetailsForClosure(string strPANum, string strSANum)
            {
                try
                {
                    DataSet ObjDS = new DataSet();
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    string[] strTables = { "dtTable", "dtTable1" };

                    DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_GetAccountDetailsForClosure");
                    db.AddInParameter(command, "@PANum", DbType.String, strPANum);
                    db.AddInParameter(command, "@SANum", DbType.String, strSANum);
                    db.FunPubLoadDataSet(command, ObjDS, "strTables");
                    return (DataSet)ObjDS;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }


            /// <summary>
            /// Inserting the Account Closure
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>

            public int FunPubCreateAccountClosure(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_AccountClosure_DataTable, out string strAccClosureNo, out int intClosureDetailId)
            {
                strAccClosureNo = "";
                intClosureDetailId = 0;
                int intErrorCode = 0;
                try
                {

                    objAccountClosure_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_AccountClosure_DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDataTable));
                    //objClosureDetails_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_AccountClosure_DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsDataTable));


                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureRow objAccountClosureRow in objAccountClosure_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertPreMatureClosure");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objAccountClosureRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.Int32, objAccountClosureRow.LOB_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objAccountClosureRow.Branch_ID);
                        db.AddInParameter(command, "@Closure_No", DbType.String, objAccountClosureRow.Closure_No);
                        db.AddInParameter(command, "@PANum", DbType.String, objAccountClosureRow.PANum);
                        db.AddInParameter(command, "@SANum", DbType.String, objAccountClosureRow.SANum);
                        db.AddInParameter(command, "@Customer_ID", DbType.Int32, objAccountClosureRow.Customer_ID);
                        db.AddInParameter(command, "@Closure_Date", DbType.DateTime, objAccountClosureRow.Closure_Date);
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, objAccountClosureRow.Created_By);
                        db.AddInParameter(command, "@ClsoureAmount", DbType.Decimal, objAccountClosureRow.Closure_Amount);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objAccountClosureRow.User_ID);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLParamAccountClosureDet",
                                   OracleType.Clob, objAccountClosureRow.XMLAccountClosureDetails.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, objAccountClosureRow.XMLAccountClosureDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLParamAccountClosureDet", DbType.String, objAccountClosureRow.XMLAccountClosureDetails);
                        }                        
                        //Added By Chandru K On 24-Sep-2013 For ISFC
                        //db.AddInParameter(command, "@WriteOff", DbType.Boolean, objAccountClosureRow.WriteOff);
                        //db.AddInParameter(command, "@WriteOff_Amount", DbType.Decimal, objAccountClosureRow.WriteOff_Amount);
                        //db.AddInParameter(command, "@Remarks", DbType.String, objAccountClosureRow.Remarks);
                        //End

                        // Added By R. Manikandan Reason for Closure and Writte off 26 - Dec - 2014
                        if (!objAccountClosureRow.IsClosureReasonNull())
                        {
                            db.AddInParameter(command, "@ClosureReason", DbType.Int32, objAccountClosureRow.ClosureReason);
                        }
                        if (!objAccountClosureRow.IsWriteOffReasonNull())
                        {
                            db.AddInParameter(command, "@WritteOffReason", DbType.Int32, objAccountClosureRow.WriteOffReason);
                        }
                        // End of R. Manikandan 
                        // End of R. Manikandan 
                        db.AddInParameter(command, "@Closure_Type", DbType.Int32, objAccountClosureRow.Closure_Type);
                        db.AddInParameter(command, "@Validity_Till_Date", DbType.DateTime, objAccountClosureRow.Validity_Till_Date);
                        if (!objAccountClosureRow.IsDiscount_RateNull())
                        {
                            db.AddInParameter(command, "@Discount_Rate", DbType.Decimal, objAccountClosureRow.Discount_Rate);
                        }
                        db.AddInParameter(command, "@WriteOff", DbType.Byte, objAccountClosureRow.WriteOff);
                        //db.AddInParameter(command, "@Funds_in_Use", DbType.Int32, objAccountClosureRow.Funds_in_Use);
                        db.AddInParameter(command, "@Notice_Period_in_Months", DbType.Int32, objAccountClosureRow.Notice_Period_in_Months);
                        db.AddInParameter(command, "@ODI_Debit_Rate", DbType.Decimal, objAccountClosureRow.ODI_Debit_Rate);
                        db.AddInParameter(command, "@ODI_Credit_Rate", DbType.Decimal, objAccountClosureRow.ODI_Credit_Rate);
                        db.AddInParameter(command, "@ODI_Grace_Days_Debit", DbType.Int32, objAccountClosureRow.ODI_Grace_Days_Debit);
                        db.AddInParameter(command, "@ODI_Grace_Days_Credit", DbType.Int32, objAccountClosureRow.ODI_Grace_Days_Credit);
                        db.AddInParameter(command, "@Ignored_Last_Chq", DbType.Int32, objAccountClosureRow.Ignored_Last_Chq);
                        db.AddInParameter(command, "@ODI_Basis", DbType.Int32, objAccountClosureRow.ODI_Basis);
                        db.AddOutParameter(command, "@DSNO", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@Closure_Details_ID", DbType.Int32, sizeof(Int64));

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
                                    trans.Rollback();

                                }
                                else
                                {
                                    trans.Commit();
                                    strAccClosureNo = (string)command.Parameters["@DSNO"].Value;
                                    intClosureDetailId = (Int32)command.Parameters["@Closure_Details_ID"].Value;
                                    
                                }

                            }
                            catch (Exception ex)
                            {
                                trans.Rollback();
                                if (intErrorCode == 0)
                                    intRowsAffected = 50;
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

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


            /// <summary>
            /// Inserting the Account Closure
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>

            public int FunPubCreateAccountClosureDetails(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_AccountClosure_DataTable)
            {
                try
                {

                    objClosureDetails_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_AccountClosure_DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_AccountClosureDetailsRow objAccountClosureRow in objClosureDetails_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_InsertPreMatureClosureDetails");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objAccountClosureRow.Company_ID);
                        db.AddInParameter(command, "@PANum", DbType.String, objAccountClosureRow.PANum);
                        db.AddInParameter(command, "@SANum", DbType.String, objAccountClosureRow.SANum);
                        db.AddInParameter(command, "@Closure_Type_Code", DbType.Int32, objAccountClosureRow.Closure_Type_Code);
                        db.AddInParameter(command, "@Closure_Type", DbType.Int32, objAccountClosureRow.Closure_Type);
                        db.AddInParameter(command, "@Cashflow", DbType.Decimal, objAccountClosureRow.Cashflow_Component);
                        db.AddInParameter(command, "@ClosureRate", DbType.Decimal, objAccountClosureRow.Closure_Rate);
                        db.AddInParameter(command, "@PayableAmt", DbType.Decimal, objAccountClosureRow.Payable_Amount);
                        db.AddInParameter(command, "@ReceivedAmt", DbType.Decimal, objAccountClosureRow.Received_Amount);
                        db.AddInParameter(command, "@ClosureStatusType", DbType.Int32, objAccountClosureRow.Closure_Status_Type_Code);
                        db.AddInParameter(command, "@ClosureStatusCode", DbType.Int32, objAccountClosureRow.Closure_Status_Code);
                        db.AddInParameter(command, "@WaivedAmt", DbType.Decimal, objAccountClosureRow.Waived_Amount);
                        db.AddInParameter(command, "@ClosureAmt", DbType.Decimal, objAccountClosureRow.Closure_Amount);
                        db.AddInParameter(command, "@Closure_Date", DbType.DateTime, objAccountClosureRow.Closure_Date);
                        db.AddInParameter(command, "@Remarks", DbType.String, objAccountClosureRow.Remarks);
                        db.AddInParameter(command, "@Closure_ID", DbType.String, objAccountClosureRow.Closure_ID);

                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
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

            /// <summary>
            /// To Cancel the account closure 
            /// </summary>
            /// <param name="Asset_Verification_No">Pass vendor ID</param>
            /// <returns></returns>

            public int FunPubCancelAccountClosure(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_CancelClosure_DataTable)
            {
                try
                {

                    objCancelClaosure_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_CancelClosure_DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureRow objAccountClosureRow in objCancelClaosure_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_CancelClosure");
                        db.AddInParameter(command, "@ClosureNo", DbType.String, objAccountClosureRow.Closure_No);
                        db.AddInParameter(command, "@PANum", DbType.String, objAccountClosureRow.PANum);
                        db.AddInParameter(command, "@SANum", DbType.String, objAccountClosureRow.SANum);
                        db.AddInParameter(command, "@Closure_Type", DbType.String, objAccountClosureRow.Closure_Type);
                        db.AddInParameter(command, "@Company_ID", DbType.String, objAccountClosureRow.Company_ID);
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objAccountClosureRow.User_Id);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
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
            /// <summary>
            /// To Cancel the PMC closure 
            /// </summary>
            /// <param name="Asset_Verification_No">Pass vendor ID</param>
            /// <returns></returns>
            public int FunPubCancelPMCClosure(SerializationMode SerMode, byte[] bytesObjS3G_LOANAD_CancelClosure_DataTable, out string strErrorMsg)
            {
                strErrorMsg = "";
                try
                {

                    objCancelClaosure_DAL = (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_LOANAD_CancelClosure_DataTable, SerMode, typeof(S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (S3GBusEntity.LoanAdmin.ContractMgtServices.S3G_LOANAD_CancelClosureRow objAccountClosureRow in objCancelClaosure_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_LOANAD_CancelClosure");
                        db.AddInParameter(command, "@ClosureNo", DbType.String, objAccountClosureRow.Closure_No);
                        db.AddInParameter(command, "@PANum", DbType.String, objAccountClosureRow.PANum);
                        db.AddInParameter(command, "@SANum", DbType.String, objAccountClosureRow.SANum);
                        db.AddInParameter(command, "@Closure_Type", DbType.String, objAccountClosureRow.Closure_Type);
                        db.AddInParameter(command, "@Company_ID", DbType.String, objAccountClosureRow.Company_ID);
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objAccountClosureRow.User_Id);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@ErrorMsg", DbType.String, 500);

                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                        strErrorMsg = Convert.ToString(command.Parameters["@ErrorMsg"].Value);
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
