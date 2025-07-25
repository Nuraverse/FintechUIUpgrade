using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using S3GBusEntity.Collection;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.OracleClient;
using System.Data.Common;

namespace S3GDALayer.Collection
{
    namespace ClnDataMgtServices
    {
        public class ClsPubDraweeBankMaster
        {
            #region Intialize
            int intRowsAffected;
            S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DraweeBankMasterDataTable ObjDraweeBankMaster_DAL;


            //Code added for getting common connection string  from config file
            Database db;
            public ClsPubDraweeBankMaster()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            #endregion
            public int FunPubCreateDraweeBankMaster(SerializationMode SerMode, byte[] bytesObjS3G_ORG_COMPMASTERDataTable)
            {
                // strErrMsg = string.Empty;
                try
                {
                    ObjDraweeBankMaster_DAL = (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DraweeBankMasterDataTable)ClsPubSerialize.
                                           DeSerialize(bytesObjS3G_ORG_COMPMASTERDataTable, SerMode, typeof(S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DraweeBankMasterDataTable));

                    foreach (S3GBusEntity.Collection.ClnDataMgtServices.S3G_CLN_DraweeBankMasterRow ObjDraweeBankMasterRow in ObjDraweeBankMaster_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_CLN_INSDRAWEEMST");

                        db.AddInParameter(command, "@DraweeBankID", DbType.Int32, ObjDraweeBankMasterRow.DraweeBankID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjDraweeBankMasterRow.Company_ID);
                        db.AddInParameter(command, "@User_id", DbType.Int32, ObjDraweeBankMasterRow.User_id);
                        if (!ObjDraweeBankMasterRow.IsEffective_FromNull())
                        {
                            db.AddInParameter(command, "@Effective_From", DbType.DateTime, ObjDraweeBankMasterRow.Effective_From);
                        }
                        if (!ObjDraweeBankMasterRow.IsEffective_ToNull())
                        {
                            db.AddInParameter(command, "@Effective_To", DbType.DateTime, ObjDraweeBankMasterRow.Effective_To);
                        }

                        if (!ObjDraweeBankMasterRow.IsIs_ActiveNull())
                        {
                            db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjDraweeBankMasterRow.Is_Active);
                        }
                        if (!ObjDraweeBankMasterRow.IsBank_CodeNull())
                            db.AddInParameter(command, "@Bank_Code", DbType.String, ObjDraweeBankMasterRow.Bank_Code);

                        if (!ObjDraweeBankMasterRow.IsBank_NameNull())
                            db.AddInParameter(command, "@Bank_Name", DbType.String, ObjDraweeBankMasterRow.Bank_Name);



                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                            if (!string.IsNullOrEmpty(ObjDraweeBankMasterRow.XMLBranch))
                            {
                                param = new OracleParameter("@XMLBranch",
                                 OracleType.Clob, ObjDraweeBankMasterRow.XMLBranch.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, ObjDraweeBankMasterRow.XMLBranch);
                                command.Parameters.Add(param);
                            }
                            if (!string.IsNullOrEmpty(ObjDraweeBankMasterRow.XMLClearingDays))
                            {
                                param = new OracleParameter("@XMLClearingDays",
                                OracleType.Clob, ObjDraweeBankMasterRow.XMLClearingDays.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjDraweeBankMasterRow.XMLClearingDays);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLBranch", DbType.String, ObjDraweeBankMasterRow.XMLBranch);
                            db.AddInParameter(command, "@XMLClearingDays", DbType.String, ObjDraweeBankMasterRow.XMLClearingDays);
                        }
                        if (!ObjDraweeBankMasterRow.IsCreated_ByNull())
                        {
                            db.AddInParameter(command, "@Created_By", DbType.Int32, ObjDraweeBankMasterRow.Created_By);
                        }
                        if (!ObjDraweeBankMasterRow.IsModified_ByNull())
                        {
                            db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjDraweeBankMasterRow.Modified_By);
                        }

                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                if (command.Parameters["@ErrorCode"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                }
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();
                            }
                            catch (Exception ex)
                            {
                                intRowsAffected = 20;
                                trans.Rollback();
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);

                            }
                            conn.Close();
                        }
                    }
                }

                catch (Exception ex)
                {
                    intRowsAffected = 20;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
        }
    }
}


