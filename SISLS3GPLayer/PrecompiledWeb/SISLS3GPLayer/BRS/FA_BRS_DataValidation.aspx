<%@ page title="" language="C#" masterpagefile="~/Common/FAMasterPageCollapse.master" autoeventwireup="true" inherits="BRS_FA_BRS_DataValidation, App_Web_kopy3kxt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript" language="javascript">

        function fnDoDate1(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation, IsToDate) {
            var s = el.value;
            var d, m, y;
            var erString = 'Enter the valid date format (' + eFormat + ')';
            var len = s.length;
            var DtConvDate;
            if (eFormat == 'MM/dd/yyyy' || eFormat == 'MM-dd-yyyy') {
                //alert('Front mm');
                if (10 == len) {
                    d = s.substring(3, 5);
                    m = s.substring(0, 2);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(2, 4);
                    m = s.substring(0, 2);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(3, 6);
                    m = s.substring(0, 2);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';
                }
            }
            else {
                //alert('Front dd');
                if (10 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 5);
                    y = s.substring(6, 10);
                }
                else if (8 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = s.substring(4, 8);
                }
                else if (6 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(2, 4);
                    y = '20' + s.substring(4, 6);
                }
                else if (0 == len) {
                    erString = '';
                }
                else if (11 == len) {
                    d = s.substring(0, 2);
                    m = s.substring(3, 6);
                    y = s.substring(7, 11);

                    if (m.toUpperCase() == 'JAN')
                        m = '01';
                    if (m.toUpperCase() == 'FEB')
                        m = '02';
                    if (m.toUpperCase() == 'MAR')
                        m = '03';
                    if (m.toUpperCase() == 'APR')
                        m = '04';
                    if (m.toUpperCase() == 'MAY')
                        m = '05';
                    if (m.toUpperCase() == 'JUN')
                        m = '06';
                    if (m.toUpperCase() == 'JUL')
                        m = '07';
                    if (m.toUpperCase() == 'AUG')
                        m = '08';
                    if (m.toUpperCase() == 'SEP')
                        m = '09';
                    if (m.toUpperCase() == 'OCT')
                        m = '10';
                    if (m.toUpperCase() == 'NOV')
                        m = '11';
                    if (m.toUpperCase() == 'DEC')
                        m = '12';

                    //alert(m);
                }
            }

            // debugger;            
            if (checkDate(y, m, d)) {
                if (eFormat == 'dd/MM/yyyy')
                    el.value = d + '/' + monthNo[m - 1] + '/' + y;
                if (eFormat == 'dd-MM-yyyy')
                    el.value = d + '-' + monthNo[m - 1] + '-' + y;
                if (eFormat == 'MM/dd/yyyy')
                    el.value = monthNo[m - 1] + '/' + d + '/' + y;
                if (eFormat == 'MM-dd-yyyy')
                    el.value = monthNo[m - 1] + '-' + d + '-' + y;
                if (eFormat == 'dd-MMM-yyyy') {
                    el.value = d + '-' + monthNames[m - 1] + '-' + y;
                    DtConvDate = monthNo[m - 1] + '/' + d + '/' + y;
                }

                erString = '';
            }
            if (document.getElementById) {
                //document.getElementById(erID).innerHTML = erString;
                //document.getElementById(erID).value = erString;                
                if (erString != "") {
                    alert(erString);
                    document.getElementById(erID).value = "";
                }
            }
            if (erString) {
                if (el.focus) {
                    el.focus();
                }
            }
            var varEnteredDateValue;
            var varEnteredDate;
            //var varEnteredDateVal = varEnteredDate;                          
            var vartoday = new Date();
            var dd = vartoday.format('MM/dd/yyyy');

            var varCurrentDate = Date.parse(dd);

            if (eFormat == 'dd-MMM-yyyy') {
                varEnteredDateValue = Date.parse(DtConvDate);
            }
            else {
                //varEnteredDate= d + '/' + monthNo[m-1] + '/' + y;     
                varEnteredDate = monthNo[m - 1] + '/' + d + '/' + y;
                varEnteredDateValue = Date.parse(varEnteredDate);
            }
            if (IsFutureDateValidation == true) {
                if (varEnteredDateValue > varCurrentDate) {
                    alert('Entered date cannot be greater than system date');
                    document.getElementById(erID).value = '';
                }
            }
            if (IsBackDateValidation == true) {
                if (varEnteredDateValue < varCurrentDate) {
                    alert('Entered date cannot be less than system date');
                    document.getElementById(erID).value = '';
                }
            }

            if (IsBackDateValidation == 'P') {
                if (varEnteredDateValue >= varCurrentDate) {
                    alert('Entered date cannot be greater than or equal to system date');
                    document.getElementById(erID).value = '';
                }
            }
            //if (IsBackDateValidation == 'F') {
            //    if (varEnteredDateValue <= varCurrentDate) {
            //        alert('Entered date cannot be less than or equal to system date');
            //        document.getElementById(erID).value = '';
            //    }
            //}

            var FromDate, ToDate;
            if (IsToDate == 'T') {
                document.getElementById('<%=hdnToDate.ClientID%>').value = varEnteredDate;
                ToDate = varEnteredDate;
                FromDate = document.getElementById('<%=hdnfromDate.ClientID%>').value;
            }
            else {
                document.getElementById('<%=hdnfromDate.ClientID%>').value = varEnteredDate;
                FromDate = varEnteredDate;
                ToDate = document.getElementById('<%=hdnToDate.ClientID%>').value;
            }

            if (FromDate != "" && FromDate != null && ToDate != "" && ToDate != null)//
            {
                //if (ToDateValue < FromDatevalue)//
                if (ToDate < FromDate) {
                    alert('To Date cannot be less than From Date');
                    document.getElementById('<%=txtTodate.ClientID%>').value = "";
                    document.getElementById('<%=txtTodate.ClientID%>').focus();
                    return;
                }
            }
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }

        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

    </script>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>

            <table width="100%">
                <tr width="100%">
                    <td class="stylePageHeading">
                        <asp:Label runat="server" Text="BANK STATEMENT UPLOAD" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel Height="100%" ID="pnlValidation" GroupingText="Bank Statement Upload" runat="server" CssClass="stylePanel">
                            <table width="100%">
                                <tr>

                                    <td>



                                        <table width="100%">
                                            <tr>

                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label runat="server" ID="lblbankname" CssClass="styleReqFieldLabel" Text="Bank Name"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:DropDownList ID="ddlbankname" AutoPostBack="true" OnSelectedIndexChanged="ddlbankname_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfvBank" runat="server" InitialValue="0" ControlToValidate="ddlbankname" Display="None" ErrorMessage="Please select a Bank" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                </td>
                                                <td class="styleFieldLabel" width="18%">
                                                    <asp:Label ID="lblFromdate" runat="server" Text="Bank Statement Start Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign" width="18%">
                                                    <asp:TextBox ID="txtFromdate" Width="70%" runat="server"
                                                        AutoPostBack="false"></asp:TextBox>
                                                    <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    <cc1:CalendarExtender ID="CEFromDate" runat="server" PopupButtonID="imgPaymentRequestDate"
                                                        TargetControlID="txtFromdate">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator Display="None" ID="RFVfromdate" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtFromdate"
                                                        ErrorMessage="Enter Bank Statement Start Date"></asp:RequiredFieldValidator>
                                                    <asp:HiddenField ID="hdnfromDate" runat="server" />
                                                    <asp:HiddenField ID="hdnToDate" runat="server" />
                                                </td>
                                            </tr>

                                            <tr>

                                                <td height="4px"></td>

                                            </tr>

                                            <tr>
                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label ID="lblLocation" runat="server" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>

                                                <td class="styleFieldAlign">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                             <uc:Suggest ID="ddllocation" runat="server" ServiceMethod="GetBranchList" WatermarkText="--Select--"
                                                        ValidationGroup="submit" ItemToValidate="Value" OnItem_Selected="ddllocation_Item_Selected"
                                                        AutoPostBack="true" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlbankname" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>

                                                <td class="styleFieldLabel" width="18%">
                                                    <asp:Label ID="lblTodate" runat="server" Text="Bank Statement End Date" CssClass="styleReqFieldLabel"></asp:Label>
                                                </td>

                                                <td class="styleFieldAlign" width="18%">
                                                    <asp:TextBox ID="txtTodate" Width="70%" runat="server"
                                                        AutoPostBack="false"></asp:TextBox>
                                                    <asp:Image ID="ImgTodate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                    <cc1:CalendarExtender ID="caltodate" runat="server" PopupButtonID="ImgTodate"
                                                        TargetControlID="txtTodate">
                                                    </cc1:CalendarExtender>
                                                    <asp:RequiredFieldValidator Display="None" ID="rfvtodate" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtTodate"
                                                        ErrorMessage="Enter Bank Statement End Date"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td height="4px"></td>
                                            </tr>
                                            <tr>
                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label ID="lblUploadPath" runat="server" Text="Document Path"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:TextBox ID="txtUploadPath" runat="server" MaxLength="100" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator Display="None" ID="rfvUploadPath" CssClass="styleMandatoryLabel"
                                                        SetFocusOnError="true" runat="server" ValidationGroup="Save" ControlToValidate="txtUploadPath"
                                                        ErrorMessage="Enter the Document Path"></asp:RequiredFieldValidator>
                                                    <asp:Label ID="lblUpldFileName" runat="server" Text="" CssClass="styleDisplayLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label ID="lbltype" runat="server" Text="Type" CssClass="styleDisplayLabel"></asp:Label>
                                                    <asp:Label ID="lblTypeID" runat="server" Text="0" CssClass="styleDisplayLabel"></asp:Label>
                                                </td>
                                                <td class="styleFieldAlign">
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:TextBox ID="txtType" runat="server" ReadOnly="true" Width="100px"></asp:TextBox>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlbankname" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                            <tr id="trUpload" runat="server">
                                                <td class="styleFieldLabel" width="15%">
                                                    <asp:Label ID="lblUpload" runat="server" Text="Upload"></asp:Label>
                                                </td>

                                                <td class="styleFieldAlign" colspan="3">
                                                    <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                                    <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_Click" CssClass="styleSubmitButton" Style="display: none"></asp:Button>
                                                    <asp:FileUpload ID="fpd" runat="server" />
                                                    <asp:Button CssClass="styleSubmitButton" ID="btnDlg" runat="server" Text="Browse"
                                                        Style="display: none" CausesValidation="false"></asp:Button>
                                                    <asp:ImageButton ID="hyplnkView" OnClick="hyplnkView_Click" ImageUrl="~/Images/spacer.gif" CommandArgument=""
                                                        CssClass="styleGridEditDisabled" runat="server" Enabled="false" />
                                                    <%--<asp:RequiredFieldValidator ID="rfvupd" runat="server" ControlToValidate="fpd" Display="None" ErrorMessage="Please Upload a file"
                                                        ValidationGroup="Save"></asp:RequiredFieldValidator>--%>
                                                    <asp:Button ID="btnUpload" runat="server" CssClass="styleGridShortButton" Text="Upload"
                                                        ToolTip="Upload" OnClick="btnUpload_Click" Enabled="false" />
                                                    <asp:Label ID="lblExcelCurrentPath" runat="server" Visible="true" Text="" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="btnValidate" runat="server" Text="Validate" CssClass="styleGridShortButton" OnClick="btnValidate_Click" />
                                                    <asp:Button ID="btnException" runat="server" Text="Exception" CssClass="styleGridShortButton" OnClick="btnException_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <span runat="server" id="lblUploadErrorMsg" style="color: Red; font-size: medium"></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>


                    </td>

                </tr>
                <tr align="center">
                    <td>
                        <asp:Button ID="btnView" runat="server" OnClick="btnView_Click" CssClass="styleSubmitButton" Text="View Statement" AccessKey="V" ToolTip="Alt+V" />
                        &nbsp;
                <asp:Button ID="btnSave" ValidationGroup="Save" CausesValidation="true" CssClass="styleSubmitButton" runat="server" OnClick="btnSave_Click" Text="Save" AccessKey="S" ToolTip="Alt+S" />
                        &nbsp;
                <asp:Button ID="btndelete" runat="server" CssClass="styleSubmitButton" OnClick="btndelete_Click" Text="Delete Statement" AccessKey="D" ToolTip="Alt+D"/>
                        <asp:Button ID="btnCancel" runat="server" CssClass="styleSubmitButton" OnClick="btnCancel_Click" Text="Exit" AccessKey="X" ToolTip="Alt+X" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:ValidationSummary ID="vsummary" runat="server" ShowSummary="true" ValidationGroup="Save" DisplayMode="BulletList" />
                        <asp:CustomValidator ID="CVUpload" runat="server" CssClass="styleMandatoryLabel" Enabled="true" />
                    </td>
                </tr>

            </table>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnBrowse" />
            <asp:PostBackTrigger ControlID="btnException" />
            <asp:PostBackTrigger ControlID="btnView" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

