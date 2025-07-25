#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: User Master DAL Class
/// Created By			: Kaliraj K
/// Created Date		: 10-May-2010
/// Purpose	            : 
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;using S3GDALayer.S3GAdminServices;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Data.OracleClient;
#endregion

namespace S3GDALayer
{
    /// Added the Name Space For Logical Grouping
    /// This Class belongs UserMgtServices to the service group
    namespace UserMgtServices
    {
        public class ClsPubUserManagement
        {
            #region Initialization
            int intRowsAffected;
            S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable ObjUserManagementCurdDataTable_DAL;
            S3GBusEntity.UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable ObjUserMasterDataTable_DAL;
            S3GBusEntity.UserMgtServices.S3G_SYSAD_RoleMasterDataTable ObjRoleMasterDataTable_DAL;
            S3GBusEntity.UserMgtServices.S3G_SYSAD_UserLocMapDataTable ObjUserLocMapDataTable_DAL;
            S3GBusEntity.UserMgtServices.S3G_SYSAD_UserRoleMapMstDataTable ObjUserRoleMapMstDataTable_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubUserManagement()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #endregion

            #region Create New User
            /// <summary>
            /// Creates a new User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateUserInt(SerializationMode SerMode, byte[] bytesObjS3G_SYSAD_UserManagementDataTable)
            {
                try
                {

                    ObjUserManagementCurdDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_UserManagementDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementRow ObjUserManagementRow in ObjUserManagementCurdDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_SYSAD_Insert_UserDetails");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                        db.AddInParameter(command, "@UserCode", DbType.String, ObjUserManagementRow.User_Code);
                        db.AddInParameter(command, "@UserName", DbType.String, ObjUserManagementRow.User_Name);
                        db.AddInParameter(command, "@Short_Name", DbType.String, ObjUserManagementRow.Short_Name);// New Field Added.
                        db.AddInParameter(command, "@Password", DbType.String, ObjUserManagementRow.Password);
                        db.AddInParameter(command, "@MobileNo", DbType.String, ObjUserManagementRow.Mobile_No);
                        db.AddInParameter(command, "@EmailID", DbType.String, ObjUserManagementRow.Email_ID);
                        db.AddInParameter(command, "@DOJ", DbType.DateTime, ObjUserManagementRow.DOJ);
                        if (!ObjUserManagementRow.IsIs_ReqIN_FASNull())
                        {
                            if(ObjUserManagementRow.Is_ReqIN_FAS==true)
                            db.AddInParameter(command, "@IS_REQIN_FAS", DbType.Int32, 1);
                            else
                            db.AddInParameter(command, "@IS_REQIN_FAS", DbType.Int32, 0);
                        }
                        db.AddInParameter(command, "@Designation", DbType.String, ObjUserManagementRow.Designation);
                        db.AddInParameter(command, "@UserLevelID", DbType.Int32, ObjUserManagementRow.User_Level_ID);
                        db.AddInParameter(command, "@ReportingNextlevel", DbType.Int32, ObjUserManagementRow.Reporting_Next_level);
                        db.AddInParameter(command, "@ReportingHigherlevel", DbType.Int32, ObjUserManagementRow.Reporting_Higher_level);

                        if (!ObjUserManagementRow.IsUser_GroupNull())
                        {
                            db.AddInParameter(command, "@User_Group", DbType.Int32, ObjUserManagementRow.User_Group);
                        }

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param ;
                            param = new OracleParameter("@XMLLocationDet",
                                OracleType.Clob, ObjUserManagementRow.XMLLocationDet.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjUserManagementRow.XMLLocationDet);
                            command.Parameters.Add(param);

                            param  = new OracleParameter("@XMLRoleCodeDet",
                                OracleType.Clob, ObjUserManagementRow.XMLRoleCodeDet.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjUserManagementRow.XMLRoleCodeDet);
                            command.Parameters.Add(param);

                            param = new OracleParameter("@XMLLOBDet",
                               OracleType.Clob, ObjUserManagementRow.XMLLOBDet.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLLOBDet) ? " " : ObjUserManagementRow.XMLLOBDet);
                            command.Parameters.Add(param);

                            param = new OracleParameter("@XML_Address_Value",
                               OracleType.Clob, ObjUserManagementRow.XML_Basic_Address_Values.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XML_Basic_Address_Values) ? " " : ObjUserManagementRow.XML_Basic_Address_Values);
                            command.Parameters.Add(param);

