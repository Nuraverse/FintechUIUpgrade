#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Financial Accounting
/// Screen Name			: Account card
/// Created By			: M.saran
/// Created Date		: 
/// Purpose	            : To Create/Update Account Card

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
    public class ClsPubNCDUpload
    {

        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_NCDUploadDataTable objNCDDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubNCDUpload(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region "Insert NCD Upload"
        public int FunPubInsertNCDUpload(FASerializationMode SerMode, byte[] bytesobjNCDUploadDataTable, out int intRec, out int intProc)
        {
            try
            {
                intRec = intProc = 0;
                objNCDDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_NCDUploadDataTable)FAClsPubSerialize.DeSerialize(bytesobjNCDUploadDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_NCDUploadDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_NCDUploadRow ObjNCDUploadRow in objNCDDataTable.Rows)
                {
                    if(!ObjNCDUploadRow.IsOptionNull())
                        command = db.GetStoredProcCommand("FA_INS_NCDBond_Pri");
                    else
                        command = db.GetStoredProcCommand("FA_INS_NCDBond");

                    
                    db.AddInParameter(command, "@File_Name", DbType.String, ObjNCDUploadRow.File_Name);
                    db.AddInParameter(command, "@File_Dtl", DbType.String, ObjNCDUploadRow.File_Dtl);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjNCDUploadRow.User_ID);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjNCDUploadRow.Company_ID);
                   
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@No_of_Rec", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@No_of_Proc", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                            }
                            else
                            {
                                trans.Commit();
                                intRec = (int)command.Parameters["@No_of_Rec"].Value;
                                intProc = (int)command.Parameters["@No_of_Proc"].Value;
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


         #region "Getting Connection String"

        public string FunPubGetConStringNCDUpload()
        {
            return db.ConnectionString;
        }

        #endregion


    }
}
