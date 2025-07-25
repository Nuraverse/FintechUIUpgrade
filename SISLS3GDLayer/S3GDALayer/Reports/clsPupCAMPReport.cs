#region Page Header
/// © 2015 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Orignation
/// Screen Name			: Report CAMP Class ( Currency Creation Service Class)
/// Created By			: Anbuvel.T
/// Created Date		: 26-FEB-2015
/// Purpose	            : 
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Text;
using S3GBusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using System.IO;
using System.Data;
using System.Collections;
using System.Data.OracleClient;
using System.Collections.Generic;
#endregion

namespace S3GDALayer.Reports
{
    namespace CAMPMgtServices
    {
        public class clsPupCAMPReport
        {
            Database db;
            public clsPupCAMPReport()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }
            /// <summary>
            /// To Get List Of Values using Datatable
            /// </summary>
            /// <param name="strProcName">strProcName</param>
            /// <param name="dctProcParams">dctProcParams</param>
            /// <returns></returns>
            public DataTable FunPubFillAutoList(string strProcName, Dictionary<string, string> dctProcParams)
            {
                DataSet ds = new DataSet();
                try
                {
                    DbCommand command = db.GetStoredProcCommand(strProcName);
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        if (!string.IsNullOrEmpty(ProcPair.Value) && ProcPair.Value.Contains("<Root>") && enumDBType == S3GDALDBType.ORACLE)
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
                    db.FunPubLoadDataSet(command, ds, "ListTable");
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return ds.Tables.Count == 0 ? null : ds.Tables[0];
            }
            public DataSet FunPubFillDataset(string strProcName, Dictionary<string, string> dctProcParams)
            {
                DataSet ds = new DataSet();
                try
                {
                    DbCommand command = db.GetStoredProcCommand(strProcName);
                    S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                    foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                    {
                        if (!string.IsNullOrEmpty(ProcPair.Value) && ProcPair.Value.Contains("<Root>") && enumDBType == S3GDALDBType.ORACLE)
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
                    db.FunPubLoadDataSet(command, ds, "ListTable");
                }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return ds;
            }
            /// <summary>
            /// Function Mainly for Gridview Binding with paging it should have predefined Paging object
            /// passed to it.
            /// </summary>
            /// <param name="strProcName">Procedure name used for grid binding </param>
            /// <param name="dctProcParams">Parameter for the Procedure</param>
            /// <param name="intTotalRecords">Total records that the query return</param>
            /// <param name="ObjPaging"> Paging object that has page related details</param>
            /// <returns>DataTable</returns>
            public DataTable FunPubFillGridPagingReports(string strProcName, Dictionary<string, string> dctProcParams, out int intTotalRecords, PagingValues ObjPaging)
            {
                intTotalRecords = 0;
                DataSet ds = new DataSet();
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    if (ObjPaging.ProPageSize == 0)
                    {
                        ObjPaging.ProPageSize = 1;
                    }
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
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return ds.Tables["GridTable"];

            }
        }
    }
}
