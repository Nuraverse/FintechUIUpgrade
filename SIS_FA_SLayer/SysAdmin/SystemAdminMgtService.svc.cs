#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: System Admin Management Services 
/// Created By			: muni Kavitha
/// Created Date		: 17-Jan-2012
/// Purpose	            : 
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

using FA_DALayer;
using FA_BusEntity;
using System.Data;
using System.ServiceModel.Activation;
#endregion

namespace SIS_FA_SLayer.SysAdmin
{
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    // NOTE: If you change the class name "SystemAdminMgtService" here, you must also update the reference to "SystemAdminMgtService" in Web.config.
    public class SystemAdminMgtService : ISystemAdminMgtService
    {
        int intResult;
        //byte[] bytesDataTable;

        #region Company Master

        /// <summary>
        ///This method is used to call DAL layer to insert company details.
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubInsertCompanyMaster(FASerializationMode SerMode, byte[] bytesobjCompanyMasterDataTable,string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubCompanyMaster ObjCompanyMaster = new FA_DALayer.SysAdmin.ClsPubCompanyMaster(strConnectionName);
                return ObjCompanyMaster.FunPubInsertCompanyMaster(SerMode, bytesobjCompanyMasterDataTable, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Company Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        /// <summary>
        ///This method is used to call DAL layer to Update company details.
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubUpdateCompanyMaster(FASerializationMode SerMode, byte[] bytesobjCompanyMasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubCompanyMaster ObjCompanyMaster = new FA_DALayer.SysAdmin.ClsPubCompanyMaster(strConnectionName);
                return ObjCompanyMaster.FunPubUpdateCompanyMaster(SerMode, bytesobjCompanyMasterDataTable, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Company Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #endregion

        #region Hierarchy Master

        /// <summary>
        /// Calling DAL Layer's Insert Hierarchy Master Method(FunPubSaveHierachyMaster) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubSaveHierachyMaster(FASerializationMode SerMode, byte[] bytesobjHierachyMaster_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubHierachyMaster objHierarchyMaster = new FA_DALayer.SysAdmin.ClsPubHierachyMaster(strConnectionName);
                return objHierarchyMaster.FunPubSaveHierachyMaster(SerMode, bytesobjHierachyMaster_DTB, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Hierarchy Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region Location Master

        /// <summary>
        /// Calling DAL Layer's Insert method for saving Location Category
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>

        public int FunPubInsertLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName, out string strExistingCode, out string strExistingDescription)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubLocationMaster objLocationMaster = new FA_DALayer.SysAdmin.ClsPubLocationMaster(strConnectionName);
                return objLocationMaster.FunPubInsertLocationCategory(SerMode, bytesLocationCategory_DTB,strConnectionName, out strExistingCode, out strExistingDescription);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Location Category Entry : " + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        /// <summary>
        ///Calling DAL Layer's Update method for saving Location Category
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <param name="strErrorCode"></param>
        public int FunPubUpdateLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubLocationMaster objLocationMaster = new FA_DALayer.SysAdmin.ClsPubLocationMaster(strConnectionName);
                return objLocationMaster.FunPubUpdateLocationCategory(SerMode, bytesLocationCategory_DTB, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Location Category Updation : " + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        /// <summary>
        ///Calling DAL Layer's Insert method for saving Location Master
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <param name="strExistingMapping"></param>
        /// <returns></returns>
        public int FunPubInsertLocationMaster(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName, out string strExistingMapping)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubLocationMaster objLocationMaster = new FA_DALayer.SysAdmin.ClsPubLocationMaster(strConnectionName);
                return objLocationMaster.FunPubInsertLocationMaster(SerMode, bytesLocationMaster_DTB, strConnectionName,out strExistingMapping);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Location Mapping Entry : " + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        /// <summary>
        ///Calling DAL Layer's Update method for saving Location Mapping
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesLocation_Datatable"></param>
        /// <param name="strErrorCode"></param>
        public int FunPubUpdateLocationMapping(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubLocationMaster objLocationMaster = new FA_DALayer.SysAdmin.ClsPubLocationMaster(strConnectionName);
                return objLocationMaster.FunPubUpdateLocationMapping(SerMode, bytesLocationMaster_DTB, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Location Mapping Updation : " + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion [Location master Details]

        #region Document Number Control Master

        public byte[] FunPubGetDocTypeList(FASerializationMode SerMode, byte[] bytesobjDocTypeList_DTB, string strConnectionName)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable dtDocTypeList;
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocTypeList = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                dtDocTypeList = objDocTypeList.FunPubGetDocTypeList(SerMode, bytesobjDocTypeList_DTB, strConnectionName);
                byte[] bytesDocTypeList = FAClsPubSerialize.Serialize(dtDocTypeList, FASerializationMode.Binary);
                return bytesDocTypeList;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Document Type List:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB, string strConnectionName)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable dtDNCDetails;
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocDetails = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                dtDNCDetails = objDocDetails.FunPubQueryDNS(SerMode, bytesobjDNCDetails_DTB, strConnectionName);
                byte[] bytesGetDNCMaster = FAClsPubSerialize.Serialize(dtDNCDetails, FASerializationMode.Binary);
                return bytesGetDNCMaster;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in in Getting Document Number Control Details:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetDNCDetails_View(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB, string strConnectionName,out int intTotalRecords, FAPagingValues ObjPaging)
        {
            byte[] bytesGetDNCMaster;
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable dtDNCDetails;
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocDetails = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                dtDNCDetails = objDocDetails.FunPubQueryDNS_View(SerMode, bytesobjDNCDetails_DTB, strConnectionName, out intTotalRecords, ObjPaging);
                bytesGetDNCMaster = FAClsPubSerialize.Serialize(dtDNCDetails, FASerializationMode.Binary);
                return bytesGetDNCMaster;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Document Number Control Details:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubGetBatchList(FASerializationMode SerMode, byte[] bytesobjBatchList_DTB, string strConnectionName)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable dtBatchList;
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objBatchList = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                dtBatchList = objBatchList.FunPubGetBatch(SerMode, bytesobjBatchList_DTB, strConnectionName);
                byte[] bytesGetBatchList = FAClsPubSerialize.Serialize(dtBatchList, FASerializationMode.Binary);
                return bytesGetBatchList;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Batch List :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubCreateDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocNoControl = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                return objDocNoControl.FunPubCreateDNS(SerMode, bytesobjDNCMaster_DTB, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Document Number Control Details:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubModifyDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocNoControl = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                return objDocNoControl.FunPubModifyDNS(SerMode, bytesobjDNCMaster_DTB, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Document Number Control Details:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public int FunPubDeleteDNCDetails(int intDoc_Number_Seq_ID, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubDoucmentNoControl objDocNoControl = new FA_DALayer.SysAdmin.ClsPubDoucmentNoControl(strConnectionName);
                intResult = objDocNoControl.FunPubDeleteDNS(intDoc_Number_Seq_ID, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Deleting Document Number Control Details :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        #endregion

        #region Role Center Master

        /// <summary>
        /// Calling DAL Layer's Insert Role Center Master Method(FunRoleCodeMasterInsertInt) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunRoleCodeMasterInsertInt(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubRoleCenterMaster objRoleCenter = new FA_DALayer.SysAdmin.ClsPubRoleCenterMaster(strConnectionName);
                return objRoleCenter.FunRoleCodeMasterInsertInt(SerMode, bytesObjSNXG_RoleCode_MasterDataTable, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Role Center Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        /// <summary>
        /// Calling DAL Layer's Update Role Center Master Method(FunPubModifyRoleCodeMaster) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubModifyRoleCodeMaster(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubRoleCenterMaster objRoleCenter = new FA_DALayer.SysAdmin.ClsPubRoleCenterMaster(strConnectionName);
                return objRoleCenter.FunPubModifyRoleCodeMaster(SerMode, bytesObjSNXG_RoleCode_MasterDataTable, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Role Center Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region Currency Master
        /// <summary>
        /// Calling DAL Layer's Insert Currency Master Method(FunPubCreateCurrencyInt) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CurrencyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubCreateCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubCurrencyMaster objCurrencyMaster = new FA_DALayer.SysAdmin.ClsPubCurrencyMaster(strConnectionName);
                return objCurrencyMaster.FunPubCreateCurrencyInt(SerMode, bytesObjS3G_SYSAD_CurrencyMasterDataTable, strConnectionName);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Currency Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        /// <summary>
        /// Calling DAL Layer's Update Currency Master Method(FunPubModifyCurrencyInt) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjS3G_SYSAD_CurrencyMasterDataTable"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubModifyCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubCurrencyMaster objCurrencyMaster = new FA_DALayer.SysAdmin.ClsPubCurrencyMaster(strConnectionName);
                return objCurrencyMaster.FunPubModifyCurrencyInt(SerMode, bytesObjS3G_SYSAD_CurrencyMasterDataTable, strConnectionName);

            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Saving Currency Master :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region [Dimension Master]

        public byte[] FunPubGetDimensionDetails(FASerializationMode SerMode, byte[] bytesObjFA_SYS_DimensionMasterDataTable,string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            try
            {
                DataTable dtDimensionList;
                FA_DALayer.SysAdmin.ClsPubFADimensionMaster objDimensionList = new FA_DALayer.SysAdmin.ClsPubFADimensionMaster(strConnectionName);
                dtDimensionList = objDimensionList.FunPubQueryDimensionPaging(SerMode, bytesObjFA_SYS_DimensionMasterDataTable, strConnectionName, out intTotalRecords, ObjPaging);
                byte[] bytesDimensionList = FAClsPubSerialize.Serialize(dtDimensionList, FASerializationMode.Binary);
                return bytesDimensionList;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Getting Dimension master List:" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        /// <summary>
        /// created By Tamilselvan.s
        /// created date 28/01/2012
        /// For Insert and Update process for Dimension Master
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_DimensionMaster"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateDimensionMaster(FASerializationMode SerMode, byte[] byteObjFA_DimensionMaster, string strMode, string strConnectionName)
        {
            FA_DALayer.SysAdmin.ClsPubFADimensionMaster objDimensionMaster = new FA_DALayer.SysAdmin.ClsPubFADimensionMaster(strConnectionName);
            return objDimensionMaster.FunPubInsertUpdateDimensionMaster(SerMode, byteObjFA_DimensionMaster, strMode, strConnectionName);
        }

        #endregion [Dimension Master]

        #region Exchange Rate Master

        /// <summary>
        /// Calling DAL Layer's Insert/Modify method for saving Exchange Rate Master
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesobjHierachyMaster_DTB"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubInsertExchangeMaster(FASerializationMode SerMode, byte[] bytesobjExchangeMaster_DTB,string strConnectionName, out int intExchangeRate_ID)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubExchangeMaster objExchangeRateMaster = new FA_DALayer.SysAdmin.ClsPubExchangeMaster(strConnectionName);
                return objExchangeRateMaster.FunPubInsertExchangeMaster(SerMode, bytesobjExchangeMaster_DTB, strConnectionName, out intExchangeRate_ID);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Exchange Rate Entry : " + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region [Global Parameter setup]
        /// <summary>
        /// created By Tamilselvan.s
        /// created date 01/02/2012
        /// For Insert and Update process for Global parameter setup
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_GPS"></param>
        /// <param name="strMode"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateGPS(FASerializationMode SerMode, byte[] byteObjFA_GPS, string strMode, string strConnectionName)
        {
            FA_DALayer.SysAdmin.ClsPubGlobalParameterSetup objGPS = new FA_DALayer.SysAdmin.ClsPubGlobalParameterSetup(strConnectionName);
            return objGPS.FunPubInsertUpdateDimensionMaster(SerMode, byteObjFA_GPS, strMode, strConnectionName);
        }

        #endregion [Global Parameter setup]

        #region "User Management"
        /// <summary>
        /// Calling DAL Layer's Create User Method (FunPubCreateUser) with Ser Mode and Bytes as Input
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjUserMasterDataTable_SERLAY"></param>
        /// <returns>Error Code (it is 0 if no error is found)</returns>
        public int FunPubCreateUserInt(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName)
        {
            try
            {

                FA_DALayer.SysAdmin.ClsPubUserManagement ObjUserManagement = new FA_DALayer.SysAdmin.ClsPubUserManagement(strConnectionName);
                return ObjUserManagement.FunPubCreateUserInt(SerMode, bytesObjUserManagementDataTable_SERLAY, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        /// <summary>
        /// This is used to fetch user details
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjUserManagementDataTable_SERLAY"></param>
        /// <returns></returns>
        public byte[] FunPubQueryUser(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName)
        {
            try
            {

                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable dtUserManagement;
                FA_DALayer.SysAdmin.ClsPubUserManagement ObjUserManagement = new FA_DALayer.SysAdmin.ClsPubUserManagement(strConnectionName);
                dtUserManagement = ObjUserManagement.FunPubQueryUser(SerMode, bytesObjUserManagementDataTable_SERLAY, strConnectionName);
                byte[] bytesUserManagement = FAClsPubSerialize.Serialize(dtUserManagement, FASerializationMode.Binary);
                return bytesUserManagement;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        public byte[] FunPubQueryUserPaging(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserManagementDataTable dtUserManagement;
                FA_DALayer.SysAdmin.ClsPubUserManagement ObjUserManagement = new FA_DALayer.SysAdmin.ClsPubUserManagement(strConnectionName);
                dtUserManagement = ObjUserManagement.FunPubQueryUserPaging(SerMode, bytesObjUserManagementDataTable_SERLAY, strConnectionName, out intTotalRecords, ObjPaging);
                byte[] bytesUserManagement = FAClsPubSerialize.Serialize(dtUserManagement, FASerializationMode.Binary);
                return bytesUserManagement;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        /// <summary>
        /// This is used to fetch user code 
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjUserManagementDataTable_SERLAY"></param>
        /// <returns></returns>
        public byte[] FunPubQueryUserMaster(FASerializationMode SerMode, byte[] bytesObjUserMasterDataTable_SERLAY, string strConnectionName)
        {
            try
            {
                FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_UserMaster_ListDataTable dtUserMaster;
                FA_DALayer.SysAdmin.ClsPubUserManagement ObjUserManagement = new FA_DALayer.SysAdmin.ClsPubUserManagement(strConnectionName);
                dtUserMaster = ObjUserManagement.FunPubQueryUserMaster(SerMode, bytesObjUserMasterDataTable_SERLAY, strConnectionName);
                byte[] bytesUserMaster = FAClsPubSerialize.Serialize(dtUserMaster, FASerializationMode.Binary);
                return bytesUserMaster;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        /// <summary>
        /// This is used to fetch branch and role details based on user and compnay id
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjUserManagementDataTable_SERLAY"></param>
        /// <returns></returns>
        public byte[] FunPubQueryBranchRoleDetails(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubUserManagement ObjUserManagement = new FA_DALayer.SysAdmin.ClsPubUserManagement(strConnectionName);
                DataSet dsBranchRole = ObjUserManagement.FunPubQueryBranchRoleDetails(SerMode, bytesObjUserManagementDataTable_SERLAY, strMode, strConnectionName);
                byte[] bytesUserManagement = FAClsPubSerialize.Serialize(dsBranchRole, FASerializationMode.Binary);
                return bytesUserManagement;
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }

        #region Year / MOnth Lock
        /// <summary>
        /// Created By Manikandan.R
        /// Created date 04/April/2012
        /// For Insert and Update process for Month Master
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_MonthLockDataTable"></param>
        /// <returns></returns>
        public int FunInsertMonthLock(FASerializationMode SerMode, byte[] bytesObjSNXG_MonthLockDataTable, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubMonthYearLock objMonthLock = new FA_DALayer.SysAdmin.ClsPubMonthYearLock(strConnectionName);
                return objMonthLock.FunInsertMonthLock(SerMode, bytesObjSNXG_MonthLockDataTable, strMode, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        /// <summary>
        /// Created By Manikandan.R
        /// Created date 04/April/2012
        /// For Insert and Update process for Year Lock
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="bytesObjSNXG_YearLockDataTable"></param>
        /// <returns></returns>
        public int FunInsertYearLock(FASerializationMode SerMode, byte[] bytesObjSNXG_YearLockDataTable, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubMonthYearLock objYearLock = new FA_DALayer.SysAdmin.ClsPubMonthYearLock(strConnectionName);
                return objYearLock.FunInsertYearLock(SerMode, bytesObjSNXG_YearLockDataTable, strMode, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion

        #region Year Opening
        /// <summary>
        /// Created By Manikandan.R
        /// Created date 30/April/2012
        /// For Insert DNC in Year Opening Process
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_YearOpen"></param>
        /// <returns></returns>
        public int FunPubInsertDNC_YearOpen(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsYearOpening ObjYearDNCOpening = new FA_DALayer.SysAdmin.ClsYearOpening(strConnectionName);
                return ObjYearDNCOpening.FunPubInsertDNC_YearOpen(SerMode, byteObjFA_YearOpen, strMode, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        /// <summary>
        /// Created By Manikandan.R
        /// Created date 30/April/2012
        /// For Insert  Year Opening Process
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_YearOpen"></param>
        /// <returns></returns>
        public int FunPubInsertGL_Sum(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsYearOpening ObjYearOpening = new FA_DALayer.SysAdmin.ClsYearOpening(strConnectionName);
                return ObjYearOpening.FunPubInsertGL_Sum(SerMode, byteObjFA_YearOpen, strMode, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        public int FunPubMoveTableRecord(string strSchemaName, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsYearOpening ObjYearOpening = new FA_DALayer.SysAdmin.ClsYearOpening(strConnectionName);
                return ObjYearOpening.FunPubMoveTableRecord(strSchemaName, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }

        #endregion


        #endregion

        #region [Holiday master]

        public int FunPubInsertHolidayMaster(FASerializationMode SerMode, byte[] byteObjFA_Master, string strMode, string strConnectionName)
        {
            FA_DALayer.SysAdmin.ClsPubHolidaymaster objholidayMaster = new FA_DALayer.SysAdmin.ClsPubHolidaymaster(strConnectionName);
            return objholidayMaster.FunPubInsertHolidayMaster(SerMode, byteObjFA_Master, strMode, strConnectionName);
        }
        #endregion

        #region [Template master]

        public int FunPubInsertTemplateMaster(FASerializationMode SerMode, byte[] byteObjFA_Master, string strConnectionName, out int intTemplate_ID, out string strDocNo)
        {
            FA_DALayer.FinancialAccounting.ClsPubTemplateMaster objTemplateMaster = new FA_DALayer.FinancialAccounting.ClsPubTemplateMaster(strConnectionName);
            return objTemplateMaster.FunPubInsertTemplateMaster(SerMode, byteObjFA_Master, strConnectionName, out intTemplate_ID, out strDocNo);
        }

        #endregion

        #region [Stamp Duty Master]

        public int FunPubCreateStampDuty(FASerializationMode SerMode, byte[] bytesobjStampDutyMst_List, out int int_stamp_id, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubStampDutyMaster objStampDuty = new FA_DALayer.SysAdmin.ClsPubStampDutyMaster(strConnectionName);
                return objStampDuty.FunPubCreateStampDuty(SerMode, bytesobjStampDutyMst_List, out int_stamp_id, strConnectionName);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Stamp Duty: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        # endregion

        #region [TDS Rate Master]

        public int FunPubCreateTDSRate(FASerializationMode SerMode, byte[] bytesobjTDSRateMst_List, out int int_tds_id, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubTDSRateMaster objTDSRate = new FA_DALayer.SysAdmin.ClsPubTDSRateMaster(strConnectionName);
                return objTDSRate.FunPubCreateTDSRate(SerMode, bytesobjTDSRateMst_List, out int_tds_id, strConnectionName);
            }
            catch (Exception ObjExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Stamp Duty: " + ObjExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }

        }


        # endregion


        #region [Opening Balance]
        /// <summary>
        /// created By Tamilselvan.s
        /// created date 01/02/2012
        /// For Insert and Update process for Global parameter setup
        /// </summary>
        /// <param name="SerMode"></param>
        /// <param name="byteObjFA_GPS"></param>
        /// <param name="strMode"></param>
        /// <returns></returns>
        public int FunPubInsertUpdateOpeningbalance(FASerializationMode SerMode, byte[] byteObjFA_opening, string strMode, string strConnectionName)
        {
            FA_DALayer.SysAdmin.ClsPubOpeningbalance objopening = new FA_DALayer.SysAdmin.ClsPubOpeningbalance(strConnectionName);
            return objopening.FunPubInsertUpdateOpeningbalance(SerMode, byteObjFA_opening, strMode, strConnectionName);
        }

        #endregion [Global Parameter setup]


        #region "[Audit Trial]"
        public int FunPubCreateAuditTrial(FASerializationMode SerMode, string strConnectionName, byte[] byteObjAuditTrialDataTable_SERLAY)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubFAAdmin ObjCLsPubS3GAdmin = new FA_DALayer.SysAdmin.ClsPubFAAdmin(strConnectionName);
                return ObjCLsPubS3GAdmin.FunPubCreateAuditTrial(SerMode, byteObjAuditTrialDataTable_SERLAY);
            }
            catch (Exception objEx)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in Audit Trial :" + objEx.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }
        #endregion


        public int FunPubUpdateItemProfSetUp(FASerializationMode SerMode,string strConnectionName, byte[] bytesObjManualLookupDataTable_SERLAY)
        {
            try
            {

                FA_DALayer.SysAdmin.ClsPubCurrencyMaster ObjManualLookup = new FA_DALayer.SysAdmin.ClsPubCurrencyMaster(strConnectionName);
                intResult = ObjManualLookup.FunPubUpdateItemProfSetUp(SerMode, bytesObjManualLookupDataTable_SERLAY);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
            return intResult;
        }


        #region Day Open Close

        public int FunInsertDayOpenClose(FASerializationMode SerMode, byte[] bytesObjFA_DAY_OPEN_CLOSEDataTable, string strMode, string strConnectionName)
        {
            try
            {
                FA_DALayer.SysAdmin.ClsPubDayOpenClose objDAyClose = new FA_DALayer.SysAdmin.ClsPubDayOpenClose(strConnectionName);
                return objDAyClose.FunInsertDayOpenClose(SerMode, bytesObjFA_DAY_OPEN_CLOSEDataTable, strMode, strConnectionName);
            }
            catch (Exception objExp)
            {
                ClsPubFaultException objFault = new ClsPubFaultException();
                objFault.ProReasonRW = "Error in :" + objExp.Message.ToString();
                throw new FaultException<ClsPubFaultException>(objFault, new FaultReason(objFault.ProReasonRW));
            }
        }


        
        #endregion
    }
}
