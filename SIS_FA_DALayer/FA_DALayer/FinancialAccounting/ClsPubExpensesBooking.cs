#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Expenses Booking
/// Created By			: Arunkumar k
/// Created Date		: 
/// Purpose	            : To Create Expenses Booking
/// <Program Summary>
#endregion

#region [Namespace]
using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
using System.Data.OracleClient;
#endregion [Namespace]

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubExpensesBooking
    {

        #region [Initialization]
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingDataTable objExpensesbookingDataTable;

        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubExpensesBooking(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region "Insert Expensesbook"
        public int FunPubInsertExpensesbook(FASerializationMode SerMode, byte[] bytesobjexpensebookDataTable, string strConnectionName, out int intHT_ID, out string strDocNo, out string strErrormsg)
        {
            strDocNo = "";
            strErrormsg = "";
            try
            {
                intHT_ID = intErrorCode = 0;
                objExpensesbookingDataTable = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingDataTable)FAClsPubSerialize.DeSerialize(bytesobjexpensebookDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingRow objexpensebookrow in objExpensesbookingDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_EXP_Trans");

                    db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, objexpensebookrow.Company_id);
                    db.AddInParameter(command, "@EXP_TRAN_ID", DbType.Int32, objexpensebookrow.Tran_ID);
                    db.AddInParameter(command, "@LOCATION_ID", DbType.Int32, objexpensebookrow.Location_id);
                    //db.AddInParameter(command, "@location_code", DbType.Int32, objexpensebookrow.Location_code);                    
                    db.AddInParameter(command, "@DOCNO", DbType.String, objexpensebookrow.Doc_no);
                    db.AddInParameter(command, "@DOCDT", DbType.String, objexpensebookrow.Doc_Date);
                    db.AddInParameter(command, "@ENTITY_ID", DbType.Int32, objexpensebookrow.Entity_ID);
                    db.AddInParameter(command, "@ENTITY_CODE", DbType.String, objexpensebookrow.Entity_code);
                    db.AddInParameter(command, "@EXP_BK_DT", DbType.String, objexpensebookrow.expbookdt);
                    db.AddInParameter(command, "@DOC_STAT", DbType.String, objexpensebookrow.status);
                    //db.AddInParameter(command, "@unit_amt", DbType.Int32, objexpensebookrow.unit_amt);
                    //db.AddInParameter(command, "@TOT_AMT", DbType.Int32, objexpensebookrow.tot_amt);
                    db.AddInParameter(command, "@CREATED_BY", DbType.Int32, objexpensebookrow.created_by);
                    //db.AddInParameter(command, "@CREATED_DATE", DbType.String, objexpensebookrow.created_date);
                    db.AddInParameter(command, "@INV_NO", DbType.String, objexpensebookrow.inv_no);
                    db.AddInParameter(command, "@INV_DT", DbType.String, objexpensebookrow.inv_dt);

                    db.AddInParameter(command, "@INV_AMT", DbType.String, objexpensebookrow.Invoice_Amt);
                    db.AddInParameter(command, "@Is_lpo", DbType.Int32, objexpensebookrow.is_lpo);
                    db.AddInParameter(command, "@Remarks", DbType.String, objexpensebookrow.descr);

                    FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param;
                        if (objexpensebookrow.XMLExpDtls != null)
                        {
                            param = new OracleParameter("@XMLEXPDTLS", OracleType.Clob,
                                objexpensebookrow.XMLExpDtls.Length, ParameterDirection.Input, true,
                                0, 0, String.Empty, DataRowVersion.Default, objexpensebookrow.XMLExpDtls);
                            command.Parameters.Add(param);
                        }
                    }
                    else
                        db.AddInParameter(command, "@XMLEXPDTLS", DbType.String, objexpensebookrow.XMLExpDtls);

                    db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                    // db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@OUTHT_ID", DbType.Int32, sizeof(Int32));
                    //db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OUTRESULT", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);
                    db.AddOutParameter(command, "@OUTDOCNO", DbType.String, 100);
                    db.AddInParameter(command, "@Payment_Due_Date", DbType.String, objexpensebookrow.Payment_Due_Date);
                    db.AddInParameter(command, "@Narration", DbType.String, objexpensebookrow.Narration);
                    db.AddInParameter(command, "@BillType", DbType.String, objexpensebookrow.Bill_Type);
                    db.AddInParameter(command, "@ISIB", DbType.String, objexpensebookrow.ISIB);
                    db.AddInParameter(command, "@Supplier_Name", DbType.String, objexpensebookrow.Supplier_Name);
                    db.AddInParameter(command, "@Activity_ID", DbType.String, objexpensebookrow.Activity_ID);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ERRORCODE"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ERRORCODE"].Value;
                                
                                if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                                {
                                    strErrormsg = "";
                                }
                                else
                                    strErrormsg = (string)command.Parameters["@ErrorMsg"].Value;

                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {

                                if ((int)command.Parameters["@OUTRESULT"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OUTRESULT"].Value);
                                intHT_ID = Convert.ToInt32(command.Parameters["@OUTHT_ID"].Value);
                                strDocNo = Convert.ToString(command.Parameters["@OUTDOCNO"].Value);
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

        public int FunPubCancelExpensesbooking(FASerializationMode SerMode, byte[] bytesobjexpensebookDataTable)
        {
            intErrorCode = 0;
            try
            {
                objExpensesbookingDataTable = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingDataTable)FAClsPubSerialize.DeSerialize(bytesobjexpensebookDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ExpensesbookingRow objexpensebookrow in objExpensesbookingDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_Cancel_Exp_Tran");
                    if (objexpensebookrow.Company_id != null)
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objexpensebookrow.Company_id);
                    if (objexpensebookrow.created_by != null)
                        db.AddInParameter(command, "@User_Id", DbType.Int32, objexpensebookrow.created_by);
                    if (objexpensebookrow.Tran_ID != null)
                        db.AddInParameter(command, "@Exp_Tran_Id", DbType.Int32, objexpensebookrow.Tran_ID);
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

