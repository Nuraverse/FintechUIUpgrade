using FA_BusEntity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Financial_Accounting_FA_ReportLevel_Mapping : ApplyThemeForProject_FA
{
    #region Initialisation
    public static Financial_Accounting_FA_ReportLevel_Mapping Obj_Page;
    Dictionary<string, string> dictParam = null;
    DataTable dtReport = null;
    DataTable dtupdate = null;
    int intCompanyId;
    int intUserId;
    string validationCode;
    int int_tds_id = 0;
    //decimal decActualAmount = 0;
    String StrConnectionName;
    string strTDSRate_Master_Id = string.Empty;
    StringBuilder sbReceivingXML;
    DataTable dtReceiving = null;
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
    FASession objFASession = new FASession();
    string strKey = "Insert";

    string strAlert = "alert('__ALERT__');";
    string strRedirectPageAdd = "window.location.href='../Taxation/FATDSRateMaster_Add.aspx';";
    string strRedirectPageView = "window.location.href='../Common/HomePage.aspx'";
    string strRedirectPageHome = "../Common/HomePage.aspx";




    int intErrCode = 0;
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bval = false;
    int j = 1;
    static string strPageName = "Report Master Definition";
    #endregion


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriPageLoad();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
        }



    }


    private void FunPriPageLoad()
    {
        Obj_Page = this;
        UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
        FASession objFASession = new FASession();
        intCompanyId = ObjUserInfo_FA.ProCompanyIdRW;
        intUserId = ObjUserInfo_FA.ProUserIdRW;
        this.Page.Title = FunPubGetPageTitles(enumPageTitle.Create);
        bCreate = ObjUserInfo_FA.ProCreateRW;
        bModify = ObjUserInfo_FA.ProModifyRW;
        bQuery = ObjUserInfo_FA.ProViewRW;
        StrConnectionName = objFASession.ProConnectionName;

        strMode = "C";



        if (!IsPostBack)
        {
          //  hid.Value = "0";

            FunProInitializeGridData();
            FunPriLoadlookupValues();






        }

    }




    private void FunPriDisableControls(int intModeID)
    {
        switch (intModeID)
        {
            case 0: // Create Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                if (!bCreate)
                {


                }

                break;

            case 1: // Modify Mode

                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                //FunPriLoadSLCode();
                //rfvpwd.Enabled = true;
                //  btnClear.Enabled = false;
                //chkDoubleTax.Enabled = true;
                // chkActive.Enabled = true;
                //ddlLocation.ClearDropDownList_FA();
                //  btnSave.Enabled = true;
                //ddlSLCode.ClearDropDownList_FA();
                //ddlGLCode.ClearDropDownList_FA();
                //ddlFundType.ClearDropDownList_FA();
                //grvStampDuty.Columns[0].Visible = false;
                //btnAdd.Enabled = btnClearC.Enabled = false;

                if (!bModify)
                {

                }

                break;

            case -1:// Query Mode
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                //grvStampDuty.Cl.Enabled = false;
                //btnSave.Enabled = btnClear.Enabled = false;
                ////chkDoubleTax.Enabled = 
                //chkActive.Enabled = false;
                ////ddlLocation.Enabled = false;


                ////btnAdd.Enabled = btnClearC.Enabled = false;
                ////ddlGLAccount.ClearDropDownList_FA();
                ////ddlSLAccount.ClearDropDownList_FA();
                ////ddlBudgetType.ClearDropDownList_FA();
                ////ddlFundType.ClearDropDownList_FA();
                //gvTaxDetails.Columns[gvTaxDetails.Columns.Count - 1].Visible = false;
                //gvTaxDetails.FooterRow.Visible = false;
                //grvStampDuty.Columns[3].Visible = false;



                if (!bQuery)
                {
                    Response.Redirect(strRedirectPageView, false);
                }
                break;


        }



    }





    protected void FunProInitializeGridData()
    {
        DataTable dtReport;
        dtReport = new DataTable();

        dtReport.Columns.Add("Report_Mst_ID");
        dtReport.Columns.Add("Level_Name");
        dtReport.Columns.Add("Details");
        dtReport.Columns.Add("Parent_Level");
        

        dtReport.Columns.Add("Sno", typeof(int));
        dtReport.Columns["Sno"].AutoIncrement = true;
        dtReport.Columns["Sno"].AutoIncrementSeed = 1;


        DataRow dRow = dtReport.NewRow();

        dRow["Sno"] = "0";
        dRow["Report_Mst_ID"] = "";
        dRow["Level_Name"] = "";
        dRow["Parent_Level"] = "";
       


        gvReport.EditIndex = -1;

        dtReport.Rows.Add(dRow);

        gvReport.DataSource = dtReport;
        gvReport.DataBind();
        gvReport.Rows[0].Visible = false;

        dtReport.Rows[0].Delete();
        dtReport.AcceptChanges();

        ViewState["dtReport"] = dtReport;

    }









    protected void btnAdd_Click(object sender, EventArgs e)
    {

        FunPriAddReportDetails();
        FunClearDetails();



    }









    private void FunPriAddReportDetails()
    {
        try
        {
            DataRow dr;
            dtReport = (DataTable)ViewState["dtReport"];




            if (dtReport.Rows.Count > 0)
            {
                if (dtReport.Rows[0]["Sno"].ToString() == "0")
                {
                    dtReport.Rows[0].Delete();
                }
            }


            //dr = dtReport.NewRow();
            //dr["Sno"] = dtReport.Rows.Count + 1;
            //dr["Report_Name"] = txtReportName.Text.Trim();
            //dr["Short_Name"] = txtReportshortName.Text.Trim();
            //dr["Heading"] = txtReportHeading.Text.Trim();
            //dr["Type"] = txtReportHeading.Text.Trim();
            //dr["Frequency"] = txtReportHeading.Text.Trim();
            //dr["Size"] = txtReportHeading.Text.Trim();

           // dtReport.Rows.Add(dr);

            gvReport.DataSource = dtReport;
            gvReport.DataBind();

            ViewState["TDSRate"] = dtReport;

        }

        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }


    private void FunClearDetails()
    {
        lblSlNo.Text = "";




    }


    private void FunPriResetRdButton(GridView grv, int intRowIndex)
    {
        for (int i = 0; i <= grv.Rows.Count - 1; i++)
        {
            if (i != intRowIndex)
            {
                RadioButton rdSelect = grv.Rows[i].FindControl("rdSelect") as RadioButton;
                rdSelect.Checked = false;
            }
        }

    }







    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../Common/HomePage.aspx", false);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            //lblErrorMessage.Text = ex.Message;
        }


    }

    protected void gvTaxDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }



    protected void btnClearC_Click(object sender, EventArgs e)
    {
        //FunClearTaxDetails();


    }

    private void FunPriLoadlookupValues()
    {
        try
        {
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@LookupType_Code", "123");
            ddlReportLevel.BindDataTable_FA(SPNames.GETLOOKUPVALUES, dictParam, new string[] { "Lookup_Code", "Lookup_Desc" });

            //dictParam.Remove("@LookupType_Code");

            //dictParam.Add("@LookupType_Code", "121");
            //ddlFrequency.BindDataTable_FA(SPNames.GETLOOKUPVALUES, dictParam, new string[] { "Lookup_Code", "Lookup_Desc" });


            //dictParam.Remove("@LookupType_Code");

            //dictParam.Add("@LookupType_Code", "122");
            //ddlSize.BindDataTable_FA(SPNames.GETLOOKUPVALUES, dictParam, new string[] { "Lookup_Code", "Lookup_Desc" });

            //ddlReferenceType.SelectedValue = "1";
            //ddlReferenceType.Items.Remove(ddlReferenceType.Items[1]);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
}