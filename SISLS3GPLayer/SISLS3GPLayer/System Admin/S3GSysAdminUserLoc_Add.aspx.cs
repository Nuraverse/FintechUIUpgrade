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

public partial class System_Admin_S3GSysAdminUserLoc_Add : ApplyThemeForProject
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
    UserMgtServices.S3G_SYSAD_UserLocMapDataTable ObjS3G_SYSAD_UserLocMapDataTable = new UserMgtServices.S3G_SYSAD_UserLocMapDataTable();
    UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable ObjS3G_SYSAD_UserMasterDataTable = new UserMgtServices.S3G_SYSAD_UserMaster_ListDataTable();
    SerializationMode SerMode = SerializationMode.Binary;

    string strRedirectPage = "../System Admin/S3GSysAdminRoleMst_View.aspx";
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
                FunPriloadLocationTreeview();
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
                    FunPriDisableControls(0);
                }
                #endregion MakerChecker
                txtUserGroupName.Focus();
            }
            treeview.Attributes.Add("onclick", "postBackByObject()");
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void treeview_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (strMode == "Q")
            {
                treeview.ExpandAll();
                treeview.Enabled = false; //Bug Fixing on 09/01/2013
                FunPriCheckLocation();
            }
            else
            {
                treeview.Enabled = true;
                treeview.CollapseAll();
                FunPriCheckLocation();
            }
        }
        else
        {
            treeview.ExpandAll();
        }
    }
    private void FunPriCheckLocation()
    {
        foreach (TreeNode treeviewnode in treeview.Nodes)
        {
            if (ViewState["Locationss"] != null)
                FunNodeCheckMod(treeviewnode, (DataTable)ViewState["Locationss"]); //to check locations in Treeview
        }
    }
    private void FunNodeCheckMod(TreeNode e, DataTable dtLocation)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {

                foreach (DataRow dr in dtLocation.Rows)
                {
                    if (dr["Location_Id"].ToString() == e.ChildNodes[i].Value)
                        e.ChildNodes[i].Checked = true;

                }
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeCheckMod(e.ChildNodes[i], dtLocation);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    private void FunNodeCheckChildnode(TreeNode e)
    {
        try
        {
            for (int i = 0; i < e.ChildNodes.Count; i++)
            {
                e.ChildNodes[i].Checked = e.Checked;
                if (e.ChildNodes[i].ChildNodes.Count > 0)
                    FunNodeCheckChildnode(e.ChildNodes[i]);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
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
            grvUsers.FooterRow.Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Location User");
        }
    }
    private void FunPriloadLocationTreeview()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            DataSet ds = new DataSet();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            ds = Utility.GetDataset("S3G_SYSAD_GETLOCATIONTREEVIEW", Procparam);
            ds.DataSetName = "Menus";
            ds.Tables[0].TableName = "Menu";
            DataRelation relation = new DataRelation("ParentChild",
            ds.Tables[0].Columns["Location_ID"],
            ds.Tables[0].Columns["pid"], true);
            relation.Nested = true;
            ds.Relations.Add(relation);
            XmlDataSource1.Data = ds.GetXml();
            XmlDataSource1.DataBind();

        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }


    //
    protected void treeview_OnTreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    {
        try
        {
            FunNodeCheckChildnode(e.Node);
            treeview.Focus();
        }
        catch (Exception ex)
        {
            CVUsermanagement.ErrorMessage = ex.Message;
            CVUsermanagement.IsValid = false;
        }
    }
    /// <summary>
    /// Get LineofBusiness Details
    /// </summary>
    private void FunPriGetLOBDetails()
    {
        try
        {
            txtUserGroupName.Text = string.Empty;
            hdnID.Value = string.Empty;
            //chkActive.Checked = true;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@UserLocMap_ID", Convert.ToString(intUserGroupId));
            DataSet dsGroupdtl = Utility.GetDataset("S3G_SYSAD_GET_LOCAUSERDTL", Procparam);
            if (dsGroupdtl.Tables[0].Rows.Count > 0)
            {
                txtUserGroupName.Text = Convert.ToString(dsGroupdtl.Tables[0].Rows[0]["USERLOCMAP_NAME"]);
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
                    ViewState["Locationss"] = dsGroupdtl.Tables[1];
                    FunPriCheckLocation();
                }
                if (dsGroupdtl.Tables[2].Rows.Count > 0)
                {
                    ViewState["UserDetails"] = dsGroupdtl.Tables[2];
                    grvUsers.DataSource = dsGroupdtl.Tables[2];
                    grvUsers.DataBind();
                }
                //if (dsGroupdtl.Tables[2].Rows.Count > 0)
                //{
                //    grvRoleCode.DataSource = dsGroupdtl.Tables[2];
                //    grvRoleCode.DataBind();
                //}
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
        string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminUserLoc_View.aspx';";
        string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminUserLoc_Add.aspx';";
        //if (GrvGrpList.Rows.Count == 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Atleast add one record in Group User List");
        //    return;
        //}
        int rowCountCheck = 0;
        bool istreechecked = false;
        foreach (TreeNode node in treeview.CheckedNodes)
        {
            istreechecked = true;
        }
        if (!istreechecked)
        {
            Utility.FunShowAlertMsg(this.Page, "Select atleast one Location");
            return;
        }
        if (((DataTable)ViewState["UserDetails"]).Rows.Count == 0)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one record in User Filter");
            return;
        }

        try
        {
            UserMgtServices.S3G_SYSAD_UserLocMapRow ObjUserGroupRow;
            ObjUserGroupRow = ObjS3G_SYSAD_UserLocMapDataTable.NewS3G_SYSAD_UserLocMapRow();
            ObjUserGroupRow.Company_ID = intCompanyID;
            ObjUserGroupRow.UserLocMap_ID = intUserGroupId;
            ObjUserGroupRow.UserLocMap_Name = txtUserGroupName.Text.Trim();
            ObjUserGroupRow.IS_ACTIVE = Convert.ToInt32(chkActive.Checked);
            ObjUserGroupRow.Created_By = intCreatedBy;
            FunGetBranchSelectedDet();
            ObjUserGroupRow.XMLUserLoc = Convert.ToString(strbSelLocation).Trim();
            ObjUserGroupRow.XMLUserList = ((DataTable)ViewState["UserDetails"]).FunPubFormXml();
            ObjS3G_SYSAD_UserLocMapDataTable.AddS3G_SYSAD_UserLocMapRow(ObjUserGroupRow);
            SerializationMode SerMode = SerializationMode.Binary;
            intErrCode = objUserManagementClient.FunPubCreateLocationGroup(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_UserLocMapDataTable, SerMode));
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
                    strAlert = strAlert.Replace("__ALERT__", "Location User details updated successfully");//Group
                }
                else
                {
                    btnSave.Enabled_False();
                    strAlert = "Location User details added successfully";
                    strAlert += @"\n\nWould you like to add one more record?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                }
            }
            else if (intErrCode == 1)
            {
                strAlert = strAlert.Replace("__ALERT__", "Location Group Name already exists in the system. Kindly enter a new Location Group Name");
                strRedirectPageView = "";
            }
            else if (intErrCode == 2)
            {
                strAlert = strAlert.Replace("__ALERT__", "Already Location Group  assigned in User Management");
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
        if (intLOBID == 0)
        {
            txtUserGroupName.Text = String.Empty;
            FunPubBindUsersGrid();
            FunPriloadLocationTreeview();
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


    private void FunGetBranchSelectedDet()
    {
        try
        {
            CheckBox chkBranch = null;
            string strLocationID = string.Empty;
            string strRegionID = string.Empty;

            strbSelLocation.Append("<Root>");
            foreach (TreeNode node in treeview.CheckedNodes)
            {
                strLocationID = node.Value;
                strbSelLocation.Append(" <Details Location_ID='" + strLocationID + "' /> ");
            }
            strbSelLocation.Append("</Root>");
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

    /// <summary>
    /// Redirect the LOB Master View Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/System Admin/S3GSysAdminUserLoc_View.aspx");
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
                FunPriGetLOBDetails();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                //txtUserGroupName.ReadOnly = true;
                btnClear.Enabled_False();
                chkActive.Enabled = true;
                break;
            case -1:// Query Mode
                FunPriGetLOBDetails();
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView);
                }
                txtUserGroupName.ReadOnly = true;
                btnSave.Enabled_False();
                btnClear.Enabled_False();
                chkActive.Enabled = false;
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                grvUsers.FooterRow.Visible = false;
                grvUsers.Columns[grvUsers.Columns.Count - 1].Visible = false;
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
    protected void grvUsers_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddNew")
            {
                TextBox txtFUserName = (TextBox)grvUsers.FooterRow.FindControl("txtFUserName");
                Label lblSNO = (Label)grvUsers.FindControl("lblSNO");
                DataRow dr = null;
                DataTable dtUsers = (DataTable)ViewState["UserDetails"];
                if (txtFUserName.Text == string.Empty || hdnUserID.Value ==string.Empty)
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

                dr = dtUsers.NewRow();
                dr["SNO"] = dtUsers.Rows.Count + 1;
                dr["USER_ID"] = hdnUserID.Value;
                dr["USER_NAME"] = txtFUserName.Text.Trim();
                dtUsers.Rows.Add(dr);
                grvUsers.DataSource = dtUsers;
                grvUsers.DataBind();
                ViewState["UserDetails"] = dtUsers;
                hdnUserID.Value = string.Empty;
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

    protected void grvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {            
            DataTable dtEditApprDet = (DataTable)ViewState["UserDetails"];
            if (dtEditApprDet.Rows.Count > 0)
            {
                dtEditApprDet.Rows.RemoveAt(e.RowIndex);
            }
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
            TextBox txtFUserName = (TextBox)grvUsers.FooterRow.FindControl("txtFUserName");
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

    #endregion

    [System.Web.Services.WebMethod]
    public static string[] GetUserList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@Program_Id", "525");
        Procparam.Add("@PrefixText", prefixText.Trim());
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_OR_GET_LOAD_USER_LIST", Procparam));
        return suggetions.ToArray();
    }
}