#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: Common  
/// Screen Name			: Get LOV user Control
/// Created By			: Magesh.A
/// Created Date		: 16 Jul 2018
/// Purpose	            : 
#endregion

using System;
using System.Collections;
using System.Collections.Generic;
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
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using S3GBusEntity;
using System.ServiceModel;

public partial class Common_GetAccountSearch : ApplyThemeForProject
{
    #region [Paging Properties]

    PagingValues ObjPaging = new PagingValues();                                // grid paging
    public delegate void LOVPageAssignValue(int ProPageNumRW, int intPageSize);
    Dictionary<string, string> Procparam = new Dictionary<string, string>();

    UserInfo ObjUserInfo;                                                       // to maintain the user information      
    ArrayList arrSearchVal = new ArrayList(1);
    int intNoofSearch = 4;

    static string[] arrSortCol = new string[] { };

    public int ProPageNumRW                                                     // to retain the current page size and number
    {
        get;
        set;
    }

    public int ProPageSizeRW
    {
        get;
        set;
    }

    string strControlId = "";
    public string strLOV_Code = string.Empty;

    #endregion [Paging Properties]

    #region [Local Variables]
    public string strLOBID = string.Empty;
    public string strBranchID = string.Empty;
    public string strRegionID = string.Empty;
    public string strAccountNo = string.Empty;
    public string strRegisNo = string.Empty;

    public string strCustomerID = string.Empty;

    public string strLRNNo = string.Empty;

    #endregion [Local Variables]

    public string DisplayContent = string.Empty;
    public bool bolSessionExpired = false;

    #region [Event's]

