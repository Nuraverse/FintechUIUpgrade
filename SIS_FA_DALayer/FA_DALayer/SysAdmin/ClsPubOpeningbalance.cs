using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.OracleClient;

namespace FA_DALayer.SysAdmin
{
    public class ClsPubOpeningbalance
    {
         #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable ObjOpeningbalanceDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubOpeningbalance(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

         #region [Function's]

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 01/02/2012
        /// For Insert and Update process for Global Parameter setup screen
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_DimensionMaster"></param>
        /// <returns></returns>
       
        public int FunPubInsertUpdateOpeningbalance(FASerializationMode SerMode, byte[] byteObjFA_opening, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable ObjOpeningDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable();
            ObjOpeningDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_opening, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceDataTable));
            //FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceRow ObjopeningRow = ObjOpeningDataTable[0];
            
            try
            {
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_OpeningbalanceRow ObjopeningRow in ObjOpeningDataTable.Rows)
                {
                    DbCommand command = db.GetStoredProcCommand("FA_UPDATE_OpeningBalance");
               
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjopeningRow.Company_ID);
                //db.AddInParameter(command, "@XML_detail", DbType.String, ObjopeningRow.XML_Detail);
                db.AddInParameter(command, "@user_id", DbType.Int32, ObjopeningRow.User_id);
                db.AddInParameter(command, "@finmonth", DbType.Int32, ObjopeningRow.Fin_month);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                if (enumDBType == FADALDBType.ORACLE)
                {
                    OracleParameter param = new OracleParameter("@XML_detail", OracleType.Clob,
                           ObjopeningRow.XML_Detail.Length, ParameterDirection.Input, true,
                           0, 0, String.Empty, DataRowVersion.Default, ObjopeningRow.XML_Detail);
                    command.Parameters.Add(param);
                }
                else
                {
                    db.AddInParameter(command, "@XML_detail", DbType.String, ObjopeningRow.XML_Detail);
                }

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //Modified By Chandrasekar K On 20-09-2012
                        db.FunPubExecuteNonQuery(command, ref trans);
                        //db.ExecuteNonQuery(command, trans);
                        intOutPutValue = (int)command.Parameters["@ReturnOutput"].Value;
                        if ((int)command.Parameters["@ErrorValue"].Value > 0)
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
                    { 
                        conn.Close(); 
                    }
                }
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

        #endregion [Function's]
    }
}
