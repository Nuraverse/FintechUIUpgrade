using FA_BusEntity;
using FA_DALayer.FA_SysAdmin;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.OracleClient;
using System.Linq;
using System.Text;

namespace FA_DALayer.Budget
{
    public class ClsPubBudgetItemMaster
    {
        int intRowsAffected;
        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable objBudgetLineItemDetails_DAL;
        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTDataTable objBudgetSubLineItemDetails_DAL;
        FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERDataTable objBudgetFormulaMaster_DAL;
        string strConnection = string.Empty;
        FADALDBType enumDBType = Common.ClsIniFileAccess.FA_DBType;
        OracleParameter param;

        Database db;
        public ClsPubBudgetItemMaster(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }

        public int FunPubCreateLineItem(FASerializationMode SerMode, byte[] bytesObjFA_BUD_LineItemMasterDataTable)
        {
            try
            {
                objBudgetLineItemDetails_DAL = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_BUD_LineItemMasterDataTable, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable));
                DbCommand command = db.GetStoredProcCommand("BUD_INS_LINEITEM");
                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTRow ObjLineItemMasterRow in objBudgetLineItemDetails_DAL.Rows)
                {
                    db.AddInParameter(command, "@CompanyId", DbType.Int32, ObjLineItemMasterRow.COMPANY_ID);
                    db.AddInParameter(command, "@LineItmeMasterId", DbType.Int32, ObjLineItemMasterRow.LINEITEMMST_ID);
                    db.AddInParameter(command, "@UserId", DbType.Int32, ObjLineItemMasterRow.USER_ID);
                    db.AddInParameter(command, "@ItemHeaderId", DbType.Int32, ObjLineItemMasterRow.ITEM_HDR_ID);
                    db.AddInParameter(command, "@AccNatureId", DbType.Int32, ObjLineItemMasterRow.ACCOUNT_NATURE_ID);
                    db.AddInParameter(command, "@IsActive", DbType.Int32, ObjLineItemMasterRow.IS_ACTIVE);

                    if (enumDBType == FADALDBType.ORACLE)
                    {


                        param = new OracleParameter("@Xml_LineItemDTLS", OracleType.Clob,
                                 ObjLineItemMasterRow.Xml_LineItemDTLS.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjLineItemMasterRow.Xml_LineItemDTLS);
                        command.Parameters.Add(param);
                    }
                    else
                        db.AddInParameter(command, "@Xml_LineItemDTLS", DbType.String, ObjLineItemMasterRow.Xml_LineItemDTLS);

                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;
                }
            }
            catch (Exception exp)
            {
                intRowsAffected = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            }
            return intRowsAffected;
        }

        public int FunPubCreateSubLineItem(FASerializationMode SerMode, byte[] bytesObjFA_BUD_SubLineItemMasterDataTable)
        {
            try
            {
                objBudgetSubLineItemDetails_DAL = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_BUD_SubLineItemMasterDataTable, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_LINEITEM_MSTDataTable));
                DbCommand command = db.GetStoredProcCommand("BUD_INS_SUBLINEITEM");
                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_SUBLINEITEM_MSTRow ObjSubLineItemMasterRow in objBudgetSubLineItemDetails_DAL.Rows)
                {
                    db.AddInParameter(command, "@CompanyId", DbType.Int32, ObjSubLineItemMasterRow.COMPANY_ID);
                    db.AddInParameter(command, "@SubLineItmeMasterId", DbType.Int32, ObjSubLineItemMasterRow.SUBLINEITEMMST_ID);
                    db.AddInParameter(command, "@UserId", DbType.Int32, ObjSubLineItemMasterRow.USER_ID);
                    db.AddInParameter(command, "@ItemHeaderId", DbType.Int32, ObjSubLineItemMasterRow.ITEM_HDR_ID);
                    db.AddInParameter(command, "@AccNatureId", DbType.Int32, ObjSubLineItemMasterRow.ACCOUNT_NATURE_ID);
                    db.AddInParameter(command, "@LineItemId", DbType.Int32, ObjSubLineItemMasterRow.LINE_ITEM_ID);
                    db.AddInParameter(command, "@SubTotal", DbType.Int32, ObjSubLineItemMasterRow.SUBTOTAL);
                    db.AddInParameter(command, "@SubTotalName", DbType.String, ObjSubLineItemMasterRow.SUBTOTALNAME);
                    db.AddInParameter(command, "@IsActive", DbType.Int32, ObjSubLineItemMasterRow.IS_ACTIVE);

                    if (enumDBType == FADALDBType.ORACLE)
                    {


                        param = new OracleParameter("@Xml_SubLineItemDTLS", OracleType.Clob,
                                 ObjSubLineItemMasterRow.Xml_SubLineItemDTLS.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjSubLineItemMasterRow.Xml_SubLineItemDTLS);
                        command.Parameters.Add(param);
                    }
                    else
                        db.AddInParameter(command, "@Xml_SubLineItemDTLS", DbType.String, ObjSubLineItemMasterRow.Xml_SubLineItemDTLS);

                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                }
            }
            catch (Exception exp)




            {
                intRowsAffected = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            }
            return intRowsAffected;
        }
        public int FunPubCreateFormulaMaster(FASerializationMode SerMode, byte[] bytesObjFA_BUD_FormulaMasterDataTable)
        {
            try
            {
                objBudgetFormulaMaster_DAL = (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERDataTable)FAClsPubSerialize.DeSerialize(bytesObjFA_BUD_FormulaMasterDataTable, SerMode, typeof(FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERDataTable));
                DbCommand command = db.GetStoredProcCommand("BUD_INS_FORMULAMASTER");
                foreach (FA_BusEntity.Budget.BudgetMasterDetails.FA_BUD_FORMULAMASTERRow ObjFormulaMasterRow in objBudgetFormulaMaster_DAL.Rows)
                {
                    db.AddInParameter(command, "@CompanyId", DbType.Int32, ObjFormulaMasterRow.COMPANY_ID);
                    db.AddInParameter(command, "@FormulaTypeId", DbType.Int32, ObjFormulaMasterRow.FORMULATYPE_ID);
                    db.AddInParameter(command, "@UserId", DbType.Int32, ObjFormulaMasterRow.USER_ID);
                    db.AddInParameter(command, "@SublineItemId", DbType.Int32, ObjFormulaMasterRow.SUBLINEITEM_ID);
                    db.AddInParameter(command, "@IsActive", DbType.Int32, ObjFormulaMasterRow.IS_ACTIVE);
                    db.AddInParameter(command, "@Formula", DbType.String, ObjFormulaMasterRow.FORMULA);
                    db.AddInParameter(command, "@Formula_val", DbType.String, ObjFormulaMasterRow.FORMULA_VAL);
                    db.AddInParameter(command, "@ItemHeader_Id", DbType.String, ObjFormulaMasterRow.ITEMHEADER_ID);
                    db.AddInParameter(command, "@Accountnature_Id", DbType.String, ObjFormulaMasterRow.ACCOUNTNATURE_ID);
                    db.AddInParameter(command, "@FormulaMaster_Id", DbType.Int32, ObjFormulaMasterRow.FORMULAMASTER_MST_ID);

                    if (enumDBType == FADALDBType.ORACLE)
                    {


                        param = new OracleParameter("@XML_FORMULADTLS", OracleType.Clob,
                                 ObjFormulaMasterRow.XML_FORMULADTLS.Length, ParameterDirection.Input, true,
                                 0, 0, String.Empty, DataRowVersion.Default, ObjFormulaMasterRow.XML_FORMULADTLS);
                        command.Parameters.Add(param);

                        param = new OracleParameter("@XML_Activity", OracleType.Clob,
                               ObjFormulaMasterRow.XML_Activity.Length, ParameterDirection.Input, true,
                               0, 0, String.Empty, DataRowVersion.Default, ObjFormulaMasterRow.XML_Activity);
                        command.Parameters.Add(param);

                    }
                    else
                    { 
                    db.AddInParameter(command, "@XML_FORMULADTLS", DbType.String, ObjFormulaMasterRow.XML_FORMULADTLS);
                    db.AddInParameter(command, "@XML_Activity", DbType.String, ObjFormulaMasterRow.XML_Activity);
                    }


                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int64));
                    db.FunPubExecuteNonQuery(command);
                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intRowsAffected = (int)command.Parameters["@ErrorCode"].Value;

                }
            }
            catch (Exception exp)
            {
                intRowsAffected = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            }
            return intRowsAffected;
        }

    }
}