                            param = new OracleParameter("@XMLFunctionDet",
                               OracleType.Clob, ObjUserManagementRow.XMLFunctionDet.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLFunctionDet) ? " " : ObjUserManagementRow.XMLFunctionDet);
                            command.Parameters.Add(param);

                            param = new OracleParameter("@XML_ActivityList",
                               OracleType.Clob, ObjUserManagementRow.XML_ActivityList.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XML_ActivityList) ? " " : ObjUserManagementRow.XML_ActivityList);
                            command.Parameters.Add(param);

                            param = new OracleParameter("@XML_ActivityRoles",
                               OracleType.Clob, ObjUserManagementRow.XML_ActivityRoles.Length,
                               ParameterDirection.Input, true, 0, 0, String.Empty,
                               DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XML_ActivityRoles) ? " " : ObjUserManagementRow.XML_ActivityRoles);
                            command.Parameters.Add(param);

                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLLocationDet", DbType.String, 
                                ObjUserManagementRow.XMLLocationDet);
                            db.AddInParameter(command, "@XMLRoleCodeDet", DbType.String, 
                                ObjUserManagementRow.XMLRoleCodeDet);
                            db.AddInParameter(command, "@XMLLOBDet", DbType.String,
                               ObjUserManagementRow.XMLLOBDet);
                            db.AddInParameter(command, "@XML_Address_Value", DbType.String, ObjUserManagementRow.XML_Basic_Address_Values);
                            db.AddInParameter(command, "@XMLFunctionDet", DbType.String, ObjUserManagementRow.XMLFunctionDet);
                            db.AddInParameter(command, "@XML_ActivityList", DbType.String, ObjUserManagementRow.XML_ActivityList);
                            db.AddInParameter(command, "@XML_ActivityRoles", DbType.String, ObjUserManagementRow.XML_ActivityRoles);
                        }
                        
                        //db.AddInParameter(command, "@LOBID", DbType.Int32, ObjUserManagementRow.LOB_ID);
                        db.AddInParameter(command, "@IsActive", DbType.Boolean, ObjUserManagementRow.Is_Active);
                        db.AddInParameter(command, "@CopyProfile_User_ID", DbType.Int32, ObjUserManagementRow.CopyProfile_User_ID);
                        db.AddInParameter(command, "@DeletionLobLocation", DbType.Int32, ObjUserManagementRow.DeletionLobLocation);
                        db.AddInParameter(command, "@Copy_Lob_profile", DbType.Int32, ObjUserManagementRow.Copy_Lob_profile);
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjUserManagementRow.CreatedBy);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjUserManagementRow.Location_ID);
                        db.AddInParameter(command, "@DEPARTMENT_ID", DbType.Int32, ObjUserManagementRow.DEPARTMENT_ID);
                        if (!ObjUserManagementRow.IsDORNull())
                        {
                            db.AddInParameter(command, "@DOR", DbType.String, ObjUserManagementRow.DOR);
                        }                        
                        //db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                    }

                }
                catch (Exception ex)
                {
                    intRowsAffected = 50;
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;

            }
            #endregion

            #region Delete Existing User
            /// <summary>
            /// Deletes an Existing User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubDeleteUserInt(SerializationMode SerMode, byte[] bytesObjS3G_SYSAD_UserManagementDataTable)
            {
                try
                {

                    ObjUserManagementCurdDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_UserManagementDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable));

                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Delete_User_Details");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementRow ObjUserManagementRow in ObjUserManagementCurdDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@User_Id", DbType.Int32, ObjUserManagementRow.User_ID);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);

                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                    }

                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;

            }
            #endregion

            #region Update LOB Mapping
            /// <summary>
            /// Deletes an Existing User by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubUpdateLOBMapping(int intUserID, int intLOBID)
            {
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Update_LOBMapping");
                    db.AddInParameter(command, "@User_ID", DbType.Int32, intUserID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, intLOBID);
                    db.FunPubExecuteNonQuery(command);

                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return 1;
            }

            #endregion


            #region Query User Details
            /// <summary>
            /// Gets a User details using Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjSNXG_UserManagementDataTable"></param>
            /// <returns>Datatable containing User details</returns>

            public S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable FunPubQueryUser(SerializationMode SerMode, byte[] bytesObjSNXG_UserManagementDataTable)
            {
                S3GBusEntity.UserMgtServices dsUserDetails = new S3GBusEntity.UserMgtServices();
                ObjUserManagementCurdDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_UserManagementDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Get_User_Details");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementRow ObjUserManagementRow in ObjUserManagementCurdDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                        db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.S3G_SYSAD_UserManagement.TableName);
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return dsUserDetails.S3G_SYSAD_UserManagement;

            }

            public S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable FunPubQueryUserPaging(SerializationMode SerMode, byte[] bytesObjSNXG_UserManagementDataTable, out int intTotalRecords, PagingValues ObjPaging)
            {
                intTotalRecords = 0;
                S3GBusEntity.UserMgtServices dsUserDetails = new S3GBusEntity.UserMgtServices();
                ObjUserManagementCurdDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_UserManagementDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Get_User_Details_Paging");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementRow ObjUserManagementRow in ObjUserManagementCurdDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjUserManagementRow.User_ID);
                        db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                        db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                        db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                        db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                        db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                        db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.S3G_SYSAD_UserManagement.TableName);
                        if ((int)command.Parameters["@TotalRecords"].Value > 0)
                            intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return dsUserDetails.S3G_SYSAD_UserManagement;

            }

            #endregion

            #region Query User Master
            /// <summary>
            /// Gets a User details using Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjSNXG_UserMasterDataTable"></param>
            /// <returns>Datatable containing User code details</returns>

            public S3GBusEntity.UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable FunPubQueryUserMaster(SerializationMode SerMode, byte[] bytesObjSNXG_UserMasterDataTable)
            {
                S3GBusEntity.UserMgtServices dsUserDetails = new S3GBusEntity.UserMgtServices();
                ObjUserMasterDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_UserMasterDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Get_UserCode_Details");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserMaster_ListRow ObjUserMasterRow in ObjUserMasterDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserMasterRow.Company_ID);
                        db.FunPubLoadDataSet(command, dsUserDetails, dsUserDetails.S3G_SYSAD_UserMaster_List.TableName);
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return dsUserDetails.S3G_SYSAD_UserMaster_List;

            }
            #endregion

            #region Query Branch and Role Access Details
            /// <summary>
            /// Gets a User details using Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjSNXG_UserManagementDataTable"></param>
            /// <returns>Datatable containing Branch and Role Access Details</returns>

            public DataSet FunPubQueryBranchRoleDetails(SerializationMode SerMode, byte[] bytesObjSNXG_UserManagementDataTable, string strMode)
            {
                DataSet dsBranchRole = new DataSet();
                ObjUserManagementCurdDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_UserManagementDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Sysad_Get_UserBranchRole_Details");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserManagementRow ObjUserManagementRow in ObjUserManagementCurdDataTable_DAL.Rows)
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
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                finally
                {
                    dsBranchRole.Dispose();
                    dsBranchRole = null;
                }

            }

            #endregion

            #region Get Branch details based on region
            /// <summary>
            /// Gets branch details using Serialized data table object and serialized mode
            /// </summary>
            /// <returns>Datatable containing Branch Details</returns>

            public DataTable FunPubQueryUserLocationDetails(int intCompany_ID, int intUser_ID, int intLOB_ID, string strMode)
            {
                DataSet dsBranch = new DataSet();
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_Get_UserLocation_Details");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, intUser_ID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, intLOB_ID);
                    db.AddInParameter(command, "@Mode_Code", DbType.String, strMode);
                    dsBranch = db.FunPubExecuteDataSet(command);
                    //LoadDataSet(command, dsBranchRole, dsBranchRole.S3G_SYSAD_UserManagement.TableName);

                    return dsBranch.Tables[0];
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                finally
                {
                    dsBranch.Dispose();
                    dsBranch = null;
                }

            }

            #endregion

            #region Get role details based on lob
            /// <summary>
            /// Gets branch details using Serialized data table object and serialized mode
            /// </summary>
            /// <returns>Datatable containing role Details</returns>

            public DataTable FunPubQueryUserRoleDetails(int intCompany_ID, int intUser_ID, int intLOB_ID, string strMode)
            {
                DataSet dsRole = new DataSet();
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_Get_UserRole_Details");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, intUser_ID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, intLOB_ID);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, 1);
                    db.AddInParameter(command, "@Mode_Code", DbType.String, strMode);
                    dsRole = db.FunPubExecuteDataSet(command);
                    return dsRole.Tables[0];
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                finally
                {
                    dsRole.Dispose();
                    dsRole = null;
                }

            }
            /// <summary>
            /// Gets all the Roles Based on company id and lob id
            /// </summary>
            /// <param name="intCompany_ID"></param>
            /// <param name="intLOB_ID"></param>
            /// <returns></returns>

            public DataTable FunPubQueryRoleDetails(int intCompany_ID, int intLOB_ID)
            {
                DataSet dsRole = new DataSet();
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_Get_UserRole_Details");
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_ID);
                    db.AddInParameter(command, "@LOB_ID", DbType.Int32, intLOB_ID);
                    dsRole = db.FunPubExecuteDataSet(command);
                    return dsRole.Tables[0];
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                finally
                {
                    dsRole.Dispose();
                    dsRole = null;
                }

            }

            #endregion
            //Created By :Anbuvel.T,Date:07-MAY-2018,Description : Login Changes Done.
            #region Create New User Group/ Location Access/ Role and user Map Access
            /// <summary>
            /// Creates a new User Group by getting Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateUserGroupIntUpd(SerializationMode SerMode, byte[] bytesObjS3G_SYSAD_UserGroupDataTable)
            {
                try
                {

                    ObjRoleMasterDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_RoleMasterDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_UserGroupDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_RoleMasterDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_RoleMasterRow ObjUserManagementRow in ObjRoleMasterDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_SYSAD_INS_USERGRPDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@RoleMaster_ID", DbType.Int32, ObjUserManagementRow.RoleMaster_ID);
                        db.AddInParameter(command, "@Role_Code", DbType.String, ObjUserManagementRow.Role_Code);
                        db.AddInParameter(command, "@Role_Name", DbType.String, ObjUserManagementRow.Role_Name);
                        // Modified By : Anbuvel.T Date : 01-OCT-2018, Description : User Group Email Column Added
                        if (!ObjUserManagementRow.IsGroup_EmailNull())
                        {
                            db.AddInParameter(command, "@Group_Email", DbType.String, ObjUserManagementRow.Group_Email);
                        }                        
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjUserManagementRow.Created_By);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLUserRoleDet",
                                OracleType.Clob, ObjUserManagementRow.XMLUserRoles.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserRoles) ? " " : ObjUserManagementRow.XMLUserRoles);
                            command.Parameters.Add(param);
                            param = new OracleParameter("@XMLUserLOB",
                                OracleType.Clob, ObjUserManagementRow.XMLUserLOB.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserRoles) ? " " : ObjUserManagementRow.XMLUserLOB);
                            command.Parameters.Add(param);      
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUserRoleDet", DbType.String,
                                ObjUserManagementRow.XMLUserRoles);
                            db.AddInParameter(command, "@XMLUserLOB", DbType.String,
                                ObjUserManagementRow.XMLUserLOB);     
                        }
                        db.AddInParameter(command, "@IsActive", DbType.Boolean, ObjUserManagementRow.IS_ACTIVE);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Rollback();
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
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;
            }

            /// <summary>
            /// Creates a new Location/ Old Location for User Creation
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateLocationGroupIntUpd(SerializationMode SerMode, byte[] bytesObjS3G_SYSAD_UserLocDataTable)
            {
                try
                {
                    ObjUserLocMapDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserLocMapDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_UserLocDataTable, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserLocMapDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserLocMapRow ObjUserManagementRow in ObjUserLocMapDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_SYSAD_INS_USERLOCDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@UserLocMap_ID", DbType.Int32, ObjUserManagementRow.UserLocMap_ID);
                        db.AddInParameter(command, "@UserLocMap_Name", DbType.String, ObjUserManagementRow.UserLocMap_Name);
                        db.AddInParameter(command, "@Is_Active", DbType.String, ObjUserManagementRow.IS_ACTIVE);
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjUserManagementRow.Created_By);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLUserLoc",
                                OracleType.Clob, ObjUserManagementRow.XMLUserLoc.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserLoc) ? " " : ObjUserManagementRow.XMLUserLoc);
                            command.Parameters.Add(param);
                            param = new OracleParameter("@XMLUserList",
                                OracleType.Clob, ObjUserManagementRow.XMLUserList.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserList) ? " " : ObjUserManagementRow.XMLUserList);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUserLoc", DbType.String,
                                ObjUserManagementRow.XMLUserLoc);
                            db.AddInParameter(command, "@XMLUserList", DbType.String,
                                ObjUserManagementRow.XMLUserList);
                        }                        
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));                        
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Rollback();
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
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;
            }

            /// <summary>
            /// Creates a new  User against 
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_UserManagementDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateUserRoleMapIntUpd(SerializationMode SerMode, byte[] bytesObjUserLocMapDataTable_DAL)
            {
                try
                {

                    ObjUserRoleMapMstDataTable_DAL = (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserRoleMapMstDataTable)ClsPubSerialize.DeSerialize(bytesObjUserLocMapDataTable_DAL, SerMode, typeof(S3GBusEntity.UserMgtServices.S3G_SYSAD_UserRoleMapMstDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.UserMgtServices.S3G_SYSAD_UserRoleMapMstRow ObjUserManagementRow in ObjUserRoleMapMstDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_SYSAD_INS_USERROLEMAPDTL");
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjUserManagementRow.Company_ID);
                        db.AddInParameter(command, "@UserLocMap_ID", DbType.Int32, ObjUserManagementRow.UserRoleMapMST_ID);
                        db.AddInParameter(command, "@UserLocMap_Name", DbType.String, ObjUserManagementRow.UserRole_Name);
                        db.AddInParameter(command, "@Is_Active", DbType.String, ObjUserManagementRow.IS_ACTIVE);
                        db.AddInParameter(command, "@CreatedBy", DbType.Int32, ObjUserManagementRow.Created_By);
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            param = new OracleParameter("@XMLUserRoles",
                                OracleType.Clob, ObjUserManagementRow.XMLUserRoles.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserRoles) ? " " : ObjUserManagementRow.XMLUserRoles);
                            command.Parameters.Add(param);
                            param = new OracleParameter("@XMLUserList",
                                OracleType.Clob, ObjUserManagementRow.XMLUserList.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserList) ? " " : ObjUserManagementRow.XMLUserList);
                            command.Parameters.Add(param);
                            param = new OracleParameter("@XMLUserLobs",
                                OracleType.Clob, ObjUserManagementRow.XMLUserLobs.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, string.IsNullOrEmpty(ObjUserManagementRow.XMLUserLobs) ? " " : ObjUserManagementRow.XMLUserLobs);
                            command.Parameters.Add(param);
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLUserRoles", DbType.String,
                                ObjUserManagementRow.XMLUserRoles);
                            db.AddInParameter(command, "@XMLUserList", DbType.String,
                                ObjUserManagementRow.XMLUserList);
                            db.AddInParameter(command, "@XMLUserLobs", DbType.String,
                                ObjUserManagementRow.XMLUserList);
                        }                        
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));                        
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value != 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    trans.Rollback();
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
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return intRowsAffected;
            }
            #endregion

        }
    }
}
