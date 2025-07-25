using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FA_BusEntity;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace FA_DALayer.FinancialAccounting
{

    public class ClsPubCollateralCapture
    {
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralCaptureDataTable objCollateralCapture_DTB;
        FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralCaptureRow objCollateralCaptureRow;

        Database db;
        public ClsPubCollateralCapture(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }
        #region Create Collateral Capture
        /// <summary>
        /// Insert Collateral Valuation Details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjCollateralCaptureDataTable"></param>
        /// <returns></returns>
        /// 
        public int FunPubCreateCollateralCapture(FASerializationMode SerMode, byte[] bytesObjCollateralCaptureDataTable, string strConnectionName, out string StrCollCap_No)
        {
            StrCollCap_No = "";
            try
            {

                //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");

                DbCommand command = db.GetStoredProcCommand("FA_CLT_Ins_Capture");

                objCollateralCapture_DTB = (FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralCaptureDataTable)FAClsPubSerialize.DeSerialize(bytesObjCollateralCaptureDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralCaptureDataTable));
                objCollateralCaptureRow = objCollateralCapture_DTB.Rows[0] as FA_BusEntity.FinancialAccounting.FA_DEAL_MASTER.FA_CLT_CollateralCaptureRow;
                db.AddInParameter(command, "@Collateral_Capture_ID", DbType.Int32, objCollateralCaptureRow.Collateral_Capture_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, objCollateralCaptureRow.Company_ID);
                db.AddInParameter(command, "@Collateral_Tran_No", DbType.String, objCollateralCaptureRow.Collateral_Tran_No);
                db.AddInParameter(command, "@Collateral_Tran_Date", DbType.DateTime, objCollateralCaptureRow.Collateral_Tran_Date);
                db.AddInParameter(command, "@Is_Active", DbType.Boolean, objCollateralCaptureRow.Is_Active);
                //db.AddInParameter(command, "@Ref_Point_ID", DbType.String, objCollateralCaptureRow.Ref_Point_ID);
                db.AddInParameter(command, "@Collaterl_Ref_No", DbType.String, objCollateralCaptureRow.Collateral_Ref_No);
                if (!objCollateralCaptureRow.IsDataColumn1Null())
                    db.AddInParameter(command, "@Funder_ID", DbType.String, objCollateralCaptureRow.DataColumn1);

                FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
                db.AddInParameter(command, "@XMLHIGHLIQSecurityDetails", DbType.String, objCollateralCaptureRow.XML_HighLiqSecDetails);
                db.AddInParameter(command, "@XMLMEDIUMLIQSecurityDetails", DbType.String, objCollateralCaptureRow.XML_MedLiqSecDetails);
                db.AddInParameter(command, "@XMLLOWLIQSecurityDetails", DbType.String, objCollateralCaptureRow.XML_LowLiqSecDetails);
                db.AddInParameter(command, "@XMLCOMMODITIESLIQSecDetails", DbType.String, objCollateralCaptureRow.XML_CommoditiesDetails);
                db.AddInParameter(command, "@XMLFINANCIALLIQSecDetails", DbType.String, objCollateralCaptureRow.XML_FinancialDetails);
                db.AddInParameter(command, "@XMLDealDetails", DbType.String, objCollateralCaptureRow.XML_DealDetails);

                db.AddInParameter(command, "@Created_By", DbType.Int32, objCollateralCaptureRow.Created_By);
                db.AddInParameter(command, "@Created_On", DbType.DateTime, objCollateralCaptureRow.Created_On);
                db.AddInParameter(command, "@Modified_By", DbType.Int32, objCollateralCaptureRow.Modified_By);
                db.AddInParameter(command, "@Modified_On", DbType.DateTime, objCollateralCaptureRow.Modified_On);
                db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                db.AddOutParameter(command, "@DS_NO", DbType.String, 100);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        db.FunPubExecuteNonQuery(command, ref trans);
                        if ((int)command.Parameters["@ErrorCode"].Value > 0 || (int)command.Parameters["@ErrorCode"].Value < 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                        }
                        if ((int)command.Parameters["@ErrorCode"].Value == 0)
                        {
                            intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                            trans.Commit();
                            StrCollCap_No = (string)command.Parameters["@DS_NO"].Value;
                        }
                        else
                        {
                            trans.Rollback();
                        }
                    }
                    catch (Exception ex)
                    {
                        if (intErrorCode == 0)
                            intErrorCode = 50;
                          FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                  FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
            }
            return intErrorCode;
        }


        #endregion
    }
}
