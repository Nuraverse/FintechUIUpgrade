using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubBRSFileFormat
    {

        int intErrorCode;
        int int_OutResult;
        int errcode;
        int OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatDataTable objFABRSFileFormat = null;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatRow objFABRSFileRow = null;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_DatavalidationDataTable objFABRSValTbl = null;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_DatavalidationRow objFABRSValRow = null;

        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubBRSFileFormat(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        public int FunPubInsertBRSFileFormat(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                objFABRSFileFormat = (FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_BRSDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatDataTable));
                objFABRSFileRow = objFABRSFileFormat.Rows[0] as FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatRow;

                DbCommand command = db.GetStoredProcCommand("FA_Ins_Upd_BRSFileFormat");

                //command = db.GetStoredProcCommand("FA_Ins_Upd_BRSFileFormat");

                db.AddInParameter(command, "@Company_Id", DbType.Int32, objFABRSFileRow.Company_ID);
                if (!(objFABRSFileRow.IsLocation_IDNull()))
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objFABRSFileRow.Location_ID);
                db.AddInParameter(command, "@Doc_Date", DbType.Date, objFABRSFileRow.Doc_Date);
                db.AddInParameter(command, "@Bank_ID", DbType.Int32, objFABRSFileRow.Bank_ID);
                db.AddInParameter(command, "@Details", DbType.String, objFABRSFileRow.Details);
                db.AddInParameter(command, "@Active", DbType.String, objFABRSFileRow.Is_Active);
                db.AddInParameter(command, "@BRS_ID", DbType.String, objFABRSFileRow.BRS_ID);
                db.AddInParameter(command, "@BRS_NO", DbType.String, objFABRSFileRow.Doc_No);
                db.AddInParameter(command, "@type", DbType.Int32, objFABRSFileRow.Type);
                db.AddOutParameter(command, "@OutDoc_No", DbType.String, 500);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));


                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                        if (intErrorCode != 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            strDocNo = command.Parameters["@OutDoc_No"].Value.ToString();
                            throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                        }
                        else
                        {
                            strDocNo = command.Parameters["@OutDoc_No"].Value.ToString();
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intErrorCode = 50;
            }
            return intErrorCode;
        }

        public int FunPubInsertBRSValidation(FASerializationMode SerMode, byte[] byteobjFA_BRSValiddatable, string strConnectionName, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                objFABRSValTbl = (FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_DatavalidationDataTable)
                    (FAClsPubSerialize.DeSerialize(byteobjFA_BRSValiddatable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_File_FormatDataTable)));
                objFABRSValRow = objFABRSValTbl.Rows[0] as FA_BusEntity.FinancialAccounting.Hedging.FA_BRS_DatavalidationRow;
                DbCommand command = db.GetStoredProcCommand("FA_BRS_InsertValidation");
                if (!objFABRSValRow.IsLocation_IDNull())
                    db.AddInParameter(command, "@location_id", DbType.Int32, objFABRSValRow.Location_ID);
                db.AddInParameter(command, "@bank_id", DbType.Int32, objFABRSValRow.Bank_ID);
                if (Convert.ToString(objFABRSValRow.XMLdet) != "")
                    db.AddInParameter(command, "@xmldet", DbType.String, objFABRSValRow.XMLdet);
                db.AddInParameter(command, "@from_date", DbType.DateTime, objFABRSValRow.From_Date);
                db.AddInParameter(command, "@to_date", DbType.DateTime, objFABRSValRow.To_Date);
                db.AddInParameter(command, "@path", DbType.String, objFABRSValRow.Path);
                db.AddInParameter(command, "@Created_By", DbType.Int32, objFABRSValRow.Created_By);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, objFABRSValRow.Company_ID);
                db.AddInParameter(command, "Is_Active", DbType.Boolean, objFABRSValRow.Is_Active);
                db.AddOutParameter(command, "@errorcode", DbType.Int32, sizeof(int));

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                        if (intErrorCode != 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "");
            }
            return intErrorCode;
        }
    }


}



