#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name			: Month and Year Lock
/// Created By			: Manikandan. R
/// Created Date		: 06-April-2012
/// Modified on:26-12-2019
/// Purpose : Added  As per narein mail Close date displayed based on Location and Open date 

/// <Program Summary>
#endregion

#region Namespaces
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using FA_BusEntity;
using System.Globalization;
using System.Text;
#endregion


public partial class System_Admin_FAMonthAndYearLock : ApplyThemeForProject_FA
{
    #region Intialization
    int intGPSId = 0;
    int intMnthIdId = 0;
    int intMnthEndDetId = 0;
    int intErrCode = 0;
    int intMaxMonth;
    int intUser_ID = 0;
    int intCompany_ID = 0;
    string strDateFormat;
    static bool boolGPSDone = true;
    bool bModify = false;
    bool bQuery = false;
    bool bCreate = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    string strConnectionName = string.Empty;
    string strMsg = "";
    string strAlertMsg = "";
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objAdminClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable objDAyOpenDataTable;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSERow objDAyOpenow;

    FASerializationMode SerMode = FASerializationMode.Binary;
    string strKey = "Insert";
    string strMode;
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "~/FA_System Admin/FADayOpenClose_View.aspx";
    string strRedirectView = "window.location.href='../FA_System%20Admin/FADayOpenClose_View.aspx';";
 //   string StrViewPage = "FADayOpenClose_View.aspx";
    string strRedirectPage;
    StringBuilder strMonthBuilder;
    StringBuilder strMonthBuilderRev;
    FASession ObjSession = new FASession();
    DataTable dt = new DataTable();
    FormsAuthenticationTicket fromTicket;
    int intTransId = 0;
    string RequestMode = string.Empty;
    #endregion
    


    #region Function For Disable Controls

    private void FunPriDisableControls(int intMode)
    {
        switch (intMode)
        {

            case 0://Create Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                boolGPSDone = false;
                break;

            case 1://Modify Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                break;

            case -1: // Query Mode
                //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                //ddlFinacialYear.Enabled = true;
                //ddlFinancialMonth.Enabled = true;
                //btnSave.Enabled = false;
                //chkMonthLock.Enabled = false;
                //chkYearLock.Enabled = false;
                break;
        }
    }
    #endregion


    #region Page Loading
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Page Load Intialization

        UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();

        intUser_ID = ObjUserInfo_FA.ProUserIdRW;
        intCompany_ID = ObjUserInfo_FA.ProCompanyIdRW;
        strDateFormat = ObjSession.ProDateFormatRW;
        string strFinYear = ObjSession.ProFinYearRW;
        string strStartYear = ObjSession.ProFinYearStartMonthRW;
        string strFinMonth = ObjSession.ProConnectionName;
        strConnectionName = ObjSession.ProConnectionName;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bIsActive = ObjUserInfo_FA.ProIsActiveRW;
        bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;



