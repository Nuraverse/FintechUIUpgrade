#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Month And Year Lock
/// Created By			: Manikandan .R
/// Created Date		: 04-APR-2012
/// Purpose	            : To Create/Update/Revoke Month And Year Lock
/// <Program Summary>
#endregion

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

namespace FA_DALayer.SysAdmin
{
    

    public class ClsPubMonthYearLock
    {
        #region "Initialization"
        int intRowsAffected;
        string strConnection = string.Empty;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable ObjMonthLockDataTable;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable ObjYearLockDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubMonthYearLock(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion


        #region Functions

        #region [Insert Function for Month Lock]
        /// <summary>
        /// Created By Manikandan. R
        /// created Date 04/Apr/2012
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_MonthLockDataTable"></param>
        /// <returns></returns>

        public int FunInsertMonthLock(FASerializationMode SerMode, byte[] bytesObjSNXG_MonthLockDataTable, string strMode, string strConnectionName)
        {
            int intErrorCode = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable dtMonthLock = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable();
            ObjMonthLockDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable)FAClsPubSerialize.DeSerialize(bytesObjSNXG_MonthLockDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_MonthLockRow ObjMonthLockRow = ObjMonthLockDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_MonthLock");
                if (ObjMonthLockRow.Month_Lock_ID == 0)
                {
                    //Modified By Chandrasekar K On 3-Dec-2012
                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XmlMonth", OracleType.Clob,
                                        ObjMonthLockRow.XmlMonth.Length, ParameterDirection.Input, true,
                                        0, 0, String.Empty, DataRowVersion.Default, ObjMonthLockRow.XmlMonth);
                        command.Parameters.Add(param);

                        if (!ObjMonthLockRow.IsXmlMonthRevNull())
                        {
                            OracleParameter param1 = new OracleParameter("@XmlMonthRev", OracleType.Clob,
                                            ObjMonthLockRow.XmlMonthRev.Length, ParameterDirection.Input, true,
                                            0, 0, String.Empty, DataRowVersion.Default, ObjMonthLockRow.XmlMonthRev);
                            command.Parameters.Add(param1);
                        }

                    }
                    else
                    {
                        db.AddInParameter(command, "@XmlMonth", DbType.String, ObjMonthLockRow.XmlMonth);
                        if (!ObjMonthLockRow.IsXmlMonthRevNull())
                            db.AddInParameter(command, "@XmlMonthRev", DbType.String, ObjMonthLockRow.XmlMonthRev);
                    }
                    
                    db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intErrorCode);
                    db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intErrorCode = (int)command.Parameters["@ReturnOutput"].Value;
                            if ((int)command.Parameters["@ErrorValue"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception Ex)
            {
                intErrorCode = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return intErrorCode;
        }
    
        
        
        #endregion


        #region [Insert Function for Year Lock]
        /// <summary>
        /// Created By Manikandan.R
        /// created Date 04/Apr/2012
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_YearLockDataTable"></param>
        /// <returns></returns>

        public int FunInsertYearLock(FASerializationMode SerMode, byte[] bytesObjSNXG_YearLockDataTable, string strMode, string strConnectionName)
        {
            int intErrorCode = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable dtYearLock = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable();
            ObjYearLockDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable)FAClsPubSerialize.DeSerialize(bytesObjSNXG_YearLockDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearLockRow ObjYearLockRow = ObjYearLockDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_YearLock");
                if (ObjYearLockRow.Yr_Lock_ID != 0)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjYearLockRow.Company_ID);
                    db.AddInParameter(command, "@Fin_Year", DbType.String, ObjYearLockRow.Fin_Year);
                    if(!ObjYearLockRow.IsNext_Yr_OpenNull())
                        db.AddInParameter(command, "@Next_Yr_Open", DbType.Boolean, ObjYearLockRow.Next_Yr_Open);
                    if(!ObjYearLockRow.IsNxt_Yr_Open_ByNull())
                        db.AddInParameter(command, "@Nxt_Yr_Open_By", DbType.Int32, ObjYearLockRow.Nxt_Yr_Open_By);
                    if(!ObjYearLockRow.IsNxt_Yr_Open_DateNull())
                        db.AddInParameter(command, "@Nxt_Yr_Open_Date", DbType.DateTime, ObjYearLockRow.Nxt_Yr_Open_Date);
                    db.AddInParameter(command, "@Final_Lock", DbType.Boolean, ObjYearLockRow.Final_Lock);
                    db.AddInParameter(command, "@Created_By", DbType.Boolean, ObjYearLockRow.Created_By);
                    db.AddInParameter(command, "@Created_Date", DbType.DateTime, ObjYearLockRow.Created_Date);
                    if (!ObjYearLockRow.IsModified_ByNull())
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjYearLockRow.Modified_By);
                    if (!ObjYearLockRow.IsModified_DateNull())
                        db.AddInParameter(command, "@Modified_Date", DbType.DateTime, ObjYearLockRow.Modified_Date);
                    db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intErrorCode);
                    db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intErrorCode = (int)command.Parameters["@ReturnOutput"].Value;
                            if ((int)command.Parameters["@ErrorValue"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intErrorCode.ToString());
                            }
                            else
                            {
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            if (intErrorCode == 0)
                                intErrorCode = 50;
                              FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception Ex)
            {
                intErrorCode = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(Ex, strConnection);
                throw Ex;
            }
            return intErrorCode;
        }

        #endregion

        #endregion


    }
}
