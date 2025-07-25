#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: FA Admin
/// Screen Name			: FA Admin  Services Interface
/// Created By			: Saran
/// Created Date		: 16-Jan-2012
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
using System.Data;
using FA_BusEntity;
using FA_DALayer;
using System.Collections;
using System.Data.SqlClient;
using System.ServiceModel.Activation;
#endregion


namespace SIS_FA_SLayer.SysAdmin
{
    // NOTE: If you change the interface name "IFAAdminServices" here, you must also update the reference to "IFAAdminServices" in Web.config.
    [ServiceContract]
    public interface IFAAdminServices
    {

        #region Set Connection String
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunSetConnection(string strConnectionName, string Fin_Year, int Company_ID, out string strDB_Name, out string strInitial_Catalog, out string strUSERNAME, out string strPASSWORD,string Appl_Type);
        #endregion

        #region Login Validations
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        //int FunPubValidateLogin( string strUserLoginCode, string strConnectionName,string strPassword,out int intCompanyID, out int intUserID, out int intUser_Level_ID, out string strUserName, out string strCompanyName, out string strCompanyCode, out DateTime LastLoginDate, out string strTheme, out string strAccess, out string strCountryName, out string strUserType);
        int FunPubValidateLogin(string strUserLoginCode, string strConnectionName, string strPassword, out int intCompanyID, out int intUserID, out int intUser_Level_ID, out string strUserName, out string strCompanyName, out string strCompanyCode, out DateTime LastLoginDate, out string strTheme, out string strAccess, out string strCountryName, out string strUserType, out string strMarquee, out string strCompareDate);
        #endregion




        #region Menu Loading Code
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubGetUserMenu(int intUserId, string strUserName, string strUserType, int intCompany_ID, string strConnectionName);
        #endregion

        #region To Get single value from SP
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        string FunGetScalarValue(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams);
        #endregion

        #region To Get Data in DataTable
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillDropdown( string strProcName,string strConnectionName , Dictionary<string, string> dctProcParams);
        #endregion

        #region To Get Data in DataTable
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillDropdownXML(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, string strXMLKey, string strXMLParm);
        #endregion

        #region To Get Data in DataSet
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillDataset(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams);
        #endregion

        #region Gridview Binding with paging
        
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillGridPaging(string strProcName, string strConnectionName, Dictionary<string, string> dctProcParams, out int intTotalRecords, FAPagingValues ObjPaging);

        [OperationContract(Name = "FunPubFillGridPagingWithErrorCode")]
        [FaultContract(typeof(ClsPubFaultException))]
        byte[] FunPubFillGridPaging( string strProcName,string strConnectionName,Dictionary<string, string> dctProcParams, out int intTotalRecords, out int intErrorCode, FAPagingValues ObjPaging);
        
        #endregion

        #region [Password Validation]
        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubPasswordValidation(Int32 intUserID, string strPassword, string strConnectionName);
        #endregion [Password Validation]

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        string FunPubSysErrorLog(string strProcName, Dictionary<string, string> dctProcParams, string strConnectionName);

        [OperationContract]
        [FaultContract(typeof(ClsPubFaultException))]
        int FunPubCreateScheduledJobs(FASerializationMode SerMode, byte[] bytesObjScheduledJobsDatatable, out string strScheduleJobID, string strConnectionName);

    }

    #region For Fault Contract
    [DataContract]
    public class ClsPubFaultException
    {
        private string strReason;

        [DataMember]
        public string ProReasonRW
        {
            get { return strReason; }
            set { strReason = value; }
        }
    }
    #endregion

}
