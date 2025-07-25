#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Challan Generation
/// Created By			: M.saran
/// Created Date		: 
/// Purpose	            : To Create/Update Challan Generation

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
#endregion [Namespace]


namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubChallanGeneration
    {
        #region [Initialization]
        int intRowsAffected;
        int intErrorCode;
        string strConnection = string.Empty;

        FA_BusEntity.FinancialAccounting.ChallanMgtServices.FA_ChallanGenerationDataTable objFA_ChallanGenerationDataTable;

        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubChallanGeneration(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion


        #region Insert/Update Challan Generation

        /// <summary>
        /// Insert/Update Payment Request Details 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjFATran_Header_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubInsertChallanGeneration(FASerializationMode SerMode, byte[] bytesobjFA_ChallanGenerationDataTable, out string ChallanDocNo, out string strErrorMsg)
        {
            try
            {
                intErrorCode = 0;
                ChallanDocNo = "";
                strErrorMsg = "";
                objFA_ChallanGenerationDataTable = (FA_BusEntity.FinancialAccounting.ChallanMgtServices.FA_ChallanGenerationDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_ChallanGenerationDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.ChallanMgtServices.FA_ChallanGenerationDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.ChallanMgtServices.FA_ChallanGenerationRow objFA_ChallanGenerationRow in objFA_ChallanGenerationDataTable.Rows)
                {

                    command = db.GetStoredProcCommand("FA_Insert_Challan_Gen");



                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_ChallanGenerationRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objFA_ChallanGenerationRow.User_Id);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objFA_ChallanGenerationRow.Location_Id);
                    if (!objFA_ChallanGenerationRow.IsDeposit_bank_IDNull())
                        db.AddInParameter(command, "@Deposit_bank_ID", DbType.Int32, objFA_ChallanGenerationRow.Deposit_bank_ID);
                    if (!objFA_ChallanGenerationRow.IsChallan_NoNull())
                        db.AddInParameter(command, "@Challan_No", DbType.String, objFA_ChallanGenerationRow.Challan_No);
                    if (!objFA_ChallanGenerationRow.IsReceipt_CodeNull())
                        db.AddInParameter(command, "@Receipt_Code", DbType.Int32, objFA_ChallanGenerationRow.Receipt_Code);
                    if (!objFA_ChallanGenerationRow.IsInstr_CodeNull())
                        db.AddInParameter(command, "@Instr_Code", DbType.Int32, objFA_ChallanGenerationRow.Instr_Code);
                    if (!objFA_ChallanGenerationRow.IsChallan_DateNull())
                        db.AddInParameter(command, "@Challan_Date", DbType.DateTime, objFA_ChallanGenerationRow.Challan_Date);
                    if (!objFA_ChallanGenerationRow.IsXMLChallanDetailsNull())
                        db.AddInParameter(command, "@XMLChallanDetails", DbType.String, objFA_ChallanGenerationRow.XMLChallanDetails);
                    if (!objFA_ChallanGenerationRow.IsPast_ReceiptNull())
                        db.AddInParameter(command, "@Past_Receipt", DbType.String, objFA_ChallanGenerationRow.Past_Receipt);
                    if (!objFA_ChallanGenerationRow.IsActivity_IdNull())
                        db.AddInParameter(command, "@Activity_ID", DbType.String, objFA_ChallanGenerationRow.Activity_Id);
                    db.AddOutParameter(command, "@ErrorMsg", DbType.String, 1000);

                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@ChallanDocNo", DbType.String, 8000);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            ChallanDocNo = (string)command.Parameters["@ChallanDocNo"].Value;
                            if (command.Parameters["@ErrorMsg"].Value == DBNull.Value)
                            {
                                strErrorMsg = "";
                            }
                            else
                                strErrorMsg = (string)command.Parameters["@ErrorMsg"].Value;
                            if ((int)command.Parameters["@ReturnTranValue"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intRowsAffected == 0)
                                intRowsAffected = 50;
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
                intRowsAffected = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intRowsAffected;
        }

        #endregion

    }
}
