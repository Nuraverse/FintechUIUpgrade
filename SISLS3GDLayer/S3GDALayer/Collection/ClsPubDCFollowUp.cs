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
using System.Data.OracleClient;
using S3GBusEntity;

namespace S3GDALayer.Collection
{
    namespace ClnDataMgtServices
    {
        public class ClsPubDCFollowUp
        {
            int intRowsAffected;
            S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUPDataTable objDCFollowUp_DAL;
            S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DC_FLWP_REMARKSDataTable objDCFlwUp_Remarks_DAL;
            S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUP_MSTDataTable objDCFollowUpMst_DAL;

            Database db;
            public ClsPubDCFollowUp()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #region Insert DC Follow_Up Details

            /// <summary>
            /// Inserting the DC Follow UP Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>
            /// 
            public int FunPubCreateDCFollowUp(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFollowUp_DataTable, out int intDCFollowUpID, out string strErrorMsg)
            {
                intDCFollowUpID = 0;
                strErrorMsg = "";
                try
                {
                    objDCFollowUp_DAL = (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUPDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_DCFollowUp_DataTable,
                        SerMode, typeof(S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUPDataTable));


                    foreach (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUPRow objDCFollowUpRow in objDCFollowUp_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CN_INS_DC_FOLLOW_UP_DET");
                        db.AddInParameter(command, "@DC_Followup_Id", DbType.Int32, objDCFollowUpRow.DCFollowUp_ID);
                        db.AddInParameter(command, "@Demand_Proc_Id", DbType.Int32, objDCFollowUpRow.Demand_Proc_ID);
                        db.AddInParameter(command, "@Demand_Proc_Det_Id", DbType.Int32, objDCFollowUpRow.Demand_Proc_Det_ID);
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objDCFollowUpRow.Company_ID);
                        db.AddInParameter(command, "@Lob_ID", DbType.Int32, objDCFollowUpRow.Lob_ID);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objDCFollowUpRow.Location_ID);
                        db.AddInParameter(command, "@Customer_ID", DbType.Int32, objDCFollowUpRow.Customer_ID);
                        db.AddInParameter(command, "@Panum", DbType.String, objDCFollowUpRow.Panum);
                        db.AddInParameter(command, "@Debt_Collector_ID", DbType.Int32, objDCFollowUpRow.Debt_Collector_ID);

                        if (!objDCFollowUpRow.IsCheque_Return_IDNull())
                            db.AddInParameter(command, "@Cheque_Return_ID", DbType.Int32, objDCFollowUpRow.Cheque_Return_ID);

                        db.AddInParameter(command, "@Contact_Number", DbType.String, objDCFollowUpRow.Contact_Number);
                        db.AddInParameter(command, "@PTP_Date", DbType.DateTime, objDCFollowUpRow.PTP_Date);
                        db.AddInParameter(command, "@PTP_Amount", DbType.Decimal, objDCFollowUpRow.PTP_Amount);

                        if (!objDCFollowUpRow.IsNext_FollowUp_DateNull())
                            db.AddInParameter(command, "@Next_Followup_Date", DbType.DateTime, objDCFollowUpRow.Next_FollowUp_Date);

                        db.AddInParameter(command, "@Remarks", DbType.String, objDCFollowUpRow.Remarks);
                        db.AddInParameter(command, "@FollowUp_Status", DbType.Int32, objDCFollowUpRow.FollowUp_Status);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objDCFollowUpRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        //db.AddOutParameter(command, "@AINSENO", DbType.String, 200);
                        db.AddOutParameter(command, "@ERRORMSG", DbType.String, 500);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if (intRowsAffected > 0)
                                {
                                    if (command.Parameters["@ERRORMSG"].Value != null)
                                    {
                                        strErrorMsg = (string)command.Parameters["@ERRORMSG"].Value;
                                    }

                                    // throw new Exception("Error thrown Error No " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    //strAINSENO = (string)command.Parameters["@AINSENO"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
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

            #region Insert DC Follow_Up Remarks Details 

            /// <summary>
            /// Inserting the DC Follow UP Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>
            /// 
            public int FunPubCreateDCFollwUpRemarks(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFlwUpRemarks_DataTable, out string strTicketNO, out string strErrorMsg)
            {
                strTicketNO = "";
                strErrorMsg = "";
                try
                {
                    objDCFlwUp_Remarks_DAL = (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DC_FLWP_REMARKSDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_DCFlwUpRemarks_DataTable,
                        SerMode, typeof(S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DC_FLWP_REMARKSDataTable));


                    foreach (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DC_FLWP_REMARKSRow objDCFlwp_RemarksRow in objDCFlwUp_Remarks_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CN_INS_DC_FOLLOWUP_REMARKS_DET");
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objDCFlwp_RemarksRow.Company_ID);
                        //db.AddInParameter(command, "@Lob_ID", DbType.Int32, objDCFlwp_RemarksRow.Lob_ID);
                        //db.AddInParameter(command, "@Location_ID", DbType.Int32, objDCFlwp_RemarksRow.Location_ID);
                        db.AddInParameter(command, "@DC_Followup_Id", DbType.Int32, objDCFlwp_RemarksRow.DCFollowUp_ID);
                        db.AddInParameter(command, "@Account_Diary_Hdr_Id", DbType.Int32, objDCFlwp_RemarksRow.Account_Diary_Hdr_ID);
                        db.AddInParameter(command, "@Account_Diary_Det_Id", DbType.Int32, objDCFlwp_RemarksRow.Account_Diary_Det_ID);
                        db.AddInParameter(command, "@Panum", DbType.String, objDCFlwp_RemarksRow.Panum);
                        db.AddInParameter(command, "@Remarks_Type", DbType.Int32, objDCFlwp_RemarksRow.Remarks_Type_ID);
                        db.AddInParameter(command, "@Remarks_Sub_Type", DbType.Int32, objDCFlwp_RemarksRow.Remarks_Subtype_ID);
                        db.AddInParameter(command, "@Remarks", DbType.String, objDCFlwp_RemarksRow.Remarks);
                        db.AddInParameter(command, "@Issecured_Rem", DbType.Int32, objDCFlwp_RemarksRow.Is_Secured);
                        db.AddInParameter(command, "@Action_Taken", DbType.Int32, objDCFlwp_RemarksRow.Action_Taken);
                        db.AddInParameter(command, "@Assigntobranch", DbType.Int32, objDCFlwp_RemarksRow.Assign_to_Branch);
                        db.AddInParameter(command, "@Assigntouser", DbType.Int32, objDCFlwp_RemarksRow.Assign_to_User);

                        if (!objDCFlwp_RemarksRow.IsNext_Action_DateNull())
                        {
                            db.AddInParameter(command, "@NextAction_Date", DbType.DateTime, objDCFlwp_RemarksRow.Next_Action_Date);
                        }

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XMLUserDet",
                                   OracleType.Clob, objDCFlwp_RemarksRow.XMLUserDetails.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, objDCFlwp_RemarksRow.XMLUserDetails);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUserDet", DbType.String, objDCFlwp_RemarksRow.XMLUserDetails);
                        }
                        if (!objDCFlwp_RemarksRow.IsDebtCollector_IDNull())
                            db.AddInParameter(command, "@DEBTCOLLECTOR_ID", DbType.Int32, objDCFlwp_RemarksRow.DebtCollector_ID); 
                        db.AddInParameter(command, "@User_ID", DbType.Int32, objDCFlwp_RemarksRow.User_ID);
                        db.AddOutParameter(command, "@TicketNo", DbType.String, 200);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.AddOutParameter(command, "@ERRORMSG", DbType.String, 500);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if (intRowsAffected > 0)
                                {
                                    if (command.Parameters["@ERRORMSG"].Value != null)
                                    {
                                        strErrorMsg = (string)command.Parameters["@ERRORMSG"].Value;
                                    }

                                    throw new Exception("Error thrown Error No " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    if (Convert.ToString(command.Parameters["@TicketNo"].Value) != "")
                                        strTicketNO = (string)command.Parameters["@TicketNo"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
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
                    //throw ex;
                }
                return intRowsAffected;
            }

            #endregion

            #region Insert DC Follow_Up Details

            /// <summary>
            /// Updating the DC Follow UP Details
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name=""></param>
            /// <returns></returns>
            /// 
            public int FunPubINSUpdateDCFollowUp(SerializationMode SerMode, byte[] bytesObjS3G_CLN_DCFollowUpMst_DataTable, out int intDCFollowUpID, out string strErrorMsg)
            {
                intDCFollowUpID = 0;
                strErrorMsg = "";
                try
                {
                    objDCFollowUpMst_DAL = (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUP_MSTDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_DCFollowUpMst_DataTable,
                        SerMode, typeof(S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUP_MSTDataTable));

                    foreach (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DCFOLLOWUP_MSTRow objDCFollowUpRow in objDCFollowUpMst_DAL)
                    {
                        DbCommand command = db.GetStoredProcCommand("CN_INSUPD_DC_FOLLOWUP_DET");
                        db.AddInParameter(command, "@DC_Followup_HDR_Id", DbType.Int32, objDCFollowUpRow.DCFollowup_HDR_ID);
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objDCFollowUpRow.Company_ID);
                        db.AddInParameter(command, "@PA_SA_REF_ID", DbType.Int32, objDCFollowUpRow.PA_SA_REF_ID);
                        db.AddInParameter(command, "@Contract_Number", DbType.String, objDCFollowUpRow.Contract_Number);
                        db.AddInParameter(command, "@Mobile_Number", DbType.String, objDCFollowUpRow.Mobile_Number);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (objDCFollowUpRow.XMLFollowup_Det != null)
                            {
                                param = new OracleParameter("@XMLFollowup_Det", OracleType.Clob,
                                    objDCFollowUpRow.XMLFollowup_Det.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objDCFollowUpRow.XMLFollowup_Det);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLFollowup_Det", DbType.String, objDCFollowUpRow.XMLFollowup_Det);
                        }
                        if (!objDCFollowUpRow.IsNextFolloup_DateNull())
                            db.AddInParameter(command, "@NextFolloup_Date", DbType.DateTime, objDCFollowUpRow.NextFolloup_Date);
                        if (!objDCFollowUpRow.IsPromiseTo_Pay_DateNull())
                            db.AddInParameter(command, "@PromiseTo_Pay_Date", DbType.DateTime, objDCFollowUpRow.PromiseTo_Pay_Date);
                        if (!objDCFollowUpRow.IsPromiseToPay_AmountNull())
                            db.AddInParameter(command, "@PromiseToPay_Amount", DbType.Decimal, objDCFollowUpRow.PromiseToPay_Amount);
                        if (!objDCFollowUpRow.IsNoOfChequePayNull())
                            db.AddInParameter(command, "@NoOfChequePay", DbType.DateTime, objDCFollowUpRow.NoOfChequePay);
                        if (!objDCFollowUpRow.IsDEBTCOLLECTOR_IDNull())
                            db.AddInParameter(command, "@DEBTCOLLECTOR_ID", DbType.Int32, objDCFollowUpRow.DEBTCOLLECTOR_ID); 
                        db.AddInParameter(command, "@USER_ID", DbType.Int32, objDCFollowUpRow.USER_ID); 
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));                  
                        db.AddOutParameter(command, "@ERRORMSG", DbType.String, 500);
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                                if (intRowsAffected > 0)
                                {
                                    if (command.Parameters["@ERRORMSG"].Value != null)
                                    {
                                        strErrorMsg = (string)command.Parameters["@ERRORMSG"].Value;
                                    }

                                    // throw new Exception("Error thrown Error No " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    //strAINSENO = (string)command.Parameters["@AINSENO"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
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
