#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: System Admin Management Services Interface
/// Created By			: Muni Kavitha
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
using FA_BusEntity;
using FA_DALayer;
#endregion

namespace SIS_FA_SLayer.SysAdmin
{
    // NOTE: If you change the interface name "ISystemAdminMgtService" here, you must also update the reference to "ISystemAdminMgtService" in Web.config.
    [ServiceContract]
    public interface ISystemAdminMgtService
    {
        #region Company Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertCompanyMaster(FASerializationMode SerMode, byte[] bytesobjCompanyMasterDataTable, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubUpdateCompanyMaster(FASerializationMode SerMode, byte[] bytesobjCompanyMasterDataTable, string strConnectionName);
        #endregion

        #region Hierarchy Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubSaveHierachyMaster(FASerializationMode SerMode, byte[] bytesobjHierachyMaster_DTB, string strConnectionName);
        #endregion

        #region [Location Master Details]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName, out string strExistingCode, out string strExistingDescription);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubUpdateLocationCategory(FASerializationMode SerMode, byte[] bytesLocationCategory_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertLocationMaster(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName, out string strExistingMapping);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubUpdateLocationMapping(FASerializationMode SerMode, byte[] bytesLocationMaster_DTB, string strConnectionName);
        #endregion [Location Master Details]

        #region Document Number Control Master

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetDocTypeList(FASerializationMode SerMode, byte[] bytesobjDocTypeList_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetDNCDetails_View(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB, string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCDetails_DTB, string strConnectionName);


        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetBatchList(FASerializationMode SerMode, byte[] bytesobjBatchList_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyDNCDetails(FASerializationMode SerMode, byte[] bytesobjDNCMaster_DTB, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubDeleteDNCDetails(int intDoc_Number_Seq_ID, string strConnectionName);
        #endregion

        #region [Role Center Master]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunRoleCodeMasterInsertInt(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyRoleCodeMaster(FASerializationMode SerMode, byte[] bytesObjSNXG_RoleCode_MasterDataTable, string strConnectionName);

        #endregion

        #region Currency Master
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubModifyCurrencyInt(FASerializationMode SerMode, byte[] bytesObjS3G_SYSAD_CurrencyMasterDataTable, string strConnectionName);
        #endregion

        #region [Dimemsion Master]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetDimensionDetails(FASerializationMode SerMode, byte[] bytesObjFA_SYS_DimensionMasterDataTable, string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateDimensionMaster(FASerializationMode SerMode, byte[] byteObjFA_DimensionMaster, string strMode, string strConnectionName);

        #endregion [Dimemsion Master]

        #region [Exchange Rate Master]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertExchangeMaster(FASerializationMode SerMode, byte[] bytesobjExchangeMaster_DTB, string strConnectionName, out int intExchangeRate_ID);
        #endregion

        #region [Global Parameter setup]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateGPS(FASerializationMode SerMode, byte[] byteObjFA_GPS, string strMode, string strConnectionName);

        #endregion [Global Parameter setup]

        #region "User Management"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateUserInt(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryUser(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryUserPaging(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strConnectionName, out int intTotalRecords, FAPagingValues ObjPaging);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryUserMaster(FASerializationMode SerMode, byte[] bytesObjUserMasterDataTable_SERLAY, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubQueryBranchRoleDetails(FASerializationMode SerMode, byte[] bytesObjUserManagementDataTable_SERLAY, string strMode, string strConnectionName);

        #endregion

        #region [Month and Year Lock]
        // Month Lock
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunInsertMonthLock(FASerializationMode SerMode, byte[] bytesObjSNXG_MonthLockDataTable, string strMode, string strConnectionName);

        // Year Lock
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunInsertYearLock(FASerializationMode SerMode, byte[] bytesObjSNXG_YearLockDataTable, string strMode, string strConnectionName);

        #endregion
        #region  Year Opening
        // DNC Year Opening
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertDNC_YearOpen(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName);

        //Year Opening Process 

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertGL_Sum(FASerializationMode SerMode, byte[] byteObjFA_YearOpen, string strMode, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubMoveTableRecord(string strSchemaName, string strConnectionName);

        #endregion

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertHolidayMaster(FASerializationMode SerMode, byte[] byteObjFA_Master, string strMode, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertTemplateMaster(FASerializationMode SerMode, byte[] byteObjFA_Master, string strConnectionName, out int intTemplate_ID, out string strDocNo);


        # region Stamp Duty

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateStampDuty(FASerializationMode SerMode, byte[] bytesobjStampDutyMst_List, out int int_stamp_id, string strConnectionName);

        #endregion


        # region TDS Rate

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateTDSRate(FASerializationMode SerMode, byte[] bytesobjTDSRateMst_List, out int int_tds_id, string strConnectionName);

        #endregion

        #region [opening Balance]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubInsertUpdateOpeningbalance(FASerializationMode SerMode, byte[] byteObjFA_opening, string strMode, string strConnectionName);

        #endregion [opening Balance]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateAuditTrial(FA_BusEntity.FASerializationMode SerMode, string strConnectionName, byte[] bytesObjAuditTrialDatatable_SERLAY);

        #region "Update Item Profile Setup"
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubUpdateItemProfSetUp(FASerializationMode SerMode,string strConnectionName, byte[] bytesObjManualLookupDataTable_SERLAY);

        #endregion

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunInsertDayOpenClose(FASerializationMode SerMode, byte[] bytesObjFA_DAY_OPEN_CLOSEDataTable, string strMode, string strConnectionName);



    }
}
