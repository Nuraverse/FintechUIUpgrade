using S3GBusEntity;
using S3GDALayer.S3GAdminServices;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace S3GDALayer.LegalRepossession
{
    namespace LegalAndRepossessionMgtServices
    {
        public class ClsPubPaymentMatrix: ClsPubDalLegalRepossessionBase
        {
            int intRowsAffected = 0;
            S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Legal_Pay_MatrixDataTable ObjS3G_dtMatirxTable;
            public int FunPubCreateLegalMatrix(SerializationMode SerMode, byte[] bytesMatrix_Datatable, out string strDocNumber)
            {
                strDocNumber = string.Empty;
                try
                {
                    ObjS3G_dtMatirxTable = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Legal_Pay_MatrixDataTable)ClsPubSerialize.DeSerialize(bytesMatrix_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Legal_Pay_MatrixDataTable));
                    DbCommand command = db.GetStoredProcCommand("S3G_LGL_INSUPD_PAYMENT_MATRIX");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.Legal_Pay_MatrixRow objPayMatrixRow in ObjS3G_dtMatirxTable)
                    {
                        db.AddInParameter(command, "@Company_Id", DbType.Int32, objPayMatrixRow.Company_Id);
                        db.AddInParameter(command, "@Lawyer_Code", DbType.String, objPayMatrixRow.Lawyer_Code);
                        db.AddInParameter(command, "@Case_Charge_Type", DbType.Int32, objPayMatrixRow.Case_Charge_Type);
                        db.AddInParameter(command, "@Court_Type", DbType.Int32, objPayMatrixRow.Court_Type);
                        db.AddInParameter(command, "@Min_Amount", DbType.Int64, objPayMatrixRow.Min_Amount);
                        db.AddInParameter(command, "@Max_Amount", DbType.Int64, objPayMatrixRow.Max_Amount);
                        db.AddInParameter(command, "@Effective_Start_Date", DbType.String, objPayMatrixRow.Effetive_Start_Date);
                        db.AddInParameter(command, "@Effective_End_Date", DbType.String, objPayMatrixRow.Effetive_End_Date);
                        db.AddInParameter(command, "@IsActive", DbType.Int32, objPayMatrixRow.Active);
                        db.AddInParameter(command, "@Tran_Id", DbType.Int32, objPayMatrixRow.Tran_Id);
                        db.AddInParameter(command, "@SchemeType", DbType.String, objPayMatrixRow.Scheme_Type);

                        S3GDALDBType enumDBType = Common.ClsIniFileAccess.S3G_DBType;

                        if (enumDBType == S3GDALDBType.ORACLE)
                        {
                            OracleParameter param = new OracleParameter("@XML_Lawyer_Slab", OracleType.Clob,
                                   objPayMatrixRow.XML_Lawyer_Slab.Length, ParameterDirection.Input, true,
                                   0, 0, String.Empty, DataRowVersion.Default, objPayMatrixRow.XML_Lawyer_Slab);
                            command.Parameters.Add(param);

                            OracleParameter param1 = new OracleParameter("@XML_Matrix_Breakup", OracleType.Clob,
                                objPayMatrixRow.XML_Matrix_Breakup.Length, ParameterDirection.Input, true,
                              0, 0, String.Empty, DataRowVersion.Default, objPayMatrixRow.XML_Matrix_Breakup);
                            command.Parameters.Add(param1);

                            if (!objPayMatrixRow.IsXML_OTH_Matrix_BreakupNull())
                            {
                                OracleParameter param2 = new OracleParameter("@XML_OTH_Matrix_Breakup", OracleType.Clob,
                                       objPayMatrixRow.XML_OTH_Matrix_Breakup.Length, ParameterDirection.Input, true,
                                       0, 0, String.Empty, DataRowVersion.Default, objPayMatrixRow.XML_OTH_Matrix_Breakup);
                                command.Parameters.Add(param2);
                            }

                        }

                        else
                        {
                            db.AddInParameter(command, "@XML_Lawyer_Slab", DbType.String, objPayMatrixRow.XML_Lawyer_Slab);
                            db.AddInParameter(command, "@XML_Matrix_Breakup", DbType.String, objPayMatrixRow.XML_Matrix_Breakup);
                            db.AddInParameter(command, "@XML_OTH_Matrix_Breakup", DbType.String, objPayMatrixRow.XML_OTH_Matrix_Breakup);
                        }
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objPayMatrixRow.Created_By);
                        db.AddInParameter(command, "@Modified_By", DbType.Int32, objPayMatrixRow.Created_By);
                        db.AddOutParameter(command, "@OutDocNo", DbType.String, 100);
                        db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));

                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                strDocNumber = (string)command.Parameters["@OutDocNo"].Value;

                                if ((int)command.Parameters["@ErrorCode"].Value > 0)
                                    intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                                if (intRowsAffected == 0)
                                    trans.Commit();
                                else
                                    trans.Rollback();

                            }
                            catch (Exception ex)
                            {
                                intRowsAffected = 50;
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
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
                    intRowsAffected = 50; ;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
            }
        }
    }
}
