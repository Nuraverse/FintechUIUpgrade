#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Collection
/// Screen Name			: PDC Entry DAL class
/// Created By			: Irsathameen K
/// Created Date		: 13-Oct-2010
/// Purpose	            : To access challan Rule  db methods
/// Modified By			: SwarnaLatha.B.M
/// Modified Date		: 10-Jan-2011
/// Purpose	            : Table Structure altered.
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
using System.Data.OracleClient;
using S3GBusEntity;
using S3GBusEntity.Collection;
namespace S3GDALayer.Collection
{
    namespace ClnReceiptMgtServices
    {

        public class ClsPubPDCModule
        {
            #region Initialization
            int intRowsAffected;
            S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable objPDCModule_DAL;
            S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsRow ObjPDCModuleRow = null;

            S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCMAINTENANCEDataTable objPDCMntnc_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubPDCModule()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #endregion

            #region Create Mode
            public int FunPubCreatePDCModuleDetails(SerializationMode SerMode, byte[] bytesObjS3G_CLN_PDCModuleDataTable, out string strPDCNo, out string strchequeNo, out string strexistingdate)
            {
                try
                {
                    strPDCNo = "";
                    strchequeNo = "";
                    strexistingdate = "";
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    objPDCModule_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_PDCModuleDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable));
                    ObjPDCModuleRow = objPDCModule_DAL.Rows[0] as S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsRow;

