using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using FA_BusEntity;
using Entity_FinancialAccounting = FA_BusEntity.FinancialAccounting;
using System.Data;
//using FA_DALayer.FinancialAccounting;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_DALayer.FA_SysAdmin;

namespace FA_DALayer.FinancialAccounting
{
    namespace FinancialAccounting
    {

        public class ClsPubConsortiumMaster
        {
            int intErrorCode;
            Entity_FinancialAccounting.FinancialAccounting.FA_ConsortiumDataTable ObjConsortiumMasterDataTable_DAL = null;
            Entity_FinancialAccounting.FinancialAccounting.FA_ConsortiumRow ObjConsortiumMasterDataRow = null;

            Database db;

            public ClsPubConsortiumMaster(string strConnectionName)
            {
                db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            }

            public int FunPubConsortiumMaster(FASerializationMode SerMode, byte[] ObjConsortiumMasterDataTable)
            {
                try
                {
                    DbCommand command = db.GetStoredProcCommand("FA_Tre_InsertConsortiumDetails_BackUp");
                    ObjConsortiumMasterDataTable_DAL = (FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ConsortiumDataTable)FAClsPubSerialize.DeSerialize(ObjConsortiumMasterDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.FinancialAccounting.FA_ConsortiumDataTable));
                    ObjConsortiumMasterDataRow = ObjConsortiumMasterDataTable_DAL.Rows[0] as Entity_FinancialAccounting.FinancialAccounting.FA_ConsortiumRow;
                   
                    db.AddInParameter(command, "@Company_Id", DbType.Int32, ObjConsortiumMasterDataRow.Company_Id);
                    db.AddInParameter(command, "@User_Id", DbType.Int32, ObjConsortiumMasterDataRow.User_Id);
                    db.AddInParameter(command, "@strConsortium", DbType.String, ObjConsortiumMasterDataRow.strConsortium);
                    db.AddInParameter(command, "@strMember", DbType.String, ObjConsortiumMasterDataRow.strMember);
                    db.AddInParameter(command, "@strAddDtls", DbType.String, ObjConsortiumMasterDataRow.strAddDtls);
                    //db.AddInParameter(command,"@Consortium_Name",DbType.String,ObjConsortiumMasterDataRow.Consortium_Name);
                    db.AddInParameter(command, "@Is_Active", DbType.String, ObjConsortiumMasterDataRow.Is_Active);
                    db.AddInParameter(command, "@Created_By", DbType.Int32, ObjConsortiumMasterDataRow.Created_By);
                    db.AddInParameter(command, "@Created_Date", DbType.DateTime, ObjConsortiumMasterDataRow.Created_Date);
                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));


                    db.FunPubExecuteNonQuery(command);

                    if ((int)command.Parameters["@ErrorCode"].Value > 0)
                        intErrorCode = (int)command.Parameters["@ErrorCode"].Value;

                }
                catch (Exception ex)
                {
                    //intErrorCode = 50;
                    ClsPubCommErrorLogDal.CustomErrorRoutine(ex,"");
                }
                return intErrorCode;
            
            
            }



            //public int FunPubConsortiumMaster(FASerializationMode SerMode, byte[] bytesobjFA_Consortium_List, string strConnectionName)
            //{
            //    throw new NotImplementedException();
            //}
        }
    }
}
