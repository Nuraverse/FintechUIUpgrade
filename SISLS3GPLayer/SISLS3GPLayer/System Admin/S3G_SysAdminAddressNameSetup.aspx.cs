using S3GAdminServicesReference;
using S3GBusEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class System_Admin_S3G_SysAdminAddressNameSetup : ApplyThemeForProject
{

    #region Initialization
    S3GAdminServicesReference.S3GAdminServicesClient ObjS3GAdminClient;
    Dictionary<string, string> Procparam = null;
    int intCompanyId = 0;
    int intUserId = 0;
    int intErrCode;
    UserInfo ObjUserInfo;
    S3GSession ObjS3GSession;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    public string strDateFormat;
    static string strPageName = "Address / Name Setup";
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ObjUserInfo = new UserInfo();
            intCompanyId = ObjUserInfo.ProCompanyIdRW;//Convert.ToInt32(Request.QueryString["qsCmpnyId"]);
            intUserId = ObjUserInfo.ProUserIdRW;
            ObjS3GSession = new S3GSession();
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            ceFromDate.Format = strDateFormat;                       // assigning the first textbox with the End date
            ceToDate.Format = strDateFormat;
            txtEffectiveFrom.Attributes.Add("onchange", "fnDoDate(this,'" + txtEffectiveFrom.ClientID + "','" + strDateFormat + "',false,  true);");
            txtEffectiveTo.Attributes.Add("onchange", "fnDoDate(this,'" + txtEffectiveTo.ClientID + "','" + strDateFormat + "',false,  true);");
            if (!IsPostBack)
            {
                FunPriLoadPage();
                FunBind_Effective_To();
                ddlObjectType.Focus();
            }            
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName);
        }
    }

    #endregion

    protected void ddlObjectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlObjectType.SelectedIndex == 0)
            {
                pnlGrid.Visible = false;
                pnlRevisionHistory.Visible = false;
            }
            else
            {
                FunPriGetAddressNameSetupDetails();
                FunPriGetAddressNameSetup_HistoryDetails();
                pnlGrid.Visible = true;
                pnlRevisionHistory.Visible = true;
                txtEffectiveFrom.Clear();
                btnSave.Enabled_True();
            }
            ddlObjectType.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName, "Method Name: ddlObjectType_SelectedIndexChanged");
        }

    }

    #region Button Events
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if(!(FunDateValidation(1)))
             return;

            S3GAdminServicesClient ObjWebServiceClient = new S3GAdminServicesClient();
            SerializationMode SerMode = SerializationMode.Binary;

            SystemAdmin.S3G_SYSAD_ADDSETUPDataTable obj_sysad_Address_Name_SetupDataTable = new SystemAdmin.S3G_SYSAD_ADDSETUPDataTable();
            SystemAdmin.S3G_SYSAD_ADDSETUPRow objAddressNameSetupRow;

            objAddressNameSetupRow = obj_sysad_Address_Name_SetupDataTable.NewS3G_SYSAD_ADDSETUPRow();
            objAddressNameSetupRow.Company_ID = intCompanyId;
            objAddressNameSetupRow.Lookup_Type = Convert.ToInt16(ddlObjectType.SelectedValue);
            objAddressNameSetupRow.XML_Address_Name_Details = gvAddressNameSetup.FunPubFormXml();
            objAddressNameSetupRow.Effective_From = Utility.StringToDate(txtEffectiveFrom.Text.ToString().ToString());
            objAddressNameSetupRow.Effective_To = Utility.StringToDate(txtEffectiveTo.Text.ToString().ToString());
            objAddressNameSetupRow.Created_By = intUserId;
            obj_sysad_Address_Name_SetupDataTable.AddS3G_SYSAD_ADDSETUPRow(objAddressNameSetupRow);

            intErrCode = ObjWebServiceClient.FunPubUpdateAddressNameSetup(SerMode, ClsPubSerialize.Serialize(obj_sysad_Address_Name_SetupDataTable, SerMode));
            if (intErrCode == 0)
            {
                btnSave.Enabled_False();
                if (ddlObjectType.SelectedValue == "1")
                    strAlert = strAlert.Replace("__ALERT__", "Address details updated successfully");
                else if (ddlObjectType.SelectedValue == "2")
                    strAlert = strAlert.Replace("__ALERT__", "Name details updated successfully");

                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert, true);
                ClearControls();
                return;
            }

            if (intErrCode == 1)
            {
                Utility.FunShowAlertMsg(this.Page, "Fields [Display Text/ToolTip] should not be Blank");
                return;
            }

            if (intErrCode == 2)
            {
                Utility.FunShowAlertMsg(this.Page, "Data already exists in given date range");
                return;
            }
            if (intErrCode == 3)
            {
                Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs.ADDS_STP_1);
                txtEffectiveFrom.Focus();
                return;
            }
            if (intErrCode == 4)
            {
                Utility.FunShowAlertMsg(this.Page, Resources.ValidationMsgs.ADDS_STP_2);
                txtEffectiveFrom.Focus();
                return;
            }
            if (intErrCode == 50)
            {
                lblErrorMessage.Text = "Unable to update Address / Name setup.";

            }
            btnSave.Focus();
        }
        catch (Exception objException)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(objException, strPageName, "Method Name: btnSave_Click");
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearControls();
        //btnClear.Focus();
        ddlObjectType.Focus();
        FunBind_Effective_To();
    }
    protected void txtEffectiveFrom_TextChanged(object sender, EventArgs e)
    {
        if(!(FunDateValidation(1)))
        {
            return;
        };
        
    }

    protected void txtEffectiveTo_TextChanged(object sender, EventArgs e)
    {
        if (!(FunDateValidation(2)))
        {
            return;
        };
    }

    #endregion

    #region Private Methods

    private void FunPriLoadPage()
    {
        try
        {
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);

            DataSet ds = new DataSet();

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@Lookup_Type", "ADDRESS_SETUP");
            Procparam.Add("@Table_Name", "S3G_ORG_Lookup");
            ddlObjectType.BindDataTable("S3G_GET_COMMON_LOOKUP_VAL", Procparam, new string[] { "LOOKUP_CODE", "DESCRIPTION" });
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName, "Method Name: FunPriLoadPage");
        }
    }

    protected void FunBind_Effective_To()
    {
        try
        {

            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Option", "793");
            Procparam.Add("@Param1", Convert.ToString(intCompanyId));
            DataTable dtdata = Utility.GetDefaultData("S3G_ORG_GetCustomerLookUp", Procparam);
            if (dtdata.Rows.Count > 0)
            {
                txtEffectiveTo.Text = dtdata.Rows[0][0].ToString();
            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }

    }

    private void FunPriGetAddressNameSetupDetails()
    {
        try
        {
            DataSet ds = new DataSet();

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            ds = Utility.GetDataset("S3G_SA_GET_ADRS_NAME_SETUP", Procparam);

            if (ddlObjectType.SelectedValue == "1") //For Address
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    gvAddressNameSetup.DataSource = ds.Tables[0];
                    gvAddressNameSetup.DataBind();
                }
            }
            if (ddlObjectType.SelectedValue == "2") //For Name
            {
                if (ds.Tables.Count > 0 && ds.Tables[1].Rows.Count > 0)
                {
                    gvAddressNameSetup.DataSource = ds.Tables[1];
                    gvAddressNameSetup.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName, "Method Name: FunPriGetAddressNameSetupDetails");
        }
    }

    private void FunPriGetAddressNameSetup_HistoryDetails()
    {
        try
        {
            DataSet ds = new DataSet();

            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();

            Procparam.Add("@Company_ID", Convert.ToString(intCompanyId));
            Procparam.Add("@Lookup_Type", Convert.ToString(ddlObjectType.SelectedValue));
            ds = Utility.GetDataset("S3G_SA_GET_ADRS_SETUP_HISTORY", Procparam);

            if (ddlObjectType.SelectedValue == "1") //For Address
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    gvRevisionHistory.DataSource = ds.Tables[0];
                    gvRevisionHistory.DataBind();
                }
            }
            if (ddlObjectType.SelectedValue == "2") //For Name
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    gvRevisionHistory.DataSource = ds.Tables[0];
                    gvRevisionHistory.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName, "Method Name: FunPriGetAddressNameSetup_HistoryDetails");
        }
    }
    private void ClearControls()
    {
        try
        {
            pnlGrid.Visible = false;
            pnlRevisionHistory.Visible = false;
            ddlObjectType.SelectedIndex = 0;
            txtEffectiveFrom.Text = string.Empty;
        }
        catch (Exception ex)
        {
            S3GBusEntity.ClsPubCommErrorLogDB.CustomErrorRoutine(ex, strPageName, "Method Name: ClearControls");
        }
    }

    private  Boolean FunDateValidation(int No)
    {
        try
        {
            if (txtEffectiveFrom.Text != string.Empty && txtEffectiveTo.Text != string.Empty)
            {
                if (Utility.StringToDate(txtEffectiveFrom.Text) > Utility.StringToDate(txtEffectiveTo.Text))
                {
                    Utility.FunShowAlertMsg(this, "Effective From date should be less than or equal to Effective To date");
                    if (No == 1)
                    {
                        txtEffectiveFrom.Text = string.Empty;
                        txtEffectiveFrom.Focus();
                    }
                    else
                    {
                        txtEffectiveTo.Text = string.Empty;
                        txtEffectiveTo.Focus();
                    }
                    return false;
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }


    #endregion


    protected void btnExit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Common/HomePage.aspx");
    }
}