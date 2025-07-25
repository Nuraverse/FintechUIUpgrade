using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using FA_BusEntity;
using System.Collections;
using System.Data.OracleClient;
using FA_DALayer;
using System.IO;
using System.Xml;


namespace FA_DALayer.SysAdmin
{

    public class ClsPubFAAdmin
    {
        #region Intialization

        Database db;
        string strConnection = string.Empty;
        public ClsPubFAAdmin(string strConnectionName) // strConnectionName parameter - Added by Santhosh.S
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;

        }
        
        int intErrorCode;
        DataSet ds_Menu;
        StringBuilder strQuery;
        #endregion

        #region Setting New Connection String
        public int FunSetConnection(string strConnectionName, string Fin_Year, int Company_ID, out string strDB_Name, out string strInitial_Catalog, out string strUSERNAME, out string strPASSWORD,string Appl_Type)
        {
            strDB_Name = string.Empty;
            strInitial_Catalog = string.Empty;
            strUSERNAME = string.Empty;
            strPASSWORD = string.Empty;
            int intErrors = 0;
            DbCommand command = db.GetStoredProcCommand("FA_GetConnectionString");
            try
            {
                db.AddInParameter(command, "@Fin_Year", DbType.String, Fin_Year);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, Company_ID);
                db.AddInParameter(command, "@Appl_Type", DbType.String, Appl_Type);
                db.AddOutParameter(command, "@DB_Name", DbType.String, 50);
                db.AddOutParameter(command, "@Initial_Catalog", DbType.String, 50);
                db.AddOutParameter(command, "@USERNAME", DbType.String, 50);
                db.AddOutParameter(command, "@PASSWORD", DbType.String, 25);
                db.AddOutParameter(command, "@intErrorCode", DbType.Int32, sizeof(Int32));
                db.FunPubExecuteNonQuery(command);
                strDB_Name = Convert.ToString((command.Parameters["@DB_Name"].Value != DBNull.Value) ? command.Parameters["@DB_Name"].Value : 0);
                strInitial_Catalog = Convert.ToString((command.Parameters["@Initial_Catalog"].Value != DBNull.Value) ? command.Parameters["@Initial_Catalog"].Value : 0);
                strUSERNAME = Convert.ToString((command.Parameters["@USERNAME"].Value != DBNull.Value) ? command.Parameters["@USERNAME"].Value : 0);
                strPASSWORD = Convert.ToString((command.Parameters["@PASSWORD"].Value != DBNull.Value) ? command.Parameters["@PASSWORD"].Value : 0);
                intErrors = (command.Parameters["@intErrorCode"].Value != DBNull.Value) ? (int)command.Parameters["@intErrorCode"].Value : 0;
                if (Convert.ToInt32(intErrors) == 0)
                {
                    FA_DALayer.Common.ClsIniFileAccess.FunPubSetDatabase(strDB_Name, strInitial_Catalog, strUSERNAME, strPASSWORD);
                    return intErrors;
                }
                else
                {
                    return intErrors;
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }


        }
        #endregion

