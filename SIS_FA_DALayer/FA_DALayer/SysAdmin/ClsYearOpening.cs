
#region [NAMESPACE]
using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
using System.Data.OracleClient;//Added by Srivatsan R for Oracle Conversion
#endregion

namespace FA_DALayer.SysAdmin
{
    public class ClsYearOpening
    {
        #region "Initialization"
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCDataTable ObjOpenDNCDataTable;

        //Code added for getting common connection string  from config file
        Database db;
        public ClsYearOpening(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion
        public int FunPubInsertDNC_YearOpen(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCDataTable DtOpenDNC = new FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCDataTable();
            ObjOpenDNCDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_YearOpen, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCDataTable));

            FA_BusEntity.SysAdmin.SystemAdmin.FY_SYS_OpenDNCRow ObjOpenDNCRow = ObjOpenDNCDataTable[0];

            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_DNC_FY");
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjOpenDNCRow.Company_ID);
                db.AddInParameter(command, "@Schema_Name", DbType.String, ObjOpenDNCRow.Schema_Name);
                FA_DALayer.FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                if (enumDBType == FADALDBType.ORACLE)//Added by Srivatsan R for Oracle Conversion
                {
                    if (!ObjOpenDNCRow.IsXmlDNCNull())
                    {
                        OracleParameter param = new OracleParameter("@XML_DNC",
                               OracleType.Clob, ObjOpenDNCRow.XmlDNC.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, ObjOpenDNCRow.XmlDNC);
                        command.Parameters.Add(param);
                    }

                }
                else
                {
                    db.AddInParameter(command, "@XML_DNC", DbType.String, ObjOpenDNCRow.XmlDNC);
                }
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);


                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        if (enumDBType == FADALDBType.ORACLE)//Added by Srivatsan R for Oracle Conversion
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                        }
                        else
                        {
                            db.ExecuteNonQuery(command, trans);
                        }
                        intOutPutValue = (int)command.Parameters["@ErrorCode"].Value;
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

        public int FunPubInsertGL_Sum(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;

            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearOpenDataTable DtYearOpen = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearOpenDataTable();

            DtYearOpen = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearOpenDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_YearOpen, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearOpenDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_YearOpenRow ObjYearOpenRow = DtYearOpen[0];
            FA_DALayer.FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_INS_GL_Sum");
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjYearOpenRow.Company_ID);
                db.AddInParameter(command, "@Schema_Name", DbType.String, ObjYearOpenRow.Schema_Name);
                db.AddInParameter(command, "@Fin_Year", DbType.String, ObjYearOpenRow.Fin_Year);
                db.AddInParameter(command, "@Nxt_Yr_Open", DbType.String, ObjYearOpenRow.Next_Yr_Open);
                db.AddInParameter(command, "@Nxt_Open_By", DbType.Int32, ObjYearOpenRow.Nxt_Yr_Open_By);
                db.AddInParameter(command, "@Nxt_Yr_Open_Date", DbType.DateTime, ObjYearOpenRow.Nxt_Yr_Open_Date);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);


                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        if (enumDBType == FADALDBType.ORACLE)//Added by Srivatsan R for Oracle Conversion
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                        }
                        else
                        {
                            db.ExecuteNonQuery(command, trans);
                        }
                        intOutPutValue = (int)command.Parameters["@ErrorCode"].Value;
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

        public int FunPubMoveTableRecord(string strSchemaName, string strConnectionName)
        {
            int intOutPutValue = 0;

            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_SYS_MoveTable_REC");
                db.AddInParameter(command, "@Schema_Name", DbType.String, strSchemaName);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    FA_DALayer.FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;


                    try
                    {
                        if (enumDBType == FADALDBType.ORACLE)//Added by Srivatsan R for Oracle Conversion
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                        }
                        else
                        {
                            db.ExecuteNonQuery(command, trans);
                        }
                        intOutPutValue = (int)command.Parameters["@ErrorCode"].Value;
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
                    {
                        conn.Close();
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
    }
}

