using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;
namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubBRS
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable objFA_BRSDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_BRSRow objFA_BRSRow;
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubBRS(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #region "BRS"
        public int FunPubInsertBRS(FASerializationMode SerMode, byte[] bytesobjFA_BRSDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objFA_BRSDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_BRSDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_BRSDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_BRSRow objFA_BRSRow in objFA_BRSDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_BRS");

                    if (!objFA_BRSRow.IsCompany_IdNull())
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objFA_BRSRow.Company_Id);
                    if (!objFA_BRSRow.IsCreated_byNull())
                        db.AddInParameter(command, "@Created_by", DbType.Int32, objFA_BRSRow.Created_by);
                    if (!objFA_BRSRow.IsLocation_IdNull())
                        db.AddInParameter(command, "@Location_Id", DbType.Int32, objFA_BRSRow.Location_Id);
                    if (!objFA_BRSRow.IsBRS_IdNull())
                        db.AddInParameter(command, "@BRS_Id", DbType.Int32, objFA_BRSRow.BRS_Id);
                    if (!objFA_BRSRow.IsBank_IdNull())
                        db.AddInParameter(command, "@Bank_Id", DbType.Int32, objFA_BRSRow.Bank_Id);
                    if (!objFA_BRSRow.IsBRS_NONull())
                        db.AddInParameter(command, "@BRS_NO", DbType.String, objFA_BRSRow.BRS_NO);
                    if (!objFA_BRSRow.IsBRS_DateNull())
                        db.AddInParameter(command, "@BRS_Date", DbType.DateTime, objFA_BRSRow.BRS_Date);
                    if (!objFA_BRSRow.IsRangeFMNull())
                        db.AddInParameter(command, "@RangeFM", DbType.DateTime, objFA_BRSRow.RangeFM);
                    if (!objFA_BRSRow.IsRangeTONull())
                        db.AddInParameter(command, "@RangeTO", DbType.DateTime, objFA_BRSRow.RangeTO);
                    if (!objFA_BRSRow.IsRecon_StatusNull())
                        db.AddInParameter(command, "@Recon_Status", DbType.String, objFA_BRSRow.Recon_Status);
                    if (!objFA_BRSRow.IsBBorBSNull())
                        db.AddInParameter(command, "@BBorBS", DbType.String, objFA_BRSRow.BBorBS);
                    if (!objFA_BRSRow.IsBal_AmtNull())
                        db.AddInParameter(command, "@Bal_Amt", DbType.Decimal, objFA_BRSRow.Bal_Amt);
                    if (!objFA_BRSRow.IsDRorCRNull())
                        db.AddInParameter(command, "@DRorCR", DbType.String, objFA_BRSRow.DRorCR);
                    if (!objFA_BRSRow.IsTargetDr0rCrNull())
                        db.AddInParameter(command, "@TargetDr0rCr", DbType.String, objFA_BRSRow.TargetDr0rCr);
                    if (!objFA_BRSRow.IsTargetAmtNull())
                        db.AddInParameter(command, "@TargetAmt", DbType.Decimal, objFA_BRSRow.TargetAmt);
                    if (!objFA_BRSRow.IsBank_File_pathNull())
                        db.AddInParameter(command, "@Bank_File_path", DbType.Decimal, objFA_BRSRow.Bank_File_path);
                    if (!objFA_BRSRow.IsBank_File_RefNull())
                        db.AddInParameter(command, "@Bank_File_Ref", DbType.Decimal, objFA_BRSRow.Bank_File_Ref);

                    //if (!objFA_BRSRow.IsXML_BRS_DtlNull())
                    //    db.AddInParameter(command, "@XML_BRS_Dtl", DbType.String, objFA_BRSRow.XML_BRS_Dtl);
                    //if (!objFA_BRSRow.IsXML_BRS_Dtl1Null())
                    //    db.AddInParameter(command, "@XML_BRS_Dtl1", DbType.String, objFA_BRSRow.XML_BRS_Dtl1);
                    //if (!objFA_BRSRow.IsXML_BRS_OthersNull())
                    //    db.AddInParameter(command, "@XML_BRS_Others", DbType.String, objFA_BRSRow.XML_BRS_Others);

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        if (!objFA_BRSRow.IsXML_BRS_DtlNull())
                        {
                            OracleParameter param = new OracleParameter("@XML_BRS_Dtl", OracleType.Clob,
                                   objFA_BRSRow.XML_BRS_Dtl.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objFA_BRSRow.XML_BRS_Dtl);
                            command.Parameters.Add(param);
                        }
                        if (!objFA_BRSRow.IsXML_BRS_Dtl1Null())
                        {
                            OracleParameter param1 = new OracleParameter("@XML_BRS_Dtl1", OracleType.Clob,
                                        objFA_BRSRow.XML_BRS_Dtl1.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, objFA_BRSRow.XML_BRS_Dtl1);
                            command.Parameters.Add(param1);
                        }
                        if (!objFA_BRSRow.IsXML_BRS_OthersNull())
                        {
                            OracleParameter param2 = new OracleParameter("@XML_BRS_Others", OracleType.Clob,
                                        objFA_BRSRow.XML_BRS_Others.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, objFA_BRSRow.XML_BRS_Others);
                            command.Parameters.Add(param2);
                        }
                        if (!objFA_BRSRow.IsDataColumn1Null())
                        {
                            OracleParameter param2 = new OracleParameter("@XML_BRS_Aut_Man", OracleType.Clob,
                                       objFA_BRSRow.DataColumn1.Length, ParameterDirection.Input, true,
                                       0, 0, String.Empty, DataRowVersion.Default, objFA_BRSRow.DataColumn1);
                            command.Parameters.Add(param2);
                        }
                    }
                    else
                    {
                        if (!objFA_BRSRow.IsXML_BRS_DtlNull())
                        {
                            db.AddInParameter(command, "@XML_BRS_Dtl", DbType.String, objFA_BRSRow.XML_BRS_Dtl);

                        }
                        if (!objFA_BRSRow.IsXML_BRS_Dtl1Null())
                        {
                            db.AddInParameter(command, "@XML_BRS_Dtl1", DbType.String, objFA_BRSRow.XML_BRS_Dtl1);
                        }
                        if (!objFA_BRSRow.IsXML_BRS_OthersNull())
                        {
                            db.AddInParameter(command, "@XML_BRS_Others", DbType.String, objFA_BRSRow.XML_BRS_Others);
                        }
                        if (!objFA_BRSRow.IsDataColumn1Null())
                        {
                            db.AddInParameter(command, "@XML_BRS_Aut_Man", DbType.String, objFA_BRSRow.DataColumn1);
                        }
                    }

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
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {

                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                //if ((int)command.Parameters["@OutHT_ID"].Value > 0)
                                //intHT_ID = Convert.ToInt32(command.Parameters["@OutHT_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intErrorCode == 0)
                            //    intErrorCode = 50;
                            trans.Rollback();
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                //intErrorCode = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion
    }
}
