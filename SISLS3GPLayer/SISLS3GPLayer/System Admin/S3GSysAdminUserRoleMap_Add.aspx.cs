/// Module Name     :   System Admin
/// Screen Name     :   S3GSysAdminUserLoc_Add.aspx
/// Created By      :   Anbuvel T
/// Created Date    :   08-MAY-2018
/// Purpose         :   To insert and update Location user details

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

public partial class System_Admin_S3GSysAdminUserRoleMap_Add : ApplyThemeForProject
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
    UserMgtServices.S3G_SYSAD_UserRoleMapMstDataTable ObjS3G_SYSAD_UserRoleMapMstDataTable = new UserMgtServices.S3G_SYSAD_UserRoleMapMstDataTable();
    UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable ObjS3G_SYSAD_UserMasterDataTable = new UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable();
    SerializationMode SerMode = SerializationMode.Binary;

    string strRedirectPage = "../System Admin/S3GSysAdminUserRoleMap_View.aspx";
    string strRegionDet = "<Root><Details Region_ID='0' /></Root>";
    DataTable dtRoleAccess = null;
    int intCompanyID = 0;
    string strModeCode = string.Empty;
    Dictionary<string, string> Procparam = null;
    StringBuilder strbSelLocation = new StringBuilder();
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
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminUserLoc_Add.aspx';";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminUserLoc_View.aspx';";
    static string strPageName = "User Role Mapping";
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
    int ProgramID = 526;
    public static System_Admin_S3GSysAdminUserRoleMap_Add obj_Page;
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            obj_Page = this;
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
            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();
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
                FunPubBindUsersGrid();
                FunPubBindRolesGrid();
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

    private void BindActiveLOBList()
    {
        try
        {
            Dictionary<string, string> objParameters = new Dictionary<string, string>();
            objParameters.Add("@Company_ID", intCompanyID.ToString());
            objParameters.Add("@User_ID", intCreatedBy.ToString());
            objParameters.Add("@Option", "2");
            objParameters.Add("@Program_ID", Convert.ToString(ProgramID));
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

    protected void txtFRoleName_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtFRoleName = (TextBox)grvUsers.FooterRow.FindControl("txtFRoleName");
            string strhdnValue = hdnRoleID.Value;
            if (strhdnValue == "-1" || strhdnValue == "" || strhdnValue.Trim() == string.Empty)
            {
                txtFRoleName.Text = string.Empty;
                hdnRoleID.Value = string.Empty;
                txtFRoleName.Focus();
                return;
            }
            txtFRoleName.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Location User");
        }
    }

    /// <summary>
    /// Get LineofBusiness Details
    /// </summary>
    private void FunPriGetViewDetails()
    {
        try
        {
            txtUserGroupName.Text = string.Empty;
            hdnID.Value = string.Empty;
            //chkActive.Checked = true;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@USERROLEMAPMST_ID", Convert.ToString(intUserGroupId));
            DataSet dsGroupdtl = Utility.GetDataset("S3G_SYSAD_GET_ROLEUSERMAPDTL", Procparam);
            if (dsGroupdtl.Tables[0].Rows.Count > 0)
            {
                txtUserGroupName.Text = Convert.ToString(dsGroupdtl.Tables[0].Rows[0]["USERROLE_NAME"]);
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
                    grvUsers.DataSource = dsGroupdtl.Tables[2];
                    grvUsers.DataBind();
                    ViewState["UserDetails"] = dsGroupdtl.Tables[2];
                }
                if (dsGroupdtl.Tables[3].Rows.Count > 0)
                {
                    grvRoles.DataSource = dsGroupdtl.Tables[3];
                    grvRoles.DataBind();
                    ViewState["RoleDetails"] = dsGroupdtl.Tables[3];
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
        string strKey = "Insert";
        string strAlert = "alert('__ALERT__');";
        string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminUserRoleMap_View.aspx';";
        string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminUserRoleMap_Add.aspx';";
        //if (GrvGrpList.Rows.Count == 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Atleast add one record in Group User List");
        //    return;
        //}
        int rowCountCheck = 0;
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
            Utility.FunShowAlertMsg(this, "Choose atleast one Line of Business");
            return;
        }
        if (((DataTable)ViewState["RoleDetails"]).Rows.Count == 0)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one record in Roles Filter");
            return;
        }
        if (((DataTable)ViewState["UserDetails"]).Rows.Count == 0)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one record in User Filter");
            return;
        }
        try
        {
            UserMgtServices.S3G_SYSAD_UserRoleMapMstRow ObjUserGroupRow;
            ObjUserGroupRow = ObjS3G_SYSAD_UserRoleMapMstDataTable.NewS3G_SYSAD_UserRoleMapMstRow();
            ObjUserGroupRow.Company_ID = intCompanyID;
            ObjUserGroupRow.UserRoleMapMST_ID = intUserGroupId;
            ObjUserGroupRow.UserRole_Name = txtUserGroupName.Text.Trim();
            ObjUserGroupRow.IS_ACTIVE = Convert.ToInt32(chkActive.Checked);
            ObjUserGroupRow.Created_By = intCreatedBy;
            FunGetLOBSelectedDet();
            ObjUserGroupRow.XMLUserRoles = ((DataTable)ViewState["RoleDetails"]).FunPubFormXml();
            ObjUserGroupRow.XMLUserList = ((DataTable)ViewState["UserDetails"]).FunPubFormXml();
            ObjUserGroupRow.XMLUserLobs = Convert.ToString(strbSelLOB).Trim();
            ObjS3G_SYSAD_UserRoleMapMstDataTable.AddS3G_SYSAD_UserRoleMapMstRow(ObjUserGroupRow);
            SerializationMode SerMode = SerializationMode.Binary;

            intErrCode = objUserManagementClient.FunPubCreateUserRoleMap(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_UserRoleMapMstDataTable, SerMode));// objUserManagementClient.FunPubCreateUserRoleMap(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_UserRoleMapMstDataTable, SerMode));
            if (intErrCode == 10)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert(' The Entered Role Map Name is already exist ');", true);
                return;
            }
            if (intErrCode == 0)
            {
                if (intUserGroupId > 0)
                {
                    btnSave.Enabled_False();
                    strKey = "Modify";
                    strAlert = strAlert.Replace("__ALERT__", "User Role Mapping details updated successfully");//Group
                }
                else
                {
                    btnSave.Enabled_False();
                    strAlert = "User Role Mapping details added successfully";
                    strAlert += @"\n\nWould you like to add one more record?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                }
            }
            else if (intErrCode == 1)
            {
                strAlert = strAlert.Replace("__ALERT__", "Role Map Name already exists in the system. Kindly enter a new Role Map Name");
                strRedirectPageView = "";
            }
            else if (intErrCode == 2)
            {
                strAlert = strAlert.Replace("__ALERT__", "Already Location User assigned in User Management");
                strRedirectPageView = "";
            }
            else
            {
                strAlert = strAlert.Replace("__ALERT__", "Error in Saving Details");
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


    /// <summary>
    /// Clears all the record on confirmation 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            txtUserGroupName.Text = string.Empty;
            FunPubBindUsersGrid();
            FunPubBindRolesGrid();
            BindActiveLOBList();
            txtUserGroupName.Focus();
        }
        catch(Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
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

    protected void txtFUserName_OnTextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txtFUserName = (TextBox)grvUsers.FooterRow.FindControl("txtFUserName");
            string strhdnValue = hdnUserID.Value;
            if (strhdnValue == "-1" || strhdnValue == "" || strhdnValue.Trim() == string.Empty)
            {
                txtFUserName.Text = string.Empty;
                hdnUserID.Value = string.Empty;
                txtFUserName.Focus();
                return;
            }
            txtFUserName.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Location User");
        }
    }

    protected void chkLOB_OnCheckedChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox chkLOB = (CheckBox)sender;
            string strFieldAtt = ((CheckBox)sender).ClientID;
            string strVal = strFieldAtt.Substring(strFieldAtt.LastIndexOf("GrvLOBList_")).Replace("GrvLOBList_ctl", "");
            int gRowIndex = Convert.ToInt32(strVal.Substring(0, strVal.LastIndexOf("_")));
            gRowIndex = gRowIndex - 2;
            if (((CheckBox)sender).Checked)
            {
                Label lblLOB_ID = (Label)GrvLOBList.Rows[gRowIndex].FindControl("lblLOB_ID");
                int intLOB_ID = 0;
                intLOB_ID = Convert.ToInt32(lblLOB_ID.Text.Trim());

            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
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

    /// <summary>
    /// Redirect the LOB Master View Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/System Admin/S3GSysAdminUserRoleMap_View.aspx");
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
                FunPriGetViewDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                txtUserGroupName.ReadOnly = true;
                btnClear.Enabled_False();
                chkActive.Enabled = true;
                break;
            case -1:// Query Mode
                FunPriGetViewDetails();
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                txtUserGroupName.ReadOnly = true;
                btnSave.Enabled_False();
                btnClear.Enabled_False();
                chkActive.Enabled = false;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                grvRoles.FooterRow.Visible = false;
                grvUsers.FooterRow.Visible = false;
                grvUsers.Columns[grvUsers.Columns.Count - 1].Visible = false;
                grvRoles.Columns[grvRoles.Columns.Count - 1].Visible = false;
                break;
        }
    }
    public bool FunPubCheckDupUsers(string strMOOfficer)
    {
        bool IsDuplicateCasfFlow = false;
        try
        {

            if (ViewState["UserDetails"] != null)
            {
                DataRow[] dr = ((DataTable)ViewState["UserDetails"]).Select("USER_ID='" + strMOOfficer + "'");
                if (dr.Length > 0)
                    IsDuplicateCasfFlow = true;
                else
                    IsDuplicateCasfFlow = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }
        return IsDuplicateCasfFlow;
    }

    public bool FunPubCheckDupRoles(string strMOOfficer)
    {
        bool IsDuplicateCasfFlow = false;
        try
        {

            if (ViewState["RoleDetails"] != null)
            {
                DataRow[] dr = ((DataTable)ViewState["RoleDetails"]).Select("ROLEMASTER_ID='" + strMOOfficer + "'");
                if (dr.Length > 0)
                    IsDuplicateCasfFlow = true;
                else
                    IsDuplicateCasfFlow = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {

        }
        return IsDuplicateCasfFlow;
    }

    protected void grvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        try
        {
            TextBox txtFUserName = (TextBox)grvUsers.FooterRow.FindControl("txtFUserName");
            Label lblSNO = (Label)grvUsers.FindControl("lblSNO");
            DataRow dr = null;
            DataTable dtUsers = (DataTable)ViewState["UserDetails"];

            if (e.CommandName == "AddNew")
            {
                if (txtFUserName.Text == string.Empty || hdnUserID.Value == string.Empty || hdnUserID.Value == "0" || hdnUserID.Value == "-1")
                {
                    txtFUserName.Focus();
                    Utility.FunShowAlertMsg(this, "Enter the User Name");
                    return;
                }
                if (FunPubCheckDupUsers(hdnUserID.Value))
                {
                    Utility.FunShowAlertMsg(this, "Selected Combination Already Exists");
                    return;
                }
                // Created By : Anbuvel.T, Date : 03-11-2018, Description : To Check the users already role has been Assigned
                //if (FunPriValidateUsersDet(hdnUserID.Value))
                //{
                //    txtFUserName.Focus();
                //    return;
                //}

                dr = dtUsers.NewRow();
                dr["SNO"] = dtUsers.Rows.Count + 1;
                dr["USER_ID"] = hdnUserID.Value;
                dr["USER_NAME"] = txtFUserName.Text.Trim();
                dtUsers.Rows.Add(dr);
                grvUsers.DataSource = dtUsers;
                grvUsers.DataBind();
                ViewState["UserDetails"] = dtUsers;
                hdnUserID.Value = string.Empty;
                hdnRoleID.Value = string.Empty;
                grvUsers.FooterRow.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {
        }
    }

    protected void grvRoles_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        try
        {
            TextBox txtFRoleName = (TextBox)grvRoles.FooterRow.FindControl("txtFRoleName");
            Label lblSNO = (Label)grvRoles.FindControl("lblSNO");
            DataRow dr = null;
            DataTable dtRoles = (DataTable)ViewState["RoleDetails"];

            if (e.CommandName == "AddNew")
            {
                if (txtFRoleName.Text == string.Empty || hdnRoleID.Value == string.Empty || hdnRoleID.Value == "0" || hdnRoleID.Value == "-1")
                {
                    txtFRoleName.Focus();
                    Utility.FunShowAlertMsg(this, "Select the Role Name");
                    return;
                }
                if (FunPubCheckDupRoles(hdnRoleID.Value))
                {
                    Utility.FunShowAlertMsg(this, "Selected Combination Already Exists");
                    return;
                }
                dr = dtRoles.NewRow();
                dr["SNO"] = dtRoles.Rows.Count + 1;
                dr["ROLEMASTER_ID"] = hdnRoleID.Value;
                dr["ROLE_NAME"] = txtFRoleName.Text.Trim();
                dtRoles.Rows.Add(dr);
                grvRoles.DataSource = dtRoles;
                grvRoles.DataBind();
                ViewState["RoleDetails"] = dtRoles;
                hdnUserID.Value = string.Empty;
                hdnRoleID.Value = string.Empty;
                grvRoles.FooterRow.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
        }
        finally
        {
        }
    }
    protected void grvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {         
            DataTable dtEditApprDet = (DataTable)ViewState["UserDetails"];
            dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            if (dtEditApprDet.Rows.Count > 0)
            {
                grvUsers.DataSource = dtEditApprDet;
                grvUsers.DataBind();
                ViewState["UserDetails"] = dtEditApprDet;
            }
            else
            {
                FunPubBindUsersGrid();
            }
            hdnUserID.Value = string.Empty;
            grvUsers.FooterRow.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }

    }

    protected void grvRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {            
            DataTable dtEditApprDet = (DataTable)ViewState["RoleDetails"];
            dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            if (dtEditApprDet.Rows.Count > 0)
            {
                grvRoles.DataSource = dtEditApprDet;
                grvRoles.DataBind();
                ViewState["RoleDetails"] = dtEditApprDet;
            }
            else
            {
                FunPubBindRolesGrid();
            }
            hdnUserID.Value = string.Empty;
            hdnRoleID.Value = string.Empty;
            grvRoles.FooterRow.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }

    }

    private void FunPubBindUsersGrid()
    {
        try
        {
            DataTable dtUsers = new DataTable();
            DataRow dr;
            dtUsers.Columns.Add("SNO");
            dtUsers.Columns.Add("USER_ID");
            dtUsers.Columns.Add("USER_NAME");
            dr = dtUsers.NewRow();
            dtUsers.Rows.Add(dr);
            grvUsers.DataSource = dtUsers;
            grvUsers.DataBind();
            dtUsers.Rows[0].Delete();
            ViewState["UserDetails"] = dtUsers;
            grvUsers.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }

    private void FunPubBindRolesGrid()
    {
        try
        {
            DataTable dtRoles = new DataTable();
            DataRow dr;
            dtRoles.Columns.Add("SNO");
            dtRoles.Columns.Add("ROLEMASTER_ID");
            dtRoles.Columns.Add("ROLE_NAME");
            dr = dtRoles.NewRow();
            dtRoles.Rows.Add(dr);
            grvRoles.DataSource = dtRoles;
            grvRoles.DataBind();
            dtRoles.Rows[0].Delete();
            ViewState["RoleDetails"] = dtRoles;
            grvRoles.Rows[0].Visible = false;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);

        }
        finally
        {
        }
    }

    private void FunGetLOBSelectedDet()
    {
        try
        {
            CheckBox chkLOB = null;
            string strLOBID = string.Empty;
            strbSelLOB.Clear();
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

    private bool FunPriValidateUsersDet(string strUserID)
    {
        bool blnIsDuplicate = false;
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@USER_ID", strUserID);
            DataTable dtdedupCheck = Utility.GetDefaultData("S3G_SYSAD_CHK_USERROLES_DTL", Procparam);
            if (Convert.ToInt32(dtdedupCheck.Rows[0]["CHK_USER_ASSIGN"]) > 0)
            {
                if (Convert.ToInt32(dtdedupCheck.Rows[0]["CHK_USER_ASSIGN"]) == 1)
                {
                    Utility.FunShowAlertMsg(this, "User Roles already assigned in User Manamgement.");
                    return true;
                }
                blnIsDuplicate = false;
            }
            else
            {
                blnIsDuplicate = false;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw new ApplicationException("Unable to Validate Duplicate Documents");
        }
        return blnIsDuplicate;
    }

    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetUserList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@Program_Id", "526");
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_LOAD_USER_LIST", Procparam));
        return suggetions.ToArray();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetRoleList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@Program_Id", "526");
        Procparam.Add("@LoadOption", "2");
        obj_Page.FunGetLOBSelectedDet();
        Procparam.Add("@XMLUserLOB", Convert.ToString(obj_Page.strbSelLOB).Trim());
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_LOAD_USER_LIST", Procparam));
        return suggetions.ToArray();
    }
}