                    DbCommand command = db.GetStoredProcCommand("S3G_CLN_InsertPDCEntry");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjPDCModuleRow.Company_ID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjPDCModuleRow.LOB_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjPDCModuleRow.Branch_ID);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjPDCModuleRow.Created_By);
                    db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjPDCModuleRow.Customer_ID);
                    //db.AddInParameter(command, "@XMLPDCEntry", DbType.String, ObjPDCModuleRow.XMLPDCEntry);
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XMLPDCEntry", OracleType.Clob,
                            ObjPDCModuleRow.XMLPDCEntry.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjPDCModuleRow.XMLPDCEntry);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XMLPDCEntry", DbType.String,
                            ObjPDCModuleRow.XMLPDCEntry);
                    }
                    db.AddInParameter(command, "@CollectionDate", DbType.DateTime, ObjPDCModuleRow.PDC_Collection_Date);
                    db.AddInParameter(command, "@EntryDate", DbType.DateTime, ObjPDCModuleRow.PDC_Entry_Date);
                    db.AddInParameter(command, "@PDCNO", DbType.String, ObjPDCModuleRow.PDC_Entry_NO);
                    db.AddInParameter(command, "@PANum", DbType.String, ObjPDCModuleRow.PANum);
                    db.AddInParameter(command, "@SANum", DbType.String, ObjPDCModuleRow.SANum);
                    db.AddInParameter(command, "@NoPDC", DbType.Int32, ObjPDCModuleRow.No_Of_PDC);
                    if (!ObjPDCModuleRow.IsTXN_IDNull())
                    { db.AddInParameter(command, "@TXN_ID", DbType.Int32, ObjPDCModuleRow.TXN_ID); }
                    if (!ObjPDCModuleRow.IsDrawee_Bank_NameNull())
                    { db.AddInParameter(command, "@Drawee_Bank_Name", DbType.String, ObjPDCModuleRow.Drawee_Bank_Name); }
                    db.AddInParameter(command, "@InstrumentSequence", DbType.Int32, ObjPDCModuleRow.InstrumentSequence);
                    db.AddInParameter(command, "@Instrument_Type", DbType.Int32, ObjPDCModuleRow.Instrument_Type_Code);
                    db.AddInParameter(command, "@Instrument_Type_Code", DbType.Int32, ObjPDCModuleRow.Instrument_Type);
                    /* Added By Manikandan to bring MICR Code in PDC as User Enterable ON 30 - SEP 2014 */
                    if (!ObjPDCModuleRow.IsMICRNull())
                        db.AddInParameter(command, "@MICR", DbType.String, ObjPDCModuleRow.MICR);
                    /* Added By Manikandan to bring Authorized_Sign in PDC as User Enterable ON 25-OCT-2014 */
                    if (!ObjPDCModuleRow.IsAuthorized_SignNull())
                        db.AddInParameter(command, "@Authorized_Sign", DbType.String, ObjPDCModuleRow.Authorized_Sign);

                    db.AddInParameter(command, "@PDC_Nature_Type", DbType.Int32, ObjPDCModuleRow.PDC_Nature_Type);
                    db.AddInParameter(command, "@From_Installment_No", DbType.String, ObjPDCModuleRow.From_Installment_No);
                    db.AddInParameter(command, "@Collateral_Category_Type_ID", DbType.Int32, ObjPDCModuleRow.Collateral_Category);
                    db.AddInParameter(command, "@Drawee_Account_No", DbType.String, ObjPDCModuleRow.Drawee_Account_No);
                    db.AddInParameter(command, "@Clearing_Type", DbType.Int32, ObjPDCModuleRow.Clearing_Type);
                    db.AddInParameter(command, "@Operating_Branch", DbType.Int32, ObjPDCModuleRow.Operating_Branch);
                    db.AddInParameter(command, "@Issuer_By_ID", DbType.Int32, ObjPDCModuleRow.Issuer_By_ID);
                    db.AddInParameter(command, "@Given_By_Desc", DbType.String, ObjPDCModuleRow.Given_By_Desc);

                    if (!ObjPDCModuleRow.IsFactoring_Customer_IDNull())
                    {
                        db.AddInParameter(command, "@Factoring_Customer_ID", DbType.Int32, ObjPDCModuleRow.Factoring_Customer_ID); 
                    }

                    db.AddOutParameter(command, "@PDCModule_No", DbType.String, 100);
                    db.AddOutParameter(command, "@Cheque_No", DbType.String, 200);
                    db.AddOutParameter(command, "@Existing_Date", DbType.String, 100);
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
                                strchequeNo = (string)command.Parameters["@Cheque_No"].Value;
                                strPDCNo = Convert.ToString(command.Parameters["@PDCModule_No"].Value);
                                strexistingdate = Convert.ToString(command.Parameters["@Existing_Date"].Value);
                                //throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                trans.Commit();
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
                                strPDCNo = Convert.ToString(command.Parameters["@PDCModule_No"].Value);
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
                        { conn.Close(); }
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

            #region PDC Bulk Replacement Create Mode
            public int FunPubCreatePDCBulkModuleDetails(SerializationMode SerMode, byte[] bytesObjS3G_CLN_PDCModuleDataTable, out string strPDCNo, out string strchequeNo, out string strexistingdate)
            {
                try
                {
                    strPDCNo = "";
                    strchequeNo = "";
                    strexistingdate = "";
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    objPDCModule_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_PDCModuleDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsDataTable));
                    ObjPDCModuleRow = objPDCModule_DAL.Rows[0] as S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCModuleDetailsRow;

                    DbCommand command = db.GetStoredProcCommand("S3G_CLN_InsertPDCBulkReplace");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjPDCModuleRow.Company_ID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjPDCModuleRow.LOB_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjPDCModuleRow.Branch_ID);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjPDCModuleRow.Created_By);
                    db.AddInParameter(command, "@Customer_ID", DbType.Int32, ObjPDCModuleRow.Customer_ID);
                    //db.AddInParameter(command, "@XMLPDCEntry", DbType.String, ObjPDCModuleRow.XMLPDCEntry);
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    if (enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XMLPDCEntry", OracleType.Clob,
                            ObjPDCModuleRow.XMLPDCEntry.Length, ParameterDirection.Input, true,
                            0, 0, String.Empty, DataRowVersion.Default, ObjPDCModuleRow.XMLPDCEntry);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XMLPDCEntry", DbType.String,
                            ObjPDCModuleRow.XMLPDCEntry);
                    }
                    db.AddInParameter(command, "@CollectionDate", DbType.DateTime, ObjPDCModuleRow.PDC_Collection_Date);
                    db.AddInParameter(command, "@EntryDate", DbType.DateTime, ObjPDCModuleRow.PDC_Entry_Date);
                    db.AddInParameter(command, "@PDCNO", DbType.String, ObjPDCModuleRow.PDC_Entry_NO);
                    db.AddInParameter(command, "@PANum", DbType.String, ObjPDCModuleRow.PANum);
                    db.AddInParameter(command, "@SANum", DbType.String, ObjPDCModuleRow.SANum);
                    db.AddInParameter(command, "@NoPDC", DbType.Int32, ObjPDCModuleRow.No_Of_PDC);
                    if (!ObjPDCModuleRow.IsTXN_IDNull())
                    { db.AddInParameter(command, "@TXN_ID", DbType.Int32, ObjPDCModuleRow.TXN_ID); }
                    if (!ObjPDCModuleRow.IsDrawee_Bank_NameNull())
                    { db.AddInParameter(command, "@Drawee_Bank_Name", DbType.String, ObjPDCModuleRow.Drawee_Bank_Name); }
                    db.AddInParameter(command, "@InstrumentSequence", DbType.Int32, ObjPDCModuleRow.InstrumentSequence);
                    db.AddInParameter(command, "@Instrument_Type", DbType.Int32, ObjPDCModuleRow.Instrument_Type_Code);
                    db.AddInParameter(command, "@Instrument_Type_Code", DbType.Int32, ObjPDCModuleRow.Instrument_Type);
                    db.AddOutParameter(command, "@PDCModule_No", DbType.String, 100);
                    db.AddOutParameter(command, "@Cheque_No", DbType.String, 150);
                    db.AddOutParameter(command, "@Existing_Date", DbType.String, 100);
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
                                strchequeNo = (string)command.Parameters["@Cheque_No"].Value;
                                strPDCNo = Convert.ToString(command.Parameters["@PDCModule_No"].Value);
                                strexistingdate = Convert.ToString(command.Parameters["@Existing_Date"].Value);
                                //throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                trans.Commit();
                            }
                            else if ((int)command.Parameters["@ErrorCode"].Value < 0)
                            {
                                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                //if (intRowsAffected == -1)
                                //    throw new Exception("Document Sequence no not-defined");
                                //if (intRowsAffected == -2)
                                //    throw new Exception("Document Sequence no exceeds defined limit");
                            }
                            else
                            {
                                trans.Commit();
                                //strPDCNo = Convert.ToString(command.Parameters["@PDCModule_No"].Value);
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
                        { conn.Close(); }
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

            //Added on 15-Oct-2018 starts here
            /// <summary>
            /// To Updated PDC Details through PDC Maintenance
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_CLN_PDCMntncDataTable"></param>
            /// <returns></returns>
            public int FunPubCreatePDCMaintenance(SerializationMode SerMode, byte[] bytesObjS3G_CLN_PDCMntncDataTable)
            {
                int intErrorCode = 0;
                try
                {
                    objPDCMntnc_DAL = (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCMAINTENANCEDataTable)
                                            ClsPubSerialize.DeSerialize(bytesObjS3G_CLN_PDCMntncDataTable,
                                        SerMode, typeof(S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCMAINTENANCEDataTable));

                    foreach (S3GBusEntity.Collection.ClnReceiptMgtServices.S3G_CLN_PDCMAINTENANCERow ObjPDCMntncRow in objPDCMntnc_DAL)
                    {

                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_PDCMNTNCDTLS");
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjPDCMntncRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjPDCMntncRow.User_ID);
                        db.AddInParameter(command, "@PDC_Number", DbType.String, ObjPDCMntncRow.PDC_Number);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, ObjPDCMntncRow.Program_ID);
                        db.AddInParameter(command, "@Autorized_Sign", DbType.String, ObjPDCMntncRow.Authorization_Sign);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param1;
                            if (!ObjPDCMntncRow.IsXML_PDCDetailsNull())
                            {
                                param1 = new OracleParameter("@XML_PDCDetails", OracleType.Clob,
                                    ObjPDCMntncRow.XML_PDCDetails.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, ObjPDCMntncRow.XML_PDCDetails);
                                command.Parameters.Add(param1);
                            }
                        }
                        else
                        {
                            if (!ObjPDCMntncRow.IsXML_PDCDetailsNull())
                            {
                                db.AddInParameter(command, "@XML_PDCDetails", DbType.String, ObjPDCMntncRow.XML_PDCDetails);
                            }
                        }

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int32));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else if ((int)command.Parameters["@ERRORCODE"].Value < 0)
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    throw new Exception("Error thrown Error No" + Convert.ToString(intErrorCode));
                                }
                                else
                                {
                                    intErrorCode = (int)command.Parameters["@ERRORCODE"].Value;
                                    trans.Commit();
                                }
                            }
                            catch (Exception objException)
                            {
                                if (intErrorCode == 0)
                                    intErrorCode = 50;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }
                    }
                }
                catch (Exception objException)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(objException);
                }
                return intErrorCode;
            }

            //Added on 15-Oct-2018 ends here
        }
    }

}
