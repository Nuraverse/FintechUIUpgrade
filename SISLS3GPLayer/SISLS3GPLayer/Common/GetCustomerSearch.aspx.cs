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

public partial class Common_GetCustomerSearch : ApplyThemeForProject
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
    public string strLOB_ID = string.Empty;
    public string strProgram_ID = string.Empty;
    public string strCustomer_ID = string.Empty;
    #endregion [Paging Properties]

    #region [Local Variables]
    public string strLOBID = string.Empty;
    public string strBranchID = string.Empty;
    public string strRegionID = string.Empty;
    public string strAccountNo = string.Empty;
    public string strRegisNo = string.Empty;

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
        {
            ClsPubCommErrorLog.CustomErrorRoutine(ex);
        }
    }

    #endregion [Page Event's]

    #region [Grid Event's]

    protected void gvList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lbNames = (LinkButton)e.Row.FindControl("lbName");
            LinkButton lbtAccName = (LinkButton)e.Row.FindControl("lbAccName");
            LinkButton lbtRegisNo = (LinkButton)e.Row.FindControl("lbRegisNo");
            LinkButton lbIDs = (LinkButton)e.Row.FindControl("lbId");
            string strDisplayValue = string.Empty;
            strDisplayValue = lbIDs.Text + " - " + lbNames.Text;
            string strScripts = "popup('" + strDisplayValue + "','" + lbIDs.CommandArgument + "','" + strControlId + "_txtItemName','" + strControlId + "_hdnID')";
            lbNames.Attributes.Add("onclick", strScripts);
            lbIDs.Attributes.Add("onclick", strScripts);
            lbtAccName.Attributes.Add("onclick", strScripts);
            lbtRegisNo.Attributes.Add("onclick", strScripts);
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
                    //if (arrSortCol[0].ToString() == "GURANTOR_CODE")
                    //{
                    //    arrSortCol[0] = "CUSTOMER_CODE";
                    //}
                    //if (arrSortCol[0].ToString() == "GURANTOR_NAME")
                    //{
                    //    arrSortCol[0] = "CUSTOMER_NAME";
                    //}
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
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    ClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
        //}
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

                if (strLOV_Code == "CUS_INV_LOAD" || strLOV_Code == "CUS_CLIENTFACAPR")
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
                strLOB_ID = Convert.ToString(Request.QueryString["LOB_ID"]);
            }
            if (Request.QueryString["Program_ID"] != null && Request.QueryString["Program_ID"] != string.Empty && Request.QueryString["Program_ID"] != "")
            {
                strProgram_ID = Convert.ToString(Request.QueryString["Program_ID"]);
            }
            if (Request.QueryString["Customer_ID"] != null && Request.QueryString["Customer_ID"] != string.Empty && Request.QueryString["Customer_ID"] != "")
            {
                strCustomer_ID = Convert.ToString(Request.QueryString["Customer_ID"]);
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
                txtCustomerCode.Focus();
            }
        }
        catch (Exception ex)
        {
            ClsPubCommErrorLogDB.CustomErrorRoutine(ex);
        }
    }

    private void FunPriSetHeaderText()
    {
        //switch (strLOV_Code)
        //{
        //case "LOB":
        //    lblHeaderText.Text = "Line Of Business";
        //    break;
        //case "CGCMD":
        //    lblHeaderText.Text = "Customer Master";
        //    break;
        //case "USRM":
        //    lblHeaderText.Text = "User Master";
        //    break;
        //default:
        //    lblHeaderText.Text = "Customer Details";
        //    break;
        //}
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

            string strConstitutionID = "";
            string strNationality = "";

            //start By Praba on 27-10-2018
            if (strLOV_Code == "CUS_NGL")
            {
                if (Session["Cust_Search_ConstitutionID"] != null)
                {
                    strConstitutionID = Session["Cust_Search_ConstitutionID"].ToString();
                }
                if (Session["Cust_Search_Nationality"] != null)
                {
                    strNationality = Session["Cust_Search_Nationality"].ToString();
                }
            }
            //End By Praba on 27-10-2018
 
            if (strLOV_Code == "CUS_COM_MEMO")
            {
                if (Session["Mem_Search_Branch_ID"] != null)
                {
                    strBranchID = Session["Mem_Search_Branch_ID"].ToString();
                }
                if (Session["Mem_Search_LOB_ID"] != null)
                {
                    strLOB_ID = Session["Mem_Search_LOB_ID"].ToString();
                }
            }


            //Procparam.Add("@Company_ID", "1");// Dictionary to send our procedure's Parameters
            Procparam.Add("@LOV_Code", strLOV_Code);
            Procparam.Add("@IsActive", "1");
            Procparam.Add("@Customer_Code", txtCustomerCode.Text.Trim());
            Procparam.Add("@Customer_Name", txtcustomerName.Text.Trim());
            Procparam.Add("@Account_Nmeber", txtAccountNumber.Text.Trim());
            Procparam.Add("@Employer_Code", txtEmployeerCode.Text.Trim());
            Procparam.Add("@NIDCRNo", txtNIDCRNo.Text.Trim());
            Procparam.Add("@Reg_No", txtRegNumber.Text.Trim());
            Procparam.Add("@Constitution_ID", strConstitutionID);
            Procparam.Add("@Nationality", strNationality);

            if (strLOB_ID.Trim() != string.Empty)
            {
                Procparam.Add("@LOB_ID", strLOB_ID);
            }
            if (strBranchID.Trim() != string.Empty)
            {
                Procparam.Add("@LOCATION_ID", strBranchID);
            }
            if (strProgram_ID.Trim() != string.Empty)
            {
                Procparam.Add("@Program_Id", strProgram_ID);
            }
            if (strCustomer_ID.Trim() != string.Empty)
            {
                Procparam.Add("@Customer_ID", strCustomer_ID);
            }
            if (Session["Account_ID"] != null && Convert.ToString(Session["Account_ID"]) != string.Empty)
            {
                Procparam.Add("@Account_ID", Convert.ToString(Session["Account_ID"]));
            }
            int intTotalRecords = 0;
            bool bIsNewRow = false;
            gvList.BindICMGridView("S3G_CMN_GETCUSTOMERLOV", Procparam, out intTotalRecords, ObjPaging, out bIsNewRow, out arrSortCol);
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



            if (strLOV_Code == "IPRO")
            {

                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).Text = "Proposal No";
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).ToolTip = "Sort By Proposal No";
            }
            else
            {
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).Text = "Registration Number";
                ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort4")).ToolTip = "Sort By Registration Number";
            }



            ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort1")).Text = arrSortCol[0].ToString().Replace("_", " ");
            ((LinkButton)gvList.HeaderRow.FindControl("lnkbtnSort2")).Text = arrSortCol[1].ToString().Replace("_", " ");
            ucLOVPageNavigater.Navigation(intTotalRecords, ProPageNumRW, ProPageSizeRW);
            ucLOVPageNavigater.setPageSize(ProPageSizeRW);

            FunPriSetSearchValue();
        }
        //catch (FaultException<UserMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //    ClsPubCommErrorLogDB.CustomErrorRoutine(objFaultExp);
        //}
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

    #endregion [Function's]

    protected void btnGo_Click(object sender, EventArgs e)
    {
        if (txtAccountNumber.Text.Trim() == string.Empty && txtcustomerName.Text.Trim() == string.Empty && txtCustomerCode.Text.ToString() == string.Empty && txtEmployeerCode.Text == string.Empty && txtRegNumber.Text.Trim() == string.Empty && txtNIDCRNo.Text.Trim() == string.Empty)
        {
            lblErrorMessage.Visible = true;
            lblErrorMessage.Font.Size = 200;
            lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Enter atleast one search value";
            lblErrorMessage.Font.Bold = true;

            txtCustomerCode.Focus();
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
        txtCustomerCode.Text = txtcustomerName.Text = txtEmployeerCode.Text = txtAccountNumber.Text = txtNIDCRNo.Text = txtRegNumber.Text = string.Empty;
        txtCustomerCode.Focus();
        ucLOVPageNavigater.Visible = false;
        gvList.DataSource = null;
        gvList.DataBind();
        lblErrorMessage.Text = "";
        //FunPriBindGrid();
    }
    protected void btnExit_ServerClick(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Search", "window.close();", true);
    }
}