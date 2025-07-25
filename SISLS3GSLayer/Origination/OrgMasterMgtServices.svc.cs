#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Origination
/// Screen Name			: Constitution Master
/// Created By			: Nataraj Y
/// Created Date		: 01-Jun-2010
/// Purpose	            : 
/// Modified By         : Nataraj Y
/// Modified Date       : 02-Jun-2010
/// <Program Summary>
#endregion

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using ORG = S3GDALayer.Origination;
using System.Data;
using S3GBusEntity;
using S3GDALayer.Origination;
using System.ServiceModel.Activation;

namespace S3GServiceLayer.Origination
{
    // To Implement Service Compatablity
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerCall, ConcurrencyMode = ConcurrencyMode.Multiple)]
    // NOTE: If you change the class name "OrgMasterMgtServices" here, you must also update the reference to "OrgMasterMgtServices" in Web.config.
    public class OrgMasterMgtServices : IOrgMasterMgtServices
    {
        int intResult;
        SerializationMode SerMode = SerializationMode.Binary;
        ORG.OrgMasterMgtServices.ClsPubBankStatement objBankStatement = new ORG.OrgMasterMgtServices.ClsPubBankStatement();
        byte[] bytesDataTable;
        string strCategoryCode = String.Empty;

        #region "Target Master"

        public int FunPubCreateTargetMaster(SerializationMode SerMode, byte[] bytesObjTargetMasterDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubTargetMaster ObjTargetMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubTargetMaster();
                intResult = ObjTargetMaster.FunPubCreateTargetMasterInt(SerMode, bytesObjTargetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Target Master:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public int FunPubModifyTargetMaster(SerializationMode SerMode, byte[] bytesObjTargetMasterDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubTargetMaster ObjTargetMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubTargetMaster();
                intResult = ObjTargetMaster.FunPubModifyTargetMasterInt(SerMode, bytesObjTargetMasterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Target Master:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion


        #region IOrgMasterMgtServices Asset Category



        public int FunPubCreateAssetCategoryInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_AssetCategoryDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                intResult = ObjAssetMaster.FunPubCreateAssetCategoryInt(SerMode, bytesObjS3G_ORG_AssetCategoryDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Asset Category Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public byte[] FunPubQueryAssetCategoryDetails(int intCompanyId, int? intAsset_CatId, int? intAssetType_Id)
        {
            DataSet dsAssetCatDetails = new DataSet();
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                dsAssetCatDetails = ObjAssetMaster.FunPubQueryAssetCategoryDetails(intCompanyId, intAsset_CatId, intAssetType_Id);
                bytesDataTable = ClsPubSerialize.Serialize(dsAssetCatDetails, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in querying asset category details :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        #endregion

        #region IOrgMasterMgtServices Asset Master

        public int FunPubCreateAssetCodeInt(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_AssetMasterDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                intResult = ObjAssetMaster.FunPubCreateAssetCodeInt(SerMode, bytesObjS3G_ORG_AssetMasterDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Asset Code Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        public byte[] FunPubQueryAssetDetails(int intCompany_Id, int? intAsset_id, int? intAssetType_Id)
        {
            S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_AssetMasterDataTable ObjAssetMasterTable;
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                ObjAssetMasterTable = ObjAssetMaster.FunPubQueryAssetDetails(intCompany_Id, intAsset_id, intAssetType_Id);
                bytesDataTable = S3GBusEntity.ClsPubSerialize.Serialize(ObjAssetMasterTable, SerMode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Asset Code Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;

        }

        public string FunPubGetLastAssetCategoryCode(int intCompany_Id, string strCategoryCode, int intAssetType_Id)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                strCategoryCode = ObjAssetMaster.FunPubGetLastAssetCategoryCode(intCompany_Id, strCategoryCode, intAssetType_Id);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Geting Category Code :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return strCategoryCode;
        }

        public int FunPubModifyAssetCodeInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_AssetMasterDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                intResult = ObjAssetMaster.FunPubModifyAssetCodeInt(SerMode, bytesObjS3G_ORG_AssetMasterDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Asset Code Updation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        #endregion

        #region IOrgMasterMgtServices Constitution Master

        public int FunPubCreateConstitutionCode(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_ConstitutionMasterDataTable, out string ConstitutionCode)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubConstitutionMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstitutionMaster();
                intResult = ObjConstitutionMaster.FunPubCreateConstitutionCode(SerMode, bytesObjS3G_ORG_ConstitutionMasterDataTable, out  ConstitutionCode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Constitution Code Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        public byte[] FunPubQueryConstitutionDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_ConstitutionMasterDataTable)
        {
            DataSet dsConstitution = null;
            try
            {
                ORG.OrgMasterMgtServices.ClsPubConstitutionMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstitutionMaster();
                dsConstitution = ObjConstitutionMaster.FunPubQueryConstitutionDetails(SerMode, bytesObjS3G_ORG_ConstitutionMasterDataTable);
                bytesDataTable = ClsPubSerialize.Serialize(dsConstitution, SerializationMode.Binary);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Constitution :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            finally
            {
                dsConstitution.Dispose();
                dsConstitution = null;
            }
            return bytesDataTable;

        }

        public byte[] FunPubQueryConstitutionMaster(SerializationMode SerMode, byte[] bytesObjConstitutionMasterDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable dtConstitutionMaster;
                ORG.OrgMasterMgtServices.ClsPubConstitutionMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstitutionMaster();
                dtConstitutionMaster = ObjConstitutionMaster.FunPubQueryConstitutionMaster(SerMode, bytesObjConstitutionMasterDataTable_SERLAY);
                bytesDataTable = ClsPubSerialize.Serialize(dtConstitutionMaster, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        #endregion

        #region IOrgMasterMgtServices Entity Master

        /// <summary>
        /// to insert entity details
        /// </summary>
        /// <param name="bytesObjS3G_ORG_Enityt_MasterDataTable">to get all entity related details</param>
        /// <param name="strEntityCode">can be Entity Code</param>
        /// <returns></returns>
        public int FunPubCreateEntityInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Enityt_MasterDataTable, out string strEntityCode)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubEntityMaster ObjEntityMaster = new ORG.OrgMasterMgtServices.ClsPubEntityMaster();
                intResult = ObjEntityMaster.FunPubCreateEntityInt(SerMode, bytesObjS3G_ORG_Enityt_MasterDataTable, out strEntityCode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Creating Entity Code :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        /// <summary>
        /// to modify entity details
        /// </summary>
        /// <param name="bytesObjS3G_ORG_Enityt_MasterDataTable">to get all entity related details</param>
        /// <returns></returns>
        public int FunPubModifyEntityInt(SerializationMode SerMode, byte[] bytesObjS3G_ORG_Enityt_MasterDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubEntityMaster ObjEntityMaster = new ORG.OrgMasterMgtServices.ClsPubEntityMaster();
                intResult = ObjEntityMaster.FunPubModifyEntityInt(SerMode, bytesObjS3G_ORG_Enityt_MasterDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Updating Entity Code :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        /// <summary>
        /// to query entity details
        /// </summary>
        /// <param name="intCompanyId">Company Id to whcich entity belongs</param>
        /// <param name="intEntityId">Entity Id for which dat to be obtained</param>
        /// <param name="blnTranExists">Boolen to check trans exists for Enityt selected</param>
        /// <returns></returns>
        public byte[] FunPubQueryEntityDetails(int? intCompany_Id, int? intEntity_id, out bool blnTranExists)
        {
            DataSet dsEntityDetails = null;
            try
            {
                ORG.OrgMasterMgtServices.ClsPubEntityMaster ObjEntityMaster = new ORG.OrgMasterMgtServices.ClsPubEntityMaster();
                dsEntityDetails = ObjEntityMaster.FunPubQueryEntityDetails(intCompany_Id, intEntity_id, out blnTranExists);
                bytesDataTable = ClsPubSerialize.Serialize(dsEntityDetails, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Querying Entity Details :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        #endregion

        #region GLOBAL PARAMETER SETUP

        #region GeLookUp
        public byte[] FunPubGetGlobalLook(SerializationMode SerMode, byte[] bytesObjGlobalLookDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Global_LookUPDataTable dtGlobalLookDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalLookDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalLookDetails = ObjGlobalLookDetailsDetails.FunPubGlobalLookup(SerMode, bytesObjGlobalLookDataTable_SERLAY);
                byte[] bytesGlobalLookDetails = ClsPubSerialize.Serialize(dtGlobalLookDetails, SerializationMode.Binary);
                return bytesGlobalLookDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Look Up Type :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion


        public byte[] FunPubGetGlobalProgram(SerializationMode SerMode, byte[] bytesObjGlobalProgramDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_GetGlobalProgramDataTable dtGlobalProgramDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalProgramDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalProgramDetails = ObjGlobalProgramDetailsDetails.FunPubGetGlobalProgram(SerMode, bytesObjGlobalProgramDataTable_SERLAY);
                byte[] bytesGlobalProgramDetails = ClsPubSerialize.Serialize(dtGlobalProgramDetails, SerializationMode.Binary);
                return bytesGlobalProgramDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Program :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        //public int FunPubCreateGlobalParameter(SerializationMode SerMode, byte[] bytesObjGlobalParameterDataTable_SERLAY, byte[] bytesObjGlobalParameterROIDataTable_SERLAY, byte[] bytesObjGlobalParameterLOBDataTable_SERLAY)
        //{
        //    try
        //    {
        //        S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalParameterMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
        //        intResult = ObjGlobalParameterMaster.FunPubCreateGlobalParameter(SerMode, bytesObjGlobalParameterDataTable_SERLAY, bytesObjGlobalParameterROIDataTable_SERLAY, bytesObjGlobalParameterLOBDataTable_SERLAY);
        //    }
        //    catch (Exception objExp)
        //    {
        //        ClsPubFaultException objFault = new ClsPubFaultException();
        //        objFault.ProReasonRW = "Erro in Global Creation :" + objExp.Message.ToString();
        //        throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
        //    }
        //    return intResult;
        //}

        public int FunPubCreateGlobalParameter(SerializationMode SerMode, byte[] bytesObjGlobalParameterDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalParameterMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                intResult = ObjGlobalParameterMaster.FunPubCreateGlobalParameter(SerMode, bytesObjGlobalParameterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        //public int FunPubUpdateGlobalParameter(SerializationMode SerMode, byte[] bytesObjGlobalParameterDataTable_SERLAY, byte[] bytesObjGlobalParameterROIDataTable_SERLAY, byte[] bytesObjGlobalParameterLOBDataTable_SERLAY)
        //{
        //    try
        //    {
        //        S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalUpdateParameterMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
        //        intResult = ObjGlobalUpdateParameterMaster.FunPubUpdateGlobalParameter(SerMode, bytesObjGlobalParameterDataTable_SERLAY, bytesObjGlobalParameterROIDataTable_SERLAY, bytesObjGlobalParameterLOBDataTable_SERLAY);
        //    }
        //    catch (Exception objExp)
        //    {
        //        ClsPubFaultException objFault = new ClsPubFaultException();
        //        objFault.ProReasonRW = "Erro in Global Update Creation :" + objExp.Message.ToString();
        //        throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
        //    }
        //    return intResult;
        //}


        public int FunPubUpdateGlobalParameter(SerializationMode SerMode, byte[] bytesObjGlobalParameterDataTable_SERLAY)
        {
            try
            {
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalUpdateParameterMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                intResult = ObjGlobalUpdateParameterMaster.FunPubUpdateGlobalParameter(SerMode, bytesObjGlobalParameterDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Update Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public byte[] FunPubGetGlobalProgramLOB(SerializationMode SerMode, byte[] bytesObjGlobalProgramLOBDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_GlobalParameterLOBNameDataTable dtGlobalProgramLOBDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalProgramLOBDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalProgramLOBDetails = ObjGlobalProgramLOBDetailsDetails.FunPubGetGlobalLOBName(SerMode, bytesObjGlobalProgramLOBDataTable_SERLAY);
                byte[] bytesGlobalProgramLOBDetails = ClsPubSerialize.Serialize(dtGlobalProgramLOBDetails, SerializationMode.Binary);
                return bytesGlobalProgramLOBDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Program :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetGlobalMaster(SerializationMode SerMode, byte[] bytesObjGlobalProgramMasterDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_GetGlobalParameterMasterDataTable dtGlobalProgramMasterDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalProgramMasterDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalProgramMasterDetails = ObjGlobalProgramMasterDetailsDetails.FunPubGlobalParameterMaster(SerMode, bytesObjGlobalProgramMasterDataTable_SERLAY);
                byte[] bytesGlobalProgramMasterDetails = ClsPubSerialize.Serialize(dtGlobalProgramMasterDetails, SerializationMode.Binary);
                return bytesGlobalProgramMasterDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Parameter :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetGlobalLOB(SerializationMode SerMode, byte[] bytesObjGlobalLOBMasterDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_GlobalLOBDataTable dtGlobalLOBMasterDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalLOBDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalLOBMasterDetails = ObjGlobalLOBDetailsDetails.FunPubGlobalLOBMaster(SerMode, bytesObjGlobalLOBMasterDataTable_SERLAY);
                byte[] bytesGlobalLOBMasterDetails = ClsPubSerialize.Serialize(dtGlobalLOBMasterDetails, SerializationMode.Binary);
                return bytesGlobalLOBMasterDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Parameter :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetGlobalROI(SerializationMode SerMode, byte[] bytesObjGlobalROIMasterDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_GlobalParameterROIDataTable dtGlobalROIMasterDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter ObjGlobalROIDetailsDetails = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGlobalParameter();
                dtGlobalROIMasterDetails = ObjGlobalROIDetailsDetails.FunPubGlobalROIMaster(SerMode, bytesObjGlobalROIMasterDataTable_SERLAY);
                byte[] bytesGlobalROIMasterDetails = ClsPubSerialize.Serialize(dtGlobalROIMasterDetails, SerializationMode.Binary);
                return bytesGlobalROIMasterDetails;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Erro in Global Parameter :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region Workflow
        public bool FunPubGetIsWorkFlowSupported(int intCompanyID, int intLOBID, int intProductID, int intModuleID, int intProgramID)
        {
            try
            {
                //ORG.OrgMasterMgtServices.ClsPubAssetMaster ObjAssetMaster = new ORG.OrgMasterMgtServices.ClsPubAssetMaster();
                //strCategoryCode = ObjAssetMaster.FunPubGetLastAssetCategoryCode(intCompany_Id, strCategoryCode, intAssetType_Id);
            }
            catch (Exception objExp)
            {
                //ClsPubFaultException objFault = new ClsPubFaultException();
                //objFault.ProReasonRW = "Error in Geting Category Code :" + objExp.Message.ToString();
                //throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return true;
        }
        #endregion

        #region Common Methods for Origination
        /// <summary>
        /// This is common method used in origination module to fill dropdown and load 
        /// default data etc.
        /// </summary>
        /// <param name="ObjParam"></param>
        /// <returns></returns>
        public DataTable FunPub_GetS3GStatusLookUp(S3G_Status_Parameters ObjParam)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubCustomerMaster ObjCustomerMaster = new ORG.OrgMasterMgtServices.ClsPubCustomerMaster();
                return ObjCustomerMaster.FunPub_GetS3GStatusLookUp(ObjParam);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Get S3GStatus LookUp :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region Customer Master

        public int FunPubCreateCustomerInt(CustomerMasterBusEntity objCustomerMasterEntity, out string strCustomerCodeOut)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubCustomerMaster ObjCustomerMaster = new ORG.OrgMasterMgtServices.ClsPubCustomerMaster();
                intResult = ObjCustomerMaster.FunPubCreateCustomerInt(objCustomerMasterEntity, out  strCustomerCodeOut);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Creating Customer Code :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }





        #endregion

        #region "Bank Statement Capture"

        public int FunPubCreateBankStatemntListValues(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_ListValues_XMLDataTable)
        {
            try
            {
                intResult = objBankStatement.FunPubCreateBankStatemntListValues(SerMode, bytesObjS3G_ORG_ListValues_XMLDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in List Value Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public int FunPubCreateBankStatemntData(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_BankStatemnt_CaptureDataTable, int intUpdateBank_ID)
        {
            try
            {
                intResult = objBankStatement.FunPubCreateBankStatemntData(SerMode, bytesObjS3G_BankStatemnt_CaptureDataTable, intUpdateBank_ID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Bank Statement Data Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        public byte[] FunPubQueryBankStatemntCopyListValues(int Bank_ID)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Get_Bank_Statement_LOVDetailsDataTable dtLOVDetails;
                dtLOVDetails = (S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Get_Bank_Statement_LOVDetailsDataTable)objBankStatement.FunPubQueryBankStatemntCopyListValues(Bank_ID);
                bytesDataTable = ClsPubSerialize.Serialize(dtLOVDetails, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        public byte[] FunPubGetBankStatemnt_ID()
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Get_Bank_Statement_IDDataTable dtCaptureDataTable;
                dtCaptureDataTable = (S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Get_Bank_Statement_IDDataTable)objBankStatement.FunPubGetBankStatemnt_ID();
                bytesDataTable = ClsPubSerialize.Serialize(dtCaptureDataTable, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

            return bytesDataTable;
        }

        public byte[] FunPubQueryBankStatemntCaptureData(int CompanyID, int CreatedBy)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_Get_Bank_Stmt_Data_CaptureDetailsDataTable dtBankStatementDetails;
                S3GDALayer.Origination.OrgMasterMgtServices.ClsPubBankStatement objBank = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubBankStatement();
                dtBankStatementDetails = objBank.FunPubQueryBankStatemntData(CompanyID, CreatedBy);
                bytesDataTable = ClsPubSerialize.Serialize(dtBankStatementDetails, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        public int FunPubDeleteBankStatemntListvalues(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_ListValues_DataTable)
        {
            try
            {
                intResult = objBankStatement.FunPubDeleteBankStatemntListvalues(SerMode, bytesObjS3G_ORG_ListValues_DataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in List Value Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        #endregion

        #region Gold Loan Matrix
        //Added by Thangam M on 28/Jul/2012
        public int FunPubCreateGoldLoanMatrix(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_Origination_GoldLoanMatrix_DataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubGoldLoanMatrix objGoldLoanMatrix = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubGoldLoanMatrix();
                intResult = objGoldLoanMatrix.FunPubCreateModifyGoldLoanMatrix(SerMode, bytesObjS3G_Origination_GoldLoanMatrix_DataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Gold Loan Matrix Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion


        //Added By Suseela for Complaince Master - code starts
        #region Complaince Master
        public int FunPubCreateComplainceMaster(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_COMPMASTERDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubComplainceMaster ObjComplainceMaster = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubComplainceMaster();
                intResult = ObjComplainceMaster.FunPubCreateComplainceMaster(SerMode, bytesObjS3G_ORG_COMPMASTERDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Complaince Master Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion
        //Added By Suseela for Complaince Master - code ends

        #region IOrgMasterMgtServices Constant Setup Master

        public int FunPubCreateConstantSetup(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_ConstitutionMasterDataTable, out string ConstitutionCode)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster();
                intResult = ObjConstitutionMaster.FunPubCreateConstantSetup(SerMode, bytesObjS3G_ORG_ConstitutionMasterDataTable, out  ConstitutionCode);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Constitution Code Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        public byte[] FunPubQueryConstantSetupDetails(SerializationMode SerMode, byte[] bytesObjS3G_ORG_ConstitutionMasterDataTable)
        {
            DataSet dsConstitution = null;
            try
            {
                ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster();
                dsConstitution = ObjConstitutionMaster.FunPubQueryConstantSetupDetails(SerMode, bytesObjS3G_ORG_ConstitutionMasterDataTable);
                bytesDataTable = ClsPubSerialize.Serialize(dsConstitution, SerializationMode.Binary);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Constitution :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            finally
            {
                dsConstitution.Dispose();
                dsConstitution = null;
            }
            return bytesDataTable;

        }

        public byte[] FunPubQueryConstantSetupMaster(SerializationMode SerMode, byte[] bytesObjConstitutionMasterDataTable_SERLAY)
        {
            try
            {
                S3GBusEntity.Origination.OrgMasterMgtServices.S3G_ORG_ConstitutionMasterDataTable dtConstitutionMaster;
                ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster ObjConstitutionMaster = new ORG.OrgMasterMgtServices.ClsPubConstantSetupMaster();
                dtConstitutionMaster = ObjConstitutionMaster.FunPubQueryConstantSetupMaster(SerMode, bytesObjConstitutionMasterDataTable_SERLAY);
                bytesDataTable = ClsPubSerialize.Serialize(dtConstitutionMaster, SerializationMode.Binary);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return bytesDataTable;
        }

        #endregion

        #region InsertUpdate Negative list(Decline Hotlist Entry)

        public int FunPubCreateModifyNegativeList(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjNegativeListDataTable)
        {
            try
            {
                ORG.CashflowMgtServices.ClsPubNegativeListCustomers objNegativeListCustomer = new ORG.CashflowMgtServices.ClsPubNegativeListCustomers();
                intResult = objNegativeListCustomer.FunPubCreateModifyNegativeList(SerMode, bytesObjNegativeListDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Constitution Code Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }

        #endregion

        //Added By Suseela for Complaince Master - code starts
        #region RiskLimit Guideline Master
        public int FunPubCreateRiskLimitGuidelineMaster(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_RiskLimitGuideDataTable,out string strRiskGuideLineDocNumber)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubRiskGuidelineMaster ObjRiskGuideline = new S3GDALayer.Origination.OrgMasterMgtServices.ClsPubRiskGuidelineMaster();
                intResult = ObjRiskGuideline.FunPubCreateOrModifyRiskLimitGuideMaster(SerMode, bytesObjS3G_ORG_RiskLimitGuideDataTable,out strRiskGuideLineDocNumber);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Complaince Master Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion

        //Added by deepika for Customer group--starts
        #region Create Customer Group Code 
        public int FunPubCreateCustomerGroupInt(S3GBusEntity.SerializationMode SerMode, byte[] bytesObjS3G_ORG_Entity_MasterDataTable)
        {
            try
            {
                ORG.OrgMasterMgtServices.ClsPubEntityMaster ObjEntityMaster = new ORG.OrgMasterMgtServices.ClsPubEntityMaster();
                intResult = ObjEntityMaster.FunPubCreateCustomerGroupInt(SerMode, bytesObjS3G_ORG_Entity_MasterDataTable);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Customer Group Creation :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }
        #endregion
        //Added by deepika for Customer group--end
    }

}
