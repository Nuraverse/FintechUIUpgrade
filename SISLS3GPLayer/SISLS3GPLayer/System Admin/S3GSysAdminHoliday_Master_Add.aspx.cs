using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.ServiceModel;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.Text;

public partial class System_Admin_S3GSysAdminHoliday_Master_Add : ApplyThemeForProject
{
    #region Location Variable Declaration
    DataTable dtweekend;
    DataTable dt;
    DataTable dtweek;
    UserInfo ObjUserInfo = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    StringBuilder sbReceivingXML;
    string strDateFormat = string.Empty;
    int intUserID, intCompanyID = 0;
    int intholidayid = 0;
    Dictionary<string, string> Procparam = null;
    S3GSession objSession = new S3GSession();
    string strMode = string.Empty;
    string strConnectionName = string.Empty;
    string strRedirectAddPage = "~/System Admin/S3GSysAdminHoliday_Master_Add.aspx";
    string strRedirectViewPage = "~/System Admin/S3GSysAdminHoliday_Master_View.aspx";
    string strRedirectPageView = "window.location.href='../System Admin/S3GSysAdminHoliday_Master_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../System Admin/S3GSysAdminHoliday_Master_Add.aspx';";
    string strRedirectPage = "../System Admin/S3GSysAdminHoliday_Master_View.aspx";

