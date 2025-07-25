using System;
using FA_DALayer.FA_SysAdmin;
using System.Text;
using FA_BusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;

namespace FA_DALayer.Budget
{
    public class ClsPubBudgetFileUpload
    {
        int intRowsAffected;
        int intErrorCode;
        int intUploadID;
        string strConnection = string.Empty;

        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable objBudFileUpload_Dt;
        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable objBudFileUploadDetails_Dt;
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

        public ClsPubBudgetFileUpload(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);

            strConnection = strConnectionName;
        }

        public int FunPubFileUpload(FASerializationMode SerMode, byte[] bytesobjBudFileUpload_Dt,out Int32 intUploadID)
        {
            intErrorCode = 0;
            intUploadID = 0;
            try
            {
                
                objBudFileUpload_Dt = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable)FAClsPubSerialize.DeSerialize(bytesobjBudFileUpload_Dt, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOADRow objbudgetmstrow in objBudFileUpload_Dt.Rows)
                {


                    command = db.GetStoredProcCommand("BUD_INS_FILEUPLOADDTLS");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objbudgetmstrow.Company_ID);
                    db.AddInParameter(command, "@File_Name", DbType.String, objbudgetmstrow.File_Name);
                    db.AddInParameter(command, "@Program_ID", DbType.Int32, objbudgetmstrow.Program_ID);
                    db.AddInParameter(command, "@Txn_ID", DbType.Int32, objbudgetmstrow.Txn_ID);
                    db.AddInParameter(command, "@Upload_Path", DbType.String, objbudgetmstrow.Upload_Path);
                    db.AddInParameter(command, "@FIN_YEAR", DbType.String, objbudgetmstrow.Fin_Year);
                    db.AddInParameter(command, "@ITEM_HEADER", DbType.Int32, objbudgetmstrow.Item_Header);
                    db.AddInParameter(command, "@ACTIVITY", DbType.Int32, objbudgetmstrow.Activity);
                    db.AddInParameter(command, "@Account_Nature", DbType.Int32, objbudgetmstrow.Account_Nature);
                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@Upload_ID", DbType.Int32, sizeof(Int32));

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
                                intUploadID = Convert.ToInt32(command.Parameters["@Upload_ID"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception objException)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                            trans.Rollback();
                            FAClsPubCommErrorLog.CustomErrorRoutine(objException);
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }

                }

            }
            catch (Exception exp)
            {
                intErrorCode = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                throw exp;
            }
            return intErrorCode;

        }

        public int FunPubCreateBudgetFileUploadDetails(FASerializationMode SerMode, byte[] bytesObjUpload_DataTable, out Int32 intUploadID)
        {
            intUploadID = 0;
            int intErrorCode = 0;

            try
            {
                objBudFileUploadDetails_Dt = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable)FAClsPubSerialize.DeSerialize(bytesObjUpload_DataTable, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVEDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FILEUPLOAD_SAVERow objrow in objBudFileUploadDetails_Dt)
                {
                    command = db.GetStoredProcCommand("BUD_FileUpload_SAVE");
                    db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objrow.Company_ID);
                    db.AddInParameter(command, "@USER_ID", DbType.Int32, objrow.User_Id);
                    db.AddInParameter(command, "@UPLOAD_ID", DbType.Int32, objrow.Upload_ID);
                    db.AddInParameter(command, "@Program_ID", DbType.Int32, objrow.Program_ID);
                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@OUTRESULT", DbType.Int32, sizeof(Int64));

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
                                intUploadID = Convert.ToInt32(command.Parameters["@OUTRESULT"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception objException)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                            trans.Rollback();
                            FAClsPubCommErrorLog.CustomErrorRoutine(objException);
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
                FAClsPubCommErrorLog.CustomErrorRoutine(objException);
            }
            return intErrorCode;
        }

    }
}
