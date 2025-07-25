#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Dimension Master
/// Created By			: Tamilselvan.S
/// Created Date		: 27-Jan-2012
/// Purpose	            : To Create/Update and to retrive Dimension Master

/// <Program Summary>
#endregion

using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;

namespace FA_DALayer.SysAdmin
{
    public class ClsPubFADimensionMaster
    {
        #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable ObjDimensionMasterDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubFADimensionMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Function's]
        /// <summary>
        /// Created By Tamilselvan.S
        /// created Date 25/01/2012
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_DimensionMasterDataTable"></param>
        /// <param name="intTotalRecords"></param>
        /// <param name="ObjPaging"></param>
        /// <returns></returns>
        public DataTable FunPubQueryDimensionPaging(FASerializationMode SerMode, byte[] bytesObjSNXG_DimensionMasterDataTable,string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            intTotalRecords = 0;
            DataSet dsDimension = new DataSet();
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable dtDimension = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable();
            ObjDimensionMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjSNXG_DimensionMasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable));
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.View_Dimension_Paging);
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterRow ObjDimensionMasterRow in ObjDimensionMasterDataTable.Rows)
                {
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjDimensionMasterRow.Company_ID);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, ObjDimensionMasterRow.User_ID);
                    db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                    db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                    db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                    db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                    db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));

                    db.FunPubLoadDataSet(command, dsDimension, "Dimension");
                    if ((int)command.Parameters["@TotalRecords"].Value > 0)
                        intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;
                    //   dtDimension = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable)dsDimension.Tables[0];
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return dsDimension.Tables[0];
        }

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 28/01/2012
        /// For Insert and Update process for Dimension Master
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_DimensionMaster"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateDimensionMaster(FASerializationMode SerMode, byte[] byteObjFA_DimensionMaster, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable dtDimension = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable();
            ObjDimensionMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_DimensionMaster, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_DimensionMasterRow ObjDimensionMasterRow = ObjDimensionMasterDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdateDimension);
              
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjDimensionMasterRow.Company_ID);
                db.AddInParameter(command, "@Mode", DbType.String, strMode);
                if(!ObjDimensionMasterRow.IsDimIDNull())
                    db.AddInParameter(command, "@dim_id", DbType.Int32, ObjDimensionMasterRow.DimID);
                if (!ObjDimensionMasterRow.IsActivityNull())
                    db.AddInParameter(command, "@Activity", DbType.Int32, ObjDimensionMasterRow.Activity);
                if (!ObjDimensionMasterRow.IsDim_TypeNull())
                    db.AddInParameter(command, "@Dim_Type", DbType.Int32, ObjDimensionMasterRow.Dim_Type);
                if (!ObjDimensionMasterRow.IsDim_CodeNull())
                    db.AddInParameter(command, "@Dim_Code", DbType.String, ObjDimensionMasterRow.Dim_Code);
                if (!ObjDimensionMasterRow.IsDim_DescNull())
                    db.AddInParameter(command, "@Dim_Desc", DbType.String, ObjDimensionMasterRow.Dim_Desc);
                if (!ObjDimensionMasterRow.IsDim_PatternNull())
                    db.AddInParameter(command, "@Dim_Pattern", DbType.String, ObjDimensionMasterRow.Dim_Pattern);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjDimensionMasterRow.User_ID);
                if (!ObjDimensionMasterRow.IsTrans_DateNull())
                    db.AddInParameter(command, "@Trans_Date", DbType.DateTime, ObjDimensionMasterRow.Trans_Date);
                if (!ObjDimensionMasterRow.IsDim1_Ref_IDNull())
                    db.AddInParameter(command, "@Dim1_Ref_ID", DbType.Int32, ObjDimensionMasterRow.Dim1_Ref_ID);
                //db.AddInParameter(command, "@Location_id", DbType.Int32, ObjDimensionMasterRow.Location_Id);
                db.AddInParameter(command, "@XMLLocationDetails", DbType.String, ObjDimensionMasterRow.XMLLocationDetails);
                db.AddInParameter(command, "@Dim_Type_Desc", DbType.String, ObjDimensionMasterRow.Dim_Type_Desc);
                db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjDimensionMasterRow.Is_Active);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //db.ExecuteNonQuery(command, trans);
                        db.FunPubExecuteNonQuery(command, ref trans);
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


        #endregion [Function's]

    }
}
