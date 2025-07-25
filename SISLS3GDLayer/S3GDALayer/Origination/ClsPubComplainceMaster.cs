using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ORG = S3GBusEntity.Origination;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using S3GDALayer.S3GAdminServices;
using System.Data;
using System.Data.OracleClient;
using System.Data.Common;

namespace S3GDALayer.Origination
{
    namespace OrgMasterMgtServices
    {

        public class ClsPubComplainceMaster
        {
            #region Intialize
           
             int intRowsAffected;
             ORG.OrgMasterMgtServices.S3GOrgComplainceMaster_AddDataTable ObjComplainceMaster_DAL; 
            
            //Code added for getting common connection string  from config file
             Database db;
            public ClsPubComplainceMaster()
             {
                 db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
             }
            
             #endregion

            public int FunPubCreateComplainceMaster(SerializationMode SerMode, byte[] bytesObjS3G_ORG_COMPMASTERDataTable)
            {
               // strErrMsg = string.Empty;
                try
                {
                    ObjComplainceMaster_DAL = (ORG.OrgMasterMgtServices.S3GOrgComplainceMaster_AddDataTable)ClsPubSerialize.
                                           DeSerialize(bytesObjS3G_ORG_COMPMASTERDataTable, SerMode, typeof(ORG.OrgMasterMgtServices.S3GOrgComplainceMaster_AddDataTable));

                    foreach (ORG.OrgMasterMgtServices.S3GOrgComplainceMaster_AddRow ObjComplainceMasterRow in ObjComplainceMaster_DAL.Rows)
                    {
                        DbCommand command = db.GetStoredProcCommand("S3G_ORG_INS_COMPMAST");

                        db.AddInParameter(command, "@COMPMAST_ID", DbType.Int32, ObjComplainceMasterRow.COMPMAST_ID);
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, ObjComplainceMasterRow.Company_ID);
                        db.AddInParameter(command, "@User_ID", DbType.Int32, ObjComplainceMasterRow.User_ID);
                        if (ObjComplainceMasterRow.EFFECTIVEFROM_DATE!=null)
                        {
                            db.AddInParameter(command, "@EFFECTIVEFROM_DATE", DbType.DateTime, ObjComplainceMasterRow.EFFECTIVEFROM_DATE);
                        }
                        if (ObjComplainceMasterRow.EFFECTIVETO_DATE!=null)
                        {
                            db.AddInParameter(command, "@EFFECTIVETO_DATE", DbType.DateTime, ObjComplainceMasterRow.EFFECTIVETO_DATE);
                        }
                           db.AddInParameter(command, "@NID", DbType.Boolean, ObjComplainceMasterRow.NID);
                            db.AddInParameter(command, "@Labourcard", DbType.Boolean, ObjComplainceMasterRow.Labourcard);
                            db.AddInParameter(command, "@Name", DbType.Boolean, ObjComplainceMasterRow.Name);
                            db.AddInParameter(command, "@DOB", DbType.Boolean, ObjComplainceMasterRow.DOB);
                            db.AddInParameter(command, "@CRNO", DbType.Boolean, ObjComplainceMasterRow.CRNO);
                            db.AddInParameter(command, "@Passport", DbType.Boolean, ObjComplainceMasterRow.Passport);
                            db.AddInParameter(command, "@ThirdParty_Check", DbType.Boolean, ObjComplainceMasterRow.ThirdParty_Check);
                            db.AddInParameter(command, "@NRID", DbType.Boolean, ObjComplainceMasterRow.NRID);
                            if (ObjComplainceMasterRow.COMP_Max_Age_Borrower!=null)
                            {
                                db.AddInParameter(command, "@COMP_Max_Age_Borrower", DbType.Int32, ObjComplainceMasterRow.COMP_Max_Age_Borrower);
                            }
                            if (ObjComplainceMasterRow.SMESmall_Min_Employee_Size != null)
                            {
                                db.AddInParameter(command, "@SMESmallMin_Employee_Size ", DbType.Int32, ObjComplainceMasterRow.SMESmall_Min_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Min_Employee_Size != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMin_Employee_Size ", DbType.Int32, ObjComplainceMasterRow.SMEMedium_Min_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Min_Employee_Size != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMin_Employee_Size ", DbType.Int32, ObjComplainceMasterRow.SMEMicro_Min_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SME_SmallMax_Employee_Size!=null)
                            {
                                db.AddInParameter(command, "@SMESmallMax_Employee_Size", DbType.Int32, ObjComplainceMasterRow.SME_SmallMax_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Max_Employee_Size != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMax_Employee_Size", DbType.Int32, ObjComplainceMasterRow.SMEMedium_Max_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Max_Employee_Size != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMax_Employee_Size", DbType.Int32, ObjComplainceMasterRow.SMEMicro_Max_Employee_Size);
                            }
                            if (ObjComplainceMasterRow.SMESmall_Min_Turnover!=null)
                            {
                                db.AddInParameter(command, "@SMESMallMin_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMESmall_Min_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Min_Turnover != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMin_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMEMedium_Min_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Min_Turnover != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMin_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMEMicro_Min_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMESmall_Max_Turnover!=null)
                            {
                                db.AddInParameter(command, "@SMESmallMax_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMESmall_Max_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Max_Turnover != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMax_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMEMedium_Max_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Max_Turnover != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMax_Turnover", DbType.Decimal, ObjComplainceMasterRow.SMEMicro_Max_Turnover);
                            }
                            if (ObjComplainceMasterRow.SMESmall_Min_Asset_value!=null)
                            {
                                db.AddInParameter(command, "@SMESmallMin_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMESmall_Min_Asset_value);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Min_Asset_value != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMin_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMEMedium_Min_Asset_value);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Min_Asset_value != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMin_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMEMicro_Min_Asset_value);
                            }
                            if ( ObjComplainceMasterRow.SMESmall_Max_Asset_value!=null)
                            {
                                db.AddInParameter(command, "@SMESmallMax_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMESmall_Max_Asset_value);
                            }
                            if (ObjComplainceMasterRow.SMEMedium_Max_Asset_value != null)
                            {
                                db.AddInParameter(command, "@SMEMediumMax_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMEMedium_Max_Asset_value);
                            }
                            if (ObjComplainceMasterRow.SMEMicro_Max_Asset_value != null)
                            {
                                db.AddInParameter(command, "@SMEMicroMax_Asset_value", DbType.Decimal, ObjComplainceMasterRow.SMEMicro_Max_Asset_value);
                            }
                            if (ObjComplainceMasterRow.Complaince_Type_ID > 0)
                            {
                                db.AddInParameter(command, "@Complaince_Type", DbType.String, ObjComplainceMasterRow.Complaince_Type_ID);
                            }
                            if (ObjComplainceMasterRow.Is_Active!=null)
                            {
                                db.AddInParameter(command, "@Is_Active", DbType.Boolean, ObjComplainceMasterRow.Is_Active);
                            }
                           
                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param;
                              if (!string.IsNullOrEmpty(ObjComplainceMasterRow.XMLCOLLECTION))
                               {
                                param = new OracleParameter("@XMLCOLLECTION",
                                 OracleType.Clob, ObjComplainceMasterRow.XMLCOLLECTION.Length,
                                 ParameterDirection.Input, true, 0, 0, String.Empty,
                                 DataRowVersion.Default, ObjComplainceMasterRow.XMLCOLLECTION);
                                command.Parameters.Add(param);
                            }
                            if (!string.IsNullOrEmpty(ObjComplainceMasterRow.XMLCLOSURE))
                            {
                                param = new OracleParameter("@XMLCLOSURE",
                                OracleType.Clob, ObjComplainceMasterRow.XMLCLOSURE.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjComplainceMasterRow.XMLCLOSURE);
                                command.Parameters.Add(param);
                            }
                            if (!string.IsNullOrEmpty(ObjComplainceMasterRow.XMLAPPROVERCOLLECTION))
                            {
                                param = new OracleParameter("@XMLAPPROVERCOLLECTION",
                                OracleType.Clob, ObjComplainceMasterRow.XMLAPPROVERCOLLECTION.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjComplainceMasterRow.XMLAPPROVERCOLLECTION);
                                command.Parameters.Add(param);
                            }
                            if (!string.IsNullOrEmpty(ObjComplainceMasterRow.XMLAPPROVERCLOSURE))
                            {
                                param = new OracleParameter("@XMLAPPROVERCLOSURE",
                                OracleType.Clob, ObjComplainceMasterRow.XMLAPPROVERCLOSURE.Length,
                                ParameterDirection.Input, true, 0, 0, String.Empty,
                                DataRowVersion.Default, ObjComplainceMasterRow.XMLAPPROVERCLOSURE);
                                command.Parameters.Add(param);
                            }
                        }
                        else
                        {
                            db.AddInParameter(command, "@XMLCOLLECTION", DbType.String, ObjComplainceMasterRow.XMLCOLLECTION);
                            db.AddInParameter(command, "@XMLCLOSURE", DbType.String, ObjComplainceMasterRow.XMLCLOSURE);
                            db.AddInParameter(command, "@XMLAPPROVERCOLLECTION", DbType.String, ObjComplainceMasterRow.XMLAPPROVERCOLLECTION);
                            db.AddInParameter(command, "@XMLAPPROVERCLOSURE", DbType.String, ObjComplainceMasterRow.XMLAPPROVERCLOSURE);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, ObjComplainceMasterRow.CREATED_BY);

                        if (!ObjComplainceMasterRow.IsModified_ByNull())
                        {
                            db.AddInParameter(command, "@Modified_By", DbType.Int32, ObjComplainceMasterRow.Modified_By);
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