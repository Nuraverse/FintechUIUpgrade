
#region Page Header
/// © 2010 SUNDARAM INFOTECH SOLUTIONS P LTD . All rights reserved

/// <Program Summary>
/// Module Name               : SysAdmin 
/// Screen Name               : Hierchy Master
/// Created By                : Muni Kavitha
/// Created Date              : 17-Jan-2012
/// Purpose                   : To create Hierachy Master Generation
/// Last Updated By           : 
/// Last Updated Date         : 
/// Reason                    : 
/// <Program Summary>
#endregion


#region NameSpaces

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
using System.Globalization;
using System.ServiceModel;
using Resources;
using FA_BusEntity;
using System.Text;

#endregion

public partial class Sysadm_FASysHierarchyMaster_Add :ApplyThemeForProject_FA 
{   
    #region Variable declaration

    SystemAdminMgtServiceReference.SystemAdminMgtServiceClient objHierachyClient;
    FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterDataTable obj_HierachyMasterDTB = null;
    FASerializationMode SerMode = FASerializationMode.Binary;
    
    //User Authorization
    string strMode = string.Empty;
    bool bCreate = false;
    bool bClearList = false;
    bool bModify = false;
    bool bQuery = false;
    bool bIsActive = false;
    bool bMakerChecker = false;
    //Code end

    int intErrCode, intUserID, intCompanyID = 0, i, j, check = 0;
    static string strPageName = "Hierachy Master";
    DataTable dt = new DataTable();
    Dictionary<string, string> dictParam = null;
    string StrXMLHierachyDetails;
    string strRedirectPage = "../System Admin/FASysHierarchyMaster_Add.aspx";
    string strRedirectPageView = "window.location.href='../System Admin/FASysHierarchyMaster_Add.aspx';";
    string strRedirectPageHome = "../Common/HomePage.aspx";
    string strToConcatenate;
    string strConnectionName = string.Empty;
    int[] numbers = new int[5];
    UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();

    #endregion
        
    #region Events

