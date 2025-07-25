#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Location Master
/// Created By			: Muni Kavitha
/// Created Date		: 17-Jan-2012
/// Purpose	            : To Create Location category and Mapping

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
#endregion

namespace FA_DALayer.SysAdmin
{
  public  class ClsPubLocationMaster
    {
        int intErrorCode;
        string strConnection = string.Empty;
            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubLocationMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

        #region [Location Master Details]

        /// <summary>
        /// To Insert the Location Category Details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <param name="strErrorCode"></param>
            public int FunPubInsertLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName, out string strExistingCode, out string strExistingDescription)
        {
            intErrorCode = 0;
            strExistingCode = strExistingDescription = string.Empty;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable objLocationCategory_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryRow objLocationCategory_Row;
            
            DbCommand command = db.GetStoredProcCommand(SPNames.InsertLocationCategory );
            try
            {
                objLocationCategory_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable)FAClsPubSerialize.DeSerialize(bytesLocationCategory_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable));
                objLocationCategory_Row = objLocationCategory_DTB[0];

                db.AddInParameter(command, "@Company_ID", DbType.Int32, objLocationCategory_Row.Company_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, objLocationCategory_Row.Created_By  );
                db.AddInParameter(command, "@XMLLocationDetails", DbType.String, objLocationCategory_Row.XMLLocationDetails);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                db.AddOutParameter(command, "@ExistingMappingCode", DbType.String, 500);
                db.AddOutParameter(command, "@ExistingMappingDescription", DbType.String, 1000);

                db.FunPubExecuteNonQuery(command);
                //db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }
                if (command.Parameters["@ExistingMappingCode"].Value != null)
                {
                    strExistingCode = Convert.ToString(command.Parameters["@ExistingMappingCode"].Value);
                }
                if (command.Parameters["@ExistingMappingDescription"].Value != null)
                {
                    strExistingDescription = Convert.ToString(command.Parameters["@ExistingMappingDescription"].Value);
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

        /// <summary>
        /// To Update the Location Category Details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <returns></returns>
            public int FunPubUpdateLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName)
        {
            intErrorCode = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable objLocationCategory_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryRow  objLocationCategory_Row;

            //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            DbCommand command = db.GetStoredProcCommand(SPNames .UpdateLocationCategory );
            try
            {
                objLocationCategory_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable)FAClsPubSerialize.DeSerialize(bytesLocationCategory_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable));
                objLocationCategory_Row = objLocationCategory_DTB[0];
                db.AddInParameter(command, "@Company_ID", DbType.Int32, objLocationCategory_Row.Company_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, objLocationCategory_Row.Modified_By);
                db.AddInParameter(command, "@Location_Category_ID", DbType.String, objLocationCategory_Row.Location_Category_ID);
                db.AddInParameter(command, "@Is_Active", DbType.Boolean, objLocationCategory_Row.Is_Active);
                db.AddInParameter(command, "@Location_Desc", DbType.String, objLocationCategory_Row.Location_Description);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                db.FunPubExecuteNonQuery(command);
                //db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
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

        ///// <summary>
        ///// </summary>
        ///// <param name="intCompany_Id"></param>
        ///// <param name="intUser_ID"></param>
        ///// <param name="intLocationCategory_Id"></param>
        ///// <returns></returns>
        //public FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationCategoryDataTable   FunPubQueryLocationCategoryDetails(int intCompany_Id, int intUser_ID, int intLocationCategory_Id)
        //{
        //    FA_BusEntity.SysAdmin.SystemAdmin dsLocCat = new FA_BusEntity.SysAdmin.SystemAdmin();
        //    try
        //    {
        //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
        //        DbCommand command = db.GetStoredProcCommand("S3G_SYSAD_GetLocationCategoryDetails");
        //        db.AddInParameter(command, "@Company_ID", DbType.Int32, intCompany_Id);
        //        db.AddInParameter(command, "@User_ID", DbType.Int32, intUser_ID);
        //        db.AddInParameter(command, "@Location_Category_ID", DbType.Int32, intLocationCategory_Id);

        //        db.FunPubLoadDataSet(command, dsLocCat, dsLocCat.FA_Sys_LocationCategory .TableName);
        //        //db.LoadDataSet(command, dsLocCat, dsLocCat.S3G_SYSAD_LocationCategory.TableName);
        //    }
        //    catch (Exception ex)
        //    {
        //          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //    }
        //    return dsLocCat.FA_Sys_LocationCategory ;
        //}

        /// <summary>
        /// To Insert the Location Master details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <param name="strExistingMapping"></param>
        /// <returns></returns>
            public int FunPubInsertLocationMaster(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName , out string strExistingMapping)
        {
            intErrorCode = 0;
            strExistingMapping = string.Empty;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable objLocationMaster_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterRow objLocationMasterRow;
            //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            DbCommand command = db.GetStoredProcCommand(SPNames .InsertLocationMaster);
            try
            {
                objLocationMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable)FAClsPubSerialize.DeSerialize(bytesLocationMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable));
                objLocationMasterRow = objLocationMaster_DTB[0];

                db.AddInParameter(command, "@Company_ID", DbType.Int32, objLocationMasterRow.Company_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, objLocationMasterRow.Created_By);
                db.AddInParameter(command, "@XmlLocationMasterDetails", DbType.String, objLocationMasterRow.XMLLocationMasterDetails);
                db.AddOutParameter(command, "@ExistingMapping", DbType.String, 1000);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                db.FunPubExecuteNonQuery(command);
                //db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }
                if (command.Parameters["@ExistingMapping"].Value != null)
                {
                    strExistingMapping = Convert.ToString(command.Parameters["@ExistingMapping"].Value);
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

        /// <summary>
        /// To Update the Location Mapping Details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <returns></returns>
            public int FunPubUpdateLocationMapping(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName)
        {
            intErrorCode = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable objLocationMaster_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterRow objLocationMasterRow;
            //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            DbCommand command = db.GetStoredProcCommand(SPNames .UpdateLocationMapping);
            try
            {
                objLocationMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable)FAClsPubSerialize.DeSerialize(bytesLocationMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_LocationMasterDataTable));
                objLocationMasterRow = objLocationMaster_DTB[0];
                db.AddInParameter(command, "@Company_ID", DbType.Int32, objLocationMasterRow.Company_ID);
                db.AddInParameter(command, "@User_ID", DbType.Int32, objLocationMasterRow.Modified_By);
                db.AddInParameter(command, "@Location_Mapping_ID", DbType.String, objLocationMasterRow.Location_ID);
                db.AddInParameter(command, "@Is_Active", DbType.Boolean, objLocationMasterRow.Is_Active);
                db.AddInParameter(command, "@Is_Operational", DbType.Boolean, objLocationMasterRow.Is_Operational);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));

                db.FunPubExecuteNonQuery(command);
                //db.FunPubExecuteNonQuery(command);
                if (command.Parameters["@ErrorCode"].Value != null)
                {
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
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


        #endregion [Location Master Details]
    }
}
