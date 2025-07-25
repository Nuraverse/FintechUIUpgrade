<%@ page title="Cheque Return PDC Upload" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeReturnPDCUpload, App_Web_wom33hv0" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<%@ Register Src="../UserControls/FAAddressDetail.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>--%>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script language="javascript" type="text/javascript">
        function fnCheckPageValidators_Extn(strValGrp, blnConfirm) {
            if (Page_ClientValidate() == false) {
                var iResult = "1";
                for (i = 0; i < Page_Validators.length; i++) {
                    val = Page_Validators[i];
                    controlToValidate = val.getAttribute("controltovalidate");
                    if (controlToValidate != undefined) {
                        if (document.getElementById(controlToValidate) != null) {
                            document.getElementById(controlToValidate).border = "1";
                        }
                    }
                }

                for (i = 0; i < Page_Validators.length; i++) { //For loop1
                    val = Page_Validators[i];
                    var isValidAttribute = val.getAttribute("isvalid");
                    var controlToValidate = val.getAttribute(" ");
                    if (controlToValidate != undefined) {
                        if (strValGrp == undefined) {
                            if (document.getElementById(controlToValidate) != null) {
                                if (isValidAttribute == false) {

                                    document.getElementById(controlToValidate).className = 'styleReqFieldFocus';
                                    //This is to avoid not to validate control which is already in false state (valid attribute)
                                    document.getElementById(controlToValidate).border = "0";
                                    iResult = "0";
                                }
                                else if (document.getElementById(controlToValidate).border != "0") {
                                    document.getElementById(controlToValidate).className = 'styleReqFieldDefalut';
                                }
                            }
                        }

                    }  //Undefined loop condition

                } //For loop1 End
                Page_BlockSubmit = false; ////Added by Kali on 12-Jun-2010 This function is used to solve issues
                // Need twice click of cancel and clear button after validation summary is visible
            } //
            if (Page_ClientValidate(strValGrp)) {

                if (blnConfirm == undefined) {
                    if (confirm('Are you sure you want to Revoke?')) {
                        Page_BlockSubmit = false;
                        //Added by Thangam M on 18/Oct/2012 to avoid double save click
                        var a = event.srcElement;
                        if (a.type == "submit") {
                            a.style.display = 'none';
                        }
                        //End here
                        return true;
                    }
                    else
                        return false;
                }
                else {
                    Page_BlockSubmit = false;
                    //Added by Thangam M on 18/Oct/2012 to avoid double save click
                    var a = event.srcElement;
                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    //End here
                    return true;
                }

            }
            else {
                Page_BlockSubmit = false;

                return false;
            }

        }
        function fnLoadPath(btnBrowse) {
            if (btnBrowse != null)
                document.getElementById(btnBrowse).click();
        }

        function fnAssignPath(btnBrowse, hdnPath) {
            if (btnBrowse != null)
                document.getElementById(hdnPath).value = document.getElementById(btnBrowse).value;
        }
        function SaveConfirm() {
            return confirm('Do you want to process this PDC Upload Details?');
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="PDC Upload" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                        <asp:HiddenField ID="hiddenheaderid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Upload Details" ID="pnlUploadDetails" runat="server"
                            CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblBranch" runat="server" Text="Location" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" ServiceMethod="GetBranchList"
                                            ValidationGroup="submit" ErrorMessage="Select a Location"
                                            WatermarkText="--Select--" />
                                        <%--<asp:RequiredFieldValidator ID="rfvBranch" runat="server" Display="None" InitialValue="0"
                                        ValidationGroup="submit" ErrorMessage="Select the Location" ControlToValidate="ddlBranch"
                                        SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblBank" runat="server" Text="Bank" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:DropDownList ID="ddlBankCode" runat="server" Width="205px" OnSelectedIndexChanged="ddlBankCode_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvBank" runat="server" Display="None" InitialValue="0"
                                            ValidationGroup="Go" ErrorMessage="Select the Bank" ControlToValidate="ddlBankCode"
                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Upload PDC Through CSV" ID="Label2">
                                        </asp:Label>

                                    </td>
                                    <td class="styleFieldAlign" width="35%">

                                        <asp:Button ID="btnBrowse" runat="server" OnClick="btnBrowse_OnClick" CssClass="styleSubmitButton" Style="display: none"></asp:Button>
                                        <asp:CheckBox ID="chkSelect" runat="server" Text="" Enabled="false" Visible="false" />
                                        <asp:FileUpload runat="server" ID="flUpload" ToolTip="Upload File" />
                                        <asp:Button CssClass="styleSubmitButton" ID="btnDlg" runat="server" Text="Browse"
                                            Style="display: none" CausesValidation="false"></asp:Button>
                                        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnGo" CssClass="styleSubmitShortButton" Enabled="false" ValidationGroup="Go" runat="server" Text="Show"
                                            OnClick="btnGo_Click" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="flUpload" ErrorMessage="Upload Cheque and ECS Return Excel"
                                            CssClass="styleMandatoryLabel" SetFocusOnError="True" Display="None" Enabled="false"
                                            ValidationGroup="Go"></asp:RequiredFieldValidator>
                                    </td>
                                    <td align="left" style="width: 15%;">
                                        <asp:ImageButton ID="hyplnkView" OnClick="hyplnkView_Click" ImageUrl="~/Images/Excel.png"
                                            Width="20px" Height="20px" runat="server" ToolTip="Uploaded File" Visible="false" />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td align="right"></td>
                                    <td align="left">
                                        <asp:Label ID="lblActualPath" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblCurrentPath" runat="server" Visible="false" Text="" />
                                        <asp:HiddenField ID="hdnSelectedPath" runat="server" />
                                        <asp:Label runat="server" ID="lblPath" Text="" Visible="false"></asp:Label>
                                        <asp:Label ID="lblExcelCurrentPath" runat="server" Visible="true" Text="" ForeColor="Red" />
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Status Details" ID="pnlUpload" Visible="false" runat="server" CssClass="stylePanel">
                            <table>
                                <tr>
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="Label1" runat="server" Text="Status"></asp:Label>
                                    </td>
                                    <td colspan="2" class="styleFieldAlign">
                                        <asp:ImageButton ID="imgbtnValid" OnClick="imgbtnValid_Click" ImageUrl="~/Images/Excel.png" ToolTip="Valid Details"
                                            Width="20px" Height="20px" runat="server" Visible="false" />
                                        <asp:CheckBox ID="chkSuccess" AutoPostBack="true" Text="Valid" runat="server"
                                            OnCheckedChanged="chkSuccess_CheckedChanged" />

                                        &nbsp;&nbsp;&nbsp;
                                         <asp:ImageButton ID="imgbtnInvalid" OnClick="imgbtnInvalid_Click" ImageUrl="~/Images/Excel.png" ToolTip="Invalid Details"
                                             Width="20px" Height="20px" runat="server" Visible="false" />
                                        <asp:CheckBox ID="chkFail" Text="Invalid" runat="server" OnCheckedChanged="chkFail_CheckedChanged"
                                            AutoPostBack="true" />

                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlGRDChqRtn" runat="server" GroupingText="Cheque Return Information"
                            Width="100%" Visible="false" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                            <asp:GridView ID="gvChequeReturn" runat="server" RowStyle-HorizontalAlign="Center" AutoGenerateColumns="true" Width="100%">
                            </asp:GridView>

                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlGRDECS" runat="server" GroupingText="ECS Return Information"
                            Width="100%" Visible="false" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                            <asp:GridView ID="gvECSReturn" runat="server" AutoGenerateColumns="true" RowStyle-HorizontalAlign="Center" Width="100%">
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click" OnClientClick="return SaveConfirm();" Width="200px" Text="Move To Staging Table" ValidationGroup="btnSave" ToolTip="Save, Alt+S" AccessKey="S" />
                        <asp:Button ID="btnUpdate" runat="server" CssClass="styleSubmitButton" Text="Upload PDC" Enabled="false" OnClick="btnUpdate_Click" ToolTip="Update, Alt+U" AccessKey="U" />

                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClick="btnClear_Click" OnClientClick="return fnConfirmClear();" Text="Clear" ToolTip="Clear, Alt+L" AccessKey="L" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"
                            OnClientClick="return fnConfirmExit();" OnClick="btnCancel_Click" Text="Exit" ToolTip="Exit, Alt+X" AccessKey="X" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <cc1:TabContainer ID="tcChequeReturnThroughExcel" runat="server" CssClass="styleTabPanel"
                            Width="99%" TabStripPlacement="top" ActiveTabIndex="0">
                            <cc1:TabPanel runat="server" HeaderText="Details" ID="tbProcessedDetails" CssClass="tabpan"
                                BackColor="Red" TabIndex="0">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="updProcessed" runat="server">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>

                                                        <asp:ImageButton ID="btnProcessedExcel" Enabled="false" OnClick="btnProcessedExcel_OnClick" ImageUrl="~/Images/Excel.png"
                                                            Width="30px" Height="30px" runat="server" ToolTip="Processed Excel" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="pnlLaoding" runat="server" GroupingText="Details" CssClass="stylePanel" Width="1000px">
                                                            <div id="divGrid1" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                                <asp:GridView ID="gvProcessedData" OnRowDataBound="gvProcessedData_OnRowDataBound" runat="server" AutoGenerateColumns="true" Width="100%" Hight="100%"></asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btnProcessedExcel" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" HeaderText="Exception Details" ID="tbExceptionDetails" CssClass="tabpan"
                                BackColor="Red" TabIndex="1">
                                <ContentTemplate>
                                    <asp:UpdatePanel runat="server" ID="updException">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Panel ID="Panel1" runat="server" CssClass="stylePanel" GroupingText="Exception Details" Width="1000px">
                                                            <table>
                                                                <tr>
                                                                    <td>

                                                                        <asp:ImageButton ID="btexnExcel" Enabled="false" OnClick="btexnExcel_Click" ImageUrl="~/Images/Excel.png"
                                                                            Width="30px" Height="30px" runat="server" ToolTip="Exception Excel" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <div id="divGrid2" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                                <asp:GridView ID="grvException" runat="server" AutoGenerateColumns="true" Visible="false" Width="100%">
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>

                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger ControlID="btexnExcel" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel runat="server" Visible="false" HeaderText="Cheque Return Details" ID="tbChequeReturnDetails" CssClass="tabpan"
                                BackColor="Red" TabIndex="2">
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="updChequeReturnDetails" runat="server">
                                        <ContentTemplate>
                                            <table>
                                                <tr>
                                                    <td class="styleFieldLabel">
                                                        <asp:Label ID="lblFrom" runat="server" Text="Advice Date" Visible="false" />
                                                        <asp:TextBox ID="txtFrom" runat="server" ToolTip="Advice Date" Width="165px" Visible="false"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="txtFrom_CalendarExtender" runat="server" Enabled="True" PopupButtonID="txtFrom" TargetControlID="txtFrom">
                                                        </cc1:CalendarExtender>
                                                        <asp:RequiredFieldValidator ID="rfvFrom" runat="server" ControlToValidate="txtFrom" Display="None" ErrorMessage="Please select the Advice Date" SetFocusOnError="true" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="Label3" runat="server" Text="Advice No" Visible="false" />
                                                        <asp:TextBox ID="txtadvoirno" runat="server" Visible="false" MaxLength="15"></asp:TextBox>
                                                        <asp:Button ID="btnchprocess" runat="server" CssClass="styleSubmitButton" Width="150Px" Text="Cheque Return Process" Enabled="false" OnClick="btnchprocess_Click" ValidationGroup="Update" Visible="false" />
                                                        <cc1:FilteredTextBoxExtender ID="flRatingAmount" runat="server" TargetControlID="txtadvoirno"
                                                            FilterType="Numbers">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFrom" Display="None" ErrorMessage="Please Enter Advice No" SetFocusOnError="true" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                                        <asp:ImageButton ID="btnchequedetails" Enabled="false" OnClick="btnchequedetails_Click" ImageUrl="~/Images/Excel.png"
                                                            Width="30px" Height="30px" runat="server" ToolTip="Excel" />

                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Panel ID="Panel2" runat="server" CssClass="stylePanel" GroupingText="Cheque Return Details" Width="1000px">
                                                            <div id="divGrid3" runat="server" style="overflow: auto; height: 300px; width: 100%;">
                                                                <asp:GridView ID="grvChequeDetails" runat="server" AutoGenerateColumns="true" Visible="false" Width="100%">
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>

                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>


                                            <asp:PostBackTrigger ControlID="btnchequedetails" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                        </cc1:TabContainer>

                    </td>
                </tr>



                <tr>
                    <td align="center">
                        <asp:ValidationSummary ID="vsUTPA" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" ShowSummary="true" ValidationGroup="Go" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="styleMandatoryLabel" HeaderText="Please correct the following validation(s):" ShowSummary="true" ValidationGroup="Update" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:CustomValidator ID="cvChequeReturn" runat="server" CssClass="styleMandatoryLabel" Enabled="true" Width="98%" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CssClass="styleSubmitButton" Style="display: none;" Text="Print" />
                    </td>
                </tr>


            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Button1" />
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnBrowse" />
            <asp:PostBackTrigger ControlID="imgbtnValid" />
            <asp:PostBackTrigger ControlID="imgbtnInvalid" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


