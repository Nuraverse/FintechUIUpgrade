/// Module Name     :   System Admin
/// Screen Name     :   S3GSysAdminRoleMst_Add.aspx
/// Created By      :   Anbuvel T
/// Created Date    :   07-MAY-2018
/// Purpose         :   To insert and update user group/Roles details

using System;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web.UI;
using System.ServiceModel;
using System.Data;
using System.Text;
using S3GBusEntity;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Configuration;

public partial class System_Admin_S3GSysAdminRoleMst_Add : ApplyThemeForProject
{
    #region Intialization
    UserMgtServicesReference.UserMgtServicesClient objUserManagementClient = new UserMgtServicesReference.UserMgtServicesClient();
    int intErrCode = 0;
    int intUserGroupId = -1;
    int intUserId = -1;
    int intCreatedBy = 0;
    int inthdUserid;
    string strRedirectPageMC;
    string strDateFormat = string.Empty;
    UserMgtServices.S3G_SYSAD_RoleMasterDataTable ObjS3G_SYSAD_UserGroupDataTable = new UserMgtServices.S3G_SYSAD_RoleMasterDataTable();
    UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable ObjS3G_SYSAD_UserMasterDataTable = new UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable();
    SerializationMode SerMode = SerializationMode.Binary;

    string strRedirectPage = "../System Admin/S3GSysAdminRoleMst_View.aspx";
    string strRegionDet = "<Root><Details Region_ID='0' /></Root>";
    DataTable dtRoleAccess = null;
    int intCompanyID = 0;
    string strModeCode = string.Empty;
    Dictionary<string, string> Procparam = null;
    StringBuilder strbRegion = new StringBuilder();
    StringBuilder strbSelUsersList = new StringBuilder();
    StringBuilder strbSelLOB = new StringBuilder();

    int intLOBID = 0;
    bool booChecked = true;
    UserInfo ObjUserInfo = null;
    string strMode = "C";
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    bool bChecked = true;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminRoleMst_Add.aspx';";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminRoleMst_View.aspx';";
    static string strPageName = "Role Master";
    string strUpperCaseNeed;
    string strNumberNeed;
    string strSpecCharNeed;
    int intPWDLength;
    Boolean boolLoginPage;
    int intGPSPwdItrCount;
    string strNewPassword;
    DataSet dsChagePWD = new DataSet();
    Dictionary<string, string> ProcPWDparam = null;
    int intErrorCode;
    string strPWDDefaultString;

    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ObjUserInfo = new UserInfo();
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intCreatedBy = ObjUserInfo.ProUserIdRW;
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
            S3GSession ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;

            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

