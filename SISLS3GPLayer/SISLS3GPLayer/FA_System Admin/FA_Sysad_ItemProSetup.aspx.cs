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
using System.Globalization;
using FA_BusEntity;

public partial class Financial_Accounting_FA_Sysad_ItemProSetup : ApplyThemeForProject_FA
{
    #region Variable declaration

    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objManualLookupClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
    FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPDataTable ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable = null;
    FASerializationMode SerMode = FASerializationMode.Binary;


    //User Authorization
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
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
    string strRedirectPage = "../Common/HomePage.aspx";
    static string strPageName = "Item Profile Setup";
    DataSet dsItmProfDet = null;
    DataSet dsManualLookup;
    DataTable dtManualLookupModify = null;
    string strDateFormat = string.Empty;

    string strMode = string.Empty;
    string strConnectionName;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
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
                intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            if (intUserID == 0)
                intUserID = ObjUserInfo_FA.ProUserIdRW;
            FASession ObjS3GSession = new FASession();
            strConnectionName = ObjS3GSession.ProConnectionName;
            ////User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            if (!IsPostBack)
            {
                pnlDetail.Visible = false;
                System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID;
                System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = ObjUserInfo_FA.ProUserIdRW;
                calEFFECTIVEFROM.Format = strDateFormat;
                calEFFECTIVETo.Format = strDateFormat;
                txtEFFECTIVETO.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVETO.ClientID + "','" + strDateFormat + "',true,  false);");
                txtEFFECTIVEFROM.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVEFROM.ClientID + "','" + strDateFormat + "',true,  false);");
                txtProgramName.Focus();
                //txtProgramName_TextChanged(null, null);
            }
            txtProgramName.Focus();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    #endregion

    /// <summary>
    /// To bind Lookup Type
    /// </summary>



    #region Button Events

    protected void btnExit_TextChanged(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }
    protected void btnGoProgramName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
            dtformat.ShortDatePattern = "MM/dd/yy";

            if ((!(string.IsNullOrEmpty(txtEFFECTIVEFROM.Text))) &&
               (!(string.IsNullOrEmpty(txtEFFECTIVETO.Text))))                                   // If start and end date is not empty
            {
                if (Utility_FA.StringToDate(txtEFFECTIVEFROM.Text) > Utility_FA.StringToDate(txtEFFECTIVETO.Text)) // start date should be less than or equal to the enddate
                {
                    if (hidDate.Value.ToUpper() == "START")
                        Utility_FA.FunShowAlertMsg_FA(this, "Start date should be lesser than the End Date");
                    else
                        Utility_FA.FunShowAlertMsg_FA(this, "End date should be greater than the Start Date");
                    return;
                }
            }
            if (hdnProgram.Value == null || hdnProgram.Value == string.Empty)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Select the Program");
                return;
            }
            dsItmProfDet = new DataSet();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Program_Id", hdnProgram.Value);
            dsItmProfDet = Utility_FA.GetDataset("FA_SYS_GET_ITM_PRF_DTLS", Procparam);
            ViewState["ITM_PROF_DATATYPE_LOOK"] = dsItmProfDet.Tables[1];
            if (dsItmProfDet.Tables[0].Rows.Count > 0)
            {
                pnlDetail.Visible = true;
                grvItmProfSetUp.DataSource = dsItmProfDet.Tables[0];
                grvItmProfSetUp.DataBind();
            }
            else
            {
                pnlDetail.Visible = true;
                grvItmProfSetUp.DataSource = dsItmProfDet;
                grvItmProfSetUp.EmptyDataText = "No Records Found..";
                grvItmProfSetUp.DataBind();
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Item Profile SetUp", "S3G_System_Admin");
        }
    }


    void FunPubResetControls()
    {

        pnlDetail.Visible = false;
        grvItmProfSetUp.DataSource = null;
        grvItmProfSetUp.EmptyDataText = "No Records Found..";
        grvItmProfSetUp.DataBind();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        grvItmProfSetUp.DataSource = null;
        grvItmProfSetUp.DataBind();
        pnlDetail.Visible = false;
    }
    #endregion
    protected void grvItmProfSetUp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (ViewState["ITM_PROF_DATATYPE_LOOK"] != null)
                {
                    DropDownList ddlDATATYPE = (DropDownList)e.Row.FindControl("ddlDATATYPE");
                    Label lblDATATYPE = (Label)e.Row.FindControl("lblDATATYPE");
                    ddlDATATYPE.FillDataTable((DataTable)ViewState["ITM_PROF_DATATYPE_LOOK"], "LOOKUP_CODE", "DESCRIPTION");
                    ddlDATATYPE.SelectedValue = lblDATATYPE.Text;
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Item Profile SetUp", "grvItmProfSetUp_RowDataBound");
        }
    }

    public void btnUpdate_Click(object sender, EventArgs e)
    {
        Button btnUpdate = (Button)sender;
        GridViewRow grvRow = (GridViewRow)btnUpdate.Parent.Parent;

        Label lblPAGESETUPID = (Label)grvRow.FindControl("lblPAGESETUPID");
        TextBox txtDISPLAYTEXT = (TextBox)grvRow.FindControl("txtDISPLAYTEXT");
        TextBox txtTOOLTIP = (TextBox)grvRow.FindControl("txtTOOLTIP");
        DropDownList ddlDATATYPE = (DropDownList)grvRow.FindControl("ddlDATATYPE");
        TextBox txtCOLUMNWIDTH = (TextBox)grvRow.FindControl("txtCOLUMNWIDTH");
        TextBox txtCOLUMNDECIMAL = (TextBox)grvRow.FindControl("txtCOLUMNDECIMAL");
        //TextBox txtEFFECTIVEFROM = (TextBox)grvRow.FindControl("txtEFFECTIVEFROM");
        //TextBox txtEFFECTIVETO = (TextBox)grvRow.FindControl("txtEFFECTIVETO");

        try
        {
            objManualLookupClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
            ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable = new FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPDataTable();
            FA_BusEntity.SysAdmin.master.S3G_SYSAD_ITEM_PROF_SETUPRow ObjS3G_SYSAD_ITEM_PROF_SETUPRow;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow = ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable.NewS3G_SYSAD_ITEM_PROF_SETUPRow();
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Company_ID = intCompanyID;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Program_Id = Convert.ToInt32(hdnProgram.Value);
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.PAGESETUPID = Convert.ToInt32(lblPAGESETUPID.Text);
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.DISPLAYTEXT = txtDISPLAYTEXT.Text;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.TOOLTIP = txtTOOLTIP.Text;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.DATATYPE = ddlDATATYPE.SelectedValue;
            if (txtCOLUMNWIDTH.Text != string.Empty)
                ObjS3G_SYSAD_ITEM_PROF_SETUPRow.COLUMNWIDTH = Convert.ToInt32(txtCOLUMNWIDTH.Text);
            if (txtCOLUMNDECIMAL.Text != string.Empty)
                ObjS3G_SYSAD_ITEM_PROF_SETUPRow.COLUMNDECIMAL = Convert.ToInt32(txtCOLUMNDECIMAL.Text);
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVEFROM = txtEFFECTIVEFROM.Text;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVETO = txtEFFECTIVETO.Text;
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Updated_by = intUserID;


            ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable.AddS3G_SYSAD_ITEM_PROF_SETUPRow(ObjS3G_SYSAD_ITEM_PROF_SETUPRow);
            FASerializationMode SerMode = FASerializationMode.Binary;
            intErrCode = objManualLookupClient.FunPubUpdateItemProfSetUp(SerMode, strConnectionName,FAClsPubSerialize.Serialize(ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable, SerMode));
            if (intErrCode == 0)
            {
                Utility_FA.FunShowAlertMsg_FA(this, "Item Profile Details updated successfully");
                btnGoProgramName_TextChanged(null, null);
            }
            else if (intErrCode == 50)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Error in Updating Item Profile Details ");
            }
            else if (intErrCode == 1)
            {
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Fields [Display Name/ToolTip/Data Type/Column Width] should not Blank");
                return;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {
            objManualLookupClient.Close();
        }
    }
    protected void grvItmProfSetUp_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    public static string[] GetProgramName(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        Procparam.Clear();
        Procparam.Add("@Company_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@User_ID", System.Web.HttpContext.Current.Session["AutoSuggestUserID"].ToString());
        Procparam.Add("@PrefixText", prefixText.Trim());
        Procparam.Add("@Type", "2");
        suggetions = Utility_FA.GetSuggestions(Utility_FA.GetDefaultData("FA_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }

    protected void txtEFFECTIVEFROM_TextChanged(object sender, EventArgs e)
    {
        hidDate.Value = "End";
        txtEFFECTIVEFROM.Focus();
    }
    protected void txtEFFECTIVETO_TextChanged(object sender, EventArgs e)
    {
        hidDate.Value = "Start";
        txtEFFECTIVETO.Focus();
    }
}