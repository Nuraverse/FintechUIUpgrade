#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved
/// 
/// <Program Summary>
/// Module Name			: System Admin
/// Screen Name		    : Document Number Control Add
/// Created By			: JeyaGomathi M
/// Created Date		: 23-Jan-2012
/// Purpose	            : To define Document Number Types for the program
/// Last Updated By		: 
/// Last Updated Date   : 
/// Reason              : 
/// <Program Summary>
#endregion

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
using System.Globalization;
using System.ServiceModel;
using Resources;
using FA_BusEntity;
using System.Text;
using System.Collections.Generic;
using System.Web.UI.WebControls;


public partial class Sysadm_FASysDocNumberControl_Add : ApplyThemeForProject_FA

{
    #region Intialization
    
    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient ObjDocumentNumberControlClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable ObjFA_DocTypeListDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable ObjFA_GetDNCDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable ObjFA_DNCMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterDataTable();
    FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable ObjFA_BatchMasterDataTable = new FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_BatchListDataTable();
    int intDocSeqId = 0;
    int intErrCode = 0;
    string _ViewMode = "";
    int intUserID = 0;
    int intCompanyID = 0;
    int inthdUserid;
    string strRedirectPageMC;
    string strMode = "C";
    UserInfo_FA ObjUserInfo_FA = null;
    bool bCreate = false;
    bool bModify = false;
    bool bQuery = false;
    bool bDelete = false;
    bool bClearList = false;
    bool bMakerChecker = false;
    string strKey = "Insert";
    string strAlert = "alert('__ALERT__');";
    string strRedirectPageView = "window.location.href='../System Admin/FASysDocNumberControl_View.aspx'";
    FASession objFASession = new FASession();
    string strConnectionName = "";
    #endregion

    #region page_load
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (Request.QueryString["qsDNCId"] != null)
            {

                FormsAuthenticationTicket fromTicket = FormsAuthentication.Decrypt(Request.QueryString.Get("qsDNCId"));
                strMode = Request.QueryString.Get("qsMode");
                if (fromTicket != null)
                {
                    intDocSeqId = Convert.ToInt32(fromTicket.Name);
                }
                else
                {
                    strAlert = strAlert.Replace("__ALERT__", "Invalid URL");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                }
            }
            txtBatch.Attributes.Add("onblur", "Trim('" + txtBatch.ClientID + "');");
            ObjUserInfo_FA = new UserInfo_FA();
            btnDelete.Visible = false;
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            ddlBatch.Visible = false;
            rfvddlBatch.Visible = false;
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bDelete = ObjUserInfo_FA.ProDeleteRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            objFASession = new FASession();
            strConnectionName = objFASession.ProConnectionName;


