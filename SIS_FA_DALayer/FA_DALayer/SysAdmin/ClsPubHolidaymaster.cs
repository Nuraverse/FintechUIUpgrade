using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;




namespace FA_DALayer.SysAdmin
{
    public class ClsPubHolidaymaster
    {
         #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable ObjMasterDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubHolidaymaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        public int FunPubInsertHolidayMaster(FASerializationMode SerMode, byte[] byteObjFA_Master, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;
            FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable dtmaster = new FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable();
            ObjMasterDataTable = (FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_Master, SerMode, typeof(FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable));
            FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstRow ObjMasterRow = ObjMasterDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_HOLIDAY_MST");
                db.AddInParameter(command, "@distinct_id", DbType.Int32, ObjMasterRow.Distinct_Id);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjMasterRow.Company_id);
                db.AddInParameter(command, "@user_id", DbType.Int32, ObjMasterRow.User_id);
                db.AddInParameter(command, "@location_id", DbType.Int32, ObjMasterRow.Location_id);
                db.AddInParameter(command, "@year", DbType.String, ObjMasterRow.year);
                db.AddInParameter(command, "@date", DbType.DateTime, ObjMasterRow.date);
                db.AddInParameter(command, "@XML_Weekend", DbType.String, ObjMasterRow.XML_Weekend);
                db.AddInParameter(command, "@XML_HOliday", DbType.String, ObjMasterRow.XML_HOliday);
                db.AddOutParameter(command, "@OutResult", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);
                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
                        intOutPutValue = (int)command.Parameters["@OutResult"].Value;
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        {
                            throw new Exception("Error thrown Error No" + intOutPutValue.ToString());
                        }
                        else
                        {
                            trans.Commit();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intOutPutValue == 0)
                            intOutPutValue = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        trans.Rollback();
                    }
                    finally
                    { conn.Close(); }
                }
            }
            catch (Exception Ex)
            {
                intOutPutValue = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return intOutPutValue;
        }



    }
}
