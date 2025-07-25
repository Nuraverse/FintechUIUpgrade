
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Document Number Control Creation DAL Class
/// Created By			: Muni Kavitha  
/// Created Date		: 18-Jan-2012
/// Purpose	            : 
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : System Admin Module Developement
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
    public class ClsPubDoucmentNoControl
        {
            #region Initialization

            int intRowsAffected;
            int intErrorCode;
            string strConnection = string.Empty;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable objDocTypeList_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable objBatchList_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable objDNCMaster_DTB;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable objDNCDetails_DTB;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubDoucmentNoControl(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }

            #endregion

            #region DocTypeList
            public FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable FunPubGetDocTypeList(FASerializationMode SerMode, byte[] bytesobjDocTypeList_DTB, string strConnectionName)
            {
                FA_BusEntity.SysAdmin.SystemAdmin ds_SystemAdmin = new FA_BusEntity.SysAdmin.SystemAdmin();
                objDocTypeList_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable)FAClsPubSerialize.DeSerialize(bytesobjDocTypeList_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable));
                try
                {
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListRow ObjDocTypeListRow in objDocTypeList_DTB.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand(SPNames.GetDocType);
                        db.FunPubLoadDataSet(command, ds_SystemAdmin, ds_SystemAdmin.FA_Sys_DocTypeList.TableName);
                    }
                }
                catch (Exception ex)
                {
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                }
                return ds_SystemAdmin.FA_Sys_DocTypeList;
            }
            #endregion

            #region Create DNS
            public int FunPubCreateDNS(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName)
            {
                try
                {
                    objDNCMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjDNCMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable));
                    DbCommand command = db.GetStoredProcCommand(SPNames.InsertDNCDetails);
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterRow objDNCMasterRow in objDNCMaster_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objDNCMasterRow.Company_ID);
                        db.AddInParameter(command, "@Activity_ID", DbType.Int32, objDNCMasterRow.Activity_Id);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objDNCMasterRow.Branch_ID);
                        db.AddInParameter(command, "@Document_Type_ID", DbType.Int32, objDNCMasterRow.Document_Type_ID);
                        db.AddInParameter(command, "@Fin_Year", DbType.String, objDNCMasterRow.Fin_Year);
                        db.AddInParameter(command, "@Batch", DbType.String, objDNCMasterRow.Batch);
                        db.AddInParameter(command, "@From_Number", DbType.Decimal, objDNCMasterRow.From_Number);
                        db.AddInParameter(command, "@To_Number", DbType.Decimal, objDNCMasterRow.To_Number);
                        db.AddInParameter(command, "@Level", DbType.String, objDNCMasterRow.Level);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, objDNCMasterRow.Is_Active);
                        db.AddInParameter(command, "@Last_Used_Number", DbType.String, objDNCMasterRow.Last_Used_Number);
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objDNCMasterRow.Created_By);
                        db.AddInParameter(command, "@Created_On", DbType.DateTime, objDNCMasterRow.Trans_Date);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        db.FunPubExecuteNonQuery(command);
                        //db.ExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                    }
                }
                catch (Exception exp)
                {
                    intRowsAffected = 50;
                    FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return intRowsAffected;
            }

            #endregion

            #region Delete DNS
            public int FunPubDeleteDNS(int intDoc_Number_Seq_ID, string strConnectionName)
            {
                try
                {
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand(SPNames.DeleteDNC);
                db.AddInParameter(command, "@Doc_Number_Seq_ID", DbType.Int32, intDoc_Number_Seq_ID);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                db.FunPubExecuteNonQuery(command);
                    //db.ExecuteNonQuery(command);
                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                    intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }
                catch (Exception ex)
                {
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                }
                return intErrorCode;

            }
            #endregion

            #region Modify DNS
            public int FunPubModifyDNS(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName)
            {
                try
                {
                    objDNCMaster_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjDNCMaster_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable));
                    DbCommand command = db.GetStoredProcCommand(SPNames.UpdateDNC);
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterRow objDNCMasterRow in objDNCMaster_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Doc_Number_Seq_ID", DbType.Int32, objDNCMasterRow.Doc_Number_Seq_ID);
                        db.AddInParameter(command, "@Company_ID",DbType.Int32, objDNCMasterRow.Company_ID);
                        db.AddInParameter(command, "@Activity_ID", DbType.Int32, objDNCMasterRow.Activity_Id);
                        db.AddInParameter(command, "@Location_ID", DbType.Int32, objDNCMasterRow.Branch_ID);
                        db.AddInParameter(command, "@Document_Type_ID", DbType.Int32, objDNCMasterRow.Document_Type_ID);
                        db.AddInParameter(command, "@Fin_Year", DbType.String, objDNCMasterRow.Fin_Year);
                        db.AddInParameter(command, "@Batch", DbType.String, objDNCMasterRow.Batch);
                        db.AddInParameter(command, "@From_Number", DbType.Decimal, objDNCMasterRow.From_Number);
                        db.AddInParameter(command, "@To_Number", DbType.Decimal, objDNCMasterRow.To_Number);
                        db.AddInParameter(command, "@Level", DbType.String, objDNCMasterRow.Level);                        
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, objDNCMasterRow.Modified_By);
                        db.AddInParameter(command, "@Modified_On", DbType.DateTime, objDNCMasterRow.Trans_Date);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, objDNCMasterRow.Is_Active);
                        db.AddInParameter(command, "@Last_Used_Number", DbType.String, objDNCMasterRow.Last_Used_Number);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                        
