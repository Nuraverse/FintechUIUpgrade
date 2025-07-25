#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Company Master
/// Created By			: M.Saran
/// Created Date		: 24-Jan-2012
/// Purpose	            : To Create Company Master

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
    public class ClsPubCompanyMaster
    {
        #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;
        //FA_BusEntity.SysAdmin.CompanyMgtServices.FA_SYS_CompanyMasterDataTable ObjCompanyMasterDataTable;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable ObjCompanyMasterDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubCompanyMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion


        #region Create New Company
        /// <summary>
        /// Creates a new company by getting Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CompanyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubInsertCompanyMaster(FASerializationMode SerMode, byte[] bytesObjFA_SYS_CompanyMasterDataTable, string strConnectionName)
        {
            try
            {

                ObjCompanyMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_SYS_CompanyMasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable));
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterRow ObjCompanyMasterRow in ObjCompanyMasterDataTable.Rows)
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.InsertCompanyDtls);
                    if (ObjCompanyMasterRow.Company_ID != -1)
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCompanyMasterRow.Company_ID);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Company_code)))
                        db.AddInParameter(command, "@Company_code", DbType.String, ObjCompanyMasterRow.Company_code);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Company_name)))
                        db.AddInParameter(command, "@Company_name", DbType.String, ObjCompanyMasterRow.Company_name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Address)))
                        db.AddInParameter(command, "@HO_Address", DbType.String, ObjCompanyMasterRow.HO_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Phone)))
                        db.AddInParameter(command, "@HO_Phone", DbType.String, ObjCompanyMasterRow.HO_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Email)))
                        db.AddInParameter(command, "@HO_Email", DbType.String, ObjCompanyMasterRow.HO_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Address)))
                        db.AddInParameter(command, "@Comu_Address", DbType.String, ObjCompanyMasterRow.Comu_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Phone)))
                        db.AddInParameter(command, "@Comu_Phone", DbType.String, ObjCompanyMasterRow.Comu_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Email)))
                        db.AddInParameter(command, "@Comu_Email", DbType.String, ObjCompanyMasterRow.Comu_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comp_PAN)))
                        db.AddInParameter(command, "@Comp_PAN", DbType.String, ObjCompanyMasterRow.Comp_PAN);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comp_TIN)))
                        db.AddInParameter(command, "@Comp_TIN", DbType.String, ObjCompanyMasterRow.Comp_TIN);

                    db.AddInParameter(command, "@Comp_Incorp_Date", DbType.DateTime, ObjCompanyMasterRow.Comp_Incorp_Date);
                    if (ObjCompanyMasterRow.Default_Currency != -1)
                        db.AddInParameter(command, "@Default_Currency", DbType.Int32, ObjCompanyMasterRow.Default_Currency);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.FinancialYear)))
                        db.AddInParameter(command, "@FinancialYear", DbType.String, ObjCompanyMasterRow.FinancialYear);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Group_code)))
                        db.AddInParameter(command, "@Group_code", DbType.String, ObjCompanyMasterRow.Group_code);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Group_name)))
                        db.AddInParameter(command, "@Group_name", DbType.String, ObjCompanyMasterRow.Group_name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Name)))
                        db.AddInParameter(command, "@Cont_Per_Name", DbType.String, ObjCompanyMasterRow.Cont_Per_Name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Designation)))
                        db.AddInParameter(command, "@Cont_Per_Designation", DbType.String, ObjCompanyMasterRow.Cont_Per_Designation);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Address)))
                        db.AddInParameter(command, "@Cont_Per_Address", DbType.String, ObjCompanyMasterRow.Cont_Per_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Mobile)))
                        db.AddInParameter(command, "@Cont_Per_Mobile", DbType.String, ObjCompanyMasterRow.Cont_Per_Mobile);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Email)))
                        db.AddInParameter(command, "@Cont_Per_Email", DbType.String, ObjCompanyMasterRow.Cont_Per_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Phone)))
                        db.AddInParameter(command, "@Cont_Per_Phone", DbType.String, ObjCompanyMasterRow.Cont_Per_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.SA_UserName)))
                        db.AddInParameter(command, "@SA_UserName", DbType.String, ObjCompanyMasterRow.SA_UserName);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.SA_Password)))
                        db.AddInParameter(command, "@SA_Password", DbType.String, ObjCompanyMasterRow.SA_Password);
                    db.AddInParameter(command, "@Comp_Status", DbType.String, ObjCompanyMasterRow.Comp_Status);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjCompanyMasterRow.Created_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            // Modified By Chandrasekar K On 03-Sep-2012
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

        #region Update New Company
        /// <summary>
        /// Creates a new company by getting Serialized data table object and serialized mode
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CompanyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubUpdateCompanyMaster(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CompanyMasterDataTable, string strConnectionName)
        {
            try
            {

                ObjCompanyMasterDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_CompanyMasterDataTable, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterDataTable));
                foreach (FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_CompanyMasterRow ObjCompanyMasterRow in ObjCompanyMasterDataTable.Rows)
                {
                    DbCommand command = db.GetStoredProcCommand(SPNames.UpdateCompanyDtls);
                    if (ObjCompanyMasterRow.Company_ID != -1)
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCompanyMasterRow.Company_ID);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Company_name)))
                        db.AddInParameter(command, "@Company_name", DbType.String, ObjCompanyMasterRow.Company_name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Address)))
                        db.AddInParameter(command, "@HO_Address", DbType.String, ObjCompanyMasterRow.HO_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Phone)))
                        db.AddInParameter(command, "@HO_Phone", DbType.String, ObjCompanyMasterRow.HO_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.HO_Email)))
                        db.AddInParameter(command, "@HO_Email", DbType.String, ObjCompanyMasterRow.HO_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Address)))
                        db.AddInParameter(command, "@Comu_Address", DbType.String, ObjCompanyMasterRow.Comu_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Phone)))
                        db.AddInParameter(command, "@Comu_Phone", DbType.String, ObjCompanyMasterRow.Comu_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comu_Email)))
                        db.AddInParameter(command, "@Comu_Email", DbType.String, ObjCompanyMasterRow.Comu_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comp_PAN)))
                        db.AddInParameter(command, "@Comp_PAN", DbType.String, ObjCompanyMasterRow.Comp_PAN);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Comp_TIN)))
                        db.AddInParameter(command, "@Comp_TIN", DbType.String, ObjCompanyMasterRow.Comp_TIN);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.FinancialYear)))
                        db.AddInParameter(command, "@FinancialYear", DbType.String, ObjCompanyMasterRow.FinancialYear);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Group_name)))
                        db.AddInParameter(command, "@Group_name", DbType.String, ObjCompanyMasterRow.Group_name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Name)))
                        db.AddInParameter(command, "@Cont_Per_Name", DbType.String, ObjCompanyMasterRow.Cont_Per_Name);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Designation)))
                        db.AddInParameter(command, "@Cont_Per_Designation", DbType.String, ObjCompanyMasterRow.Cont_Per_Designation);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Address)))
                        db.AddInParameter(command, "@Cont_Per_Address", DbType.String, ObjCompanyMasterRow.Cont_Per_Address);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Mobile)))
                        db.AddInParameter(command, "@Cont_Per_Mobile", DbType.String, ObjCompanyMasterRow.Cont_Per_Mobile);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Email)))
                        db.AddInParameter(command, "@Cont_Per_Email", DbType.String, ObjCompanyMasterRow.Cont_Per_Email);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.Cont_Per_Phone)))
                        db.AddInParameter(command, "@Cont_Per_Phone", DbType.String, ObjCompanyMasterRow.Cont_Per_Phone);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.XMLCompanyCurrency)))
                        db.AddInParameter(command, "@XMLCompanyCurrency", DbType.String, ObjCompanyMasterRow.XMLCompanyCurrency);
                    if (!(string.IsNullOrEmpty(ObjCompanyMasterRow.XMLLocationCurrency)))
                        db.AddInParameter(command, "@XMLLocationCurrency", DbType.String, ObjCompanyMasterRow.XMLLocationCurrency);
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjCompanyMasterRow.Modified_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@ReturnTranValue", DbType.Int32, sizeof(Int64));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            // Modified By Chandrasekar K On 03-Sep-2012
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
    }
}