            if (Request.QueryString["qsUserGroupId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsUserGroupId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intUserGroupId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }

            }
            if (!IsPostBack)
            {
                chkActive.Checked = false;                
                #region MakerChecker
                if (((intUserGroupId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intUserGroupId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }
                else
                {
                    BindActiveLOBList();
                    FunPriDisableControls(0);
                    FungetLocationRoleLOB(0);
                }
                #endregion MakerChecker
                txtUserGroupName.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    //protected void chkLOB_OnCheckedChanged(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        CheckBox chkLOB = (CheckBox)sender;
    //        string strFieldAtt = ((CheckBox)sender).ClientID;
    //        string strVal = strFieldAtt.Substring(strFieldAtt.LastIndexOf("GrvLOBList_")).Replace("GrvLOBList_ctl", "");
    //        int gRowIndex = Convert.ToInt32(strVal.Substring(0, strVal.LastIndexOf("_")));
    //        gRowIndex = gRowIndex - 2;
    //        if (((CheckBox)sender).Checked)
    //        {
    //            Label lblLOB_ID = (Label)GrvLOBList.Rows[gRowIndex].FindControl("lblLOB_ID");
    //            int intLOB_ID = 0;
    //            intLOB_ID = Convert.ToInt32(lblLOB_ID.Text.Trim());
    //            FungetLocationRoleLOB(intLOB_ID);
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}
    /// <summary>
    /// Get LineofBusiness Details
    /// </summary>
    private void FunPriGetLOBDetails()
    {
        try
        {
            txtUserGroupCode.Text = string.Empty;
            txtUserGroupName.Text = string.Empty;
            hdnID.Value = string.Empty;
            //chkActive.Checked = true;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@ROLEMASTER_ID", Convert.ToString(intUserGroupId));
            DataSet dsGroupdtl = Utility.GetDataset("S3G_SYSAD_GET_USERGRPDTL", Procparam);
            if (dsGroupdtl.Tables[0].Rows.Count > 0)
            {
                txtUserGroupName.Text = Convert.ToString(dsGroupdtl.Tables[0].Rows[0]["ROLE_NAME"]);
                txtGroupEmail.Text = Convert.ToString(dsGroupdtl.Tables[0].Rows[0]["GROUP_EMAIL"]);
                if (Convert.ToInt32(dsGroupdtl.Tables[0].Rows[0]["IS_ACTIVE"]) == 1)
                {
                    chkActive.Checked = true;
                }
                else
                {
                    chkActive.Checked = false;
                }
                if (dsGroupdtl.Tables[1].Rows.Count > 0)
                {
                    GrvLOBList.DataSource = dsGroupdtl.Tables[1];
                    GrvLOBList.DataBind();
                }             
                if (dsGroupdtl.Tables[2].Rows.Count > 0)
                {
                    grvRoleCode.DataSource = dsGroupdtl.Tables[2];
                    grvRoleCode.DataBind();
                }                
            }
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    private void BindActiveLOBList()
    {
        try
        {
            Dictionary<string, string> objParameters = new Dictionary<string, string>();
            objParameters.Add("@Company_ID", intCompanyID.ToString());
            objParameters.Add("@User_ID", intCreatedBy.ToString());
            objParameters.Add("@Option", "2");
            objParameters.Add("@Program_ID", "524");
            DataTable dtRoleCode = Utility.GetDefaultData("S3G_SA_GET_ACTIVEUSRLIST", objParameters);
            if (dtRoleCode.Rows.Count > 0)
            {
                GrvLOBList.DataSource = dtRoleCode;
                GrvLOBList.DataBind();
            }
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }
    protected void GrvLOBList_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblAssigned = (Label)e.Row.FindControl("lblAssigned");
                CheckBox chkLOB = (CheckBox)e.Row.FindControl("chkLOB");
                if (lblAssigned.Text == "1")
                {
                    chkLOB.Checked = true;
                }
                if (strMode == "Q")
                {
                    chkLOB.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    /// <summary>
    /// Save the Record
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //string s = "create";
        //s += @"\nWould you like to add one more record?";
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "if(confirm('" + s + "')){window.location.href='../System Admin/S3GSysAdminLOBMaster_Add.aspx';}else {window.location.href='../System Admin/S3GSysAdminLOBMaster_View.aspx';}", true);
        //return;

        string strKey = "Insert";
        string strAlert = "alert('__ALERT__');";
        string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminRoleMst_View.aspx';";
        string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminRoleMst_Add.aspx';";

        //if (GrvGrpList.Rows.Count == 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Atleast add one record in Group User List");
        //    return;
        //}
        int rowCountCheck = 0;
        if (grvRoleCode.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in grvRoleCode.Rows)
            {
                //CheckBox chkRoleCode = ((CheckBox)grvData.FindControl("chkSelRoleCode"));
                CheckBox chkAdd = ((CheckBox)grvData.FindControl("chkAdd"));
                CheckBox chkModify = ((CheckBox)grvData.FindControl("chkModify"));
                CheckBox chkDelete = ((CheckBox)grvData.FindControl("chkDelete"));
                CheckBox chkView = ((CheckBox)grvData.FindControl("chkView"));
                if (chkAdd.Checked || chkModify.Checked || chkDelete.Checked || chkView.Checked)
                {
                    rowCountCheck = 1;
                    break;
                }
            }
        }
        if (rowCountCheck == 0)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one record in Role Code");
            return;
        }
        rowCountCheck = 0;
        if (GrvLOBList.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in GrvLOBList.Rows)
            {
                CheckBox chkLOB = ((CheckBox)grvData.FindControl("chkLOB"));
                if (chkLOB.Checked)
                {
                    rowCountCheck = 1;
                    break;
                }
            }
        }
        if (rowCountCheck == 0)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one record in Line Of Business");
            return;
        }
        DataRow drEmptyRow;
        BindRoleGrid();
        dtRoleAccess = (DataTable)ViewState["RoleDetails"];
        if (grvRoleCode.Rows.Count > 0)
        {
            foreach (GridViewRow grvData in grvRoleCode.Rows)
            {
                CheckBox chkRoleCode = ((CheckBox)grvData.FindControl("chkSelRoleCode"));
                CheckBox chkAdd = ((CheckBox)grvData.FindControl("chkAdd"));
                CheckBox chkModify = ((CheckBox)grvData.FindControl("chkModify"));
                CheckBox chkDelete = ((CheckBox)grvData.FindControl("chkDelete"));
                CheckBox chkView = ((CheckBox)grvData.FindControl("chkView"));
                if (chkAdd.Checked || chkModify.Checked || chkDelete.Checked || chkView.Checked)
                {
                    Label lblRoleCode = ((Label)grvData.FindControl("lblRoleCode"));                    
                    Label lblRoleCenterID = ((Label)grvData.FindControl("lblRoleCenterID"));
                    drEmptyRow = dtRoleAccess.NewRow();
                    drEmptyRow["Role_Code_ID"] = Convert.ToUInt32(lblRoleCenterID.Text.Trim());
                    drEmptyRow["Role_Code"] = lblRoleCode.Text.Trim();
                    drEmptyRow["ProgramDesc"] = string.Empty;
                    drEmptyRow["Assigned"] = 1;
                    if (chkAdd.Checked)
                        drEmptyRow["IsAdd"] = 1;
                    else
                        drEmptyRow["IsAdd"] = 0;
                    if (chkModify.Checked)
                        drEmptyRow["IsModify"] = 1;
                    else
                        drEmptyRow["IsModify"] = 0;
                    if (chkDelete.Checked)
                        drEmptyRow["IsDelete"] = 1;
                    else
                        drEmptyRow["IsDelete"] = 0;
                    if (chkView.Checked)
                        drEmptyRow["IsView"] = 1;
                    else
                        drEmptyRow["IsView"] = 0;
                    dtRoleAccess.Rows.Add(drEmptyRow);
                }
            }
            ViewState["RoleDetails"] = dtRoleAccess;
        }

        try
        {
            UserMgtServices.S3G_SYSAD_RoleMasterRow ObjUserGroupRow;
            ObjUserGroupRow = ObjS3G_SYSAD_UserGroupDataTable.NewS3G_SYSAD_RoleMasterRow();
            ObjUserGroupRow.Company_ID = intCompanyID;
            ObjUserGroupRow.RoleMaster_ID = intUserGroupId;
            ObjUserGroupRow.Role_Code = txtUserGroupCode.Text.Trim();
            ObjUserGroupRow.Role_Name = txtUserGroupName.Text.Trim();
            ObjUserGroupRow.Group_Email = txtGroupEmail.Text.Trim();
            ObjUserGroupRow.IS_ACTIVE = Convert.ToInt32(chkActive.Checked);
            ObjUserGroupRow.Created_By = intCreatedBy;
            FunGetLOBSelectedDet();
            //FunGetUsersSelectedDet();
            if (grvRoleCode.Rows.Count > 0)
            {
                ObjUserGroupRow.XMLUserRoles = ((DataTable)ViewState["RoleDetails"]).FunPubFormXml();
            }
            if (GrvLOBList.Rows.Count > 0)
            {
                ObjUserGroupRow.XMLUserLOB = Convert.ToString(strbSelLOB).Trim();
            }
            //ObjUserGroupRow.XMLUserList = Convert.ToString(strbSelUsersList).Trim();
            ObjS3G_SYSAD_UserGroupDataTable.AddS3G_SYSAD_RoleMasterRow(ObjUserGroupRow);
            SerializationMode SerMode = SerializationMode.Binary;
            intErrCode = objUserManagementClient.FunPubCreateUserGroup(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_UserGroupDataTable, SerMode));
            if (intErrCode == 10)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert(' The Entered User Group is already exist ');", true);
                return;
            }
            if (intErrCode == 0)
            {
                if (intUserGroupId > 0)
                {
                    btnSave.Enabled_False();
                    strKey = "Modify";
                    strAlert = strAlert.Replace("__ALERT__", "User Role details updated successfully");//Group
                }
                else
                {
                    btnSave.Enabled_False();
                    strAlert = "User Role details added successfully";
                    strAlert += @"\n\nWould you like to add one more record?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                }
            }
            //else if (intErrCode == 2)
            //{
            //    strAlert = strAlert.Replace("__ALERT__", "User Group Code already exists in the system. Kindly enter a new User Group Code");
            //    strRedirectPageView = "";
            //}
            else if (intErrCode == 1)
            {
                strAlert = strAlert.Replace("__ALERT__", "User Group Name already exists in the system. Kindly enter a new User Group Name");
                strRedirectPageView = "";
            }
            else if (intErrCode == 2)
            {
                strAlert = strAlert.Replace("__ALERT__", "Already User Group assigned in User Management");
                strRedirectPageView = "";
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Unable to save the Group details");
                strRedirectPageView = "";
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            lblErrorMessage.Text = string.Empty;
        }
        catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }

    private void BindRoleGrid()
    {
        DataRow drEmptyRow;

        dtRoleAccess = new DataTable();
        dtRoleAccess.Columns.Add("ROLE_CODE_ID");
        dtRoleAccess.Columns.Add("ROLE_CODE");
        dtRoleAccess.Columns.Add("PROGRAMDESC");
        dtRoleAccess.Columns.Add("ASSIGNED");
        dtRoleAccess.Columns.Add("ISADD");
        dtRoleAccess.Columns.Add("ISMODIFY");
        dtRoleAccess.Columns.Add("ISDELETE");
        dtRoleAccess.Columns.Add("ISVIEW");
        drEmptyRow = dtRoleAccess.NewRow();
        drEmptyRow["ROLE_CODE_ID"] = 0;
        drEmptyRow["ROLE_CODE"] = string.Empty;
        drEmptyRow["PROGRAMDESC"] = string.Empty;
        drEmptyRow["ASSIGNED"] = 0;
        drEmptyRow["ISADD"] = 0;
        drEmptyRow["ISMODIFY"] = 0;
        drEmptyRow["ISDELETE"] = 0;
        drEmptyRow["ISVIEW"] = 0;
        dtRoleAccess.Rows.Add(drEmptyRow);
        dtRoleAccess.Rows[0].Delete();
        ViewState["RoleDetails"] = dtRoleAccess;

    }

    /// <summary>
    /// Clears all the record on confirmation 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        if (intLOBID == 0)
        {
            txtUserGroupCode.Text = txtUserGroupName.Text = txtGroupEmail.Text = string.Empty;
            BindActiveLOBList();
            FungetLocationRoleLOB(0);
            txtUserGroupName.Focus();
        }
    }
    protected void GrvUserList_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkUserSel = (CheckBox)e.Row.FindControl("chkUserSel");
                if (strMode == "Q")
                {
                    chkUserSel.Enabled = false;
                }
            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                CheckBox chkUserAll = (CheckBox)e.Row.FindControl("chkUserAll");
                //chkAll.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + grvRoleCode.ClientID + "',this,'chkSelRoleCode');");
                //chkUserAll.Checked = true;
                if (strMode == "Q")
                {
                    chkUserAll.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }
    protected void GrvGrpList_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chkGrpSelRoleCode = (CheckBox)e.Row.FindControl("chkGrpSelRoleCode");
                if (strMode == "Q")
                {
                    chkGrpSelRoleCode.Enabled = false;
                }
            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                CheckBox chkGrpAll = (CheckBox)e.Row.FindControl("chkGrpAll");
                //chkAll.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + grvRoleCode.ClientID + "',this,'chkSelRoleCode');");
                //chkAll.Checked = true;
                if (strMode == "Q")
                {
                    chkGrpAll.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }

    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DataTable dtAddGrpUsers = (DataTable)ViewState["AddGrpUsers"];