        #region Login Validations
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strUserLoginCode"></param>
        /// <param name="strPassword"></param>
        /// <param name="intCompanyID"></param>
        /// <param name="intUserID"></param>
        /// <param name="intUser_Level_ID"></param>
        /// <param name="strUserName"></param>
        /// <param name="strCompanyName"></param>
        /// <param name="strCompanyCode"></param>
        /// <param name="LastLoginDate"></param>
        /// <param name="strTheme"></param>
        /// <param name="strAccess"></param>
        /// <param name="strCountryName"></param>
        /// <param name="strUserType"></param>
        /// <returns>Return error code Default i.e if no error it will return 0</returns>                    
        public int FunPubValidateLogin(string strUserLoginCode, string strConnectionName, out string strPassword, out int intCompanyID, out int intUserID, out int intUser_Level_ID, out string strUserName, out string strCompanyName, out string strCompanyCode, out DateTime LastLoginDate, out string strTheme, out string strAccess, out string strCountryName, out string strUserType, out string strMarquee,out  string strCompareDate)
        {

            intCompanyID = 0;
            intUserID = 0;
            intUser_Level_ID = 0;
            strCompanyName = "";
            strCompanyCode = "";
            strUserName = "";
            strTheme = "";
            strAccess = "";
            strCountryName = string.Empty;
            strUserType = string.Empty;
            strMarquee = string.Empty;
            LastLoginDate = DateTime.Now;
            
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand(SPNames.VALIDATE_LOGIN);
                db.AddInParameter(command, "@UserLoginID", DbType.String, strUserLoginCode);
                db.AddOutParameter(command, "@Password", DbType.String, 230);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@Last_LoginDate", DbType.DateTime, 200);
                db.AddOutParameter(command, "@User_Theme", DbType.String, 50);
                db.AddOutParameter(command, "@CompanyID", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@UserID", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@User_Level_ID", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@UserName", DbType.String, 50);
                db.AddOutParameter(command, "@CompanyName", DbType.String, 80);
                db.AddOutParameter(command, "@CompanyCode", DbType.String, 3);
                db.AddOutParameter(command, "@LevelAccess", DbType.String, 50);
                db.AddOutParameter(command, "@CountryName", DbType.String, 60);
                db.AddOutParameter(command, "@UserType", DbType.String, 60);
                // Added by Santhosh.S on 03/07/2013
                db.AddOutParameter(command, "@Marquee_Text", DbType.String, 1000);
                db.AddOutParameter(command, "@CompareDate", DbType.String, 1000);

                db.FunPubExecuteNonQuery(command);
                intErrorCode = (command.Parameters["@ErrorCode"].Value != DBNull.Value) ? (int)command.Parameters["@ErrorCode"].Value : 0;
                intCompanyID = (command.Parameters["@CompanyID"].Value != DBNull.Value) ? (int)command.Parameters["@CompanyID"].Value : 0;
                intUserID = (command.Parameters["@UserID"].Value != DBNull.Value) ? (int)command.Parameters["@UserID"].Value : 0;
                strPassword = Convert.ToString((command.Parameters["@Password"].Value != DBNull.Value) ? command.Parameters["@Password"].Value : 0);
                intUser_Level_ID = (command.Parameters["@User_Level_ID"].Value != DBNull.Value) ? (int)command.Parameters["@User_Level_ID"].Value : 0;
                strUserName = Convert.ToString((command.Parameters["@UserName"].Value != DBNull.Value) ? command.Parameters["@UserName"].Value : 0);
                strCompanyName = Convert.ToString((command.Parameters["@CompanyName"].Value != DBNull.Value) ? command.Parameters["@CompanyName"].Value : 0);
                strCompanyCode = Convert.ToString((command.Parameters["@CompanyCode"].Value != DBNull.Value) ? command.Parameters["@CompanyCode"].Value : 0);
                LastLoginDate = Convert.ToDateTime((command.Parameters["@Last_LoginDate"].Value != DBNull.Value) ? command.Parameters["@Last_LoginDate"].Value : DateTime.Now);
                strTheme = Convert.ToString((command.Parameters["@User_Theme"].Value != DBNull.Value) ? command.Parameters["@User_Theme"].Value : string.Empty);
                strAccess = Convert.ToString((command.Parameters["@LevelAccess"].Value != DBNull.Value) ? command.Parameters["@LevelAccess"].Value : string.Empty);
                strCountryName = Convert.ToString((command.Parameters["@CountryName"].Value != DBNull.Value) ? command.Parameters["@CountryName"].Value : string.Empty);
                strUserType = Convert.ToString((command.Parameters["@UserType"].Value != DBNull.Value) ? command.Parameters["@UserType"].Value : string.Empty);
                strMarquee = Convert.ToString((command.Parameters["@Marquee_Text"].Value != DBNull.Value) ? command.Parameters["@Marquee_Text"].Value : string.Empty);
                strCompareDate = Convert.ToString((command.Parameters["@CompareDate"].Value != DBNull.Value) ? command.Parameters["@CompareDate"].Value : string.Empty);
            }

            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intErrorCode;
        }
        #endregion

        #region Menu Loading Code
        /// <summary>
        /// Function To get user Menu as Dataset
        /// </summary>
        /// <param name="intUserId">User Id for which menu to be loaded</param>
        /// <param name="strUserName"> User Name of the user</param>
        /// <returns>DataSet</returns>
        public DataSet FunPubGetUserMenu(int intUserId, string strUserName, string strUserType, int intCompany_ID, string strConnectionName)
        {
            //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            try
            {
                ds_Menu = new DataSet();
                if (strUserType == "USER")
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.GetUserMenuItems);
                    db.AddInParameter(command, "@User_Id", DbType.Int32, intUserId);
                    db.AddInParameter(command, "@Option", DbType.Int32, 3);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);

