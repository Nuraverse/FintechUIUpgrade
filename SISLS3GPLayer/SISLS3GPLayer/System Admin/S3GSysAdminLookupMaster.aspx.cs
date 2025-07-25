/// Module Name        :   System Admin
/// Screen Name        :   S3GSysAdminLookupMaster.aspx
/// Created By         :   Santhosh S
/// Created Date       :   25-July-2013
/// Purpose            :   To insert look up master details
/// Modified By        :   
/// Modified Date      :   

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Data;
using System.IO;
using System.Web.Security;
using System.Configuration;

public partial class System_Admin_S3GSysAdminLookupMaster : ApplyThemeForProject
{
    #region Variable declaration

    CompanyMgtServicesReference.CompanyMgtServicesClient objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
    S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable ObjS3G_SYS_ManualLookupDataTable = null;
    SerializationMode SerMode = SerializationMode.Binary;


    //User Authorization
    UserInfo ObjUserInfo = new UserInfo();
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    bool bClearList = false;
    //Code end

    int intErrCode = 0;
    int intCompanyID = 0;
    int intUserID = 0;

    Dictionary<string, string> Procparam = null;

    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPage = "../System Admin/S3GSysAdminLookupMaster.aspx";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminLookupMaster.aspx';";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminLookupMaster.aspx';";
    static string strPageName = "Lookup Master";
    DataTable dtManualLookup = null;
    DataSet dsManualLookup;
    DataTable dtManualLookupModify = null;
    int intFieldNameChanged = 0;

