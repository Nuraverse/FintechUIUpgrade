using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubAssetDepreciation
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_DeperciationDataTable objFA_Asset_DeperciationDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_DeperciationRow objFA_Asset_DeperciationRow;
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

        public ClsPubAssetDepreciation(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #region "Asset Master"
        public int FunPubInsertAssetDep(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Dep_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo)
        {
            strDocNo = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objFA_Asset_DeperciationDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_DeperciationDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_Asset_Dep_HdrDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_DeperciationDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_DeperciationRow objFA_Asset_DeperciationRow in objFA_Asset_DeperciationDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_Asset_Dep");

                    if (!objFA_Asset_DeperciationRow.IsCompany_IDNull())
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objFA_Asset_DeperciationRow.Company_ID);
                    if (!objFA_Asset_DeperciationRow.IsCreated_ByNull())
                        db.AddInParameter(command, "@Created_by", DbType.Int32, objFA_Asset_DeperciationRow.Created_By);
                    if (!objFA_Asset_DeperciationRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objFA_Asset_DeperciationRow.Created_Date);
                    if (!objFA_Asset_DeperciationRow.IsAsset_Dep_IdNull())
                        db.AddInParameter(command, "@Asset_Dep_Id", DbType.Int32, objFA_Asset_DeperciationRow.Asset_Dep_Id);
                    if (!objFA_Asset_DeperciationRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objFA_Asset_DeperciationRow.Location_ID);
                    if (!objFA_Asset_DeperciationRow.IsLocation_CodeNull())
                        db.AddInParameter(command, "@Location_Code", DbType.String, objFA_Asset_DeperciationRow.Location_Code);
                    //Dep_DocNo
                    if (!objFA_Asset_DeperciationRow.IsDep_MonthNull())
                        db.AddInParameter(command, "@Dep_Month", DbType.String, objFA_Asset_DeperciationRow.Dep_Month);

                    if (!objFA_Asset_DeperciationRow.IsCalc_DateNull())
                        db.AddInParameter(command, "@Calc_Date", DbType.String, objFA_Asset_DeperciationRow.Calc_Date);

                    
                    //if (!objFA_Asset_DeperciationRow.IsXML_Dep_DtlsNull())
                    //    db.AddInParameter(command, "@XML_Dep_Dtls", DbType.String, objFA_Asset_DeperciationRow.XML_Dep_Dtls);

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XML_Dep_Dtls", OracleType.Clob,
                               objFA_Asset_DeperciationRow.XML_Dep_Dtls.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, objFA_Asset_DeperciationRow.XML_Dep_Dtls);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_Dep_Dtls", DbType.String, objFA_Asset_DeperciationRow.XML_Dep_Dtls);
                    }


                    if (!objFA_Asset_DeperciationRow.IsDep_DocNoNull())
                        db.AddInParameter(command, "@DOCNO", DbType.String, objFA_Asset_DeperciationRow.Dep_DocNo);

                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@OutHT_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
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
                                intHT_ID = Convert.ToInt32(command.Parameters["@OutHT_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intErrorCode == 0)
                            //    intErrorCode = 50;
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
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
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion

    }
}