//  db.ExecuteNonQuery(command);
                        db.FunPubExecuteNonQuery(command);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                    }
                }
                catch (Exception exp)
                {
                    intRowsAffected = 50;
                    FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return intRowsAffected;
            }

            #endregion

            #region Get DNS Details

            public FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable FunPubQueryDNS(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB, string strConnectionName)
            {
                FA_BusEntity.SysAdmin.SystemAdmin dsSystemAdmin = new FA_BusEntity.SysAdmin.SystemAdmin();
                objDNCDetails_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable)FAClsPubSerialize.DeSerialize(bytesobjDNCDetails_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable));
                try
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.GetDNC);
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsRow ObjDNCDetailsRow in objDNCDetails_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Doc_Number_Seq_ID", DbType.Int32, ObjDNCDetailsRow.Doc_Number_Seq_ID);
                        db.FunPubLoadDataSet(command, dsSystemAdmin, dsSystemAdmin.FA_Sys_DNCDetails.TableName);
                    }
                }
                catch (Exception exp)
                {
                    FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return dsSystemAdmin.FA_Sys_DNCDetails;
            }


            public FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable FunPubQueryDNS_View(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB,string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging)
            {
                intTotalRecords = 0;
                FA_BusEntity.SysAdmin.SystemAdmin dsSystemAdmin = new FA_BusEntity.SysAdmin.SystemAdmin();
                objDNCDetails_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable)FAClsPubSerialize.DeSerialize(bytesobjDNCDetails_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable));
                try
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.GetDNCView);
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsRow objDNCDetailsRow in objDNCDetails_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Doc_Number_Seq_ID", DbType.Int32, objDNCDetailsRow.Doc_Number_Seq_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objDNCDetailsRow.Company_ID);
                        db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                        db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                        db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                        db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                        db.AddInParameter(command, "@Program_ID", DbType.Int32, ObjPaging.ProProgram_ID);
                        db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                        db.FunPubLoadDataSet(command, dsSystemAdmin, dsSystemAdmin.FA_Sys_DNCDetails.TableName);

                        if ((int)command.Parameters["@TotalRecords"].Value > 0)
                            intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;
                    }
                }
                catch (Exception exp)
                {
                    FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return dsSystemAdmin.FA_Sys_DNCDetails;
            }
            #endregion

            #region Get Batch
            public FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable FunPubGetBatch(FASerializationMode SerMode, byte[] bytesobjBatchList_DTB, string strConnectionName)
            {
                FA_BusEntity.SysAdmin.SystemAdmin dsSystemAdmin = new FA_BusEntity.SysAdmin.SystemAdmin();

                objBatchList_DTB = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable)FAClsPubSerialize.DeSerialize(bytesobjBatchList_DTB, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable));
                try
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.GetBatch);
                    foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListRow objBatchListRow in objBatchList_DTB.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objBatchListRow.Company_ID);
                        db.FunPubLoadDataSet(command, dsSystemAdmin, dsSystemAdmin.FA_Sys_BatchList.TableName);
                    }
                }
                catch (Exception exp)
                {
                    FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                }
                return dsSystemAdmin.FA_Sys_BatchList;

            }
            #endregion 

        }

    }
