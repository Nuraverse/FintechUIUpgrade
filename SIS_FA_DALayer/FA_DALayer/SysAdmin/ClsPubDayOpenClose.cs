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
    

    public class ClsPubDayOpenClose
    {
        #region "Initialization"
        int intRowsAffected;
        string strConnection = string.Empty;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable ObjDAyopenDataTable;
        
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubDayOpenClose(string strConnectionName)
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

        public int FunInsertDayOpenClose(FASerializationMode SerMode, byte[] bytesObjFA_DAY_OPEN_CLOSEDataTable, string strMode, string strConnectionName)
        {
            int intErrorCode = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable dtdayopenclose = new FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable();
            ObjDAyopenDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_DAY_OPEN_CLOSEDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSERow ObjDayopenRow = ObjDAyopenDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_UPD_DAYOPENCLOSE");
               
                    if (!ObjDayopenRow.IsCompany_idNull())
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjDayopenRow.Company_id);
                    if (!ObjDayopenRow.IsDay_Open_IDNull())
                        db.AddInParameter(command, "@Day_Open_ID", DbType.Int32, ObjDayopenRow.Day_Open_ID);
                    if (!ObjDayopenRow.IsOPEN_CLOSE_TYPENull())
                        db.AddInParameter(command, "@Open_Close_Type", DbType.Int32, ObjDayopenRow.OPEN_CLOSE_TYPE);
                    if (!ObjDayopenRow.IsLocation_IDNull())
                        db.AddInParameter(command, "@location_Id", DbType.Int32, ObjDayopenRow.Location_ID);
                    if (!ObjDayopenRow.IsTran_DateNull())
                        db.AddInParameter(command, "@Tran_Date", DbType.DateTime, ObjDayopenRow.Tran_Date);

                    if (!ObjDayopenRow.IsOpening_BalanceNull())
                        db.AddInParameter(command, "@Opening_Balance", DbType.Decimal, ObjDayopenRow.Opening_Balance);

                    if (!ObjDayopenRow.IsClosing_BalanceNull())
                        db.AddInParameter(command, "@Closing_Balance", DbType.Decimal, ObjDayopenRow.Closing_Balance);

                    if (!ObjDayopenRow.IsCASH_BALANCENull())
                        db.AddInParameter(command, "@cash_balance", DbType.Decimal, ObjDayopenRow.CASH_BALANCE);

                    if (!ObjDayopenRow.IsCASH_RECEIPT_NONull())
                        db.AddInParameter(command, "@CASH_RECEIPT_NO", DbType.String, ObjDayopenRow.CASH_RECEIPT_NO);

                    if (!ObjDayopenRow.IsOPENED_BYNull())
                        db.AddInParameter(command, "@OPENED_BY", DbType.String, ObjDayopenRow.OPENED_BY);
                    if (!ObjDayopenRow.IsOPENED_ONNull())
                        db.AddInParameter(command, "@OPENED_ON", DbType.DateTime, ObjDayopenRow.OPENED_ON);
                    if (!ObjDayopenRow.IsCLOSED_BYNull())
                        db.AddInParameter(command, "@CLOSED_BY", DbType.String, ObjDayopenRow.CLOSED_BY);
                    if (!ObjDayopenRow.IsCLOSED_ONNull())
                        db.AddInParameter(command, "@CLOSED_ON", DbType.DateTime, ObjDayopenRow.CLOSED_ON);
                    if (!ObjDayopenRow.IsOPEN_STATUS_IDNull())
                        db.AddInParameter(command, "@OPEN_STATUS_ID", DbType.String, ObjDayopenRow.OPEN_STATUS_ID);
                    if (!ObjDayopenRow.IsCLOSE_CASH_RECEIPT_NONull())
                        db.AddInParameter(command, "@CLOSE_CASH_RECEIPT_NO", DbType.String, ObjDayopenRow.CLOSE_CASH_RECEIPT_NO);

                    if (!ObjDayopenRow.IsXML_DenominationNull())
                    {

                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Denomination", OracleType.Clob,
                                            ObjDayopenRow.XML_Denomination.Length, ParameterDirection.Input, true,
                                            0, 0, String.Empty, DataRowVersion.Default, ObjDayopenRow.XML_Denomination);
                            command.Parameters.Add(param);



                        }
                        else
                        {
                            db.AddInParameter(command, "@XML_Denomination", DbType.String, ObjDayopenRow.XML_Denomination);

                            
                        }
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
