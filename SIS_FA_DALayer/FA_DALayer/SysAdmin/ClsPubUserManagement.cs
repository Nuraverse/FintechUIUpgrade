#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: User Management
/// Created By			: M.Saran
/// Created Date		: 01-Feb-2012
/// Purpose	            : To Create User Management

/// <Program Summary>
#endregion

#region Namespaces
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

#endregion

namespace FA_DALayer.SysAdmin
{
    public class ClsPubUserManagement
    {
        #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;

        //FA_BusEntity.SysAdmin.CompanyMgtServices.FA_SYS_CompanyMasterDataTable ObjCompanyMasterDataTable;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable ObjUserManagementDataTable;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable ObjUserListDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        public ClsPubUserManagement(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }
        #endregion

        #region Create New User
        /// <summary>
        /// Creates a new User by getting Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubCreateUserInt(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable, string strConnectionName)
        {
            try
            {

                ObjUserManagementDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(bytesObjUserManagementDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
                DbCommand command = null;

                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow in ObjUserManagementDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_SYS_INSERT_USERDETAILS");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                    db.AddInParameter(command, "@UserCode", DbType.String, ObjUserManagementRow.User_Code);
                    db.AddInParameter(command, "@UserName", DbType.String, ObjUserManagementRow.User_Name);
                    db.AddInParameter(command, "@Password", DbType.String, ObjUserManagementRow.Password);
                    db.AddInParameter(command, "@MobileNo", DbType.String, ObjUserManagementRow.Mobile_No);
                    db.AddInParameter(command, "@EmailID", DbType.String, ObjUserManagementRow.Email_ID);
                    db.AddInParameter(command, "@DOJ", DbType.DateTime, ObjUserManagementRow.DOJ);
                    db.AddInParameter(command, "@Designation", DbType.String, ObjUserManagementRow.Designation);
                    db.AddInParameter(command, "@UserLevelID", DbType.Int32, ObjUserManagementRow.User_Level_ID);
                    db.AddInParameter(command, "@ReportingNextlevel", DbType.Int32, ObjUserManagementRow.Reporting_Next_level);
                    db.AddInParameter(command, "@ReportingHigherlevel", DbType.Int32, ObjUserManagementRow.Reporting_Higher_level);
                    //db.AddInParameter(command, "@XMLLocationDet", DbType.String, ObjUserManagementRow.XMLLocationDet);
                    //db.AddInParameter(command, "@XMLRoleCodeDet", DbType.String, ObjUserManagementRow.XMLRoleCodeDet);
                    db.AddInParameter(command, "@IsActive", DbType.Boolean, ObjUserManagementRow.Is_Active);
                    db.AddInParameter(command, "@Current_Period", DbType.Boolean, ObjUserManagementRow.Current_Period);
                    db.AddInParameter(command, "@Prior_Period", DbType.Boolean, ObjUserManagementRow.Prior_Period);
                    db.AddInParameter(command, "@CopyProfile_User_ID", DbType.Int32, ObjUserManagementRow.CopyProfile_User_ID);
                    db.AddInParameter(command, "@DelMod", DbType.Int32, ObjUserManagementRow.DelMod);
                    db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjUserManagementRow.Created_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XMLLocationDet", OracleType.Clob,
                               ObjUserManagementRow.XMLLocationDet.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjUserManagementRow.XMLLocationDet);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XMLLocationDet", DbType.String, ObjUserManagementRow.XMLLocationDet);
                    }

                    if (enumDBType == FADALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter("@XMLRoleCodeDet", OracleType.Clob,
                               ObjUserManagementRow.XMLRoleCodeDet.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjUserManagementRow.XMLRoleCodeDet);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, "@XMLRoleCodeDet", DbType.String, ObjUserManagementRow.XMLRoleCodeDet);
                    }

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            //db.ExecuteNonQuery(command, trans);
                            db.FunPubExecuteNonQuery(command, ref trans);
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                            if ((int)command.Parameters["@ReturnTranValue"].Value > 0)
                            {
                                throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                            }
                            else
                            {
                                trans.Commit();
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

        #region Query User Details
        /// <summary>
        /// Gets a User details using Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_UserManagementDataTable"></param>
        /// <returns>Datatable containing User details</returns>

        public FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable FunPubQueryUser(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable, string strConnectionName)
        {
            FA_BusEntity.SysAdmin.SystemAdmin dsUserDetails = new FA_BusEntity.SysAdmin.SystemAdmin();
            ObjUserManagementDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(bytesObjUserManagementDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_SYS_GETUSER_DETAILS");
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow in ObjUserManagementDataTable.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                    db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.FA_SYS_UserManagement.TableName);
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return dsUserDetails.FA_SYS_UserManagement;

        }

        public FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable FunPubQueryUserPaging(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable, string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            intTotalRecords = 0;
            FA_BusEntity.SysAdmin.SystemAdmin dsUserDetails = new FA_BusEntity.SysAdmin.SystemAdmin();
            ObjUserManagementDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(bytesObjUserManagementDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_VIEW_GETUSER_DETAILS");
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow in ObjUserManagementDataTable.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                    db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                    db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                    db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                    db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                    db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                    db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.FA_SYS_UserManagement.TableName);
                    if ((int)command.Parameters["@TotalRecords"].Value > 0)
                        intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return dsUserDetails.FA_SYS_UserManagement;

        }

        #endregion

        #region Query User Master
        /// <summary>
        /// Gets a User details using Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_UserMasterDataTable"></param>
        /// <returns>Datatable containing User code details</returns>

        public FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable FunPubQueryUserMaster(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable, string strConnectionName)
        {
            FA_BusEntity.SysAdmin.SystemAdmin dsUserDetails = new FA_BusEntity.SysAdmin.SystemAdmin();
            ObjUserListDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable)FAClsPubSerialize.DeSerialize(bytesObjUserManagementDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable));
            try
            {
                DbCommand command = db.GetStoredProcCommand("FA_Sys_GetUserCodeDtls");
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListRow ObjUserMasterRow in ObjUserListDataTable.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserMasterRow.Company_ID);
                    db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.FA_SYS_UserMaster_List.TableName);
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return dsUserDetails.FA_SYS_UserMaster_List;

        }
        #endregion

        #region Query Branch and Role Access Details
        /// <summary>
        /// Gets a User details using Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_UserManagementDataTable"></param>
        /// <returns>Datatable containing Branch and Role Access Details</returns>

        public DataSet FunPubQueryBranchRoleDetails(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable, string strMode, string strConnectionName)
        {
            DataSet dsBranchRole = new DataSet();
            ObjUserManagementDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable)FAClsPubSerialize.DeSerialize(bytesObjUserManagementDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable));
            try
            {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("FA_SYS_GETUSERLOCROLEDTLS");
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementRow ObjUserManagementRow in ObjUserManagementDataTable.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                    db.AddInParameter(command, "@Mode_Code", DbType.String, strMode);
                    dsBranchRole = db.FunPubExecuteDataSet(command);
                    //LoadDataSet(command, dsBranchRole, dsBranchRole.S3G_SYSAD_UserManagement.TableName);
                }
                return dsBranchRole;
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            finally
            {
                dsBranchRole.Dispose();
                dsBranchRole = null;
            }

        }

        #endregion

    }
}
