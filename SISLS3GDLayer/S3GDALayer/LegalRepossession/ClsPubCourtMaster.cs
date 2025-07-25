#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Legal Repossession
/// Screen Name			: Court Master DAL Class
/// Created By			: Sangeetha R
/// Created Date		: 10-May-2010
/// Purpose	            : 
/// Last Updated By		: Sangeetha R
/// Last Updated Date   : 27-Jun-2014
/// Reason              : Legal Repossession Court Master Developement
/// <Program Summary>
#endregion

#region Namespaces
using System;
using S3GDALayer.S3GAdminServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ORG = S3GBusEntity.Origination;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml.Serialization;
using S3GBusEntity;
using System.Data;
#endregion

namespace S3GDALayer.LegalRepossession
{
    namespace LegalAndRepossessionMgtServices
    {
        public class ClsPubCourtMaster : ClsPubDalLegalRepossessionBase
        {
            int intRowsAffected = 0;
            S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_COURTMASTERDataTable ObjS3G_Court;
            public int FunPubCreateCourtMaster(SerializationMode SerMode, byte[] bytesCourt_Datatable, out string strErrMsg)
            {
                strErrMsg = string.Empty;
                try
                {
                    ObjS3G_Court = (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_COURTMASTERDataTable)ClsPubSerialize.DeSerialize(bytesCourt_Datatable, SerMode, typeof(S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_COURTMASTERDataTable));
                    DbCommand command = db.GetStoredProcCommand("LR_INS_COURTDET");
                    foreach (S3GBusEntity.LegalRepossession.LegalRepossessionMgtServices.S3G_LR_COURTMASTERRow ObjCourtRow in ObjS3G_Court)
                    {
                        db.AddInParameter(command, "@COMPANY_ID", DbType.Int32, ObjCourtRow.COMPANY_ID);
                        if(!ObjCourtRow.IsCOURT_CODENull())
                             db.AddInParameter(command, "@COURT_CODE", DbType.String, ObjCourtRow.COURT_CODE);
                        if(!ObjCourtRow.IsCOURT_IDNull())
                             db.AddInParameter(command, "@COURT_ID", DbType.Int32, ObjCourtRow.COURT_ID);
                        if(!ObjCourtRow.IsCOURT_LEVELNull())
                             db.AddInParameter(command, "@COURT_LEVEL", DbType.Int32, ObjCourtRow.COURT_LEVEL);
                        if(!ObjCourtRow.IsCOURT_LOCATIONNull())
                             db.AddInParameter(command, "@COURT_LOCATION", DbType.String, ObjCourtRow.COURT_LOCATION);
                        if(!ObjCourtRow.IsCOURT_TYPENull())
                             db.AddInParameter(command, "@COURT_TYPE", DbType.Int32, ObjCourtRow.COURT_TYPE);
                        if(!ObjCourtRow.IsCREATED_BYNull())
                             db.AddInParameter(command, "@CREATED_BY", DbType.Int32, ObjCourtRow.CREATED_BY);
                        if(!ObjCourtRow.IsCREATED_ONNull())
                             db.AddInParameter(command, "@CREATED_ON", DbType.DateTime, ObjCourtRow.CREATED_ON);
                        if(!ObjCourtRow.IsMODIFIED_BYNull())
                             db.AddInParameter(command, "@MODIFIED_BY", DbType.Int32, ObjCourtRow.MODIFIED_BY);
                        if(!ObjCourtRow.IsMODIFIED_ONNull())
                             db.AddInParameter(command, "@MODIFIED_ON", DbType.DateTime, ObjCourtRow.MODIFIED_ON);
                        db.AddOutParameter(command, "@ERRORCODE", DbType.Int32, sizeof(Int64));
                    }
                        using (DbConnection conn = db.CreateConnection())
                        {
                            conn.Open();
                            DbTransaction trans = conn.BeginTransaction();
                            try
                            {
                                db.FunPubExecuteNonQuery(command, ref trans);
                                intRowsAffected = (int)command.Parameters["@ERRORCODE"].Value;
                                if ((int)command.Parameters["@ERRORCODE"].Value > 1)
                                {
                                    throw new Exception("Error in Case Court Master " + intRowsAffected.ToString());
                                }
                                else
                                {
                                    strErrMsg = Convert.ToString(command.Parameters["@ERRORCODE"].Value);
                                    trans.Commit();
                                }
                            }
                            catch (Exception ex)
                            {
                                if (command.Parameters["@ERRORCODE"].Value != null)
                                {
                                    intRowsAffected = (int)command.Parameters["@ERRORCODE"].Value;
                                }
                                else if (intRowsAffected == 0)
                                {
                                    intRowsAffected = 50;
                                }
                                ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                                trans.Rollback();

                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }
                catch (Exception ex)
                {
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intRowsAffected;
                }
                
            }
        }
    }
