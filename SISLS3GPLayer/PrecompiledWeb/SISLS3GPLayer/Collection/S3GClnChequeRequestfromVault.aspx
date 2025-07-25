<%@ page title="Cheque Request from Vault" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeRequestfromVault, App_Web_la20gqab" %>

<%@ Register TagPrefix="uc1" TagName="PageNavigator" Src="~/UserControls/PageNavigator.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../UserControls/S3GCustomerAddress.ascx" TagName="S3GCustomerAddress"
    TagPrefix="uc1" %>
<%@ Register TagPrefix="uc2" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/InwardCustomerView.ascx" TagName="LOV" TagPrefix="uc3" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .btn_5_disabled {
            width: 27px !important;
            height: 27px !important;
            border-radius: 0px;
            box-shadow: none !important;
            border: none !important;
            line-height: 14px !important;
            background-color: #D7D7D7 !important;
            color: white !important;
            background-image: none !important;
        }

        /*.btn_lnk {
            color: red;
            text-decoration: underline;
             background-image: none !important;
        }*/
    </style>
    <script language="javascript" type="text/javascript">
        function fnTrashAccountCommonSuggest(e) {

            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtAccountNoDummy.ClientID %>').value = "";


                }
            }
        }
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
        function CheckMandatorySave(invoker) {

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
            function fnSaveValidation() {
                if (confirm('Do you want to save?')) {
                    Page_BlockSubmit = false;
                    var a = event.srcElement;

                    if (a.type == "submit") {
                        a.style.display = 'none';
                    }
                    return true;
                }
                else {
                    return false;
                }
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
        function fnLoadCust() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadCust').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_btnLoadAccount').click();
        }
        function fnConfirmApprove() {

            if (confirm('Do you want to Approve?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmCancelApprove() {

            if (confirm('Do you want to reject the approval?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmHandover() {

            if (confirm('Do you want to Handover?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmReject() {

            if (confirm('Do you want to Reject?')) {
                return true;
            }
            else
                return false;

        }
        function fnConfirmAck() {

            if (confirm('Do you want to Acknowledge?')) {
                return true;
            }
            else
                return false;

        }

    </script>
    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
        <ContentTemplate>
            <div>
                <div class="row">
                    <div class="col">
                        <h6 class="title_name">
                            <asp:Label runat="server" ID="lblHeading" CssClass="styleDisplayLabel"> </asp:Label>
                        </h6>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <asp:Panel GroupingText="Account Status" ID="Panel1" runat="server" Width="100%" Visible="false"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <%-- <asp:TextBox ID="txtAccountStatus" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtAccountStatus_TextChanged" runat="server"></asp:TextBox>--%>
                                            <uc:Suggest ID="ddlaccNo" ToolTip="Check Account Status" runat="server" AutoPostBack="true" OnItem_Selected="ddlaccNo_Item_Selected" ServiceMethod="GetAccountList"
                                                class="md-form-control form-control" ValidationGroup="Go" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAccountStatus" runat="server" Text="Check Account Status" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel GroupingText="Cheque Request Vault Details" ID="pnlUploadDetails" runat="server" Width="100%"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12 styleFieldLabel">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlBranch" runat="server" class="md-form-control form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblBranch" runat="server" ToolTip="Branch" Text="Branch" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" InitialValue="0"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Select a Branch" ValidationGroup="Go"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divContractNum" runat="server" visible="false">
                                        <div class="md-input">
                                            <uc:Suggest ID="ddlContractNum" ToolTip="Account Number" IsMandatory="true"
                                                runat="server" AutoPostBack="true" OnItem_Selected="ddlContractNum_SelectIndexChanged" ServiceMethod="GetContractNumber"
                                                class="md-form-control form-control" ValidationGroup="Go" ErrorMessage="Select a Account Number" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblContractNum" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divCustCode" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerCode" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Customer Code" ID="lblCustomerCode">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divCustName" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomerName" ReadOnly="true" runat="server"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Customer Name" ID="lblCustomerName">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                ValidationGroup="Go" strLOV_Code="ACC_CHQREP" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" ToolTip="Account Number" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <asp:LinkButton ID="btnAccountHistory" runat="server" Text="Account History" Enabled="false" AccessKey="V"
                                                ToolTip="Account History, Alt+V" OnClick="btnAccountHistory_Click" Style="color: red; text-underline-position: below; text-decoration-line: underline"></asp:LinkButton>
                                            <asp:HiddenField ID="hdnPasa_Detail_ID" runat="server" />
                                            <asp:HiddenField ID="hdnPANum_Customer_ID" runat="server" />
                                            <asp:HiddenField ID="hdnAccount_ID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblMLA" runat="server" ToolTip="Account Number" CssClass="styleReqFieldLabel"
                                                    Text="Account Number"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvtxtAccountNoDummy" runat="server" ErrorMessage="Select the Account Number"
                                                    SetFocusOnError="true" ControlToValidate="txtAccountNoDummy" CssClass="validation_msg_box_sapn"
                                                    Display="Dynamic" ValidationGroup="Go"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                ToolTip="Customer Name/Code" Enabled="false" class="md-form-control form-control" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" />
                                            <asp:TextBox ID="TextBox1" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label3" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></td>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-6 col-sm-9 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnGo" title="Go[Alt+G]" onserverclick="btnGo_Click"
                                                runat="server" type="button" accesskey="G" validationgroup="Go">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>
                                            <button class="css_btn_enabled" id="btnViewRequest" title="Show [Alt+H]" causesvalidation="false"
                                                onserverclick="btnViewRequest_OnClick" runat="server"
                                                type="button" accesskey="H">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow 
                                            </button>
                                            <button class="css_btn_enabled" id="btnHide" title="Hide [Alt+Shift+E]" causesvalidation="false"
                                                onserverclick="btnHide_ServerClick" runat="server"
                                                type="button" accesskey="E">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;Hid<u>e</u>
                                            </button>
                                        </div>
                                    </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divdraweebank" runat="server" visible="false">
                                <div class="md-input">
                                    <uc:Suggest ID="txtDraweeBank" Visible="false" ToolTip="Drawee Bank" runat="server" AutoPostBack="true" OnItem_Selected="txtDraweeBank_SelectIndexChanged" ServiceMethod="GetDraweeBank"
                                        class="md-form-control form-control" ValidationGroup="submit" ErrorMessage="Select a Drawee Bank"
                                        WatermarkText="--Select--" />
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Visible="false" Text="Drawee Bank" ID="lblDraweebank">
                                        </asp:Label>
                                    </label>

                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divdraweePlace" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtDraweePlace" Visible="false" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Visible="false" Text="Drawee Place" ID="lblDraweePlace">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divReasonforVault" runat="server" visible="false">
                                <div class="md-input">
                                    <asp:TextBox ID="txtReasonforVault" Visible="false" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label runat="server" Text="Reason" Visible="false" ID="lblReasonforVault">
                                        </asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <asp:Panel ID="pnlChequeRequestForVault" runat="server" GroupingText="Cheque Request for Vault"
                                Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                                <asp:GridView ID="gvChequeReqforVault" OnRowDataBound="gvChequeReqforVault_Databound" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Request Vault Records Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' ToolTip="S.No." />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("CHEQUE_NUMBER")%>' ToolTip="Cheque Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("CHEQUE_STATUS_CODE")%>' ToolTip="Cheque Status" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHEQUE_DATE")%>' ToolTip="Cheque Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeAmount" runat="server" Text='<%# Eval("CHEQUE_AMNT")%>' ToolTip="Cheque Amount" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installment Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallmentNumber" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' ToolTip="Installment Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("ReceiptNumber")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Return ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnID" runat="server" Text='<%# Eval("ChequeReturnID")%>' ToolTip="Cheque Return ID" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="Contract Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContractNum" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="CheckLinkkey">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCheckLinkKey" runat="server" Text='<%# Eval("CHQVLT_LNK_KEY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested By">
                                            <ItemTemplate>
                                                <%--<asp:DropDownList ID="ddlRequest" Visible="false" runat="server"></asp:DropDownList>--%>
                                                <asp:Label ID="lblRequestedBy" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested Date">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtRequestedDate" Width="80px" class="md-form-control form-control login_form_content_input requires_true" runat="server" Text='<%# Eval("REQUEST_DATE")%>' />
                                                <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="True"
                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate_Inline" TargetControlID="txtRequestedDate">
                                                </cc1:CalendarExtender>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="Reason">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtReason" Text='<%# Eval("REASION")%>' runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="ChkSelectAll" Text="Select All" OnClick="selectAll(this)" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" AutoPostBack="true" OnCheckedChanged="chkSelect_CheckedChanged" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="12%" />
                                            <HeaderStyle HorizontalAlign="Center" Width="12%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                        <div class="row">
                            <asp:Panel ID="pnlViewRqstDtls" Visible="false" runat="server" GroupingText="View Request Details"
                                Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                                <asp:GridView ID="gvViewRequestDtls" OnRowDataBound="gvViewRequestDtls_Databound" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Request Vault Records Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' ToolTip="S.No." />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="18px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("CHEQUE_NUMBER")%>' ToolTip="Cheque Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContractNumber" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("CHEQUE_STATUS_CODE")%>' ToolTip="Cheque Status" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHEQUE_DATE")%>' ToolTip="Cheque Date" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installment Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallmentNumber" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' ToolTip="Installment Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeAmount" runat="server" Text='<%# Eval("CHEQUE_AMNT")%>' ToolTip="Cheque Amount" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested By" Visible="false">
                                            <ItemTemplate>
                                                <%--<asp:DropDownList ID="ddlRequest" Width="100%" runat="server"></asp:DropDownList>--%>
                                                <asp:Label ID="ddlRequest" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested Date">
                                            <ItemTemplate>
                                                <%-- <asp:TextBox ID="txtRequestedDate" Width="80px" runat="server" Text='<%# Eval("REQUEST_DATE")%>' />--%>
                                                <asp:Label ID="txtRequestedDate" runat="server" Text='<%# Eval("REQUEST_DATE")%>' ToolTip="Cheque Amount" />
                                                <%--<asp:Image ID="imgDate" runat="server" ImageUrl="~/Images/calendaer.gif" />
                                                            <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="True"
                                                                PopupButtonID="imgDate" OnClientDateSelectionChanged="checkDate_NextSystemDate_Inline" TargetControlID="txtRequestedDate">
                                                            </cc1:CalendarExtender>--%>
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
                                <uc1:PageNavigator ID="ucCustomPaging" runat="server"></uc1:PageNavigator>
                            </asp:Panel>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <asp:Panel ID="pnlRetVaultOption" GroupingText="Cheques Request to Vault option"
                        Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0" runat="server">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:DropDownList ID="ddlRequestf" runat="server" class="md-form-control form-control"></asp:DropDownList>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label class="tess">
                                        <asp:Label ID="lblRequest" runat="server" Text="Request By" CssClass="styleDisplayLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                <div class="md-input">
                                    <asp:TextBox ID="txtReason" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                    <span class="highlight"></span>
                                    <span class="bar"></span>
                                    <label>
                                        <asp:Label ID="lblRequestReason" runat="server" Text="Request Reason" CssClass="styleReqFieldLabel"></asp:Label>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <%--  <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">--%>
                        <%-- <div align="right">
                                    <button class="css_btn_enabled" id="btnsaveRV" title="Save[Alt+S]" onclick="if(CheckMandatory(this))" causesvalidation="false"
                                        onserverclick="btnSave_Click" runat="server" type="button" accesskey="S">
                                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                    </button>
                                </div>--%>
                    </asp:Panel>
                </div>
            </div>
            <div class="btn_height"></div>
            <div align="right">
                <%-- <button class="css_btn_enabled" id="btnGo" title="Go[Alt+G]" onserverclick="btnGo_Click"
                        runat="server" type="button" accesskey="G" validationgroup="Go">
                        <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                    </button>--%>
                <button class="css_btn_enabled" id="btnApproval" onserverclick="btnSave_Click" runat="server" title="Approve,Alt+A"
                    type="button" accesskey="A" onclick="if(fnConfirmApprove())" causesvalidation="false">
                    <i class="fa fa-check-circle" aria-hidden="true"></i>&emsp;<u>A</u>pprove
                </button>
                <button class="css_btn_enabled" id="btnCancelApprove" onserverclick="btnSave_Click" runat="server" title="Reject,Alt+J"
                    type="button" accesskey="J" onclick="if(fnConfirmCancelApprove())" causesvalidation="false">
                    <i class="fa fa-times" aria-hidden="true"></i>&emsp;Re<u>j</u>ect
                </button>

                <button class="css_btn_enabled" id="btnHandOver" onserverclick="btnSave_Click" runat="server" title="Handover,Alt+O"
                    type="button" accesskey="O" onclick="if(fnConfirmHandover())" causesvalidation="false">
                    <i class="fa fa-hand-holding" aria-hidden="true"></i>&emsp;Hand<u>o</u>ver
                </button>
                <button class="css_btn_enabled" id="btnReject" onserverclick="btnSave_Click" runat="server" title="Reject, Alt+R"
                    type="button" accesskey="R" onclick="if(fnConfirmReject())" causesvalidation="false">
                    <i class="fa fa-thumbs-down" aria-hidden="true"></i>&emsp;<u>R</u>eject
                </button>

                <button class="css_btn_enabled" id="btnAck" onserverclick="btnSave_Click" runat="server" title="Acknowledge, Alt+K"
                    type="button" accesskey="K" onclick="if(fnConfirmAck())" causesvalidation="false">
                    <i class="fa fa-thumbs-UP" aria-hidden="true"></i>&emsp;Ac<u>k</u>nowledge
                </button>
                <button class="css_btn_enabled" id="btnsaveRV" title="Save[Alt+S]" onclick="if(fnCheckPageValidators())" causesvalidation="false"
                    onserverclick="btnSave_Click" runat="server" type="button" accesskey="S">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnAcknowlegement" title="Acknowledgement[Alt+W]" onclick="if(fnConfirmAck())" causesvalidation="false"
                    onserverclick="btnSave_Click" runat="server" type="button" accesskey="W">
                    <i class="fa fa-thumbs-up" aria-hidden="true"></i>&emsp;Ackno<u>w</u>ledgement
                </button>
                <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                    type="button" accesskey="S" onclick="if(fnCheckPageValidators())">
                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                </button>
                <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                    type="button" accesskey="L">
                    <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                </button>
                <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" onserverclick="btnCancel_ServerClick" causesvalidation="false" runat="server"
                    type="button" accesskey="X">
                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                </button>
            </div>
            <div class="row" style="margin-top: 10px; align-content: center">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <%--Hidden fields for grid usage--%>
                    <input type="hidden" id="hdnSortDirection" runat="server" />
                    <input type="hidden" id="hdnSortExpression" runat="server" />
                    <input type="hidden" id="hdnSearch" runat="server" />
                    <input type="hidden" id="hdnOrderBy" runat="server" />
                </div>
            </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="btnModal"
        PopupControlID="PnlShowAccountStatus" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>

    <asp:Panel ID="PnlShowAccountStatus" Style="display: none; vertical-align: middle" runat="server" CssClass="stylePanel"
        BorderStyle="Solid" BackColor="White" Width="850px" GroupingText="Account Status information">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="gird" id="divAcc" runat="server" style="height: 250px; width: 100%">
                                <asp:GridView ID="grvChequeAccountDetails" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" EmptyDataText="No Records Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="2px" />
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Cheque Current Stage" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("ACCOUNT_STAGE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Cheque No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("Cheque_Number")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHQ_DATE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installment No">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Request by">
                                            <ItemTemplate>
                                                <asp:Label ID="lblREQUESTED_BY" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved By/Rejected By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAPPROVED_BY" runat="server" Text='<%# Eval("APPROVED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Handing Over Cheque to DC By/Rejected By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHOV_BY" runat="server" Text='<%# Eval("HOV_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Handing Over Cheque to DC Acknowledged By  ">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHOV_ACK_BY" runat="server" Text='<%# Eval("HOV_ACK_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DC Send back the cheques to Accounts Dept By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCHQ_RV_BY" runat="server" Text='<%# Eval("CHQ_RV_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Accounts Dept confirmed cheque received from DC By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCHQ_RV_ACK" runat="server" Text='<%# Eval("CHQ_RV_ACK")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <button class="css_btn_enabled" id="btnDEVModalCancel" title="Exit[Alt+I]" causesvalidation="false"
                                onserverclick="btnCloseBreakUpModelPop_Click" runat="server" type="button" accesskey="I">
                                <i class="fa fa-share" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnModal" Style="display: none" runat="server" />
    </asp:Panel>

</asp:Content>