    // Page Load Event
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            FunPriLoadPage();
        }
        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvHierarchyMaster.ErrorMessage = Resources.ErrorHandlingAndValidation._205;
            cvHierarchyMaster.IsValid = false;
        }
    }
    // Save
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int OutResult;
            OutResult = FunPriSaveDetails();
            if (OutResult != 201 && OutResult != 202)
            {
                strToConcatenate = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(OutResult)) + strToConcatenate;
                Utility_FA.FunShowAlertMsg_FA(this, strToConcatenate);
            }
            else
                Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, "", strRedirectPageView, ViewState["Mode"].ToString(), false, strToConcatenate);

                //Utility_FA.FunShowValidationMsg_FA(this.Page, OutResult, strRedirectPageAdd, strRedirectPageView, strMode, false);
        
            
            //Utility_FA.FunShowValidationMsg_FA(this.Page, FunPriSaveDetails(), "", strRedirectPageView, ViewState ["Mode"].ToString (), false,strToConcatenate);
        }
        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            cvHierarchyMaster.ErrorMessage = Resources.ErrorHandlingAndValidation._204;
            //lblErrorMessage.Text = Resources.ErrorHandlingAndValidation._204;
            cvHierarchyMaster.IsValid = false;
        }
    }
    // Cancel
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            //Added
            //ReturnToWFHome(); 
             Response.Redirect(strRedirectPageHome);
            //Added
        }
        catch (Exception objException)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(objException, strPageName);
            //throw objException;
        }
    }
    // Grid RowDataBound Events
    protected void GRVHeirachy_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblActive = (Label)e.Row.FindControl("lblActive");
                CheckBox chkActive = (CheckBox)e.Row.FindControl("chkActive");
                TextBox txtWidth = (TextBox)e.Row.FindControl("txtWidth");
                TextBox txtLocationDesc = (TextBox)e.Row.FindControl("txtLocationDesc");
                //Added
                CheckBox chkOperational = (CheckBox)e.Row.FindControl("chkOperational");
                //Added
                chkActive.Checked = Convert.ToBoolean(lblActive.Text);
                //Added
                txtWidth.SetDecimalPrefixSuffix_FA(1, 0, true);
                //Added
                txtWidth.Text = txtWidth.Text == "0" ? txtWidth.Text = string.Empty : txtWidth.Text;
                //Added
                //if (!string.IsNullOrEmpty(txtWidth.Text) && !string.IsNullOrEmpty(txtLocationDesc.Text))
                //    txtWidth.ReadOnly = txtLocationDesc.ReadOnly = true;
                //if (bMakerChecker)
                //{
                //    txtLocationDesc.Enabled = txtWidth.Enabled = chkActive.Enabled = false;
                //}


               // if (!string.IsNullOrEmpty(txtWidth.Text) && !string.IsNullOrEmpty(txtLocationDesc.Text))
                //    txtWidth.ReadOnly = true;// txtLocationDesc.ReadOnly

                if (bMakerChecker) //Modified by Tamilselvan.S on 15/12/2011 for UAT Malolan Observation fixing
                {
                    txtLocationDesc.ReadOnly = txtWidth.ReadOnly = true;
                    chkActive.Enabled = chkOperational.Enabled = false;
                }
                if (bModify && ObjUserInfo_FA.ProUserLevelIdRW != 5) //Modified by Tamilselvan.S on 15/12/2011 for UAT Malolan Observation fixing
                {
                    chkOperational.Enabled = chkActive.Enabled = false;
                    txtLocationDesc.ReadOnly = txtWidth.ReadOnly = true;
                }
                //Added


            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            cvHierarchyMaster.ErrorMessage = Resources.ErrorHandlingAndValidation._205;
            cvHierarchyMaster.IsValid = false;
        }
    }

   // Checkbox Events

    protected void chkOperational_CheckedChanged(object sender, EventArgs e)
    {
        try
        {


            CheckBox chk = (CheckBox)sender;

            GridViewRow gvRow = (GridViewRow)chk.Parent.Parent;
            CheckBox chkActive = (CheckBox)gvRow.FindControl("chkActive");

            if (chkActive.Checked)
            {
                /*foreach (GridViewRow grow in GRVHeirachy.Rows)
                {
                    CheckBox chkOperational = (CheckBox)grow.FindControl("chkOperational");
                    if (gvRow.RowIndex != grow.RowIndex)
                    {
                        chkOperational.Checked = false;
                    }
                }*/
            }
            else
            {
                /* foreach (GridViewRow grow in GRVHeirachy.Rows)
                 {
                     CheckBox chkOperational = (CheckBox)grow.FindControl("chkOperational");
                     chkOperational.Checked = false;
                 }*/
                chk.Checked = false;
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Operational Location should be set to active Level");
                return;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }

    protected void chkActive_CheckedChanged(object sender, EventArgs e)
    {
        try
        {


            CheckBox chk = (CheckBox)sender;

            GridViewRow gvRow = (GridViewRow)chk.Parent.Parent;
            CheckBox chkActive = (CheckBox)gvRow.FindControl("chkActive");
            CheckBox chkOperational = (CheckBox)gvRow.FindControl("chkOperational");
            if (chkOperational.Checked && (!chkActive.Checked))
            {
                chkActive.Checked = true;
                Utility_FA.FunShowAlertMsg_FA(this.Page, "Operational Location is mapped with the selected Location Level.");
                return;
            }
        }
        catch (Exception ex)
        {
               FAClsPubCommErrorLog.CustomErrorRoutine(ex, strPageName);
            throw ex;
        }
    }
    // Checkbox Events



    #endregion

    #region User Defined Functions

    private void FunPrisetIntialRow()
    {
        try
        {
            DataRow dr;
            dt.Columns.Add("Hierachy");
            dt.Columns.Add("Width");
            dt.Columns.Add("Location_Description");
            dt.Columns.Add("Active");
            //Added
            dt.Columns.Add("Operational");
            //Added
            for (i = 1; i <= 5; i++)
            {
                dr = dt.NewRow();
                dr["Hierachy"] = Convert.ToString(i);
                dr["Width"] = string.Empty;
                dr["Location_Description"] = string.Empty;
                dr["Active"] = true;
                dt.Rows.Add(dr);
            }
            GRVHeirachy.Columns[3].Visible = false;
            GRVHeirachy.DataSource = dt;
            GRVHeirachy.DataBind();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    private void FunPriLoadPage()
    {
        try
        {
            this.Page.Title = FunPubGetPageTitles(enumPageTitle.PageTitle);
            intCompanyID = ObjUserInfo_FA.ProCompanyIdRW;
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            FASession ObjFASession = new FASession();

            //User Authorization
            bCreate = ObjUserInfo_FA.ProCreateRW;
            bModify = ObjUserInfo_FA.ProModifyRW;
            bQuery = ObjUserInfo_FA.ProViewRW;
            bIsActive = ObjUserInfo_FA.ProIsActiveRW;
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            strConnectionName = ObjFASession.ProConnectionName;

            if (!IsPostBack)
            {
                FunPriGetHierachyDetails();

                //Added
                if (bModify && ObjUserInfo_FA.ProUserLevelIdRW == 5)
                    btnSave.Enabled = true;
                else
                    btnSave.Enabled = false;
                //Added
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    private void FunPriGenerateHierachyXMLDetails()
    {
        try
        {
           // StrXMLHierachyDetails = GRVHeirachy.FunPubFormXml_FA();
            StringBuilder strbXml = new StringBuilder();
            strbXml.Append("<Root>");

            foreach (GridViewRow grvRow in GRVHeirachy.Rows)
            {
                Label lblHierachy = grvRow.FindControl("lblHierachy") as Label;
                TextBox txtWidth = grvRow.FindControl("txtWidth") as TextBox;
                TextBox txtLocationDesc = grvRow.FindControl("txtLocationDesc") as TextBox;
                CheckBox chkActive = grvRow.FindControl("chkActive") as CheckBox;
                CheckBox chkOperational = grvRow.FindControl("chkOperational") as CheckBox;

                strbXml.Append(" <Details ");
                strbXml.Append(" Hierarchy = '" + lblHierachy.Text + "'");

                if(!string .IsNullOrEmpty (txtWidth.Text))
                    strbXml.Append(" Width = '" + txtWidth.Text + "'");
                else
                    strbXml.Append(" Width = '0' ");

                if (!string.IsNullOrEmpty(txtLocationDesc.Text))
                    strbXml.Append(" LocationDescription = '" + txtLocationDesc.Text + "'");
                else
                    strbXml.Append(" LocationDescription = '0' ");

                strbXml.Append(" Active = '" + chkActive.Checked + "'");
                strbXml.Append(" OperationalLocation = '" + chkOperational.Checked + "' />");

            }
            strbXml.Append("</Root>");
            StrXMLHierachyDetails = strbXml.ToString();
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    private void FunPriGetHierachyDetails()
    {
        try
        {
            DataSet DS = new DataSet();
            dictParam = new Dictionary<string, string>();
            dictParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            DS = Utility_FA.GetDataset(SPNames.GetHierachyDTL, dictParam);
            UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
            intUserID = ObjUserInfo_FA.ProUserIdRW;
            //Added
            bMakerChecker = ObjUserInfo_FA.ProMakerCheckerRW;
            //// MakerChecker_Access
            //if (DS.Tables[1].Rows.Count > 0 && DS.Tables[0].Rows.Count > 0)
            //{
            //    if ((bModify) && (ObjUserInfo_FA.IsUserLevelUpdate(Convert.ToInt32(DS.Tables[1].Rows[0]["Created_By"]), Convert.ToInt32(DS.Tables[1].Rows[0]["User_Level_ID"]))))
            //        bMakerChecker = false;
            //    else
            //        bMakerChecker = true; ;
            //}
            //Added

            //  Create Mode           
            if (DS.Tables[0].Rows.Count == 0)
            {
               ViewState ["Mode"]= strMode = "C"; //Added 
                FunPrisetIntialRow();
                lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Create);
            }

            // Modify Mode
            else if (DS.Tables[0].Rows.Count > 0)
            {
                ViewState["Mode"] = strMode = "M";//Added
                if (DS.Tables[0].Rows.Count >= 5)   // All five Rows available
                {
                    GRVHeirachy.DataSource = DS.Tables[0];
                    GRVHeirachy.DataBind();
                    //Added
                    // lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    if (bModify && ObjUserInfo_FA.ProUserLevelIdRW == 5)
                    {
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    }
                    else
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View); 
                    //Added
               
                }
                else if (DS.Tables[0].Rows.Count < 5)   //  Not Five Rows Available  Bind All  5 Rows
                {
                    DataRow dr;
                    for (i = DS.Tables[0].Rows.Count + 1; i <= 5; i++)
                    {
                        dr = DS.Tables[0].NewRow();
                        dr["Hierachy"] = Convert.ToString(i);
                        dr["Width"] = 0;
                        dr["Location_Description"] = string.Empty;
                        dr["Active"] = false;
                        dr["Operational"] = false;//Added
                        DS.Tables[0].Rows.Add(dr);
                    }
                    GRVHeirachy.DataSource = DS.Tables[0];
                    GRVHeirachy.DataBind();
                    //Added
                    //lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    if (bModify && ObjUserInfo_FA.ProUserLevelIdRW == 5)
                    {
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.Modify);
                    }
                    else
                        lblHeading.Text = FunPubGetPageTitles(enumPageTitle.View); //Modified by Tamilselvan.S on 15/12/2011 for UAT Malolan Observation fixing
                   //Added
                }
                //For allowing modification hierarchically (from Low To High)
                if (DS.Tables[0].Rows.Count > 0)
                {
                    //Added
                    // Modified By Chandrasekar K On 28-08-2012
                    string strType = DS.Tables[0].Rows[0]["Active"].GetType().ToString();
                    var vartotalCount = Convert.ToInt64(0);
                    if (strType == "System.Boolean")
                    {
                         vartotalCount = Convert.ToInt64((from c in DS.Tables[0].AsEnumerable()
                                                             where !string.IsNullOrEmpty(c.Field<string>("Location_description")) && c.Field<bool>("Active") == true
                                                             select c.Field<bool>("Active")).Count());
                    }
                    else
                    {
                         vartotalCount = Convert.ToInt64((from c in DS.Tables[0].AsEnumerable()
                                                             where !string.IsNullOrEmpty(c.Field<string>("Location_description")) && c.Field<string>("Active") == "True"
                                                             select c.Field<string>("Active")).Count());
                    }
                    //var vartotalCount = Convert.ToInt64((from c in DS.Tables[0].AsEnumerable()
                    //                                     where !string.IsNullOrEmpty(c.Field<string>("Location_description"))
                    //                                     && c.Field<string>("Active").ToUpper() == "TRUE"
                    //                                     select c.Field<string>("Active")).Count());
                 
                    //Added
                    int intRowCount = 0;
                    foreach (GridViewRow gvr in GRVHeirachy.Rows)
                    {
                        intRowCount++;
                        CheckBox chk = (CheckBox)gvr.FindControl("chkActive");
                        TextBox txtWidth = (TextBox)gvr.FindControl("txtWidth");
                        
                        chk.Enabled = false;
                        txtWidth.ReadOnly = true;

                        //Added
                        //if (intRowCount > vartotalCount - 1)
                        //    chk.Enabled = true;
                        if (bModify && ObjUserInfo_FA.ProUserLevelIdRW == 5) //Modified by Tamilselvan.S on 15/12/2011 for UAT Malolan Observation fixing
                        {
                            if (intRowCount > vartotalCount - 1)
                            {//Added for changing width
                                chk.Enabled = true;
                                txtWidth.ReadOnly = false;
                                //txtWidth.Attributes.Remove("Readonly");
                                //txtWidth.Attributes.Add("Readonly", "false");
                            }//Added for changing width
                        }
                        //Added
                    }
                }
            }   
        }
        catch (Exception objException)
        {
            throw objException;
        }
    }
    private int  FunPriSaveDetails()
    {
      try
        {
            //Added
            //if (lblHeading.Text.Contains("Create"))
            //    strMode = "C";
            //else
            //    strMode = "M";
            //Added 

            int intTotalWidth = 0;
            for (i = 0; i < 5; i++)
            {
                TextBox txtWidth = (TextBox)GRVHeirachy.Rows[i].FindControl("txtWidth");
                TextBox txtLocationDesc = (TextBox)GRVHeirachy.Rows[i].FindControl("txtLocationDesc");
                CheckBox chkActive = (CheckBox)GRVHeirachy.Rows[i].FindControl("chkActive");
                // Validation for Leaving Empty in width
                if (string.IsNullOrEmpty(txtWidth.Text.Trim()) && (!string.IsNullOrEmpty(txtLocationDesc.Text.Trim())))
                {
                    chkActive.Checked = false;
                    strToConcatenate = (i + 1).ToString ();
                    return 206;
                }
                // Validation  Leaving Empty in Description 
                else if (!string.IsNullOrEmpty(txtWidth.Text.Trim()) && (string.IsNullOrEmpty(txtLocationDesc.Text.Trim())))
                {
                    strToConcatenate = (i + 1).ToString();
                    //chkActive.Checked = false;
                    return 207;
                }
                //Check Not Empty in Width and Description
                else if (!string.IsNullOrEmpty(txtWidth.Text.Trim()) && (!string.IsNullOrEmpty(txtLocationDesc.Text.Trim()  )))
                {
                    numbers[i] = i + 1;
                    //Added
                    //if (lblHeading.Text.Contains("Create"))
                    //    chkActive.Checked = true;
                    if (strMode == "C")
                        chkActive.Checked = true;
                    //Added
                }
                //validation for Leaving Empty both Width and Description
                else if (string.IsNullOrEmpty(txtWidth.Text.Trim()) && (string.IsNullOrEmpty(txtLocationDesc.Text.Trim())))
                    chkActive.Checked = false;
                //Validation for total width length should be Eight.
                if (!string.IsNullOrEmpty(txtWidth.Text.Trim()) && (!string.IsNullOrEmpty(txtLocationDesc.Text.Trim())))
                    intTotalWidth += Convert.ToInt32(txtWidth.Text.Trim());

                //Added
                string strLoc = ((TextBox)GRVHeirachy.Rows[i].FindControl("txtLocationDesc")).Text.Trim().ToUpper();
                for (int loopVal = i + 1; loopVal < 5; loopVal++)  // check the Duplicate description
                {
                    if ((!string.IsNullOrEmpty(strLoc)) && (((TextBox)GRVHeirachy.Rows[loopVal].FindControl("txtLocationDesc")).Text.Trim().ToUpper() ==
                       ((TextBox)GRVHeirachy.Rows[i].FindControl("txtLocationDesc")).Text.Trim().ToUpper()))
                    {
                        //Utility_FA.FunShowAlertMsg_FA(this.Page, "Duplicate Location Description : " +
                        //    (((TextBox)GRVHeirachy.Rows[loopVal].FindControl("txtLocationDesc")).Text.Trim()));

                        strToConcatenate =(((TextBox)GRVHeirachy.Rows[loopVal].FindControl("txtLocationDesc")).Text.Trim());
                       
                        return 211;
                    }
                }
                //Added
            }
            //Validation for total width length should be Eight. 
            if (intTotalWidth > 8)
            {
                return 208;
            }

            for (i = 0; i < 5; i++)  // check whether values given in Sequence order
            {
                if (numbers[i] == 0)
                {
                    for (j = i + 1; j < 5; j++)
                    {
                        if (numbers[j] != 0)
                        {
                            return 209;
                        }
                    }
                }
            }
            if (numbers.Sum() == 0)
            {
                return 210; 
            }
            if (Page.IsValid)
            {
                obj_HierachyMasterDTB = new FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterDataTable();
                FA_BusEntity.SysAdmin.SystemAdmin.FA_HierachyMasterRow ObjHierachyRow;
                ObjHierachyRow = obj_HierachyMasterDTB.NewFA_HierachyMasterRow();
                ObjHierachyRow.Company_ID = intCompanyID;
                ObjHierachyRow.Created_By = intUserID;
                FunPriGenerateHierachyXMLDetails();
                ObjHierachyRow.XMLHierachyDetails = StrXMLHierachyDetails;
                obj_HierachyMasterDTB.AddFA_HierachyMasterRow(ObjHierachyRow);
                objHierachyClient = new SystemAdminMgtServiceReference.SystemAdminMgtServiceClient();
                intErrCode = objHierachyClient.FunPubSaveHierachyMaster(SerMode, FAClsPubSerialize.Serialize(obj_HierachyMasterDTB, SerMode), strConnectionName);
            }
        }
        catch (Exception objException)
        {
            throw objException;
        }
        finally
        {
            if (objHierachyClient != null)
                objHierachyClient.Close();
        }
      return intErrCode;
    }
    
    #endregion

}

