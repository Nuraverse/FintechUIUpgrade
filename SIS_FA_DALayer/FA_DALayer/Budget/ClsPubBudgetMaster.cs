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
    public class ClsPubBudgetMaster
    {
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;

        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTDataTable objBudgetMst_List;
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubBudgetMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }
        public int FunPubCreateBudget(FASerializationMode SerMode, byte[] bytesobjBudgetMst_List)
        {
            try
            {
                intErrorCode = 0;
                objBudgetMst_List = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesobjBudgetMst_List, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUDGET_MSTRow objbudgetmstrow in objBudgetMst_List.Rows)
                {


                    command = db.GetStoredProcCommand("FA_INS_UP_BUDGET_MST");
                    db.AddInParameter(command, "@Budget_ID", DbType.Int32, objbudgetmstrow.BUDGET_MST_ID);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objbudgetmstrow.COMPANY_ID);
                    db.AddInParameter(command, "@User_ID ", DbType.Int32, objbudgetmstrow.USER_ID);
                    db.AddInParameter(command, "@Gl_Code", DbType.String, objbudgetmstrow.GL_CODE);
                    db.AddInParameter(command, "@Budget_Pattern", DbType.Int32, objbudgetmstrow.BUDGET_PATTERN);
                    db.AddInParameter(command, "@Fin_Year ", DbType.String, objbudgetmstrow.FIN_YEAR);
                    db.AddInParameter(command, "@YEARLY_BUDGET", DbType.Decimal, objbudgetmstrow.YEAR_BUDGET);
                    db.AddInParameter(command, "@Activity_Id", DbType.Decimal, objbudgetmstrow.ACTIVITY_ID);
                    db.AddInParameter(command, "@Currency_Id", DbType.Decimal, objbudgetmstrow.CURRENCY_ID);


                    // XMl Parameter Add

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XML_Location_DTL", OracleType.Clob,
                               objbudgetmstrow.XML_Location_DTL.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, objbudgetmstrow.XML_Location_DTL);
                        command.Parameters.Add(param);

                        OracleParameter param1 = new OracleParameter("@XML_Current_Budget_DTL", OracleType.Clob,
                                    objbudgetmstrow.XML_Current_Budget_DTL.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objbudgetmstrow.XML_Current_Budget_DTL);
                        command.Parameters.Add(param1);


                        OracleParameter param2 = new OracleParameter("@XML_Projected_Butget_DTL", OracleType.Clob,
                                    objbudgetmstrow.XML_Projected_Butget_DTL.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, objbudgetmstrow.XML_Projected_Butget_DTL);
                        command.Parameters.Add(param2);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XML_Location_DTL", DbType.String, objbudgetmstrow.XML_Location_DTL);
                        db.AddInParameter(command, "@XML_Current_Budget_DTL", DbType.String, objbudgetmstrow.XML_Current_Budget_DTL);
                        db.AddInParameter(command, "@XML_Projected_Butget_DTL", DbType.String, objbudgetmstrow.XML_Projected_Butget_DTL);
                    }

                    //db.AddInParameter(command, "@XML_Location_DTL", DbType.String, objbudgetmstrow.XML_Location_DTL);
                    //db.AddInParameter(command, "@XML_Current_Budget_DTL", DbType.String, objbudgetmstrow.XML_Current_Budget_DTL);
                    //db.AddInParameter(command, "@XML_Projected_Butget_DTL", DbType.String, objbudgetmstrow.XML_Projected_Butget_DTL);

                    db.AddInParameter(command, "@IS_Active ", DbType.Int32, objbudgetmstrow.IS_ACTIVE);
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
                                //if ((int)command.Parameters["@outBudgetMaster_ID"].Value > 0)
                                // int_budget_id = Convert.ToInt32(command.Parameters["@outBudgetMaster_ID"].Value);
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
