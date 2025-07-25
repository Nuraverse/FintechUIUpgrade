#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Address Master
/// Created By			: Sathish R
/// Created Date		: 04-Apr-2018
/// Purpose	            : To Configure Name and Address 
/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Threading;
using System.Globalization;
using System.Data;
#endregion

public partial class System_Admin_S3GSysAdminAddressMaster_Add : ApplyThemeForProject
{
    #region Intialization
    int intErrCode = 0;
    int intCompanyId = 0;
    int intUserId = 0;
    bool bModify = false;
    UserInfo ObjUserInfo;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    string strMode;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminCompanyMaster_View.aspx';";
    CompanyMgtServicesReference.CompanyMgtServicesClient objCompanyMasterClient;
    string strDateFormat;
    S3GSession ObjS3GSession = new S3GSession();
    SerializationMode SerMode = SerializationMode.Binary;
    #endregion

    #region PageLoad
    protected void Page_Load(object sender, EventArgs e)
    {
        ObjUserInfo = new UserInfo();
        S3GSession ObjS3GSession = new S3GSession();
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
    }
    #endregion

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (tcAddressSetup.ActiveTabIndex != tcAddressSetup.Tabs.Count - 1)
        {
            tcAddressSetup.ActiveTabIndex = tcAddressSetup.ActiveTabIndex + 1;
        }
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        if (tcAddressSetup.ActiveTabIndex != 0)
        {
            tcAddressSetup.ActiveTabIndex = tcAddressSetup.ActiveTabIndex - 1;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/System Admin/S3GSysAdminCompanyMaster_View.aspx");
    }
    private void funPriLoadNationality()
    {
        try
        {
            Dictionary<string, string> strProParm = new Dictionary<string, string>();
            strProParm.Add("Company_Id",intCompanyId.ToString());
            strProParm.Add("Option", "1");
            cmbNationality.BindDataTable("S3G_SYSAD_GET_ADDRS_SETUP_DTLS", strProParm);

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
 
        }
    }
}
