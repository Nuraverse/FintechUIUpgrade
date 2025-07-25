#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Orgination 
/// Screen Name			: Customer Master
/// Created By			: Prabhu K
/// Created Date		: 22-July-2010
/// Purpose	            : 
#endregion

#region Namespaces
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;
using S3GBusEntity;
using System.Collections;
using System.Configuration;
using System.ServiceModel;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
#endregion

public partial class Origination_S3GOrgCustomerMaster_View : ApplyThemeForProject
{

    #region Paging Config

    string strRedirectPage = "~/Credit Admin/S3GOrgCustomerMaster_Add.aspx";
    int intNoofSearch = 3;
    string[] arrSortCol = new string[] { "Customer_Name", "Customer_Code", "Name", "" };
    string strProcName = SPNames.S3G_ORG_GetCustomerDetails_Paging;
    public static DataTable dtUserRights;
    Dictionary<string, string> Procparam = null;

    ArrayList arrSearchVal = new ArrayList(1);
    int intUserID = 0;
    int intCompanyID = 0;
    int intProgramID = 45;
    PagingValues ObjPaging = new PagingValues();

    //User Authorization variable declaration
    UserInfo ObjUserInfo = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Declaration end

    public delegate void PageAssignValue(int ProPageNumRW, int intPageSize);

    public int ProPageNumRW
    {
        get;
        set;
    }

