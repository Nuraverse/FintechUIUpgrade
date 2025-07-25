<%@ page title="Cheque Request from Vault" language="C#" enableeventvalidation="false" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeRequestfromVaultRp, App_Web_f2u5fcxj" %>

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



    </script>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top" class="stylePageHeading">
                        <asp:Label runat="server" Text="Cheque Movement Report" ID="lblHeading" CssClass="styleDisplayLabel">
                        </asp:Label>
                        <asp:HiddenField ID="hiddenheaderid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel GroupingText="Cheque Return Vault Details" ID="pnlUploadDetails" runat="server"
                            CssClass="stylePanel">
                            <table width="100%">
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblBranch" runat="server" Text="Branch" CssClass="styleDisplayLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:DropDownList ID="ddlBranch" runat="server" Width="170px"></asp:DropDownList>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label ID="lblContractNum" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <uc:Suggest ID="ddlContractNum" ToolTip="Account Number" IsMandatory="false" runat="server" AutoPostBack="true" OnItem_Selected="ddlContractNum_SelectIndexChanged" ServiceMethod="GetContractNumber"
                                            WatermarkText="--Select--" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Customer Code" ID="lblCustomerCode">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtCustomerCode" runat="server"></asp:TextBox>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Customer Name" ID="lblCustomerName">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Request From" ID="lblRequestFrom">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtRequestFrom" runat="server"></asp:TextBox>
                                        <%--                                        <asp:RequiredFieldValidator ID="rfvRequestFrom" ValidationGroup="btnGo" runat="server" ErrorMessage="Select Request From Date" Display="None" ControlToValidate="txtRequestFrom"></asp:RequiredFieldValidator>--%>
                                        <asp:Image ID="imgDate1" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="True"
                                            PopupButtonID="imgDate1" OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtRequestFrom">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Request To" ID="lblRequestTo">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:TextBox ID="txtRequestTO" runat="server"></asp:TextBox>
                                        <%--                                        <asp:RequiredFieldValidator ID="rfvRequestTODate" ValidationGroup="btnGo" runat="server" ErrorMessage="Select Request To Date" Display="None" ControlToValidate="txtRequestTO"></asp:RequiredFieldValidator>--%>
                                        <asp:Image ID="imgDate2" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                        <cc1:CalendarExtender ID="ACERequestedDateTO" runat="server" Enabled="True"
                                            PopupButtonID="imgDate2" OnClientDateSelectionChanged="checkDate_NextSystemDate" TargetControlID="txtRequestTO">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="styleFieldLabel" width="15%">
                                        <asp:Label runat="server" Text="Status" ID="lblStatus">
                                        </asp:Label>
                                    </td>
                                    <td class="styleFieldAlign" width="35%">
                                        <asp:DropDownList ID="ddlTask" runat="server" Width="170px">
                                        </asp:DropDownList>
                                        <%-- <asp:RequiredFieldValidator ID="rfvstatus" Display="None" InitialValue="0" ValidationGroup="btnGo" ErrorMessage="Select Status" ControlToValidate="ddlTask" runat="server"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>

                            </table>

                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnGo" runat="server" CssClass="styleSubmitButton" OnClick="btnGo_Click"
                            ToolTip="Go, Alt+G" AccessKey="G" Width="80px" Text="Go" ValidationGroup="btnGo" />
                        <asp:Button ID="btnClear" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();"
                            ToolTip="Clear, Alt+L" AccessKey="L" Width="80px" OnClick="btnClear_Click" Text="Clear" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="styleSubmitButton"  OnClientClick="parent.RemoveTab();"
                            ToolTip="Exit, Alt+X" AccessKey="X" Width="80px"  Text="Exit" />
                    </td>


                </tr>
                <tr>
                    <td align="center" rowspan="3">
                        <asp:ImageButton ID="btnExporttoExcel" OnClick="btnExport_Click" ImageUrl="~/Images/Excel_Export5.png"
                            Width="50px" Height="50px" runat="server" ToolTip="Export to Excel,Alt + E" AccessKey="E" />
                    </td>
                </tr>

            </table>
            <table>
                <tr style="display: none">
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Text="Drawee Bank" ID="lblDraweebank">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <uc:Suggest ID="txtDraweeBank" ToolTip="Drawee Bank" runat="server" AutoPostBack="true" OnItem_Selected="txtDraweeBank_SelectIndexChanged" ServiceMethod="GetDraweeBank"
                            ValidationGroup="submit" ErrorMessage="Select a Drawee Bank"
                            WatermarkText="--Select--" />
                    </td>
                    <td class="styleFieldLabel" width="15%">
                        <asp:Label runat="server" Text="Drawee Place" ID="lblDraweePlace">
                        </asp:Label>
                    </td>
                    <td class="styleFieldAlign" width="35%">
                        <asp:TextBox ID="txtDraweePlace" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:Panel ID="pnlChequeRequestForVault" runat="server" GroupingText="Cheque Movement Report"
                            Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                            <asp:GridView ID="gvChequeReqforVault" OnRowDataBound="gvChequeReqforVault_Databound" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Request Vault Records Found">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sno">

                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="18px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contract Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblContractNumber" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cheque Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("CHEQUE_NUMBER")%>' />
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
                                    <asp:TemplateField HeaderText="Cheque Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChequeAmount" runat="server" Text='<%# Eval("CHEQUE_AMNT")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Reason">
                                        <ItemTemplate>
                                            <asp:Label ID="txtReason" Text='<%# Eval("REASION")%>' runat="server">
                                            </asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Requested By">
                                        <ItemTemplate>

                                            <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Requested Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequestedDate" runat="server" Text='<%# Eval("REQUEST_DATE")%>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approved By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAPprovedBy" Text='<%# Eval("APPROVED_BY")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approved Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblApprovedDate" Text='<%# Eval("APPROVED_DATE")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Handover By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHandoverBy" Text='<%# Eval("HOV_BY")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Handover Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHandoverDate" Text='<%# Eval("HOV_DATE")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Handover ACK">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHandoverACK" Text='<%# Eval("HOV_ACK_BY")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Handover ACK Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHandoverACKDate" Text='<%# Eval("HOV_ACK_DATE")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Return By">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReturntoVaultBy" Text='<%# Eval("CHQ_RV_BY")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Return Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReturntoVaultDate" Text='<%# Eval("CHQ_RV_DATE")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Return ACK by">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReturntoVaultackBy" Text='<%# Eval("CHQ_RV_ACK")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Return ACK by Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblReturntoVaultACKDate" Text='<%# Eval("CHQ_RV_ACK_DATE")%>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:ValidationSummary ID="VlmSummery" CssClass="styleMandatoryLabel"
                            HeaderText="Correct the following validation(s):" Visible="true" ShowMessageBox="false" ValidationGroup="btnGo" runat="server" />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExporttoExcel" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>


