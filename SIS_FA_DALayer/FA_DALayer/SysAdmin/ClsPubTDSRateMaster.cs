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

namespace FA_DALayer.SysAdmin
{
    public class ClsPubTDSRateMaster
    {
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.master.FA_Sys_TDSRateMasterDataTable objTDSRateMst_List;
        Database db;

        public ClsPubTDSRateMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        public int FunPubCreateTDSRate(FASerializationMode SerMode, byte[] bytesobjTDSRateMst_List, out int int_tds_id, string strConnectionName)
        {
            try
            {
                int_tds_id = intErrorCode = 0;
                objTDSRateMst_List = (FA_BusEntity.SysAdmin.master.FA_Sys_TDSRateMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjTDSRateMst_List, SerMode, typeof(FA_BusEntity.SysAdmin.master.FA_Sys_TDSRateMasterDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.SysAdmin.master.FA_Sys_TDSRateMasterRow objTDSRateMasterRow in objTDSRateMst_List.Rows)
                {
                    //if (objTDSRateMasterRow.Option == 1)

                    command = db.GetStoredProcCommand("FA_INS_TDSRate");




                    if (objTDSRateMasterRow.TDS_Mst_ID != -1)
                        db.AddInParameter(command, "@TDS_Mst_ID", DbType.Int32, objTDSRateMasterRow.TDS_Mst_ID);
                    db.AddInParameter(command, "@Comapny_Id", DbType.Int32, objTDSRateMasterRow.company_id);
                    db.AddInParameter(command, "@Tax_section_code", DbType.String, objTDSRateMasterRow.Tax_section_code);

                    db.AddInParameter(command, "@Tax_section_desc", DbType.String, objTDSRateMasterRow.Tax_section_desc);
                    db.AddInParameter(command, "@GL_code", DbType.String, objTDSRateMasterRow.GL_code);
                    db.AddInParameter(command, "@sl_code", DbType.String, objTDSRateMasterRow.SL_code);
                    db.AddInParameter(command, "@startdate", DbType.DateTime, objTDSRateMasterRow.Start_Date);
                    db.AddInParameter(command, "@enddate", DbType.DateTime, objTDSRateMasterRow.End_Date);
                    db.AddInParameter(command, "@constitution_id", DbType.Int32, objTDSRateMasterRow.Constitution);
                    db.AddInParameter(command, "@grossup", DbType.Boolean, objTDSRateMasterRow.Grossup);
                    db.AddInParameter(command, "@tax", DbType.Decimal, objTDSRateMasterRow.Tax);
                    db.AddInParameter(command, "@eff_rate", DbType.Decimal, objTDSRateMasterRow.Effective_Rate);
                    db.AddInParameter(command, "@surcharge", DbType.Decimal, objTDSRateMasterRow.Surcharge);
                    db.AddInParameter(command, "@cess", DbType.Decimal, objTDSRateMasterRow.Cess);
                    db.AddInParameter(command, "@Active", DbType.Boolean, objTDSRateMasterRow.Is_Active);
                    //db.AddInParameter(command, "@Active", DbType.Int32, objTDSRateMasterRow.Active);
                    db.AddInParameter(command, "@xml_service", DbType.String, objTDSRateMasterRow.Xml_Service);
                    //db.AddInParameter(command, "@Trans_Date", DbType.DateTime, objTDSRateMasterRow.Trans_Date);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objTDSRateMasterRow.user_id);
                    db.AddInParameter(command, "@threshold_limit", DbType.Decimal, objTDSRateMasterRow.Threshold_Limt);

                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@OutTDSMaster_ID", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));


                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                int int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {
                                trans.Commit();
                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                if ((int)command.Parameters["@OutTDSMaster_ID"].Value > 0)
                                    int_tds_id = Convert.ToInt32(command.Parameters["@OutTDSMaster_ID"].Value);
                            }
                        }
                        catch (Exception ex)
                        {
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
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
                FAClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }

            return int_OutResult;

        }



    }
}
