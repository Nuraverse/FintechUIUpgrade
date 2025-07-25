#region PageHeader
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: SysAdmin
/// Screen Name			: Global Parameter setup
/// Created By			: Tamilselvan.S
/// Created Date		: 31-Jan-2012
/// Purpose	            : To Create/Update and to retrive Global Parameter setup

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
    public class ClsPubGlobalParameterSetup
    {
        #region "Initialization
        int intRowsAffected;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable ObjGlobalParameterDataTable;
        //Code added for getting common connection string  from config file
        Database db;
        public ClsPubGlobalParameterSetup(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        #endregion

        #region [Function's]
        /// <summary>
        /// created By Tamilselvan.s
        /// created date 01/02/2012
        /// For Insert and Update process for Global Parameter setup screen
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_DimensionMaster"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateDimensionMaster(FASerializationMode SerMode, byte[] byteObjFA_GPS, string strMode, string strConnectionName)
        {
            int intOutPutValue = 0;
            FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable ObjGPSDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable();
            ObjGPSDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable)FAClsPubSerialize.DeSerialize(byteObjFA_GPS, SerMode, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupDataTable));
            FA_BusEntity.SysAdmin.SystemAdmin.FA_GlobalParameter_SetupRow ObjGPSRow = ObjGPSDataTable[0];
            try
            {
                DbCommand command = db.GetStoredProcCommand(SPNames.InsertUpdate_GPS);
                if (ObjGPSRow.Global_Parameter_ID != 0)
                    db.AddInParameter(command, "@Global_Parameter_ID", DbType.Int32, ObjGPSRow.Global_Parameter_ID);
                db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjGPSRow.Company_ID);
                db.AddInParameter(command, "@Mode", DbType.String, strMode);
                db.AddInParameter(command, "@CurrencyMax_Prefix", DbType.Double, ObjGPSRow.Currency_Max_Prefix);
                db.AddInParameter(command, "@CurrencyMax_Suffex", DbType.Double, ObjGPSRow.Currency_Max_Suffex);
                db.AddInParameter(command, "@Date_Format", DbType.Int32, ObjGPSRow.Date_Format);
                db.AddInParameter(command, "@Denominator_Days", DbType.Int32, ObjGPSRow.Denominator_Days);
                db.AddInParameter(command, "@Financial_Year", DbType.String, ObjGPSRow.Financial_Year);
                db.AddInParameter(command, "@Year_StartMonth", DbType.String, ObjGPSRow.Year_StartMonth);
                db.AddInParameter(command, "@Year_EndMonth", DbType.String, ObjGPSRow.Year_EndMonth);

                db.AddInParameter(command, "@Budget_Applicable", DbType.Boolean, ObjGPSRow.Budget_Applicable);
                db.AddInParameter(command, "@Dimension_Applicable", DbType.Boolean, ObjGPSRow.Dimension_Applicable);
                db.AddInParameter(command, "@Dim2_Linkwith_Dim1", DbType.Boolean, ObjGPSRow.Dim2_Linkwith_Dim1);

                db.AddInParameter(command, "@Multi_Company", DbType.Boolean, ObjGPSRow.Multi_Company);
                db.AddInParameter(command, "@Currency_Level_ID", DbType.Int32, ObjGPSRow.Currency_Level_ID);
                db.AddInParameter(command, "@Currency_Level", DbType.String, ObjGPSRow.Currency_Level);
                db.AddInParameter(command, "@Instr_Valied_Days", DbType.Int32, ObjGPSRow.Instrument_Valied_Days);
                db.AddInParameter(command, "@NoOfProjectedYears", DbType.Int32, ObjGPSRow.NoOfProjectedYears);

                db.AddInParameter(command, "@XML_AuthorizeProgram", DbType.String, ObjGPSRow.XML_ProgramRoleAuthorization);
                db.AddInParameter(command, "@Created_By", DbType.Int32, ObjGPSRow.Created_By);
                db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjGPSRow.Modified_By);
                //Changed by Gomathi start
                db.AddInParameter(command, "@GL_Code", DbType.String, ObjGPSRow.GL_Code);
                db.AddInParameter(command, "@GL_Desc", DbType.String, ObjGPSRow.GL_Desc);
                //Changed by Gomathi end to insert P and L Account Code in GPS

                //Changed by Gomathi start
                db.AddInParameter(command, "@Days", DbType.Int32, ObjGPSRow.Days);
                db.AddInParameter(command, "@Disable_Access_Wrong_pwd", DbType.Int32, ObjGPSRow.Disable_Access_Wrong_pwd);
                db.AddInParameter(command, "@Min_pwd_length", DbType.Int32, ObjGPSRow.Min_pwd_length);
                db.AddInParameter(command, "@Pwd_Recycle_Itr", DbType.Int32, ObjGPSRow.Pwd_Recycle_Itr);

                db.AddInParameter(command, "@Force_Pwd_Change", DbType.Boolean, ObjGPSRow.Force_Pwd_Change);
                db.AddInParameter(command, "@Enforce_inital_pwd", DbType.Boolean, ObjGPSRow.Enforce_inital_pwd);
                db.AddInParameter(command, "@UpperCase_Char", DbType.Boolean, ObjGPSRow.UpperCase_Char);
                db.AddInParameter(command, "@Numeral_Char", DbType.Boolean, ObjGPSRow.Numeral_Char);
                db.AddInParameter(command, "@Spec_Char", DbType.Boolean, ObjGPSRow.Spec_Char);
                db.AddInParameter(command, "@ibs_liability", DbType.String, ObjGPSRow.Ibs_liability);
                db.AddInParameter(command, "@ibs_Asset", DbType.String, ObjGPSRow.Ibs_Asset);

                //Changed by Gomathi end to insert Password Policy in GPS

                db.AddInParameter(command, "@Dep_Method", DbType.String, ObjGPSRow.Dep_Method);
                if (!ObjGPSRow.IsLeast_Asset_ValueNull())
                    db.AddInParameter(command, "@Least_Asset_Value", DbType.Decimal, ObjGPSRow.Least_Asset_Value);

                db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, intOutPutValue);
                db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);

                using (DbConnection conn = db.CreateConnection())
                {
                    conn.Open();
                    DbTransaction trans = conn.BeginTransaction();
                    try
                    {
                        //Modified By Chandrasekar K On 20-09-2012
                        db.FunPubExecuteNonQuery(command, ref trans);
                        //db.ExecuteNonQuery(command, trans);
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
