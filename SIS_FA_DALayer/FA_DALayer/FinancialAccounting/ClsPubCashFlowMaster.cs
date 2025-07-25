using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FA_BusEntity;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubCashFlowMaster
    {
        #region Initialization
            int intRowsAffected;
            string strConnection = string.Empty;
            int intRowsMapping;
            int intMasterID;
            int DNCNo;
          //  S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_CashflowFlagListDataTable ObjCashflowFlagList_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterDataTable ObjCashflowMaster_Datatable_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GLSLCode_ListDataTable ObjGLSLCodeList_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable ObjGetProgramMaster_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Status_LookupDataTable ObjCashflowType_Datatable_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlowMasterProgramMappingDataTable ObjCashflowMapping_Datatable_DAL;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable ObjCashflowDetails;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Delete_CashFlowMasterDataTable ObjDeleteCashflowDetails;
        FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetCashFlowMappingDataTable ObjCashflowMappingDetails;

           //Code added for getting common connection string  from config file
            Database db;
            public ClsPubCashFlowMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
                strConnection = strConnectionName;
            }


            #endregion          




            //#region GLSLList
            //public S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GLSLCodeListDataTable FunPubGLSLList(FASerializationMode SerMode, byte[] bytesObjS3G_ORG_GLSLListDataTable)
            //{
            //    S3GBusEntity.Origination.CashflowMgtServices dsGLSLList = new S3GBusEntity.Origination.CashflowMgtServices();
            //    ObjGLSLCodeList_DAL = (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GLSLCodeListDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_ORG_GLSLListDataTable, SerMode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GLSLCodeListDataTable));
            //    try
            //    {
            //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            //        DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetGLSLCODEList");
            //        foreach (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GLSLCodeListRow ObjGLSLListRow in ObjGLSLCodeList_DAL.Rows)
            //        {
            //            db.AddInParameter(command, "@LOB_ID", DbType.Int32, ObjGLSLListRow.LOB_ID);
            //            //db.LoadDataSet(command, dsGLSLList, dsGLSLList.S3G_ORG_GLSLCodeList.TableName);
            //            db.FunPubLoadDataSet(command, dsGLSLList, dsGLSLList.S3G_ORG_GLSLCodeList.TableName);
            //        }

            //    }
            //    catch (Exception exp)
            //    {
            //        FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            //    }
            //    return dsGLSLList.S3G_ORG_GLSLCodeList;

            //}
            //#endregion

            #region CashflowProgram
            //public FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable FunPubProgramMaster(FASerializationMode SerMode, byte[] bytesObjS3G_ORG_ProgramMasterDataTable)
            //{
            //    FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable dsProgramMaster=new FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable();  
            //    //S3GBusEntity.Origination.CashflowMgtServices dsProgramMaster = new S3GBusEntity.Origination.CashflowMgtServices();
            //    ObjGetProgramMaster_DAL = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_ORG_ProgramMasterDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramDataTable));
            //    try
            //    {
            //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            //        DbCommand command = db.GetStoredProcCommand("FA_Get_PGMNum");
            //        foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_GetProgramRow ObjProgramMasterRow in ObjGetProgramMaster_DAL.Rows)
            //        {
            //            //db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjProgramMasterRow.Company_ID);
            //            //db.LoadDataSet(command, dsProgramMaster, dsProgramMaster.S3G_ORG_GetProgram.TableName);
            //            db.FunPubLoadDataSet(command, dsProgramMaster, dsProgramMaster.S3G_ORG_GetProgram.TableName);
            //        }

            //    }
            //    catch (Exception exp)
            //    {
            //        FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            //    }
            //    return dsProgramMaster.S3G_ORG_GetProgram;

            //}
            #endregion
        //****************commented by gomathi***************///////
            //#region Lookup
            //public S3GBusEntity.Origination.CashflowMgtServices.S3G_Status_LookUPDataTable FunPubCashflowTypeMaster(FASerializationMode Sermode, byte[] bytesCashflowTypeMaster)
            //{
            //    S3GBusEntity.Origination.CashflowMgtServices DsCashflowType = new S3GBusEntity.Origination.CashflowMgtServices();
            //    ObjCashflowType_Datatable_DAL = (S3GBusEntity.Origination.CashflowMgtServices.S3G_Status_LookUPDataTable)FAClsPubSerialize.DeSerialize(bytesCashflowTypeMaster, Sermode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_Status_LookUPDataTable));
            //    try
            //    {
            //        // DatabaseFactory.CreateDatabase("S3GconnectionString");
            //        DbCommand command = db.GetStoredProcCommand("S3G_ORG_GetStatusLookUp");
            //        foreach (S3GBusEntity.Origination.CashflowMgtServices.S3G_Status_LookUPRow ObjRow in ObjCashflowType_Datatable_DAL.Rows)
            //        {
            //            db.AddInParameter(command, "@Option", DbType.Int32, ObjRow.ID);
            //            db.AddInParameter(command, "@Param1", DbType.String, ObjRow.Type);
            //        }
            //        //db.LoadDataSet(command, DsCashflowType, DsCashflowType.S3G_Status_LookUP.TableName);
            //        db.FunPubLoadDataSet(command, DsCashflowType, DsCashflowType.S3G_Status_LookUP.TableName);
            //    }
            //    catch (Exception ex)
            //    {
            //          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            //    }
            //    return DsCashflowType.S3G_Status_LookUP;
            //}
            //#endregion


            //#region Delete Cashflow
            //public int FunPubDeleteCashflow(FASerializationMode SerMode, byte[] bytesObjS3G_ORG_DeleteCashflowMasterDataTable)
            //{
            //    try
            //    {

            //        ObjDeleteCashflowDetails = (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_DeleteCashFlowMasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_ORG_DeleteCashflowMasterDataTable, SerMode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_DeleteCashFlowMasterDataTable));
            //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
            //        DbCommand command = db.GetStoredProcCommand("S3G_ORG_DeleteCashflowDetails");
            //        foreach (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_DeleteCashFlowMasterRow ObjDeleteCashflowMasterRow in ObjDeleteCashflowDetails.Rows)
            //        {
            //            db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjDeleteCashflowMasterRow.Company_ID);
            //            db.AddInParameter(command, "@Cashflow_ID", DbType.Int32, ObjDeleteCashflowMasterRow.CashFlow_ID);
            //            db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
            //            //db.ExecuteNonQuery(command);
            //            db.FunPubExecuteNonQuery(command);
            //            if ((int)command.Parameters["@ErrorCode"].Value > 0)
            //                intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;                            
            //        }


            //    }
            //    catch (Exception exp)
            //    {
            //        intRowsAffected = 50;
            //        FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            //    }
            //    return intRowsAffected;   
            //} 

            //#endregion

            #region Create Cashflow
            public int FunPubCreateCashflow(FASerializationMode SerMode, byte[] bytesObjFA_CashflowMasterDataTable, out string strCashflowNumber_Out)
            {
                strCashflowNumber_Out = string.Empty;
                try
                {                    

                    ObjCashflowMaster_Datatable_DAL=(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_CashflowMasterDataTable,SerMode,typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterDataTable));
                   // ObjCashflowMaster_Datatable_DAL = (S3GBusEntity.Origination.CashflowMgtServices.F)FAClsPubSerialize.DeSerialize(bytesObjS3G_ORG_CashflowMasterDataTable, SerMode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_CashflowMasterDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterRow ObjCashflowMasterRow in ObjCashflowMaster_Datatable_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("FA_Ins_CashFlow_Details");
                        db.AddInParameter(command, "@Activity_ID", DbType.Int32, ObjCashflowMasterRow.Activity_ID);
                        if (!ObjCashflowMasterRow.IsBranch_IDNull())
                        {
                            db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjCashflowMasterRow.Branch_ID);
                        }
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int64, ObjCashflowMasterRow.COMPANY_ID);
                        db.AddInParameter(command, "@CashFlow_Description", DbType.String, ObjCashflowMasterRow.CashFlow_Description);
                        db.AddInParameter(command, "@Flow_Type", DbType.String, ObjCashflowMasterRow.Flow_Type);
                        db.AddInParameter(command, "@CASHFLOW_FLAG_ID", DbType.Int32, ObjCashflowMasterRow.CASHFLOW_FLAG_ID);
                        db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjCashflowMasterRow.Is_Active);
                        db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjCashflowMasterRow.CREATED_BY);
                        db.AddInParameter(command, "@CREATED_ON", DbType.DateTime, ObjCashflowMasterRow.CREATED_ON);
                       
                        if (!ObjCashflowMasterRow.IsCGL_ACCOUNT_CODENull())
                        {
                            db.AddInParameter(command, "@CGL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.CGL_ACCOUNT_CODE);
                        }
                       db.AddInParameter(command, "@Credit_Type_ID", DbType.Int32, ObjCashflowMasterRow.Credit_Type_ID);
                       db.AddInParameter(command, "@CSL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.CSL_ACCOUNT_CODE);
                       if (!ObjCashflowMasterRow.IsDGL_ACCOUNT_CODENull())
                       {
                           db.AddInParameter(command, "@DGL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.DGL_ACCOUNT_CODE);
                       }
                       db.AddInParameter(command, "@Debit_Type_ID", DbType.Int32, ObjCashflowMasterRow.Debit_Type_ID);
                       db.AddInParameter(command, "@DSL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.DSL_ACCOUNT_CODE);
                        db.AddInParameter(command, "@XML_CASHDeltails", DbType.String, ObjCashflowMasterRow.XML_CASHDeltails);
                        db.AddOutParameter(command, "@Cashflow_No", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                //db.ExecuteNonQuery(command, trans);
                                db.FunPubExecuteNonQuery(command, ref trans);
                                strCashflowNumber_Out = (string)command.Parameters["@Cashflow_No"].Value;
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    throw new Exception("Error thrown Error No" + intRowsAffected.ToString());
                                }
                                else if ((int)command.Parameters["@ErrorCode"].Value < 0)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                    if (intRowsAffected == -1)
                                        throw new Exception("Document Sequence no not-defined");
                                    if (intRowsAffected == -2)
                                        throw new Exception("Document Sequence no exceeds defined limit");
                                }
                                else
                                {
                                    trans.Commit();
                                }

                            }
                            catch (Exception exp)
                            {
                                if (intRowsAffected == 0)
                                intRowsAffected = 50;
                                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
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
                      FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                }
                return intRowsAffected;                
            }

            #endregion


            #region Modify Cashflow
            public int FunPubModifyCashflow(FASerializationMode SerMode, byte[] bytesObjFA_CashflowMasterDataTable)
            {
                try
                {
                    ObjCashflowMaster_Datatable_DAL = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_CashflowMasterDataTable,SerMode,typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterDataTable));
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {


                            foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_CashFlow_MasterRow ObjCashflowMasterRow in ObjCashflowMaster_Datatable_DAL.Rows)
                            {

                                DbCommand command = db.GetStoredProcCommand("FA_update_CFlow_Det");
                                db.AddInParameter(command, "@Activity_ID", DbType.Int32, ObjCashflowMasterRow.Activity_ID);
                                if (!ObjCashflowMasterRow.IsBranch_IDNull())
                                {
                                    db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjCashflowMasterRow.Branch_ID);
                                }
                                db.AddInParameter(command, "@CashFlow_ID", DbType.Int32, ObjCashflowMasterRow.CashFlow_ID);
                                db.AddInParameter(command, "@CashflowDebit_ID", DbType.Int32, ObjCashflowMasterRow.CashflowDebit_ID);
                                db.AddInParameter(command, "@CashflowCredit_ID", DbType.Int32, ObjCashflowMasterRow.CashflowCredit_ID);
                                db.AddInParameter(command, "@CFSl_No", DbType.String, ObjCashflowMasterRow.CFSl_No);
                                db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCashflowMasterRow.COMPANY_ID);
                                db.AddInParameter(command, "@CashFlow_Description", DbType.String, ObjCashflowMasterRow.CashFlow_Description);
                                db.AddInParameter(command, "@Flow_Type", DbType.String, ObjCashflowMasterRow.Flow_Type);
                                db.AddInParameter(command, "@CASHFLOW_FLAG_ID", DbType.Int32, ObjCashflowMasterRow.CASHFLOW_FLAG_ID);
                                db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjCashflowMasterRow.Is_Active);
                                db.AddInParameter(command, "@MODIFIED_BY", DbType.Int32, ObjCashflowMasterRow.MODIFIED_BY);
                                db.AddInParameter(command, "@MODIFIED_ON", DbType.DateTime, ObjCashflowMasterRow.MODIFIED_ON);
                               
                                db.AddInParameter(command, "@CGL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.CGL_ACCOUNT_CODE);
                                db.AddInParameter(command, "@Credit_Type_ID", DbType.Int32, ObjCashflowMasterRow.Credit_Type_ID);

                                db.AddInParameter(command, "@CSL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.CSL_ACCOUNT_CODE);
                                db.AddInParameter(command, "@DGL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.DGL_ACCOUNT_CODE);
                                db.AddInParameter(command, "@Debit_Type_ID", DbType.Int32, ObjCashflowMasterRow.Debit_Type_ID);
                                db.AddInParameter(command, "@DSL_ACCOUNT_CODE", DbType.String, ObjCashflowMasterRow.DSL_ACCOUNT_CODE);
                                db.AddInParameter(command, "@XML_CASHDeltails", DbType.String, ObjCashflowMasterRow.XML_CASHDeltails);
                                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                                //db.ExecuteNonQuery(command);
                                db.FunPubExecuteNonQuery(command);
                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                            }
                            trans.Commit();
                        }
                        catch (Exception exp)
                        {
                            intRowsAffected = 50;
                            FAClsPubCommErrorLog.CustomErrorRoutine(exp);
                            trans.Rollback();
                        }
                        finally
                        {
                            conn.Close();
                        }
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

            #region GetCFM
       // public FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable FunPubGetCashflowDetails(FASerializationMode SerMode, byte[] bytesObjFA_CashflowDetailsDataTable)
       //{
       //     FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable dsCashflowDetails=new FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable();    
       //    // S3GBusEntity.Origination.CashflowMgtServices dsCashflowDetails = new S3GBusEntity.Origination.CashflowMgtServices();
       //         ObjCashflowDetails = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_CashflowDetailsDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsDataTable));
       //         try
       //         {
       //             //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
       //             DbCommand command = db.GetStoredProcCommand("FA_GET_CASHFLOW_DET");
       //             foreach (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_Get_CashFlowDetailsRow ObjCashflowDetailsRow in ObjCashflowDetails.Rows)
       //             {
       //                 db.AddInParameter(command, "@CashFlow_ID", DbType.Int32, ObjCashflowDetailsRow.CashFlow_ID);
       //                 db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCashflowDetailsRow.Company_ID);
       //                 //db.LoadDataSet(command, dsCashflowDetails, dsCashflowDetails.S3G_ORG_GetCashflowDetails.TableName);
       //                 db.FunPubLoadDataSet(command, dsCashflowDetails, dsCashflowDetails.FA_Get_CashFlowDetails.TableName);
       //             }

       //         }
       //         catch (Exception exp)
       //         {
       //             FAClsPubCommErrorLog.CustomErrorRoutine(exp);
       //         }
       //         return dsCashflowDetails.FA_Get_CashFlowDetails.TableName;

       //     }

       //     //public S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GetCashflowMappingDataTable FunPubGetCashflowMapping(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CashflowMappingDataTable)
       //     //{
       //     //    S3GBusEntity.Origination.CashflowMgtServices dsCashflowMapping = new S3GBusEntity.Origination.CashflowMgtServices();
       //     //    ObjCashflowMappingDetails = (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GetCashflowMappingDataTable)FAClsPubSerialize.DeSerialize(bytesObjS3G_SYSAD_CashflowMappingDataTable, SerMode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GetCashflowMappingDataTable));
       //     //    try
       //     //    {
       //     //        //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    
       //     //        foreach (S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_GetCashflowMappingRow ObjCashflowMappingRow in ObjCashflowMappingDetails.Rows)
       //     //        {
       //     //            DbCommand command = db.GetStoredProcCommand("FA_GET_CFMAPPING");
       //     //            db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjCashflowMappingRow.Company_ID);
       //     //            db.AddInParameter(command, "@CashFlow_ID", DbType.Int32, ObjCashflowMappingRow.CashFlow_ID);
       //     //            //db.LoadDataSet(command, dsCashflowMapping, dsCashflowMapping.S3G_ORG_GetCashflowMapping.TableName);
       //     //            db.FunPubLoadDataSet(command, dsCashflowMapping, dsCashflowMapping.S3G_ORG_GetCashflowMapping.TableName);
       //     //        }

       //     //    }
       //     //    catch (Exception exp)
       //     //    {
       //     //        FAClsPubCommErrorLog.CustomErrorRoutine(exp);
       //     //    }
       //     //    return dsCashflowMapping.S3G_ORG_GetCashflowMapping;

       //     //}


            #endregion
    }
}
