#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: TaxGuide Master DAL Class
/// Created By			: Kaliraj K
/// Created Date		: 29-May-2010
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
#endregion

namespace S3GDALayer
{
    /// Added the Name Space For Logical Grouping
    /// This Class belongs AccountMgtServices to the service group
    namespace AccountMgtServices
    {
        public class ClsPubTaxGuide
        {
            #region Initialization
            int intRowsAffected;
            S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable ObjTaxGuideDataTable_DAL;

            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubTaxGuide()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }
            
            #endregion

            #region Create New TaxGuide
            /// <summary>
            /// Creates a new TaxGuide by getting Serialized data table object and serialized mode
            /// Create and update TaxGuide details based on TaxGuide sequence id
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjS3G_SYSAD_TaxGuideDataTable"></param>
            /// <returns>Error Code (it is 0 if no error is found)</returns>
            public int FunPubCreateTaxGuide(SerializationMode SerMode, byte[] bytesObjS3G_SYSAD_TaxGuideDataTable)
            {
                try
                {

                    ObjTaxGuideDataTable_DAL = (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_TaxGuideDataTable, SerMode, typeof(S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable));
                    DbCommand command = null;
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    foreach (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideRow ObjTaxGuideRow in ObjTaxGuideDataTable_DAL.Rows)
                    {
                        command = db.GetStoredProcCommand("S3G_Insert_TaxGuide_Details");
                        db.AddInParameter(command, "@Tax_Code_ID", DbType.Int32, ObjTaxGuideRow.Tax_Code_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjTaxGuideRow.Company_ID);
                        db.AddInParameter(command, "@LOB_ID", DbType.String, ObjTaxGuideRow.LOB_ID);
                        if(!ObjTaxGuideRow.IsBranch_IDNull())
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjTaxGuideRow.Branch_ID);

                        db.AddInParameter(command, "@TaxType_ID", DbType.String, ObjTaxGuideRow.Tax_Type_ID);
                        db.AddInParameter(command, "@RatePercentage", DbType.String, ObjTaxGuideRow.RatePercentage);
                        if (!ObjTaxGuideRow.IsEligiblePercentageNull())
                            db.AddInParameter(command, "@EligiblePercentage", DbType.Int32, ObjTaxGuideRow.EligiblePercentage);
                        if (!ObjTaxGuideRow.IsPosting_GL_CodeNull())
                            db.AddInParameter(command, "@GLCode", DbType.String, ObjTaxGuideRow.Posting_GL_Code);                        
                        db.AddInParameter(command, "@Setoff_ID", DbType.String, ObjTaxGuideRow.Setoff_ID);
                        db.AddInParameter(command, "@ON_FC_ID", DbType.String, ObjTaxGuideRow.ON_FC_ID);
                        db.AddInParameter(command, "@Recovery_ID", DbType.String, ObjTaxGuideRow.Recovery_ID);
                        db.AddInParameter(command, "@Remittance_ID", DbType.String, ObjTaxGuideRow.Remittance_ID);
                        db.AddInParameter(command, "@Effective_From", DbType.String, ObjTaxGuideRow.Effective_From);
                        db.AddInParameter(command, "@Tax", DbType.String, ObjTaxGuideRow.Tax);
                        db.AddInParameter(command, "@Surcharge", DbType.String, ObjTaxGuideRow.Surcharge);
                        db.AddInParameter(command, "@Cess", DbType.String, ObjTaxGuideRow.Cess);
                        db.AddInParameter(command, "@User_ID", DbType.String, ObjTaxGuideRow.Created_By);
                        db.AddInParameter(command, "@XMLAsset", DbType.String, ObjTaxGuideRow.XMLAsset);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjTaxGuideRow.Is_Active);
                        db.AddOutParameter(command,"@ErrorCode", DbType.Int32, sizeof(Int64));
                        //db.ExecuteNonQuery(command);
                        
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

            #region Query TaxGuide Details
            /// <summary>
            /// Gets a TaxGuide details using Serialized data table object and serialized mode
            /// </summary>
            /// <param name="SerMode"></param>
            /// <param name="bytesObjSNXG_TaxGuideManagementDataTable"></param>
            /// <returns>Datatable containing TaxGuide details</returns>

            public S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable FunPubQueryTaxGuide(SerializationMode SerMode, byte[] bytesObjSNXG_TaxGuideDataTable)
            {
                S3GBusEntity.AccountMgtServices dsTaxGuide = new S3GBusEntity.AccountMgtServices();
                ObjTaxGuideDataTable_DAL = (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_TaxGuideDataTable, SerMode, typeof(S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Get_TaxGuide_Details");
                    foreach (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideRow ObjTaxGuideRow in ObjTaxGuideDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjTaxGuideRow.Company_ID);
                        db.AddInParameter(command, "@TaxCode_ID", DbType.Int32, ObjTaxGuideRow.Tax_Code_ID);
                       // db.LoadDataSet(command, dsTaxGuide, dsTaxGuide.S3G_SYSAD_TaxGuide.TableName);
                        db.FunPubLoadDataSet(command, dsTaxGuide, dsTaxGuide.S3G_SYSAD_TaxGuide.TableName);
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return dsTaxGuide.S3G_SYSAD_TaxGuide;
                
            }

            public S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable FunPubQueryTaxGuidePaging(SerializationMode SerMode, byte[] bytesObjSNXG_TaxGuideDataTable, out int intTotalRecords, PagingValues ObjPaging)
            {
                intTotalRecords = 0;
                S3GBusEntity.AccountMgtServices dsTaxGuide = new S3GBusEntity.AccountMgtServices();
                ObjTaxGuideDataTable_DAL = (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_TaxGuideDataTable, SerMode, typeof(S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideDataTable));
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_Get_TaxGuide_Paging");
                    foreach (S3GBusEntity.AccountMgtServices.S3G_SYSAD_TaxGuideRow ObjTaxGuideRow in ObjTaxGuideDataTable_DAL.Rows)
                    {
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjTaxGuideRow.Company_ID);
                        db.AddInParameter(command, "@TaxCode_ID", DbType.Int32, ObjTaxGuideRow.Tax_Code_ID);
                        db.AddInParameter(command, "@CurrentPage", DbType.Int32, ObjPaging.ProCurrentPage);
                        db.AddInParameter(command, "@PageSize", DbType.Int32, ObjPaging.ProPageSize);
                        db.AddInParameter(command, "@SearchValue", DbType.String, ObjPaging.ProSearchValue);
                        db.AddInParameter(command, "@OrderBy", DbType.String, ObjPaging.ProOrderBy);
                        db.AddOutParameter(command, "@TotalRecords", DbType.Int32, sizeof(Int32));
                       // db.LoadDataSet(command, dsTaxGuide, dsTaxGuide.S3G_SYSAD_TaxGuide.TableName);
                        db.FunPubLoadDataSet(command, dsTaxGuide, dsTaxGuide.S3G_SYSAD_TaxGuide.TableName);
                        if ((int)command.Parameters["@TotalRecords"].Value > 0)
                            intTotalRecords = (int)command.Parameters["@TotalRecords"].Value;
                    }
                }
                catch (Exception ex)
                {
                     ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                    throw ex;
                }
                return dsTaxGuide.S3G_SYSAD_TaxGuide;

            }

            #endregion

         
        }
    }
}
