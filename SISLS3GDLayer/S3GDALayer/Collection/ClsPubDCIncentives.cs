using System;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using S3GBusEntity;
using System.Data.OracleClient;

namespace S3GDALayer.Collection
{
    public class ClsPubDCIncentives
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesDataTable objDCIncetinve_DTB;
        S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesRow objDCIncetinveRow;

        S3GBusEntity.Collection.FA_DC_Incentive.S3G_DC_INCENTIVE_UPLOADDataTable objDCIncetinve_Upd;
        S3GBusEntity.Collection.FA_DC_Incentive.S3G_DC_INCENTIVE_UPLOADRow objDCIncetinve_UpdRow;

        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_UPLOADDataTable objBCSB_Upd;
        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_UPLOADRow objBCSB_UpdRow;

        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERDataTable objBCSB_ConUpd;
        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERRow objBCSB_ConUpdRow;

        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CORPORATEDataTable objBCSB_CorUpd;
        //FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CORPORATERow objBCSB_CorUpdRow;

        Database db;
        S3GDALayer.S3GDALDBType enumDBType = S3GDALayer.Common.ClsIniFileAccess.S3G_DBType;
        public ClsPubDCIncentives(string strConnectionName)
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
        }
        DbCommand dbCmd;

        public int FunDCIncentiveMasterInsertInt(SerializationMode SerMode, byte[] bytesObjSNXG_Product_MasterDataTable)
        {
            try
            {                
                objDCIncetinve_DTB = (S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_Product_MasterDataTable, SerMode, typeof(S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesDataTable));
                DbCommand command = db.GetStoredProcCommand("S3G_CLN_INS_DC_INCENTIVE_MST");
                foreach (S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesRow objDCIncetinveRow in objDCIncetinve_DTB.Rows)
                {
                    db.AddInParameter(command, "@Collection_Type_ID", DbType.String, objDCIncetinveRow.Collection_Type_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objDCIncetinveRow.Location_ID);                    
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objDCIncetinveRow.Company_ID);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, objDCIncetinveRow.Is_Active);
                    if (!objDCIncetinveRow.IsXmlIncentiveDetNull())
                    {
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!objDCIncetinveRow.IsXmlIncentiveDetNull())
                            {
                                param = new OracleParameter("@XmlIncentiveDet",
                                 OracleType.Clob, objDCIncetinveRow.XmlIncentiveDet.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, objDCIncetinveRow.XmlIncentiveDet);
                                command.Parameters.Add(param);

                            }
                            if (!objDCIncetinveRow.IsXmlAssignValueNull())
                            {
                                param = new OracleParameter("@XmlAssignValue",
                                 OracleType.Clob, objDCIncetinveRow.XmlAssignValue.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, objDCIncetinveRow.XmlAssignValue);
                                command.Parameters.Add(param);
                            }
                        }

                        else
                        {
                            db.AddInParameter(command, "@XmlIncentiveDet", DbType.String, objDCIncetinveRow.XmlIncentiveDet);
                            db.AddInParameter(command, "@XmlAssignValue", DbType.String, objDCIncetinveRow.XmlAssignValue);
                        }
                    }
                    db.AddInParameter(command, "@Created_By", DbType.Int32, objDCIncetinveRow.Created_By);
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, objDCIncetinveRow.Modified_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                }

            }
            catch (Exception ex)
            {
                int_OutResult = 50;
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
            }
            return int_OutResult;
        }

        public int FunDCIncentiveMasterUpdateInt(SerializationMode SerMode, byte[] bytesObjSNXG_Product_MasterDataTable)
        {
            try
            {

                objDCIncetinve_DTB = (S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesDataTable)ClsPubSerialize.DeSerialize(bytesObjSNXG_Product_MasterDataTable, SerMode, typeof(S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesDataTable));
                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                DbCommand command = db.GetStoredProcCommand("S3G_CLN_UPD_DC_INCENTIVE_MST");
                foreach (S3GBusEntity.Collection.FA_DC_Incentive.FA_DC_IncentivesRow objDCIncetinveRow in objDCIncetinve_DTB.Rows)
                {
                    db.AddInParameter(command, "@Slab_Header_ID", DbType.Int32, objDCIncetinveRow.Slab_Header_ID);
                    db.AddInParameter(command, "@Collection_Type_ID", DbType.String, objDCIncetinveRow.Collection_Type_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objDCIncetinveRow.Location_ID);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objDCIncetinveRow.Company_ID);
                    db.AddInParameter(command, "@Is_Active", DbType.Boolean, objDCIncetinveRow.Is_Active);
                    if (!objDCIncetinveRow.IsXmlIncentiveDetNull())
                    {
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!objDCIncetinveRow.IsXmlIncentiveDetNull())
                            {
                                param = new OracleParameter("@XmlIncentiveDet",
                                 OracleType.Clob, objDCIncetinveRow.XmlIncentiveDet.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, objDCIncetinveRow.XmlIncentiveDet);
                                command.Parameters.Add(param);

                            }
                            if (!objDCIncetinveRow.IsXmlAssignValueNull())
                            {
                                param = new OracleParameter("@XmlAssignValue",
                                 OracleType.Clob, objDCIncetinveRow.XmlAssignValue.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, objDCIncetinveRow.XmlAssignValue);
                                command.Parameters.Add(param);
                            }
                        }

                        else
                        {
                            db.AddInParameter(command, "@XmlIncentiveDet", DbType.String, objDCIncetinveRow.XmlIncentiveDet);
                            db.AddInParameter(command, "@XmlAssignValue", DbType.String, objDCIncetinveRow.XmlAssignValue);
                        }
                    }                    
                    db.AddInParameter(command, "@Modified_By", DbType.Int32, objDCIncetinveRow.Modified_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                }
            }
            catch (Exception ex)
            {
                int_OutResult = 50;
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
            }
            return int_OutResult;
        }

        public int FunPubCreateDCIncentiveUpload(SerializationMode SerMode, byte[] bytesObjS3G_DC_UploadExcelTable, out string ChequeReturnNo)
        {
            try
            {
                ChequeReturnNo = "";
                objDCIncetinve_Upd = (S3GBusEntity.Collection.FA_DC_Incentive.S3G_DC_INCENTIVE_UPLOADDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_DC_UploadExcelTable, SerMode, typeof(S3GBusEntity.Collection.FA_DC_Incentive.S3G_DC_INCENTIVE_UPLOADDataTable));
                objDCIncetinve_UpdRow = objDCIncetinve_Upd.Rows[0] as S3GBusEntity.Collection.FA_DC_Incentive.S3G_DC_INCENTIVE_UPLOADRow;

                DbCommand command = db.GetStoredProcCommand("S3G_INS_DC_INCENTIVE_UPLOAD");
                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                if (enumDBType == S3GDALDBType.ORACLE)
                {
                    OracleParameter param;
                    param = new OracleParameter("@XMLDCINCENEXCEL",
                        OracleType.Clob, objDCIncetinve_UpdRow.XMLDCINCENEXCEL.Length,
                        ParameterDirection.Input, true, 0, 0, String.Empty,
                        DataRowVersion.Default, objDCIncetinve_UpdRow.XMLDCINCENEXCEL);
                    command.Parameters.Add(param);
                }
                else
                {
                    db.AddInParameter(command, "@XMLDCINCENEXCEL", DbType.String,
                        objDCIncetinve_UpdRow.XMLDCINCENEXCEL);
                }
                db.AddInParameter(command, "@CreatedBy", DbType.Int32, objDCIncetinve_UpdRow.Created_By);
                db.AddInParameter(command, "@Option", DbType.Int32, objDCIncetinve_UpdRow.Option);
                db.AddInParameter(command, "@File_Path", DbType.String, objDCIncetinve_UpdRow.File_Path);
                db.AddInParameter(command, "@Modified_By", DbType.Int32, objDCIncetinve_UpdRow.Modified_By);
                db.AddOutParameter(command, "@DSNO", DbType.String, 100);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                using (DbConnection con = db.CreateConnection())
                {
                    con.Open();
                    DbTransaction trans = con.BeginTransaction();
                    try
                    {
                        db.FunPubExecuteNonQuery(command, ref trans);

                        int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                        if (int_OutResult == 0)
                        {
                            ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
                            trans.Commit();
                        }
                        else
                        {
                            trans.Rollback();
                        }
                    }
                    catch (Exception ex)
                    {
                        trans.Rollback();
                        ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                        int_OutResult = 50;
                    }
                    con.Close();
                }
                //ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
            }
            catch (Exception ex)
            {
                int_OutResult = 50;
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                throw ex;
            }
            return int_OutResult;
        }

        //public int FunPubCreateBCSBUpload(SerializationMode SerMode, byte[] bytesObjS3G_BCSB_UploadExcelTable, out string ChequeReturnNo)
        //{
        //    try
        //    {
        //        ChequeReturnNo = "";
        //        objBCSB_Upd = (FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_UPLOADDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_BCSB_UploadExcelTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_UPLOADDataTable));
        //        objBCSB_UpdRow = objBCSB_Upd.Rows[0] as FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_UPLOADRow;

        //        DbCommand command = db.GetStoredProcCommand("S3G_INS_BCSB_UPLOAD");
        //        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            OracleParameter param;
        //            param = new OracleParameter("@XMLBCSBEXCEL",
        //                OracleType.Clob, objBCSB_UpdRow.XMLBCSBEXCEL.Length,
        //                ParameterDirection.Input, true, 0, 0, String.Empty,
        //                DataRowVersion.Default, objBCSB_UpdRow.XMLBCSBEXCEL);
        //            command.Parameters.Add(param);
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLBCSBEXCEL", DbType.String,
        //                objBCSB_UpdRow.XMLBCSBEXCEL);
        //        }
        //        db.AddInParameter(command, "@CreatedBy", DbType.Int32, objBCSB_UpdRow.Created_By);
        //        db.AddInParameter(command, "@Company_ID", DbType.Int32, objBCSB_UpdRow.Company_Id);
        //        db.AddInParameter(command, "@Upload_Type", DbType.Int32, objBCSB_UpdRow.Upload_Type);
        //        db.AddInParameter(command, "@Option", DbType.Int32, objBCSB_UpdRow.Option);
        //        db.AddInParameter(command, "@File_Path", DbType.String, objBCSB_UpdRow.File_Path);
        //        db.AddInParameter(command, "@Modified_By", DbType.Int32, objBCSB_UpdRow.Modified_By);
        //        db.AddOutParameter(command, "@DSNO", DbType.String, 100);
        //        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

        //        using (DbConnection con = db.CreateConnection())
        //        {
        //            con.Open();
        //            DbTransaction trans = con.BeginTransaction();
        //            try
        //            {
        //                db.FunPubExecuteNonQuery(command, ref trans);

        //                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
        //                if (int_OutResult == 0)
        //                {
        //                    ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
        //                    trans.Commit();
        //                }
        //                else
        //                {
        //                    trans.Rollback();
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                trans.Rollback();
        //                ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                int_OutResult = 50;
        //            }
        //            con.Close();
        //        }                
        //    }
        //    catch (Exception ex)
        //    {
        //        int_OutResult = 50;
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //    }
        //    return int_OutResult;
        //}
        //public int FunPubCreateBCSBUploadConsumer(SerializationMode SerMode, byte[] bytesObjS3G_BCSB_UploadExcelTable, out string ChequeReturnNo)
        //{
        //    try
        //    {
        //        ChequeReturnNo = "";
        //        objBCSB_ConUpd = (FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_BCSB_UploadExcelTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERDataTable));
        //        objBCSB_ConUpdRow = objBCSB_ConUpd.Rows[0] as FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERRow;

        //        DbCommand command = db.GetStoredProcCommand("S3G_INS_BCSB_UPLOAD_CON");
        //        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //                command.Parameters.Add(param);
        //            }                    
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLEMP_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLEMP_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLINQUIRY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLINQ_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLINQ_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_SUMMARY",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_SUMMARY", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_FACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_FACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLGUR_CRFACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLGUR_CRFACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLMONTH_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLMONTH_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLMONTH_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLMONTH_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLMONTH_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLMONTH_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_HIS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_HIS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLSECURITY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLSEC_DTL",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLSECURITY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLSEC_DTL", DbType.String,
        //                objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //        }
        //        db.AddInParameter(command, "@CreatedBy", DbType.Int32, objBCSB_ConUpdRow.Created_By);
        //        db.AddInParameter(command, "@Company_ID", DbType.Int32, objBCSB_ConUpdRow.Company_Id);
        //        db.AddInParameter(command, "@Upload_Type", DbType.Int32, objBCSB_ConUpdRow.Upload_Type);
        //        db.AddInParameter(command, "@Option", DbType.Int32, objBCSB_ConUpdRow.Option);
        //        db.AddInParameter(command, "@File_Path", DbType.String, objBCSB_ConUpdRow.File_Path);
        //        db.AddInParameter(command, "@Modified_By", DbType.Int32, objBCSB_ConUpdRow.Modified_By);
        //        db.AddOutParameter(command, "@DSNO", DbType.String, 100);
        //        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

        //        using (DbConnection con = db.CreateConnection())
        //        {
        //            con.Open();
        //            DbTransaction trans = con.BeginTransaction();
        //            try
        //            {
        //                db.FunPubExecuteNonQuery(command, ref trans);

        //                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
        //                if (int_OutResult == 0)
        //                {
        //                    ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
        //                    trans.Commit();
        //                }
        //                else
        //                {
        //                    trans.Rollback();
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                trans.Rollback();
        //                ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                int_OutResult = 50;
        //            }
        //            con.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        int_OutResult = 50;
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //    }
        //    return int_OutResult;
        //}
        //public int FunPubCreateBCSBUploadConsumerWinserJob(DataTable ObjS3G_BCSB_UploadExcelTable, out string ChequeReturnNo)
        //{
        //    try
        //    {
        //        ChequeReturnNo = "";
        //        objBCSB_ConUpd = (FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERDataTable)ObjS3G_BCSB_UploadExcelTable;
        //        objBCSB_ConUpdRow = objBCSB_ConUpd.Rows[0] as FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CONSUMERRow;


        //        DbCommand command = db.GetStoredProcCommand("S3G_INS_BCSB_UPLOAD_CON");
        //        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLEMP_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLEMP_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLINQUIRY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLINQ_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLINQ_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_SUMMARY",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_SUMMARY", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_FACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_FACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLGUR_CRFACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLGUR_CRFACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLMONTH_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLMONTH_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLMONTH_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLMONTH_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLMONTH_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLMONTH_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_HIS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_HIS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLSECURITY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLSEC_DTL",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLSECURITY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLSEC_DTL", DbType.String,
        //                objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //        }
        //        db.AddInParameter(command, "@CreatedBy", DbType.Int32, objBCSB_ConUpdRow.Created_By);
        //        db.AddInParameter(command, "@Company_ID", DbType.Int32, objBCSB_ConUpdRow.Company_Id);
        //        db.AddInParameter(command, "@Upload_Type", DbType.Int32, objBCSB_ConUpdRow.Upload_Type);
        //        db.AddInParameter(command, "@Option", DbType.Int32, objBCSB_ConUpdRow.Option);
        //        db.AddInParameter(command, "@File_Path", DbType.String, objBCSB_ConUpdRow.File_Path);
        //        db.AddInParameter(command, "@Modified_By", DbType.Int32, objBCSB_ConUpdRow.Modified_By);
        //        db.AddOutParameter(command, "@DSNO", DbType.String, 100);
        //        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

        //        using (DbConnection con = db.CreateConnection())
        //        {
        //            con.Open();
        //            DbTransaction trans = con.BeginTransaction();
        //            try
        //            {
        //                db.FunPubExecuteNonQuery(command, ref trans);

        //                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
        //                if (int_OutResult == 0)
        //                {
        //                    ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
        //                    trans.Commit();
        //                }
        //                else
        //                {
        //                    trans.Rollback();
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                trans.Rollback();
        //                ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                int_OutResult = 50;
        //            }
        //            con.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        int_OutResult = 50;
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //    }
        //    return int_OutResult;
        //}
        //public int FunPubCreateBCSBUploadCorporate(SerializationMode SerMode, byte[] bytesObjS3G_BCSB_UploadExcelTable, out string ChequeReturnNo)
        //{
        //    try
        //    {
        //        ChequeReturnNo = "";
        //        objBCSB_CorUpd = (FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CORPORATEDataTable)ClsPubSerialize.DeSerialize(bytesObjS3G_BCSB_UploadExcelTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CORPORATEDataTable));
        //        objBCSB_CorUpdRow = objBCSB_CorUpd.Rows[0] as FA_BusEntity.FinancialAccounting.FA_DC_Incentive.S3G_BCSB_CORPORATERow;

        //        DbCommand command = db.GetStoredProcCommand("S3G_INS_BCSB_UPLOAD_COR");
        //        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLEMP_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLEMP_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLEMPLOYMENT_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLINQUIRY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLINQ_DETAILS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLINQ_DETAILS", DbType.String,
        //                objBCSB_ConUpdRow.XMLINQUIRY_DETAILS);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_SUMMARY",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_SUMMARY", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCREDIT_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCRD_FACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCRD_FACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLCREDIT_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLGUR_CRFACILI",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLGUR_CRFACILI", DbType.String,
        //                objBCSB_ConUpdRow.XMLGUARANTEED_CR_FACILITIES);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLCON_HIS",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLCON_HIS", DbType.String,
        //                objBCSB_ConUpdRow.XMLCONSUMER_HISTROY_SUMMARY);
        //        }
        //        if (enumDBType == FADALDBType.ORACLE)
        //        {
        //            if (objBCSB_ConUpdRow.XMLSECURITY_DETAILS != null)
        //            {
        //                OracleParameter param;
        //                param = new OracleParameter("@XMLSEC_DTL",
        //                    OracleType.Clob, objBCSB_ConUpdRow.XMLSECURITY_DETAILS.Length,
        //                    ParameterDirection.Input, true, 0, 0, String.Empty,
        //                    DataRowVersion.Default, objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //                command.Parameters.Add(param);
        //            }
        //        }
        //        else
        //        {
        //            db.AddInParameter(command, "@XMLSEC_DTL", DbType.String,
        //                objBCSB_ConUpdRow.XMLSECURITY_DETAILS);
        //        }
        //        db.AddInParameter(command, "@CreatedBy", DbType.Int32, objBCSB_CorUpdRow.Created_By);
        //        db.AddInParameter(command, "@Company_ID", DbType.Int32, objBCSB_CorUpdRow.Company_Id);
        //        db.AddInParameter(command, "@Upload_Type", DbType.Int32, objBCSB_CorUpdRow.Upload_Type);
        //        db.AddInParameter(command, "@Option", DbType.Int32, objBCSB_CorUpdRow.Option);
        //        db.AddInParameter(command, "@File_Path", DbType.String, objBCSB_CorUpdRow.File_Path);
        //        db.AddInParameter(command, "@Modified_By", DbType.Int32, objBCSB_CorUpdRow.Modified_By);
        //        db.AddOutParameter(command, "@DSNO", DbType.String, 100);
        //        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

        //        using (DbConnection con = db.CreateConnection())
        //        {
        //            con.Open();
        //            DbTransaction trans = con.BeginTransaction();
        //            try
        //            {
        //                db.FunPubExecuteNonQuery(command, ref trans);

        //                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
        //                if (int_OutResult == 0)
        //                {
        //                    ChequeReturnNo = command.Parameters["@DSNO"].Value.ToString();
        //                    trans.Commit();
        //                }
        //                else
        //                {
        //                    trans.Rollback();
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                trans.Rollback();
        //                ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //                int_OutResult = 50;
        //            }
        //            con.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        int_OutResult = 50;
        //        ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
        //        throw ex;
        //    }
        //    return int_OutResult;
        //}
    }
}