    string strMode = string.Empty;
    public static System_Admin_S3GSysAdminLookupMaster obj_Page;
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {





            FunPriLoadPage();
            ddlModule.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
        }
    }

    #region User Defined Functions

    private void FunPriLoadPage()
    {
        try
        {
            //this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);

            if (intCompanyID == 0)
                intCompanyID = ObjUserInfo.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo.ProUserIdRW;
            S3GSession ObjS3GSession = new S3GSession();

            System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID.ToString();

            ////User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bIsActive = ObjUserInfo.ProIsActiveRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;

            if (!IsPostBack)
            {
                btnSave.Enabled_False();
                btnSave.Attributes.Remove("onclick");
                pnlDetail.Visible = false;
                LoadModuleDropDownList();

                //btnSave.Enabled = true;
                if (!bCreate)
                    imgbtnAdd.Enabled = false;
            }
            obj_Page = this;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion

    /// <summary>
    /// To bind Lookup Type
    /// </summary>

    private void FunBindLookupType(int intProgram_ID)
    {
        try
        {
            ddlLookupTypeDesc.Enabled = true;
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Program_ID", intProgram_ID.ToString());
            // ddlLookupTypeDesc.BindDataTable("S3G_Get_ManualLookupDesc", Procparam, new string[] { "Lookup_Def_ID", "Lookup_Desc" }); // prc_GetManualLookupDesc
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "Unable to load Lookup Type";
        }
    }

    #region Button Events

    protected void btnSave_Click(object sender, EventArgs e)
    {
        objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();

        try
        {
            if (ViewState["NewLookup"] == null)
            {
                Utility.FunShowAlertMsg(this.Page, "Add atleast one Lookup Value");
                return;
            }


            ObjS3G_SYS_ManualLookupDataTable = new S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable();
            S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupRow ObjManualLookupRow;
            ObjManualLookupRow = ObjS3G_SYS_ManualLookupDataTable.NewS3G_SYSAD_ManualLookupRow();
            ObjManualLookupRow.Company_ID = intCompanyID; // 1
            ObjManualLookupRow.Lookup_Desc = ddlLookupTypeDesc.SelectedText;
            ObjManualLookupRow.Lookup_Def_ID = Convert.ToInt32(ddlLookupTypeDesc.SelectedValue);
            ObjManualLookupRow.Lookup_Name = Utility.FunPubFormXml((DataTable)ViewState["NewLookup"]);
            ObjManualLookupRow.Created_By = intUserID; // 2
            ObjManualLookupRow.Is_Active = true;
            //ObjManualLookupRow.Company_ID = intCompanyID; // 1
            //ObjManualLookupRow.Lookup_Desc = ddlLookupTypeDesc.SelectedItem.Text;
            //ObjManualLookupRow.Lookup_Def_ID = Convert.ToInt32(ddlLookupTypeDesc.SelectedValue);
            //ObjManualLookupRow.Lookup_Name = txtLookupName.Text;
            ////Utility.FunPubFormXml((DataTable)ViewState["NewLookup"]); 
            //ObjManualLookupRow.Created_By = intUserID; // 2
            //ObjManualLookupRow.Is_Active = true;
            //ObjManualLookupRow.Modified_By = intUserID;
            //ObjManualLookupRow.Lookup_Type = txtLookupName.Text;
            //ObjManualLookupRow.Table_Name = "";

            ObjS3G_SYS_ManualLookupDataTable.AddS3G_SYSAD_ManualLookupRow(ObjManualLookupRow);
            SerializationMode SerMode = SerializationMode.Binary;

            //objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            intErrCode = objManualLookupClient.FunPubCreateManualLookup(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYS_ManualLookupDataTable, SerMode));

            if (intErrCode == 0)
            {
                //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                btnSave.Enabled_False();


                //End here

                strAlert = "Lookup details added successfully";
                strAlert += @"\n\nWould you like to add one more Lookup?";

                strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                strRedirectPageView = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                lblErrorMessage.Text = string.Empty;

            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Lookup Name already exist");
            }
            else if (intErrCode == 50)
            {
                lblErrorMessage.Text = "Unable to Save Lookup Values.";
            }

        }
        catch (FaultException<AccountMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            objManualLookupClient.Close();
        }
    }
    protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (intFieldNameChanged == 0)
            {
                //ddlLookupTypeDesc.SelectedText = "";
                //ddlLookupTypeDesc.SelectedValue = "";
                ddlLookupTypeDesc.Clear();
            }

            if (ddlProgram.SelectedItem.Text == "--Select--")
            {
                FunPubResetControls();


                if (ddlLookupTypeDesc.SelectedValue != "--Select--")
                {
                    // FunBindLookupType(Convert.ToInt32(ddlProgram.SelectedValue));
                    //ddlLookupTypeDesc.SelectedText = "";
                    //ddlLookupTypeDesc.SelectedValue = "";
                    //ddlLookupTypeDesc.Enabled = false;
                    return;
                }
            }
            if (ddlModule.SelectedItem.Text != "--Select--")
            {
                pnlDetail.Visible = false;
                gvLookupMaster.DataSource = null;
                gvLookupMaster.DataBind();
                //   FunBindLookupType(Convert.ToInt32(ddlProgram.SelectedValue));
                ddlProgram.AddItemToolTip();
                ddlProgram.ToolTip = ddlProgram.SelectedItem.Text;


            }
            else
            {
                pnlDetail.Visible = false;
                ddlProgram.SelectedValue = "0";
                ddlModule.SelectedValue = "0";
                ddlModule.ClearDropDownList();
                ddlProgram.ClearDropDownList();
                btnSave.Enabled_False();
                btnSave.Attributes.Remove("onclick");

                //ddlLookupTypeDesc.SelectedText = "";
                //ddlLookupTypeDesc.SelectedValue = "";
                ddlLookupTypeDesc.Clear();
            }

            //if (ddlLookupTypeDesc.SelectedValue != "0")
            //{
            //    ddlLookupTypeDesc.SelectedText = "";
            //    ddlLookupTypeDesc.SelectedValue = "";
            //}

            ddlProgram.Focus();  //Field Name
        }
        catch (Exception ae)
        {
            throw ae;
        }
    }
    void LoadModuleDropDownList()
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@SysAdmin", intUserID.ToString());
            Procparam.Add("@MODULE_CODE", null);
            Procparam.Add("@MODULE_ID", "0");
            Procparam.Add("@LookUp", "M");
            ddlModule.BindDataTable("S3G_GET_PROGRAM_MANUALLOOKUP", Procparam, new string[] { "MODULE_ID", "MODULE_CODE" });
            ddlModule.AddItemToolTip();

        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            lblErrorMessage.Text = objException.Message;
        }
    }
    protected void ddlModule_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ddlModule.SelectedValue) == 0)
        {
            if (Convert.ToInt32(ddlProgram.SelectedValue) > 0)
            {
                ddlProgram.ClearDropDownList();

            }
            if (Convert.ToInt32(ddlProgram.SelectedValue) == 0)
            {
                ddlProgram.ClearDropDownList();

            }
            if (Convert.ToInt32(ddlLookupTypeDesc.SelectedValue) > 0)
            {
                //FunBindLookupType(Convert.ToInt32(ddlProgram.SelectedValue));
                //ddlLookupTypeDesc.SelectedValue = "";
                //ddlLookupTypeDesc.SelectedText = "";
            }
        }
        if (ddlModule.SelectedIndex > 0)
        {
            LoadProgramDropDownList(ddlModule.SelectedItem.Text);
            btnClear.Enabled_True();
            ddlModule.ToolTip = ddlModule.SelectedItem.Text;
            //pnlDetail.Visible = false;
            //gvLookupMaster.DataSource = null;
            //gvLookupMaster.DataBind();
            //btnSave.Enabled = false;
            if (ddlLookupTypeDesc.SelectedValue.ToString() != "")
            {
                if (intFieldNameChanged == 0)
                {
                    //ddlLookupTypeDesc.SelectedValue = "";
                    //ddlLookupTypeDesc.SelectedText = "--Select--";
                    ddlLookupTypeDesc.Clear();
                    pnlDetail.Visible = false;
                    gvLookupMaster.DataSource = null;
                    gvLookupMaster.DataBind();
                }
            }
            else
            {
                //pnlDetail.Visible = false;
                //gvLookupMaster.DataSource = null;
                //gvLookupMaster.DataBind();
            }
        }
        else
        {
            LoadModuleDropDownList();
            if (ddlModule.SelectedIndex == 0)
            {
                ddlProgram.ClearSelection();
                ddlProgram.SelectedItem.Text = "--Select--";
            }
            FunPubResetControls();
            if (ddlProgram.SelectedIndex > 0)
                ddlProgram.ClearDropDownList();

        }

        //if (ddlLookupTypeDesc.SelectedValue != "0")
        //{
        //    ddlLookupTypeDesc.SelectedText = "";
        //    ddlLookupTypeDesc.SelectedValue = "";
        //}

    }
    void FunPubResetControls()
    {
        btnClear.Enabled_True();
        pnlDetail.Visible = false;
        gvLookupMaster.DataSource = null;
        gvLookupMaster.DataBind();
        //if (ddlLookupTypeDesc.SelectedValue!="0")       
        //    ddlLookupTypeDesc.ClearDropDownList();            
        btnSave.Enabled_False();
        btnSave.Attributes.Remove("onclick");
    }
    void LoadProgramDropDownList(string ModuleCode)
    {
        try
        {
            string sModuleCode = ddlModule.SelectedItem.Text.Trim().Substring(0, 1);
            if (ModuleCode != string.Empty)
            {
                Procparam = new Dictionary<string, string>();
                Procparam.Add("@SysAdmin", intUserID.ToString());
                Procparam.Add("@MODULE_CODE", sModuleCode);
                Procparam.Add("@MODULE_ID", "0");
                Procparam.Add("@LookUp", "P");
                ddlProgram.BindDataTable("S3G_Get_Program_ManualLookup", Procparam, new string[] { "PROGRAM_ID", "PROGRAM_CODE" });
                ddlProgram.AddItemToolTip();

            }
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            lblErrorMessage.Text = objException.Message;
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //if (ddlLookupTypeDesc.SelectedValue != null)

        //ddlLookupTypeDesc.SelectedValue = "0";
        ddlLookupTypeDesc.SelectedText = "--Select--";
        ddlProgram.ToolTip = lblProgram.Text;
        ddlLookupTypeDesc.ToolTip = lblLookupTypeDesc.Text;

        txtLookupName.Text = string.Empty;
        txtLookupCode.Text = string.Empty;
        gvLookupMaster.DataSource = null;
        gvLookupMaster.DataBind();
        pnlDetail.Visible = false;
        btnSave.Enabled_False();
        btnSave.Attributes.Remove("onclick");

        ViewState["LookupMaster"] = null;
        if (ddlModule.SelectedIndex != null)
        {
            ddlModule.SelectedIndex = 0;
        }

        ddlProgram.Items.Clear();
        //ddlProgram.Items.Insert(0, "--Select--");


        lblErrorMessage.Text = string.Empty;
    }

    //protected void btnCancel_Click(object sender, EventArgs e)
    //{
    //    string strRedirectPageAdd = "window.location.href='../Common/HomePage.aspx';";
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "ShWFMsg", strRedirectPageAdd, true);
    //}
    #endregion


    protected void ddlLookupTypeDesc_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (ddlLookupTypeDesc.SelectedText !=  null)
        //{
        //    dsManualLookup = new DataSet();
        //    Procparam = new Dictionary<string, string>();
        //    //Procparam.Add("@Is_Active", "1");
        //    Procparam.Add("@Company_ID", intCompanyID.ToString());
        //    Procparam.Add("@Lookup_Def_ID", ddlLookupTypeDesc.SelectedValue.ToString());
        //    Procparam.Add("@Lookup_Desc", ddlLookupTypeDesc.SelectedText.ToString());
        //    Procparam.Add("@Created_By", intUserID.ToString());

        //    dsManualLookup = Utility.GetDataset("S3G_Get_Manual_Lookup", Procparam);
        //    if (dsManualLookup.Tables.Count > 0)
        //    {
        //        gvLookupMaster.DataSource = dsManualLookup.Tables[0];
        //        gvLookupMaster.DataBind();
        //        ViewState["LookupMaster"] = dsManualLookup.Tables[0];

        //        if (dsManualLookup.Tables[0].Rows.Count > 0)
        //        {
        //            pnlDetail.Visible = true;
        //            btnClear.Enabled = true;
        //            btnSave.Enabled = true;
        //        }

        //        if (dsManualLookup.Tables[1].Rows[0]["Field_Count"].ToString() == "1") //If field count is 1 look up code is set visible false
        //        {
        //            gvLookupMaster.Columns[2].Visible = false;
        //            lblLookupCode.Visible = false;
        //            txtLookupCode.Visible = false;
        //            rfvtxtLookupCode.Enabled = false;
        //            txtLookupName.Focus();
        //        }
        //        else
        //        {
        //            gvLookupMaster.Columns[2].Visible = true;
        //            lblLookupCode.Visible = true;
        //            txtLookupCode.Visible = true;
        //            rfvtxtLookupCode.Enabled = true;
        //            txtLookupCode.Focus();
        //        }


        //        if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "3") //Only View
        //        {
        //            imgbtnAdd.Visible = false;
        //            btnSave.Enabled = false;
        //            gvLookupMaster.Columns[6].Visible = false;
        //        }
        //        else if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "2") //Only Modify
        //        {
        //            imgbtnAdd.Visible = false;
        //            gvLookupMaster.Columns[6].Visible = true;
        //        }
        //        else if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "1") //Add/Modify
        //        {
        //            imgbtnAdd.Visible = true;
        //            gvLookupMaster.Columns[6].Visible = true;
        //        }
        //    }
        //}
        //else
        //{
        //    pnlDetail.Visible = false;
        //    btnClear.Enabled = true;
        //    btnSave.Enabled = false;
        //    txtLookupName.Text = string.Empty;
        //    ViewState["LookupMaster"] = null;
        //    gvLookupMaster.DataSource = null;
        //    gvLookupMaster.DataBind();
        //}



    }

    protected void gvLookupMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Button btnUpdate = (Button)sender;
            //GridViewRow grvRow = (GridViewRow)btnUpdate.Parent.Parent;
            Label lblID = (Label)e.Row.FindControl("lblID");
            Label lblLookupCategory = (Label)e.Row.FindControl("lblLookupCategory");
            TextBox txtLookupName = (TextBox)e.Row.FindControl("txtLookupName");
            Label lblLookupDesc = (Label)e.Row.FindControl("lblLookupDesc");
            Label lblTableName = (Label)e.Row.FindControl("lblTableName");
            Button btnupd = (Button)e.Row.FindControl("btnUpdate");
            if (!bModify || lblID.Text.ToString() == string.Empty)
            {
                btnupd.Enabled = false;
            }
            else
            {
                btnupd.Enabled = true;
            }
        }
    }

    public void btnUpdate_Click(object sender, EventArgs e)
    {

        dtManualLookupModify = (DataTable)ViewState["LookupMaster"];
        Button btnUpdate = (Button)sender;
        GridViewRow grvRow = (GridViewRow)btnUpdate.Parent.Parent;
        Label lblID = (Label)grvRow.FindControl("lblID");
        Label lblLookupCategory = (Label)grvRow.FindControl("lblLookupCategory");
        TextBox txtLookupName = (TextBox)grvRow.FindControl("txtLookupDesc");
        Label lblLookupDesc = (Label)grvRow.FindControl("lblLookupDesc");
        Label lblTableName = (Label)grvRow.FindControl("lblTableName");

        if (dtManualLookupModify.Rows.Count > 0)
        {
            if (lblID.Text.ToString() == string.Empty)
            {
                Utility.FunShowAlertMsg(this, "Save the Lookup details, Then Update it");
                return;
            }
        }
        if (txtLookupName.Text.ToString() == string.Empty)
        {
            Utility.FunShowAlertMsg(this, "Lookup Value cannot be empty.");
            txtLookupName.Focus();
            return;
        }

        try
        {
            objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            ObjS3G_SYS_ManualLookupDataTable = new S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupDataTable();
            S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ManualLookupRow ObjManualLookupRow;
            ObjManualLookupRow = ObjS3G_SYS_ManualLookupDataTable.NewS3G_SYSAD_ManualLookupRow();
            ObjManualLookupRow.Company_ID = intCompanyID; // 1
            ObjManualLookupRow.ID = Convert.ToInt32(lblID.Text.ToString());
            ObjManualLookupRow.Lookup_Type = lblLookupCategory.Text;
            ObjManualLookupRow.Lookup_Name = txtLookupName.Text;
            ObjManualLookupRow.Table_Name = lblTableName.Text;
            ObjManualLookupRow.Created_By = intUserID; // 2
            //ObjManualLookupRow.Modified_By = intUserID;
            //ObjManualLookupRow.Lookup_Type = txtLookupName.Text;
            //ObjManualLookupRow.Table_Name = "";

            ObjS3G_SYS_ManualLookupDataTable.AddS3G_SYSAD_ManualLookupRow(ObjManualLookupRow);
            SerializationMode SerMode = SerializationMode.Binary;

            //objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            intErrCode = objManualLookupClient.FunPubModifyManualLookup(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYS_ManualLookupDataTable, SerMode));

            if (intErrCode == 0)
            {
                //Added by Bhuvana M on 19/Oct/2012 to avoid double save click
                btnSave.Enabled_False();

                //End here

                Utility.FunShowAlertMsg(this, "Lookup details updated successfully");


                //strRedirectPageView = "";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                lblErrorMessage.Text = string.Empty;

            }
            else if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Lookup Name already exist");
            }
            lblErrorMessage.Text = string.Empty;

        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            objManualLookupClient.Close();
        }
    }

    protected void imgbtnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Lookup_Def_ID", ddlLookupTypeDesc.SelectedValue.ToString());
            Procparam.Add("@Lookup_Desc", txtLookupName.Text.Trim());
            Procparam.Add("@Lookup_Code", txtLookupCode.Text.Trim());
            DataTable dtCheck = new DataTable();
            dtCheck = Utility.GetDefaultData("S3G_Chk_Manual_Lookup_Exist", Procparam);


            if ((Convert.ToInt32(dtCheck.Rows[0][0]) > 0))
            {
                Utility.FunShowAlertMsg(this.Page, "Lookup Description or Code already exist");
            }
            else
            {
                dtManualLookup = new DataTable();
                dtManualLookup = (DataTable)ViewState["LookupMaster"];
                DataTable dtNewLookup = new DataTable();
                dtNewLookup.Columns.Add("Name");
                dtNewLookup.Columns.Add("Lookup_Type");
                dtNewLookup.Columns.Add("Lookup_Code");

                if (ViewState["NewLookup"] != null)
                    dtNewLookup = (DataTable)ViewState["NewLookup"];

                if (txtLookupName.Text.Trim().ToString() == string.Empty)
                {
                    Utility.FunShowAlertMsg(this.Page, "Lookup Value cannot be empty");
                    return;
                }

                foreach (DataRow dataRow in dtNewLookup.Rows)
                {
                    if (dataRow["Name"].ToString() == txtLookupName.Text.Trim())
                    {
                        Utility.FunShowAlertMsg(this.Page, "Lookup Description already exist");
                        return;
                    }
                }

                DataRow row = dtNewLookup.NewRow();
                row["Name"] = txtLookupName.Text.Trim();
                row["Lookup_Type"] = ddlRCUType.SelectedValue;
                row["Lookup_Code"] = txtLookupCode.Text;
                dtNewLookup.Rows.InsertAt(row, 0);
                ViewState["NewLookup"] = dtNewLookup;

                row = dtManualLookup.NewRow();
                //row["Name"] = txtLookupName.Text.Trim();
                row["Lookup_Code"] = txtLookupCode.Text;
                row["Description"] = txtLookupName.Text.Trim();
                row["Lookup_Type"] = ddlRCUType.SelectedValue;
                dtManualLookup.Rows.InsertAt(row, 0);

                gvLookupMaster.DataSource = ViewState["LookupMaster"] = dtManualLookup;
                gvLookupMaster.DataBind();
                txtLookupCode.Text = string.Empty;
                txtLookupName.Text = string.Empty;
                rfvLookupName.Enabled = false;
                btnSave.Enabled_True();
                btnSave.Attributes.Add("onclick", "fnSaveValidation();");


                pnlDetail.Visible = true;
            }
        }

        catch (Exception objException)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            lblErrorMessage.Text = objException.Message;
        }
    }

    protected void ddlRCUType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLookupTypeDesc.SelectedValue != null && ddlRCUType.SelectedIndex > 0)
        {
            Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Lookup_Def_ID", ddlLookupTypeDesc.SelectedValue.ToString());
            Procparam.Add("@Lookup_Desc", ddlLookupTypeDesc.SelectedText.ToString());
            Procparam.Add("@RCUType", ddlRCUType.SelectedValue.ToString());
            Procparam.Add("@Created_By", intUserID.ToString());
            dtManualLookup = Utility.GetDefaultData("S3G_Get_Manual_Lookup", Procparam);
        }

        gvLookupMaster.DataSource = dtManualLookup;
        gvLookupMaster.DataBind();
        ViewState["LookupMaster"] = dtManualLookup;

    }


    protected void gvLookupMaster_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void ddlLookupTypeDesc_Item_Selected(object Sender, EventArgs e)
    {
        if (ddlLookupTypeDesc.SelectedText != null)
        {
            intFieldNameChanged = 1;
            ddlLookupTypeDesc.ToolTip = ddlLookupTypeDesc.SelectedText;

            dsManualLookup = new DataSet();
            Procparam = new Dictionary<string, string>();
            //Procparam.Add("@Is_Active", "1");
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Lookup_Def_ID", ddlLookupTypeDesc.SelectedValue.ToString());
            Procparam.Add("@Lookup_Desc", ddlLookupTypeDesc.SelectedText.ToString());
            Procparam.Add("@Created_By", intUserID.ToString());

            dsManualLookup = Utility.GetDataset("S3G_Get_Manual_Lookup", Procparam);
            if (dsManualLookup.Tables.Count > 0)
            {
                //Lookup Code TextBox allows alphanumber for Group Industry Type Start
                if (dsManualLookup.Tables[0].Rows.Count > 0)
                {
                    if (dsManualLookup.Tables[0].Rows[0]["TABLE_NAME"].ToString().ToUpper() == "S3G_ORG_GROUP_INDUSTRY_TYPE")
                    {
                        fttxtLookupCode.Enabled = false;
                    }
                    else
                    {
                        fttxtLookupCode.Enabled = true;
                    }
                }

                //Lookup Code TextBox allows alphanumber for Group Industry Type End

                gvLookupMaster.DataSource = dsManualLookup.Tables[0];
                gvLookupMaster.DataBind();
                ViewState["LookupMaster"] = dsManualLookup.Tables[0];

                if (dsManualLookup.Tables[0].Rows.Count > 0)
                {
                    pnlDetail.Visible = true;
                    btnClear.Enabled_True();
                    //btnSave.Enabled = true;
                    //btnSave.CssClass = "save_btn fa fa-floppy-o";
                }

                if (dsManualLookup.Tables[1].Rows[0]["Field_Count"].ToString() == "1") //If field count is 1 look up code is set visible false
                {
                    gvLookupMaster.Columns[2].Visible = false;
                    divLookupCode.Visible = false;
                    rfvtxtLookupCode.Enabled = false;
                    txtLookupName.Focus();
                }
                else
                {
                    gvLookupMaster.Columns[2].Visible = true;
                    divLookupCode.Visible = true;
                    rfvtxtLookupCode.Enabled = true;
                    txtLookupCode.Focus();
                }


                if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "3") //Only View
                {
                    imgbtnAdd.Visible = false;
                    btnSave.Enabled_False();
                    btnSave.Attributes.Remove("onclick");
                    gvLookupMaster.Columns[6].Visible = false;
                }
                else if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "2") //Only Modify
                {
                    imgbtnAdd.Visible = false;
                    gvLookupMaster.Columns[6].Visible = true;
                }
                else if (dsManualLookup.Tables[1].Rows[0]["Privilege_Type"].ToString() == "1") //Add/Modify
                {
                    imgbtnAdd.Visible = true;
                    gvLookupMaster.Columns[6].Visible = true;
                }
            }

            //Binding Program ID and Module ID Start

            dsManualLookup = new DataSet();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Lookup_Def_ID", ddlLookupTypeDesc.SelectedValue.ToString());
            dsManualLookup = Utility.GetDataset("S3G_SA_GET_PGM_MODULE_ID", Procparam);
            if (dsManualLookup.Tables.Count > 0)
            {
                ddlModule.SelectedValue = dsManualLookup.Tables[0].Rows[0][0].ToString();
                ddlModule_SelectedIndexChanged(ddlModule.SelectedValue, null);
                ddlProgram.SelectedValue = dsManualLookup.Tables[0].Rows[0][1].ToString();


            }

            //Binding Program ID and Module ID End

        }
        else
        {
            pnlDetail.Visible = false;
            btnClear.Enabled_True();
            btnSave.Enabled_False();
            btnSave.Attributes.Remove("onclick");
            txtLookupName.Text = string.Empty;
            ViewState["LookupMaster"] = null;
            gvLookupMaster.DataSource = null;
            gvLookupMaster.DataBind();
        }

        ddlLookupTypeDesc.Control_ID = ddlLookupTypeDesc.ClientID.ToString();
        TextBox txtName = ((TextBox)ddlLookupTypeDesc.FindControl("txtItemName"));
        txtName.Focus();
    }

    [System.Web.Services.WebMethod]
    public static string[] GetLookupTypeDesc(String prefixText, int count)
    {

        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggestions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@Module_ID", obj_Page.ddlModule.SelectedValue);
        Procparam.Add("@Program_ID", obj_Page.ddlProgram.SelectedValue);
        Procparam.Add("@PrefixText", prefixText);
        suggestions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_SA_GET_MANUAL_LKP_DESC", Procparam));
        return suggestions.ToArray();
    }
}