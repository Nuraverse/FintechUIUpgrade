//Module Name      :   System Admin
/// Screen Name     :   S3GSysAdminRoleCodeMaster_Add
/// Created By      :   Manikandan. R
/// Created Date    :   19-JAN-2012
/// Purpose         :   To insert and update Role Center Master Details
/// Last updated By :   
/// Last Updated On :   
/// Purpose         :   
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
    public class ClsPubRoleCenterMaster
    {
        int intRowsAffected;
        string strConnection = string.Empty;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubRoleCenterMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;

        }
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable objRoleCenter_DTB;
        #region Create Role Center
        public int FunRoleCodeMasterInsertInt(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName)
        {
            try
            {
                objRoleCenter_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjSNXG_RoleCode_MasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable));
                DbCommand command = db.GetStoredProcCommand(SPNames.Insert_RCM);

                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterRow ObjRoleCodeMasterRow in objRoleCenter_DTB.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRoleCodeMasterRow.Company_ID);
                    db.AddInParameter(command, "@Role_Code", DbType.String, ObjRoleCodeMasterRow.Role_Code);
                    db.AddInParameter(command, "@Program_ID", DbType.Int32, ObjRoleCodeMasterRow.Program_ID);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjRoleCodeMasterRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjRoleCodeMasterRow.Created_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                }

            }
            catch (Exception ex)
            {
                intRowsAffected = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            }
            return intRowsAffected;
        }
        #endregion
        #region Update Role Center
        public int FunPubModifyRoleCodeMaster(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName)
        {
            try
            {
                objRoleCenter_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjSNXG_RoleCode_MasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable));
                DbCommand command = db.GetStoredProcCommand(SPNames.Update_RCM);
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterRow ObjRoleCodeMasterRow in objRoleCenter_DTB.Rows)
                {
                    db.AddInParameter(command, "@Role_Code_ID", DbType.Int32, ObjRoleCodeMasterRow.Role_Code_ID);
                    db.AddInParameter(command, "@Role_Code", DbType.String, ObjRoleCodeMasterRow.Role_Code);
                    db.AddInParameter(command, "@Program_ID", DbType.Int32, ObjRoleCodeMasterRow.Program_ID);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjRoleCodeMasterRow.Company_ID);
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjRoleCodeMasterRow.Modified_By);
                    db.AddInParameter(command, "@IS_ACTIVE", DbType.Boolean, ObjRoleCodeMasterRow.Is_Active);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                }

            }
            catch (Exception ex)
            {
                intRowsAffected = 50;
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            }
            return intRowsAffected;
        }
        #endregion
    }
}