        #endregion
        if (!IsPostBack)
        {
            //lblYearLock.Text = strFinYear; //DateTime.Now.AddYears(intMaxMonth).Year.ToString() + "-" + DateTime.Now.AddYears(intMaxMonth).Year.ToString();

            ddlDayOpenClose.Focus();

            funPriLoadLocation();
            FunPrisetinitialDayClose();
            ceOpenDate.Format = strDateFormat;
           // CECloseDate.Format = strDateFormat;
            funPriVoidDisableControl();
            txtOpenDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtOpenDate.ClientID + "','" + strDateFormat + "',true,  false);");
            txtCloseDate.Attributes.Add("onblur", "fnDoDate(this,'" + txtCloseDate.ClientID + "','" + strDateFormat + "',true,  false);");
            txtOpeningBalance.SetDecimalPrefixSuffix(ObjSession.ProGpsPrefixRW, ObjSession.ProGpsSuffixRW, false, "Opening Balance");
            string strDateTime = DateTime.Now.Year.ToString() + "-" + DateTime.Now.Year.ToString();


            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intTransId = Convert.ToInt32(fromTicket.Name);
                RequestMode = Request.QueryString.Get("qsMode");
                strMode = RequestMode;
            }

            if (strMode == "Q")
            {
                FunPriDisableControls(-1);
                FunBindQuery(Convert.ToString(intTransId));
            }
            else
            {
                FunPriDisableControls(0);
            }


            //   string stn = btnSave.InnerText;
        }
    }
    #endregion


    // Added by Boobalan M on 15-Feb-2020 For Translander Query View
    private void FunBindQuery(string strQueryId)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();

        Procparam.Clear();
        Procparam.Add("@Company_ID", intCompany_ID.ToString());
        Procparam.Add("@USER_ID", intUser_ID.ToString());
        Procparam.Add("@Openclose_Id", strQueryId);
        DataSet Dset = Utility_FA.GetDataset("FA_GET_DAYOPENCLOSE_MST", Procparam);

        if (Dset.Tables.Count > 0)
        {
            ddlBranch.SelectedValue = Dset.Tables[0].Rows[0]["Location"].ToString();
            ddlDayOpenClose.SelectedValue = Dset.Tables[0].Rows[0]["Status"].ToString();
            txtOpenDate.Text = Dset.Tables[0].Rows[0]["OPENED_ON"].ToString();
            txtCloseDate.Text = Dset.Tables[0].Rows[0]["CLOSED_ON"].ToString();

            txtOpeningBalance.Text = Dset.Tables[0].Rows[0]["Opening_Balance"].ToString();
            txtCashReceiptNo.Text = Dset.Tables[0].Rows[0]["Cash_Receipt_No"].ToString();

            GRVDayClose.DataSource = Dset.Tables[1];
            GRVDayClose.DataBind();
            TextBox txtclosingBalanceFooter = (GRVDayClose).FooterRow.FindControl("txtclosingBalanceFooter") as TextBox;
            txtclosingBalanceFooter.Text = Dset.Tables[0].Rows[0]["Closing_Balance"].ToString();

            if (Dset.Tables[2].Rows.Count > 0)
            {
                if (Dset.Tables[2].Rows[0]["ERROR_MSG"].ToString() == "")
                {
                    // txtOpeningBalance.Text = Dset.Tables[2].Rows[0]["OPENING_BALANCE"].ToString();
                    // txtCashReceiptNo.Text = Dset.Tables[2].Rows[0]["CASH_RECEIPT_NO"].ToString();
                    txtDayStartDoneByClAuth.Text = Dset.Tables[2].Rows[0]["OPENED_BY_NAME"].ToString();
                    txtCashTalliedBy.Text = Dset.Tables[2].Rows[0]["CLOSED_BY_NAME"].ToString();
                    txtOpeningDate.Text = txtCloseDate.Text;
                    txtCashBalanceInBox.Text = Dset.Tables[2].Rows[0]["CLOSING_BALANCE"].ToString();
                    TxtTodayChallan.Text = Dset.Tables[2].Rows[0]["CHALLAN_AMT"].ToString();
                    TxtTodayRecipt.Text = Dset.Tables[2].Rows[0]["RECEIPT_AMT"].ToString();
                    TxtOpenBal.Text = Dset.Tables[2].Rows[0]["OPEN_BALANCE"].ToString();
                    hdnopen_id.Value = Dset.Tables[2].Rows[0]["OPEN_CLOSE_ID"].ToString();
        
                }
            }

        }

        pnlDayOpen.Visible = true;
        pnlCashDenominationDetails.Visible = true;
        pnldayClose.Visible = true;
        pnlDayCloseAuthorization.Visible = true;
        ddlBranch.Enabled = false;
        ddlDayOpenClose.Enabled = false;

        pnlDayOpen.Enabled = false;
        pnlCashDenominationDetails.Enabled = false;
        pnldayClose.Enabled = false;
        pnlDayCloseAuthorization.Enabled = false;
        btnSave.Enabled_False_FA();
        btnClear.Enabled_False_FA();

    }
    /// <summary>
    /// Main Save Button inserts and & Modifies Month and Year Lock Details into the Table
    /// Retruns Error Code
    /// </summary>
    /// <param name="bool blnValReturn"></param>


    /// <summary>
    /// Main Save Button inserts and & Modifies Month and Year Lock Details into Table
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
protected void btnSave_Click(object sender, EventArgs e)
    {
        int intReturnCode;

        intReturnCode = FunPubSave();
        if (ddlDayOpenClose.SelectedValue == "1")
        {
            if (intReturnCode == 0)
            {
                strMsg = "Data Added Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);

            }
            else
            {
                Utility_FA.FunShowValidationMsg_FA(this, intReturnCode);
                return;

            }

        }

        if (ddlDayOpenClose.SelectedValue == "2")
        {
            if (intReturnCode == 0)
            {
                strMsg = "Data Approved Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);

            }
            else
            {
                Utility_FA.FunShowValidationMsg_FA(this, intReturnCode);
                return;

            }

        }
        if (ddlDayOpenClose.SelectedValue == "3")
        {
            if (intReturnCode == 0)
            {
                strMsg = "Data Added Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);

            }
            else
            {
                Utility_FA.FunShowValidationMsg_FA(this, intReturnCode);
                return;

            }
        }

        if (ddlDayOpenClose.SelectedValue == "4")
        {
            if (intReturnCode == 0)
            {
                strMsg = "Data Approved Successfully";
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectView;
                ScriptManager.RegisterStartupScript(this, GetType(), "Display", strAlertMsg.ToString(), true);

            }
            else
            {
                Utility_FA.FunShowValidationMsg_FA(this, intReturnCode);
                return;

            }

        }



    }



    public int FunPubSave()
    {
        int intReturnValue = 0;
        int intReturnCode = 0;
        objAdminClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objAdminClient.Open();
        objDAyOpenDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_DAY_OPEN_CLOSEDataTable();


        try
        {

            objDAyOpenow = objDAyOpenDataTable.NewFA_DAY_OPEN_CLOSERow();
            if (ddlDayOpenClose.SelectedValue == "1")
            {

                objDAyOpenow.Day_Open_ID = "0";
                objDAyOpenow.Company_id = intCompany_ID.ToString();
                objDAyOpenow.OPENED_BY = intUser_ID.ToString();
                objDAyOpenow.Location_ID = ddlBranch.SelectedValue.ToString();
                objDAyOpenow.OPENED_ON = Utility.StringToDate(txtOpenDate.Text.ToString());
                objDAyOpenow.Opening_Balance = Convert.ToDecimal(txtOpeningBalance.Text.ToString());
                objDAyOpenow.CASH_RECEIPT_NO = txtCashReceiptNo.Text.ToString();
                objDAyOpenow.OPEN_CLOSE_TYPE = ddlDayOpenClose.SelectedValue;
                objDAyOpenDataTable.AddFA_DAY_OPEN_CLOSERow(objDAyOpenow);
                intReturnValue = objAdminClient.FunInsertDayOpenClose(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objDAyOpenDataTable, SerMode), strMode, strConnectionName);


            }
            if (ddlDayOpenClose.SelectedValue == "2")
            {

                objDAyOpenow.Day_Open_ID = hdnopen_id.Value;
                objDAyOpenow.Company_id = intCompany_ID.ToString();
                objDAyOpenow.Location_ID = ddlBranch.SelectedValue.ToString();

                objDAyOpenow.OPEN_CLOSE_TYPE = ddlDayOpenClose.SelectedValue;
                objDAyOpenDataTable.AddFA_DAY_OPEN_CLOSERow(objDAyOpenow);
                intReturnValue = objAdminClient.FunInsertDayOpenClose(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objDAyOpenDataTable, SerMode), strMode, strConnectionName);


            }
            if (ddlDayOpenClose.SelectedValue == "3")
            {
                TextBox txtclosingBalanceFooter = (GRVDayClose).FooterRow.FindControl("txtclosingBalanceFooter") as TextBox;
                if (txtclosingBalanceFooter.Text == "")
                {
                    Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter cash Balance in Box");
                    return 1;
                }

                objDAyOpenow.Day_Open_ID = "0";
                objDAyOpenow.Company_id = intCompany_ID.ToString();
                objDAyOpenow.Location_ID = ddlBranch.SelectedValue.ToString();
                objDAyOpenow.CLOSED_ON = Convert.ToString(Utility.StringToDate(txtCloseDate.Text.ToString()));
                objDAyOpenow.CLOSED_BY = intUser_ID.ToString();
                objDAyOpenow.Closing_Balance = Convert.ToDecimal(txtclosingBalanceFooter.Text.ToString());
                objDAyOpenow.XML_Denomination = GRVDayClose.FunPubFormXml();
                objDAyOpenow.OPEN_CLOSE_TYPE = ddlDayOpenClose.SelectedValue;
                objDAyOpenDataTable.AddFA_DAY_OPEN_CLOSERow(objDAyOpenow);
                intReturnValue = objAdminClient.FunInsertDayOpenClose(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objDAyOpenDataTable, SerMode), strMode, strConnectionName);


            }
            if (ddlDayOpenClose.SelectedValue == "4")
            {

                objDAyOpenow.Day_Open_ID = hdnopen_id.Value;
                objDAyOpenow.Company_id = intCompany_ID.ToString();
                objDAyOpenow.Location_ID = ddlBranch.SelectedValue.ToString();

                objDAyOpenow.OPEN_CLOSE_TYPE = ddlDayOpenClose.SelectedValue;
                objDAyOpenDataTable.AddFA_DAY_OPEN_CLOSERow(objDAyOpenow);
                intReturnValue = objAdminClient.FunInsertDayOpenClose(FASerializationMode.Binary, FAClsPubSerialize.Serialize(objDAyOpenDataTable, SerMode), strMode, strConnectionName);


            }



        }
        catch (Exception ex)
        {
            throw ex;
        }
        return intReturnValue;


    }



    protected void ddlDayOpenClose_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            funPriVoidDisableControl();

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        finally
        {

        }
    }
    private void funPriVoidDisableControl()
    {
        try
        {
            Funpriclearcontrols();
            //TxtCloseReceiptNo.Visible = false;
            //LblCloseReceiptNo.Visible = false;
            btnSave.Visible = true;
            if (ddlDayOpenClose.SelectedValue == "1")//open 
            {
                pnlDayOpen.Visible = true;
                txtDayStartDoneby.Visible = false;
                lblDayStartDoneBy.Visible = false;

                // ceOpenDate.Enabled = false;
                pnldayClose.Visible = false;
                pnlCashDenominationDetails.Visible = false;
                pnlDayCloseAuthorization.Visible = false;
                txtOpenDate.Text = DateTime.Now.ToString(strDateFormat);
                txtOpeningBalance.ReadOnly = false;
                txtCashReceiptNo.ReadOnly = false;

                txtOpenDate_TextChanged(null, null);

                // btnSave.InnerText =   "OK";


            }
            else if (ddlDayOpenClose.SelectedValue == "2")//Open Authorization
            {
                pnlDayOpen.Visible = false;
                pnlCashDenominationDetails.Visible = false;
                pnldayClose.Visible = false;
                pnlDayCloseAuthorization.Visible = false;
                txtOpenDate.Text = DateTime.Now.ToString(strDateFormat);
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();

                Procparam.Clear();
                Procparam.Add("@Company_ID", intCompany_ID.ToString());
                Procparam.Add("@USER_ID", intUser_ID.ToString());
                Procparam.Add("@OPTION", "1");
                Procparam.Add("@LOCATION_ID", ddlBranch.SelectedValue);
                Procparam.Add("@Open_Date", Convert.ToString(Utility.StringToDate(txtOpenDate.Text.ToString())));
                DataTable dt = Utility_FA.GetDefaultData("FA_GET_DAYOPENCLOSEDETAILS", Procparam);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ERROR_CODE"].ToString() == "1")
                    {
                        Utility.FunShowAlertMsg(this.Page, dt.Rows[0]["err_msg"].ToString());
                        btnSave.Visible = false;
                        return;
                    }
                    else
                    {
                        txtOpeningBalance.Text = dt.Rows[0]["OPENING_BALANCE"].ToString();
                        txtCashReceiptNo.Text = dt.Rows[0]["CASH_RECEIPT_NO"].ToString();
                        txtDayStartDoneby.Text = dt.Rows[0]["USER_NAME"].ToString();
                        hdnopen_id.Value = dt.Rows[0]["DAYOPEN_ID"].ToString();
                        txtOpenDate.Text = dt.Rows[0]["OPENED_ON"].ToString();
                        //TxtCloseReceiptNo.Text = dt.Rows[0]["Last_Receipt_No"].ToString();

                        //  btnSave.InnerText = "Approve";

                    }
                }
                else
                {

                }
                pnlDayOpen.Visible = true;
                txtDayStartDoneby.Visible = txtDayStartDoneby.ReadOnly = true;
                lblDayStartDoneBy.Visible = true;
                // ceOpenDate.Enabled = true;
                pnldayClose.Visible = false;
                pnlCashDenominationDetails.Visible = false;
                pnlDayCloseAuthorization.Visible = false;
                txtOpeningBalance.ReadOnly = true;
                txtCashReceiptNo.ReadOnly = true;
                //TxtCloseReceiptNo.Visible = true;
                //LblCloseReceiptNo.Visible = true;

            }
            else if (ddlDayOpenClose.SelectedValue == "3")
            {
                //Added  As per narein mail Close date displayed based on Location and Open date -Code starts
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                Procparam.Clear();
                Procparam.Add("@Company_ID", intCompany_ID.ToString());
                Procparam.Add("@USER_ID", intUser_ID.ToString());
                Procparam.Add("@OPTION", "2");
                Procparam.Add("@LOCATION_ID", ddlBranch.SelectedValue);
              
                DataTable dt = Utility_FA.GetDefaultData("FA_GET_DAYOPENCLOSEDETAILS", Procparam);
                if (dt.Rows.Count > 0)
                {
                    txtCloseDate.Text = dt.Rows[0]["OPENED_ON"].ToString();
                }
                //Added  As per narein mail Close date displayed based on Location and Open date -Code ends
                pnlDayOpen.Visible = false;
                txtDayStartDoneby.Visible = false;
                lblDayStartDoneBy.Visible = false;
                //ceOpenDate.Enabled = false;
                pnldayClose.Visible = true;
                pnlCashDenominationDetails.Visible = true;
                pnlDayCloseAuthorization.Visible = false;
                txtCloseDate.ReadOnly = true;//Added to set close date as non-editable
                //btnSave.InnerText = "Ok";
            }
            else if (ddlDayOpenClose.SelectedValue == "4")
            {
                pnlDayOpen.Visible = false;
                txtDayStartDoneby.Visible = false;
                lblDayStartDoneBy.Visible = false;
                // ceOpenDate.Enabled = false;
                pnldayClose.Visible = true;
                pnlCashDenominationDetails.Visible = false;
                pnlDayCloseAuthorization.Visible = true;
                // btnSave.InnerText = "Approve";
            }
            else if (ddlDayOpenClose.SelectedValue == "0")
            {
                pnlDayOpen.Visible = false;
                pnldayClose.Visible = false;
                pnlCashDenominationDetails.Visible = false;
                txtDayStartDoneby.Visible = false;
                lblDayStartDoneBy.Visible = false;
                pnlDayCloseAuthorization.Visible = false;
                // ceOpenDate.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }


    private void Funpriclearcontrols()
    {
        try
        {
            pnlDayOpen.Visible = false;
            txtDayStartDoneby.Text = "";
            FunPrisetinitialDayClose();
            txtOpenDate.Text = DateTime.Now.ToString(strDateFormat);
            txtOpeningBalance.Text = "";
            txtCashReceiptNo.Text = "";
            txtDayStartDoneby.Text = "";
            hdnopen_id.Value = "0";
            txtCloseDate.Text = "";

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPageView, false);
    }
    private void FunPrisetinitialDayClose()
    {
        try
        {

            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();

            Procparam.Clear();
            Procparam.Add("@Company_ID", intCompany_ID.ToString());
            DataTable dt = Utility_FA.GetDefaultData("FA_CASH_DENOMINATION", Procparam);
            ViewState["DAyclose"] = dt;
            if (dt.Rows.Count > 0)
            {
                GRVDayClose.DataSource = dt;
                GRVDayClose.DataBind();
            }
            else
            {
                GRVDayClose.EmptyDataText = "NO records found";
                GRVDayClose.DataBind();
            }
            foreach (GridViewRow grv in GRVDayClose.Rows)
            {

                TextBox lblCreditWeightage = (TextBox)grv.FindControl("lblCreditWeightage");
                lblCreditWeightage.SetDecimalPrefixSuffix(ObjSession.ProGpsPrefixRW, ObjSession.ProGpsSuffixRW, false, "No Of Coins");
                lblCreditWeightage.ReadOnly = true;
                //btnCashOk.Enabled_False();
            }
            // GRVDayClose.Rows[0].Visible = false;
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException);
            throw objException;
        }
        finally
        {
            dt.Dispose();
        }
    }

    private void FunPrigetOpenAuthDetails()
    {
        try
        {



            // GRVDayClose.Rows[0].Visible = false;
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException);
            throw objException;
        }
        finally
        {
            dt.Dispose();
        }
    }

    private void funPriLoadLocation()
    {
        try
        {
            Dictionary<string, string> Procparam;
            Procparam = new Dictionary<string, string>();
            DataTable dtCommon = new DataTable();
            DataSet Ds = new DataSet();
            UserInfo_FA Ufo = new UserInfo_FA();
            Procparam.Clear();
            Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
            Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
            Procparam.Add("@Program_Id", "26");
            Procparam.Add("@Is_Operational", "1");
            Procparam.Add("@PREFIXTEXT", null);
            ddlBranch.FillDataTable(Utility_FA.GetDefaultData("FA_Loca_List_AGT", Procparam), "ID", "Document_No");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void GRVDayClose_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GRVDayClose_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
    protected void GRVDayClose_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void GRVDayClose_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void GRVDayClose_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void GRVDayClose_RowCreated(object sender, GridViewRowEventArgs e)
    {

    }
    protected void GRVDayClose_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

        }

    }
    protected void lblToDays_TextChanged(object sender, EventArgs e)
    {
        TextBox img = (TextBox)sender;
        GridViewRow grvRow = (GridViewRow)img.Parent.Parent;
        TextBox lblToDays = (TextBox)grvRow.FindControl("lblToDays");
        Label lblFromDays = (Label)grvRow.FindControl("lblFromDays");
        TextBox lblCreditWeightage = (TextBox)grvRow.FindControl("lblCreditWeightage");
        TextBox txtclosingBalanceFooter = (TextBox)GRVDayClose.FooterRow.FindControl("txtclosingBalanceFooter");

        if (lblToDays.Text != "")
            lblCreditWeightage.Text = (Convert.ToDecimal(lblFromDays.Text.ToString()) * Convert.ToDecimal(lblToDays.Text.ToString())).ToString(Funsetsuffix());
        else
            lblCreditWeightage.Text = "0";

        if (txtclosingBalanceFooter.Text == "")
            txtclosingBalanceFooter.Text = "0";
        decimal decAmountSum = 0;
        foreach (GridViewRow rw in GRVDayClose.Rows)
        {

            TextBox lblCreditWeightagerw = (TextBox)rw.FindControl("lblCreditWeightage");
            if (lblCreditWeightagerw.Text != "")
                decAmountSum = decAmountSum + Convert.ToDecimal(lblCreditWeightagerw.Text.ToString());

        }

        //txtclosingBalanceFooter.Text = (Convert.ToDecimal(txtclosingBalanceFooter.Text.ToString()) + Convert.ToDecimal(lblCreditWeightage.Text.ToString())).ToString(Funsetsuffix());
        txtclosingBalanceFooter.Text = decAmountSum.ToString(Funsetsuffix());

    }

    private string Funsetsuffix()
    {

        int suffix = 1;
        FASession ObjSession = new FASession();
        suffix = ObjSession.ProGpsSuffixRW;

        //Procparam = new Dictionary<string, string>();
        //Procparam.Add("@Company_Id", intCompanyID.ToString());
        //if (ddlCurrency.SelectedIndex > 0)
        //{
        //    if (Convert.ToInt16(ddlCurrency.SelectedValue) > 0)
        //        Procparam.Add("@Currency_Id", ddlCurrency.SelectedValue);
        //}
        //DataTable dt = new DataTable();
        //dt = Utility_FA.GetDefaultData("FA_GET_CURR_DCMLS", Procparam);
        //if (dt.Rows.Count > 0)
        //{
        //    if (!string.IsNullOrEmpty(dt.Rows[0]["DecimalSuffix"].ToString()))
        //        suffix = Convert.ToInt16(dt.Rows[0]["DecimalSuffix"].ToString());
        //}

        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }
    protected void btnClear_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("~/FA_System Admin/FADayOpenClose.aspx", false);

    }
    protected void txtOpenDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            txtOpeningBalance.Text = string.Empty;

            Dictionary<string, string> Procparam = new Dictionary<string, string>();

            UserInfo_FA Ufo = new UserInfo_FA();
            Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
            Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
            Procparam.Add("@Location_ID", ddlBranch.SelectedValue);
            Procparam.Add("@Open_Date", Convert.ToString(Utility.StringToDate(txtOpenDate.Text)));
            Procparam.Add("@DAYOPEN_TYPE", ddlDayOpenClose.SelectedValue);
            DataTable dt = Utility_FA.GetDefaultData("FA_GET_DAYOPEN_DETAILS", Procparam);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["ERROR_MSG"].ToString() != "")
                {
                    Utility.FunShowAlertMsg(this.Page, dt.Rows[0]["ERROR_MSG"].ToString());
                    txtOpenDate.Text = "";
                    btnSave.Enabled_False();
                    return;
                }
                //Added on 16-Dec-2019 Starts here
                //To Get Previous Day Closing balance as Opening balance for next Day instructed by Mr.Narein
                else if (Convert.ToInt32(ddlDayOpenClose.SelectedValue) == 1) //Day Open
                {
                    txtOpeningBalance.Text = Convert.ToString(dt.Rows[0]["OPENING_BALANCE"]);
                    txtCashReceiptNo.Text = Convert.ToString(dt.Rows[0]["CASH_RECEIPT_NO"]);
                }
                //Added on 16-Dec-2019 Ends here
                else
                {
                    txtOpeningBalance.Text = dt.Rows[0]["OPENING_BALANCE"].ToString();
                    txtCashReceiptNo.Text = dt.Rows[0]["CASH_RECEIPT_NO"].ToString();
                    txtDayStartDoneby.Text = dt.Rows[0]["OPENED_BY_NAME"].ToString();
                    hdnopen_id.Value = dt.Rows[0]["OPEN_CLOSE_ID"].ToString();
                    if (Ufo.ProUserIdRW.ToString() == dt.Rows[0]["OPENED_BY"].ToString())
                    {
                        Utility.FunShowAlertMsg(this.Page, "Day open and authorise cannot be done by same user");
                        btnSave.InnerText = "Approve";
                        btnSave.Enabled_False();
                        return;
                    }
                    else
                    {
                        btnSave.InnerText = "Approve";
                        btnSave.Enabled_True();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void txtCloseDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddlDayOpenClose.SelectedValue == "4")
            {
                Dictionary<string, string> Procparam;
                Procparam = new Dictionary<string, string>();
                DataTable dtCommon = new DataTable();

                UserInfo_FA Ufo = new UserInfo_FA();
                Procparam.Clear();
                Procparam.Add("@Company_ID", Convert.ToString(Ufo.ProCompanyIdRW));
                Procparam.Add("@User_ID", Convert.ToString(Ufo.ProUserIdRW));
                Procparam.Add("@Location_ID", ddlBranch.SelectedValue);
                Procparam.Add("@Close_Date", Convert.ToString(Utility.StringToDate(txtCloseDate.Text)));
                Procparam.Add("@DAYOPEN_TYPE", ddlDayOpenClose.SelectedValue);
                DataTable dt = Utility_FA.GetDefaultData("FA_GET_DAYOPEN_DETAILS", Procparam);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ERROR_MSG"].ToString() != "")
                    {
                        Utility.FunShowAlertMsg(this.Page, dt.Rows[0]["ERROR_MSG"].ToString());
                        txtCloseDate.Text = "";
                        return;
                    }
                    else
                    {
                        // txtOpeningBalance.Text = dt.Rows[0]["OPENING_BALANCE"].ToString();
                        // txtCashReceiptNo.Text = dt.Rows[0]["CASH_RECEIPT_NO"].ToString();
                        txtDayStartDoneByClAuth.Text = dt.Rows[0]["OPENED_BY_NAME"].ToString();
                        txtCashTalliedBy.Text = dt.Rows[0]["CLOSED_BY_NAME"].ToString();
                        txtOpeningDate.Text = txtCloseDate.Text;
                        txtCashBalanceInBox.Text = dt.Rows[0]["CLOSING_BALANCE"].ToString();
                        TxtTodayChallan.Text = dt.Rows[0]["CHALLAN_AMT"].ToString();
                        TxtTodayRecipt.Text = dt.Rows[0]["RECEIPT_AMT"].ToString();
                        TxtOpenBal.Text = dt.Rows[0]["OPEN_BALANCE"].ToString();
                        hdnopen_id.Value = dt.Rows[0]["OPEN_CLOSE_ID"].ToString();
                        if (Ufo.ProUserIdRW.ToString() == dt.Rows[0]["CLOSED_BY"].ToString())
                        {
                            Utility.FunShowAlertMsg(this.Page, "Day Close and authorise cannot be done by same user");
                            btnSave.InnerText = "Approve";
                            btnSave.Enabled_False();
                            return;
                        }
                        else
                        {
                            btnSave.InnerText = "Approve";
                            btnSave.Enabled_True();
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
    protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlDayOpenClose.SelectedValue = "0";
            pnldayClose.Visible = false;
            pnlDayOpen.Visible = false;
            pnlDayCloseAuthorization.Visible = false;
            pnlCashDenominationDetails.Visible = false;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }
}
