<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChqRepHandingOvertoAccountDept, App_Web_la20gqab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
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
            }
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
            return confirm('Do you want to process this Cheque return Upload Details?');
        }
        function selectAll(invoker) {
            var inputElements = document.getElementsByTagName('input');
            for (var i = 0 ; i < inputElements.length ; i++) {
                var myElement = inputElements[i];
                if (myElement.type === "checkbox") {
                    myElement.checked = invoker.checked;
                }
            }
        }
        function CheckMandatory(invoker) {

            var gridViewObj = document.getElementById("ctl00_ContentPlaceHolder1_gvChequeReqforVault");
            var inputArray = gridViewObj.getElementsByTagName("input");
            var inputArrayLength = inputArray.length;
            var ICount = 0;
            for (a = 0; a < inputArrayLength; a++) {
                if (inputArray[a].type == "checkbox" && inputArray[a].checked) {
                    ICount = ICount + 1;
                    return true;
                }
            }
            if (ICount == 0) {
                alert("Select all Cheques to Proceed");
                return false;
            }
            else {
                return true;
            }
        }

        function CheckMandatory_one(invoker) {

            var gridViewObj = document.getElementById("ctl00_ContentPlaceHolder1_gvChequeReqforVault");
            var inputArray = gridViewObj.getElementsByTagName("input");
            var inputArrayLength = inputArray.length;
            var ICount = 0;
            for (a = 0; a < inputArrayLength; a++) {
                if (inputArray[a].type == "checkbox" && inputArray[a].checked) {
                    ICount = ICount + 1;
                    return true;
                }
            }
            if (ICount == 0) {
                alert("Select at least one Cheque to Proceed");
                return false;
            }
            else {
                return true;
            }
        }
        function checkDate_NextSystemDate_Inline(sender, args) {
            debugger;
            var today = new Date();
            var TotalDays = 0;
            TotalDays = parseInt((today - sender._selectedDate) / (1000 * 60 * 60 * 24));
            if (sender._selectedDate > today) {
                alert('Selected date cannot be greater than system date');
                sender._textbox.set_Value(today.format(sender._format));
            }
            if (TotalDays >= 5) {
                alert('Selected date cannot be earlier than 5 days from Current Date');
                sender._textbox.set_Value(today.format(sender._format));
            }
            document.getElementById(sender._textbox._element.id).focus();
        }
    </script>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="Cheque Representation Handing Over To Accounts Department" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                        <asp:HiddenField ID="hiddenheaderid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Query" ID="pnlQuery" runat="server" Visible="false"
                            CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Button ID="btnViewRequest" runat="server" CssClass="styleSubmitButton" OnClick="btnViewRequest_Click"
                                            ToolTip="Show, Alt+H" AccessKey="H" Width="80px" Text="Show" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Account Status" HorizontalAlign="Center" ID="Panel1" runat="server"
                            CssClass="stylePanel">
                            <table>
                                <tr align="center">
                                    <td class="styleFieldLabel">
                                        <asp:Label ID="lblAccountStatus" runat="server" Text="Check Account Status" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign">
                                        <asp:TextBox ID="txtAccountStatus" AutoPostBack="true" OnTextChanged="txtAccountStatus_TextChanged" runat="server"></asp:TextBox>
                                    </td>
                                    <cc1:TextBoxWatermarkExtender ID="txtAccountStatusWM" runat="server" TargetControlID="txtAccountStatus"
                                        WatermarkText="--Enter the Account No--">
                                    </cc1:TextBoxWatermarkExtender>
                                </tr>

                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Cheque Representation Details" ID="pnlUploadDetails" runat="server"
                            CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <uc:Suggest ID="ddlBranch" ToolTip="Location" runat="server" IsMandatory="true" AutoPostBack="true" OnItem_Selected="ddlBranch_Item_Selected" ServiceMethod="GetBranchList"
                                            ValidationGroup="btnGo" ErrorMessage="Select a Branch"
                                            WatermarkText="--Select--" />
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblContractNum" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <uc:Suggest ID="ddlContractNum" ToolTip="Account Number" IsMandatory="true" runat="server" AutoPostBack="true" OnItem_Selected="ddlContractNum_Item_Selected" ServiceMethod="GetContractNumber"
                                            ValidationGroup="btnGo" ErrorMessage="Select a Account Number"
                                            WatermarkText="--Select--" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Customer Code" ID="lblCustomerCode">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtCustomerCode" ReadOnly="true" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Customer Name" ID="lblCustomerName">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtCustomerName" ReadOnly="true" runat="server"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>

                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" OnClick="btnGo_Click" Width="80px"
                            ToolTip="Go, Alt+G" AccessKey="G" Text="Go" ValidationGroup="btnGo" />
                          <asp:Button ID="btnSave" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click" Visible="false" OnClientClick="return fnCheckPageValidators();"
                            ToolTip="Save, Alt+S" AccessKey="S" Width="80px" Text="Save" />
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();"
                            ToolTip="Clear, Alt+L" AccessKey="L" Width="80px" OnClick="btnClear_Click" Text="Clear" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClientClick="parent.RemoveTab();"
                            ToolTip="Exit, Alt+X" AccessKey="X" Width="80px" Text="Exit" />


                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel ID="pnlChequeRepresentaionDet" Width="99%" GroupingText="Cheque Representation Details" runat="server" CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvChequeRepresentDet" runat="server" AutoGenerateColumns="false" HeaderStyle-CssClass="styleGridHeader" OnRowDataBound="gvChequeRepresentDet_RowDataBound" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSNo" Visible="false" runat="server" Text='<%# Bind("SNo") %>'></asp:Label>
                                                        <asp:Label runat="server" ID="Label1" ToolTip="S.No." Width="70%" Text='<%#Container.DataItemIndex+1%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Cheque Represent Det ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeRepresentID" runat="server" Visible="false" Text='<%#Eval("ChqRepresentID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Cheque Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeNumber" runat="server" Text='<%#Eval("ChequeNumber")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Cheque Status">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeStatus" runat="server" Text='<%#Eval("ChequeStatus")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Cheque Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeDate" runat="server" Text='<%#Eval("ChequeDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Cheque Amount">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChequeAmount" runat="server" Text='<%#Eval("ChequeAmount")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Installment Number">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("InstallmentNo")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Represent Date" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("REPRESENT_DATE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Requested By">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("REQUESTED_BY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Requested Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblInstallmentNo" runat="server" Text='<%#Eval("REQUESTED_DATE")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkSelectAll" runat="server"></asp:CheckBox>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectCheque" runat="server"></asp:CheckBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>No Records Found</EmptyDataTemplate>

                                            <RowStyle HorizontalAlign="Center" />

                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td rowspan="2">

                                    <asp:Panel ID="pnlHandOver" GroupingText="Cheque Handing over by Cheuqe custodian"
                                        Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0" runat="server">
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tr align="center">
                                                <td>
                                                    <asp:Button ID="btnHandOver" runat="server" CssClass="styleSubmitButton" OnClientClick="return CheckMandatory(this)"
                                                        ToolTip="Handover, Alt+O" AccessKey="O" OnClick="btnSave_Click" Width="80px" Text="Handover" />
                                                    <asp:Button ID="btnReject" runat="server" CssClass="styleSubmitButton" OnClientClick="return CheckMandatory(this)"
                                                        ToolTip="Reject, Alt+R" AccessKey="R" OnClick="btnSave_Click" Width="80px" Text="Reject" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:ValidationSummary ID="VlmSummery" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" Visible="true" ShowMessageBox="false" ValidationGroup="btnGo" runat="server" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Visible="false" Text="Drawee Bank" ID="lblDraweebank">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <uc:Suggest ID="txtDraweeBank" Visible="false" ToolTip="Drawee Bank" runat="server" AutoPostBack="true" OnItem_Selected="txtDraweeBank_Item_Selected" ServiceMethod="GetDraweeBank"
                            ValidationGroup="submit" ErrorMessage="Select a Drawee Bank"
                            WatermarkText="--Select--" />
                    </td>
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Visible="false" Text="Drawee Place" ID="lblDraweePlace">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <asp:TextBox ID="txtDraweePlace" Visible="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Text="Reason" Visible="false" ID="lblReasonforVault">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <asp:TextBox ID="txtReasonforVault" Visible="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <%-- <tr>
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Text="View Request Details" ID="lblRequestDetails">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <asp:Button ID="btnViewRequest" runat="server" CssClass="styleSubmitButton" OnClick="btnViewRequest_OnClick" Width="80px" Text="Show" />
                    </td>
                </tr>--%>
            </table>

            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Panel ID="pnlViewRqstDtls" Visible="false" runat="server" GroupingText="View Request Details"
                            Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                            <asp:GridView ID="gvViewRequestDtls" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Request Vault Records Found">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">

                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("CHEQUE_NUMBER")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contract Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblContractNumber" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("CHEQUE_STATUS_CODE")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHEQUE_DATE")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Installment Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInstallmentNumber" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeAmount" runat="server" Text='<%# Eval("CHEQUE_AMNT")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Requested By">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlRequest" Width="100%" runat="server"></asp:DropDownList>
                                            <asp:Label ID="lblRequestedBy" Visible="false" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Requested Date">
                                        <ItemTemplate>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtRequestedDate" Width="80px" runat="server" Text='<%# Eval("REQUEST_DATE")%>' />
                                                    </td>
                                                    <td>
                                                        <asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                        <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="True"
                                                            PopupButtonID="imgDate" OnClientDateSelectionChanged="checkDate_NextSystemDate_Inline" TargetControlID="txtRequestedDate">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Reason">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtReason" Text='<%# Eval("REASION")%>' runat="server"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false" HeaderText="Select">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="ChkSelectAll" Text="Select All" OnClick="selectAll(this)" runat="server" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="12%" />
                                        <HeaderStyle HorizontalAlign="Center" Width="12%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </asp:Panel>
                    </td>
                </tr>
            </table>

            </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlShowAccountStatus" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="PnlShowAccountStatus" Style="display: none; vertical-align: middle" runat="server"
        BorderStyle="Solid" BackColor="White" Width="850px">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table width="100%">
                                <tr align="center">
                                    <td>
                                        <div id="divTransaction" class="container" runat="server" style="height: 200px; overflow: scroll">
                                            <asp:GridView ID="grvChequeAccountDetails" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" EmptyDataText="No Records Found">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sno">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" Width="2px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Current Stage">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("ACCOUNT_STAGE")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("Cheque_Number")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Cheque Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHQ_DATE")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Installment No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Request by">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblREQUESTED_BY" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Approved By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAPPROVED_BY" runat="server" Text='<%# Eval("APPROVED_BY")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Handing Over Cheque to DC By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHOV_BY" runat="server" Text='<%# Eval("HOV_BY")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Handing Over Cheque to DC Acknowledged By  ">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHOV_ACK_BY" runat="server" Text='<%# Eval("HOV_ACK_BY")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DC Send back the cheques to Accounts Depte By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCHQ_RV_BY" runat="server" Text='<%# Eval("CHQ_RV_BY")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Accounts Dept confirmed cheque received from DC By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCHQ_RV_ACK" runat="server" Text='<%# Eval("CHQ_RV_ACK")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnDEVModalCancel" runat="server" Text="Exit" OnClick="btnDEVModalCancel_Click"
                                            ToolTip="Exit, Alt+I" AccessKey="I" class="styleSubmitButton" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnModal" Style="display: none" runat="server" />
    </asp:Panel>

</asp:Content>

