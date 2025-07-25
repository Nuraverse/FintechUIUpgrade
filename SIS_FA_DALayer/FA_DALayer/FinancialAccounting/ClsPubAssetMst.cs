using System;
using FA_DALayer.FA_SysAdmin;
using System.Data;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using FA_BusEntity;


namespace FA_DALayer.FinancialAccounting
{
    public class ClsPubAssetMst
    {

        int intErrorCode;
        int int_OutResult;
        string strConnection = string.Empty;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_MstDataTable objFA_Asset_MstDataTable;
        FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_MstRow objFA_Asset_MstRow;
        Database db;
        public ClsPubAssetMst(string strConnectionName)
        {
            db = FA_DALayer.Common.ClsIniFileAccess.FunPubGetDatabase(strConnectionName);
            strConnection = strConnectionName;
        }



        #region "Asset Master"
        public int FunPubInsertAssetMaster(FASerializationMode SerMode, byte[] bytesobjFA_Asset_MstDataTable)
        {

            try
            {
                intErrorCode = 0;
                objFA_Asset_MstDataTable = (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_MstDataTable)FAClsPubSerialize.DeSerialize(bytesobjFA_Asset_MstDataTable, SerMode, typeof(FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_MstDataTable));
                DbCommand command = null;
                foreach (FA_BusEntity.FinancialAccounting.Hedging.FA_Asset_MstRow objFA_Asset_MstRow in objFA_Asset_MstDataTable.Rows)
                {
                    command = db.GetStoredProcCommand("FA_INS_UPD_AssetMst");

                    if (!objFA_Asset_MstRow.IsCompany_IDNull())
                        db.AddInParameter(command, "@Company_ID", DbType.Int32, objFA_Asset_MstRow.Company_ID);
                    if (!objFA_Asset_MstRow.IsAsset_Group_codeNull())
                        db.AddInParameter(command, "@Asset_Group_code", DbType.String, objFA_Asset_MstRow.Asset_Group_code);
                    if (!objFA_Asset_MstRow.IsAsset_Group_descNull())
                        db.AddInParameter(command, "@Asset_Group_desc", DbType.String, objFA_Asset_MstRow.Asset_Group_desc);
                    if (!objFA_Asset_MstRow.IsGL_CodeNull())
                        db.AddInParameter(command, "@GL_Code", DbType.String, objFA_Asset_MstRow.GL_Code);
                    if (!objFA_Asset_MstRow.IsSL_CodeNull())
                        db.AddInParameter(command, "@SL_Code", DbType.String, objFA_Asset_MstRow.SL_Code);
                    if (!objFA_Asset_MstRow.IsAsset_CodeNull())
                        db.AddInParameter(command, "@Asset_Code", DbType.String, objFA_Asset_MstRow.Asset_Code);
                    if (!objFA_Asset_MstRow.IsAsset_Code_descNull())
                        db.AddInParameter(command, "@Asset_Code_desc", DbType.String, objFA_Asset_MstRow.Asset_Code_desc);
                    if (!objFA_Asset_MstRow.IsBook_depNull())
                        db.AddInParameter(command, "@Book_dep", DbType.Decimal, objFA_Asset_MstRow.Book_dep);
                    if (!objFA_Asset_MstRow.IsBlock_depNull())
                        db.AddInParameter(command, "@Block_dep", DbType.Decimal, objFA_Asset_MstRow.Block_dep);
                    if (!objFA_Asset_MstRow.IsPrint_SeqNull())
                        db.AddInParameter(command, "@Print_Seq", DbType.Int32, objFA_Asset_MstRow.Print_Seq);
                    if (!objFA_Asset_MstRow.IsIs_ActiveNull())
                        db.AddInParameter(command, "@Is_Active", DbType.Int32, objFA_Asset_MstRow.Is_Active);
                    if (!objFA_Asset_MstRow.IsCreated_ByNull())
                        db.AddInParameter(command, "@Created_By", DbType.Int32, objFA_Asset_MstRow.Created_By);
                    if (!objFA_Asset_MstRow.IsCreated_DateNull())
                        db.AddInParameter(command, "@Created_Date", DbType.DateTime, objFA_Asset_MstRow.Created_Date);
                    if (!objFA_Asset_MstRow.IsModeNull())
                        db.AddInParameter(command, "@Mode", DbType.String, objFA_Asset_MstRow.Mode);
                    if (!objFA_Asset_MstRow.IsAsset_Group_IDNull())
                        db.AddInParameter(command, "@Asset_Group_ID", DbType.Int32, objFA_Asset_MstRow.Asset_Group_ID);
                    if (!objFA_Asset_MstRow.IsUOMNull())
                        db.AddInParameter(command, "@UOM", DbType.Int32, objFA_Asset_MstRow.UOM);
                    if (!objFA_Asset_MstRow.IsAsset_CategoryNull())
                        db.AddInParameter(command, "@AssetCategory", DbType.Int32, objFA_Asset_MstRow.Asset_Category);
                    if (!objFA_Asset_MstRow.IsXMLBookDepNull())
                        db.AddInParameter(command, "@XMLBookDep", DbType.String, objFA_Asset_MstRow.XMLBookDep);

                    if (!objFA_Asset_MstRow.IsXMLBlockDepNull())
                        db.AddInParameter(command, "@XMLblockDep", DbType.String, objFA_Asset_MstRow.XMLBlockDep);

                    if (!objFA_Asset_MstRow.IsDepreciation_PerNull())
                        db.AddInParameter(command, "@Dep_Per", DbType.Int32, objFA_Asset_MstRow.Depreciation_Per);


                    db.AddOutParameter(command, "@ErrorCode", DbType.Int32, sizeof(Int32));
                    db.AddOutParameter(command, "@OutResult", DbType.Int32, sizeof(Int32));
                    using (DbConnection conn = db.CreateConnection())
                    {
                        conn.Open();
                        DbTransaction trans = conn.BeginTransaction();
                        try
                        {
                            db.FunPubExecuteNonQuery(command,ref trans);
                            if ((int)command.Parameters["@ErrorCode"].Value > 0)
                            {
                                int_OutResult = (int)command.Parameters["@ErrorCode"].Value;
                                throw new Exception("Error thrown Error No" + int_OutResult.ToString());
                            }
                            else
                            {
                                if ((int)command.Parameters["@OutResult"].Value > 0)
                                    int_OutResult = Convert.ToInt32(command.Parameters["@OutResult"].Value);
                                trans.Commit();
                            }
                        }
                        catch (Exception ex)
                        {
                            //if (intErrorCode == 0)
                            //    intErrorCode = 50;
                            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                            trans.Rollback();
                        }
                        finally
                        { conn.Close(); }
                    }
                }
            }
            catch (Exception ex)
            {
                //intErrorCode = 50;
                FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            return int_OutResult;
        }
        #endregion



    }
}