    #region [Page Event's]

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPubPageLoad();
        }
        catch (Exception ex)
        { }
    }

    #endregion [Page Event's]

    #region [Grid Event's]

    protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbNames = (LinkButton)e.Row.FindControl("lbName");
            LinkButton lbtAccName = (LinkButton)e.Row.FindControl("lbAccName");
            LinkButton lbBranch = (LinkButton)e.Row.FindControl("lbBranch");
            LinkButton lbIDs = (LinkButton)e.Row.FindControl("lbId");
            string strDisplayValue = string.Empty;

            string strScripts = "popup('" + lbtAccName.Text + "','" + lbIDs.CommandArgument + "','" + strControlId + "_txtItemName','" + strControlId + "_hdnID')";
            lbNames.Attributes.Add("onclick", strScripts);
            lbIDs.Attributes.Add("onclick", strScripts);
            lbtAccName.Attributes.Add("onclick", strScripts);
            lbBranch.Attributes.Add("onclick", strScripts);
        }

    }

    #endregion [Grid Event's]

    #endregion [Event's]

    #region [Text box Event's]

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
                    if (strSearchVal == "")
                    {

                        if (strLOV_Code == "CLGCMD")
                        {

                            strSearchVal = " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
                            if (strSearchVal.Contains("GURANTOR_CODE") == true)
                            {
                                string s = strSearchVal.Replace("GURANTOR_CODE", "CUSTOMER_CODE");
                                strSearchVal = s;
                            }
                            if (strSearchVal.Contains("GURANTOR_NAME") == true)
                            {
                                string s = strSearchVal.Replace("GURANTOR_NAME", "CUSTOMER_NAME");
                                strSearchVal = s;
                            }

                        }
                        else if (strLOV_Code == "PCMDCOL")
                        {
                            strSearchVal = " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
                            if (strSearchVal.Contains("PERSONAL_GURANTOR_CODE") == true)
                            {
                                string s = strSearchVal.Replace("PERSONAL_GURANTOR_CODE", "CUSTOMER_CODE");
                                strSearchVal = s;
                            }
                            if (strSearchVal.Contains("PERSONAL_GURANTOR_NAME") == true)
                            {
                                string s = strSearchVal.Replace("PERSONAL_GURANTOR_NAME", "CUSTOMER_NAME");
                                strSearchVal = s;
                            }
                        }
                        else
                        {
                            strSearchVal = " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
                        }
                    }
                    else
                    {
                        strSearchVal += " and " + arrSortCol[iCount].ToString() + " like '%" + arrSearchVal[iCount].ToString() + "%'";
                    }
                }
            }

            hdnSearch.Value = strSearchVal;
            FunPriBindGrid();
            FunPriSetSearchValue();
            if (txtboxSearch.Text != "")
                ((TextBox)gvList.HeaderRow.FindControl(txtboxSearch.ID)).Focus();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
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
                ((ImageButton)gvList.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingAsc";
            }
            else
            {
                ((ImageButton)gvList.HeaderRow.FindControl(imgbtnSearch)).CssClass = "styleImageSortingDesc";
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    #endregion [Text box Event's]

    #region [Function's]

    public void FunPubPageLoad()
    {
        try
        {
            #region Grid Paging Config
            arrSearchVal = new ArrayList(intNoofSearch);
            ProPageNumRW = 1;                                                           // to set the default page number
            TextBox txtPageSize = (TextBox)ucLOVPageNavigater.FindControl("txtPageSize");
            if (txtPageSize.Text != "")
                ProPageSizeRW = Convert.ToInt32(txtPageSize.Text);
            else
                ProPageSizeRW = Convert.ToInt32(ConfigurationManager.AppSettings.Get("GridPageSize"));
            LOVPageAssignValue obj = new LOVPageAssignValue(this.AssignValue);
            ucLOVPageNavigater.callback = obj;
            ucLOVPageNavigater.ProPageNumRW = ProPageNumRW;
            ucLOVPageNavigater.ProPageSizeRW = ProPageSizeRW;
            #endregion
            if (Request.QueryString["Title"] != null)
            {
                this.Title = Request.QueryString["Title"].ToString();
            }
            if (Request.QueryString["LOV_Code"] != null && Request.QueryString["LOV_Code"] != string.Empty && Request.QueryString["LOV_Code"] != "")
            {

                strLOV_Code = Convert.ToString(Request.QueryString["LOV_Code"]);

                if (strLOV_Code == "ACC_INVOICELOAD" || strLOV_Code == "ACC_INVOICELOAD_CR")
                {
                    lblCustomerCode.Text = "Client Code";
                    lblCustomerName.Text = "Client Name";
                }
            }
            if (Request.QueryString["ControlID"] != null && Request.QueryString["ControlID"] != string.Empty && Request.QueryString["ControlID"] != "")
            {
                strControlId = Convert.ToString(Request.QueryString["ControlID"]);
            }

            if (Request.QueryString["LOB_ID"] != null && Request.QueryString["LOB_ID"] != string.Empty && Request.QueryString["LOB_ID"] != "")
            {
                strLOBID = Convert.ToString(Request.QueryString["LOB_ID"]);
            }

            if (Request.QueryString["LocationID"] != null && Request.QueryString["LocationID"] != string.Empty && Request.QueryString["LocationID"] != "")
            {
                strBranchID = Convert.ToString(Request.QueryString["LocationID"]);
            }

            if (Request.QueryString["Customer_ID"] != null && Request.QueryString["Customer_ID"] != string.Empty && Request.QueryString["Customer_ID"] != "")
            {
                strCustomerID = Convert.ToString(Request.QueryString["Customer_ID"]);
            }


            if (Request.QueryString["LRN_ID"] != null && Request.QueryString["LRN_ID"] != string.Empty && Request.QueryString["LRN_ID"] != "")
            {
                strLRNNo = Convert.ToString(Request.QueryString["LRN_ID"]);
            }


            ObjUserInfo = new UserInfo();
            if (ObjUserInfo.ProUserNameRW == null || ObjUserInfo.ProUserNameRW == "")
            {
                bolSessionExpired = true;
                RegisterStartupScript("a", "<script>window.close();</script>");
            }

            if (!IsPostBack)
            {
                //FunPriBindGrid();
                FunPriSetHeaderText();
                txtAccountNumber.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void FunPriSetHeaderText()
    {
        switch (strLOV_Code)
        {
            case "LOB":
                lblHeaderText.Text = "Line Of Business dd";
                break;
            case "CGCMD":
                lblHeaderText.Text = "Customer Master";
                break;
            case "USRM":
                lblHeaderText.Text = "User Master";
                break;
        }
    }

    /// <summary>
    /// Bind the Landing Grid.
    /// </summary>
    private void FunPriBindGrid()
    {
        try
        {
            FunPriGetSearchValue();
            FunPriAddCommonParameters();                                                        // Adding the Common parameters to the dictionary            

            //start By Praba
            string strCustomer_ID = "";
            if (Session["Act_Search_Customer_ID"] != null)
            {
                strCustomer_ID = Session["Act_Search_Customer_ID"].ToString();
            }
            else if (Session["Mem_Search_Customer_ID"] != null)
            {
                strCustomer_ID = Session["Mem_Search_Customer_ID"].ToString();
            }

            if (Session["AIERE_Search_Customer_ID"] != null)
            {
                strCustomer_ID = Session["AIERE_Search_Customer_ID"].ToString();
            }
            if (!string.IsNullOrEmpty(strCustomerID.Trim()) && strCustomerID.Trim() != "0")
            {
                strCustomer_ID = strCustomerID;
            }

            //txtCustomerCode.Text = Session["Act_Search_Customer_ID"].ToString();
            //End by praba

            string strLOB_ID = "";
            string strLRN_NO = string.Empty;

            if (Session["ACCTRANS_Search_LOB_ID"] != null)
            {
                strLOB_ID = Session["ACCTRANS_Search_LOB_ID"].ToString();
            }
            if (Session["Mem_Search_LOB_ID"] != null)
            {
                strLOB_ID = Session["Mem_Search_LOB_ID"].ToString();
            }
            if (Session["AIE_Search_LOB_ID"] != null)
            {
                strLOB_ID = Session["AIE_Search_LOB_ID"].ToString();
            }
            
            if (Session["ROPCCN_LOBID"] != null)
            {
                strLOB_ID = Session["ROPCCN_LOBID"].ToString();
            }
            if (Session["ACCFACT_Search_LOB_ID"] != null)
            {
                strLOB_ID = Session["ACCFACT_Search_LOB_ID"].ToString();
            }
            if (Session["AIERE_Search_LOB_ID"] != null)
            {
                strLOB_ID = Session["AIERE_Search_LOB_ID"].ToString();
            }
 
            if (!string.IsNullOrEmpty(strLOBID) && strLOB_ID.Trim() !="0")
 {
    strLOB_ID=strLOBID;
}
            
            if (Session["ACCASS_Search_LOB_ID"] != null)
 
            {
                strLOB_ID = Session["ACCASS_Search_LOB_ID"].ToString();
            }
            if (strLOBID != null && strLOBID !="")
            {
                strLOB_ID = strLOBID;
            }
            if (!string.IsNullOrEmpty(strLRNNo) && strLRNNo.Trim() != "0")
            {
                strLRN_NO = strLRNNo;
            }
            string strSTATUS_ID = "";
            if (Session["ACCTRANS_Search_STATUS_ID"] != null)
            {
                strSTATUS_ID = Session["ACCTRANS_Search_STATUS_ID"].ToString();
            }

            string strBranch_ID = "";
            if (Session["Act_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["Act_Search_Branch_ID"].ToString();
            }
            else if (Session["Mem_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["Mem_Search_Branch_ID"].ToString();
            }
            else if (Session["NOC_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["NOC_Search_Branch_ID"].ToString();
            }
            else if (Session["ACCTRANS_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["ACCTRANS_Search_Branch_ID"].ToString();
            }
            else if (Session["AIE_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["AIE_Search_Branch_ID"].ToString();
            }
             

            if (Session["ROPCCN_BRANCHID"] != null)
            {
                strBranch_ID = Session["ROPCCN_BRANCHID"].ToString();
            }
            if (Session["AIERE_Search_Branch_ID"] != null)
            {
                strBranch_ID = Session["AIERE_Search_Branch_ID"].ToString();
            }
            if (Session["ASS_Search_Transfer_Type"] !=null)
            {
                strSTATUS_ID = Session["ASS_Search_Transfer_Type"].ToString();
            }
 
            if (!string.IsNullOrEmpty(strBranchID) && strBranchID.Trim() !="0")
            {
                strBranch_ID = strBranchID;
            }
            
 
                if (Session["ACCASS_Search_BRANCH_ID"] != null)
            {
                strBranch_ID = Session["ACCASS_Search_BRANCH_ID"].ToString();
            }
            if (strBranchID != null && strBranchID !="")
            {
                strBranch_ID = strBranchID;
            }
           
            //Procparam.Add("@Company_ID", "1");// Dictionary to send our procedure's Parameters
            Procparam.Add("@LOV_Code", strLOV_Code);
            Procparam.Add("@IsActive", "1");
            Procparam.Add("@Account_Nmeber", txtAccountNumber.Text.Trim());
            Procparam.Add("@Branch_Name", txtBranchName.Text.Trim());
            Procparam.Add("@Customer_Code", txtCustomerCode.Text.Trim());
            Procparam.Add("@Customer_Name", txtcustomerName.Text.Trim());
            Procparam.Add("@Application_Number", txtApplicationNo.Text.Trim());
            Procparam.Add("@Reg_No", txtRegNumber.Text.Trim());
            Procparam.Add("@Engine_Number", txtEngNo.Text.Trim());
            Procparam.Add("@Chasis_Number", txtChassisNo.Text.Trim());
            Procparam.Add("@Customer_ID", strCustomer_ID);
            Procparam.Add("@LOCATION_ID", strBranch_ID);
            Procparam.Add("@LOB_ID", strLOB_ID);
            Procparam.Add("@STATUS_ID", strSTATUS_ID);
            if (System.Web.HttpContext.Current.Session["Pay_To"] != null)
            {
                if (Convert.ToString(System.Web.HttpContext.Current.Session["Pay_To"]) == "1")
                    Procparam.Add("@PAY_TO_TYPE", "144");                
                else
                    Procparam.Add("@PAY_TO_TYPE", "145");
            }
            if (System.Web.HttpContext.Current.Session["hdnCustorEntityID"] != null)
            {
                Procparam.Add("@PAY_TO_ENTITY", Convert.ToString(System.Web.HttpContext.Current.Session["hdnCustorEntityID"]));
            }
            if (strLRN_NO.Trim() != string.Empty)
            {
                Procparam.Add("@LRN_ID", strLRN_NO);
            }
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            if (strLOV_Code.StartsWith("ACC_REPORT"))
                gvList.BindICMGridView("S3G_CMN_GETACCOUNTREPORTLOV", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow, out arrSortCol);
            else
                gvList.BindICMGridView("S3G_CMN_GETACCOUNTNUMBERLOV", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow, out arrSortCol);

            if (strLOV_Code == "ENVENDOR1" || strLOV_Code == "ENSUNDRY1" || strLOV_Code == "ENDEALER1")
            {
                gvList.Columns[2].Visible = false;
                gvList.Columns[3].Visible = false;
            }

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                gvList.Rows[0].Visible = false;
            }
            ucLOVPageNavigater.Visible = true;

            if (intTotalRecords > 0)
            {
                gvList.Visible = true;
                ucLOVPageNavigater.Visible = true;
            }
            else
            {
                Utility.FunShowAlertMsg(this, "No Record found.");
                txtCustomerCode.Text = txtcustomerName.Text = txtBranchName.Text = txtAccountNumber.Text = txtEngNo.Text = txtRegNumber.Text = txtChassisNo.Text = string.Empty;
                txtAccountNumber.Focus();
                ucLOVPageNavigater.Visible = false;
                gvList.Visible = false;
                return;


            }

            if (strLOV_Code == "IPRO")
            {

                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).Text = "Proposal No";
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).ToolTip = "Sort By Proposal No";
            }
            else
            {
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).Text = "Branch Name";
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).ToolTip = "Sort By Registration Number";
            }



            ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort1")).Text = arrSortCol[0].ToString().Replace("_", " ");
            ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort2")).Text = arrSortCol[1].ToString().Replace("_", " ");
            ucLOVPageNavigater.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucLOVPageNavigater.setPageSize(ProPageSizeRW);

            FunPriSetSearchValue();
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    /// <summary>
    /// Will add the common parameters to the Dictionary - to pass it to the Common SP.
    /// </summary>
    private void FunPriAddCommonParameters()
    {
        //Paging Properties set  
        int intTotalRecords = 0;
        ObjPaging.ProCompany_ID = ObjUserInfo.ProCompanyIdRW;
        ObjPaging.ProUser_ID = ObjUserInfo.ProUserIdRW;
        ObjPaging.ProTotalRecords = intTotalRecords;
        ObjPaging.ProCurrentPage = ProPageNumRW;
        ObjPaging.ProPageSize = ProPageSizeRW;
        ObjPaging.ProSearchValue = hdnSearch.Value;
        ObjPaging.ProOrderBy = hdnOrderBy.Value;


        Procparam = new Dictionary<string, string>();
        if (Procparam != null)
        {
            Procparam.Clear();
        }
    }

    /// <summary>
    /// Will bind the grid view 
    /// </summary>
    private void FunPriBindGridWithFooter()
    {
        int intTotalRecords = 0;
        bool bIsNewRow = false;
        try
        {
            gvList.BindGridView("S3G_CMN_GetLOV", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow);

            //This is to hide first row if grid is empty
            if (bIsNewRow)
            {
                gvList.Rows[0].Visible = false;
            }
            ucLOVPageNavigater.Visible = true;
            ucLOVPageNavigater.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucLOVPageNavigater.setPageSize(ProPageSizeRW);
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    /// <summary>
    /// To Bind the Landing Grid
    /// </summary>
    /// <param name="intPageNum"> Current Page Number of the grid </param>
    /// <param name="intPageSize"> Current Page size of the grid </param>
    protected void AssignValue(int intPageNum, int intPageSize)
    {
        ProPageNumRW = intPageNum;              // To set the page Number
        ProPageSizeRW = intPageSize;            // To set the page size    
        FunPriBindGrid();
    }

    private void FunPriGetSearchValue()
    {
        arrSearchVal = gvList.FunPriGetSearchValue(arrSearchVal, intNoofSearch);
    }

    private void FunPriClearSearchValue()
    {
        gvList.FunPriClearSearchValue(arrSearchVal);
    }

    private void FunPriSetSearchValue()
    {
        gvList.FunPriSetSearchValue(arrSearchVal);
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

    #endregion [Function's]

    protected void btnGo_Click(object sender, EventArgs e)
    {
        if (txtAccountNumber.Text.Trim() == string.Empty && txtBranchName.Text.Trim() == string.Empty && txtcustomerName.Text.Trim() == string.Empty && txtCustomerCode.Text.Trim() == string.Empty && txtApplicationNo.Text.Trim() == string.Empty && txtRegNumber.Text.Trim() == string.Empty && txtEngNo.Text.Trim() == string.Empty && txtChassisNo.Text.Trim() == string.Empty)
        {
            lblErrorMessage.Visible = true;
            lblErrorMessage.Font.Size = 200;
            lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Enter atleast one search value";
            lblErrorMessage.Font.Bold = true;
            txtAccountNumber.Focus();
            return;
        }
        else
        {
            lblErrorMessage.Visible = false;
            ucLOVPageNavigater.Visible = true;
            FunPriBindGrid();
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtCustomerCode.Text = txtcustomerName.Text = txtBranchName.Text = txtAccountNumber.Text = txtEngNo.Text = txtRegNumber.Text = txtChassisNo.Text = txtApplicationNo.Text = string.Empty;
        txtAccountNumber.Focus();
        ucLOVPageNavigater.Visible = false;
        gvList.DataSource = null;
        gvList.DataBind();
        //FunPriBindGrid();
        lblErrorMessage.Text = "";
    }
}