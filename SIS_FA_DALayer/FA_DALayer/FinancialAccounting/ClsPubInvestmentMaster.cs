#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Investment Master
/// Created By			: Tamilselvan.S
/// Created Date		: 02/02-Jan-2012
/// Purpose	            : To Create/Update and to retrive Investment Master

/// <Program Summary>
#endregion

#region [Namespace]
using System;
using FA_DALayer.FA_SysAdmin;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;
using System.Data.Common;
using System.Data;
#endregion [Namespace]

namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubInvestmentMaster
    {
        #region [Initialization]
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERDataTable ObjInvestmentMasterDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubInvestmentMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Investment Master]
        /// <summary>
        /// Created by Tamilselvan.S
        /// Created Date 02/02/2012
        /// To retrive the Lookup values 
        /// </summary>
        /// <param name="strProcName"></param>
        /// <param name="dictParams"></param>
        /// <returns></returns>
        public DataSet FunPubGetLookupValues(string strProcName, Dictionary<string, string> dictParams)
        {
            return null;
        }

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 02/02/2012
        public int FunPubInsertUpdateInvestmentMaster(FASerializationMode SerMode, byte[] byteObjFA_InvestmentMaster, string strMode, int intUpdateOption, string strGLCode, string strSLCode, out string strDocNo)
        {
            strDocNo = string.Empty;
            int intOutPutValue = 0;
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERDataTable dtInvestmentMST = new FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERDataTable();
            ObjInvestmentMasterDataTable = (FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_InvestmentMaster, SerMode, typeof(FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERDataTable));
            FA_BusEntity.FinancialAccounting.FunderInvestment.FA_INVESTMENT_MASTERRow ObjInvestmentMasterRow = ObjInvestmentMasterDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdate_InvestmentMaster);
                if (ObjInvestmentMasterRow.InvestMaster_ID != 0)
                    db.AddInParameter(command, "@InvestMaster_ID", DbType.Int32, ObjInvestmentMasterRow.InvestMaster_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjInvestmentMasterRow.Company_Id);
                db.AddInParameter(command, "@Mode", DbType.String, strMode);
                db.AddInParameter(command, "@Location_ID", DbType.Int32, ObjInvestmentMasterRow.Location_ID);
                db.AddInParameter(command, "@Investment_Type", DbType.Int32, ObjInvestmentMasterRow.Investment_Type);
                db.AddInParameter(command, "@Investment_Code", DbType.String, ObjInvestmentMasterRow.Investment_Code);
                db.AddInParameter(command, "@Investment_Desc", DbType.String, ObjInvestmentMasterRow.Investment_Desc);
                db.AddInParameter(command, "@Investment_AddDesc", DbType.String, ObjInvestmentMasterRow.Investment_AddDesc);
                db.AddInParameter(command, "@Unit_Base", DbType.Decimal, ObjInvestmentMasterRow.Unit_Base);
                db.AddInParameter(command, "@User_ID", DbType.Int32, ObjInvestmentMasterRow.Created_By);
                db.AddInParameter(command, "@Unit_FaceValue", DbType.Decimal, ObjInvestmentMasterRow.Unit_FaceValue);

                db.AddInParameter(command, "@Interest_Periodicity", DbType.Int32, ObjInvestmentMasterRow.Interest_Periodicity);
                db.AddInParameter(command, "@Rate_of_Interest", DbType.Decimal, ObjInvestmentMasterRow.Rate_of_Interest);
                db.AddInParameter(command, "@Nature_of_Interest", DbType.Int32, ObjInvestmentMasterRow.Nature_of_Interest);
                db.AddInParameter(command, "@Interest_Type", DbType.Int32, ObjInvestmentMasterRow.Interest_Type);
                db.AddInParameter(command, "@Interest_Frequency", DbType.Int32, ObjInvestmentMasterRow.Interest_Frequency);

                db.AddInParameter(command, "@Principal_Frequency", DbType.Int32, ObjInvestmentMasterRow.Principal_Frequency);
                db.AddInParameter(command, "@Remarks", DbType.String, ObjInvestmentMasterRow.Remarks);
                db.AddInParameter(command, "@Modified_Option", DbType.Int32, intUpdateOption);
                if (!string.IsNullOrEmpty(strGLCode))
                    db.AddInParameter(command, "@GL_Code", DbType.String, strGLCode);
                if (!string.IsNullOrEmpty(strSLCode))
                    db.AddInParameter(command, "@SL_Code", DbType.String, strSLCode);

                db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjInvestmentMasterRow.Is_Active);
                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);

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
                            strDocNo = Convert.ToString(command.Parameters["@OutDocNo"].Value);
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

        #endregion [Investment Master]
    }
}
