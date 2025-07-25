#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Hierachy Master
/// Created By			: Muni Kavitha
/// Created Date		: 17-Jan-2012
/// Purpose	            : To Create Hierachy Master

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
     public class ClsPubHierachyMaster
     {
         #region "Initialization
         //Code added for getting common connection string  from config file
            Database db;
            string strConnection = string.Empty;
            public ClsPubHierachyMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }
          
         int int_OutResult;
         FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterDataTable objHierachyMaster_DTB;
         #endregion
          
         #region [Function's]
            /// <summary>
            /// created By Muni Kavitha
            /// created date 17-Jan-2012
            /// For Insert and Update process for Hierarchy Master
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesobjHierachyMaster_DTB"></param>
            /// <returns></returns>
         public int FunPubSaveHierachyMaster(FASerializationMode SerMode, byte[] bytesobjHierachyMaster_DTB, string strConnectionName)
            {
                try
                {
                    objHierachyMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjHierachyMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterDataTable));
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterRow  ObjHierachyMasterRow in objHierachyMaster_DTB.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand(SPNames.SaveHierarchyMaster);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjHierachyMasterRow.Company_ID);
                        db.AddInParameter(command, "@XMLHierachyDetails", DbType.String, ObjHierachyMasterRow.XMLHierachyDetails);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjHierachyMasterRow.Created_By);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, 0);
                        db.AddOutParameter(command, "@OutResult", DbType.Int32, int_OutResult);

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                                }
                                else
                                {
                                    trans.Commit();
                                    int_OutResult = (int)command.Parameters["@OutResult"].Value;
                                }
                            }
                            catch (Exception ex)
                            {
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
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    throw ex;
                }
                return int_OutResult;
            }
        #endregion
     }
}
