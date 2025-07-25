using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using FA_BusEntity;
using System.Data.OracleClient;
using System.Xml;
using System.IO;


namespace FA_DALayer
{

    public static partial class ClsPubCommonDB
    {
        /// <summary>
        /// ExecuteNonQuery
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        /// <returns></returns>
        /// 

      
       
        public static int FunPubExecuteNonQuery(this Database db, DbCommand command)
        {
            int intReturnVal;
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                }

                intReturnVal = db.ExecuteNonQuery(command);

                if (enumDBType == FADALDBType.ORACLE)
                {
                    FunReplaceOracleParameterOut(ref command);
                }
                return intReturnVal;

            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;
            }
        }

        /// <summary>
        /// ExecuteNonQuery with transaction
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="trans">System.Data.Common.DbTransaction</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        /// <returns></returns>
        public static int FunPubExecuteNonQuery(this Database db, DbCommand command, ref DbTransaction trans)
        {
            int intReturnVal;
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                }

                intReturnVal = db.ExecuteNonQuery(command, trans);
                if (enumDBType == FADALDBType.ORACLE)
                {
                    FunReplaceOracleParameterOut(ref command);
                }
                return intReturnVal;
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;

            }
        }

        /// <summary>
        /// LoadDataSet
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="DSet">System.Data.DataSet</param>
        /// <param name="strTableName">System.String</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        public static void FunPubLoadDataSet(this Database db, DbCommand command, DataSet DSet, string strTableName)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                    AddCursorOutParameter(ref command, db.ConnectionString);
                }

                db.LoadDataSet(command, DSet, strTableName);


                if (enumDBType == FADALDBType.ORACLE)
                {
                    DSet = FunRemoveDummyTable(DSet);
                    FunReplaceOracleParameterOut(ref command);
                }
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;

            }
        }

        /// <summary>
        /// LoadDataSet
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="DSet">System.Data.DataSet</param>
        /// <param name="strTableName">System.String</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        public static void FunPubLoadDataSetStringQuery(this Database db, DbCommand command, DataSet DSet, string strTableName)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                db.LoadDataSet(command, DSet, strTableName);

                if (enumDBType == FADALDBType.ORACLE)
                {
                    DSet = FunRemoveDummyTable(DSet);
                }

            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;
            }
        }

        /// <summary>
        /// LoadDataSet - Table Collections
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="DSet">System.Data.DataSet</param>
        /// <param name="strTableName">System.String</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        public static void FunPubLoadDataSet(this Database db, DbCommand command, DataSet DSet, string[] strTableName)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                    AddCursorOutParameter(ref command, db.ConnectionString);
                }

                db.LoadDataSet(command, DSet, strTableName);

                if (enumDBType == FADALDBType.ORACLE)
                {
                    DSet = FunRemoveDummyTable(DSet);
                    FunReplaceOracleParameterOut(ref command);
                }
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;
            }
        }

        /// <summary>
        /// ExecuteReader
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <param name="enumDBType">S3GBusEntity.S3GDBType</param>
        /// <returns></returns>
        public static IDataReader FunPubExecuteReader(this Database db, DbCommand command)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                    AddCursorOutParameter(ref command, db.ConnectionString);
                }

                return db.ExecuteReader(command);
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;

            }
        }

        /// <summary>
        /// ExecuteDataSet
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <returns></returns>
        public static DataSet FunPubExecuteDataSet(this Database db, DbCommand command)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                DataSet ObjDataSet = new DataSet();

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                    AddCursorOutParameter(ref command, db.ConnectionString);
                }
                ObjDataSet = db.ExecuteDataSet(command);
                if (enumDBType == FADALDBType.ORACLE)
                {
                    ObjDataSet = FunRemoveDummyTable(ObjDataSet);
                }
                return ObjDataSet;
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;

            }
        }

        /// <summary>
        /// ExecuteScalar
        /// </summary>
        /// <param name="db">Microsoft.Practices.EnterpriseLibrary.Data.Database</param>
        /// <param name="command">System.Data.Common.DbCommand</param>
        /// <returns></returns>
        public static object FunPubExecuteScalar(this Database db, DbCommand command)
        {
            try
            {
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (enumDBType == FADALDBType.ORACLE)
                {
                    //command.FunPubGetORACLE_SP();
                    FunReplaceOracleParameter(ref command, enumDBType);
                    AddCursorOutParameter(ref command, db.ConnectionString);
                }

                return db.ExecuteScalar(command);
            }
            catch (Exception ex)
            {
                int intCountParam = command.Parameters.Count;
                FunGetParameterCommonErrorLogDB(db, command, intCountParam, ex.Message);
                throw ex;

            }
        }

        /// <summary>
        /// Get the ORACLE SP Name relevant to the SQL SP Name
        /// </summary>
        /// <param name="command"></param>
        public static void FunPubGetORACLE_SP(this DbCommand command)
        {
            try
            {
                FA_BusEntity.SPNames_SQL_ORA.ResourceManager.IgnoreCase = true;
                command.CommandText = FA_BusEntity.SPNames_SQL_ORA.ResourceManager.GetString(command.CommandText.Trim().Replace("[", "").Replace("]", "").Trim());
            }

            catch (Exception ex)
            {

                throw ex;

            }
        }


        #region Methods for ORACLE Commands

        public static string FunPubGetFormatedXML(string XML)
        {
            XmlDocument doc = new XmlDocument();
            doc.InnerXml = XML;

            StringBuilder strXML = new StringBuilder();
            strXML.Append("<Root>");

            foreach (XmlNode dtlNode in doc.ChildNodes[0].ChildNodes)
            {
                strXML.Append("<Details>");
                foreach (XmlAttribute dtlAttribute in dtlNode.Attributes)
                {
                    strXML.Append("<" + dtlAttribute.Name + ">" + dtlAttribute.Value + "</" + dtlAttribute.Name + ">");
                }
                strXML.Append("</Details>");
            }
            strXML.Append("</Root>");

            return strXML.ToString();
        }

        public static void FunReplaceOracleParameter(ref DbCommand dbCmd, FADALDBType enumDBType)
        {
            try
            {
                for (int i = 0; i <= dbCmd.Parameters.Count - 1; i++)
                {
                    if (dbCmd.Parameters[i].DbType == DbType.Boolean)
                    {
                        dbCmd.Parameters[i].DbType = DbType.Int32;
                        if (!string.IsNullOrEmpty(dbCmd.Parameters[i].Value.ToString()))
                        {
                            if (Convert.ToBoolean(dbCmd.Parameters[i].Value) == true)
                            {
                                dbCmd.Parameters[i].Value = 1;
                            }
                            else
                            {
                                dbCmd.Parameters[i].Value = 0;
                            }
                        }
                    }
                    else if (dbCmd.Parameters[i].DbType == DbType.DateTime)
                    {
                        dbCmd.Parameters[i].DbType = DbType.String;
                        dbCmd.Parameters[i].Value = dbCmd.Parameters[i].Value.ToString();
                    }
                    else if (dbCmd.Parameters[i].DbType == DbType.String)
                    {
                        if (dbCmd.Parameters[i].ParameterName.ToUpper().Contains("REMARKS") || dbCmd.Parameters[i].ParameterName.ToUpper().Contains("NARRATION") || dbCmd.Parameters[i].ParameterName.ToUpper().Contains("NOTES") || dbCmd.Parameters[i].ParameterName.ToUpper().Contains("PASSWORD") || dbCmd.Parameters[i].ParameterName.ToUpper().Contains("DATE"))
                        {
                            dbCmd.Parameters[i].Value = Convert.ToString(dbCmd.Parameters[i].Value);
                        }
                        else
                        {
                            if (Convert.ToString(dbCmd.Parameters[i].Value).ToUpper().Contains("<ROOT>"))
                            {
                                dbCmd.Parameters[i].Value = Convert.ToString(dbCmd.Parameters[i].Value);
                            }
                            else
                            {
                                dbCmd.Parameters[i].Value = Convert.ToString(dbCmd.Parameters[i].Value).ToUpper();
                            }
                        }
                    }
                    dbCmd.Parameters[i].ParameterName = dbCmd.Parameters[i].ParameterName.Replace("@", "p_").Replace(" ", "");
                }
            }
            catch (Exception ex)
            {

                throw ex;

            }
        }

        public static void FunReplaceOracleParameterOut(ref DbCommand dbCmd)
        {
            try
            {
                for (int i = 0; i <= dbCmd.Parameters.Count - 1; i++)
                {
                    dbCmd.Parameters[i].ParameterName = "@" + dbCmd.Parameters[i].ParameterName.Trim().
                        Substring(2, dbCmd.Parameters[i].ParameterName.Trim().Length - 2);
                }
            }
            catch (Exception ex)
            {

                throw ex;

            }
        }

        public static void AddCursorOutParameter(ref DbCommand command, string dbCon)
        {
            try
            {
                AddParameter(command as OracleCommand, dbCon, OracleType.Cursor, 0, ParameterDirection.Output, true, 0, 0, String.Empty, DataRowVersion.Default, Convert.DBNull);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static void AddParameter(OracleCommand command, string dbCon, OracleType oracleType, int size,
            ParameterDirection direction, bool nullable, byte precision, byte scale, string sourceColumn,
            DataRowVersion sourceVersion, object value)
        {
            OracleConnection con = new OracleConnection(dbCon);

            try
            {
                con.Open();
                OracleCommand oracmd = new OracleCommand(command.CommandText, con);
                oracmd.CommandType = CommandType.StoredProcedure;
                OracleCommandBuilder.DeriveParameters(oracmd);

                for (int i = 0; i <= oracmd.Parameters.Count - 1; i++)
                {
                    OracleParameter pmt = oracmd.Parameters[i];
                    if (pmt.Direction == ParameterDirection.Output && pmt.OracleType == OracleType.Cursor)
                    {
                        OracleParameter param = new OracleParameter(pmt.ParameterName, oracleType, size, direction, nullable, precision, scale, sourceColumn, sourceVersion, value);
                        param.OracleType = oracleType;
                        command.Parameters.Add(param);
                    }
                }
            }
            catch (Exception)
            {

            }
            finally
            {
                con.Close();
            }
        }

        public static DataSet FunRemoveDummyTable(DataSet ObjDataSet)
        {
            for (int intTblCount = 0; intTblCount <= ObjDataSet.Tables.Count - 1; intTblCount++)
            {
                if (ObjDataSet.Tables[intTblCount].Columns[0].ColumnName.ToUpper() == "ORA_DUMMYTABLE")
                {
                    ObjDataSet.Tables.RemoveAt(intTblCount);
                    intTblCount--;
                }
            }
            return ObjDataSet;
        }

        #endregion

        public static void FunGetParameterCommonErrorLogDB(Database db, DbCommand dbCmd, int i, string strErrorMsg)
        {
            Dictionary<string, string> dictParams = new Dictionary<string, string>();
            try
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strSendError = (string)AppReader.GetValue("SendError", typeof(string));

                if (strSendError == "1")
                {
                    int intReturnVal;
                    string strPramValues = "";
                    string strPramType = "";
                    for (int intcount = 0; intcount < i; intcount++)
                    {
                        if (!string.IsNullOrEmpty(dbCmd.Parameters[intcount].Value.ToString()))
                        {
                            if (dbCmd.Parameters[intcount].DbType.ToString().Contains("String"))
                            {
                                strPramValues = strPramValues + " " + dbCmd.Parameters[intcount].ParameterName + " := " + "'" + dbCmd.Parameters[intcount].Value.ToString().Replace("'", "''") + "';" + Environment.NewLine;
                            }
                            else
                            {
                                strPramValues = strPramValues + " " + dbCmd.Parameters[intcount].ParameterName + " := " + dbCmd.Parameters[intcount].Value.ToString() + ";" + Environment.NewLine;
                            }
                        }
                        else
                        {
                            strPramValues = strPramValues + " " + dbCmd.Parameters[intcount].ParameterName + " := NULL;" + Environment.NewLine;
                        }

                        strPramType = strPramType + " " + dbCmd.Parameters[intcount].ParameterName + "\t :  " + dbCmd.Parameters[intcount].DbType.ToString() + Environment.NewLine;

                    }
                    //dictParams.Add("@USER_ID", string.Empty);
                    //dictParams.Add("@PROCEDURE_NAME", dbCmd.CommandText);
                    //dictParams.Add("@ERROR_MESSAGE", strErrorMsg);
                    //dictParams.Add("@PARAM_VALUES", strPramValues);
                    //dictParams.Add("@PARAM_TYPE", strPramType);
                    try
                    {
                        DbCommand dbErrorLogCommand = db.GetStoredProcCommand("S3G_INS_ERROR_LOG_DB");
                        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                        db.AddInParameter(dbErrorLogCommand, "@USER_ID", DbType.String, string.Empty);
                        db.AddInParameter(dbErrorLogCommand, "@PROCEDURE_NAME", DbType.String, dbCmd.CommandText);
                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@PARAM_VALUES",
                                   OracleType.Clob, strPramValues.Length,
                                   ParameterDirection.Input, true, 0, 0, String.Empty,
                                   DataRowVersion.Default, strPramValues);
                            dbErrorLogCommand.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(dbErrorLogCommand, "@PARAM_VALUES", DbType.String, strPramValues);
                        }

                        db.AddInParameter(dbErrorLogCommand, "@ERROR_MESSAGE", DbType.String, strErrorMsg);
                        
                        db.AddInParameter(dbErrorLogCommand, "@PARAM_TYPE", DbType.String, strPramType);
                        db.AddOutParameter(dbErrorLogCommand, "@ERRORCODE", DbType.Int32, 100);
                       

                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            //command.FunPubGetORACLE_SP();
                            FunReplaceOracleParameter(ref dbErrorLogCommand, enumDBType);
                        }

                        intReturnVal = db.ExecuteNonQuery(dbErrorLogCommand);

                        if (enumDBType == FADALDBType.ORACLE)
                        {
                            FunReplaceOracleParameterOut(ref dbErrorLogCommand);
                        }
                    }
                    catch (Exception ae)
                    {
                        throw ae;
                    }
                }
                else
                {
                    XmlDocument conxmlDoc = Common.ClsIniFileAccess.xmlDoc;
                    //string strLogFile = conxmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[0].Attributes["S3GWebLogFile"].Value;
                    string strLogFile = (string)AppReader.GetValue("COMMONERRORLOG", typeof(string));

                    string strError = "";

                    strError = "DateTime : " + DateTime.Now;
                    strError = strError + strErrorMsg;

                    if (File.Exists(strLogFile))
                    {
                        File.AppendAllText(strLogFile, strError);
                    }
                }
            }
            catch (Exception ex)
            {
                //    int intCountParam = dbCmd.Parameters.Count;
                //    FunGetParameterCommonErrorLogDB(dbCmd, intCountParam, ex.Message);
                throw ex;
            }
        }

    }
    public enum FADALDBType
    {
        ORACLE = 0,
        SQL = 1,
    }

}
