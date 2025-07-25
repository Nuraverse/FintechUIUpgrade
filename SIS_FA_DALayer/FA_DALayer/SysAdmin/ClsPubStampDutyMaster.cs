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
    public class ClsPubStampDutyMaster
    {
        int intRowsAffected;
        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterDataTable objStampDutyMst_List;
        Database db;

        public ClsPubStampDutyMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        public int FunPubCreateStampDuty(FASerializationMode SerMode, byte[] bytesobjStampDutyMst_List, out int int_stamp_id, string strConnectionName)
        {
            try
            {
                int_stamp_id = intErrorCode = 0;
                objStampDutyMst_List = (FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterDataTable)FAClsPubSerialize.DeSerialize(bytesobjStampDutyMst_List, SerMode, typeof(FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.SysAdmin.master.FA_SYS_StampDutyMasterRow objStampDutyMasterRow in objStampDutyMst_List.Rows)
                {
                    //if (objStampDutyMasterRow.Option == 1)
                    if (objStampDutyMasterRow.StampMaster_ID == -1)
                        command = db.GetStoredProcCommand("FA_INS_STAMPDUTY");

                    else
                        command = db.GetStoredProcCommand("FA_Update_StampDuty");


                    if (objStampDutyMasterRow.StampMaster_ID != -1)
                        db.AddInParameter(command, "@Stamp_Mst_Id", DbType.Int32, objStampDutyMasterRow.StampMaster_ID);
                    db.AddInParameter(command, "@Company_ID", DbType.Int32, objStampDutyMasterRow.Company_ID);
                    db.AddInParameter(command, "@Location_ID", DbType.Int32, objStampDutyMasterRow.Location_ID);
                    db.AddInParameter(command, "@Fund_Type", DbType.String, objStampDutyMasterRow.Fund_Type);
                    if (!String.IsNullOrEmpty(objStampDutyMasterRow.GL_Account_Code))
                        db.AddInParameter(command, "@GL_Account_Code", DbType.String, objStampDutyMasterRow.GL_Account_Code);
                    if (!String.IsNullOrEmpty(objStampDutyMasterRow.SL_Account_Code))
                        db.AddInParameter(command, "@SL_Account_Code", DbType.String, objStampDutyMasterRow.SL_Account_Code);
                    //db.AddInParameter(command, "@Active", DbType.Int32, objStampDutyMasterRow.Active);
                    db.AddInParameter(command, "@Active", DbType.String, objStampDutyMasterRow.Active);
                    db.AddInParameter(command, "@Xml_Stamp", DbType.String, objStampDutyMasterRow.Xml_Stamp);
                    db.AddInParameter(command, "@Trans_Date", DbType.DateTime, objStampDutyMasterRow.Trans_Date);
                    db.AddInParameter(command, "@User_ID", DbType.Int32, objStampDutyMasterRow.User_ID);
                    db.AddInParameter(command, "@Option", DbType.Int32, objStampDutyMasterRow.Option);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.AddOutParameter(command, "@OutStampDutyMaster_ID", DbType.Int32, sizeof(Int32));
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
                                if ((int)command.Parameters["@OutStampDutyMaster_ID"].Value > 0)
                                    int_stamp_id = Convert.ToInt32(command.Parameters["@OutStampDutyMaster_ID"].Value);
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
