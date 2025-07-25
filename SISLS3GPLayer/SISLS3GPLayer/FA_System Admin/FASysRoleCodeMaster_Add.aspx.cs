/// Module Name          :   System Admin
/// Screen Name          :   FA_SYS_RoleCodeMaster_Add
/// Created By           :   MANIKANDAN.R
/// Created Date         :   17- JAN - 2012
/// Purpose              :   To insert and update Role Center master details
/// Last updated By      :   
/// Last updated Date    :   
/// Purpose              :   
#region Namespaces
using System;
using System.Globalization;
using System.Resources;
using System.Collections.Generic;
using System.Web.UI;
using System.ServiceModel;
using System.Data;
using System.Text;
using FA_BusEntity;
using FA_BusEntity.SysAdmin;
using System.Collections;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Security;
using System.Configuration;
#endregion

public partial class Sysadm_FASysRoleCodeMaster_Add : ApplyThemeForProject_FA
{
    #region Initialization
    int intErrCode = 0;
    int intRoleCodeId = 0;
    int intCompanyID = 0;
    int intUserID = 0;
    string strMode = string.Empty;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    FASerializationMode SerMode = FASerializationMode.Binary;

    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient ObjRoleCenterMasterClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable objRCMDataTable = null;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterRow ObjRoleCodeMasterRow;

    Dictionary<string, string> Procparam = null;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "../FA_System Admin/FASysRoleCodeMaster_View.aspx";
    string strRedirectPageView = "window.location.href='../FA_System Admin/FASysRoleCodeMaster_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../FA_System Admin/FASysRoleCodeMaster_Add.aspx';";
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession ObjFASession = new FASession();
    string strConnectionName = "";
    #endregion




