/// Module Name        :   System Admin
/// Screen Name        :   S3GSysAdminItemProSetup.aspx
/// Created By         :   Sathish R
/// Created Date       :   09-May-2018
/// Purpose            :   To insert Item Profile Setup
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
using System.Globalization;

public partial class System_Admin_S3GSysAdminLookupMaster : ApplyThemeForProject
{
    #region Variable declaration

    CompanyMgtServicesReference.CompanyMgtServicesClient objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
    S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPDataTable ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable = null;
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
    string strRedirectPage = "../Common/HomePage.aspx";
    static string strPageName = "Item Profile Setup";
    DataSet dsItmProfDet = null;
    DataSet dsManualLookup;
    DataTable dtManualLookupModify = null;
    string strDateFormat = string.Empty;

    string strMode = string.Empty;

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
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

            ////User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            bIsActive = ObjUserInfo.ProIsActiveRW;
            bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
            strDateFormat = ObjS3GSession.ProDateFormatRW;
            if (!IsPostBack)
            {
                pnlDetail.Visible = false;
                System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = intCompanyID;
                System.Web.HttpContext.Current.Session["AutoSuggestUserID"] = ObjUserInfo.ProUserIdRW;
                //calEFFECTIVEFROM.Format = strDateFormat;
                //calEFFECTIVETo.Format = strDateFormat;
                //txtEFFECTIVETO.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVETO.ClientID + "','" + strDateFormat + "',true,  false);");
                //txtEFFECTIVEFROM.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVEFROM.ClientID + "','" + strDateFormat + "',true,  false);");
               
                //txtProgramName_TextChanged(null, null);
                TextBox txtProgramNames = (TextBox)txtProgramName.FindControl("txtItemName");
                txtProgramNames.Focus();
            }
            
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



    #region Button Events

    //protected void btnExit_TextChanged(object sender, EventArgs e)
    //{
    //    Response.Redirect(strRedirectPage,false);
    //}
    protected void btnGoProgramName_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
            dtformat.ShortDatePattern = "MM/dd/yy";
           
