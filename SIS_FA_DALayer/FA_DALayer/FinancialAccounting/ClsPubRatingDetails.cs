using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubRatingDetails
    {
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FATransactions.FA_TR_RatingDataTableDataTable ObjRatingDataTable;
        Database db;
        public ClsPubRatingDetails(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;


        }


        public int FunPubInsertRatingDetails(FASerializationMode SerMode, byte[] bytesObjRatingDataTable)
        {
            try
            {

                ObjRatingDataTable = (FA_BusEntity.FinancialAccounting.FATransactions.FA_TR_RatingDataTableDataTable)FAClsPubSerialize.DeSerialize(bytesObjRatingDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.AccountManagement.FA_AccountCardDataTable));
                DbCommand command =null;

                foreach (FA_BusEntity.FinancialAccounting.FATransactions.FA_TR_RatingDataTableRow ObjRatingTableRow in ObjRatingDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_RatingMaster");
                    db.AddInParameter(command, "@Rate_Id", DbType.Int32, ObjRatingTableRow.Rate_Id);
                    db.AddInParameter(command, "@RatingAgency", DbType.String, ObjRatingTableRow.Rating_Agency);
                    db.AddInParameter(command, "@BorrowingTerm ", DbType.String, ObjRatingTableRow.Borrowing_Term);
                    db.AddInParameter(command, "@RatingAssigned", DbType.String, ObjRatingTableRow.Rating_Assigned);
                    db.AddInParameter(command, "@ValidFrom", DbType.DateTime, ObjRatingTableRow.Valid_From);
                    db.AddInParameter(command, "@RatingReference", DbType.String, ObjRatingTableRow.Rating_Reference);
                    db.AddInParameter(command, "@RatingAmount", DbType.Int32, ObjRatingTableRow.Rating_Amount);
                    db.AddInParameter(command, "@ValidTo", DbType.DateTime, ObjRatingTableRow.Valid_To);
                    db.AddInParameter(command, "@DateofRating", DbType.DateTime, ObjRatingTableRow.Date_of_Rating);
                    db.AddInParameter(command, "@CompanyId", DbType.Int32, ObjRatingTableRow.Company_Id);
                    db.AddInParameter(command, "@UserID", DbType.Int32, ObjRatingTableRow.User_Id);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //Modified By Chandrasekar K On 22-Sep-2012
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            if (intRowsAffected == 0)
                            {
                                trans.Commit();
                            }                            
                        }
                        catch (Exception ex)
                        {
                            if (intRowsAffected >0)
                                intRowsAffected = 50;
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
            catch (Exception ex)
            {
                intRowsAffected = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intRowsAffected;
        }
    }
}