    protected void Page_Load(object sender, EventArgs e)
    {
        FunPubPageLoad();
    }

   
    #region Role Center Functions
    /// <summary>
    /// Page Loading
    /// </summary>
    private void FunPubPageLoad()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            if (Request.QueryString["qsRCId"] != null)
            {
                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsRCId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intRoleCodeId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }

            }
            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            strConnectionName = ObjFASession.ProConnectionName;

            if (!IsPostBack)
            {

                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (((intRoleCodeId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);

                }
                else if (((intRoleCodeId > 0)) && (strMode == "Q"))
                {

                    FunPriDisableControls(-1);
                }
                else
                {
                    FunPriDisableControls(0);
                }
            }
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }
    #region Function for Disable Controls
    /// <summary>
    /// Access Rights
    /// </summary>
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                        btnSave.Enabled_False();
                    }
                    FunPubLoadProgramDropDownList();
                    chkActive.Enabled = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        btnSave.Enabled_False();
                    }
                    FunPubLoadProgramDropDownList();
                    FunGetRoleCenterMasterDetails();
                    ddlProgram.Enabled = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    btnClear.Enabled_False();
                    break;

                case -1:// Query Mode

                    FunGetRoleCenterMasterDetails();
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }
                    FunPubLoadProgramDropDownList();
                    btnClear.Enabled_False();
                    btnSave.Enabled_False();
                    chkActive.Enabled = false;
                    ddlProgram.Enabled = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    if (bClearList)
                    {
                      
                    }                    
                    txtRoleCode.Enabled = true;
                    break;
            }
        }
        catch (Exception ae)
        {
            throw ae;
        }
    }
    #endregion
    #region To Load Drop Down
  
    // Loading Program Drop Down
    void FunPubLoadProgramDropDownList()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Program_ID", "0".ToString());
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            ddlProgram.BindDataTable_FA(SPNames.Get_Programs, Procparam, new string[] { "Program_ID", "Program_Name" });
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
  
    }
  
    //Fetching Role Center Master Details for Modify Mode
    private void FunGetRoleCenterMasterDetails()
    {
        
        try
        {
           
            if (intRoleCodeId > 0)
            {
                Dictionary<string, string> Procparam = new Dictionary<string, string>();
                Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
                Procparam.Add("@Role_Code_ID", Convert.ToString(intRoleCodeId));
                DataTable dtRCM = Utility_FA.GetDefaultData(SPNames.Get_RCM, Procparam);
                if (dtRCM.Rows.Count > 0)
                {
                    DataRow dtRow = dtRCM.Rows[0];
                    ddlProgram.SelectedValue = dtRow["PROGRAM_ID"].ToString();
                    txtRoleCode.Text = dtRow["ROLE_CODE"].ToString();
                    if (dtRow["Active"].ToString() == "True")
                    {
                        chkActive.Checked = true;
                    }
                    else
                    {
                        chkActive.Checked = false;
                    }
                   
                    ddlProgram.Enabled = false;
                    txtRoleCode.Enabled = false;
                }
            }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "User does not have rights to the Role Code");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }

            }
        
        catch (Exception ae)
        {
            lblErrorMessage.Text = ae.Message;
               FAClsPubCommErrorLog.CustomErrorRoutine(ae);
            throw ae;
        }
    }
    #endregion
    #region To Save Role Center Master
    void FunSaveRoleCenterMaater()
    {
        
        ObjRoleCenterMasterClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {

            objRCMDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterDataTable();
            FA_BusEntity.SysAdmin.SystemAdmin.FA_SYS_RoleCodeMasterRow ObjRoleCodeMasterRow;
            ObjRoleCodeMasterRow = objRCMDataTable.NewFA_SYS_RoleCodeMasterRow();
            ObjRoleCodeMasterRow.Role_Code_ID = intRoleCodeId;
           
            ObjRoleCodeMasterRow.Company_ID = intCompanyID.ToString();
            ObjRoleCodeMasterRow.Program_ID = Convert.ToInt32(ddlProgram.SelectedValue);
            ObjRoleCodeMasterRow.Role_Code = txtRoleCode.Text.Trim().Split(new char[] { '-' }).GetValue(0).ToString();
            if (chkActive.Checked)
                ObjRoleCodeMasterRow.Is_Active = true;
            else
                ObjRoleCodeMasterRow.Is_Active = false; ;
            ObjRoleCodeMasterRow.Created_By = intUserID;
            ObjRoleCodeMasterRow.Modified_By = intUserID;
            ObjRoleCodeMasterRow.Txn_Date = DateTime.Now;
            ObjRoleCodeMasterRow.Txn_ID = 0;
            objRCMDataTable.AddFA_SYS_RoleCodeMasterRow(ObjRoleCodeMasterRow);
            FASerializationMode SerMode = FASerializationMode.Binary;
            if (intRoleCodeId > 0)
            {
                intErrCode = ObjRoleCenterMasterClient.FunPubModifyRoleCodeMaster(SerMode, FAClsPubSerialize.Serialize(objRCMDataTable, SerMode), strConnectionName);
            }
            else
            {
                intErrCode = ObjRoleCenterMasterClient.FunRoleCodeMasterInsertInt(SerMode, FAClsPubSerialize.Serialize(objRCMDataTable, SerMode), strConnectionName);
            }
            if (intErrCode == 0)
            {
               // ddlProgram.SelectedIndex = 0;
               // txtRoleCode.Text = string.Empty;
            }
            if (intErrCode == 410)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Role code already exists');", true);

            else if (intErrCode == 411)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Role Center details already exists');", true);
            else if (intErrCode == 50)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('The Entered Role center details added failt');", true);
            else
            {
                if (intRoleCodeId > 0)
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Insert", "alert('Role center details updated successfully');window.location.href='../System Admin/FASysRoleCodeMaster_View.aspx';", true);
                else
                {
                    strAlert = "Role Center details added successfully";
                    strAlert += @"\n\nWould you like to add one more Role Center?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    lblErrorMessage.Text = string.Empty;
                }
            }
        }
        catch (Exception ae)
        {
            lblErrorMessage.Text = ae.Message;
               FAClsPubCommErrorLog.CustomErrorRoutine(ae);
            throw ae;
        }
        finally
        {
            ObjRoleCenterMasterClient.Close();
        }
    }
    #endregion
    #region To Clear_FA Role Center Master
    // Function for Clear_FA
    private void FunPubClear()
    {
        if (intRoleCodeId == 0)
        {
            if (ddlProgram.Items.Count > 1)
                ddlProgram.SelectedIndex = 0;
            txtRoleCode.Text = "";
          
        }
    }
    #endregion
    private void LoadRoleCode()
    {
        try
        {
            txtRoleCode.Text = string.Empty;
            if (ddlProgram.SelectedIndex > 0)
                if (Procparam != null)
                    Procparam.Clear();
                else
                {
                    Procparam = new Dictionary<string, string>();
                    Procparam.Add("@Program_ID", ddlProgram.SelectedValue);
                    DataTable dt = Utility_FA.GetDefaultData(SPNames.Get_Programs,Procparam);
                    if (dt.Rows.Count > 0)
                    {
                        DataRow dr = dt.Rows[0];
                        txtRoleCode.Text = ("FA" + dr["PROGRAM_CODE"].ToString());
                        //txtRoleCode.Text = "FA" + ddlProgram.SelectedItem.Text.Trim().Substring(0, 4);
                    }
                }
        }
        catch (Exception ae)
        {
            lblErrorMessage.Text = ae.Message;
            throw ae;
        }
    }

    #endregion
    #region Button Events
    //  Save Event
    protected void btnSave_Click(object sender, EventArgs e)
    {
        FunSaveRoleCenterMaater();
    }
    // Cancel Event
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(strRedirectPage);
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }
    /// <summary>
    /// Clear_FA Role Code Details
    /// </summary>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            FunPubClear();
        }
        catch (Exception ae)
        {
            throw ae;
        }
    }

    #endregion


    
    #region Drop Down Events
    /// <summary>
    /// Program Drop Down Selected_Change Event
    /// </summary>
    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlProgram.SelectedIndex == 0)
            {
                txtRoleCode.Text = string.Empty;
            }
            else
            {
                LoadRoleCode();
            }
           
        }
        catch (FaultException<SystemAdminMgtServiceReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }
   
    #endregion
  

}
