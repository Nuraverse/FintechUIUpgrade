using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using S3GBusEntity;
using Entity_Origination = S3GBusEntity.Origination;
using System.Data;
using S3GDALayer.S3GAdminServices;
using Microsoft.Practices.EnterpriseLibrary.Data;


namespace S3GDALayer.Origination
{
    namespace CashflowMgtServices
    {
        public class ClsPubNegativeListCustomers
        {
            int intErrorCode;
            Entity_Origination.CashflowMgtServices.S3G_ORG_NegCustListDataTable ObjNegCustListDataTable_DAL = null;
            Entity_Origination.CashflowMgtServices.S3G_ORG_NegCustListRow ObjNegCustListRow = null;

            Entity_Origination.OrgMasterMgtServices.S3G_ORG_NEGATIVELISTDataTable objNegativeListDataTable_DAL = null;
            Entity_Origination.OrgMasterMgtServices.S3G_ORG_NEGATIVELISTRow objNegativeListRow = null;

            Database db;
            public ClsPubNegativeListCustomers()
            {
                db = S3GDALayer.Common.ClsIniFileAccess.FunPubGetDatabase();
            }

            public int FunPubCreateCashFlowRulesInt(SerializationMode SerMode, byte[] bytesObjROIRulesDataTable)
            {
                try
                {
                    //Database db = DatabaseFactory.CreateDatabase("S3GconnectionString");
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_NegativeListCustomers");

                    ObjNegCustListDataTable_DAL = (Entity_Origination.CashflowMgtServices.S3G_ORG_NegCustListDataTable)ClsPubSerialize.DeSerialize(bytesObjROIRulesDataTable, SerMode, typeof(S3GBusEntity.Origination.CashflowMgtServices.S3G_ORG_NegCustListDataTable));
                    ObjNegCustListRow = ObjNegCustListDataTable_DAL.Rows[0] as Entity_Origination.CashflowMgtServices.S3G_ORG_NegCustListRow;


                    db.AddInParameter(command, "@Company_ID", DbType.Int64, ObjNegCustListRow.Company_id);
                    db.AddInParameter(command, "@UserId", DbType.Int64, ObjNegCustListRow.User_Id);
                    db.AddInParameter(command, "@strCustomerList", DbType.String, ObjNegCustListRow.StrCustomerList);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intErrorCode = (int)command.Parameters["@ErrorCode"].Value;

                }
                catch (Exception ex)
                {
                    //intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intErrorCode;
            }

            #region Insert Update Negative List

            public int FunPubCreateModifyNegativeList(SerializationMode SerMode, byte[] bytesObjNegativeListDataTable)
            {
                try
                {
                    DbCommand command = db.GetStoredProcCommand("S3G_ORG_INS_UPD_HOTLIST_DET");

                    objNegativeListDataTable_DAL = (Entity_Origination.OrgMasterMgtServices.S3G_ORG_NEGATIVELISTDataTable)ClsPubSerialize.DeSerialize(bytesObjNegativeListDataTable, SerMode, typeof(S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_NEGATIVELISTDataTable));
                    objNegativeListRow = objNegativeListDataTable_DAL.Rows[0] as Entity_Origination.OrgMasterMgtServices.S3G_ORG_NEGATIVELISTRow;


                    db.AddInParameter(command, "@Company_ID", DbType.Int64, objNegativeListRow.Company_ID);
                    db.AddInParameter(command, "@NegativeList_ID", DbType.Int64, objNegativeListRow.NegativeList_ID);
                    db.AddInParameter(command, "@Nationality", DbType.Int64, objNegativeListRow.Nationality);
                    db.AddInParameter(command, "@Constitution_ID", DbType.Int64, objNegativeListRow.Constitution_ID);
                    db.AddInParameter(command, "@CR_Number", DbType.String, objNegativeListRow.CR_Number);
                    db.AddInParameter(command, "@Negativelist_Type", DbType.Int64, objNegativeListRow.NegativeList_Type);
                    db.AddInParameter(command, "@Customer_ID", DbType.Int64, objNegativeListRow.Customer_ID);
                    db.AddInParameter(command, "@Prospect_Name", DbType.String, objNegativeListRow.Prospect_Name);
                    db.AddInParameter(command, "@Prospect_Address", DbType.String, objNegativeListRow.Prospect_Address);
                    db.AddInParameter(command, "@Prospect_Mobile", DbType.String, objNegativeListRow.Prospect_Mobile);
                    db.AddInParameter(command, "@NegativeList_Reason", DbType.Int64, objNegativeListRow.NegativeList_Reason);
                    db.AddInParameter(command, "@NegativeList_Remarks", DbType.String, objNegativeListRow.NegativeList_Remarks);
                    db.AddInParameter(command, "@Codified_Remarks", DbType.String, objNegativeListRow.Codified_Remarks);
                    db.AddInParameter(command, "@Application_ID", DbType.Int64, objNegativeListRow.Application_ID);

              
                    db.AddInParameter(command, "@Proposal_No", DbType.String, objNegativeListRow.Proposal_No);

                    db.AddInParameter(command, "@Decline_Date", DbType.DateTime, objNegativeListRow.Decline_Date);
                    db.AddInParameter(command, "@Is_Active", DbType.Int32, objNegativeListRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int64, objNegativeListRow.Created_By);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intErrorCode = (int)command.Parameters["@ErrorCode"].Value;
                }
                catch (Exception ex)
                {
                    intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex);
                }
                return intErrorCode;
            }


            #endregion

        }
    }
}
