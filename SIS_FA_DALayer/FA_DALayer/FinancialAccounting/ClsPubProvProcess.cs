using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubProvProcess
    {

        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Prov_ProcessDataTable objFA_Prov_ProcessDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Prov_ProcessRow objFA_Prov_ProcessRow;
        Database db;
        public ClsPubProvProcess(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }




        #region "ProvProcess"
        public int FunPubInsertProvProcess(FASerializationMode SerMode, byte[] bytesobjFA_Prov_ProcessDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objFA_Prov_ProcessDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Prov_ProcessDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_Prov_ProcessDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Prov_ProcessDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Prov_ProcessRow objFA_Prov_ProcessRow in objFA_Prov_ProcessDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Ins_PROV_PROCESS");

                    if (!objFA_Prov_ProcessRow.IsCompany_IdNull())
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_Prov_ProcessRow.Company_Id);
                    if (!objFA_Prov_ProcessRow.IsUser_IdNull())
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objFA_Prov_ProcessRow.User_Id);
                    if (!objFA_Prov_ProcessRow.IsTran_Header_IDNull())
                        db.AddInParameter(command, "@Tran_Header_ID", DbType.Int32, objFA_Prov_ProcessRow.Tran_Header_ID);
                    if (!objFA_Prov_ProcessRow.IsCurr_DateNull())
                        db.AddInParameter(command, "@Curr_Date", DbType.Int32, objFA_Prov_ProcessRow.Curr_Date);
                    
                    
                    db.AddOutParameter(command, "@OutHT_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.ExecuteNonQuery(command, trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {

                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                intHT_ID = Convert.ToInt32(command.Parameters["@OutHT_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intErrorCode == 0)
                            //    intErrorCode = 50;
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                //intErrorCode = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion



    }
}
