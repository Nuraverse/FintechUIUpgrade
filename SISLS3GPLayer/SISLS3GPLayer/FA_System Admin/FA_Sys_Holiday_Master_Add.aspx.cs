using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FA_BusEntity;
using System.Web.Security;
using System.Text;




public partial class System_Admin_FA_Sys_Holiday_Master_Add : ApplyThemeForProject_FA
{
    DataTable dtweekend;
    DataTable dt;
    DataTable dtweek;
    UserInfo_FA ObjUserInfo_FA = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    StringBuilder sbReceivingXML;
    string strDateFormat = string.Empty;
    int intUserID, intCompanyID=0;
    int intholidayid = 0;
    Dictionary<string, string> Procparam = null;
    FASession objFASession = new FASession();
    string strMode = string.Empty;
    string strConnectionName = string.Empty;
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objAdminServiceClient;
    FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable ObjFA_SYS_Master_DataTable = new FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable();
    FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstRow obj_Row;
   string strRedirectAddPage = "~/System Admin/FA_Sys_Holiday_Master_Add.aspx";
   string strRedirectViewPage = "~/System Admin/FA_Sys_Holiday_Master_View.aspx";
   string strRedirectPageView = "window.location.href='../System Admin/FA_Sys_Holiday_Master_View.aspx';";
    string strRedirectPageAdd = "window.location.href='../System Admin/FA_Sys_Holiday_Master_Add.aspx';";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        FunPriPageLoad();
         
    }

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
            
        }



    }


    private void datatable()
    {
        dtweekend = new DataTable();
        dtweekend.Columns.Add("Days");
        dtweekend.Rows.Add("Sunday");
        dtweekend.Rows.Add("Monday");
        dtweekend.Rows.Add("Tuesday");
        dtweekend.Rows.Add("Wednesday");
        dtweekend.Rows.Add("Thursday");
        dtweekend.Rows.Add("Friday");
        dtweekend.Rows.Add("Saturday");
        grvHolidayMaster.DataSource = dtweekend;
        grvHolidayMaster.DataBind();
        ViewState["dtweekend"] = dtweekend;

    }

    #region Grid Datatable

    private void FunPriInsertReceiving(string date,string desc)
    {
        try
        {
            DataRow dr;
            dt = FunPriGetDetailsDataTable();

            if (dt.Rows.Count < 1)
            {
                dr = dt.NewRow();
                dr["Tran_Details_ID"] = "0";
                dr["date"] = "";
                dr["days"] = "";
                dt.Rows.Add(dr);
            }
            else
            {
                dr = dt.NewRow();
                dr["Tran_Details_ID"] = Convert.ToInt32(dt.Rows[dt.Rows.Count - 1]["Tran_Details_ID"]) + 1;
                dr["date"] = date;
                dr["days"] = desc;
                  dt.Rows.Add(dr);
            }
            if (dt.Rows.Count > 1)
            {
                if (Convert.ToString(dt.Rows[0]["Tran_Details_ID"]) == "0")
                {
                    dt.Rows[0].Delete();
                }
            }
            ViewState["dt"] = dt;
            //FunPriFillGrid();
            FunPubBindReceiving(dt);
        }
        catch (Exception ex)
        {
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
                ViewState["dt"] = dt;
            }
            dt = (DataTable)ViewState["dt"];
        }
        catch (Exception ex)
        {

            throw ex;
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
            //if (objFASession.ProDimensionApplicableRW == false)
            //{
            //    grvGLSLDetails.Columns[5].Visible = false;
            //    //TabPanelDim.Enabled = false;
            //}
        }
        catch (Exception ex)
        {

            throw ex;

        }
    }

    private void FunPubBindReceiving(DataTable dtWorkflow)
    {
        try
        {
            Grvdetails.DataSource = dtWorkflow;
            Grvdetails.DataBind();
            if (dtWorkflow.Rows.Count > 0 && Convert.ToString(dtWorkflow.Rows[0]["Tran_Details_ID"]) == "0")
            {
                Grvdetails.Rows[0].Visible = false;
               
            }
            Grvdetails.Visible = true;
            //gvReceiving .HeaderRow
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            bool bolreturn = false;
            FunPubHolidaySave(ref bolreturn);
            if (bolreturn)
                return;
        }
        catch (Exception ex)
        {
           
        }
    }

    public void FunPubHolidaySave(ref bool blnValReturn)
    {
        int intReturnValue = 903;
        int intReturnCode = 0;

        objAdminServiceClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        objAdminServiceClient.Open();
        ObjFA_SYS_Master_DataTable = new FA_BusEntity.SysAdmin.master.FA_Sys_Holiday_MstDataTable();
        try
        {
            
           
            
                obj_Row = ObjFA_SYS_Master_DataTable.NewFA_Sys_Holiday_MstRow();
               
                obj_Row.Distinct_Id = intholidayid;
                obj_Row.Company_id = intCompanyID.ToString();
                obj_Row.User_id=intUserID.ToString();
                obj_Row.Location_id = ddlLocation.SelectedValue.ToString();
                obj_Row.date =Utility_FA.StringToDate(txtDate.Text.ToString());
                obj_Row.XML_Weekend = FunPro_XML();
                dt = (DataTable)ViewState["dt"];
                obj_Row.XML_HOliday = Utility_FA.FunPubFormXml_FA(dt);
                ObjFA_SYS_Master_DataTable.AddFA_Sys_Holiday_MstRow(obj_Row);
                intReturnValue = objAdminServiceClient.FunPubInsertHolidayMaster(FASerializationMode.Binary, FAClsPubSerialize.Serialize(ObjFA_SYS_Master_DataTable, FASerializationMode.Binary), "C",strConnectionName);
                Utility_FA.FunShowValidationMsg_FA(this, intReturnValue, strRedirectPageView, strRedirectPageView, strMode, false);
        }
       
        catch(Exception ex)
        {
        }
    }
    private void FunPriGetLocaList()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@User_ID", Convert.ToString(intUserID));
            if (strMode == "C")
            {
                dictParam.Add("@Location_Active", "1");
                dictParam.Add("@Is_Operational", "1");
            }
            dictParam.Add("@Program_ID", "67");
            ddlLocation.BindDataTable_FA("FA_Loca_List", dictParam, new string[] { "Location_ID", "Location" });
            if (ddlLocation.Items.Count == 2)
            {
                ddlLocation.SelectedIndex = 1;
                
            }

        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Location");
        }
    }
     private void FunPriPageLoad()
    {
        try
        {
            ObjUserInfo_FA = new UserInfo_FA();
            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            //Code end
            
            strConnectionName = objFASession.ProConnectionName;
            if (Request.QueryString["qsMode"] != null)
                strMode = Convert.ToString(Request.QueryString["qsMode"]);
            strDateFormat = objFASession.ProDateFormatRW;
            CalReceivedDate.Format = strDateFormat;
            FormsAuthenticationTicket fromTicket;
            if (Request.QueryString.Get("qsmasterId") != null)
            {
                fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsmasterId"));
                intholidayid = Convert.ToInt32(fromTicket.Name);
            }
            if (!IsPostBack)
            {
                datatable();
                FunPriInsertReceiving("", "");
                FunPriGetLocaList();
               
                
            }
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
                FunPriDisableControls(0);

            }

        }
        catch (Exception ex)
        {

            
            throw ex;
        }
    }


     protected void Grvdetails_RowCommand(object sender, GridViewCommandEventArgs e)
     {
         try
         {
             string strdate, strdays; 
             if(e.CommandName == "Add")
             {

                 TextBox txtReceivedDate = Grvdetails.FooterRow.FindControl("txtReceivedDate") as TextBox;
                 TextBox txtFooterDescription = Grvdetails.FooterRow.FindControl("txtFooterDescription") as TextBox;
                 FunPriInsertReceiving(txtReceivedDate.Text.Trim(), txtFooterDescription.Text.Trim());



             }
         }
         catch (Exception ex)
         {

            
             //cvBudget.ErrorMessage = Resources.ErrorHandlingAndValidation._1202;
             //cvBudget.IsValid = false;

         }
     }

     protected void Grvdetails_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
     {
         try
         {
             if (e.Row.RowType == DataControlRowType.DataRow)
             {
                 
                


             }
             if (e.Row.RowType == DataControlRowType.Footer)
             {
                 AjaxControlToolkit.CalendarExtender CalReceivedDate = e.Row.FindControl("CalReceivedDate") as AjaxControlToolkit.CalendarExtender;
                 if (CalReceivedDate != null)
                     CalReceivedDate.Format = strDateFormat;
             }

         }
         catch (Exception ex)
         {

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
                 lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                 
                 break;

             case 1: // Modify Mode
                 if (!bModify)
                 {
                     btnSave.Enabled = false;
                 }
                 FunPubLoadHoliday();
                 Utility_FA.ClearDropDownList_FA(ddlLocation);
                 CalReceivedDate.Enabled = false;
                 btnClear.Enabled = false;
                 break;

             case -1:// Query Mode
                 if (!bQuery)
                 {
                     Response.Redirect(strRedirectAddPage);
                 }
                 FunPubLoadHoliday();
                 lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                 if (!bQuery)
                 {
                     Response.Redirect(strRedirectPageView);
                 }
                 Utility_FA.ClearDropDownList_FA(ddlLocation);
                 CalReceivedDate.Enabled = false;
                 Grvdetails.Columns[Grvdetails.Columns.Count - 1].Visible = false;
                 Grvdetails.FooterRow.Visible = false;
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
             DataSet dsholiday = Utility_FA.GetDataset("FA_GET_HOLIDAY_DTL", Procparam);
             ddlLocation.SelectedValue = dsholiday.Tables[0].Rows[0]["Location_id"].ToString();
             txtDate.Text = dsholiday.Tables[0].Rows[0]["Entry_Date"].ToString();
             ViewState["Holiday"] = dsholiday.Tables[1];
             ViewState["dt"] = dsholiday.Tables[2];
             datatable();
             if (dsholiday.Tables[2].Rows.Count > 0)
             {
                 Grvdetails.DataSource = dsholiday.Tables[2];
                 Grvdetails.DataBind();
             }
             //foreach (GridViewRow item in grvHolidayMaster.Rows)
             //{
             //    CheckBox chkcategory = (CheckBox)item.FindControl("chkcategory");
             //    if (((Label)item.FindControl("lbldays")).Text.ToString() == dsholiday.Tables[1].Rows[0]["leave_desc"].ToString())
             //    {

             //        chkcategory.Checked = true;
             //    }
             //    else
             //    {
             //        chkcategory.Checked = false;
             //    }
             //}
         }
         catch (Exception ex)
         {
             
             throw ex;
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
         foreach (GridViewRow item in grvHolidayMaster.Rows)
         {
           
             if (((CheckBox)item.FindControl("chkCategory")).Checked == true)
             {

                
                 Label lbldays = item.FindControl("lbldays") as Label;
                 
                 sbReceivingXML.Append(" <Details Days='" + lbldays.Text.ToString() + "' ");
                 sbReceivingXML.Append(" /> ");
                 
             }
         }
         sbReceivingXML.Append("</Root>");
         return sbReceivingXML.ToString();
     }

    # endregion
}
