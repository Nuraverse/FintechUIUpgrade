using System;
using S3GDALayer.S3GAdminServices;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.Data.OracleClient;
using S3GBusEntity;
using System.Collections;
using System.IO;
using Entity_LoanAdmin = S3GBusEntity.LoanAdmin;

namespace S3GDALayer.LoanAdmin
{
    //namespace FunderInvestment
    //{
    public class Treasury_Bucket
    {
        int intErrorCode;
        int int_OutResult;
        Database db;
        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
        string strConnection = string.Empty;

        S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_Treasury_BucketDataTable objDealMaster_DTB;
        S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_ALMPARAMETERDataTable objalm_DTB;
        S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_ALMPARAMETERRow Objalmrow;
        S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_DEAL_MSTRow objDealMasterRow;

        public Treasury_Bucket(string strConnectionName)
        {
            db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            strConnection = strConnectionName;
        }


        public int FunPubInsertTerrorList(SerializationMode SerMode, byte[] bytesobjalm_DTB, string strConnectionName, out int intDeal_ID)
        {
            try
            {
                intDeal_ID = intErrorCode = 0;
                objalm_DTB = (S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_ALMPARAMETERDataTable)ClsPubSerialize.DeSerialize(bytesobjalm_DTB, SerMode, typeof(S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_ALMPARAMETERRow));
                DbCommand command = null;
                foreach (S3GBusEntity.LoanAdmin.FA_DEAL_MASTER.FA_ALMPARAMETERRow Objalmrow in objalm_DTB.Rows)
                {
                    command = db.GetStoredProcCommand("LAD_INSERT_TERROR_LST");
                    db.AddInParameter(command, "@File_Type", DbType.String, Objalmrow.Company_ID);
                    db.AddInParameter(command, "@Is_Delete", DbType.String, Objalmrow.User_id);

                    if (!Objalmrow.IsXML_INDIVIDUALNull())
                    {
                        OracleParameter param2 = new OracleParameter("@Xml_INDIVIDUAL", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_TITLENull())
                    {
                        OracleParameter param2 = new OracleParameter("@Xml_TITLE", OracleType.Clob,
                                    Objalmrow.XML_TITLE.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_TITLE);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_VALUENull())
                    {
                        OracleParameter param2 = new OracleParameter("@Xml_VALUE", OracleType.Clob,
                                    Objalmrow.XML_VALUE.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_VALUE);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_NATIONALITYNull())
                    {
                        OracleParameter param2 = new OracleParameter("@Xml_NATIONALITY", OracleType.Clob,
                                    Objalmrow.XML_NATIONALITY.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_NATIONALITY);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_LIST_TYPENull())
                    {
                        OracleParameter param2 = new OracleParameter("@Xml_LIST_TYPE", OracleType.Clob,
                                    Objalmrow.XML_LIST_TYPE.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_LIST_TYPE);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_LAST_DAY_UPDATEDNull())
                    {
                        OracleParameter param2 = new OracleParameter("@LAST_DAY_UPDATED", OracleType.Clob,
                                    Objalmrow.XML_LAST_DAY_UPDATED.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_LAST_DAY_UPDATED);
                        command.Parameters.Add(param2);
                    }
                    if (!Objalmrow.IsXML_INDIVIDUAL_ALIASNull())
                    {
                        OracleParameter param2 = new OracleParameter("@INDIVIDUAL_ALIAS", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL_ALIAS.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL_ALIAS);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_INDIVIDUAL_ADDRESSNull())
                    {
                        OracleParameter param2 = new OracleParameter("@INDIVIDUAL_ADDRESS", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL_ADDRESS.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL_ADDRESS);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_INDIVIDUAL_POBNull())
                    {
                        OracleParameter param2 = new OracleParameter("@INDIVIDUAL_DATE_OF_BIRTH", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL_POB.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL_POB);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_INDIVIDUAL_DOBNull())
                    {
                        OracleParameter param2 = new OracleParameter("@INDIVIDUAL_PLACE_OF_BIRTH", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL_DOB.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL_DOB);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_INDIVIDUAL_DOCNull())
                    {
                        OracleParameter param2 = new OracleParameter("@INDIVIDUAL_DOCUMENT", OracleType.Clob,
                                    Objalmrow.XML_INDIVIDUAL_DOC.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_INDIVIDUAL_DOC);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_ENTITIESNull())
                    {
                        OracleParameter param2 = new OracleParameter("@ENTITIES", OracleType.Clob,
                                    Objalmrow.XML_ENTITIES.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_ENTITIES);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_ENTITYNull())
                    {
                        OracleParameter param2 = new OracleParameter("@ENTITY", OracleType.Clob,
                                    Objalmrow.XML_ENTITY.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_ENTITY);
                        command.Parameters.Add(param2);
                    }

                    if (!Objalmrow.IsXML_ENTITY_ALIASNull())
                    {
                        OracleParameter param2 = new OracleParameter("@ENTITY_ALIAS", OracleType.Clob,
                                    Objalmrow.XML_ENTITY_ALIAS.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_ENTITY_ALIAS);
                        command.Parameters.Add(param2);
                    }
                    if (!Objalmrow.IsXML_ENTITY_ADDRESSNull())
                    {
                        OracleParameter param2 = new OracleParameter("@ENTITY_ADDRESS", OracleType.Clob,
                                    Objalmrow.XML_ENTITY_ADDRESS.Length, ParameterDirection.Input, true,
                                    0, 0, String.Empty, DataRowVersion.Default, Objalmrow.XML_ENTITY_ADDRESS);
                        command.Parameters.Add(param2);
                    }
                    db.AddOutParameter(command, "@ReturnOutput", DbType.Int32, int_OutResult);
                    db.AddOutParameter(command, "@ErrorValue", DbType.Int32, 0);
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command, ref trans);
                            if ((int)command.Parameters["@ErrorValue"].Value != 1261)
                            {
                                int_OutResult = (int)command.Parameters["@ErrorValue"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {
                                if ((int)command.Parameters["@ReturnOutput"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@ReturnOutput"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            ClsPubCommErrorLog.CustomErrorRoutine(ex, strConnection);
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                ClsPubCommErrorLogDal.CustomErrorRoutine(ex, strConnection);
                throw ex;
            }
            return int_OutResult;
        }

        public DataTable FunPubFillDropdownUpload(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLParameterKey, string strXMLParameterValue, out string strErrorMessage) // 2 b edited
        {
            strErrorMessage = string.Empty;
            DataSet ds = new DataSet();
            try
            {
                DbCommand command = db.GetStoredProcCommand(strProcName);
                S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;
                foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                {
                    if (!string.IsNullOrEmpty(ProcPair.Value) && ProcPair.Value.Contains("<Root>") && enumDBType == S3GDALDBType.ORACLE)
                    {
                        OracleParameter param = new OracleParameter(ProcPair.Key,
                          OracleType.Clob, ProcPair.Value.Length,
                          ParameterDirection.Input, true, 0, 0, String.Empty,
                          DataRowVersion.Default, string.IsNullOrEmpty(ProcPair.Value) ? " " : ProcPair.Value);
                        command.Parameters.Add(param);
                    }
                    else
                    {
                        db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                    }
                }
                if (strXMLParameterValue.Contains("<Root>") && enumDBType == S3GDALDBType.ORACLE && strXMLParameterKey != string.Empty)
                {
                    OracleParameter param = new OracleParameter(strXMLParameterKey,
                        OracleType.Clob, strXMLParameterValue.Length,
                        ParameterDirection.Input, true, 0, 0, String.Empty,
                        DataRowVersion.Default, string.IsNullOrEmpty(strXMLParameterValue) ? " " : strXMLParameterValue);
                    command.Parameters.Add(param);
                }
                //foreach (KeyValuePair<string, string> ProcPair in dctProcParams)
                //{                        
                //    db.AddInParameter(command, ProcPair.Key, DbType.String, ProcPair.Value);
                //}
                //if (strXMLParameterKey != string.Empty)
                //{
                //    //db.AddInParameter(command, strXMLParameterKey, DbType.String, strXMLParameterValue);
                //    OracleParameter param = new OracleParameter(strXMLParameterKey, OracleType.Clob,
                //                  strXMLParameterValue.Length, ParameterDirection.Input, true,
                //                  0, 0, String.Empty, DataRowVersion.Default, strXMLParameterValue);
                //    command.Parameters.Add(param);
                //}
                db.FunPubLoadDataSet(command, ds, "ListTable");
            }
            catch (Exception ex)
            {
                strErrorMessage = ex.ToString();
                //ClsPubCommErrorLogDal.CustomErrorRoutine(ex, "Terrorist File Upload");
                //throw ex;

                
            }
            return ds.Tables["ListTable"];

        }

    }
    //}
}