    public int ProPageSizeRW
    {
        get;
        set;

    }

    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;
        ProPageSizeRW = intPageSize;
        FunPriBindGrid();
    }
    #endregion

    #region Page Load
    protected void Page_Load(object sender, EventArgs e)
    {
        ObjUserInfo = new UserInfo();
        intCompanyID = ObjUserInfo.ProCompanyIdRW;
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);

        if (Request.QueryString.Get("qsType") != null)
        {
            if (Request.QueryString.Get("qsType").ToString() == "GL")
            {
                strRedirectPage = "~/Credit Admin/S3GOrgCustomerMaster_Add_GL.aspx";
            }
        }

        #region Paging Config
        arrSearchVal = new ArrayList(intNoofSearch);
        ProPageNumRW = 1;

        //User Authorization
        ObjUserInfo = new UserInfo();
        intCompanyID = ObjUserInfo.ProCompanyIdRW;
        intUserID = ObjUserInfo.ProUserIdRW;

        bCreate = ObjUserInfo.ProCreateRW;
        bModify = ObjUserInfo.ProModifyRW;
        bQuery = ObjUserInfo.ProViewRW;
        bIsActive = ObjUserInfo.ProIsActiveRW;
        //bMakerChecker = ObjUserInfo.ProMakerCheckerRW;
        //Authorization Code end

        TextBox txtPageSize = (TextBox)ucCustomPaging.FindControl("txtPageSize");
        if (txtPageSize.Text != "")
            ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
        else
            ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));

        PageAssignValue obj = new PageAssignValue(this.AssignValue);
        ucCustomPaging.callback = obj;
        ucCustomPaging.ProPageNumRW = ProPageNumRW;
        ucCustomPaging.ProPageSizeRW = ProPageSizeRW;
        System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"] = Convert.ToString(intCompanyID);
        System.Web.HttpContext.Current.Session["User_Id"] = Convert.ToString(intUserID);
        
        ucCustomerCodeLov.strControlID = ucCustomerCodeLov.ClientID.ToString();
        TextBox txtCustItemNumber = ((TextBox)ucCustomerCodeLov.FindControl("txtItemName"));
        txtCustItemNumber.Style["display"] = "block";
        txtCustItemNumber.Attributes.Add("onfocus", "fnLoadCustomer()");
        txtCustItemNumber.Attributes.Add("readonly", "false");
        txtCustItemNumber.Width = 0;
        txtCustItemNumber.TabIndex = -1;
        txtCustItemNumber.BorderStyle = BorderStyle.None;

        #endregion

        if (!IsPostBack)
        {
            ucCustomerCodeLov.ServiceMethod = "GetCustomerList";
            lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Details);
            FunPriBindGrid();
            
        }
        //User Authorization
        if (!bIsActive)
        {
            grvPaging.Columns[1].Visible = false;
            grvPaging.Columns[0].Visible = false;
            //btnCreate.Enabled = false;
            return;
        }
        //if (!bModify)
        //{
        //    grvPaging.Columns[1].Visible = false;
        //}
        //if (!bQuery)
        //{
        //    grvPaging.Columns[0].Visible = false;
        //}
        //if (!bCreate)
        //{
        //    btnCreate.Enabled = false;
        //}
        //Authorization Code end
        FunPubSetIndex(1);
        //Create or Delete(Cancel) 1- Create, 3-Delete
        if (IsUserAccessChecker(1))
        {
            btnCreate.Enabled_True();
        }
        else
        {
            btnCreate.Enabled_False();
        }
        //TextBox txtHeaderSearch2 = (TextBox)grvPaging.HeaderRow.FindControl("txtHeaderSearch2");
        //txtHeaderSearch2.Focus();
        TextBox txtCustItemNumbers = ((TextBox)ucCustomerCodeLov.FindControl("TxtName"));
        txtCustItemNumbers.Focus();
    }
    #endregion

    #region Page Events

    protected void grvPaging_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            //User Authorization
            Label lblUserID = (Label)e.Row.FindControl("lblUserID");
            Label lblUserLevelID = (Label)e.Row.FindControl("lblUserLevelID");
            ImageButton imgbtnEdit = (ImageButton)e.Row.FindControl("imgbtnEdit");
            ImageButton imgbtnQuery = (ImageButton)e.Row.FindControl("imgbtnQuery");
            //Modify Access
            if (IsUserAccessChecker(2))// || (ObjUserInfo.IsUserMakerChecker(Convert.ToInt32(lblUserID.Text)))
            {
                imgbtnEdit.Enabled = true;
            }
            else
            {
                imgbtnEdit.Enabled = false;
                imgbtnEdit.CssClass = "styleGridEditDisabled";
            }
            //Create Access
            if (IsUserAccessChecker(4))// || (ObjUserInfo.IsUserMakerChecker(Convert.ToInt32(lblUserID.Text)))
            {
                imgbtnQuery.Enabled = true;
            }
            else
            {
                imgbtnQuery.Enabled = false;
                imgbtnQuery.CssClass = "styleGridEditDisabled";
            }
            //if ((bModify) && (ObjUserInfo.IsUserLevelUpdate(Convert.ToInt32(lblUserID.Text), Convert.ToInt32(lblUserLevelID.Text))))
            //{
            //    imgbtnEdit.Enabled = true;
            //}
            //else
            //{
            //    imgbtnEdit.Enabled = false;
            //    imgbtnEdit.CssClass = "styleGridEditDisabled";
            //}
            //Authorization code end

        }

    }

    protected void grvCustomerMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower() == "modify")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            Response.Redirect(strRedirectPage + "?qsCustomerId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=M");
        }
        if (e.CommandName.ToLower() == "query")
        {
            FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(e.CommandArgument.ToString(), false, 0);
            Response.Redirect(strRedirectPage + "?qsCustomerId=" + FormsAuthentication.Encrypt(Ticket) + "&qsMode=Q");
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        Response.Redirect(strRedirectPage, false);
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        try
        {
            TextBox txtName = ucCustomerCodeLov.FindControl("txtName") as TextBox;
            txtName.Text = string.Empty;
            ProPageNumRW = 1;
            hdnSearch.Value = "";
            hdnOrderBy.Value = "";
            hdnCustId.Value = string.Empty;
            ViewState["hdnCustorEntityID"] = string.Empty;            
            ucCustomerCodeLov.ClearAddressControls();
            FunPriClearSearchValue();
            FunPriBindGrid();
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    #endregion

    #region Page Methods

    private void FunPriBindGrid()
    {
        try
        {
            //Paging Properties set
            dtUserRights = Utility.UserAccess(0, 0, intUserID, intProgramID, intCompanyID);
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            ObjPaging.ProCompany_ID = intCompanyID;
            ObjPaging.ProUser_ID = intUserID;
            ObjPaging.ProTotalRecords = intTotalRecords;
            ObjPaging.ProCurrentPage = ProPageNumRW;
            ObjPaging.ProPageSize = ProPageSizeRW;
            ObjPaging.ProSearchValue = hdnSearch.Value;
            ObjPaging.ProOrderBy = hdnOrderBy.Value;

            FunPriGetSearchValue();


            Procparam = new Dictionary<string, string>();
            if(hdnCustId.Value!=string.Empty)
            {
                Procparam.Add("@CUSTOMER_ID", hdnCustId.Value);
            }
            grvPaging.BindGridView(strProcName, Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                grvPaging.Rows[0].Visible = false;
            }

            FunPriSetSearchValue();

            ucCustomPaging.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucCustomPaging.setPageSize(ProPageSizeRW);

            //Paging Config End
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
        }

    }

    #region Paging and Searching Methods For Grid


    private void FunPriGetSearchValue()
    {
        arrSearchVal = grvPaging.FunPriGetSearchValue(arrSearchVal, intNoofSearch);
    }

    private void FunPriClearSearchValue()
    {
        grvPaging.FunPriClearSearchValue(arrSearchVal);
    }

    private void FunPriSetSearchValue()
    {
        grvPaging.FunPriSetSearchValue(arrSearchVal);
    }

    protected void FunProHeaderSearch(object sender, EventArgs e)
    {

        string strSearchVal = string.Empty;
        TextBox txtboxSearch;
        try
        {
            txtboxSearch = ((TextBox)sender);

            FunPriGetSearchValue();
            //Replace the corresponding fields needs to search in sqlserver

            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (arrSearchVal[iCount].ToString() != "")
                {
                    strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
                }
            }

            if (strSearchVal.StartsWith(" and "))
            {
                strSearchVal = strSearchVal.Remove(0, 5);
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)grvPaging.HeaderRow.FindControl(txtboxSearch.ID)).Focus();

        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private string FunPriGetSortDirectionStr(string strColumn)
    {
        string strSortDirection = string.Empty;
        string strSortExpression = string.Empty;
        // By default, set the sort direction to ascending.
        string strOrderBy = string.Empty;
        strSortDirection = "DESC";
        try
        {
            // Retrieve the last strColumn that was sorted.
            // Check if the same strColumn is being sorted.
            // Otherwise, the default value can be returned.
            strSortExpression = hdnSortExpression.Value;
            if ((strSortExpression != "") && (strSortExpression == strColumn) && (hdnSortDirection.Value != null) && (hdnSortDirection.Value == "DESC"))
            {
                strSortDirection = "ASC";
            }
            // Save new values in hidden control.
            hdnSortDirection.Value = strSortDirection;
            hdnSortExpression.Value = strColumn;
            strOrderBy = " " + strColumn + " " + strSortDirection;
            hdnOrderBy.Value = strOrderBy;
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
        return strSortDirection;
    }

    protected void FunProSortingColumn(object sender, EventArgs e)
    {
        arrSearchVal = new ArrayList(intNoofSearch);
        var imgbtnSearch = string.Empty;
        try
        {
            LinkButton lnkbtnSearch = (LinkButton)sender;
            string strSortColName = string.Empty;
            //To identify image button which needs to get chnanged
            imgbtnSearch = lnkbtnSearch.ID.Replace("lnkbtn", "imgbtn");

            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                if (lnkbtnSearch.ID == "lnkbtnSort" + (iCount + 1).ToString())
                {
                    strSortColName = arrSortCol[iCount].ToString();
                    break;
                }
            }

            string strDirection = FunPriGetSortDirectionStr(strSortColName);
            FunPriBindGrid();
            if (strDirection == "ASC")
            {
                ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {

                ((Button)grvPaging.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        {
            lblErrorMessage.InnerText = objFaultExp.Detail.ProReasonRW;
        }
        catch (Exception ex)
        {
            lblErrorMessage.InnerText = ex.Message;
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    public bool IsUserAccessChecker(int Option)
    {
        if (dtUserRights != null)
        {
            if (dtUserRights.Rows.Count > 0)
            {
                if (Option == 1)//Create
                {
                    if (Convert.ToBoolean(dtUserRights.Rows[0]["ADDACCESS"]))
                    {
                        return true;
                    }
                }
                else if (Option == 2)//Modify
                {
                    if (Convert.ToBoolean(dtUserRights.Rows[0]["MODIFYACESS"]))
                    {
                        return true;
                    }
                }
                if (Option == 3)//Delete
                {
                    if (Convert.ToBoolean(dtUserRights.Rows[0]["DELETEACCESS"]))
                    {
                        return true;
                    }
                }
                else if (Option == 4)//View/Querry
                {
                    if (Convert.ToBoolean(dtUserRights.Rows[0]["VIEWACCESS"]))
                    {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    protected void ucCustomerCodeLov_Item_Selected(object Sender, EventArgs e)
    {
        string strCustomerName = string.Empty;
        Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
        btnLoadCust.Focus();
        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
        TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
        hdnCID.Value = ucCustomerCodeLov.SelectedValue;
        hdnCustId.Value = ucCustomerCodeLov.SelectedValue;
        btnLoadCustomer_Click(null, null);
    }

    [System.Web.Services.WebMethod]
    public static string[] GetCustomerList(String prefixText, int count)
    {
        Dictionary<string, string> Procparam;
        Procparam = new Dictionary<string, string>();
        List<String> suggetions = new List<String>();
        DataTable dtCommon = new DataTable();
        DataSet Ds = new DataSet();

        Procparam.Clear();
        Procparam.Add("@COMPANY_ID", System.Web.HttpContext.Current.Session["AutoSuggestCompanyID"].ToString());
        Procparam.Add("@LOV", "CUS_ACCA");
        if (System.Web.HttpContext.Current.Session["User_Id"] != null && Convert.ToString(System.Web.HttpContext.Current.Session["User_Id"]) != string.Empty)
        {
            Procparam.Add("@User_Id", Convert.ToString(System.Web.HttpContext.Current.Session["User_Id"]));
        }
        Procparam.Add("@PrefixText", prefixText);
        suggetions = Utility.GetSuggestions(Utility.GetDefaultData("SA_GET_CUSTOMER_AGT", Procparam));
        return suggetions.ToArray();
    }

    protected void btnLoadCustomer_Click(object sender, EventArgs e)
    {
        string strCustomerName = string.Empty;
        StringBuilder strFormAddress = new StringBuilder();
        TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
        TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
        HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
        txtCustomerID.Text = hdnCID.Value;
        Button btnLoadCust = (Button)ucCustomerCodeLov.FindControl("btnGetLOV");
        //txtAccItemNumber.Text = hdnCID.Value;
        TxtAccNumber.Text = txtAccItemNumber.Text;
        txtCustomerNames.Text = txtAccItemNumber.Text;
        btnLoadCust.Focus();
        try
        {
            HiddenField HdnId = ucCustomerCodeLov.FindControl("hdnID") as HiddenField;
            if (HdnId != null)
            {
                ViewState["hdnCustorEntityID"] = HdnId.Value;
                hdnCustId.Value = HdnId.Value;
                System.Web.HttpContext.Current.Session["hdnCustorEntityID"] = HdnId.Value;
            }
            if (hdnCID.Value != string.Empty)
            {
                DataSet ds = new DataSet();
                Dictionary<string, string> objProcedureParameters = new Dictionary<string, string>();
                objProcedureParameters.Add("@Option", "1");
                objProcedureParameters.Add("@COMPANY_ID", Convert.ToString(intCompanyID));
                objProcedureParameters.Add("@CustomerId", hdnCID.Value);
                ds = Utility.GetDataset("S3G_OR_GET_CUSADDRESS", objProcedureParameters);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i <= ds.Tables[0].Columns.Count - 1; i++)
                    {
                        strFormAddress.Append(Environment.NewLine);
                        strFormAddress.Append(ds.Tables[0].Columns[i].ColumnName + " : " + ds.Tables[0].Rows[0][i].ToString());
                    }
                    if (ds.Tables[1].Rows.Count > 0)
                    {
                        for (int i = 0; i <= ds.Tables[1].Rows.Count - 1; i++)
                        {
                            strFormAddress.Replace(ds.Tables[1].Rows[i]["COLUMN_NAME"].ToString().ToUpper(), ds.Tables[1].Rows[i]["DISPLAY_TEXT"].ToString());
                        }
                    }
                    funPriSetCustomerAddress(ds.Tables[0], strFormAddress, ucCustomerCodeLov);
                }
                FunPriBindGrid();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }


    private void funPriSetCustomerAddress(DataTable dtCustomer, StringBuilder strAddress, UserControl ucCustomerCodeLovDyn)
    {
        try
        {
            DataRow dtrCustomer;
            dtrCustomer = dtCustomer.Rows[0];
            UserControl CustomerDetails1 = (UserControl)ucCustomerCodeLovDyn.FindControl("S3GCustomerAddress1");
            Label lblCustomerCode = (Label)CustomerDetails1.FindControl("lblCustomerCode");
            Label lblCustomerName = (Label)CustomerDetails1.FindControl("lblCustomerName");
            Label lblCustomerCode1 = (Label)CustomerDetails1.FindControl("lblCustomerCode1");
            Label lblCustomerName1 = (Label)CustomerDetails1.FindControl("lblCustomerName1");
            TextBox txtCustomerCode = (TextBox)CustomerDetails1.FindControl("txtCustomerCode");
            TextBox txtCustomerCode1 = (TextBox)CustomerDetails1.FindControl("txtCustomerCode1");
            TextBox txtCustomerName = (TextBox)CustomerDetails1.FindControl("txtCustomerName");
            TextBox txtCustomerName1 = (TextBox)CustomerDetails1.FindControl("txtCustomerName1");
            TextBox txtMobile = (TextBox)CustomerDetails1.FindControl("txtMobile");
            TextBox txtMobile1 = (TextBox)CustomerDetails1.FindControl("txtMobile1");
            TextBox txtPhone = (TextBox)CustomerDetails1.FindControl("txtPhone");
            TextBox txtPhone1 = (TextBox)CustomerDetails1.FindControl("txtPhone1");
            TextBox txtEmail = (TextBox)CustomerDetails1.FindControl("txtEmail");
            TextBox txtEmail1 = (TextBox)CustomerDetails1.FindControl("txtEmail1");
            TextBox txtWebSite = (TextBox)CustomerDetails1.FindControl("txtWebSite");
            TextBox txtWebSite1 = (TextBox)CustomerDetails1.FindControl("txtWebSite1");
            TextBox txtCusAddress = (TextBox)CustomerDetails1.FindControl("txtCusAddress");
            TextBox txtCusAddress1 = (TextBox)CustomerDetails1.FindControl("txtCusAddress1");
            TextBox TxtAccNumber = (TextBox)ucCustomerCodeLov.FindControl("TxtName");
            TextBox txtAccItemNumber = (TextBox)ucCustomerCodeLov.FindControl("txtItemName");
            HiddenField hdnCID = (HiddenField)ucCustomerCodeLov.FindControl("hdnID");
            txtAccItemNumber.Text = hdnCID.Value;
            TxtAccNumber.Text = hdnCID.Value;
            if (dtrCustomer != null)
            {
                if (dtrCustomer.Table.Columns["Customer_Code"] != null)
                    txtCustomerCode1.Text = txtCustomerCode.Text = dtrCustomer["Customer_Code"].ToString();
                if (dtrCustomer.Table.Columns["Title"] != null)
                {
                    txtAccItemNumber.Text = txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Title"].ToString() + " " + dtrCustomer["Customer_Name"].ToString();

                }
                else
                {
                    txtAccItemNumber.Text = txtCustomerName.Text = txtCustomerName1.Text = dtrCustomer["Customer_Name"].ToString();
                }
                TxtAccNumber.Text = dtrCustomer["Customer_Code"].ToString() + '-' + dtrCustomer["Customer_Name"].ToString();
                if (dtrCustomer.Table.Columns["MOB_PHONE_NO"] != null) txtMobile.Text = txtMobile1.Text = dtrCustomer["MOB_PHONE_NO"].ToString();
                if (dtrCustomer.Table.Columns.Contains("RES_PHONE_NO"))
                {
                    txtPhone.Text = txtPhone1.Text = dtrCustomer["RES_PHONE_NO"].ToString();
                }
                if (dtrCustomer.Table.Columns["Cust_Email"] != null) txtEmail.Text = txtEmail1.Text = dtrCustomer["Cust_Email"].ToString();
                if (dtrCustomer.Table.Columns["Comm_WebSite"] != null) txtWebSite.Text = txtWebSite1.Text = dtrCustomer["Comm_WebSite"].ToString();
                txtCusAddress.Text = txtCusAddress1.Text = strAddress.ToString();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    #endregion

    #endregion
}
