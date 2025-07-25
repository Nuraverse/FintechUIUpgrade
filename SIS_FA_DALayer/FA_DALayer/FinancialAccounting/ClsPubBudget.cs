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

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubBudget
    {
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;

        FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable objBudgetMst_List;
        Database db;
        public ClsPubBudget(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }
        public int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List, out int int_budget_id, string strConnectionName)
        {
            try
            {
                int_budget_id = intErrorCode = 0;
                objBudgetMst_List = (FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjBudgetMst_List, SerMode, typeof(FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_Budget_MSTRow objbudgetmstrow in objBudgetMst_List.Rows)
                {
                    if (objbudgetmstrow.Option == 1)

                        command = db.GetStoredProcCommand("FA_INS_BUDGET");
                    else if (objbudgetmstrow.Option == 2)
                        command = db.GetStoredProcCommand("FA_Update_Budget");


                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objbudgetmstrow.Company_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objbudgetmstrow.Location_ID);
                    db.AddInParameter(command, "@User_ID ", DbType.Int32, objbudgetmstrow.User_ID);
                    if (objbudgetmstrow.BudgetMaster_ID > 0)
                        db.AddInParameter(command, "@BUDGETMASTER_ID", DbType.Int32, objbudgetmstrow.BudgetMaster_ID);
                    db.AddInParameter(command, "@Gl_Code", DbType.String, objbudgetmstrow.GL_Account_Code);
                    db.AddInParameter(command, "@SL_Code", DbType.String, objbudgetmstrow.SL_Account_Code);
                    db.AddInParameter(command, "@Budget_Type", DbType.Int32, objbudgetmstrow.Budget_Type);

                    db.AddInParameter(command, "@Budget_Pattern", DbType.Int32, objbudgetmstrow.Budget_Pattern);
                    db.AddInParameter(command, "@Fin_Year ", DbType.String, objbudgetmstrow.Fin_Year);
                    db.AddInParameter(command, "@Yearly_Amount", DbType.Decimal, objbudgetmstrow.Yearly_Amount);
                    db.AddInParameter(command, "@XML_Tran_DTL", DbType.String, objbudgetmstrow.XML_Tran_DTL);
                    db.AddInParameter(command, "@IS_Active ", DbType.Int32, objbudgetmstrow.Is_Active);
                    db.AddInParameter(command, "@Txn_Date ", DbType.DateTime, objbudgetmstrow.Trans_Date);
                    db.AddInParameter(command, "@Option", DbType.Int32, objbudgetmstrow.Option);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@outBudgetMaster_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
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
                                int int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {
                                trans.Commit();
                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                if ((int)command.Parameters["@outBudgetMaster_ID"].Value > 0)
                                    int_budget_id = Convert.ToInt32(command.Parameters["@outBudgetMaster_ID"].Value);
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
                        {
                            conn.Close();
                        }
                    }
                }
            }



            catch (Exception exp)
            {

                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                throw exp;
            }
            return int_OutResult;

        }
    }
}