    S3GAdminServicesReference.S3GAdminServicesClient objAdminServiceClient;
    SystemAdmin.S3G_SYSAD_Holiday_MstDataTable ObjFA_SYS_Master_DataTable = new SystemAdmin.S3G_SYSAD_Holiday_MstDataTable();
    SystemAdmin.S3G_SYSAD_Holiday_MstRow obj_Row;
    string strAlert = "alert('__ALERT__');";
    string strKey = "Insert";
    #endregion
    #region protected void Page_Load(object sender, EventArgs e)
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriPageLoad();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    #endregion
    protected void grvHolidayMaster_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                AjaxControlToolkit.CalendarExtender CalReceivedDate = e.Row.FindControl("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                if (CalReceivedDate != null)
                    CalReceivedDate.Format = strDateFormat;

                if (strMode != "C")
                {
                    DataTable dtholiday;
                    if (ViewState["Holiday"] != null)
                    {
                        dtholiday = (DataTable)ViewState["Holiday"];
                        Label lbldays = e.Row.FindControl("lbldays") as Label;
                        CheckBox chkcategory = e.Row.FindControl("chkcategory") as CheckBox;
                        foreach (DataRow dr in dtholiday.Rows)
                        {
                            if (lbldays.Text.ToString() == dr["leave_desc"].ToString())
                            {
                                chkcategory.Checked = true;
                            }
                        }
                        //else
                        //{
                        //    chkcategory.Checked = false;
                        //}
                    }

                }
                CheckBox chkCategoryq = (CheckBox)e.Row.FindControl("chkCategory");

                if (strMode == "Q")
                {
                    chkCategoryq.Enabled = false;
                }

            }
            if (e.Row.RowType == DataControlRowType.Header)
            {

            }

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }


    private void datatable()
    {
        dtweekend = new DataTable();
        DataRow dr;
        dtweekend.Columns.Add("Days");
        dtweekend.Columns.Add("STATUS");
        dtweekend.Columns.Add("MasterID");
        dr = dtweekend.NewRow();
        dr["Days"] = "SUNDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;

        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "MONDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "TUESDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "WEDNESDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "THURSDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "FRIDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();
        dr = dtweekend.NewRow();
        dr["Days"] = "SATURDAY";
        dr["STATUS"] = false;
        dr["MasterID"] = -1;
        dtweekend.Rows.Add(dr);
        dr.AcceptChanges();


        grvHolidayMaster.DataSource = dtweekend;
        grvHolidayMaster.DataBind();
        ViewState["dtweekend"] = dtweekend;
    }

    #region Grid Datatable

    private void FunPriInsertReceiving(string date, string desc, string EntryDate, string Active, string MasterID)
    {
        try
        {
            DataRow dr;
            dt = FunPriGetDetailsDataTable();
            if (desc.Trim() != string.Empty)
            {
                dr = dt.NewRow();
                dr["Tran_Details_ID"] = Convert.ToInt32(dt.Rows.Count) + 1;
                dr["date"] = date;
                dr["days"] = desc;
                dr["EntryDate"] = EntryDate;
                dr["Active"] = Active;
                dr["MasterID"] = "-1";
                dt.Rows.Add(dr);
            }
            //if (dt.Rows.Count < 1)
            //{
            //    dr = dt.NewRow();
            //    dr["Tran_Details_ID"] = "0";
            //    dr["date"] = "";
            //    dr["days"] = "";
            //    dr["EntryDate"] = "";
            //    dt.Rows.Add(dr);
            //}
            //else
            //{

            //}
            //if (dt.Rows.Count >= 1)
            //{
            //    //if (Convert.ToString(dt.Rows[0]["Tran_Details_ID"]) == "0")
            //    //{
            //    //    dt.Rows[0].Delete();
            //    //}
            //}
            ViewState["dt"] = dt;
            //FunPriFillGrid();
            FunPubBindReceiving(dt);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private DataTable FunPriGetDetailsDataTable()
    {
        try
        {
            if (ViewState["dt"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add("Tran_Details_ID");
                dt.Columns.Add("date");
                dt.Columns.Add("days");
                dt.Columns.Add("EntryDate");
                dt.Columns.Add("Active");
                dt.Columns.Add("MasterID");
                ViewState["dt"] = dt;
            }
            dt = (DataTable)ViewState["dt"];
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return dt;
    }

    private void FunPriFillGrid()
    {
        try
        {
            if (ViewState["dt"] != null)
            {

                Grvdetails.DataSource = (DataTable)ViewState["dt"];
                Grvdetails.DataBind();
            }
            //if (txtDocAmount.Text == 0)
            //{
            //    txtDocAmount.Text = "";
            //}
            //if (objSession.ProDimensionApplicableRW == false)
            //{
            //    grvGLSLDetails.Columns[5].Visible = false;
            //    //TabPanelDim.Enabled = false;
            //}
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void FunPubBindReceiving(DataTable dtWorkflow)
    {
        try
        {
            if (dtWorkflow.Rows.Count < 1)
            {
                DataRow dr;
                dt = FunPriGetDetailsDataTable();
                if (dt.Rows.Count < 1)
                {
                    dr = dt.NewRow();
                    dr["Tran_Details_ID"] = "0";
                    dr["date"] = "";
                    dr["days"] = "";
                    dr["EntryDate"] = "";
                    dr["Active"] = "";
                    dr["MasterID"] = "";
                    dt.Rows.Add(dr);
                }
                //if (dt.Rows.Count > 1)
                //{

                //  }
                ViewState["dt"] = dt;
                dtWorkflow = dt;
            }
            Grvdetails.DataSource = dtWorkflow;
            Grvdetails.DataBind();


            if (dtWorkflow.Rows.Count > 0 && Convert.ToString(dtWorkflow.Rows[0]["Tran_Details_ID"]) == "0")
            {
                Grvdetails.Rows[0].Visible = false;

            }
            if (dt != null)
            {
                if (Convert.ToString(dt.Rows[0]["Tran_Details_ID"]) == "0")
                {
                    dt.Rows[0].Delete();
                    ViewState["dt"] = dt;
                }
                dt = (DataTable)ViewState["dt"];
            }

            Grvdetails.Visible = true;
            //gvReceiving .HeaderRow
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            bool bolreturn = false;
            FunPubHolidaySave();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    public void FunPubHolidaySave()
    {
        int intReturnValue = 903;
        int intReturnCode = 0;
        int CheckedCount = 0;
        if (strMode == "C")
        {
            foreach (GridViewRow item in grvHolidayMaster.Rows)
            {
                Label lbldays = item.FindControl("lbldays") as Label;
                CheckBox chkCategory = item.FindControl("chkCategory") as CheckBox;
                if (chkCategory.Checked)
                {
                    CheckedCount = CheckedCount + 1;
                    if (ValidationCheck(1, lbldays.Text.Trim()))
                    {
                        return;
                    }
                }
            }
            if (FunDateValidation())
            {
                return;
            }
        }
        dt = (DataTable)ViewState["dt"];

        //if (dt.Rows.Count == 0)
        //{
        //    Utility.FunShowAlertMsg(this, "Add atleast one holiday details");
        //    return;
        //}
        if (strMode == "C")
        {
            if (CheckedCount == 0)
            {
                Utility.FunShowAlertMsg(this, "Add atleast one Weekend details");
                return;
            }
        }
        if (dt.Rows.Count == 0 && ViewState["Holiday"] == null)
        {
            Utility.FunShowAlertMsg(this, "Add atleast one Holiday details");
            return;
        }
        objAdminServiceClient = new S3GAdminServicesReference.S3GAdminServicesClient();
        objAdminServiceClient.Open();
        ObjFA_SYS_Master_DataTable = new SystemAdmin.S3G_SYSAD_Holiday_MstDataTable();
        try
        {
            obj_Row = ObjFA_SYS_Master_DataTable.NewS3G_SYSAD_Holiday_MstRow();
            obj_Row.Distinct_ID = intholidayid;
            obj_Row.Company_ID = intCompanyID.ToString();
            obj_Row.User_ID = intUserID.ToString();
            obj_Row.Year = Convert.ToString(ddlFinYear.SelectedValue);// ddlFinYear.SelectedValue();
            obj_Row.Location_ID = ddlLocation.SelectedValue.ToString();
            obj_Row.Date = Utility.StringToDate(txtDate.Text.ToString());
            obj_Row.XML_Weekend = FunPro_XML();
            //if ( obj_Row.XML_Weekend==null)
            //{
            //    Utility.FunShowAlertMsg(this, "Add atleast one Weekend details");
            //    return;
            //}

            if (ViewState["dt"] != null)
            {
                obj_Row.XML_Holiday = Utility.FunPubFormXml(dt, true);
            }
            ObjFA_SYS_Master_DataTable.AddS3G_SYSAD_Holiday_MstRow(obj_Row);
            intReturnValue = objAdminServiceClient.FunPubInsertHolidayMaster(SerializationMode.Binary, ClsPubSerialize.Serialize(ObjFA_SYS_Master_DataTable, SerializationMode.Binary), "C");

            

            if (intReturnValue == 0)
            {
                if (intholidayid > 0)
                {
                    //  strAlert = strAlert.Replace("__ALERT__", "Holiday details Modified Successfully");
                    //strKey = "Modify";
                    //strAlert = "Holiday details updated successfully";
                    //strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    //strRedirectPageView = "";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                    Utility.FunShowAlertMsg(this.Page, "Holiday details Modified Successfully", strRedirectPage);
                    //  btnSave.Enabled = false;
                    btnSave.Enabled_False();
                }
                else
                {
                    //btnSave.Enabled = false;
                    btnSave.Enabled_False();
                    //End here
                    strAlert = "Holiday Master details saved successfully";
                    strAlert += @"\n\nWould you like to add one more details?";
                    strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                    strRedirectPageView = "";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, "alert('Error in saving details');", true);
                // ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            }
            // Utility.FunShowValidationMsg(this, intReturnValue, strRedirectPageView, strRedirectPageView, strMode, false);
            // Utility.FunShowValidationMsg(this, strMode, intReturnValue);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    private void FunPriGetLocaList()
    {
        try
        {
            //    Dictionary<string, string> dictParam = new Dictionary<string, string>();
            //    dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            //    dictParam.Add("@User_ID", Convert.ToString(intUserID));
            //    if (strMode == "C")
            //        Procparam.Add("@Is_Active", "1");
            //    dictParam.Add("@Program_ID", "589");
            //    ddlLocation.BindDataTable(SPNames.BranchMaster_LIST, dictParam, new string[] { "Location_ID", "Location_Name" });
            //    if (ddlLocation.Items.Count == 2)
            //    {
            //        ddlLocation.SelectedIndex = 1;
            //    }
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@User_ID", Convert.ToString(intUserID));
            Procparam.Add("@Program_ID", "589");
            Procparam.Add("@OPTION", "1");
            ddlLocation.BindDataTable("S3G_GET_LOCATION", Procparam, new string[] { "BRANCH_ID", "BRANCH" });
            ddlLocation.Items[0].Text = "All";
            //System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--All--", "0");
            //ddlLocation.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Location");
        }
    }
    private void FunPriPageLoad()
    {
        try
        {
            ObjUserInfo = new UserInfo();
            //User Authorization
            bCreate = ObjUserInfo.ProCreateRW;
            bModify = ObjUserInfo.ProModifyRW;
            bQuery = ObjUserInfo.ProViewRW;
            intCompanyID = ObjUserInfo.ProCompanyIdRW;
            intUserID = ObjUserInfo.ProUserIdRW;
            //Code end

            //strConnectionName = objSession.ProConnectionName;
            if (Request.QueryString["qsMode"] != null)
                strMode = Convert.ToString(Request.QueryString["qsMode"]);
            else
                strMode = "C";
            strDateFormat = objSession.ProDateFormatRW;
            CalReceivedDate.Format = strDateFormat;
            FormsAuthenticationTicket fromTicket;
            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intholidayid = Convert.ToInt32(fromTicket.Name);
            }
            if (!IsPostBack)
            {
                txtDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtDate.ClientID + "','" + strDateFormat + "',false,  false);");
                // txtEffectiveToDate.Attributes.Add("onChange", "fnDoDate(this,'" + txtEffectiveToDate.ClientID + "','" + strDateFormat + "',false,  false);");

                FunPriInsertReceiving("", "", "", "", "");
                FunPriGetLocaList();
                ddlFinYear.Fill_FinancialYears();
                if (((intholidayid > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intholidayid > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }

                else
                {
                    datatable();
                    FunPriDisableControls(0);
                }
                ddlFinYear.Focus();
            }
            if (strMode == "Q" && strMode == "M")
            {
                grvWeekEnd.Visible = true;
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void Grvdetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Add")
            {
                TextBox txtReceivedDate = Grvdetails.FooterRow.FindControl("txtReceivedDate") as TextBox;
                TextBox txtFEntryDate = Grvdetails.FooterRow.FindControl("txtFEntryDate") as TextBox;
                txtReceivedDate.Attributes.Add("onChange", "fnDoDate(this,'" + txtReceivedDate.ClientID + "','" + strDateFormat + "',false,  false);");
                txtFEntryDate.Attributes.Add("onChange", "fnDoDate(this,'" + txtFEntryDate.ClientID + "','" + strDateFormat + "',false,  false);");

                TextBox txtFooterDescription = Grvdetails.FooterRow.FindControl("txtFooterDescription") as TextBox;

                if (!(ddlFinYear.SelectedValue != "0"))
                {
                    Utility.FunShowAlertMsg(this, "Select Financial Year");
                    ddlFinYear.Focus();
                    return;
                }
                if (txtReceivedDate.Text.Trim() == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Enter Date");
                    txtReceivedDate.Focus();
                    return;
                }
                if (txtFooterDescription.Text.Trim() == string.Empty)
                {
                    Utility.FunShowAlertMsg(this, "Enter Description");
                    txtFooterDescription.Focus();
                    return;
                }

                if (ViewState["dt"] != null)
                {
                    DataTable dtCheck = (DataTable)ViewState["dt"];
                    DataRow[] drCheck = dtCheck.Select("date='" + txtReceivedDate.Text.Trim() + "'");
                    if (drCheck.Length > 0)
                    {
                        Utility.FunShowAlertMsg(this, "Same Combination already exists");
                        txtReceivedDate.Focus();
                        return;
                    }
                }
                if (ValidationCheck(2, Utility.StringToDate(txtReceivedDate.Text.Trim()).ToString()))
                {
                    return;
                }
                if (ValidationCheckFinDate(2, Utility.StringToDate(txtReceivedDate.Text.Trim()).ToString()))
                {
                    txtReceivedDate.Focus();
                    return;
                }
                FunPriInsertReceiving(txtReceivedDate.Text.Trim(), txtFooterDescription.Text.Trim(), txtFEntryDate.Text.Trim(), "1", "");
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void Grvdetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblReceivedDate = (Label)Grvdetails.Rows[e.RowIndex].FindControl("lblReceivedDate");
            Label lblNarration = (Label)Grvdetails.Rows[e.RowIndex].FindControl("lblNarration");
            Label lblEntryDate = (Label)Grvdetails.Rows[e.RowIndex].FindControl("lblEntryDate");
            Label lblTranID = (Label)Grvdetails.Rows[e.RowIndex].FindControl("lblTranID");
            DataTable dtCheck = (DataTable)ViewState["dt"];
            if (dtCheck.Rows.Count > 0)
            {

                DataRow[] drGRow;
                drGRow = dtCheck.Select("Tran_Details_ID='" + lblTranID.Text + "'");
                //    drGRow = dtCheck.Select("date='" + lblReceivedDate.Text.Trim() + "'" + "days='" + lblNarration.Text.Trim() + "'" + "EntryDate='" + lblEntryDate.Text.Trim() + "'");
                if (lblReceivedDate.Text != string.Empty)
                {
                    if (Utility.StringToDate(lblReceivedDate.Text) < Utility.StringToDate(DateTime.Now.ToString()))
                    {
                        Utility.FunShowAlertMsg(this, "Cannot delete records");
                        return;
                    }
                }
                if (drGRow.Length > 0)
                {
                    foreach (var row in drGRow)
                        row.Delete();
                    dtCheck.AcceptChanges();
                }

            }
            ViewState["dt"] = dtCheck;
            FunPubBindReceiving(dtCheck);
            Grvdetails.FooterRow.Visible = true;

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void Grvdetails_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox txtIEntryDate = (TextBox)e.Row.FindControl("txtIEntryDate");
                AjaxControlToolkit.CalendarExtender CalEntryDate = e.Row.FindControl("CalEntryDate") as AjaxControlToolkit.CalendarExtender;
                if (CalEntryDate != null)
                    CalEntryDate.Format = strDateFormat;
                txtIEntryDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtIEntryDate.ClientID + "','" + strDateFormat + "',false,false);");
                txtIEntryDate.Text = DateTime.Now.ToString(strDateFormat);
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                TextBox txtReceivedDate = (TextBox)e.Row.FindControl("txtReceivedDate");
                AjaxControlToolkit.CalendarExtender CalReceivedDate = e.Row.FindControl("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                if (CalReceivedDate != null)
                    CalReceivedDate.Format = strDateFormat;
                txtReceivedDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtReceivedDate.ClientID + "','" + strDateFormat + "',false,false);");

                TextBox txtFEntryDate = (TextBox)e.Row.FindControl("txtFEntryDate");
                AjaxControlToolkit.CalendarExtender CalEntryDate = e.Row.FindControl("CalEntryDate") as AjaxControlToolkit.CalendarExtender;
                if (CalEntryDate != null)
                    CalEntryDate.Format = strDateFormat;
                txtFEntryDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtFEntryDate.ClientID + "','" + strDateFormat + "',false,false);");
                txtFEntryDate.Text = DateTime.Now.ToString(strDateFormat);
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void FunPriDisableControls(int intModeID)
    {

        switch (intModeID)
        {

            case 0: // Create Mode
                if (!bCreate)
                {

                }
                //if (strMode == "C")
                //{
                //     CheckBox chkIS_Active = (CheckBox)Grvdetails.FindControl("chkIS_Active");
                //    chkIS_Active.Checked = true;
                //}
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                txtDate.Text = DateTime.Now.ToString(strDateFormat);
                break;

            case 1: // Modify Mode
                if (!bModify)
                {
                    //btnSave.Enabled = false;
                    btnSave.Enabled_False();
                }
                FunPubLoadHoliday();
                Utility.ClearDropDownList(ddlLocation);
                CalReceivedDate.Enabled = false;
                //btnClear.Enabled = false;
                btnClear.Enabled_False();
                txtDate.ReadOnly = true;
                txtDate.Text = DateTime.Now.ToString(strDateFormat);
                break;

            case -1:// Query Mode
                if (!bQuery)
                {
                    Response.Redirect(strRedirectAddPage, false);
                }
                txtDate.Text = DateTime.Now.ToString(strDateFormat);
                FunPubLoadHoliday();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView, false);
                }
                Utility.ClearDropDownList(ddlLocation);
                CalReceivedDate.Enabled = false;
                //grvWeekEnd
                Grvdetails.Columns[Grvdetails.Columns.Count - 1].Visible = false;
                Grvdetails.FooterRow.Visible = false;
                //grvHolidayMaster
                // CheckBox chkcat = 
                grvHolidayMaster.Columns[grvHolidayMaster.Columns.Count - 1].Visible = false;
                //  CheckBox chkcategory = grvHolidayMaster.Rows.("chkcategory") as CheckBox;
                //chkcategory.Enabled = false;
                txtDate.ReadOnly = true;
                //btnSave.Enabled = false;
                btnSave.Enabled_False();
                //btnClear.Enabled = false;
                btnClear.Enabled_False();

                break;
        }
    }

    public void FunPubLoadHoliday()
    {
        try
        {
            if (Procparam != null)
                Procparam.Clear();
            else
                Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", intCompanyID.ToString());
            Procparam.Add("@Master_ID", intholidayid.ToString());
            DataSet dsholiday = Utility.GetDataset("S3G_SYSAD_GET_HOLIDAY_DTL", Procparam);
            ddlLocation.SelectedValue = dsholiday.Tables[0].Rows[0]["Location_id"].ToString();
            txtDate.Text = dsholiday.Tables[0].Rows[0]["Entry_Date"].ToString();
            ddlFinYear.SelectedValue = dsholiday.Tables[0].Rows[0]["FIN_YEAR"].ToString();
            ddlFinYear.ClearDropDownList();
            ViewState["Holiday"] = dsholiday.Tables[1];
            ViewState["dt"] = dsholiday.Tables[2];
            ViewState["dtweekend"] = dsholiday.Tables[3];
            foreach (GridViewRow item in grvHolidayMaster.Rows)
            {
                CheckBox chkcategory = (CheckBox)item.FindControl("chkCategory");
                chkcategory.Checked = Convert.ToBoolean(Convert.ToInt32(dsholiday.Tables[1].Rows[0]["STATUS"]));
                //if (strMode == "Q")
                //{
                //    chkcategory.Enabled = false;
                //}
            }
            if (dsholiday.Tables[1].Rows.Count > 0)
            {
                grvHolidayMaster.DataSource = dsholiday.Tables[1];
                grvHolidayMaster.DataBind();
            }
            if (dsholiday.Tables[2].Rows.Count > 0)
            {
                Grvdetails.DataSource = dsholiday.Tables[2];
                Grvdetails.DataBind();
            }
            if (strMode == "Q" || strMode == "M")
            {
                grvHolidayMaster.Visible = false;
                pnlHoliday.Visible = false;
            }
            if (strMode == "Q" || strMode == "M")
            {
                grvWeekEnd.DataSource = dsholiday.Tables[3];
                grvWeekEnd.DataBind();
                grvWeekEnd.Visible = true;
                pnlWeekDay.Visible = true;
                //   Grvdetails.FooterRow.Visible = false;
            }
            foreach (GridViewRow item in Grvdetails.Rows)
            {
                if (strMode == "M" || strMode == "Q")
                {
                    CheckBox chkIS_Active = (CheckBox)item.FindControl("chkIS_Active");
                    chkIS_Active.Checked = Convert.ToBoolean(Convert.ToInt32(dsholiday.Tables[2].Rows[0]["Active"]));
                    Grvdetails.DataSource = dsholiday.Tables[2];
                    Grvdetails.DataBind();
                    //Grvdetails.DataSource = dsholiday.Tables[2];
                    //Grvdetails.DataBind();
                    //if (strMode == "M")
                    //{
                    //    chkIS_Active.Checked = dsholiday.Tables[2].Rows[0]["Active"];
                }
            }
            foreach (GridViewRow item in Grvdetails.Rows)
            {
                CheckBox chkIS_Active = (CheckBox)item.FindControl("chkIS_Active");
                if (strMode == "Q")
                {
                    chkIS_Active.Enabled = false;
                }
            }
            foreach (GridViewRow item in grvWeekEnd.Rows)
            {
                CheckBox chkActive = (CheckBox)item.FindControl("chkActive");
                if (strMode == "Q")
                {
                    chkActive.Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        Clear();
    }

    private void Clear()
    {
        try
        {
            ddlLocation.SelectedIndex = -1;
            //  txtDate.Text = string.Empty;
            grvWeekEnd.DataSource = null;
            grvWeekEnd.DataBind();
            grvHolidayMaster.DataSource = null;
            grvHolidayMaster.DataBind();
            Grvdetails.DataSource = null;
            Grvdetails.DataBind();
            datatable();
            ViewState["dt"] = null;
            ddlFinYear.SelectedIndex = -1;
            FunPriInsertReceiving(string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);
         
            ddlFinYear.Focus();
        }
        catch(Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectViewPage);
    }

    protected string FunPro_XML()
    {
        sbReceivingXML = new StringBuilder();
        sbReceivingXML.Append("<Root>");
        if (strMode == "C")
        {
            foreach (GridViewRow item in grvHolidayMaster.Rows)
            {

                //if (((CheckBox)item.FindControl("chkCategory")).Checked == true)
                //{
                Label lbldays = item.FindControl("lbldays") as Label;
                Label lblHMasterID = item.FindControl("lblHMasterID") as Label;
                CheckBox chkCategory = item.FindControl("chkCategory") as CheckBox;

                sbReceivingXML.Append(" <Details Days='" + lbldays.Text.ToString() + "'");
                sbReceivingXML.Append(" MasterID='" + lblHMasterID.Text.ToString() + "'");
                sbReceivingXML.Append(" Active='" + chkCategory.Checked + "'");

                //sbReceivingXML.Append(" Active='" + (chkCategory.Checked == true) ? 1 : 0 + "'");

                sbReceivingXML.Append(" /> ");
                //+"MasterID='" + lblMasterID.Text.ToString() + "'

                //}
                // else
                // {
                //     Label lbldays = item.FindControl("lbldays") as Label;
                //     Label lblHMasterID = item.FindControl("lblHMasterID") as Label;
                //     CheckBox chkCategory = item.FindControl("chkCategory") as CheckBox;

                //     sbReceivingXML.Append(" <Details Days='" + lbldays.Text.ToString() + "'");
                //     sbReceivingXML.Append(" MasterID='" + lblHMasterID.Text.ToString() + "'");
                //     sbReceivingXML.Append(" Active='" + chkCategory.Checked + "'");

                //     //sbReceivingXML.Append(" Active='" + (chkCategory.Checked == true) ? 1 : 0 + "'");

                //     sbReceivingXML.Append(" /> ");
                //     //+"MasterID='" + lblMasterID.Text.ToString() + "'

                // }
            }
        }
        else
        {
            foreach (GridViewRow item in grvWeekEnd.Rows)
            {

                //if (((CheckBox)item.FindControl("chkCategory")).Checked == true)
                //{
                Label lblNarration = item.FindControl("lblNarration") as Label;
                Label lblMasterID = item.FindControl("lblMasterID") as Label;
                CheckBox chkActive = item.FindControl("chkActive") as CheckBox;

                sbReceivingXML.Append(" <Details Days='" + lblNarration.Text.ToString() + "'");
                sbReceivingXML.Append(" MasterID='" + lblMasterID.Text.ToString() + "'");
                sbReceivingXML.Append(" Active='" + chkActive.Checked + "'");

                //sbReceivingXML.Append(" Active='" + (chkCategory.Checked == true) ? 1 : 0 + "'");

                sbReceivingXML.Append(" /> ");
                //+"MasterID='" + lblMasterID.Text.ToString() + "'

                //}
                // else
                // {
                //     Label lbldays = item.FindControl("lbldays") as Label;
                //     Label lblHMasterID = item.FindControl("lblHMasterID") as Label;
                //     CheckBox chkCategory = item.FindControl("chkCategory") as CheckBox;

                //     sbReceivingXML.Append(" <Details Days='" + lbldays.Text.ToString() + "'");
                //     sbReceivingXML.Append(" MasterID='" + lblHMasterID.Text.ToString() + "'");
                //     sbReceivingXML.Append(" Active='" + chkCategory.Checked + "'");

                //     //sbReceivingXML.Append(" Active='" + (chkCategory.Checked == true) ? 1 : 0 + "'");

                //     sbReceivingXML.Append(" /> ");
                //     //+"MasterID='" + lblMasterID.Text.ToString() + "'

                // }
            }
        }
        sbReceivingXML.Append("</Root>");
        return sbReceivingXML.ToString();
    }

    # endregion
    protected void grvWeekEnd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (grvWeekEnd.Rows.Count == 0)
        {
            grvWeekEnd.EmptyDataText = "No Record Found";
        }
    }
    //grvHolidayMaster
    protected void chkIS_Active_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkHoliday = (CheckBox)sender;
        GridViewRow gvHRow = (GridViewRow)chkHoliday.Parent.Parent;
        CheckBox chkIS_Active = gvHRow.FindControl("chkIS_Active") as CheckBox;
        Label lblHMasterID = gvHRow.FindControl("lblHMasterID") as Label;
        Label lblReceivedDate = gvHRow.FindControl("lblReceivedDate") as Label;
                
        if (lblReceivedDate.Text != string.Empty)
        {
            if (chkHoliday.Checked == false)
            {
                if (Utility.StringToDate(lblReceivedDate.Text) < Utility.StringToDate(DateTime.Now.ToString()))
                {
                    Utility.FunShowAlertMsg(this, Resources.ValidationMsgs.HOLI_4);
                    chkIS_Active.Checked = true;
                    return;
                }
            }
        }
        DataTable dt = (DataTable)ViewState["dt"];
        DataRow[] dHRow = dt.Select("MasterID ='" + lblHMasterID.Text + "'");
        if (dHRow.Length > 0)
        {
            foreach (DataRow dr in dHRow)
            {
                dr["Active"] = (chkIS_Active.Checked == true) ? 1 : 0;
                dt.AcceptChanges();
            }
            ViewState["dt"] = dt;
        }
    }
    //grvWeekEnd
    protected void chkActive_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkWeekday = (CheckBox)sender;
        GridViewRow gvRow = (GridViewRow)chkWeekday.Parent.Parent;
        CheckBox chActive = gvRow.FindControl("chkActive") as CheckBox;
        Label lblMasterID = gvRow.FindControl("lblMasterID") as Label;

        DataTable dtweekend = (DataTable)ViewState["dtweekend"];
        DataRow[] dRow = dtweekend.Select("MasterID ='" + lblMasterID.Text + "'");

        if (dRow.Length > 0)
        {
            foreach (DataRow dr in dRow)
            {
                dr["Active"] = (chActive.Checked == true) ? 1 : 0;
                dtweekend.AcceptChanges();
            }
            ViewState["dtweekend"] = dtweekend;
        }

    }
    private Boolean ValidationCheck(int Option, string strDate)
    {
        if (Procparam != null)
            Procparam.Clear();
        else
            Procparam = new Dictionary<string, string>();
        Procparam.Add("@Company_ID", intCompanyID.ToString());
        Procparam.Add("@FIN_YEAR", ddlFinYear.SelectedValue);
        Procparam.Add("@LOCATION_ID", ddlLocation.SelectedValue);
        if (Option == 1)// Week End
        {
            if (strMode == "C")
            {
                Procparam.Add("@WEEK_DAY", strDate);
            }
        }
        else if (Option == 2)
        {
            if (strMode != "Q")
            {
                Procparam.Add("@HOLI_DAY", strDate);
            }
        }
        DataTable dt = Utility.GetDefaultData("S3G_SYSAD_GET_HOLIDAY_CHK", Procparam);
        if (dt.Rows.Count > 0)
        {
            if (Convert.ToInt32(dt.Rows[0]["COUNTS"]) > 0)
            {
                if (Option == 1)
                {
                    Utility.FunShowAlertMsg(this, Resources.ValidationMsgs.HOLI_1);
                    return true;
                }
                else if (Option == 2)
                {
                    Utility.FunShowAlertMsg(this, Resources.ValidationMsgs.HOLI_2);
                    return true;
                }
                return false;
            }
            return false;
        }
        return false;
    }

    private Boolean ValidationCheckFinDate(int Option, string strDate)
    {
        try
        {
            if (Option == 2)
            {
                string[] Years = ddlFinYear.SelectedValue.Split('-');
                DateTime startDate = new DateTime(Convert.ToInt32(Years[0]), 1, 1);
                DateTime endDate = new DateTime(Convert.ToInt32(Years[0]), 12, 31);
                DateTime dtholi = new DateTime();
                dtholi = Utility.StringToDate(strDate);
                if (!(dtholi >= startDate && dtholi <= endDate))
                {
                    Utility.FunShowAlertMsg(this, Resources.ValidationMsgs.HOLI_3);
                    return true;
                }
            }
        }
        catch(Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return false;
    }

    protected void ddlFinYear_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlFinYear.SelectedIndex > 0)
            {
                ViewState["dt"] = null;                
                FunPriInsertReceiving(string.Empty, string.Empty, string.Empty, string.Empty, string.Empty);
                ddlFinYear.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    /// <summary>
    /// To Check Same Combination already exists
    /// </summary>
    /// <returns></returns>
    private Boolean FunDateValidation()
    {
        bool blnIsDuplicate = false;
        try
        {

            Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", Convert.ToString(intCompanyID));
            Procparam.Add("@Financial_Year", Convert.ToString(ddlFinYear.SelectedValue));
            Procparam.Add("@Location_ID", Convert.ToString(ddlLocation.SelectedValue));
            DataTable dtCheck = Utility.GetDefaultData("S3G_SYSAD_GET_HOLIDAY_CHECK", Procparam);
            if (dtCheck.Rows.Count > 0)
            {
                if (Convert.ToString(dtCheck.Rows[0]["IS_CHECK"]) != string.Empty && Convert.ToInt32(dtCheck.Rows[0]["IS_CHECK"])>0)
                {
                    Utility.FunShowAlertMsg(this, "Same Combination Already Exists");
                    ddlLocation.Focus();
                    blnIsDuplicate = true;
                }
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex, "Holiday Master");            
        }
        return blnIsDuplicate;
    }
}