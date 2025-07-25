using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.OracleClient;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubAssetTransaction
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrDataTable objFA_Asset_Tran_HdrDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrRow objFA_Asset_Tran_HdrRow;
        Database db;
        public ClsPubAssetTransaction(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #region "Asset Master"
        public int FunPubInsertAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable, string strConnectionName, out int intHT_ID, out string strDocNo, out string strErrorMsg)
        {
            strDocNo = ""; strErrorMsg = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objFA_Asset_Tran_HdrDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_Asset_Tran_HdrDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrRow objFA_Asset_Tran_HdrRow in objFA_Asset_Tran_HdrDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_Asset_Tran");

                    if (!objFA_Asset_Tran_HdrRow.IsCompany_IdNull())
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Company_Id);
                    if (!objFA_Asset_Tran_HdrRow.IsCreated_byNull())
                        db.AddInParameter(command, "@Created_by", DbType.Int32, objFA_Asset_Tran_HdrRow.Created_by);
                    if (!objFA_Asset_Tran_HdrRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objFA_Asset_Tran_HdrRow.Created_Date);
                    if (!objFA_Asset_Tran_HdrRow.IsAsset_Tran_IdNull())
                        db.AddInParameter(command, "@Asset_Tran_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Asset_Tran_Id);
                    if (!objFA_Asset_Tran_HdrRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objFA_Asset_Tran_HdrRow.Location_ID);
                    if (!objFA_Asset_Tran_HdrRow.IsLocation_CodeNull())
                        db.AddInParameter(command, "@Location_Code", DbType.String, objFA_Asset_Tran_HdrRow.Location_Code);
                    if (!objFA_Asset_Tran_HdrRow.IsPur_SaleNull())
                        db.AddInParameter(command, "@Pur_Sale", DbType.String, objFA_Asset_Tran_HdrRow.Pur_Sale);
                    if (!objFA_Asset_Tran_HdrRow.IsDocNoNull())
                        db.AddInParameter(command, "@DocNo", DbType.String, objFA_Asset_Tran_HdrRow.DocNo);
                    if (!objFA_Asset_Tran_HdrRow.IsDocDtNull())
                        db.AddInParameter(command, "@DocDt", DbType.DateTime, objFA_Asset_Tran_HdrRow.DocDt);
                    if (!objFA_Asset_Tran_HdrRow.IsEntity_IdNull())
                        db.AddInParameter(command, "@Entity_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Entity_Id);
                    if (!objFA_Asset_Tran_HdrRow.IsEntity_codeNull())
                        db.AddInParameter(command, "@Entity_code", DbType.String, objFA_Asset_Tran_HdrRow.Entity_code);
                    if (!objFA_Asset_Tran_HdrRow.IsValue_DateNull())
                        db.AddInParameter(command, "@Value_Date", DbType.DateTime, objFA_Asset_Tran_HdrRow.Value_Date);
                    if (!objFA_Asset_Tran_HdrRow.IsDoc_StatNull())
                        db.AddInParameter(command, "@Doc_Stat", DbType.String, objFA_Asset_Tran_HdrRow.Doc_Stat);
                    if (!objFA_Asset_Tran_HdrRow.IsTot_AmtNull())
                        db.AddInParameter(command, "@Tot_Amt", DbType.Decimal, objFA_Asset_Tran_HdrRow.Tot_Amt);
                    if (!objFA_Asset_Tran_HdrRow.IsVAT_AmtNull())
                        db.AddInParameter(command, "@VAT_Amt", DbType.Decimal, objFA_Asset_Tran_HdrRow.VAT_Amt);
                    if (!objFA_Asset_Tran_HdrRow.IsOth_AmtNull())
                        db.AddInParameter(command, "@Oth_Amt", DbType.Decimal, objFA_Asset_Tran_HdrRow.Oth_Amt);
                    if (!objFA_Asset_Tran_HdrRow.IsAsset_GroupNull())
                        db.AddInParameter(command, "@Asset_Group", DbType.String, objFA_Asset_Tran_HdrRow.Asset_Group);
                    FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param;
                        if (objFA_Asset_Tran_HdrRow.XMLPODtls != null)
                        {
                            param = new OracleParameter("@XMLPODtls", OracleType.Clob,
                                objFA_Asset_Tran_HdrRow.XMLPODtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objFA_Asset_Tran_HdrRow.XMLPODtls);
                            command.Parameters.Add(param);
                        }

                        if (objFA_Asset_Tran_HdrRow.XMLAssetDtls != null)
                        {
                            param = new OracleParameter("@XMLAssetDtls", OracleType.Clob,
                                objFA_Asset_Tran_HdrRow.XMLAssetDtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objFA_Asset_Tran_HdrRow.XMLAssetDtls);
                            command.Parameters.Add(param);
                        }


                        if (objFA_Asset_Tran_HdrRow.XMLASSETNUMBERDTLS != null)
                        {
                            param = new OracleParameter("@XMLASSETNUMBERDTLS", OracleType.Clob,
                                objFA_Asset_Tran_HdrRow.XMLASSETNUMBERDTLS.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objFA_Asset_Tran_HdrRow.XMLASSETNUMBERDTLS);
                            command.Parameters.Add(param);
                        }


                        if (objFA_Asset_Tran_HdrRow.XMLOtherDtls != null)
                        {
                            param = new OracleParameter("@XMLOtherDtls", OracleType.Clob,
                                objFA_Asset_Tran_HdrRow.XMLOtherDtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objFA_Asset_Tran_HdrRow.XMLOtherDtls);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                    {
                        if (!objFA_Asset_Tran_HdrRow.IsXMLPODtlsNull())
                            db.AddInParameter(command, "@XMLPODtls", DbType.String, objFA_Asset_Tran_HdrRow.XMLPODtls);

                        if (!objFA_Asset_Tran_HdrRow.IsXMLAssetDtlsNull())
                            db.AddInParameter(command, "@XMLAssetDtls", DbType.String, objFA_Asset_Tran_HdrRow.XMLAssetDtls);

                        if (!objFA_Asset_Tran_HdrRow.IsXMLASSETNUMBERDTLSNull())
                            db.AddInParameter(command, "@XMLASSETNUMBERDTLS", DbType.String, objFA_Asset_Tran_HdrRow.XMLASSETNUMBERDTLS);

                        if (!objFA_Asset_Tran_HdrRow.IsXMLOtherDtlsNull())
                            db.AddInParameter(command, "@XMLOtherDtls", DbType.String, objFA_Asset_Tran_HdrRow.XMLOtherDtls);
                    }

                   

                    db.AddInParameter(command, "@ISIB", DbType.String, objFA_Asset_Tran_HdrRow.ISIB);

                    db.AddOutParameter(command, "@OutHT_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);
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

                                if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                                {
                                    strErrorMsg = "";
                                }
                                else
                                    strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;

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

        public int FunPubCancelAssetTran(FASerializationMode SerMode, byte[] bytesobjFA_Asset_Tran_HdrDataTable)
        {
            intErrorCode = 0;
            try
            {
                objFA_Asset_Tran_HdrDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_Asset_Tran_HdrDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_Tran_HdrRow objFA_Asset_Tran_HdrRow in objFA_Asset_Tran_HdrDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Cancel_Asset_Tran");
                    if (!objFA_Asset_Tran_HdrRow.IsCompany_IdNull())
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Company_Id);
                    if (!objFA_Asset_Tran_HdrRow.IsCreated_byNull())
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Created_by);
                    if (!objFA_Asset_Tran_HdrRow.IsAsset_Tran_IdNull())
                        db.AddInParameter(command, "@Asset_Tran_Id", DbType.Int32, objFA_Asset_Tran_HdrRow.Asset_Tran_Id);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                            if ((int)command.Parameters["@OutResult"].Value > 0)
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            else
                                trans.Commit();
                        }
                        catch (Exception ex)
                        {
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