                    db.FunPubLoadDataSet(command, ds_Menu, "Module_Header");

                    //db.LoadDataSet(command, ds_Menu, "Module_Header");

                    for (int i = 0; i < ds_Menu.Tables["Module_Header"].Rows.Count; i++)
                    {
                        command = db.GetStoredProcCommand(SPNames.GetUserMenuItems);
                        db.AddInParameter(command, "@Option", DbType.Int32, 4);
                        db.AddInParameter(command, "@User_Id", DbType.Int32, intUserId);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                        db.AddInParameter(command, "@Module_Id", DbType.Int32, ds_Menu.Tables["Module_Header"].Rows[i].ItemArray[0].ToString());
                        string strHeader = ds_Menu.Tables["Module_Header"].Rows[i].ItemArray[2].ToString();

                        db.FunPubLoadDataSet(command, ds_Menu, strHeader);
                        //db.LoadDataSet(command, ds_Menu, strHeader);
                    }

                    if (ds_Menu.Tables["Module_Header"].Rows.Count == 0)
                    {
                        switch (strUserName)
                        {
                            case "S3GUSER":
                                command = db.GetStoredProcCommand(SPNames.GetUserMenuItems);
                                db.AddInParameter(command, "@Option", DbType.Int32, 1);
                                db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                                db.FunPubLoadDataSet(command, ds_Menu, "System Admin");
                                //db.LoadDataSet(command, ds_Menu, "System Admin");
                                break;
                            case "SYSADMIN":
                                command = db.GetStoredProcCommand(SPNames.GetUserMenuItems);
                                db.AddInParameter(command, "@Option", DbType.Int32, 2);
                                db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                                db.FunPubLoadDataSet(command, ds_Menu, "System Admin");
                                //db.LoadDataSet(command, ds_Menu, "System Admin");
                                break;
                        }
                    }
                }
                else if (strUserType == "UTPA")
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.GetUserMenuItems);
                    db.AddInParameter(command, "@Option", DbType.Int32, 5);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, intUserId);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                    db.FunPubLoadDataSet(command, ds_Menu, "Menu");
                    //db.LoadDataSet(command, ds_Menu, "Menu");
                }

            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }

            return ds_Menu;
        }
        #endregion

        #region To Get single value from SP
        public string FunGetScalarValue(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams)
        {
            try
            {
                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                }
                return Convert.ToString(db.FunPubExecuteScalar(command));
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
        }
        #endregion

        #region To Get Data in Dataset
        /// <summary>
        /// Common Method that will exeute the Required Procedure when send with 
        /// respective parameters and will return a DataSet
        /// </summary>
        /// <param name="strProcName">Procedure name which will be executed</param>
        /// <param name="dctProcParams">dictionary Containing Parameters for the sp</param>
        /// <returns>Return a DataSet</returns>
        public DataSet FunPubFillDataset(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams) // 2 b edited
        {
            DataSet ds = new DataSet();
            try
            {
                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                }
                db.FunPubLoadDataSet(command, ds, "ListTable");
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return ds;

        }
        #endregion

        #region To Get Data in DataTable
        /// <summary>
        /// Common Method that will exeute the Required Procedure when send with 
        /// respective parameters and will return a datatable
        /// </summary>
        /// <param name="strProcName">Procedure name which will be executed</param>
        /// <param name="dctProcParams">dictionary Containing Parameters for the sp</param>
        /// <returns>Return a DataTable</returns>
        public DataTable FunPubFillDropdown(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams) // 2 b edited
        {

            DataSet ds = new DataSet();
            try
            {
                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                }
                db.FunPubLoadDataSet(command, ds, "ListTable");
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return ds.Tables["ListTable"];

        }

        public DataTable FunPubFillDropdown(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLParameterKey, string strXMLParameterValue) // 2 b edited
        {

            DataSet ds = new DataSet();
            try
            {
                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);

                }
                if (strXMLParameterKey != string.Empty)
                {
                    //db.AddInParameter(command, strXMLParameterKey, DbType.String, strXMLParameterValue);
                    OracleParameter param = new OracleParameter(strXMLParameterKey, OracleType.Clob,
                                  strXMLParameterValue.Length, ParameterDirection.Input, true,
                                  0, 0, String.Empty, DataRowVersion.Default, strXMLParameterValue);
                    command.Parameters.Add(param);
                }
                db.FunPubLoadDataSet(command, ds, "ListTable");
            }
            catch (Exception ex)
            {
                FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return ds.Tables["ListTable"];

        }
        #endregion

        #region Gridview Binding with paging
        /// <summary>
        /// Function Mainly for Gridview Binding with paging it should have predefined Paging object
        /// passed to it.
        /// </summary>
        /// <param name="strProcName">Procedure name used for grid binding </param>
        /// <param name="dctProcParams">Parameter for the Procedure</param>
        /// <param name="intTotalRecords">Total records that the query return</param>
        /// <param name="ObjPaging"> Paging object that has page related details</param>
        /// <returns>DataTable</returns>
        public DataTable FunPubFillGridPaging(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            intTotalRecords = 0;
            DataSet ds = new DataSet();
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                }
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjPaging.ProCompany_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjPaging.ProUser_ID);
                db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                //if (ObjPaging.ProProgram_ID > 0)
                //db.AddInParameter(command, "@Program_Id", DbType.String, ObjPaging.ProProgram_ID);
                db.FunPubLoadDataSet(command, ds, "GridTable");
                //db.LoadDataSet(command, ds, "GridTable");

                if ((int)command.Parameters["@TotalRecords"].Value > 0)
                    intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;

            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return ds.Tables["GridTable"];

        }

        /// <summary>
        /// Function Mainly for Gridview Binding with paging it should have predefined Paging object
        /// passed to it.
        /// </summary>
        /// <param name="strProcName">Procedure name used for grid binding </param>
        /// <param name="dctProcParams">Parameter for the Procedure</param>
        /// <param name="intTotalRecords">Total records that the query return</param>
        /// <param name="intErrorCode"> Parameter for returning error code </param>
        /// <param name="ObjPaging"> Paging object that has page related details</param>
        /// <returns>DataTable</returns>
        public DataTable FunPubFillGridPaging(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, out int intTotalRecords, out int intErrorCode, FAPagingValues ObjPaging)
        {
            intTotalRecords = 0;
            intErrorCode = 0;
            DataSet ds = new DataSet();
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                DbCommand command = db.GetStoredProcCommand(strProcName);
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                }
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjPaging.ProCompany_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjPaging.ProUser_ID);
                db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                db.FunPubLoadDataSet(command, ds, "GridTable");
                //db.LoadDataSet(command, ds, "GridTable");

                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;

                if ((int)command.Parameters["@TotalRecords"].Value > 0)
                    intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;

            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return ds.Tables["GridTable"];

        }
        #endregion

        #region Password Validation

        public int FunPubPasswordValidation(Int32 intUserID, out string strPassword, string strConnectionName)
        {
            intErrorCode = 0;
            strPassword = String.Empty;
            DbCommand command = db.GetStoredProcCommand("FA_GetLoginUserPassword");
            try
            {
                db.AddInParameter(command, "@User_ID", DbType.Int32, intUserID);
                db.AddOutParameter(command, "@Password", DbType.String, 230);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                db.FunPubExecuteNonQuery(command);
                //db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }

                if (command.Parameters["@Password"].Value != null)
                {
                    strPassword = Convert.ToString(command.Parameters["@Password"].Value);
                }
            }
            catch (Exception ex)
            {
                if (command.Parameters["@ErrorCode"].Value != null && (int)command.Parameters["@ErrorCode"].Value != 0)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }
                else
                {
                    intErrorCode = 20;
                }
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return intErrorCode;
        }

        #endregion

        #region ErrorLog
        public string FunPubSysErrorLog(string strProcName, Dictionary<string, string> dctProcParams, string strConnectionName)
        {
            try
            {
                System.Configuration.AppSettingsReader AppReader = new System.Configuration.AppSettingsReader();
                string strSendError = (string)AppReader.GetValue("SendError", typeof(string));
                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;

                if (strSendError == "1")
                {
                    DbCommand command = db.GetStoredProcCommand(strProcName);

                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        //Thangam M to avoid recursive call on 29/Jul/2013
                        if (ProcPair.Value != null)
                        {
                            //db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                            if (enumDBType == FADALDBType.ORACLE)
                            {
                                OracleParameter param = new OracleParameter(ProcPair.Key,
                                      OracleType.Clob, ProcPair.Value.Length,
                                      ParameterDirection.Input, true, 0, 0, String.Empty,
                                      DataRowVersion.Default, string.IsNullOrEmpty(ProcPair.Value) ? " " : ProcPair.Value);
                                command.Parameters.Add(param);
                            }
                            else
                            {
                                db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                            }
                        }
                    }
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 10);
                    db.FunPubExecuteNonQuery(command);

                    return Convert.ToString(command.Parameters["@ErrorCode"].Value);
                }
                else
                {
                    XmlDocument conxmlDoc = Common.ClsIniFileAccess.xmlDoc;
                    //string strLogFile = conxmlDoc.ChildNodes[0].SelectSingleNode("LogFiles").ChildNodes[0].Attributes["S3GWebLogFile"].Value;
                    string strLogFile = (string)AppReader.GetValue("COMMONERRORLOG", typeof(string));

                    string strError = "";

                    strError = "DateTime : " + DateTime.Now;

                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        if (ProcPair.Value != null)
                        {
                            strError = strError + Environment.NewLine + ProcPair.Key + " : " + ProcPair.Value;
                        }
                    }

                    if (File.Exists(strLogFile))
                    {
                        File.AppendAllText(strLogFile, strError);
                    }
                    return "";
                }
            }
            catch (Exception ex)
            {
                //FA_DALayer.  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnectionName);
                throw ex;
            }
        }
        #endregion

        public int FunPubCreateAuditTrial(FASerializationMode SerMode, byte[] bytesObjS3G_AuditTrial_DataTable)
        {

            FA_BusEntity.AuditTrial.S3G_SYSAD_AuditTrialDataTable objAuditTrial_DAL;
            FA_BusEntity.AuditTrial.S3G_SYSAD_AuditTrialRow objAuditTrialRow = null;
            try
            {
                //objAuditTrial_DAL = (FA_BusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_RepossessionNoteDataTable)
                //   FAClsPubSerialize.DeSerialize(bytesObjS3G_LEGAL_RepossessionNote_DataTable, SerMode,
                //   typeof(FA_BusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_RepossessionNoteDataTable));

                objAuditTrial_DAL = (FA_BusEntity.AuditTrial.S3G_SYSAD_AuditTrialDataTable)
                   FAClsPubSerialize.DeSerialize(bytesObjS3G_AuditTrial_DataTable, SerMode,
                   typeof(FA_BusEntity.AuditTrial.S3G_SYSAD_AuditTrialDataTable));

                //objRepossessionNoteRow = objRepossessionNote_DAL.Rows[0] as
                //   FA_BusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_RepossessionNoteRow;

                objAuditTrialRow = objAuditTrial_DAL.Rows[0] as
                   FA_BusEntity.AuditTrial.S3G_SYSAD_AuditTrialRow;

                DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_InsertAuditTrial");
                db.AddInParameter(command, "@Company_ID", DbType.Int32, objAuditTrialRow.Company_ID);
                db.AddInParameter(command, "@XMLAuditTrialData", DbType.String, objAuditTrialRow.XmlAuditTrial);
                db.AddInParameter(command, "@Created_By ", DbType.Int32, objAuditTrialRow.Created_By);
                db.AddInParameter(command, "@Modified_By", DbType.Int32, objAuditTrialRow.Modified_By);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {

                        db.FunPubExecuteNonQuery(command);
                        //db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0 || (int)command.Parameters["@ErrorCode"].Value < 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            //throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                        }
                        if ((int)command.Parameters["@ErrorCode"].Value == 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            trans.Commit();
                            // strDSNo = (string)command.Parameters["@DSNO"].Value;
                        }
                        else
                        {
                            trans.Rollback();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intErrorCode == 0)
                            intErrorCode = 50;
                        //ClsPubCommErrorLogDal.CustomErrorRoutine(ex, strConnectionName);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                intErrorCode = 50;
               // ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                throw ex;
            }

            return intErrorCode;
        }
        
    }

}
