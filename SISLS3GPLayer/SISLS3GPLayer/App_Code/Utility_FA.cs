
using System;
using System.Web;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;
using FA_BusEntity;
using System.Collections.Generic;
using AjaxControlToolkit;
using System.Collections;
using System.Linq;

//This NameSpace for PDF Format
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;
using iTextSharp.text.html;
using System.IO;
using FAAdminServiceReference;
using System.Resources;
using System.Reflection;
public static partial class Utility_FA
{

    #region Alerts Message

    /// <summary>
    /// 
    /// </summary>
    /// <param name="thisPage"></param>
    /// <param name="intErrCode"></param>
    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode)
    {
        StringBuilder strMsg = new StringBuilder();
        string strAlertMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode));
        strMsg.Append("alert('" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }


    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode,string strtoconcatenate)
    {
        StringBuilder strMsg = new StringBuilder();
       
        string strAlertMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode)) + " " + strtoconcatenate;
        strMsg.Append("alert('" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }


    #region Boostrap Alerts Message
    //Added by Boobalan M on 28-11-2019 for Boostrap Alert Message
    public static void FunAlertMsg(Page thisPage, string Type, string Title, string strAlertMsg)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("Alert('" + Type + "','" + Title + "','" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }

    // Para = Title, msg 
    public static void FunSuccessReload(Page thisPage, string Title, string strAlertMsg)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("successRefAlt('" + Title + "','" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }

    

    // Para = Title, msg , confirmMsg, confirmUrl, cancelurl
    public static void FunSaveConfirmAlertMsg(Page thisPage, string Title, string strAlertMsg, string confirmMsg, string confirmUrl, string cancelUrl)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("successConfirm('" + Title + "','" + strAlertMsg + "','" + confirmMsg + "','" + confirmUrl + "','" + cancelUrl + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }

    // Para = Title, msg , RedirectUrl
    public static void FunUpdateAlertMsg(Page thisPage, string Title, string strAlertMsg, string url)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("successRedir('" + Title + "','" + strAlertMsg + "','" + url + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }
    #endregion


    /// <summary>
    /// 
    /// </summary>
    /// <param name="thisPage"></param>
    /// <param name="intErrCode"></param>
    /// <param name="strRedirectPage"></param>
    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode, string strRedirectAddPage, string strRedirectViewPage, string strMode, bool blnValReturn)
    {
        //StringBuilder strMsg = new StringBuilder();
        string strAlertMsg = "";
        string strMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode));
        if (blnValReturn == false)
        {
            if (!string.IsNullOrEmpty(strRedirectAddPage) && !string.IsNullOrEmpty(strRedirectViewPage) && (strMode == "C" || strMode == ""))
            {
                strAlertMsg = "if(confirm('" + strMsg.ToString() + "')){" + strRedirectAddPage + "}else {" + strRedirectViewPage + "}";
            }
            else if (!string.IsNullOrEmpty(strRedirectViewPage) && strMode == "M")
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectViewPage;
            }
            else
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');";
            }
        }
        else
        {
            strAlertMsg = "alert('" + strMsg.ToString() + "');";
        }
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strAlertMsg.ToString(), true);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="thisPage"></param>
    /// <param name="intErrCode"></param>
    /// <param name="strRedirectPage"></param>
    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode, string strRedirectAddPage, string strRedirectViewPage, string strMode, bool blnValReturn, string strToConcatenate)
    {
        //StringBuilder strMsg = new StringBuilder();
        string strAlertMsg = "";
        string strMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode)) + strToConcatenate;
        if (blnValReturn == false)
        {
            if (!string.IsNullOrEmpty(strRedirectAddPage) && !string.IsNullOrEmpty(strRedirectViewPage) && (strMode == "C" || strMode == ""))
            {
                strAlertMsg = "if(confirm('" + strMsg.ToString() + "')){" + strRedirectAddPage + "}else {" + strRedirectViewPage + "}";
            }
            else if (!string.IsNullOrEmpty(strRedirectAddPage) && strMode == "M")
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectAddPage;
            }
            else if (!string.IsNullOrEmpty(strRedirectViewPage) && strMode == "M")
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectViewPage;
            }
            else
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');";
            }
        }
        else
        {
            strAlertMsg = "alert('" + strMsg.ToString() + "');";
        }
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strAlertMsg.ToString(), true);
    }


    /// <summary>
    /// This method will execute the error msg along with Document Number.
    /// </summary>
    /// <param name="thisPage"></param>
    /// <param name="intErrCode"></param>
    /// <param name="strRedirectPage"></param>
    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode, string strRedirectAddPage, string strRedirectViewPage, string strMode, bool blnValReturn, string strToConcatenate, bool IsDocno)
    {
        //StringBuilder strMsg = new StringBuilder();
        string strAlertMsg = "";
        string strMsg = Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode));

        if (IsDocno && !string.IsNullOrEmpty(strToConcatenate))
        {
            if (strMsg.Contains("Doc_No"))
                strMsg = strMsg.Replace("Doc_No", "\"" + strToConcatenate + "\"");
            else
                strMsg = "\"" + strToConcatenate + "\" " + strMsg;
        }

        if (blnValReturn == false)
        {
            if (!string.IsNullOrEmpty(strRedirectAddPage) && !string.IsNullOrEmpty(strRedirectViewPage) && (strMode == "C" || strMode == ""))
            {
                strAlertMsg = "if(confirm('" + strMsg.ToString() + "')){" + strRedirectAddPage + "}else {" + strRedirectViewPage + "}";
            }
            else if (!string.IsNullOrEmpty(strRedirectViewPage) && strMode == "M")
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectViewPage;
            }
            else
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');";
            }
        }
        else
        {
            strAlertMsg = "alert('" + strMsg.ToString() + "');";
        }
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strAlertMsg.ToString(), true);
    }

    public static void FunShowValidationMsg_FA(Page thisPage, int intErrCode, string strRedirectAddPage, string strRedirectViewPage, string strMode, bool blnValReturn, string strToConcatenate, bool IsDocno,string budgetmsg)
    {
        //StringBuilder strMsg = new StringBuilder();
        string strAlertMsg = "";
        string strMsg = "";

        if (!string.IsNullOrEmpty(budgetmsg))
        {
            strMsg = budgetmsg + " ";
        }
        strMsg = strMsg + Resources.ErrorHandlingAndValidation.ResourceManager.GetString(Convert.ToString(intErrCode));

        if (IsDocno && !string.IsNullOrEmpty(strToConcatenate))
        {
            if (strMsg.Contains("Doc_No"))
                strMsg = strMsg.Replace("Doc_No", "\"" + strToConcatenate + "\"");
            else
                strMsg = "\"" + strToConcatenate + "\" " + strMsg;
        }
        

        if (blnValReturn == false)
        {
            if (!string.IsNullOrEmpty(strRedirectAddPage) && !string.IsNullOrEmpty(strRedirectViewPage) && (strMode == "C" || strMode == ""))
            {
                strAlertMsg = "if(confirm('" + strMsg.ToString() + "')){" + strRedirectAddPage + "}else {" + strRedirectViewPage + "}";
            }
            else if (!string.IsNullOrEmpty(strRedirectViewPage) && strMode == "M")
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');" + strRedirectViewPage;
            }
            else
            {
                strAlertMsg = "alert('" + strMsg.ToString() + "');";
            }
        }
        else
        {
            strAlertMsg = "alert('" + strMsg.ToString() + "');";
        }
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strAlertMsg.ToString(), true);
    }


    /// <summary>
    /// This function is used to show alert message and page will not redirct after clicking ok button
    /// </summary>
    /// 
    public static void FunShowAlertMsg_FA(Page thisPage, string strAlertMsg)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("alert('" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }

    public static void FunShowAlertMsg_FA(Control thisControl, string strAlertMsg)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("alert('" + strAlertMsg + "');");
        ScriptManager.RegisterStartupScript(thisControl, thisControl.GetType(), "Display", strMsg.ToString(), true);
    }
    /// <summary>
    /// This function is used to show alert message and page will be redircted after clicking ok button
    /// </summary>
    ///
    public static void FunShowAlertMsg_FA(System.Web.UI.Page thisPage, string strAlertMsg, string strRedirectPage)
    {
        StringBuilder strMsg = new StringBuilder();
        strMsg.Append("alert('" + strAlertMsg + "');");
        strMsg.Append("window.location.href='" + strRedirectPage + "';");
        ScriptManager.RegisterStartupScript(thisPage, thisPage.GetType(), "Display", strMsg.ToString(), true);
    }
    #endregion

    //Added by Chandru k on 17/06/2013 for auto fill
    #region GetSuggestions
    /// <summary>
    /// GetSuggestions
    /// </summary>
    /// <param name="key">Country Names to search</param>
    /// <returns>Country Names Similar to key</returns>
    public static List<String> GetSuggestions(DataTable dt1)
    {
        List<String> suggestions = new List<string>();
        try
        {
            DataRow[] dtSuggestions = dt1.Select();

            if (dt1.Rows.Count == 0)
            {
                string suggestion1 = AutoCompleteExtender.CreateAutoCompleteItem("Records not found!", "-1");
                suggestions.Add(suggestion1);
                return suggestions;
            }
            else
            {
                foreach (DataRow dr in dtSuggestions)
                {
                    string suggestion = AutoCompleteExtender.CreateAutoCompleteItem(dr["Document_No"].ToString(), dr["ID"].ToString());
                    suggestions.Add(suggestion);
                }
            }
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(objException);
            return suggestions;
        }
        return suggestions;
    }
    #endregion


    #region Other General Methods

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strGridName"></param>
    /// <param name="strClientID"></param>
    /// <returns></returns>
    public static int FunPubGetGridRowID(string strGridName, string strClientID)
    {
        string strVal = strClientID.Substring(strClientID.LastIndexOf(strGridName + "_")).Replace(strGridName + "_ctl", "");
        int gRowIndex = Convert.ToInt32(strVal.Substring(0, strVal.LastIndexOf("_")));
        gRowIndex = gRowIndex - 2;
        return gRowIndex;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strSplitValue"></param>
    /// <returns></returns>
    public static string FunGetValueBySplit(string strSplitValue)
    {
        return (strSplitValue.Substring(0, strSplitValue.LastIndexOf("-")).Trim().ToUpper());
    }

    /// <summary>
    /// Method to convert a string to date based on Global parmeter datformat
    /// </summary>
    /// <param name="strInput"></param>
    /// <returns></returns>
    public static DateTime StringToDate(string strInput)
    {
        DateTime dtValidDatetime;
        //if (strInput != string.Empty || strInput != "")
        //{
        if ((strInput.Contains(":")) && (IsDateTime(strInput)))
        {
            dtValidDatetime = Convert.ToDateTime(strInput);
        }
        else
        {
            FASession ObjFASession = new FASession();
            DateTimeFormatInfo dtformat = new DateTimeFormatInfo();
            if (ObjFASession.ProDateFormatRW != null || ObjFASession.ProDateFormatRW != string.Empty)
            {
                dtformat.ShortDatePattern = ObjFASession.ProDateFormatRW;
            }
            else
            {
                dtformat.ShortDatePattern = "MM/dd/yy";
            }
            DateTime dt = DateTime.Parse(strInput, dtformat);
            dtValidDatetime = Convert.ToDateTime(dt.ToString("yyyy/MM/dd"));

        }
        return dtValidDatetime;
        //}
        //else
        //{
        //    return DateTime.Now;
        //}
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtCtrl"></param>
    public static void Clear_FA(this TextBox txtCtrl)
    {
        txtCtrl.Text = string.Empty;
    }



    /// <summary>
    /// Method will calculate Sum of amount field by grouping any description field both sum field and 
    /// group by filed are got as Inputs
    /// </summary>
    /// <param name="objDataTable">base Datatable from which calculatio to be carried</param>
    /// <param name="strGroupByField">Filed on which group by to be carried out </param>
    /// <param name="strSumField">The field for which sum should be obtained</param>
    /// <returns></returns>
    public static DataTable FunPriCalculateSumAmount(DataTable objDataTable, string strGroupByField, string strSumField)
    {
        DataTable objReturnDataTable = new DataTable();
        objReturnDataTable.Columns.Add(strGroupByField);
        objReturnDataTable.Columns.Add(strSumField);
        var varQuery = from row in objDataTable.AsEnumerable()
                       group row by row.Field<string>(strGroupByField) into grp
                       orderby grp.Key
                       select new { Id = grp.Key, Sum = grp.Sum(r => r.Field<Decimal>(strSumField)) };

        foreach (var varCollection in varQuery)
        {
            DataRow objDataRow = objReturnDataTable.NewRow();
            objDataRow[strGroupByField] = varCollection.Id;
            objDataRow[strSumField] = varCollection.Sum;
            objReturnDataTable.Rows.Add(objDataRow);
        }
        return objReturnDataTable;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strPath"></param>
    /// <param name="strPdfContent"></param>
    public static void FunPubGeneratePDF(string strPath, string strPdfContent, string strDocTitle)
    {
        Document doc = new Document();
        PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(strPath, FileMode.Create));
        doc.AddCreator("Sundaram Infotech Solutions");
        doc.AddTitle(strDocTitle);
        doc.Open();
        List<IElement> htmlarraylist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(strPdfContent), null);
        for (int k = 0; k < htmlarraylist.Count; k++)
        { doc.Add((IElement)htmlarraylist[k]); }
        doc.AddAuthor("SISL-S3G");
        doc.Close();
        System.Diagnostics.Process.Start(strPath);
    }

    /// <summary>
    /// Will convert the source datatable table rows to columns
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="strMainHeader"></param>
    /// <param name="strColName"></param>
    /// <returns></returns>
    public static DataTable FunConvertRowToColumn(DataTable dt, string strMainHeader, string[] strColName)
    {
        if (dt != null && dt.Rows.Count > 0 && strColName != null && strColName.Length > 0)
        {
            DataTable dttemp = new DataTable();

            // to add the headings column
            DataColumn dcType = new DataColumn(strMainHeader);
            dttemp.Columns.Add(dcType);
            for (int i_col = 0; i_col < dt.Columns.Count; i_col++)
            {
                DataRow dr = dttemp.NewRow();
                dr[strMainHeader] = dt.Columns[i_col].Caption;
                dttemp.Rows.Add(dr);
            }

            // to add the columns
            for (int i_col = 0; i_col < strColName.Length; i_col++)
            {
                DataColumn dc = new DataColumn(strColName[i_col]);
                dc.DefaultValue = "";
                dttemp.Columns.Add(dc);
            }

            // cell values
            for (int i_row = 0; i_row < dt.Rows.Count; i_row++)  // source table
            {
                for (int i_col = 0; i_col < dt.Columns.Count; i_col++) // source table
                {
                    dttemp.Rows[i_col][i_row + 1] = dt.Rows[i_row][i_col]; // destn table
                }
            }
            return dttemp;
        }
        return dt;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="strMainHeader"></param>
    /// <param name="Columns"></param>
    /// <returns></returns>
    public static DataTable FunConvertRowToColumn(DataTable dt, string strMainHeader, Dictionary<string, string> Columns)
    {
        if (dt != null && dt.Rows.Count > 0 && Columns != null && Columns.Count > 0)
        {
            DataTable dttemp = new DataTable();

            // to add the headings column
            DataColumn dcType = new DataColumn(strMainHeader);
            dttemp.Columns.Add(dcType);
            for (int i_col = 0; i_col < dt.Columns.Count; i_col++)
            {
                DataRow dr = dttemp.NewRow();
                dr[strMainHeader] = dt.Columns[i_col].Caption;
                dttemp.Rows.Add(dr);
            }
            foreach (KeyValuePair<string, string> Pair in Columns)
            {
                DataColumn dc = new DataColumn(Pair.Key, Type.GetType(Pair.Value));
                dc.DefaultValue = DBNull.Value;
                dttemp.Columns.Add(dc);
            }

            //// to add the columns
            //for (int i_col = 0; i_col < Columns.Count; i_col++)
            //{

            //}

            // cell values
            for (int i_row = 0; i_row < dt.Rows.Count; i_row++)  // source table
            {
                for (int i_col = 0; i_col < dt.Columns.Count; i_col++) // source table
                {
                    dttemp.Rows[i_col][i_row + 1] = dt.Rows[i_row][i_col]; // destn table
                }
            }
            return dttemp;
        }
        return dt;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ddlSource"></param>
    public static void RemoveDropDownList_FA(this DropDownList ddlSource)
    {
        try
        {
            System.Web.UI.WebControls.ListItem lstItem;

            if (ddlSource.SelectedIndex > 0)
            {
                lstItem = new System.Web.UI.WebControls.ListItem(ddlSource.SelectedItem.Text, ddlSource.SelectedItem.Value);
                ddlSource.Items.Clear();
                ddlSource.Items.Add(lstItem);
            }
            else
            {
                ddlSource.Items.Clear();
                ddlSource.Items.Add("--Select--");
            }

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="ddlSource"></param>
    public static void ClearDropDownList_FA(this DropDownList ddlSource)
    {

        try
        {
            System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(ddlSource.SelectedItem.Text, ddlSource.SelectedItem.Value); ;
            ddlSource.Items.Clear();
            ddlSource.Items.Add(lstItem);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="cmbSource"></param>
    public static void ClearDropDownList_FA(this ComboBox cmbSource)
    {

        try
        {
            System.Web.UI.WebControls.ListItem lstItem = new System.Web.UI.WebControls.ListItem(cmbSource.SelectedItem.Text, cmbSource.SelectedItem.Value); ;
            cmbSource.Items.Clear();
            cmbSource.Items.Add(lstItem);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    /// <summary>
    /// created by : Tamilselvan.S
    /// created Date : 23/03/2012
    /// Clear_FA radio button list
    /// </summary>
    /// <param name="rblSource"></param>
    public static void ClearRadioButtonList_FA(this RadioButtonList rblSource)
    {
        try
        {
            foreach (System.Web.UI.WebControls.ListItem li in rblSource.Items)
            {
                if (li.Selected == false)
                    li.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    public static string GetAmountInWords_FA(this decimal dcmlVal)
    {
        try
        {
            string[] strarr = dcmlVal.ToString().Split('.');
            string strAmt = "";
            if (strarr[0] != null)
            {
                strAmt += FunGetAmountInWords(Convert.ToInt32(strarr[0]));
            }
            //if (strarr.Length > 1)
            //{
            //    if (strarr[1] != null && Convert.ToInt32(strarr[1]) > 0)
            //    {
            //        strAmt += " and " + FunGetAmountInWords(Convert.ToInt32(strarr[1]));
            //    }
            //}
            return strAmt + " only";
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    public static string FunGetAmountInWords(int number)
    {
        try
        {
            if (number == 0) return "Zero";
            int[] num = new int[4];
            int first = 0;
            int u, h, t;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            if (number < 0)
            {
                sb.Append("Minus ");
                number = -number;
            }
            string[] words0 = { "", "One ", "Two ", "Three ", "Four ", "Five ", "Six ", "Seven ", "Eight ", "Nine " };
            string[] words1 = { "Ten ", "Eleven ", "Twelve ", "Thirteen ", "Fourteen ", "Fifteen ", "Sixteen ", "Seventeen ", "Eighteen ", "Nineteen " };
            string[] words2 = { "Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ", "Seventy ", "Eighty ", "Ninety " };
            string[] words3 = { "Thousand ", "Lakh ", "Crore " };
            num[0] = number % 1000; // units  
            num[1] = number / 1000;
            num[2] = number / 100000;
            num[1] = num[1] - 100 * num[2]; // thousands  
            num[3] = number / 10000000; // crores  
            num[2] = num[2] - 100 * num[3]; // lakhs  
            for (int i = 3; i > 0; i--)
            {
                if (num[i] != 0)
                {
                    first = i;
                    break;
                }
            }
            for (int i = first; i >= 0; i--)
            {
                if (num[i] == 0) continue;
                u = num[i] % 10; // ones  
                t = num[i] / 10;
                h = num[i] / 100; // hundreds  
                t = t - 10 * h; // tens  
                if (h > 0) sb.Append(words0[h] + "Hundred ");
                if (u > 0 || t > 0)
                {
                    //if (h > 0 || i == 0) sb.Append("and "); 
                    if (t == 0)
                        sb.Append(words0[u]);
                    else if (t == 1)
                        sb.Append(words1[u]);
                    else
                        sb.Append(words2[t - 2] + words0[u]);
                }
                if (i != 0) sb.Append(words3[i - 1]);
            }
            return sb.ToString().TrimEnd();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    public static string FunGetApprovalMessage(string strSceenName, DropDownList ddlStatus)
    {
        string strMessage = "";
        if (ddlStatus.SelectedValue == "3")
            strMessage = strSceenName + " approved successfully.";
        else if (ddlStatus.SelectedValue == "4")
            strMessage = strSceenName + " rejected successfully.";
        else
            strMessage = strSceenName + " approval details added successfully.";

        return strMessage;
    }

    ///// <summary>
    ///// To get the Value of the Dropdown list by passing its item name
    ///// </summary>
    ///// <param name="ddl"></param>
    ///// <param name="strItem"></param>
    ///// <returns></returns>
    //public static string FunGetDdlValueByItem(this DropDownList ddl, string strItem)
    //{
    //    if (ddl != null && ddl.Items.Count > 0)
    //    {
    //        for (int i = 0; i < ddl.Items.Count; i++)
    //        {
    //            //if ((string.Compare( strItem, ddl.Items[i].Text)) == 0)
    //            if (ddl.Items[i].Text.Contains(strItem))
    //                return ddl.Items[i].Value;
    //        }
    //        //return ddl.Items.FindByText(strItem).Value;
    //    }
    //    return "1";
    //}


    #endregion

    #region Methods for Validations
    /// <summary>
    /// This Extension Method is used check for a valid password 
    /// </summary>
    /// <param name="strPassword"></param>
    /// <returns></returns>
    public static bool IsValidPassword_FA(this string strPassword)
    {
        if (strPassword.Length < 6 || strPassword.Length > 6)
        {
            return false;
        }

        char charFirst = Convert.ToChar(strPassword.Substring(0, 1).ToLower());
        if (!char.IsLetterOrDigit(charFirst))
            return false;

        string strSp = @"~!@#$%^&*()_+|`-=\/?,.`[]{}:;'";
        string strNo = "0123456789";

        char[] chArray = strPassword.ToCharArray();

        bool blnSpResult = false;
        bool blnNoResult = false;
        bool blnUpResult = false;
        bool blnLoResult = false;

        foreach (char ch in chArray)
        {
            blnSpResult = (blnSpResult == false) ? strSp.IndexOf(ch) > 0 : blnSpResult;
            blnNoResult = (blnNoResult == false) ? strNo.IndexOf(ch) > 0 : blnNoResult;
            blnLoResult = (blnLoResult == false) ? char.IsLower(ch) : blnLoResult;
            blnUpResult = (blnUpResult == false) ? char.IsUpper(ch) : blnUpResult;
        }
        string strResult = blnSpResult.ToString() + blnNoResult.ToString() + blnLoResult.ToString() + blnUpResult.ToString();
        return strResult.Replace("False", "").Replace("True", "T").ToString().Length >= 3;
    }

    #region Methods to Fill Dropdown Combo
    /// <summary>
    /// This Extension method used to Fill DropdownList
    /// </summary>
    /// <param name="ddlSourceControl">Source DropdownList Control</param>
    /// <param name="ObjDataTable">DataTable Name</param>
    /// <param name="strDataValueColumn">DataValueColumn</param>
    /// <param name="strDataTextColumn">DataTextColumn</param>
    public static void FillDataTable_FA(this DropDownList ddlSourceControl, DataTable ObjDataTable, string strDataValueColumn, string strDataTextColumn)
    {
        ddlSourceControl.Items.Clear();
        if (ObjDataTable != null)
        {
            if (ObjDataTable.Rows.Count > 0)
            {
                ddlSourceControl.DataValueField = strDataValueColumn;
                ddlSourceControl.DataTextField = strDataTextColumn;
                ddlSourceControl.DataSource = ObjDataTable;
                ddlSourceControl.DataBind();
            }
        }
        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        ddlSourceControl.Items.Insert(0, liSelect);
    }

    /// <summary>
    /// This Extension method used to Fill Ajax DropdownList
    /// </summary>
    /// <param name="ddlSourceControl">Source DropdownList Control</param>
    /// <param name="ObjDataTable">DataTable Name</param>
    /// <param name="strDataValueColumn">DataValueColumn</param>
    /// <param name="strDataTextColumn">DataTextColumn</param>
    public static void FillDataTable_FA(this AjaxControlToolkit.ComboBox ddlSourceControl, DataTable ObjDataTable, string strDataValueColumn, string strDataTextColumn)
    {
        ddlSourceControl.Items.Clear();
        if (ObjDataTable != null)
        {
            if (ObjDataTable.Rows.Count > 0)
            {
                ddlSourceControl.DataValueField = strDataValueColumn;
                ddlSourceControl.DataTextField = strDataTextColumn;
                ddlSourceControl.DataSource = ObjDataTable;
                ddlSourceControl.DataBind();
            }
        }
        System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        ddlSourceControl.Items.Insert(0, liSelect);
    }

    public static void FillDataTable_FA(this AjaxControlToolkit.ComboBox ddlSourceControl, DataTable ObjDataTable, string strDataValueColumn, string strDataTextColumn, bool NeedSelect)
    {
        ddlSourceControl.Items.Clear();
        if (ObjDataTable != null)
        {
            if (ObjDataTable.Rows.Count > 0)
            {
                ddlSourceControl.DataValueField = strDataValueColumn;
                ddlSourceControl.DataTextField = strDataTextColumn;
                ddlSourceControl.DataSource = ObjDataTable;
                ddlSourceControl.DataBind();
            }
        }
        System.Web.UI.WebControls.ListItem liSelect;
        if (NeedSelect)
        {
            liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
        }
        else
        {
            liSelect = new System.Web.UI.WebControls.ListItem(" ", "0");
        }
        ddlSourceControl.Items.Insert(0, liSelect);
    }


    /// <summary>
    /// This method for filling dropdown By Narayanan
    /// </summary>
    /// <param name="ObjDDL">Pass dropdown object</param>
    /// <param name="ObjDT">Pass Datable</param>
    public static void FillDLL_FA(this DropDownList ObjDDL, DataTable ObjDT)
    {
        try
        {
            ObjDDL.Items.Clear();

            //if (ObjDDL.Items.Count > 0)
            //{
            //    ObjDDL.DataSource = null;
            //    ObjDDL.DataBind();
            //}
            if (ObjDT.Rows.Count > 0 && ObjDT.Columns.Count > 1)
            {
                ObjDDL.DataTextField = ObjDT.Columns[1].ColumnName;
                ObjDDL.DataValueField = ObjDT.Columns[0].ColumnName;
                ObjDDL.DataSource = ObjDT;
                ObjDDL.DataBind();
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "-1");
            ObjDDL.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    public static void FillDLL_FA(this DropDownList ObjDDL, DataTable ObjDT, bool IsNeedSelect)
    {
        try
        {
            ObjDDL.Items.Clear();
            //ObjDDL.DataSource = null;
            //ObjDDL.DataBind();

            if (ObjDT.Rows.Count > 0 && ObjDT.Columns.Count > 1)
            {
                ObjDDL.DataSource = ObjDT;
                ObjDDL.DataTextField = ObjDT.Columns[1].ColumnName;
                ObjDDL.DataValueField = ObjDT.Columns[0].ColumnName;
                ObjDDL.DataBind();
            }
            if (IsNeedSelect)
            {
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "-1");
                ObjDDL.Items.Insert(0, liSelect);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    public static void FillDLL_FA(AjaxControlToolkit.ComboBox ObjDDL, bool IsNeedSelect, DataTable ObjDT)
    {
        try
        {
            //ObjDDL.Items.Clear();
            ObjDDL.DataSource = null;
            ObjDDL.DataBind();
            if (ObjDT.Rows.Count > 0 && ObjDT.Columns.Count > 1)
            {
                ObjDDL.DataSource = ObjDT;
                ObjDDL.DataTextField = ObjDT.Columns[1].ColumnName;
                ObjDDL.DataValueField = ObjDT.Columns[0].ColumnName;
                ObjDDL.DataBind();
            }
            if (IsNeedSelect)
            {
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "-1");
                ObjDDL.Items.Insert(0, liSelect);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }


    #endregion

    /// <summary>
    /// To Check the string has special charcters
    /// </summary>
    /// <param name="strValue"></param>
    /// <param name="blnSpaceAllowed"></param>
    /// <param name="blnFirstLetterIsNumeric"></param>
    /// <returns></returns>
    public static bool HasSpecialCharacter_FA(this string strValue, bool blnSpaceAllowed, bool blnFirstLetterIsNumeric)
    {
        bool blnSpResult = false;

        char[] chArray = strValue.ToCharArray();

        if (!blnFirstLetterIsNumeric)
        {
            string strNumber = "0123456789";
            char charFirst = Convert.ToChar(strValue.Substring(0, 1).ToLower());
            if (strNumber.IndexOf(charFirst) > 0)
            {
                return true;
            }
        }

        string strSpecialChar = @"~!@#$%^&*()_+|`-=\/?,.`[]{}:;'";

        if (!blnSpaceAllowed)
        {
            strSpecialChar += " ";
        }

        foreach (char ch in chArray)
        {
            if (strSpecialChar.IndexOf(ch) > 0)
            {
                blnSpResult = true;
                break;
            }
        }
        return blnSpResult;
    }

    /// <summary>
    /// To compare two dates
    /// gives 1 if startdate is less than enddate
    /// gives -1 if start date is greater that enddate
    /// gives 0 when both date are same
    /// else gives 2
    /// </summary>
    /// <param name="startDate"></param>
    /// <param name="endDate"></param>
    /// <returns></returns>
    public static int CompareDates(string startDate, string endDate)
    {
        try
        {

            DateTime strDT = new DateTime();
            DateTime endDT = new DateTime();
            if (startDate != "")
            {
                strDT = StringToDate(startDate);
            }
            if (endDate != "")
            {
                endDT = StringToDate(endDate);
            }
            if (strDT < endDT)
            {
                return 1;
            }
            else if (strDT > endDT)
            {
                return -1;
            }
            else if (strDT == endDT)
            {
                return 0;
            }
            else
            {
                return 2;
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }


    //Created by Kali to compare Last Date
    /// <summary>
    /// 
    /// </summary>
    /// <param name="strDateTime"></param>
    /// <returns></returns>
    public static bool FunPriCompareLastDate(string strDateTime)
    {
        DateTime dtDate = Utility_FA.StringToDate(strDateTime);
        DateTime dtLast = new DateTime(dtDate.Year, dtDate.Month, 1).AddMonths(1).AddDays(-1);
        if (DateTime.Compare(dtDate, dtLast) == 0)
        {
            return true;
        }
        return false;
    }


    //Created by Muni Kavitha to validate selected date with current FinYear 
    /// <summary>
    /// 
    /// </summary>
    /// <param name="strDateTime"></param>
    /// <returns></returns>
    public static bool FunPubValidateWithFinYear(Page page, TextBox txt, string strSelectedDate, string strField)
    {
        FASession objFASession = new FASession();
        string strBeginDate = "", strEndDate = "";
        strBeginDate = objFASession.ProFinYearStartMonthRW + "/1/" + objFASession.ProFinStartYearRW;
        string count = System.DateTime.DaysInMonth(Convert.ToInt32(objFASession.ProFinEndYearRW), Convert.ToInt32(objFASession.ProFinYearEndMonthRW)).ToString();
        strEndDate = objFASession.ProFinYearEndMonthRW + "/" + count + "/" + objFASession.ProFinEndYearRW;

        if ((Utility_FA.StringToDate(strSelectedDate) < Convert.ToDateTime(strBeginDate)) || (Utility_FA.StringToDate(strSelectedDate) > Convert.ToDateTime(strEndDate)))
        {
            Utility_FA.FunShowAlertMsg_FA(page, strField + " should be within the Current Financial Year");
            //txt.Text = DateTime.Now.ToString(objFASession.ProDateFormatRW);
            txt.Clear_FA();
            return false;
        }
        return true;
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="strDateTime"></param>
    /// <returns></returns>
    public static bool IsDateTime(string strDateTime)
    {
        try
        {

            DateTime dtDatetime = Convert.ToDateTime(strDateTime);
            if (dtDatetime != null)
            {
                return true;
            }
            else
            {
                return false;
            }


        }
        catch (Exception)
        {
            return false;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="strVal"></param>
    /// <returns></returns>
    public static bool CheckZeroValidate_FA(this string strVal)
    {
        try
        {
            int val = Convert.ToInt32(strVal);
            if (val != 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch
        {
            return true;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="grvGrid"></param>
    public static void ClearGrid_FA(this GridView grvGrid)
    {
        try
        {
            grvGrid.Dispose();
            grvGrid.DataSource = null;
            grvGrid.DataBind();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    #endregion

    #region Methods to Handle Session

    /// <summary>
    /// Method to store a data in session
    /// </summary>
    /// <param name="name"></param>
    /// <param name="value"></param>
    public static void store(string name, object value)
    {
        if (System.Web.HttpContext.Current == null || System.Web.HttpContext.Current.Session == null)
        {
            return;

        }
        else
        {
            System.Web.HttpContext.Current.Session[name] = value;

        }
    }
    /// <summary>
    /// method to get a value from session
    /// </summary>
    /// <param name="name"></param>
    /// <param name="defaultvalue"></param>
    /// <returns></returns>
    public static object Load(string name, object defaultvalue)
    {
        if (System.Web.HttpContext.Current == null || System.Web.HttpContext.Current.Session == null)
        {
            return null;

        }
        else
        {
            return System.Web.HttpContext.Current.Session[name];

        }
    }
    /// <summary>
    /// Method to kill sessions
    /// </summary>
    public static void FunPubKillSession()
    {
        System.Web.HttpContext.Current.Session.Abandon();
    }
    #endregion

    #region Methods For Paging User Control

    /// <summary>
    /// 
    /// </summary>
    /// <param name="grvPaging"></param>
    /// <param name="arrSearchVal"></param>
    public static void FunPriSetSearchValue_FA(this GridView grvPaging, ArrayList arrSearchVal)
    {
        if (grvPaging.HeaderRow != null)
        {
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                TextBox txtHead = (TextBox)grvPaging.HeaderRow.FindControl("txtHeaderSearch" + (iCount + 1).ToString());
                if (txtHead != null)
                    txtHead.Text = arrSearchVal[iCount].ToString().Replace("'", "");
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="grvPaging"></param>
    /// <param name="arrSearchVal"></param>
    public static void FunPriClearSearchValue_FA(this GridView grvPaging, ArrayList arrSearchVal)
    {
        if (grvPaging.HeaderRow != null)
        {
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                TextBox txtHead = (TextBox)grvPaging.HeaderRow.FindControl("txtHeaderSearch" + (iCount + 1).ToString());
                if (txtHead != null)
                    txtHead.Text = "";
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="grvPaging"></param>
    /// <param name="arrSearchVal"></param>
    /// <param name="intNoofSearch"></param>
    /// <returns></returns>
    public static ArrayList FunPriGetSearchValue_FA(this GridView grvPaging, ArrayList arrSearchVal, int intNoofSearch)
    {
        arrSearchVal = new ArrayList(intNoofSearch);
        if (grvPaging.HeaderRow != null)
        {
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                TextBox txtHead = (TextBox)grvPaging.HeaderRow.FindControl("txtHeaderSearch" + (iCount + 1).ToString());
                if (txtHead != null)
                    arrSearchVal.Add(txtHead.Text.Trim().Replace("'", "''"));
            }
        }
        else
        {
            for (int iCount = 0; iCount < arrSearchVal.Capacity; iCount++)
            {
                arrSearchVal.Add("");
            }
        }
        return arrSearchVal;
    }



    /// <summary>
    /// Method will return a datatable by passing procedure name and 
    /// parameters as dictionary
    /// </summary>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="intTotalRecords"></param>
    /// <param name="ObjPaging"></param>
    /// <returns></returns>
    public static DataTable GetGridData(string strProcName, Dictionary<string, string> dictProcParam, out int intTotalRecords, FAPagingValues ObjPaging)
    {
        intTotalRecords = 0;
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        DataTable ObjDataTable = null;
        FASession ObjFASession = new FASession();
        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            byte[] byteRoleDetails = ObjAdminService.FunPubFillGridPaging(strProcName, ObjFASession.ProConnectionName, dictProcParam, ObjPaging, out intTotalRecords);
            ObjDataTable = (DataTable)FAClsPubSerialize.DeSerialize(byteRoleDetails, FASerializationMode.Binary, typeof(DataTable));

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
        return ObjDataTable;

    }
    /// <summary>
    /// Method will return a datatable by passing procedure name and 
    /// parameters as dictionary
    /// </summary>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="intTotalRecords"></param>
    /// <param name="intErrorCode"></param>
    /// <param name="ObjPaging"></param>
    /// <returns></returns>
    public static DataTable GetGridData(string strProcName, Dictionary<string, string> dictProcParam, out int intTotalRecords, out int intErrorCode, FAPagingValues ObjPaging)
    {
        intTotalRecords = 0;
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        DataTable ObjDataTable = null;
        FASession ObjFASession = new FASession();
        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            byte[] byteRoleDetails = ObjAdminService.FunPubFillGridPagingWithErrorCode(strProcName, ObjFASession.ProConnectionName, dictProcParam, ObjPaging, out intTotalRecords, out intErrorCode);
            ObjDataTable = (DataTable)FAClsPubSerialize.DeSerialize(byteRoleDetails, FASerializationMode.Binary, typeof(DataTable));

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
        return ObjDataTable;
    }


    /// <summary>
    /// To bind the Grid based on Paging concept
    /// </summary>
    /// <param name="grvSource"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="intTotalRecords"></param>
    /// <param name="ObjPaging"></param>
    /// <param name="bIsNewRow"></param>
    public static void BindGridView_FA(this GridView grvSource, string strProcName, Dictionary<string, string> dictProcParam, out int intTotalRecords, FAPagingValues ObjPaging, out bool bIsNewRow)
    {
        intTotalRecords = 0;
        bIsNewRow = false;
        try
        {
            DataTable ObjDataTable = GetGridData(strProcName, dictProcParam, out intTotalRecords, ObjPaging);

            if (ObjDataTable != null)
            {
                DataView ObjDataView = ObjDataTable.DefaultView;

                if (ObjDataView.Count == 0)
                {
                    ObjDataView.AddNew();

                    if (ObjDataTable.Columns.Contains("is_active"))
                        ObjDataView[0]["is_active"] = false;

                    if (ObjDataTable.Columns.Contains("is_operational"))
                        ObjDataView[0]["is_operational"] = false;

                    if (ObjDataTable.Columns.Contains("Activity_ID")) //Added by Tamilselvan for S3G Integaration 
                        ObjDataView[0]["Activity_ID"] = 0;

                    if (ObjDataTable.Columns.Contains("Created_By"))
                        ObjDataView[0]["Created_By"] = 0;

                    if (ObjDataTable.Columns.Contains("User_Level_ID"))
                        ObjDataView[0]["User_Level_ID"] = 0;

                    if (ObjDataTable.Columns.Contains("ID"))
                        ObjDataView[0]["ID"] = 0;

                    if (ObjDataTable.Columns.Contains("Trans"))//Added by Tamilselvan.S on 03/05/2012 for Transaction checks with empty
                        ObjDataView[0]["Trans"] = false;


                    bIsNewRow = true;
                }
                grvSource.DataSource = ObjDataView;
                grvSource.DataBind();
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }
    public static DataTable GetDefaultData_Without_Paging( string strProcName, Dictionary<string, string> dictProcParam, out int intTotalRecords, FAPagingValues ObjPaging, out bool bIsNewRow)
    {
        //Sathish R
        //Created on:30-Jun-2020
        intTotalRecords = 0;
        bIsNewRow = false;
         DataTable ObjDataTable=null;
        try
        {
             ObjDataTable = GetGridData(strProcName, dictProcParam, out intTotalRecords, ObjPaging);

            if (ObjDataTable != null)
            {
                DataView ObjDataView = ObjDataTable.DefaultView;

                if (ObjDataView.Count == 0)
                {
                    ObjDataView.AddNew();

                    if (ObjDataTable.Columns.Contains("is_active"))
                        ObjDataView[0]["is_active"] = false;

                    if (ObjDataTable.Columns.Contains("is_operational"))
                        ObjDataView[0]["is_operational"] = false;

                    if (ObjDataTable.Columns.Contains("Activity_ID")) //Added by Tamilselvan for S3G Integaration 
                        ObjDataView[0]["Activity_ID"] = 0;

                    if (ObjDataTable.Columns.Contains("Created_By"))
                        ObjDataView[0]["Created_By"] = 0;

                    if (ObjDataTable.Columns.Contains("User_Level_ID"))
                        ObjDataView[0]["User_Level_ID"] = 0;

                    if (ObjDataTable.Columns.Contains("ID"))
                        ObjDataView[0]["ID"] = 0;

                    if (ObjDataTable.Columns.Contains("Trans"))//Added by Tamilselvan.S on 03/05/2012 for Transaction checks with empty
                        ObjDataView[0]["Trans"] = false;


                    bIsNewRow = true;
                }
               
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        return ObjDataTable;
    }
   
   
    /// <summary>
    /// To bind the Grid based on Paging concept with sorting
    /// </summary>
    /// <param name="grvSource"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="intTotalRecords"></param>
    /// <param name="ObjPaging"></param>
    /// <param name="bIsNewRow"></param>
    /// <param name="arrSortColumn"></param>
    public static void BindGridView_FA(this GridView grvSource, string strProcName, Dictionary<string, string> dictProcParam, out int intTotalRecords, FAPagingValues ObjPaging, out bool bIsNewRow, out string[] arrSortColumn)
    {
        intTotalRecords = 0;
        bIsNewRow = false;
        string[] arrSortColumns = new string[] { };
        try
        {
            DataTable ObjDataTable = GetGridData(strProcName, dictProcParam, out intTotalRecords, ObjPaging);

            if (ObjDataTable != null)
            {
                DataView ObjDataView = ObjDataTable.DefaultView;

                if (ObjDataView.Count == 0)
                {
                    ObjDataView.AddNew();

                    if (ObjDataTable.Columns.Contains("is_active"))
                        ObjDataView[0]["is_active"] = false;

                    if (ObjDataTable.Columns.Contains("is_operational"))
                        ObjDataView[0]["is_operational"] = false;

                    if (ObjDataTable.Columns.Contains("Created_By"))
                        ObjDataView[0]["Created_By"] = 0;

                    if (ObjDataTable.Columns.Contains("User_Level_ID"))
                        ObjDataView[0]["User_Level_ID"] = 0;

                    if (ObjDataTable.Columns.Contains("ID"))
                        ObjDataView[0]["ID"] = 0;

                    bIsNewRow = true;
                }
                grvSource.DataSource = ObjDataView;
                grvSource.DataBind();
                arrSortColumns = new string[] { ObjDataView.Table.Columns[1].ToString(), ObjDataView.Table.Columns[2].ToString() };
            }
            arrSortColumn = arrSortColumns;
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
    }

    #endregion

    #region Methods to from XML from Gridview

    /// <summary>
    /// This method will form XML for Gridview its is a extended method available for 
    /// all gridview.
    /// Enum for type of grid will be passed.Currently only grid with 
    /// all column as  Template Column or Bound column will be supported.
    /// </summary>
    /// <param name="grvPaging"></param>
    /// <param name="enumGridTyp"></param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this GridView grvXml, enumGridType enumGridTyp)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");
        foreach (GridViewRow grvrow in grvXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            if (enumGridTyp == enumGridType.TemplateGrid)
            {
                foreach (TemplateField dtCols in grvXml.Columns)
                {
                    strColValue = "";
                    if (intcolcount < grvXml.Columns.Count)
                    {
                        if (grvrow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                        {
                            //strColValue = ((TextBox)grvrow.Cells[intcolcount].Controls[1]).Text;
                            if (dtCols.HeaderText.ToUpper().Contains("REMARKS") || dtCols.HeaderText.ToUpper().Contains("NARRATION"))
                            {
                                strColValue = ((TextBox)grvrow.Cells[intcolcount].Controls[1]).Text.Trim();
                            }
                            else
                            {
                                strColValue = ((TextBox)grvrow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                            }
                        }
                        if (grvrow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                        {
                            strColValue = ((DropDownList)grvrow.Cells[intcolcount].Controls[1]).SelectedValue;
                        }
                        if (grvrow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                        {
                            strColValue = ((CheckBox)grvrow.Cells[intcolcount].Controls[1]).Checked == true ? "1" : "0";
                        }
                        if (grvrow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                        {
                            //strColValue = ((Label)grvrow.Cells[intcolcount].Controls[1]).Text;
                            if (dtCols.HeaderText.ToUpper().Contains("REMARKS") || dtCols.HeaderText.ToUpper().Contains("NARRATION"))
                            {
                                strColValue = ((Label)grvrow.Cells[intcolcount].Controls[1]).Text.Trim();
                            }
                            else
                            {
                                strColValue = ((Label)grvrow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                            }
                        }
                        if (dtCols.HeaderText.ToString() != "" || dtCols.HeaderText.ToString() != string.Empty)
                        {
                            if (strColValue != "" || strColValue != string.Empty)
                            {
                                strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                                strColValue = strColValue.Replace("'", "\"");
                                strbXml.Append(dtCols.HeaderText.Replace(" ", "") + "='" + strColValue + "' ");
                            }
                        }
                    }
                    intcolcount++;
                }
            }
            if (enumGridTyp == enumGridType.BoundGrid)
            {
                foreach (BoundField dtCols in grvXml.Columns)
                {
                    strColValue = grvrow.Cells[intcolcount].Text;
                    if (dtCols.HeaderText.ToString() != "" || dtCols.HeaderText.ToString() != string.Empty)
                    {
                        strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                        strbXml.Append(dtCols.HeaderText.Replace(" ", "") + "='" + strColValue + "' ");
                    }
                    intcolcount++;
                    strColValue = "";
                }
            }
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    /// <summary>
    /// This method will form XML for Gridview its is a extended method available for 
    /// all gridview.
    /// </summary>
    /// <param name="grvXml"></param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this GridView grvXml)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");

        foreach (GridViewRow grvRow in grvXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            for (intcolcount = 0; intcolcount < grvRow.Cells.Count; intcolcount++)
            {
                if (grvXml.Columns[intcolcount].HeaderText != "")
                {
                    strColValue = grvRow.Cells[intcolcount].Text;
                    if (strColValue == "")
                    {
                        if (grvRow.Cells[intcolcount].Controls.Count > 0)
                        {
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                            {
                                //strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text;
                                if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                {
                                    strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text;
                                }
                                else
                                {
                                    strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                                }
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                            {
                                strColValue = ((DropDownList)grvRow.Cells[intcolcount].Controls[1]).SelectedValue;
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                            {
                                strColValue = ((CheckBox)grvRow.Cells[intcolcount].Controls[1]).Checked == true ? "1" : "0";
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                            {
                                //strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text;
                                if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                {
                                    strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text;
                                }
                                else
                                {
                                    strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                                }
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "AjaxControlToolkit.AsyncFileUpload")
                            {
                                strColValue = ((AjaxControlToolkit.AsyncFileUpload)grvRow.Cells[intcolcount].Controls[1]).PostedFile.FileName;
                            }
                        }
                        if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                        {
                            if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                            {
                                strColValue = Utility_FA.StringToDate(strColValue).ToString();
                            }
                        }
                        if (strColValue.Trim() == "")
                        {
                            strColValue = string.Empty;
                        }
                    }
                    if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                    {
                        if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                        {
                            strColValue = Utility_FA.StringToDate(strColValue).ToString();
                        }
                    }
                    if (strColValue.Trim() == "")
                    {
                        strColValue = string.Empty;
                    }
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    strbXml.Append(grvXml.Columns[intcolcount].HeaderText.Replace(" ", "") + "='" + strColValue + "' ");
                }

            }
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    /// <summary>
    /// TO Form XML WIth Column as Uppercase
    /// </summary>
    /// <param name="grvXml"></param>
    /// <param name="IsNeedUpperCase">If its true then Alll colunm name will be in upper case</param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this GridView grvXml, bool IsNeedUpperCase)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");

        foreach (GridViewRow grvRow in grvXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            for (intcolcount = 0; intcolcount < grvRow.Cells.Count; intcolcount++)
            {
                if (grvXml.Columns[intcolcount].HeaderText != "")
                {
                    strColValue = grvRow.Cells[intcolcount].Text;
                    if (strColValue == "")
                    {
                        if (grvRow.Cells[intcolcount].Controls.Count > 0)
                        {
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                            {
                                if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                {
                                    strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text;
                                }
                                else
                                {
                                    strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                                }
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                            {
                                strColValue = ((DropDownList)grvRow.Cells[intcolcount].Controls[1]).SelectedValue;
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                            {
                                strColValue = ((CheckBox)grvRow.Cells[intcolcount].Controls[1]).Checked == true ? "1" : "0";
                            }
                            if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                            {
                                if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                {
                                    strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text;
                                }
                                else
                                {
                                    strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text.ToUpper();
                                }
                            }
                        }
                        if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                        {
                            if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                            {
                                strColValue = Utility_FA.StringToDate(strColValue).ToString();
                            }
                        }

                        if (strColValue.Trim() == "")
                        {
                            strColValue = string.Empty;
                        }
                    }
                    if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                    {
                        if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                        {
                            strColValue = Utility_FA.StringToDate(strColValue).ToString();
                        }
                    }
                    if (strColValue.Trim() == "")
                    {
                        strColValue = string.Empty;
                    }
                    // If Numeric BoundColumn has empty (SPACE &nbsp; value ) at the same time that field is a nullable column in DB 
                    // Avoid adding that column to XML to insert the null value
                    if (strColValue.Trim() == "&nbsp;")
                    {
                        continue;
                    }
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    if (IsNeedUpperCase)
                    {
                        strbXml.Append(grvXml.Columns[intcolcount].HeaderText.ToUpper().Replace(" ", "") + "='" + strColValue + "' ");
                    }
                    else
                    {
                        strbXml.Append(grvXml.Columns[intcolcount].HeaderText.ToLower().Replace(" ", "") + "='" + strColValue + "' ");
                    }
                }

            }
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    public static string FunPubFormXml_FA(this GridView grvXml, bool IsNeedUpperCase, bool blnOnlyEnabledRows)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");

        foreach (GridViewRow grvRow in grvXml.Rows)
        {

            if ((grvRow.Enabled && blnOnlyEnabledRows) || (!blnOnlyEnabledRows))
            {
                intcolcount = 0;
                strbXml.Append(" <Details ");
                for (intcolcount = 0; intcolcount < grvRow.Cells.Count; intcolcount++)
                {
                    if (grvXml.Columns[intcolcount].HeaderText != "")
                    {
                        strColValue = grvRow.Cells[intcolcount].Text;
                        if (strColValue == "")
                        {
                            if (grvRow.Cells[intcolcount].Controls.Count > 0)
                            {
                                if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                                {
                                    if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                    {
                                        strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text;
                                    }
                                    else
                                    {
                                        strColValue = ((TextBox)grvRow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                                    }
                                }
                                if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                                {
                                    strColValue = ((DropDownList)grvRow.Cells[intcolcount].Controls[1]).SelectedValue;
                                }
                                if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                                {
                                    strColValue = ((CheckBox)grvRow.Cells[intcolcount].Controls[1]).Checked == true ? "1" : "0";
                                }
                                if (grvRow.Cells[intcolcount].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                                {
                                    if (grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("REMARKS") || grvXml.Columns[intcolcount].HeaderText.ToUpper().Contains("NARRATION"))
                                    {
                                        strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text;
                                    }
                                    else
                                    {
                                        strColValue = ((Label)grvRow.Cells[intcolcount].Controls[1]).Text.Trim().ToUpper();
                                    }
                                }
                            }
                            if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                            {
                                if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                                {
                                    strColValue = Utility_FA.StringToDate(strColValue).ToString();
                                }
                            }

                            if (strColValue.Trim() == "")
                            {
                                strColValue = string.Empty;
                            }
                        }
                        if (grvXml.Columns[intcolcount].HeaderText.Contains("Date"))
                        {
                            if (strColValue.Trim() != "" && strColValue.Trim() != string.Empty)
                            {
                                strColValue = Utility_FA.StringToDate(strColValue).ToString();
                            }
                        }
                        if (strColValue.Trim() == "")
                        {
                            strColValue = string.Empty;
                        }
                        // If Numeric BoundColumn has empty (SPACE &nbsp; value ) at the same time that field is a nullable column in DB 
                        // Avoid adding that column to XML to insert the null value
                        if (strColValue.Trim() == "&nbsp;")
                        {
                            continue;
                        }
                        strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                        strColValue = strColValue.Replace("'", "\"");
                        if (IsNeedUpperCase)
                        {
                            strbXml.Append(grvXml.Columns[intcolcount].HeaderText.ToUpper().Replace(" ", "") + "='" + strColValue + "' ");
                        }
                        else
                        {
                            strbXml.Append(grvXml.Columns[intcolcount].HeaderText.ToLower().Replace(" ", "") + "='" + strColValue + "' ");
                        }
                    }
                }

                strbXml.Append(" /> ");
            }
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    /// <summary>
    /// This method will form XML for DataTable its is a extended method available for 
    /// all Datatable.
    /// </summary>
    /// <param name="DtXml"></param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this DataTable DtXml)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");
        foreach (DataRow grvRow in DtXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            foreach (DataColumn dtCols in DtXml.Columns)
            {
                strColValue = grvRow.ItemArray[intcolcount].ToString();
                strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                strColValue = strColValue.Replace("'", "\"");
                if (!string.IsNullOrEmpty(strColValue))
                {
                    if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                    {

                        if (dtCols.ColumnName.ToUpper().Contains("DATE"))
                        {
                            strbXml.Append(dtCols.ColumnName + "='" + StringToDate(strColValue).ToString() + "' ");
                        }
                        else
                        {
                            if (dtCols.ColumnName.ToUpper().Contains("REMARKS") || dtCols.ColumnName.ToUpper().Contains("NARRATION"))
                            {
                                strbXml.Append(dtCols.ColumnName + "='" + strColValue + "' ");
                            }
                            else
                            {
                                strbXml.Append(dtCols.ColumnName + "='" + strColValue.ToUpper() + "' ");
                            }
                        }

                    }
                }
                intcolcount++;
            }
            strColValue = "";
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    /// <summary>
    /// This method will form XML for DataTable its is a extended method available for 
    /// all Datatable.
    /// </summary>
    /// <param name="DtXml"></param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this DataTable DtXml, bool IsNeedUpperCase, bool IsNeedNullorEmptyColumn)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");
        foreach (DataRow grvRow in DtXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            if (!IsNeedNullorEmptyColumn)
            {
                foreach (DataColumn dtCols in DtXml.Columns)
                {
                    strColValue = grvRow.ItemArray[intcolcount].ToString();
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    if (!string.IsNullOrEmpty(strColValue))
                    {
                        if (IsNeedUpperCase)
                        {
                            if (dtCols.ColumnName.ToUpper().Contains("DATE") && !string.IsNullOrEmpty(strColValue))
                                strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + StringToDate(strColValue).ToString() + "' ");
                            else
                            {
                                if (dtCols.ColumnName.ToUpper().Contains("REMARKS") || dtCols.ColumnName.ToUpper().Contains("NARRATION"))
                                {
                                    strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + strColValue + "' ");
                                }
                                else
                                {
                                    strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + strColValue.ToUpper() + "' ");
                                }
                            }
                        }
                        else
                        {
                            if (dtCols.ColumnName.ToUpper().Contains("DATE") && !string.IsNullOrEmpty(strColValue))
                            {
                                strbXml.Append(dtCols.ColumnName.ToLower() + "='" + StringToDate(strColValue).ToString() + "' ");
                            }
                            else
                            {
                                if (dtCols.ColumnName.ToUpper().Contains("REMARKS") || dtCols.ColumnName.ToUpper().Contains("NARRATION"))
                                {
                                    strbXml.Append(dtCols.ColumnName.ToLower() + "='" + strColValue + "' ");
                                }
                                else
                                {
                                    strbXml.Append(dtCols.ColumnName.ToLower() + "='" + strColValue.ToUpper() + "' ");
                                }
                            }
                        }
                    }
                    intcolcount++;
                }
            }
            else
            {
                foreach (DataColumn dtCols in DtXml.Columns)
                {
                    strColValue = grvRow.ItemArray[intcolcount].ToString();
                    strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                    strColValue = strColValue.Replace("'", "\"");
                    if (IsNeedUpperCase)
                    {
                        if (dtCols.ColumnName.ToUpper().Contains("DATE") && !string.IsNullOrEmpty(strColValue))
                            strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + StringToDate(strColValue).ToString() + "' ");
                        else
                            strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + strColValue + "' ");
                    }
                    else
                    {
                        if (dtCols.ColumnName.ToUpper().Contains("DATE") && !string.IsNullOrEmpty(strColValue))
                            strbXml.Append(dtCols.ColumnName.ToLower() + "='" + StringToDate(strColValue).ToString() + "' ");
                        else
                            strbXml.Append(dtCols.ColumnName.ToLower() + "='" + strColValue + "' ");
                    }
                    intcolcount++;
                }
            }
            strColValue = "";
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="DtXml"></param>
    /// <param name="IsNeedUpperCase"></param>
    /// <returns></returns>
    public static string FunPubFormXml_FA(this DataTable DtXml, bool IsNeedUpperCase)
    {
        int intcolcount = 0;
        string strColValue = string.Empty;
        StringBuilder strbXml = new StringBuilder();
        strbXml.Append("<Root>");
        foreach (DataRow grvRow in DtXml.Rows)
        {
            intcolcount = 0;
            strbXml.Append(" <Details ");
            foreach (DataColumn dtCols in DtXml.Columns)
            {
                strColValue = grvRow.ItemArray[intcolcount].ToString();
                strColValue = strColValue.Replace("&", "").Replace("<", "").Replace(">", "");
                strColValue = strColValue.Replace("'", "\"");
                if (!string.IsNullOrEmpty(strColValue))
                {
                    if (grvRow.ItemArray[intcolcount].ToString() != "" || dtCols.ColumnName != string.Empty)
                    {
                        if (IsNeedUpperCase)
                        {
                            if (dtCols.ColumnName.ToUpper().Contains("DATE"))
                                strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + StringToDate(strColValue).ToString() + "' ");

                            else
                                strbXml.Append(dtCols.ColumnName.ToUpper() + "='" + strColValue + "' ");
                        }
                        else
                        {
                            if (dtCols.ColumnName.ToUpper().Contains("DATE"))

                                strbXml.Append(dtCols.ColumnName.ToLower() + "='" + StringToDate(strColValue).ToString() + "' ");

                            else
                                strbXml.Append(dtCols.ColumnName.ToLower() + "='" + strColValue + "' ");
                        }

                    }
                }
                intcolcount++;
            }
            strColValue = "";
            strbXml.Append(" /> ");
        }
        strbXml.Append("</Root>");
        return strbXml.ToString();
    }

    #endregion

    #region Method to export Grid To Excel,Word,TextFile
    public static void FunPubExportGrid_FA(this GridView Grv, string strFileName, enumFileType FileType)
    {
        try
        {
            string attachment = "";
            StringBuilder str = new StringBuilder();
            if (FileType == enumFileType.Excel)
            {
                attachment = "attachment; filename=" + strFileName + ".xls";
                //for (int i = 0; i <= Grv.Rows.Count - 1; i++)
                //{
                //    Grv.Rows[i].Cells[0].Attributes.Add("class", "text");

                //}
            }
            if (FileType == enumFileType.Word)
                attachment = "attachment; filename=" + strFileName + ".doc";
            if (FileType == enumFileType.FlatFile)
            {

                if (Grv.Caption != string.Empty)
                {
                    str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                    str.Append(System.Environment.NewLine);
                    str.Append("|" + Grv.Caption + "|");
                    str.Append(System.Environment.NewLine);
                }
                str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                str.Append(System.Environment.NewLine);
                for (int i = 0; i <= Grv.HeaderRow.Cells.Count - 1; i++)
                {
                    string strHeaderText = Grv.HeaderRow.Cells[i].Text;
                    if (strHeaderText == "")
                    {
                        strHeaderText = Grv.Columns[i].HeaderText;

                    }
                    //str.Append(strHeaderText);
                    if (strHeaderText.Contains("Amount"))
                        str.AppendFormat("{0,-10}", strHeaderText);
                    else
                        str.AppendFormat("{0,-20}", strHeaderText);
                    //str.Append("\t");
                }
                str.Append(System.Environment.NewLine);
                str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                str.Append(System.Environment.NewLine);
                for (int i = 0; i <= Grv.Rows.Count - 1; i++)
                {
                    GridViewRow grvRow = Grv.Rows[i];
                    string strColValue;
                    for (int j = 0; j <= grvRow.Cells.Count - 1; j++)
                    {
                        strColValue = grvRow.Cells[j].Text;
                        if (strColValue == "")
                        {
                            if (grvRow.Cells[j].Controls.Count > 0)
                            {
                                if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                                {
                                    strColValue = ((TextBox)grvRow.Cells[j].Controls[1]).Text;
                                }
                                if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                                {
                                    strColValue = ((DropDownList)grvRow.Cells[j].Controls[1]).SelectedValue;
                                }
                                if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                                {
                                    strColValue = ((CheckBox)grvRow.Cells[j].Controls[1]).Checked == true ? "1" : "0";
                                }
                                if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                                {
                                    strColValue = ((Label)grvRow.Cells[j].Controls[1]).Text;
                                }
                            }
                            if (strColValue.Trim() == "")
                            {
                                strColValue = string.Empty;
                            }
                        }
                        //str.Append(strColValue);
                        decimal decColValue; int intColValue;
                        if (decimal.TryParse(strColValue, out decColValue) || int.TryParse(strColValue, out intColValue))
                        {
                            str.AppendFormat("{0,8}", strColValue);
                        }
                        else
                        {
                            str.AppendFormat("{0,-20}", strColValue);
                        }
                        //str.Append("\t");
                    }
                    str.Append(System.Environment.NewLine);
                }

                attachment = "attachment; filename=" + strFileName + ".txt";
            }
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

            if (FileType == enumFileType.Excel)
                HttpContext.Current.Response.ContentType = "application/vnd.xls";
            if (FileType == enumFileType.Word)
                HttpContext.Current.Response.ContentType = "application/vnd.doc";
            if (FileType == enumFileType.FlatFile)
                HttpContext.Current.Response.ContentType = "application/vnd.text";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            //string strStyle = @"<style>.text { mso-number-format:\@; } </style>";

            if (FileType == enumFileType.FlatFile)
            {
                if (Grv.Rows.Count > 0)
                {

                    HttpContext.Current.Response.Write(str.ToString());
                }
            }

            else
            {
                if (Grv.Rows.Count > 0)
                {
                    Grv.RenderControl(htw);
                    // HttpContext.Current.Response.Write(strStyle);
                    HttpContext.Current.Response.Write(sw.ToString());

                }
            }
            HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Export the Grid");
        }
    }

    /// <summary>
    /// Only Demand spoolig report
    /// </summary>
    /// <param name="Grv"></param>
    /// <param name="strFileName"></param>
    /// <param name="FileType"></param>


    public static void FunPubExportGrid_DemandSpooling_FA(this GridView Grv, string strFileName, enumFileType FileType)
    {
        try
        {
            string attachment = "";
            StringBuilder str = new StringBuilder();
            if (FileType == enumFileType.Excel)
            {
                //attachment = "attachment; filename=" + strFileName + ".xls";

                #region For Excel
                str.Append("<table border='1' width='100%'>");

                if (Grv.Caption != string.Empty)
                {
                    //str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                    //str.Append(System.Environment.NewLine);
                    str.Append("<tr><td align='center' style=' font-weight:bold;' colspan='" + (Grv.HeaderRow.Cells.Count - 1).ToString() + "' >");
                    str.Append(Grv.Caption);
                    str.Append("</td></tr>");
                    //str.Append(System.Environment.NewLine);
                }
                //str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                //str.Append(System.Environment.NewLine);

                string strPreLine = "";
                for (int DtSpooli = 0; DtSpooli < Grv.Rows.Count; DtSpooli++)
                {
                    string strLine = "";
                    strLine = Grv.Rows[DtSpooli].Cells[0].Text;

                    if (strLine != strPreLine)
                    {
                        if (strLine != "")
                        {
                            str.Append("<tr><td align='center' colspan='" + (Grv.HeaderRow.Cells.Count - 1).ToString() + "' style=' font-weight:bold;'>");
                            str.Append("Line Of Business - " + strLine);
                            str.Append("</td></tr>");
                        }
                        str.Append(System.Environment.NewLine);
                        str.Append("<tr>");
                        for (int i = 0; i <= Grv.HeaderRow.Cells.Count - 1; i++)
                        {
                            string strHeaderText = Grv.HeaderRow.Cells[i].Text;
                            if (strHeaderText == "")
                            {
                                strHeaderText = Grv.Columns[i].HeaderText;
                            }

                            //str.Append(strHeaderText);
                            if (strHeaderText.ToUpper() != "LINE OF BUSINESS")
                            {
                                str.Append("<td align='center' style=' font-weight:bold;' >");
                                if (strHeaderText.Contains("Amount"))
                                    str.AppendFormat("{0,-10}", strHeaderText);
                                else
                                    str.AppendFormat("{0,-20}", strHeaderText);
                                str.Append("</td>");
                            }
                            //str.Append("\t");
                        }
                        str.Append("</tr>");
                        //str.Append(System.Environment.NewLine);
                        //str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                        //str.Append(System.Environment.NewLine);
                        for (int i = 0; i <= Grv.Rows.Count - 1; i++)
                        {
                            str.Append("<tr>");
                            GridViewRow grvRow = Grv.Rows[i];
                            string strColValue;
                            for (int j = 0; j <= grvRow.Cells.Count - 1; j++)
                            {
                                strColValue = grvRow.Cells[j].Text;

                                if (strColValue == "")
                                {
                                    if (grvRow.Cells[j].Controls.Count > 0)
                                    {
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                                        {
                                            strColValue = ((TextBox)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                                        {
                                            strColValue = ((DropDownList)grvRow.Cells[j].Controls[1]).SelectedValue;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                                        {
                                            strColValue = ((CheckBox)grvRow.Cells[j].Controls[1]).Checked == true ? "1" : "0";
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                                        {
                                            strColValue = ((Label)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                    }
                                    if (strColValue.Trim() == "")
                                    {
                                        strColValue = string.Empty;
                                    }
                                }
                                //str.Append(strColValue);
                                if (j != 0 && Grv.HeaderRow.Cells[j].Text.ToUpper() != "LINE OF BUSINESS")
                                {
                                    str.Append("<td>");
                                    decimal decColValue; int intColValue;
                                    if (decimal.TryParse(strColValue, out decColValue) || int.TryParse(strColValue, out intColValue))
                                    {
                                        str.AppendFormat("{0,8}", strColValue);
                                    }
                                    else
                                    {
                                        str.AppendFormat("{0,-20}", strColValue.Trim().Replace("&nbsp;", ""));
                                    }
                                    str.Append("</td>");
                                }

                                //str.Append("\t");
                            }
                            str.Append("</tr>");
                            //str.Append(System.Environment.NewLine);
                        }
                        strPreLine = strLine;
                        str.Append(System.Environment.NewLine);
                    }
                }
                str.Append("</table>");
                attachment = "attachment; filename=" + strFileName + ".xls";

                #endregion
            }
            if (FileType == enumFileType.Word)
                attachment = "attachment; filename=" + strFileName + ".doc";
            if (FileType == enumFileType.FlatFile)
            {
                if (Grv.Caption != string.Empty)
                {
                    str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                    str.Append(System.Environment.NewLine);
                    str.Append("|" + Grv.Caption + "|");
                    str.Append(System.Environment.NewLine);
                }
                str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                str.Append(System.Environment.NewLine);

                string strPreLine = "";
                for (int DtSpooli = 0; DtSpooli < Grv.Rows.Count; DtSpooli++)
                {
                    string strLine = "";
                    strLine = Grv.Rows[DtSpooli].Cells[0].Text;

                    if (strLine != strPreLine)
                    {
                        if (strLine != "")
                        {
                            str.Append(System.Environment.NewLine);
                            str.Append("Line Of Business - " + strLine);
                            str.Append(System.Environment.NewLine);
                        }
                        str.Append(System.Environment.NewLine);

                        for (int i = 0; i <= Grv.HeaderRow.Cells.Count - 1; i++)
                        {
                            string strHeaderText = Grv.HeaderRow.Cells[i].Text;
                            if (strHeaderText == "")
                            {
                                strHeaderText = Grv.Columns[i].HeaderText;

                            }
                            //str.Append(strHeaderText);
                            if (strHeaderText.ToUpper() != "LINE OF BUSINESS")
                            {
                                if (strHeaderText.Contains("Amount"))
                                    str.AppendFormat("{0,-10}", strHeaderText);
                                else
                                    str.AppendFormat("{0,-20}", strHeaderText);
                            }
                            //str.Append("\t");
                        }
                        str.Append(System.Environment.NewLine);
                        str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                        str.Append(System.Environment.NewLine);
                        for (int i = 0; i <= Grv.Rows.Count - 1; i++)
                        {
                            GridViewRow grvRow = Grv.Rows[i];
                            string strColValue;
                            for (int j = 0; j <= grvRow.Cells.Count - 1; j++)
                            {
                                strColValue = grvRow.Cells[j].Text;

                                if (strColValue == "")
                                {
                                    if (grvRow.Cells[j].Controls.Count > 0)
                                    {
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                                        {
                                            strColValue = ((TextBox)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                                        {
                                            strColValue = ((DropDownList)grvRow.Cells[j].Controls[1]).SelectedValue;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                                        {
                                            strColValue = ((CheckBox)grvRow.Cells[j].Controls[1]).Checked == true ? "1" : "0";
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                                        {
                                            strColValue = ((Label)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                    }
                                    if (strColValue.Trim() == "")
                                    {
                                        strColValue = string.Empty;
                                    }
                                }
                                //str.Append(strColValue);
                                if (j != 0 && Grv.HeaderRow.Cells[j].Text.ToUpper() != "LINE OF BUSINESS")
                                {
                                    decimal decColValue; int intColValue;
                                    if (decimal.TryParse(strColValue, out decColValue) || int.TryParse(strColValue, out intColValue))
                                    {
                                        str.AppendFormat("{0,8}", strColValue);
                                    }
                                    else
                                    {
                                        str.AppendFormat("{0,-20}", strColValue.Trim().Replace("&nbsp;", ""));
                                    }
                                }

                                //str.Append("\t");
                            }
                            str.Append(System.Environment.NewLine);
                        }
                        strPreLine = strLine;
                        str.Append(System.Environment.NewLine);
                    }
                }
                attachment = "attachment; filename=" + strFileName + ".txt";
            }
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);

            if (FileType == enumFileType.Excel)
                HttpContext.Current.Response.ContentType = "application/vnd.xls";
            if (FileType == enumFileType.Word)
                HttpContext.Current.Response.ContentType = "application/vnd.doc";
            if (FileType == enumFileType.FlatFile)
                HttpContext.Current.Response.ContentType = "application/vnd.text";

            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            //string strStyle = @"<style>.text { mso-number-format:\@; } </style>";

            if (FileType == enumFileType.FlatFile || FileType == enumFileType.Excel)
            {
                if (Grv.Rows.Count > 0)
                {

                    HttpContext.Current.Response.Write(str.ToString());
                }
            }

            else
            {
                if (Grv.Rows.Count > 0)
                {
                    Grv.RenderControl(htw);
                    // HttpContext.Current.Response.Write(strStyle);
                    HttpContext.Current.Response.Write(sw.ToString());

                }
            }
            HttpContext.Current.Response.End();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw new ApplicationException("Unable to Export the Grid");
        }
    }

    /// <summary>
    /// To save a file Only supports Flat File as of now
    /// </summary>
    /// <param name="Grv"></param>
    /// <param name="strFileName"></param>
    /// <param name="FileType"></param>
    /// <param name="blnSaveFile"></param>
    /// <param name="strPath"></param>
    public static void FunPubExportGrid_FA(this GridView Grv, string strFileName, enumFileType FileType, bool blnSaveFile, string strPath)
    {
        try
        {
            string attachment = "";
            StringBuilder str = new StringBuilder();
            if (FileType == enumFileType.Excel)
            {
                strFileName = strFileName + ".xls";
            }
            if (FileType == enumFileType.Word)
                strFileName = strFileName + ".doc";
            if (FileType == enumFileType.FlatFile)
            {

                if (Grv.Caption != string.Empty)
                {
                    str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                    str.Append(System.Environment.NewLine);
                    str.Append("|" + Grv.Caption + "|");
                    str.Append(System.Environment.NewLine);
                }
                str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                str.Append(System.Environment.NewLine);

                string strPreLine = "";
                for (int DtSpooli = 0; DtSpooli < Grv.Rows.Count; DtSpooli++)
                {
                    string strLine = "";
                    strLine = Grv.Rows[DtSpooli].Cells[0].Text.ToString();

                    if (strLine != strPreLine)
                    {
                        if (strLine != "")
                        {
                            str.Append(System.Environment.NewLine);
                            str.Append("Line Of Business - " + strLine);
                            str.Append(System.Environment.NewLine);
                        }

                        str.Append(System.Environment.NewLine);

                        for (int i = 0; i <= Grv.HeaderRow.Cells.Count - 1; i++)
                        {
                            string strHeaderText = Grv.HeaderRow.Cells[i].Text;
                            if (strHeaderText == "")
                            {
                                strHeaderText = Grv.Columns[i].HeaderText;
                            }
                            //str.Append(strHeaderText);
                            if (strHeaderText.ToUpper() != "LINE OF BUSINESS")
                            {
                                str.AppendFormat("{0,-20}", strHeaderText);
                            }
                        }
                        str.Append(System.Environment.NewLine);
                        str.Append("----------------------------------------------------------------------------------------------------------------------------------------------------------------");
                        str.Append(System.Environment.NewLine);
                        for (int i = 0; i <= Grv.Rows.Count - 1; i++)
                        {
                            GridViewRow grvRow = Grv.Rows[i];
                            string strColValue;
                            for (int j = 0; j <= grvRow.Cells.Count - 1; j++)
                            {
                                strColValue = grvRow.Cells[j].Text;
                                if (strColValue == "")
                                {
                                    if (grvRow.Cells[j].Controls.Count > 0)
                                    {
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.TextBox")
                                        {
                                            strColValue = ((TextBox)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.DropDownList")
                                        {
                                            strColValue = ((DropDownList)grvRow.Cells[j].Controls[1]).SelectedValue;
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.CheckBox")
                                        {
                                            strColValue = ((CheckBox)grvRow.Cells[j].Controls[1]).Checked == true ? "1" : "0";
                                        }
                                        if (grvRow.Cells[j].Controls[1].GetType().ToString() == "System.Web.UI.WebControls.Label")
                                        {
                                            strColValue = ((Label)grvRow.Cells[j].Controls[1]).Text;
                                        }
                                    }
                                    if (strColValue.Trim() == "")
                                    {
                                        strColValue = string.Empty;
                                    }
                                }
                                //str.Append(strColValue);
                                // str.Append("\t");
                                decimal decColValue; int intColValue;
                                if (j != 0 && Grv.HeaderRow.Cells[j].Text.ToUpper() != "LINE OF BUSINESS")
                                {
                                    if (decimal.TryParse(strColValue, out decColValue) || int.TryParse(strColValue, out intColValue))
                                    {
                                        str.AppendFormat("{0,10}", strColValue);
                                    }
                                    else
                                    {
                                        str.AppendFormat("{0,-20}", strColValue.Trim().Replace("&nbsp;", ""));
                                    }
                                }
                            }
                            str.Append(System.Environment.NewLine);
                        }
                    }
                    strPreLine = strLine;
                    str.Append(System.Environment.NewLine);
                }
            }


            if (blnSaveFile)
            {
                if (strPath != "")
                {
                    using (StreamWriter strWriter = new StreamWriter(strPath + @"\" + strFileName))
                    {
                        strWriter.Write(str.ToString());
                        strWriter.AutoFlush = true;
                        strWriter.Flush();
                        strWriter.Close();
                        strWriter.Dispose();

                    }
                    //StreamWriter strWriter = new StreamWriter(strPath + @"\" + strFileName);

                }
            }
            //else
            //{
            //    HttpContext.Current.Response.End();
            //}

        }
        catch (Exception ex)
        {
            if (!blnSaveFile)
            {
                FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
                throw new ApplicationException("Unable to Export the Grid");
            }
        }
    }
    #endregion


    #region Methods to Fill Financial year Dropdown
    public static void FillYears(this DropDownList ddlSourceControl, int intPreviousYears, int intNextYears)
    {
        try
        {
            ddlSourceControl.Items.Clear();
            System.Web.UI.WebControls.ListItem liSelect = null;
            int intCurrentYear = DateTime.Now.Year;
            int intCurrentMonth = DateTime.Now.Month;
            if (intCurrentMonth < 4)
            {
                intCurrentYear = intCurrentYear - 1;
            }
            int itemYear = 0;
            for (int intCount = intPreviousYears; intCount > 0; intCount--)
            {
                itemYear = intCurrentYear - intCount;
                liSelect = new System.Web.UI.WebControls.ListItem(itemYear.ToString(), itemYear.ToString());
                ddlSourceControl.Items.Add(liSelect);
            }
            liSelect = new System.Web.UI.WebControls.ListItem(intCurrentYear.ToString(), intCurrentYear.ToString());
            ddlSourceControl.Items.Add(liSelect);
            for (int intCount = 1; intCount <= intNextYears; intCount++)
            {
                itemYear = intCurrentYear + intCount;
                liSelect = new System.Web.UI.WebControls.ListItem(itemYear.ToString(), itemYear.ToString());
                ddlSourceControl.Items.Add(liSelect);
            }



        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
    }
    /// <summary>
    /// Extension method for ddls to load financial year
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void FillFinancialYears_FA(this DropDownList ddlSourceControl)
    {
        try
        {
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");

            ddlSourceControl.Items.Insert(0, liSelect);
            if (DateTime.Now.Month > 2)
            {
                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear - 1) + "-" + (intCurrentYear)), ((intCurrentYear - 1) + "-" + (intCurrentYear)));
                ddlSourceControl.Items.Insert(1, liPSelect);

                System.Web.UI.WebControls.ListItem liCSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear) + "-" + (intCurrentYear + 1)), ((intCurrentYear) + "-" + (intCurrentYear + 1)));
                ddlSourceControl.Items.Insert(2, liCSelect);

                System.Web.UI.WebControls.ListItem liNSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear + 1) + "-" + (intCurrentYear + 2)), ((intCurrentYear + 1) + "-" + (intCurrentYear + 2)));
                ddlSourceControl.Items.Insert(3, liNSelect);
            }
            else
            {

                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear - 2) + "-" + (intCurrentYear - 1)), ((intCurrentYear - 2) + "-" + (intCurrentYear - 1)));
                ddlSourceControl.Items.Insert(1, liPSelect);

                System.Web.UI.WebControls.ListItem liCSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear - 1) + "-" + (intCurrentYear)), ((intCurrentYear - 1) + "-" + (intCurrentYear)));
                ddlSourceControl.Items.Insert(2, liCSelect);

                System.Web.UI.WebControls.ListItem liNSelect = new System.Web.UI.WebControls.ListItem(((intCurrentYear) + "-" + (intCurrentYear + 1)), ((intCurrentYear) + "-" + (intCurrentYear + 1)));
                ddlSourceControl.Items.Insert(3, liNSelect);

            }

        }
        catch (Exception exp)
        {
            throw exp;
        }

    }
    /// <summary>
    /// extension method ro load financial month based on financial year and 
    /// start month defined in web config app setting as "StartMonth"
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strFinancialYear"></param>
    public static void FillFinancialMonth_FA(this DropDownList ddlSourceControl, string strFinancialYear)
    {
        try
        {
            ddlSourceControl.Items.Clear();
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
            string[] Years = strFinancialYear.Split('-');
            int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
            string strActualYear = Years[0].ToString();
            for (int intMonthCnt = 1; intMonthCnt <= 12; intMonthCnt++)
            {
                if (intActualMonth >= 13)
                {
                    intActualMonth = 1;
                    strActualYear = Years[1].ToString();
                }
                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem(strActualYear + intActualMonth.ToString("00"), strActualYear + intActualMonth.ToString("00"));
                ddlSourceControl.Items.Insert(intMonthCnt, liPSelect);
                intActualMonth = intActualMonth + 1;
            }





        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }


    //Added by M.saran on 26-August-2011.
    /// <summary>
    /// extension method ro load financial month based on financial year and 
    /// start month defined in web config app setting as "StartMonth"
    /// Includes Frequency Based Financial month.
    /// To load in dropdownList

    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strFinancialYear"></param>
    public static void FillFinancialMonth_FA(this DropDownList ddlSourceControl, string strFinancialYear, int Frequency_Type)
    {
        try
        {
            ddlSourceControl.Items.Clear();
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
            string[] Years = strFinancialYear.Split('-');
            int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
            string strActualYear = Years[0].ToString();
            int intMonthFCnt = 0;
            for (int intMonthCnt = 1; intMonthCnt <= 12; intMonthCnt++)
            {
                if (intActualMonth >= 13)
                {
                    intActualMonth = 1;
                    strActualYear = Years[1].ToString();
                }
                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem();
                switch (Frequency_Type)
                {
                    case 1:
                        intMonthFCnt++;
                        liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        break;
                    case 2:
                        if (intMonthCnt == 3 || intMonthCnt == 6 || intMonthCnt == 9 || intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        }
                        break;
                    case 3:
                        if (intMonthCnt == 6 || intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        }
                        break;
                    case 4:
                        if (intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strFinancialYear;
                        }
                        break;
                    default:
                        intMonthFCnt++;
                        liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        break;

                }
                if (liPSelect.Text != string.Empty)
                {
                    ddlSourceControl.Items.Insert(intMonthFCnt, liPSelect);
                }
                intActualMonth = intActualMonth + 1;
            }





        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }
    //Added by M.saran on 26-August-2011.
    /// <summary>
    /// extension method ro load financial month based on financial year and 
    /// start month defined in web config app setting as "StartMonth"
    /// Includes Frequency Based Financial month. 
    /// To load in Combo box
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strFinancialYear"></param>
    public static void FillFinancialMonth_FA(this ComboBox ddlSourceControl, string strFinancialYear, int Frequency_Type)
    {
        try
        {
            ddlSourceControl.Items.Clear();
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
            string[] Years = strFinancialYear.Split('-');
            int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
            string strActualYear = Years[0].ToString();
            int intMonthFCnt = 0;
            for (int intMonthCnt = 1; intMonthCnt <= 12; intMonthCnt++)
            {
                if (intActualMonth >= 13)
                {
                    intActualMonth = 1;
                    strActualYear = Years[1].ToString();
                }
                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem();
                switch (Frequency_Type)
                {
                    case 1:
                        intMonthFCnt++;
                        liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        break;
                    case 2:
                        if (intMonthCnt == 3 || intMonthCnt == 6 || intMonthCnt == 9 || intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        }
                        break;
                    case 3:
                        if (intMonthCnt == 6 || intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        }
                        break;
                    case 4:
                        if (intMonthCnt == 12)
                        {
                            intMonthFCnt++;
                            liPSelect.Value = liPSelect.Text = strFinancialYear;
                        }
                        break;
                    default:
                        intMonthFCnt++;
                        liPSelect.Value = liPSelect.Text = strActualYear + intActualMonth.ToString("00");
                        break;

                }
                if (liPSelect.Text != string.Empty)
                {
                    ddlSourceControl.Items.Insert(intMonthFCnt, liPSelect);
                }
                intActualMonth = intActualMonth + 1;
            }





        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    public static void FillFinancialMonth_FA(this ComboBox ddlSourceControl, string strFinancialYear)
    {
        try
        {
            ddlSourceControl.Items.Clear();
            int intCurrentYear = DateTime.Now.Year;
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
            string[] Years = strFinancialYear.Split('-');
            int intActualMonth = Convert.ToInt32(FAClsPubConfigReader.FunPubReadConfig("StartMonth"));
            string strActualYear = Years[0].ToString();
            for (int intMonthCnt = 1; intMonthCnt <= 12; intMonthCnt++)
            {
                if (intActualMonth >= 13)
                {
                    intActualMonth = 1;
                    strActualYear = Years[1].ToString();
                }
                System.Web.UI.WebControls.ListItem liPSelect = new System.Web.UI.WebControls.ListItem(strActualYear + intActualMonth.ToString("00"), strActualYear + intActualMonth.ToString("00"));
                ddlSourceControl.Items.Insert(intMonthCnt, liPSelect);
                intActualMonth = intActualMonth + 1;
            }





        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    #endregion

    #region set suffix for label
    /// <summary>
    /// This methode used in Set Suffix for Label
    /// </summary>
    public static string SetSuffix()
    {
        int suffix = 0;
        FASession ObjFASession = new FASession();
        suffix = ObjFASession.ProGpsSuffixRW;
        // suffix = 0;
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }

    public static string SetSuffix(int ControlSuffix)
    {
        int suffix = 0;
        FASession ObjFASession = new FASession();
        suffix = ObjFASession.ProGpsSuffixRW;
        // suffix = 0;
        if (suffix > ControlSuffix)
        {
            suffix = ControlSuffix;
        }
        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }

    #endregion

    public static string SetCurrencySuffix(int intCurr_ID)
    {
        int suffix = 1;
        FASession ObjSession = new FASession();
        suffix = ObjSession.ProGpsSuffixRW;

        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        UserInfo_FA ObjUserInfo_FA = new UserInfo_FA();
        Procparam.Add("@Company_Id", ObjUserInfo_FA.ProCompanyIdRW.ToString());
        if (intCurr_ID > 0)
        {
            Procparam.Add("@Currency_Id", intCurr_ID.ToString());
        }
        DataTable dt = new DataTable();
        dt = Utility_FA.GetDefaultData("FA_GET_CURR_DCMLS", Procparam);
        if (dt.Rows.Count > 0)
        {
            if (!string.IsNullOrEmpty(dt.Rows[0]["DecimalSuffix"].ToString()))
                suffix = Convert.ToInt16(dt.Rows[0]["DecimalSuffix"].ToString());
        }

        string strformat = "0.";
        for (int i = 1; i <= suffix; i++)
        {
            strformat += "0";
        }
        return strformat;
    }
    public static void BindComboBoxWithoutSelect_FA(this ComboBox cmbSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);

            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("ALL", "0");
            cmbSourceControl.Items.Insert(0, liSelect);
            //if (ObjDataTable != null)
            //{
            //    if (ObjDataTable.Rows.Count > 0)
            //    {
            //        System.Web.UI.WebControls.ListItem liALL = new System.Web.UI.WebControls.ListItem("ALL", "0");
            //        cmbSourceControl.Items.Insert(1, liALL);
            //    }
            //}
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }
    public static void BindDataTableWithALL_FA(this ComboBox cmbSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);

            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("ALL", "0");
            cmbSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    #region Method for Customer Address User Control

    /// <summary>
    /// 
    /// </summary>
    /// <param name="drCust"></param>
    /// <returns></returns>
    public static string SetCustomerAddress(DataRow drCust)
    {
        string strAddress = "";
        if (drCust["Comm_Address1"].ToString() != "") strAddress += drCust["Comm_Address1"].ToString() + System.Environment.NewLine;
        if (drCust["Comm_Address2"].ToString() != "") strAddress += drCust["Comm_Address2"].ToString() + System.Environment.NewLine;
        if (drCust["Comm_City"].ToString() != "") strAddress += drCust["Comm_City"].ToString() + System.Environment.NewLine;
        if (drCust["Comm_State"].ToString() != "") strAddress += drCust["Comm_State"].ToString() + System.Environment.NewLine;
        if (drCust["Comm_Country"].ToString() != "") strAddress += drCust["Comm_Country"].ToString() + System.Environment.NewLine;
        if (drCust["Comm_Pincode"].ToString() != "") strAddress += drCust["Comm_Pincode"].ToString();
        return strAddress;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="drCust"></param>
    /// <returns></returns>
    public static string SetVendorAddress(DataRow drCust)
    {
        string strAddress = "";
        if (Convert.ToString(drCust["Address"]) != "") strAddress += Convert.ToString(drCust["Address"]) + System.Environment.NewLine;
        if (Convert.ToString(drCust["Address2"]) != "") strAddress += Convert.ToString(drCust["Address2"]) + System.Environment.NewLine;
        if (Convert.ToString(drCust["City"]) != "") strAddress += Convert.ToString(drCust["City"]) + System.Environment.NewLine;
        if (Convert.ToString(drCust["State"]) != "") strAddress += Convert.ToString(drCust["State"]) + System.Environment.NewLine;
        if (Convert.ToString(drCust["Country"]) != "") strAddress += Convert.ToString(drCust["Country"]) + System.Environment.NewLine;
        if (Convert.ToString(drCust["Pincode"]) != "") strAddress += Convert.ToString(drCust["Pincode"]);
        return strAddress;
    }


    /// <summary>
    /// This methode used in SetCustomer Permanent Address in Textarea 
    /// </summary>
    #region SetCustomerPerAddress

    public static string SetCustomerPerAddress(DataRow drCust)
    {
        string strAddress = "";
        try
        {
            if (drCust["Perm_Address1"].ToString() != "") strAddress += drCust["Perm_Address1"].ToString() + System.Environment.NewLine;
            if (drCust["Perm_Address2"].ToString() != "") strAddress += drCust["Perm_Address2"].ToString() + System.Environment.NewLine;
            if (drCust["Perm_City"].ToString() != "") strAddress += drCust["Perm_City"].ToString() + System.Environment.NewLine;
            if (drCust["Perm_State"].ToString() != "") strAddress += drCust["Perm_State"].ToString() + System.Environment.NewLine;
            if (drCust["Perm_Country"].ToString() != "") strAddress += drCust["Perm_Country"].ToString() + System.Environment.NewLine;
            if (drCust["Perm_PINCode"].ToString() != "") strAddress += drCust["Perm_PINCode"].ToString();
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
        return strAddress;
    }
    #endregion

    #endregion

    #region Global Decimal Value and Prefix Sufix Set

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="IsZeroCheckReq"></param>
    public static void CheckGPSLength_FA(this TextBox txtBox, bool IsZeroCheckReq)
    {

        try
        {
            int intMaxLength;
            intMaxLength = txtBox.MaxLength;
            FASession FASession = new FASession();

            int intGPSLength = FASession.ProGpsPrefixRW;

            if (intGPSLength < intMaxLength)
            {
                txtBox.MaxLength = intGPSLength;
            }
            else
            {
                txtBox.MaxLength = intMaxLength == 0 ? intGPSLength : intMaxLength;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "ChkIsZero(this)");
            }

            txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(false,false,this)");

            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="strFieldName"></param>
    public static void CheckGPSLength_FA(this TextBox txtBox, bool IsZeroCheckReq, string strFieldName)
    {

        try
        {
            int intMaxLength;
            intMaxLength = txtBox.MaxLength;
            FASession FASession = new FASession();

            int intGPSLength = FASession.ProGpsPrefixRW;

            if (intGPSLength < intMaxLength)
            {
                txtBox.MaxLength = intGPSLength;
            }
            else
            {
                txtBox.MaxLength = intMaxLength == 0 ? intGPSLength : intMaxLength;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "ChkIsZero(this,'" + strFieldName + "')");
            }

            txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(false,false,this)");

            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="IsNegativeRequired"></param>
    public static void CheckGPSLength_FA(this TextBox txtBox, bool IsZeroCheckReq, bool IsNegativeRequired)
    {

        try
        {
            int intMaxLength;
            intMaxLength = txtBox.MaxLength;
            FASession FASession = new FASession();

            int intGPSLength = FASession.ProGpsPrefixRW;

            if (intGPSLength < intMaxLength)
            {
                txtBox.MaxLength = intGPSLength;
            }
            else
            {
                txtBox.MaxLength = intMaxLength == 0 ? intGPSLength : intMaxLength;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "ChkIsZero(this)");
            }
            if (IsNegativeRequired)
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(false,true,this)");
            }
            else
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(false,false,this)");
            }

            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    public static void SetDecimalPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (intSuffix > intGPSSuffix)
            {
                intSuffix = intGPSSuffix;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','undefined',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','undefined',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="strFieldName"></param>
    public static void SetDecimalPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, string strFieldName)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (intSuffix > intGPSSuffix)
            {
                intSuffix = intGPSSuffix;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", " return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    //Code Added by saran on 04-Jul-2012 for currency based decimals start 

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="strFieldName"></param>
    /// This method is used to set a decimal based on default currency or the given currency.
    public static void SetDecimalPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, string strFieldName, int Curr_Id)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }

            Procparam = new Dictionary<string, string>();
            UserInfo_FA objUserInfo_FA = new UserInfo_FA();
            Procparam.Add("@Company_Id", objUserInfo_FA.ProCompanyIdRW.ToString());
            if (Curr_Id != null)
            {
                if (Curr_Id > 0)
                {
                    Procparam.Add("@Currency_Id", Curr_Id.ToString());
                }
            }
            DataTable dt = new DataTable();
            dt = Utility_FA.GetDefaultData("FA_GET_CURR_DCMLS", Procparam);
            if (dt.Rows.Count > 0 && intSuffix == null)
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["DecimalSuffix"].ToString()))
                    intSuffix = Convert.ToInt16(dt.Rows[0]["DecimalSuffix"].ToString());
            }

            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", " return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    //Code Added by saran on 04-Jul-2012 for currency based decimals end 


    /// <summary>
    /// Created by Tamilselvan.S
    /// Created Date 10/02/2012
    /// For Prefix and Suffix based user need not for GPS based
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="strFieldName"></param>
    public static void SetPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, string strFieldName)
    {
        try
        {
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", " return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// Created by Tamilselvan.S 
    /// Created on 14/02/2011
    /// For Allowed only number with minus, plus and decimal
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="strFieldName"></param>
    public static void SetDecimalWithPlusMinPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, string strFieldName)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {
            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (intSuffix > intGPSSuffix)
            {
                intSuffix = intGPSSuffix;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "funChkDecimialWithPlusMin(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", "funChkDecimialWithPlusMin(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }
    /// <summary>
    /// To show alternative colors in the grid based on the selected coloum
    /// </summary>
    /// <param name="grdView"></param>
    /// <param name="strPANColName"></param>
    public static void GetAlternativeColorToGrid(GridView grdView, string strPANColName)
    {
        if (grdView.Rows.Count > 0)
        {
            Label PANum, strPANum;
            string strColor = "A";
            strPANum = (Label)grdView.Rows[0].FindControl(strPANColName);
            //grdView.Rows[0].BackColor = System.Drawing.Color.AliceBlue;
            grdView.Rows[0].CssClass = "gridRowBackColor_First";
            for (int i = 1; i < grdView.Rows.Count; i++)
            {
                PANum = (Label)grdView.Rows[i].FindControl(strPANColName);
                if (PANum.Text == strPANum.Text)
                {
                    //if (grdView.Rows[i - 1].BackColor == System.Drawing.Color.AliceBlue)
                    if (strColor == "A")
                    {
                        //grdView.Rows[i].BackColor = System.Drawing.Color.AliceBlue;
                        grdView.Rows[i].CssClass = "gridRowBackColor_First";
                    }
                    else
                    {
                        //grdView.Rows[i].BackColor = System.Drawing.Color.DeepPink;
                        grdView.Rows[i].CssClass = "gridRowBackColor_Second";
                        //strColor = "PostColor";
                    }
                }
                else
                {
                    //if (grdView.Rows[i - 1].BackColor == System.Drawing.Color.DeepPink)
                    if (strColor == "B")
                    {
                        if (strPANum.Text == ((Label)grdView.Rows[i - 1].FindControl(strPANColName)).Text)
                        {
                            //grdView.Rows[i].BackColor = System.Drawing.Color.AliceBlue;
                            grdView.Rows[i].CssClass = "gridRowBackColor_First";
                            strColor = "A";
                            strPANum = PANum;
                        }
                        else
                        {
                            //grdView.Rows[i].BackColor = System.Drawing.Color.DeepPink;
                            grdView.Rows[i].CssClass = "gridRowBackColor_Second";
                            //strColor = "PostColor";
                            strPANum = PANum;
                        }
                    }
                    else
                    {
                        //grdView.Rows[i].BackColor = System.Drawing.Color.DeepPink;
                        grdView.Rows[i].CssClass = "gridRowBackColor_Second";
                        strColor = "B";
                        strPANum = PANum;
                    }
                }
            }
        }

    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="IsNegativeRequired"></param>
    public static void SetDecimalPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, bool IsNegativeRequired)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (intSuffix > intGPSSuffix)
            {
                intSuffix = intGPSSuffix;
            }
            txtBox.MaxLength = intPrefix + intSuffix + 1;
            if (IsNegativeRequired)
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(true,true,this);");
            }
            else
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(true,false,this);");
            }

            txtBox.Attributes.Add("onkeyup", "funCutDecimal(this,'" + intSuffix + "')");
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','undefined',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','undefined',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="page"></param>
    /// <param name="strSourcePath"></param>
    /// <param name="strDestPath"></param>
    public static void saveFilePath(Page page, string strSourcePath, string strDestPath)
    {
        try
        {
            string path = strDestPath;
            strDestPath = strDestPath + Path.GetFileName(strSourcePath);

            if (strSourcePath == null || strDestPath == null)
            {
                //MessageBox.Show("source or destination path is missing");
                Utility_FA.FunShowAlertMsg_FA(page, "Source or Destination path is missing");
                return;
            }
            else
            {
                if (File.Exists(strSourcePath) == true)
                {
                    if (Directory.Exists(strSourcePath) == true)
                    {
                        if (File.Exists(strDestPath) == true)
                        {
                            File.Delete(strDestPath);
                            File.Copy(strSourcePath, strDestPath);
                            //MessageBox.Show("file replaced");
                        }
                        else
                        {

                            File.Copy(strSourcePath, strDestPath);
                            Utility_FA.FunShowAlertMsg_FA(page, "file saved");
                        }
                    }
                    else
                    {
                        File.Copy(strSourcePath, strDestPath);
                        if (Directory.Exists(path) == true)
                        {
                            //MessageBox.Show("file created and data copied");
                            Utility_FA.FunShowAlertMsg_FA(page, "file created and data copied");
                        }
                        else
                        {
                            //MessageBox.Show("Invalid path for destination");
                            //return "Invalid path for destination";
                            Utility_FA.FunShowAlertMsg_FA(page, "Invalid path for destination");
                            return;
                        }
                    }
                }
                else
                {
                    //MessageBox.Show("source file not exists");                
                    Utility_FA.FunShowAlertMsg_FA(page, "source file not exists");
                    return;
                }
            }
        }
        catch (Exception ex)
        {
            Utility_FA.FunShowAlertMsg_FA(page, ex.Message);
            return;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="txtBox"></param>
    /// <param name="intPrefix"></param>
    /// <param name="intSuffix"></param>
    /// <param name="IsZeroCheckReq"></param>
    /// <param name="IsNegativeRequired"></param>
    /// <param name="strFieldName"></param>
    public static void SetDecimalPrefixSuffix_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, bool IsNegativeRequired, string strFieldName)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (intSuffix > intGPSSuffix)
            {
                intSuffix = intGPSSuffix;
            }
            txtBox.MaxLength = intPrefix + intSuffix + 1;
            if (IsNegativeRequired)
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(true,true,this);");
            }
            else
            {
                txtBox.Attributes.Add("onkeypress", "fnAllowNumbersOnly(true,false,this);");
            }
            txtBox.Attributes.Add("onkeyup", "funCutDecimal(this,'" + intSuffix + "')");
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", "funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }

    }

    #endregion


    #region Common Method fo Mail
    /*
    public static void FunPubSentMail(Dictionary<string, string> dictMail, ArrayList arrMailAttachement, StringBuilder strBody)
    {
        if (dictMail["ToMail"].Trim() != "")
        {
            CommonMailServiceReference.CommonMailClient ObjCommonMail = new CommonMailServiceReference.CommonMailClient();
            try
            {
                ClsPubCOM_Mail ObjCom_Mail = new ClsPubCOM_Mail();
                ObjCom_Mail.ProFromRW = dictMail["FromMail"];
                ObjCom_Mail.ProTORW = dictMail["ToMail"];
                ObjCom_Mail.ProSubjectRW = dictMail["Subject"];
                ObjCom_Mail.ProMessageRW = strBody.ToString();// dictMail["Body"];
                if (dictMail.ContainsKey("ToCC") && dictMail["ToCC"].ToString() != "") ObjCom_Mail.ProCCRW = dictMail["ToCC"];
                if (dictMail.ContainsKey("ToBCC") && dictMail["ToBCC"].ToString() != "") ObjCom_Mail.ProBCCRW = dictMail["ToBCC"];
                if (arrMailAttachement != null && arrMailAttachement.Count > 0) ObjCom_Mail.ProFileAttachementRW = arrMailAttachement;
                ObjCommonMail.FunSendMail(ObjCom_Mail);
            }
            catch (System.ServiceModel.FaultException<CommonMailServiceReference.ClsPubFaultException> ex)
            {
                //if (ObjCommonMail != null)
                //    ObjCommonMail.Close();
                //FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            catch (Exception ex)
            {
                //if (ObjCommonMail != null)
                //    ObjCommonMail.Close();
                //FAClsPubCommErrorLog.CustomErrorRoutine(ex);
                throw ex;
            }
            finally
            {
                if (ObjCommonMail != null)
                    ObjCommonMail.Close();
            }
        }
    }
    */
    #endregion


    #region BindDataTable_FA For Drop Down and Combo
    /// <summary>
    /// Added By R.MANIKANDAN
    /// Extension method to bind a dropdown list
    /// also adds select by default at 0th index
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this DropDownList ddlSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {

            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);
            if (ObjDataTable == null)
                return;
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();

            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField);

            ddlSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    ddlSourceControl.DataValueField = strBinidArgs[0].ToString();
                    ddlSourceControl.DataTextField = "DataText";
                    ddlSourceControl.DataSource = ObjDataTable;
                    ddlSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    public static void BindDataTable_FA(this DropDownList ddlSourceControl, DataTable dtDropDownValues)
    {
        string strDataTextField;

        try
        {
            ddlSourceControl.Items.Clear();
            if (dtDropDownValues != null)
            {
                if (dtDropDownValues.Rows.Count > 0)
                {
                    ddlSourceControl.DataValueField = dtDropDownValues.Columns[0].ColumnName;
                    ddlSourceControl.DataTextField = dtDropDownValues.Columns[1].ColumnName;
                    ddlSourceControl.DataSource = dtDropDownValues;
                    ddlSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }
    }
    /// <summary>
    ///Extension method to bind a dropdown list
    /// also adds the select at 0th index if the blnIsSelectReq is true
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="blnIsSelectReq"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this DropDownList ddlSourceControl, string strProcName, Dictionary<string, string> dictProcParam, bool blnIsSelectReq, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {

            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField);

            ddlSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    ddlSourceControl.DataValueField = strBinidArgs[0].ToString();
                    ddlSourceControl.DataTextField = "DataText";
                    ddlSourceControl.DataSource = ObjDataTable;
                    ddlSourceControl.DataBind();
                }
            }
            if (blnIsSelectReq)
            {
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
                ddlSourceControl.Items.Insert(0, liSelect);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    /// <summary>
    /// Extension method to bind a dropdown list
    /// also adds given text by default at 0th index
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="blnIsSelectReq"></param>
    /// <param name="strDefaultSelect">Text to be dispalyed in 0th Index</param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this DropDownList ddlSourceControl, string strProcName, Dictionary<string, string> dictProcParam, bool blnIsSelectReq, string strDefaultSelect, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {

            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField);

            ddlSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    ddlSourceControl.DataValueField = strBinidArgs[0].ToString();
                    ddlSourceControl.DataTextField = "DataText";
                    ddlSourceControl.DataSource = ObjDataTable;
                    ddlSourceControl.DataBind();
                }
            }
            if (blnIsSelectReq)
            {
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--" + strDefaultSelect + "--", "0");
                ddlSourceControl.Items.Insert(0, liSelect);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    /// <summary>
    /// Extension method to bind a Ajax combo list
    /// also adds select by default at 0th index
    /// </summary>
    /// <param name="cmbSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this ComboBox cmbSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);

            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            cmbSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    public static void BindDataTable_FA(this DropDownList ddlSourceControl, DataTable ObjDataTable, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            ddlSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    ddlSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    ddlSourceControl.DataTextField = "DataText";
                    ddlSourceControl.DataSource = ObjDataTable;
                    ddlSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            ddlSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    /// <summary>
    /// Extension method to bind a Ajax combo list
    /// also adds required text sent as strSelectValue at 0th index
    /// if blnIsSelectReq is true
    /// </summary>
    /// <param name="cmbSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="blnIsSelectReq"></param>
    /// <param name="strSelectValue"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this ComboBox cmbSourceControl, string strProcName, Dictionary<string, string> dictProcParam, bool blnIsSelectReq, string strSelectValue, params string[] strBinidArgs)
    {
        string strDataTextField;
        try
        {
            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            if (blnIsSelectReq)
            {
                System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem(strSelectValue, "0");
                cmbSourceControl.Items.Insert(0, liSelect);
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    public static void BindDataTable_FA(this ComboBox cmbSourceControl, DataTable ObjDataTable, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "0");
            cmbSourceControl.Items.Insert(0, liSelect);
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }
    #endregion

    #region [BindDataTable_FA For Rabio button List]
    /// <summary>
    /// Added By S.Tamilselvan
    /// Extension method to bind a Radio button list
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this RadioButtonList rblSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {

            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);
            if (ObjDataTable == null)
                return;
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();

            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField);

            rblSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    rblSourceControl.DataValueField = strBinidArgs[0].ToString();
                    rblSourceControl.DataTextField = "DataText";
                    rblSourceControl.DataSource = ObjDataTable;
                    rblSourceControl.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    /// <summary>
    /// Added By S.Tamilselvan
    /// Extension method to bind a Radio button list
    /// Date 14/03/2012 
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    /// <param name="ObjDataTable"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindDataTable_FA(this RadioButtonList rblSourceControl, DataTable ObjDataTable, params string[] strBinidArgs)
    {
        string strDataTextField;
        try
        {
            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            rblSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    rblSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    rblSourceControl.DataTextField = "DataText";
                    rblSourceControl.DataSource = ObjDataTable;
                    rblSourceControl.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    #endregion [BindDataTable_FA For Rabio button List]

    public static string FunPubSetCommaSeperator(string DecValue, string strCurrencyCode)
    {
        string Strvalue = "";
        string Strrevvalue = "";
        if (!string.IsNullOrEmpty(DecValue))
        {
            switch (strCurrencyCode.ToUpper().Trim())
            {
                case "INR"://Indian Currency
                    Strvalue = string.Format(System.Globalization.CultureInfo.GetCultureInfo("hi-IN").NumberFormat,
                    "{0:c}", Convert.ToDecimal(DecValue)).Split(' ')[1].ToString();
                    break;
                default://Us,Uk,Ero etc Currency
                    Strvalue = string.Format(System.Globalization.CultureInfo.GetCultureInfo("en-us").NumberFormat,
                    "{0:c}", Convert.ToDecimal(DecValue)).Substring(1).Trim();
                    break;
            }

        }

        return Strvalue;

    }


    #region To Excute a Stored Procedure and Return datatable
    /// <summary>
    /// Method will return a datatable by passing procedure name and 
    /// parameters as dictionary
    /// </summary>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <returns></returns>
    public static DataTable GetDefaultData(string strProcName, Dictionary<string, string> dictProcParam)
    {
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        DataTable ObjDataTable = null;
        FASession ObjFASession = new FASession();
        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            byte[] byteRoleDetails = ObjAdminService.FunPubFillDropdown(strProcName, ObjFASession.ProConnectionName, dictProcParam);
            if (byteRoleDetails != null)
                ObjDataTable = (DataTable)FAClsPubSerialize.DeSerialize(byteRoleDetails, FASerializationMode.Binary, typeof(DataTable));

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
        return ObjDataTable;
    }


    public static DataTable GetDefaultData(string strProcName, Dictionary<string, string> dictProcParam, string strXMLKey, string strXMLParm)
    {
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        DataTable ObjDataTable = null;
        FASession ObjFASession = new FASession();
        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            byte[] byteRoleDetails = ObjAdminService.FunPubFillDropdownXML(strProcName, ObjFASession.ProConnectionName, dictProcParam, strXMLKey, strXMLParm);
            if (byteRoleDetails != null)
                ObjDataTable = (DataTable)FAClsPubSerialize.DeSerialize(byteRoleDetails, FASerializationMode.Binary, typeof(DataTable));

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
        return ObjDataTable;
    }

    #endregion

    #region To Excecute a Stored Procedure and Return a dataset
    /// <summary>
    /// Method will return a dataset by passing procedure name and 
    /// parameters as dictionary
    /// </summary>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <returns></returns>
    public static DataSet GetDataset(string strProcName, Dictionary<string, string> dictProcParam)
    {
        FAAdminServiceReference.FAAdminServicesClient ObjAdminService = null;
        DataSet ObjDataset = null;
        FASession ObjFASession = new FASession();

        try
        {
            ObjAdminService = new FAAdminServiceReference.FAAdminServicesClient();
            byte[] byteDataset = ObjAdminService.FunPubFillDataset(strProcName, ObjFASession.ProConnectionName, dictProcParam);
            ObjDataset = (DataSet)FAClsPubSerialize.DeSerialize(byteDataset, FASerializationMode.Binary, typeof(DataSet));

        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            ObjAdminService.Close();
        }
        return ObjDataset;
    }
    #endregion

    #region To set selected item text as tooltip in Dropdown
    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 23/09/2011
    /// Purpose      : For adding Dropdown list tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipValue_FA(this DropDownList ddlSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in ddlSourceControl.Items)
        {
            li.Attributes.Add("title", li.Value.ToString());
        }
        if (ddlSourceControl.Items.Count > 0)
            ddlSourceControl.ToolTip = ddlSourceControl.SelectedItem.Value;
    }

    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 23/09/2011
    /// Purpose      : For adding Dropdown list tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipValue_FA(this ComboBox cbSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in cbSourceControl.Items)
        {
            li.Attributes.Add("title", li.Value.ToString());
        }
        if (cbSourceControl.Items.Count > 0)
            cbSourceControl.ToolTip = cbSourceControl.SelectedItem.Value;
    }

    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 15/02/2012
    /// Purpose      : For adding Dropdown list tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipText_FA(this DropDownList ddlSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in ddlSourceControl.Items)
        {
            li.Attributes.Add("title", li.Text.ToString());
        }
        if (ddlSourceControl.Items.Count > 0)
            ddlSourceControl.ToolTip = ddlSourceControl.SelectedItem.Text;
    }

    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 15/02/2012
    /// Purpose      : For adding Dropdown list tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipText_FA(this ComboBox cbSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in cbSourceControl.Items)
        {
            li.Attributes.Add("title", li.Text.ToString());
        }
        if (cbSourceControl.Items.Count > 0)
            cbSourceControl.ToolTip = cbSourceControl.SelectedItem.Text;
    }

    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 23/09/2011
    /// Purpose      : For adding Radio Button List tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipValue_FA(this RadioButtonList rblSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in rblSourceControl.Items)
        {
            li.Attributes.Add("title", li.Value.ToString());
        }
    }

    /// <summary>
    /// Created by   : Tamilselvan.S
    /// Craeted Date : 15/02/2012
    /// Purpose      : For adding Radio Button List tooptip for all values.
    /// </summary>
    /// <param name="ddlSourceControl"></param>
    public static void AddItemToolTipText_FA(this RadioButtonList rblSourceControl)
    {
        foreach (System.Web.UI.WebControls.ListItem li in rblSourceControl.Items)
        {
            li.Attributes.Add("title", li.Text.ToString());
        }
    }

    #endregion

    /// <summary>
    /// Created by Tamiselvan.S
    /// Created Date 06/02/2012
    /// This is to return the program master details - which can be reterived using the program code  
    /// </summary>
    /// <param name="strProgramCode"></param>
    /// <param name="strCompany_ID"></param>
    /// <returns></returns>
    public static DataTable FunGetProgramDetailsByProgramCode(string strProgramCode, string strCompany_ID)
    {
        Dictionary<string, string> dictProcParam = new Dictionary<string, string>();
        dictProcParam.Add("@Program_Code", strProgramCode);
        dictProcParam.Add("@Company_ID", strCompany_ID);
        return GetDefaultData((SPNames.Get_Program_RefNo), dictProcParam);
    }

    #region [Linq Process]

    /// <summary>
    /// Created By Tamilselvan.S
    /// Created Date 16/03/2012
    /// To convert the Linq var data to Datatable data
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="varlist"></param>
    /// <returns></returns>
    public static DataTable LINQToDataTable<T>(IEnumerable<T> varlist)
    {
        DataTable dtReturn = new DataTable();
        // column names 
        PropertyInfo[] oProps = null;
        if (varlist == null) return dtReturn;
        foreach (T rec in varlist)
        {
            // Use reflection to get property names, to create table, Only first time, others      will follow 
            if (oProps == null)
            {
                oProps = ((Type)rec.GetType()).GetProperties();
                foreach (PropertyInfo pi in oProps)
                {
                    Type colType = pi.PropertyType;

                    if ((colType.IsGenericType) && (colType.GetGenericTypeDefinition() == typeof(Nullable<>)))
                    {
                        colType = colType.GetGenericArguments()[0];
                    }
                    dtReturn.Columns.Add(new DataColumn(pi.Name, colType));
                }
            }
            DataRow dr = dtReturn.NewRow();
            foreach (PropertyInfo pi in oProps)
            {
                dr[pi.Name] = pi.GetValue(rec, null) == null ? DBNull.Value : pi.GetValue(rec, null);
            }
            dtReturn.Rows.Add(dr);
        }
        return dtReturn;
    }

    #endregion [Linq Process]

    #region For Reports Combobox Fill with ALL option

    /// <summary>
    /// Extension method to bind a Ajax combo list
    /// also adds select by default at -1th index
    /// and ALL at 0th Index
    /// </summary>
    /// <param name="cmbSourceControl"></param>
    /// <param name="strProcName"></param>
    /// <param name="dictProcParam"></param>
    /// <param name="strBinidArgs"></param>
    public static void BindComboBoxWithALL_FA(this ComboBox cmbSourceControl, string strProcName, Dictionary<string, string> dictProcParam, params string[] strBinidArgs)
    {
        string strDataTextField;

        try
        {
            DataTable ObjDataTable = GetDefaultData(strProcName, dictProcParam);

            if (strBinidArgs.Length > 2)
            {
                if (strBinidArgs[1].ToString().Trim().ToUpper() == "LOCATION_CODE")
                    strDataTextField = strBinidArgs[2].ToString().Trim();
                else
                    strDataTextField = strBinidArgs[1].ToString().Trim() + "+'  -  '+" + strBinidArgs[2].ToString().Trim();
            }
            else
            {
                strDataTextField = strBinidArgs[1].ToString().Trim();
            }

            ObjDataTable.Columns.Add("DataText", typeof(string), strDataTextField.Trim());

            cmbSourceControl.Items.Clear();
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    cmbSourceControl.DataValueField = strBinidArgs[0].ToString().Trim();
                    cmbSourceControl.DataTextField = "DataText";
                    cmbSourceControl.DataSource = ObjDataTable;
                    cmbSourceControl.DataBind();
                }
            }
            System.Web.UI.WebControls.ListItem liSelect = new System.Web.UI.WebControls.ListItem("--Select--", "-1");
            cmbSourceControl.Items.Insert(0, liSelect);
            if (ObjDataTable != null)
            {
                if (ObjDataTable.Rows.Count > 0)
                {
                    System.Web.UI.WebControls.ListItem liALL = new System.Web.UI.WebControls.ListItem("ALL", "0");
                    cmbSourceControl.Items.Insert(1, liALL);
                }
            }
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLog.CustomErrorRoutine(ex);
            throw ex;
        }
        finally
        {
            //ObjAdminService.Close();
        }

    }

    #endregion

    #region [To check DIM availability for Transactions]
    public static bool FunPubDIM_Available(string strCompany_ID, string strConnectionName)
    {
        FAAdminServiceReference.FAAdminServicesClient objAdminServices = new FAAdminServiceReference.FAAdminServicesClient();
        try
        {
            Dictionary<string, string> Procparam = new Dictionary<string, string>();
            Procparam.Add("@Company_ID", strCompany_ID);
            // Modified By Chandrasekar K On 02/Nov/2012
            //if (!Convert.ToBoolean(objAdminServices.FunGetScalarValue("FA_DIM_Available", strConnectionName, Procparam)))
            //    return false;
            DataTable dtDIM_Available = new DataTable();
            dtDIM_Available = Utility_FA.GetDefaultData("FA_DIM_Available", Procparam);
            if (!Convert.ToBoolean(dtDIM_Available.Rows[0][0].ToString()))
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (objAdminServices != null)
                objAdminServices.Close();
        }
        return true;
    }

    #endregion

    #region To check Budget validation
    public static string FunPubBudgetValidation(Dictionary<string, string> dictProcParam)
    {
        string strMsg = "";
        try
        {
            DataTable dt = Utility_FA.GetDefaultData("FA_Budget_Validation", dictProcParam);
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {

                    if (!string.IsNullOrEmpty(dt.Rows[0]["Budget_Not"].ToString()))
                        strMsg = "Budget Not Defined For the Following Accounts :" + dt.Rows[0]["Budget_Not"].ToString();
                    if (!string.IsNullOrEmpty(dt.Rows[0]["Budget_Exceed"].ToString()))
                        strMsg = "\\nBudget Exceeds the Limit For the Following Accounts : " + dt.Rows[0]["Budget_Exceed"].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return strMsg;
    }

    #endregion


    //#region Common Method fo Mail
    //public static void FunPubSentMail(Dictionary<string, string> dictMail, ArrayList arrMailAttachement, StringBuilder strBody)
    //{
    //    if (dictMail["ToMail"].Trim() != "")
    //    {

    //        CommonMailServiceReference.CommonMailClient ObjCommonMail = new CommonMailServiceReference.CommonMailClient();
    //        try
    //        {
    //            ClsPubCommMail ObjCom_Mail = new ClsPubCommMail();
    //            ObjCom_Mail.ProFromRW = dictMail["FromMail"];
    //            ObjCom_Mail.ProTORW = dictMail["ToMail"];
    //            ObjCom_Mail.ProSubjectRW = dictMail["Subject"];
    //            ObjCom_Mail.ProMessageRW = strBody.ToString();// dictMail["Body"];
    //            if (dictMail.ContainsKey("ToCC") && dictMail["ToCC"].ToString() != "")
    //                ObjCom_Mail.ProCCRW = dictMail["ToCC"];
    //            if (dictMail.ContainsKey("ToBCC") && dictMail["ToBCC"].ToString() != "")
    //                ObjCom_Mail.ProBCCRW = dictMail["ToBCC"];
    //            if (arrMailAttachement != null && arrMailAttachement.Count > 0)
    //                ObjCom_Mail.ProFileAttachementRW = arrMailAttachement;
    //            ObjCommonMail.FunSendMail(ObjCom_Mail);
    //        }
    //        catch (System.ServiceModel.FaultException<CommonMailServiceReference.ClsPubFaultException> ex)
    //        {
    //            //if (ObjCommonMail != null)
    //            //    ObjCommonMail.Close();
    //            //FAClsPubCommErrorLog.CustomErrorRoutine(ex);
    //            throw ex;
    //        }
    //        catch (Exception ex)
    //        {
    //            //if (ObjCommonMail != null)
    //            //    ObjCommonMail.Close();
    //            //FAClsPubCommErrorLog.CustomErrorRoutine(ex);
    //            throw ex;
    //        }
    //        finally
    //        {
    //            if (ObjCommonMail != null)
    //                ObjCommonMail.Close();
    //        }
    //    }
    //}
    //#endregion


    public static void SetDecimalPrefixSuffixCustom_FA(this TextBox txtBox, int intPrefix, int intSuffix, bool IsZeroCheckReq, string strFieldName)
    {
        DataTable dtTable = new DataTable();
        Dictionary<string, string> Procparam = new Dictionary<string, string>();
        try
        {

            int intGPSPrefix = 0;
            int intGPSSuffix = 0;
            FASession FASession = new FASession();
            intGPSPrefix = FASession.ProGpsPrefixRW;
            intGPSSuffix = FASession.ProGpsSuffixRW;

            if (intPrefix > intGPSPrefix)
            {
                intPrefix = intGPSPrefix;
            }
            if (IsZeroCheckReq)
            {
                txtBox.Attributes.Add("onblur", "return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',true);");
            }
            else
            {
                txtBox.Attributes.Add("onblur", " return funChkDecimial(this,'" + intPrefix.ToString() + "','" + intSuffix.ToString() + "','" + strFieldName + "',false);");
            }
            txtBox.Style.Add("text-align", "right");
            txtBox.Attributes.Add("onpaste", "return false;");
        }
        catch (Exception ex)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(ex);
            throw ex;
        }

    }


    //HTML Control Extended Property//Added by Sathish R 29-Aug-2018
    public static void Enabled_True_FA(this System.Web.UI.HtmlControls.HtmlButton btn)
    {
        btn.Attributes.Remove("disabled");
        btn.Attributes.Add("class", "css_btn_enabled");  // enab
    }
    public static void Enabled_False_FA(this System.Web.UI.HtmlControls.HtmlButton btn)
    {
        btn.Attributes.Add("disabled", "disabled");
        btn.Attributes.Add("class", "css_btn_disabled");  // enab
    }

    public static DataTable UserAccess(int? LOBID, int? Location_ID, int User_Id, int Program_ID, int intCompanyID)
    {
        DataTable dtUserData = new DataTable();
        try
        {
            Dictionary<string, string> dictProcParam = new Dictionary<string, string>();
            dictProcParam.Add("@Company_ID", Convert.ToString(intCompanyID));
            if (LOBID != null && LOBID > 0)
                dictProcParam.Add("@LOB_ID", Convert.ToString(LOBID));
            if (Location_ID != null && Location_ID > 0)
                dictProcParam.Add("@Location_ID", Convert.ToString(Location_ID));
            dictProcParam.Add("@User_ID", Convert.ToString(User_Id));
            dictProcParam.Add("@Program_ID", Convert.ToString(Program_ID));
            dtUserData = GetDefaultData("FA_SYSAD_GET_USERACCESS", dictProcParam);
        }
        catch (Exception objException)
        {
            FAClsPubCommErrorLogDB.CustomErrorRoutine(objException);
        }
        return dtUserData;
    }


   


}


public enum enumInterestType
{
    Daily = 1,
    Fortnightly = 2,
    Monthly = 3,
    Bi_Monthly = 4,
    Quarterly = 5,
    Half_Yearly = 6,
    Annually = 7
}

//Code end