    //        for (int rowcount = 0; rowcount <= GrvUserList.Rows.Count - 1; rowcount++)
    //        {
    //            CheckBox chkUserSel = (CheckBox)GrvUserList.Rows[rowcount].FindControl("chkUserSel");
    //            Label lblUser_Name = (Label)GrvUserList.Rows[rowcount].FindControl("lblUser_Name");
    //            Label lblUser_ID = (Label)GrvUserList.Rows[rowcount].FindControl("lblUser_ID");
    //            if (chkUserSel.Checked)
    //            {
    //                if (dtAddGrpUsers != null && dtAddGrpUsers.Rows.Count > 0)
    //                {
    //                    DataRow[] chkusers = dtAddGrpUsers.Select("User_ID='" + lblUser_ID.Text.Trim() + "'");
    //                    if (!(chkusers.Length > 0))
    //                    {
    //                        DataRow drNewAddUserGrp = dtAddGrpUsers.NewRow();
    //                        drNewAddUserGrp["User_ID"] = lblUser_ID.Text.Trim();
    //                        drNewAddUserGrp["User_Name"] = lblUser_Name.Text.Trim();
    //                        dtAddGrpUsers.Rows.Add(drNewAddUserGrp);
    //                    }
    //                }
    //                else
    //                {
    //                    DataRow drNewAddUserGrp = dtAddGrpUsers.NewRow();
    //                    drNewAddUserGrp["User_ID"] = lblUser_ID.Text.Trim();
    //                    drNewAddUserGrp["User_Name"] = lblUser_Name.Text.Trim();
    //                    dtAddGrpUsers.Rows.Add(drNewAddUserGrp);
    //                }
    //                ViewState["AddGrpUsers"] = dtAddGrpUsers;
    //            }
    //        }
    //        FunPriBindGrpUsers("M");
    //    }
    //    catch (Exception ex)
    //    {
    //        CVUsermanagement.ErrorMessage = ex.Message;
    //        CVUsermanagement.IsValid = false;
    //    }
    //}
    //protected void btnRemove_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        DataTable dtAddGrpUsers = (DataTable)ViewState["AddGrpUsers"];
    //        for (int rowcount = 0; rowcount <= GrvGrpList.Rows.Count - 1; rowcount++)
    //        {
    //            CheckBox chkGrpSelRoleCode = (CheckBox)GrvGrpList.Rows[rowcount].FindControl("chkGrpSelRoleCode");
    //            Label lblUser_Grp_Name = (Label)GrvGrpList.Rows[rowcount].FindControl("lblUser_Grp_Name");
    //            Label lblUser_GrpID = (Label)GrvGrpList.Rows[rowcount].FindControl("lblUser_GrpID");
    //            if (chkGrpSelRoleCode.Checked)
    //            {
    //                if (dtAddGrpUsers != null && dtAddGrpUsers.Rows.Count > 0)
    //                {
    //                    DataRow[] chkusers = dtAddGrpUsers.Select("User_ID='" + lblUser_GrpID.Text.Trim() + "'");
    //                    if ((chkusers.Length > 0))
    //                    {
    //                        chkusers[0].Delete();
    //                    }
    //                    dtAddGrpUsers.AcceptChanges();
    //                }
    //                ViewState["AddGrpUsers"] = dtAddGrpUsers;
    //            }
    //        }
    //        FunPriBindGrpUsers("M");
    //    }
    //    catch (Exception ex)
    //    {
    //        CVUsermanagement.ErrorMessage = ex.Message;
    //        CVUsermanagement.IsValid = false;
    //    }
    //}
    //private void FunPriBindGrpUsers(string Mode)
    //{
    //    try
    //    {
    //        DataTable objDtUser = new DataTable();
    //        if (Mode == "C")
    //        {
    //            objDtUser.Columns.Add("User_ID");
    //            objDtUser.Columns.Add("User_Name");
    //            DataRow objDrUser = objDtUser.NewRow();
    //            objDrUser["User_ID"] = string.Empty;
    //            objDrUser["User_Name"] = string.Empty;
    //            objDtUser.Rows.Add(objDrUser);
    //            objDtUser.Rows.Clear();
    //            ViewState["AddGrpUsers"] = objDtUser;
    //            GrvGrpList.DataSource = objDtUser;
    //            GrvGrpList.DataBind();
    //            objDtUser.Rows.Clear();
    //        }
    //        if (Mode == "M")
    //        {
    //            objDtUser = (DataTable)ViewState["AddGrpUsers"];
    //            GrvGrpList.DataSource = objDtUser;
    //            GrvGrpList.DataBind();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }

    //}
    protected void grvRoleCode_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    Label lblAssigned = (Label)e.Row.FindControl("lblAssigned");
            //    CheckBox chkSelRoleCode = (CheckBox)e.Row.FindControl("chkSelRoleCode");
            //    CheckBox chkAdd = (CheckBox)e.Row.FindControl("chkAdd");
            //    CheckBox chkModify = (CheckBox)e.Row.FindControl("chkModify");
            //    CheckBox chkDelete = (CheckBox)e.Row.FindControl("chkDelete");
            //    CheckBox chkView = (CheckBox)e.Row.FindControl("chkView");

            //    if (lblAssigned.Text == "1")
            //    {
            //        chkSelRoleCode.Checked = true;
            //    }
            //    if (strMode == "Q")
            //    {
            //        chkSelRoleCode.Enabled = false;
            //    }
            //    chkSelRoleCode.Attributes.Add("onclick", "javascript:fnGridUnSelect('" + grvRoleCode.ClientID + "','chkAll','chkSelRoleCode');");
            //}
            //if (e.Row.RowType == DataControlRowType.Header)
            //{               
            //    CheckBox chkAll = (CheckBox)e.Row.FindControl("chkAll");
            //    chkAll.Attributes.Add("onclick", "javascript:fnDGSelectOrUnselectAll('" + grvRoleCode.ClientID + "',this,'chkSelRoleCode');");
            //}
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }
    //private void FunGetRoleSelectedDet()
    //{
    //    try
    //    {
    //        string strLocationID = string.Empty;
    //        string strRegionID = string.Empty;
    //        CheckBox chkRoleCode = null;
    //        string strRoleCenterID = string.Empty;
    //        foreach (GridViewRow grvData in grvRoleCode.Rows)
    //        {
    //            chkRoleCode = ((CheckBox)grvData.FindControl("chkSelRoleCode"));
    //            if (chkRoleCode.Checked)
    //            {
    //                strRoleCenterID = ((Label)grvData.FindControl("lblRoleCenterID")).Text;
    //                strbSelLOB.Append(strRoleCenterID + ",");
    //            }
    //        }
    //        if (strbSelLOB.Length > 0)
    //            strbSelLOB.Remove(strbSelRoleCode.Length - 1, 1);
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}


    private void FunGetLOBSelectedDet()
    {
        try
        {
            CheckBox chkLOB = null;
            string strLOBID = string.Empty;
            foreach (GridViewRow grvData in GrvLOBList.Rows)
            {
                chkLOB = ((CheckBox)grvData.FindControl("chkLOB"));
                if (chkLOB.Checked)
                {
                    strLOBID = ((Label)grvData.FindControl("lblLOB_ID")).Text;
                    strbSelLOB.Append(strLOBID + ",");
                }
            }
            if (strbSelLOB.Length > 0)
                strbSelLOB.Remove(strbSelLOB.Length - 1, 1);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    //private void FunGetUsersSelectedDet()
    //{
    //    try
    //    {
    //        string strLocationID = string.Empty;
    //        string strRegionID = string.Empty;
    //        CheckBox chkRoleCode = null;
    //        string strUserCenterID = string.Empty;
    //        foreach (GridViewRow grvData in GrvGrpList.Rows)
    //        {
    //            strUserCenterID = ((Label)grvData.FindControl("lblUser_GrpID")).Text;
    //            strbSelUsersList.Append(strUserCenterID + ",");
    //        }
    //        if (strbSelUsersList.Length > 0)
    //            strbSelUsersList.Remove(strbSelUsersList.Length - 1, 1);
    //    }
    //    catch (Exception ex)
    //    {
    //        ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
    //        throw ex;
    //    }
    //}

    protected void txtUserGroupName_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtUserGroupName.Text.Trim() != string.Empty)
            {
                //BindActiveUserList();
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "User Management");
        }
    }
    private void FungetLocationRoleLOB(int intLOB_ID)
    {
        try
        {
            Dictionary<string, string> objParameters = new Dictionary<string, string>();
            objParameters.Add("@Company_ID", intCompanyID.ToString());
            objParameters.Add("@User_ID", intCreatedBy.ToString());
            objParameters.Add("@Mode_Code", strMode);
            if (intLOB_ID > 0)
            {
                objParameters.Add("@LOB_ID", Convert.ToString(intLOB_ID));
            }
            objParameters.Add("@Program_ID", "524");
            objParameters.Add("@ROLEMST_ID", Convert.ToString(intUserGroupId));
            DataTable dtRoleCode = Utility.GetDefaultData("S3G_SYSAD_GET_USERROLEDET", objParameters);
            grvRoleCode.DataSource = dtRoleCode;
            grvRoleCode.DataBind();
            //byteBranchRoleDetails = objUserManagementClient.FunPubQueryUserLocationDetails(intCompanyID, intUserId, intLOB_ID, strMode);
            //dtBranch = (DataTable)ClsPubSerialize.DeSerialize(byteBranchRoleDetails, SerializationMode.Binary, typeof(DataTable));
            //ViewState["Locationss"] = dtBranch;
            //FunPriCheckLocation();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
        finally
        {
            if (objUserManagementClient != null)
                objUserManagementClient.Close();
        }

    }
    protected void chkSelRoleCode_CheckedChanged(object sender, EventArgs e)
    {
        try
        {
            string strFieldAtt = ((CheckBox)sender).ClientID;
            int gRowIndex = Utility.FunPubGetGridRowID("grvRoleCode", strFieldAtt);
            CheckBox chkAdd = (CheckBox)grvRoleCode.Rows[gRowIndex].FindControl("chkAdd");
            CheckBox chkModify = (CheckBox)grvRoleCode.Rows[gRowIndex].FindControl("chkModify");
            CheckBox chkDelete = (CheckBox)grvRoleCode.Rows[gRowIndex].FindControl("chkDelete");
            CheckBox chkView = (CheckBox)grvRoleCode.Rows[gRowIndex].FindControl("chkView");
            if (((CheckBox)sender).Checked)
            {
                chkAdd.Checked = chkModify.Checked = chkDelete.Checked = chkView.Checked = true;
            }
            else
            {
                chkAdd.Checked = chkModify.Checked = chkDelete.Checked = chkView.Checked = false;
            }
            ((CheckBox)sender).Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    //private void BindActiveUserList()
    //{
    //    try
    //    {
    //        Dictionary<string, string> objParameters = new Dictionary<string, string>();
    //        objParameters.Add("@Company_ID", intCompanyID.ToString());
    //        objParameters.Add("@User_ID", intCreatedBy.ToString());
    //        objParameters.Add("@Program_ID", "323");
    //        DataTable dtRoleCode = Utility.GetDefaultData("S3G_SA_GET_ACTIVEUSRLIST", objParameters);
    //        if (dtRoleCode.Rows.Count > 0)
    //        {
    //            GrvUserList.DataSource = dtRoleCode;
    //            GrvUserList.DataBind();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        CVUsermanagement.ErrorMessage = ex.Message;
    //        CVUsermanagement.IsValid = false;
    //    }
    //}

    //private void BindActiveGroupUserList()
    //{
    //    try
    //    {
    //        Dictionary<string, string> objParameters = new Dictionary<string, string>();
    //        objParameters.Add("@Company_ID", intCompanyID.ToString());
    //        objParameters.Add("@User_ID", intCreatedBy.ToString());
    //        objParameters.Add("@Program_ID", "323");
    //        DataTable dtRoleCode = Utility.GetDefaultData("S3G_SA_GET_ACTIVEUSRLIST", objParameters);
    //        if (dtRoleCode.Rows.Count > 0)
    //        {
    //            GrvGrpList.DataSource = dtRoleCode;
    //            GrvGrpList.DataBind();
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        CVUsermanagement.ErrorMessage = ex.Message;
    //        CVUsermanagement.IsValid = false;
    //    }
    //}
    /// <summary>
    /// Redirect the LOB Master View Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/System Admin/S3GSysAdminRoleMst_View.aspx");
    }
    #region ValueDisable
    /// <summary>
    /// Disable Controls based on the User Roles
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode                
                txtUserGroupCode.Enabled = true;
                txtUserGroupName.Enabled = true;
                chkActive.Checked = true;
                btnClear.Enabled_True();
                chkActive.Enabled = false;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                //FunPriBindGrpUsers("C");
                break;
            case 1: // Modify Mode
                if (!bModify)
                {
                    btnSave.Enabled_False();
                }
                FunPriGetLOBDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                txtUserGroupCode.ReadOnly = true;
                txtUserGroupName.ReadOnly = false;
                btnClear.Enabled_False();
                chkActive.Enabled = true;
                break;
            case -1:// Query Mode
                FunPriGetLOBDetails();
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                txtUserGroupCode.ReadOnly = true;
                txtUserGroupName.ReadOnly = txtGroupEmail.ReadOnly = true;
                btnSave.Enabled_False();
                btnClear.Enabled_False();
                chkActive.Enabled = false;
                grvRoleCode.Enabled = false;
                GrvLOBList.Enabled = false;
                //btnAdd.Enabled = false;
                //btnRemove.Enabled = false;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                break;
        }
    }
    #endregion
}