            //if ((!(string.IsNullOrEmpty(txtEFFECTIVEFROM.Text))) &&
            //   (!(string.IsNullOrEmpty(txtEFFECTIVETO.Text))))                                   // If start and end date is not empty
            //{
            //    if (Utility.StringToDate(txtEFFECTIVEFROM.Text) > Utility.StringToDate(txtEFFECTIVETO.Text)) // start date should be less than or equal to the enddate
            //    {
            //        if (hidDate.Value.ToUpper() == "START")
            //            Utility.FunShowAlertMsg(this, "Start date should be lesser than the End Date");
            //        else
            //            Utility.FunShowAlertMsg(this, "End date should be greater than the Start Date");
            //        return;
            //    }
            //}
            if (hdnProgram.Value == null || hdnProgram.Value == string.Empty || txtProgramName.SelectedText=="")
            {
                Utility.FunShowAlertMsg(this, "Select the Module Description");
                return;
            }
            dsItmProfDet = new DataSet();
            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Program_Id", hdnProgram.Value);
            dsItmProfDet = Utility.GetDataset("S3G_SYS_GET_ITM_PRF_DTLS", Procparam);
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
            btnGo.Focus();
        }
        catch (Exception ex)
        {
           ClsPubCommErrorLogDB.CustomErrorRoutine(ex,"Item Profile SetUp","S3G_System_Admin");
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
        txtProgramName.SelectedText = string.Empty;
        grvItmProfSetUp.DataSource = null;
        grvItmProfSetUp.DataBind();
        pnlDetail.Visible = false;
        hdnProgram.Value = string.Empty;
        txtProgramName.SelectedText = string.Empty;
        TextBox txtProgramNames = (TextBox)txtProgramName.FindControl("txtItemName");
        txtProgramNames.Focus();
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
                    TextBox txtEFFECTIVEFROM = e.Row.FindControl("txtEFFECTIVEFROM") as TextBox;
                    TextBox txtEFFECTIVETO = e.Row.FindControl("txtEFFECTIVETO") as TextBox;
                    txtEFFECTIVEFROM.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVEFROM.ClientID + "','" + strDateFormat + "',false,false);");
                    txtEFFECTIVETO.Attributes.Add("onblur", "fnDoDate(this,'" + txtEFFECTIVETO.ClientID + "','" + strDateFormat + "',false,true);");
                    AjaxControlToolkit.CalendarExtender calFromDate = e.Row.FindControl("calEFFECTIVEFROM") as AjaxControlToolkit.CalendarExtender;
                    AjaxControlToolkit.CalendarExtender calToDate = e.Row.FindControl("calEFFECTIVETo") as AjaxControlToolkit.CalendarExtender;
                    calFromDate.Format = strDateFormat;
                    calToDate.Format = strDateFormat;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Item Profile SetUp", "grvItmProfSetUp_RowDataBound");
        }
    }

    public void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtProgramName.SelectedText == string.Empty || txtProgramName.SelectedText == "")
        {
            Utility.FunShowAlertMsg(this, "Select the Module Description");
            return;
        }
        Button btnUpdate = (Button)sender;
        GridViewRow grvRow = (GridViewRow)btnUpdate.Parent.Parent;

        Label lblPAGESETUPID = (Label)grvRow.FindControl("lblPAGESETUPID");
        TextBox txtDISPLAYTEXT = (TextBox)grvRow.FindControl("txtDISPLAYTEXT");
        TextBox txtTOOLTIP = (TextBox)grvRow.FindControl("txtTOOLTIP");
        DropDownList ddlDATATYPE = (DropDownList)grvRow.FindControl("ddlDATATYPE");
        TextBox txtCOLUMNWIDTH = (TextBox)grvRow.FindControl("txtCOLUMNWIDTH");
        TextBox txtCOLUMNDECIMAL = (TextBox)grvRow.FindControl("txtCOLUMNDECIMAL");
        TextBox txtEFFECTIVEFROM = (TextBox)grvRow.FindControl("txtEFFECTIVEFROM");
        TextBox txtEFFECTIVETO = (TextBox)grvRow.FindControl("txtEFFECTIVETO");
        //if (string.IsNullOrEmpty(txtEFFECTIVEFROM.Text))
        //{
        //    Utility.FunShowAlertMsg(this, "Effective From Date should not be Empty.");
        //    txtEFFECTIVEFROM.Focus();
        //    return;
        //}
        //else if(string.IsNullOrEmpty(txtEFFECTIVETO.Text))
        //{
        //    Utility.FunShowAlertMsg(this, "Effective To Date should not be Empty.");
        //    txtEFFECTIVETO.Focus();
        //    return;
        //}
        if ((!string.IsNullOrEmpty(txtEFFECTIVEFROM.Text)) && (!string.IsNullOrEmpty(txtEFFECTIVETO.Text)))
        {
            if (Convert.ToInt32(Utility.StringToDate(txtEFFECTIVEFROM.Text).ToString("yyyyMMdd")) > Convert.ToInt32(Utility.StringToDate(txtEFFECTIVETO.Text).ToString("yyyyMMdd")))
            {
                Utility.FunShowAlertMsg(this, "Effective From Date should not be Greater than Effective To Date");
                txtEFFECTIVETO.Text = string.Empty;
                return;
            }
        }
        try
        {
            objManualLookupClient = new CompanyMgtServicesReference.CompanyMgtServicesClient();
            ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable = new S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPDataTable();
            S3GBusEntity.CompanyMgtServices.S3G_SYSAD_ITEM_PROF_SETUPRow ObjS3G_SYSAD_ITEM_PROF_SETUPRow;
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
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVEFROM = Utility.StringToDate(txtEFFECTIVEFROM.Text).ToString(strDateFormat);
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.EFFECTIVETO = Utility.StringToDate(txtEFFECTIVETO.Text).ToString(strDateFormat);
            ObjS3G_SYSAD_ITEM_PROF_SETUPRow.Updated_by = intUserID;


            ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable.AddS3G_SYSAD_ITEM_PROF_SETUPRow(ObjS3G_SYSAD_ITEM_PROF_SETUPRow);
            SerializationMode SerMode = SerializationMode.Binary;
            intErrCode = objManualLookupClient.FunPubUpdateItemProfSetUp(SerMode, ClsPubSerialize.Serialize(ObjS3G_SYSAD_ITEM_PROF_SETUPDataTable, SerMode));
            if (intErrCode == 0)
            {
                Utility.FunShowAlertMsg(this, "Item Profile Details updated successfully");
                btnGoProgramName_TextChanged(null, null);
            }
            else if (intErrCode == 50)
            {
                Utility.FunShowAlertMsg(this.Page, "Error in Updating Item Profile Details ");
            }
            //else if (intErrCode == 1)
            //{
            //    Utility.FunShowAlertMsg(this.Page, "Fields [Display Name/ToolTip/Effective From/Effective To] should not be blank");
            //    return;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
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
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("S3G_GET_PRGNAMEDUSER", Procparam));
        return suggetions.ToArray();
    }

    //protected void txtEFFECTIVEFROM_TextChanged(object sender, EventArgs e)
    //{
    //    hidDate.Value = "End";
    //    txtEFFECTIVEFROM.Focus();
    //}
    //protected void txtEFFECTIVETO_TextChanged(object sender, EventArgs e)
    //{
    //    hidDate.Value = "Start";
    //    txtEFFECTIVETO.Focus();
    //}
    protected void txtProgramName_Item_Selected(object Sender, EventArgs e)
    {
        hdnProgram.Value = txtProgramName.SelectedValue;
        TextBox txtItemName = (TextBox)txtProgramName.FindControl("txtItemName");
        txtItemName.Focus();
    }
    // Date :04-10-2018, By : anbuvel.T As per LATHA Discussion Validation Removed
    //protected void txtEFFECTIVEFROM_TextChanged(object sender, EventArgs e)
    //{
    //    TextBox txtdate = (TextBox)sender;
    //    GridViewRow grvRow = (GridViewRow)txtdate.Parent.Parent;

    //    TextBox txtEFFECTIVEFROM = (TextBox)grvRow.FindControl("txtEFFECTIVEFROM");
    //    string strDate = DateTime.Now.ToString(strDateFormat);
    //    if (!string.IsNullOrEmpty(txtEFFECTIVEFROM.Text))
    //    {
    //        if (Utility.StringToDate(txtEFFECTIVEFROM.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat))) //(Convert.ToInt32(Utility.StringToDate(txtFFromDate.Text)) < Convert.ToInt32(Utility.StringToDate(strDate)))
    //        {
    //            Utility.FunShowAlertMsg(this, "Selected Date cannot be lesser than System Date.");
    //            txtEFFECTIVEFROM.Text = string.Empty;
    //            return;
    //        }
    //    }
    //}

    protected void txtEFFECTIVETO_TextChanged(object sender, EventArgs e)
    {
        TextBox txtdate = (TextBox)sender;
        GridViewRow grvRow = (GridViewRow)txtdate.Parent.Parent;
        TextBox txtEFFECTIVETO = (TextBox)grvRow.FindControl("txtEFFECTIVETO");
        if (!string.IsNullOrEmpty(txtEFFECTIVETO.Text))
        {
            if (Utility.StringToDate(txtEFFECTIVETO.Text) < Utility.StringToDate(DateTime.Now.ToString(strDateFormat)))
            {
                Utility.FunShowAlertMsg(this, "Selected Date cannot be lesser than System Date.");
                txtEFFECTIVETO.Text = string.Empty;
                return;
            }
        }
    }
}