            if (!IsPostBack)
            {
                //FunPriGetLOBList();
                FunPriGetLocaList();
                FunPriGetActivity();
                FunPriGetDocTypeList();
                //FunPriGetBatchList();
                
                GetDateYear();
               // ddlFinYear.FillFinancialYears();

                /// <summary> 
                ///  This method used for set role access
                /// </summary>

                bClearList = Convert.ToBoolean(ConfigurationManager.AppSettings.Get("ClearListValues"));
                if (((intDocSeqId > 0)) && (strMode == "M"))
                {
                    FunPriDisableControls(1);
                }
                else if (((intDocSeqId > 0)) && (strMode == "Q"))
                {
                    FunPriDisableControls(-1);
                }

                else
                {
                    FunPriDisableControls(0);

                }
                ddlActivity.Focus();
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;

        }   
    }
    #endregion

    #region Validation
    private void validtion()
    {
       
        //ddlLocation.Enabled = false;
        //ddlDocType.Enabled = false;
        //ddlFinYear.Enabled = false;
        //txtBatch.Enabled = false;
        //txtFromNo.Enabled = false;
        //ddlActivity.Enabled = false;
        //txtToNo.Enabled = false;
        txtToNo.Enabled = true;
        //txtLastNo.Enabled = false;
        txtLastNo.ReadOnly = true;               
        rfvBatch.Visible = false;
        rfvDocType.Visible = false;
        if (ddlLocation.SelectedIndex > 0)
        ddlLocation.ClearDropDownList_FA();
        if (ddlFinYear.SelectedIndex > 0)
        ddlFinYear.ClearDropDownList_FA();
        ddlDocType.ClearDropDownList_FA();
        txtFromNo.ReadOnly = true;
        rfvFromNos.Visible = false;
        rfvToNo.Visible = false;
    
        CbxActive.Enabled = true;
    }

    private void Modifyvalidtion()
    {
        //ddlLOB.Enabled = false;
        //ddlLocation.Enabled = false;
        //ddlDocType.Enabled = false;
        //ddlFinYear.Enabled = false;
        //txtBatch.Enabled = false;
        //txtFromNo.Enabled = true;
        //txtLastNo.Enabled = false;
        //txtToNo.Enabled = true;
        //rfvBatch.Visible = false;
        //rfvDocType.Visible = false;
        //ddlActivity.Enabled = false;

        //rfvFinYear.Visible = false;
        rfvFromNos.Visible = false;
        rfvToNo.Visible = false;
        txtLastNo.Text = "";
        txtLastNo.ReadOnly = true;
        if(ddlLocation.SelectedIndex>0)
        ddlLocation.ClearDropDownList_FA();
        //if(ddlFinYear.SelectedIndex>0)
        ddlFinYear.ClearDropDownList_FA();
        ddlDocType.ClearDropDownList_FA();
        txtBatch.ReadOnly = true;
       


    }
    #endregion

    #region Pagemethods
    

    private void FunPriGetLocaList()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            dictParam.Add("@User_ID", ObjUserInfo_FA.ProUserIdRW.ToString());
            if (strMode == "C")
            {
                dictParam.Add("@Is_Active", "1");
                dictParam.Add("@Is_Operational", "1");
            }
            dictParam.Add("@Program_ID", "7"); 
            ddlLocation.BindDataTable_FA("FA_Loca_List", dictParam, new string[] { "Location_ID", "Location" });
           
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Location");
        }
    }

    private void FunPriGetActivity()
    {
        try
        {
            Dictionary<string, string> dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            ddlActivity.BindDataTable_FA("FA_SYS_GET_ACTIVITY", dictParam, new string[] { "ID", "DESCRIPTION" });
            if (ddlActivity != null && ddlActivity.Items.Count > 0 && ddlActivity.Items.Count == 2 && Convert.ToString(ddlActivity.Items[1].Value) == "-1")
            {

                ddlActivity.SelectedIndex = 1;
                ddlActivity.ClearDropDownList_FA();
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Activity");
        }
    }



    private void FunPriGetDocTypeList()
    {
        ObjDocumentNumberControlClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListRow ObjDocTypeListRow;
            ObjDocTypeListRow = ObjFA_DocTypeListDataTable.NewFA_Sys_DocTypeListRow();
            ObjFA_DocTypeListDataTable.AddFA_Sys_DocTypeListRow(ObjDocTypeListRow);
            FASerializationMode SerMode = FASerializationMode.Binary;
            byte[] bytesDocTypeListDetails = ObjDocumentNumberControlClient.FunPubGetDocTypeList(SerMode, FAClsPubSerialize.Serialize(ObjFA_DocTypeListDataTable, SerMode),strConnectionName);
            ObjFA_DocTypeListDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable)FAClsPubSerialize.DeSerialize(bytesDocTypeListDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DocTypeListDataTable));
            ddlDocType.FillDataTable(ObjFA_DocTypeListDataTable, ObjFA_DocTypeListDataTable.Document_Type_IDColumn.ColumnName.Trim(), ObjFA_DocTypeListDataTable.DocumenTypeColumn.ColumnName.Trim());
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable To Load Document Type");
        }
        finally
        {
            // if (ObjDocumentNumberControlClient != null)
            ObjDocumentNumberControlClient.Close();
        }
    }


    private void GetDateYear()
    {
        try
        {
            //ListItem liPSelect = new ListItem(objFASession.ProFinYearRW.ToString(), "1");
            //ddlFinYear.Items.Insert(1, liPSelect);
            System.Web.UI.WebControls.ListItem liSelect0 = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlFinYear.Items.Insert(0, liSelect0);
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem(objFASession.ProFinYearRW.ToString(), "1");
            ddlFinYear.Items.Insert(1, liSelect);
            //ListItem liCSelect = new ListItem(((DateTime.Now.Year) + "-" + (DateTime.Now.Year + 1)), "1");
            //ddlFinYear.Items.Insert(2, liCSelect);

            //ListItem liNSelect = new ListItem(((DateTime.Now.Year + 1) + "-" + (DateTime.Now.Year + 2)), "1");
            //ddlFinYear.Items.Insert(3, liNSelect);


        }
        catch (Exception exp)
        {

               FAClsPubCommErrorLog.CustomErrorRoutine(exp);
            lblErrorMessage.Text = exp.Message;
        }

    }

    private void FunPubSave()
    {
      
        try
        {
            

        }
        //catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //       FAClsPubCommErrorLog.CustomErrorRoutine(objFaultExp);
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            ObjDocumentNumberControlClient.Close();
        }
    }

    private void FunPubClear()
    {
         try
        {
            //ddlLOB.SelectedIndex = 0;
            ddlLocation.SelectedIndex = 0;
            ddlFinYear.SelectedIndex = 0;
            ddlDocType.SelectedIndex = 0;
            txtBatch.Text = "";
            txtFromNo.Text = "";
            txtToNo.Text = "";
            if (ddlActivity.Items.Count > 2)
                ddlActivity.SelectedIndex = 0;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    private void FunPubDelete()
    {
        ObjDocumentNumberControlClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            string strAlert = "alert('__ALERT__');";
            string strKey = "Insert";
            string strRedirectPageView = "window.location.href='../System Admin/FASysDocNumberControl_View.aspx';";
            string strRedirectPageAdd = "window.location.href='../System Admin/FASysDocNumberControl_Add.aspx';";

            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsRow ObjDNCDetailsRow;
            ObjDNCDetailsRow = ObjFA_GetDNCDataTable.NewFA_Sys_DNCDetailsRow();
            ObjDNCDetailsRow.Doc_Number_Seq_ID = intDocSeqId;

            intErrCode = ObjDocumentNumberControlClient.FunPubDeleteDNCDetails(intDocSeqId, strConnectionName);
            // strAlert = strAlert.Replace("__ALERT__", "Document Number details deleted Successfully");
            if (intErrCode == 0)
            {
                if (intDocSeqId > 0)
                {
                    //strKey = "Modify";
                    strAlert = strAlert.Replace("__ALERT__", "Document Number details deleted Successfully");
                }
            }
            else if (intErrCode == 1)
            {
                strAlert = strAlert.Replace("__ALERT__", "Document Number cannot be deleted,since the sequence has been used");
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
            lblErrorMessage.Text = string.Empty;
        }
        //catch (FaultException<DocMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //       FAClsPubCommErrorLog.CustomErrorRoutine(objFaultExp);
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
            throw;
        }
        finally
        {
            // if(ObjDocumentNumberControlClient!=null)
            ObjDocumentNumberControlClient.Close();
        }
    }


    private void FunPriSetControlDDLToolTip()
    {

        ddlActivity.AddItemToolTipText_FA();
        ddlLocation.AddItemToolTipText_FA();
        ddlDocType.AddItemToolTipText_FA();
        ddlFinYear.AddItemToolTipText_FA();
       


    }
    #endregion

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            FunPubDelete();
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            // if(ObjDocumentNumberControlClient!=null)
            ObjDocumentNumberControlClient.Close();
        }

    }


    //private void FunPriGetBatchList()
    //{
    //    try
    //    {
    //        Dictionary<string, string> dictParam = new Dictionary<string, string>();
    //        dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
    //        ddlBatch.BindDataTable_FA("S3G_GetBatch_List", dictParam, new string[] { "Doc_Number_Seq_ID", "Batch" });
    //        ListItem lit = new ListItem("--Add Batch--", "-1");
    //        ddlBatch.Items.Insert(ddlBatch.Items.Count, lit);
    //    }
    //    catch (Exception ex)
    //    {
    //           FAClsPubCommErrorLog.CustomErrorRoutine(ex);
    //        throw new ApplicationException("Unable To Load Batch");
    //    }

    //}



    #region Get DNC
    /// <summary>
    /// Get DNC Details 
    /// </summary>
    private void FunGetEscalationDetatils()
    {
        ObjDocumentNumberControlClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        try
        {
            FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsRow ObjDNCDetailsRow;
            ObjDNCDetailsRow = ObjFA_GetDNCDataTable.NewFA_Sys_DNCDetailsRow();
            ObjDNCDetailsRow.Doc_Number_Seq_ID = intDocSeqId;
            ObjFA_GetDNCDataTable.AddFA_Sys_DNCDetailsRow(ObjDNCDetailsRow);
            FASerializationMode SerMode = FASerializationMode.Binary;
            byte[] byteDNCDetails = ObjDocumentNumberControlClient.FunPubGetDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_GetDNCDataTable, SerMode), strConnectionName);
            ObjFA_GetDNCDataTable = (FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable)FAClsPubSerialize.DeSerialize(byteDNCDetails, FASerializationMode.Binary, typeof(FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCDetailsDataTable));
            //if (ObjFA_GetDNCDataTable.Rows[0]["Activity"].ToString() == "0 - 0")
            //{
            //    ddlActivity.SelectedItem.Text = "--Select--";
                
            //}
            //else
            //{

            //    ddlActivity.SelectedValue = ObjFA_GetDNCDataTable.Rows[0]["Activity"].ToString();
            //}

            if (ObjFA_GetDNCDataTable.Rows[0]["Location"].ToString() == "0 - 0")
            {
                ddlLocation.SelectedItem.Text = "--Select--";
            }
            else
            {
                ddlLocation.SelectedValue = ObjFA_GetDNCDataTable.Rows[0]["Location_ID"].ToString();
            }
            ddlActivity.SelectedValue = ObjFA_GetDNCDataTable.Rows[0]["activity_id"].ToString();
            ddlDocType.SelectedValue = ObjFA_GetDNCDataTable.Rows[0]["Document_Type_ID"].ToString();
            //GetDateYear();
           // if (!string.IsNullOrEmpty(ObjFA_GetDNCDataTable.Rows[0]["Fin_Year"].ToString()))
            ddlFinYear.SelectedItem.Text = ObjFA_GetDNCDataTable.Rows[0]["Fin_Year"].ToString();
            txtBatch.Text = ObjFA_GetDNCDataTable.Rows[0]["Batch"].ToString();
            txtFromNo.Text = ObjFA_GetDNCDataTable.Rows[0]["From_Number"].ToString();
            txtToNo.Text = ObjFA_GetDNCDataTable.Rows[0]["To_Number"].ToString();
            txtLastNo.Text = ObjFA_GetDNCDataTable.Rows[0]["Last_Used_Number"].ToString();
            hdnID.Value = ObjFA_GetDNCDataTable.Rows[0]["Created_By"].ToString();
            if (ObjFA_GetDNCDataTable.Rows[0]["Is_Active"].ToString() == "True")
                CbxActive.Checked = true;
            else
                CbxActive.Checked = false;

            if (txtLastNo.Text == "0")
            {
                Modifyvalidtion();
            }
            else
            {
                validtion();
            }


        }
        //catch (FaultException<CompanyMgtServicesReference.ClsPubFaultException> objFaultExp)
        //{
        //       FAClsPubCommErrorLog.CustomErrorRoutine(objFaultExp);
        //    lblErrorMessage.Text = objFaultExp.Detail.ProReasonRW;
        //}
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
        finally
        {
            // if(ObjDocumentNumberControlClient!=null)
            ObjDocumentNumberControlClient.Close();
        }
    }

    #endregion
   

   
    #region Page Events

    #region Save/Delete/Clear_FA
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("../FA_System Admin/FASysDocNumberControl_View.aspx");
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #region Create DNC
    /// <summary>
    /// Create New DNC Details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ObjDocumentNumberControlClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
        bool bNumberValidation = false;
    try
     {
         if (txtFromNo.Text != "")
         {
             //if ((Convert.ToInt64(txtFromNo.Text) == 0) && (Convert.ToInt64(txtToNo.Text) == 0))
             //{
                 
             //    Utility_FA.FunShowAlertMsg_FA(this.Page, "From Number and To Number should be greater than 0");
             //    return;
             //}
             //--Ends Here
             if (Convert.ToInt64(txtFromNo.Text) == 0)
             {
                 
                 Utility_FA.FunShowAlertMsg_FA(this.Page, "From Number should be greater than 0");
                 return;

             }
         }
         if (txtToNo.Text != "" )
         {
             if (Convert.ToInt64(txtToNo.Text) == 0)
             {
                
                 Utility_FA.FunShowAlertMsg_FA(this.Page, "To Number should be greater than 0");
                 return;
             }
         }
         if (txtToNo.Text != "" && txtFromNo.Text!="")
         {
             if (Convert.ToInt64(txtFromNo.Text) == Convert.ToInt64(txtToNo.Text))
             {
                
                 Utility_FA.FunShowAlertMsg_FA(this.Page, "To Number should be greater than From Number");
                 return;
             }


             if (Convert.ToInt64(txtFromNo.Text) > Convert.ToInt64(txtToNo.Text))
             {
                
                 Utility_FA.FunShowAlertMsg_FA(this.Page, "To Number should be greater than From Number");
                 return;
             }
         }
         if (txtFromNo.Text.Trim() == "") 
         {

             Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter From Number");
             return;
         }
         if (txtToNo.Text.Trim() == "")
         {

             Utility_FA.FunShowAlertMsg_FA(this.Page, "Enter To Number");
             return;
         }
         if (bNumberValidation == true)
         {

             return;
         }



         if (intDocSeqId > 0)
         {
             cvDNC.ErrorMessage = "";
         }

         string strKey = "Insert";
         string strAlert = "alert('__ALERT__');";
         string strRedirectPageView = "window.location.href='../System Admin/FASysDocNumberControl_View.aspx';";
         string strRedirectPageAdd = "window.location.href='../System Admin/FASysDocNumberControl_Add.aspx';";


         FA_BusEntity.SysAdmin.SystemAdmin.FA_Sys_DNCMasterRow ObjDNCMasterRow;
         ObjDNCMasterRow = ObjFA_DNCMasterDataTable.NewFA_Sys_DNCMasterRow();
         ObjDNCMasterRow.Company_ID = intCompanyID;
         ObjDNCMasterRow.Activity_Id = Convert.ToInt32(ddlActivity.SelectedValue);
         //ObjDNCMasterRow.LOB_ID = Convert.ToInt32(ddlLOB.SelectedValue);
         ObjDNCMasterRow.Branch_ID = Convert.ToInt32(ddlLocation.SelectedValue);
         ObjDNCMasterRow.Document_Type_ID = Convert.ToInt32(ddlDocType.SelectedValue);
         if (strMode == "" || strMode == "C")
         {
             if (ddlFinYear.SelectedIndex > 0)
                 ObjDNCMasterRow.Fin_Year = ddlFinYear.SelectedItem.Text;
             else
                 ObjDNCMasterRow.Fin_Year = "";
         }
         else
         {
             ObjDNCMasterRow.Fin_Year = ddlFinYear.SelectedItem.Text;
         }

         ObjDNCMasterRow.Batch = txtBatch.Text;
         if (txtFromNo.Text != "")
             ObjDNCMasterRow.From_Number = Convert.ToDecimal(txtFromNo.Text);
         if (txtToNo.Text != "")
             ObjDNCMasterRow.To_Number = Convert.ToDecimal(txtToNo.Text);

         //Modified by Nataraj Y on 29/10/2010 To address the Company Level Scenario
         if (Convert.ToInt32(ddlLocation.SelectedValue) == 0)
         {
             ObjDNCMasterRow.Level = "C";
         }
         //ends here
         else if (Convert.ToInt32(ddlLocation.SelectedValue) == 0)
         {
             ObjDNCMasterRow.Level = "L";
         }
         //else if (Convert.ToInt32(ddlLOB.SelectedValue) == 0)
         //{
         //    ObjDNCMasterRow.Level = "B";
         //}
         else if (Convert.ToInt32(ddlLocation.SelectedValue) != 0)
         {
             ObjDNCMasterRow.Level = "S";
         }

         if (intDocSeqId > 0)
         {
             if (txtLastNo.Text.Length > 0)
             {
                 if (Convert.ToInt64(txtLastNo.Text) > Convert.ToInt64(txtToNo.Text))
                 {
                     Utility_FA.FunShowAlertMsg_FA(this.Page, "To Number should be greater than Last Used Number");
                     return;
                 }
                 //if (Convert.ToInt64(txtLastNo.Text) == Convert.ToInt64(txtToNo.Text))
                 //{
                 //    Utility_FA.FunShowAlertMsg_FA(this.Page, "To Number should be greater than Last Used Number ");
                 //    return;
                 //}
             }

         }
         //---End here

         if (txtLastNo.Text == "")
         {
             ObjDNCMasterRow.Last_Used_Number = null;
         }
         else
         {
             ObjDNCMasterRow.Last_Used_Number = txtLastNo.Text;                //validtion();
             //cvDNC.ErrorMessage = "Cannot modify this Document Number, its already used in some transaction.";
             //cvDNC.IsValid = false;
             //return;

         }
         ObjDNCMasterRow.Created_By = intUserID;
         ObjDNCMasterRow.Trans_Date = DateTime.Now;
         ObjDNCMasterRow.Doc_Number_Seq_ID = intDocSeqId;
         ObjDNCMasterRow.Modified_By = intUserID;
         ObjDNCMasterRow.Trans_Date = DateTime.Now;
         ObjDNCMasterRow.Is_Active = CbxActive.Checked;


         ObjFA_DNCMasterDataTable.AddFA_Sys_DNCMasterRow(ObjDNCMasterRow);

         FASerializationMode SerMode = FASerializationMode.Binary;

         if (intDocSeqId > 0)
         {
             //if (Convert.ToInt32(ddlLOB.SelectedValue) > 0)
             //{
             //    if (FunCheckLobisvalid(ddlLOB.SelectedValue))
             //    {

             //        intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_DNCMasterDataTable, SerMode));
             //    }
             //    else
             //    {
             //        strAlert = strAlert.Replace("__ALERT__", "Selected Line of Business rights not assigned");
             //        ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
             //        return;
             //    }
             //}
             //else
             //{
             //    intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_DNCMasterDataTable, SerMode));
             //}


             if (Convert.ToInt32(ddlLocation.SelectedValue) > 0)
             {
                 //if (FunCheckBranchisvalid(ddlLocation.SelectedValue))
                 //{

                 intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_DNCMasterDataTable, SerMode), strConnectionName);
                 //}
                 ////else
                 ////{
                 ////    strAlert = strAlert.Replace("__ALERT__", "Selected Branch rights not assigned");
                 //    ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
                 //    return;
                 //}
             }
             else
             {
                 intErrCode = ObjDocumentNumberControlClient.FunPubModifyDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_DNCMasterDataTable, SerMode), strConnectionName);
             }


         }
         else
         {
             intErrCode = ObjDocumentNumberControlClient.FunPubCreateDNCDetails(SerMode, FAClsPubSerialize.Serialize(ObjFA_DNCMasterDataTable, SerMode), strConnectionName);
         }
         if (intErrCode == 0)
         {
             if (intDocSeqId > 0)
             {
                 strKey = "Modify";
                 strAlert = strAlert.Replace("__ALERT__", "Doument Number Control details updated successfully");
             }
             else
             {
                 strAlert = "Document Number Control details added successfully";
                 strAlert += @"\n\nWould you like to add one more record?";
                 strAlert = "if(confirm('" + strAlert + "')){" + strRedirectPageAdd + "}else {" + strRedirectPageView + "}";
                 strRedirectPageView = "";
                 CbxActive.Checked = true;
             }
         }
         else if (intErrCode == 1)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
             strRedirectPageView = "";
         }

         else if (intErrCode == 2)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
             strRedirectPageView = "";
         }
         else if (intErrCode == 3)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists");
             strRedirectPageView = "";
         }

         else if (intErrCode == 4)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination is already exists.");
             strRedirectPageView = "";
         }

         else if (intErrCode == 5)
         {
             strAlert = strAlert.Replace("__ALERT__", "Enter the To Number greater than From Number");
             strRedirectPageView = "";
         }
         else if (intErrCode == 6)
         {
             strAlert = strAlert.Replace("__ALERT__", "Enter the From Number and To Number already exists this selected year");
             strRedirectPageView = "";
         }

         else if (intErrCode == 7)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
             strRedirectPageView = "";
             //Deactivate the active indicator and insert for that combination of Company and Line of Business and Branch wise
         }

         else if (intErrCode == 8)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
             strRedirectPageView = "";
             //Deactivate the active indicator and insert for that combination of Company and Line of business wise
         }
         else if (intErrCode == 9)
         {
             strAlert = strAlert.Replace("__ALERT__", "Document Number for selected combination already exists");
             strRedirectPageView = "";
             //Deactivate the active indicator and insert for that combination of company and branch wise         
         }
         else if (intErrCode == 19)
         {
             strAlert = strAlert.Replace("__ALERT__", "Financial year to be mapped");
             strRedirectPageView = "";
             //Deactivate the active indicator and insert for that combination of company and branch wise         
         }
         else if (intErrCode == 99)
         {
             strAlert = strAlert.Replace("__ALERT__", "Batch Number already exists");
             strRedirectPageView = "";
             //Deactivate the active indicator and insert for that combination of company and branch wise         
         }
         else
         {
             strAlert = strAlert.Replace("__ALERT__", "Error in saving document sequence number");
             strRedirectPageView = "";
         }
         ScriptManager.RegisterStartupScript(this, this.GetType(), strKey, strAlert + strRedirectPageView, true);
         lblErrorMessage.Text = string.Empty;
      }
        catch(Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);      

            lblErrorMessage.Text=ex.Message;
        }
     

    }
    /// <summary>
    /// Clear_FA the all user enterable details
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
       FunPubClear();
            
        }
        catch(Exception ex)
        {
         FAClsPubCommErrorLog.CustomErrorRoutine(ex);

            lblErrorMessage.Text=ex.Message;
        }
    }

    #endregion

    #region Dropdown List
    /// <summary>
    /// selected change value using branch
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ddlBatch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToInt32(ddlBatch.SelectedValue) == -1)
            {
                txtBatch.Enabled = true;
            }
            else
            {
                txtBatch.Enabled = false;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }
    }

    #endregion

    #endregion


    #region ValueDisable
    /// <summary>
    /// this method using role access
    /// </summary>
    /// <param name="intModeID"></param>
    private void FunPriDisableControls(int intModeID)
    {
        try
        {
            switch (intModeID)
            {
                case 0: // Create Mode
                    if (!bCreate)
                    {
                        btnSave.Enabled = false;
                    }
                    CbxActive.Checked = true;
                    CbxActive.Enabled = false;
                    txtLastNo.Enabled = false;
                    rfvDocType.Visible = true;
                    //rfvFinYear.Visible = true;
                    btnDelete.Visible = false;
                    ddlBatch.Visible = false;
                    CbxActive.Enabled = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
                    
                    break;

                case 1: // Modify Mode
                    if (!bModify)
                    {
                        btnSave.Enabled = false;
                    }
                    CbxActive.Enabled = true;
                    FunGetEscalationDetatils();
                    btnClear.Enabled = false;
                    btnDelete.Visible = true;
                    ddlBatch.Visible = false;
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    break;

                case -1:// Query Mode
                    FunGetEscalationDetatils();
                    if (!bQuery)
                    {
                        Response.Redirect(strRedirectPageView);
                    }


                    CbxActive.Enabled = false;
                    ddlFinYear.Enabled = true;
                    ddlDocType.Enabled = true;
                    ddlLocation.Enabled = true;
                    //ddlLOB.Enabled = true;
                    txtFromNo.ReadOnly = true;
                    txtLastNo.ReadOnly = true;
                    txtToNo.ReadOnly = true;
                    txtBatch.ReadOnly = true;
                    txtBatch.Enabled = true;
                    txtFromNo.Enabled = true;
                    txtLastNo.Enabled = true;
                    txtToNo.Enabled = true;
                    btnDelete.Visible = false;
                    btnSave.Enabled = false;
                    btnClear.Enabled = false;
                    if (bClearList)
                    {
                        //ddlLOB.ClearDropDownList_FA();
                        ddlLocation.ClearDropDownList_FA();
                        ddlDocType.ClearDropDownList_FA();
                        ddlFinYear.ClearDropDownList_FA();
                    }
                    lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View);
                    break;
            }
            FunPriSetControlDDLToolTip();
        }
        catch (Exception ex)
        {

               FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            lblErrorMessage.Text = ex.Message;
        }

    }
    #endregion
    #endregion
}

