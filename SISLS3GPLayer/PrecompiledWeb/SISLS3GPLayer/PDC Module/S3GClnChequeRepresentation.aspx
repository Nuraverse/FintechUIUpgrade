<%@ page title="" language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnChequeRepresentation, App_Web_k0kfymif" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        function fnTrashSuggest(e) {
            //Sathish R--13-11-2018
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_txtItemName').value = "";
            }
            if (document.getElementById(e + '_txtItemName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {

                if (document.getElementById(e + '_txtItemName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_txtItemName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
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
                alert("Select at least Cheques to Proceed");
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
            //debugger;
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
                            <asp:Panel GroupingText="Query" ID="pnlQuery" runat="server" Width="100%" Visible="false"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <%--   <asp:Button ID="btnViewRequest" runat="server" CssClass="styleSubmitButton" OnClick="btnViewRequest_OnClick"
                                                ToolTip="Show, Alt+H" AccessKey="H" Width="80px" Text="Show" />--%>
                                            <%--<button class="css_btn_enabled" id="btnViewRequest" title="Show [Alt+H]" causesvalidation="false"
                                                onserverclick="btnViewRequest_OnClick" runat="server"
                                                type="button" accesskey="H">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow 
                                            </button>
                                            <button class="css_btn_enabled" id="btnHide" title="Hide [Alt+E]" causesvalidation="false"
                                                onserverclick="btnHide_ServerClick" runat="server"
                                                type="button" accesskey="H">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;Hid<u>e</u>
                                            </button>--%>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel GroupingText="Account Status" ID="Panel1" runat="server" Width="100%" Visible="false"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountStatus" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"
                                                OnTextChanged="txtAccountStatus_TextChanged" runat="server"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblAccountStatus" runat="server" Text="Check Account Status" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                            <%--  <cc1:TextBoxWatermarkExtender ID="txtAccountStatusWM" runat="server" TargetControlID="txtAccountStatus"
                                                WatermarkText="--Enter the Account No--">
                                            </cc1:TextBoxWatermarkExtender>--%>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel GroupingText="Search Criteria" ID="pnlUploadDetails" runat="server" Width="100%"
                                CssClass="stylePanel">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:DropDownList ID="ddlLineofBusiness" runat="server" OnSelectedIndexChanged="ddlLineofBusiness_SelectedIndexChanged"
                                                AutoPostBack="true" ToolTip="Line of Business" class="md-form-control form-control">
                                            </asp:DropDownList>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lblLineOfBusiness" runat="server" Text="Line of Business" ToolTip="Line of Business" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                            <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvLineOfBusiness" runat="server" Display="Dynamic"
                                                    ControlToValidate="ddlLineofBusiness" ValidationGroup="Go" InitialValue="0"
                                                    ErrorMessage="Select the Line of Business" CssClass="validation_msg_box_sapn"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12 styleFieldLabel">
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
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divaccno" runat="server" visible="false">
                                        <div class="md-input">
                                            <uc:Suggest ID="ddlContractNum" ToolTip="Account Number" IsMandatory="true"
                                                runat="server" AutoPostBack="true" ServiceMethod="GetContractNumber"
                                                class="md-form-control form-control" ValidationGroup="Go" ErrorMessage="Select a Account Number" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblContractNum" runat="server" Text="Account Number" CssClass="styleReqFieldLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                ValidationGroup="Go" strLOV_Code="ACC_CHQREP" ServiceMethod="GetAccuntNoList" class="md-form-control form-control" />
                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                Style="display: none" />
                                            <%-- <asp:Button ID="btnAccountHistory" runat="server" Text="Account History" CausesValidation="false" UseSubmitBehavior="false"
                                                 OnClick="btnAccountHistory_Click" />--%>
                                            <asp:LinkButton ID="btnAccountHistory" runat="server" Text="Account History" Enabled="false" AccessKey="V"
                                                ToolTip="Account History, Alt+V" OnClick="btnAccountHistory_Click" Style="color: red; text-underline-position: below;"></asp:LinkButton>

                                            <asp:TextBox ID="txtaccNo" runat="server" Style="display: none;" MaxLength="50" ToolTip="Account Number"
                                                class="md-form-control form-control login_form_content_input requires_true"
                                                ValidationGroup="Go">  </asp:TextBox>
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
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCust()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                Enabled="false" class="md-form-control form-control" strLOV_Code="CUS_COM" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" />
                                            <asp:Button ID="btnLoadCust" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCust_Click"
                                                Style="display: none" Enabled="false" />
                                            <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" MaxLength="50" ToolTip="Customer Name/Code"
                                                class="md-form-control form-control login_form_content_input requires_true" Enabled="false"
                                                ValidationGroup="Go">  </asp:TextBox>
                                            <asp:HiddenField ID="hdnCustomerID" runat="server" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label3" CssClass="styleDisplayLabel" runat="server" Text="Customer Name/Code"></asp:Label></td>
                                            </label>
                                            <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvCustCode" runat="server" ControlToValidate="txtCustomerCode"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Select a Customer Name/Code" ValidationGroup="Go"></asp:RequiredFieldValidator>
                                            </div>--%>
                                        </div>
                                    </div>



                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divcustcode" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtCustomer" ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label runat="server" Text="Customer Code" ID="lblCustomerCode">
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divcustname" runat="server" visible="false">
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
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc:Suggest ID="ddlReceiptNo" ToolTip="Receipt Number" runat="server" AutoPostBack="true"
                                                OnItem_Selected="ddlReceiptNo_Item_Selected" ServiceMethod="GetReceiptNo"
                                                ErrorMessage="Select a Receipt Number" class="md-form-control form-control" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label1" runat="server" Text="Receipt Number" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <uc:Suggest ID="ddlInstrumentNo" ToolTip="Cheque Number" runat="server" AutoPostBack="true"
                                                OnItem_Selected="ddlInstrumentNo_Item_Selected" ServiceMethod="GetInstrumnentNo"
                                                ErrorMessage="Select a Cheque Number" class="md-form-control form-control" />
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="Label2" runat="server" Text="Cheque Number" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divDate" runat="server" visible="false">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtEffectiveFromDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                ToolTip="Requested Date"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtenderEffectiveFromDate" runat="server" Enabled="True"
                                                TargetControlID="txtEffectiveFromDate">
                                            </cc1:CalendarExtender>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblEffectiveFrom" runat="server" Text="Requested Date" ToolTip="Requested Date" />
                                            </label>
                                            <%-- <div class="validation_msg_box">
                                                <asp:RequiredFieldValidator ID="rfvFromDate" runat="server" ControlToValidate="txtEffectiveFromDate"
                                                    CssClass="validation_msg_box_sapn" Display="Dynamic" SetFocusOnError="True"
                                                    ErrorMessage="Select a Requested Date" ValidationGroup="Go"></asp:RequiredFieldValidator>
                                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <button class="css_btn_enabled" id="btnGo" title="Go[Alt+G]" onserverclick="btnGo_Click"
                                                runat="server" type="button" accesskey="G" validationgroup="Go">
                                                <i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&emsp;<u>G</u>o
                                            </button>
                                            <%--</div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">--%>
                                            <button class="css_btn_enabled" id="btnViewRequest" title="Show [Alt+H]" causesvalidation="false"
                                                onserverclick="btnViewRequest_OnClick" runat="server" visible="false"
                                                type="button" accesskey="H">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;S<u>h</u>ow 
                                            </button>
                                            <%--  </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                                        <div class="md-input">--%>
                                            <button class="css_btn_enabled" id="btnHide" title="Hide [Alt+Shift+E]" causesvalidation="false"
                                                onserverclick="btnHide_ServerClick" runat="server" visible="false"
                                                type="button" accesskey="E">
                                                <i class="fa fa-list" aria-hidden="true"></i>&emsp;Hid<u>e</u>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>

                <%-- <asp:Button ID="Button1" runat="server" CssClass="styleSubmitButton" OnClick="btnGo_Click" Width="80px"
                            ToolTip="Go, Alt+G" AccessKey="G" Text="Go" ValidationGroup="btnGo" />
                        <asp:Button ID="Button2" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClientClick="return fnConfirmClear();"
                            ToolTip="Clear, Alt+L" AccessKey="L" Width="80px" OnClick="btnClear_Click" Text="Clear" />
                        <asp:Button ID="Button3" runat="server" CssClass="styleSubmitButton" OnClick="btnSave_Click" OnClientClick="return fnCheckPageValidators();"
                            ToolTip="Save, Alt+S" AccessKey="S" Width="80px" Text="Save" />
                        <asp:Button ID="Button4" runat="server" CausesValidation="False" CssClass="styleSubmitButton" OnClientClick="parent.RemoveTab();"
                            ToolTip="Exit, Alt+X" AccessKey="X" Width="80px" Text="Exit" />--%>
                <%--                    <asp:ValidationSummary ID="VlmSummery" CssClass="styleMandatoryLabel"
                        HeaderText="Correct the following validation(s):" Visible="true" ShowMessageBox="false" ValidationGroup="btnGo" runat="server" />--%>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divdraweebank" runat="server" visible="false">
                                <div class="md-input">
                                    <uc:Suggest ID="txtDraweeBank" Visible="false" ToolTip="Drawee Bank" runat="server" AutoPostBack="true" ServiceMethod="GetDraweeBank"
                                        class="md-form-control form-control" ValidationGroup="submit" ErrorMessage="Select a Drawee Bank" />
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
                            <asp:Panel ID="pnlChequeRequestForVault" runat="server" GroupingText="Cheque Details"
                                Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                                <asp:GridView ID="gvChequeReqforVault" OnRowDataBound="gvChequeReqforVault_Databound" runat="server" AutoGenerateColumns="false"
                                    RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Details Found">
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
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("RECEIPT_NO")%>' ToolTip="Receipt Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Status" Visible="false">
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
                                                <asp:Label ID="lblReceipt" runat="server" Text='<%# Eval("Receipt_Number")%>' ToolTip="Receipt Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Return ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnID" runat="server" Text='<%# Eval("Cheque_Return_ID")%>' ToolTip="Cheque Return ID" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="Account Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContractNum" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' ToolTip="Account Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="CheckLinkkey">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCheckLinkKey" runat="server" Text='<%# Eval("CHQVLT_LNK_KEY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested By" Visible="false">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlRequest" runat="server"></asp:DropDownList>
                                                <asp:Label ID="lblRequestedBy" Visible="false" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested Date">
                                            <ItemTemplate>
                                                <%--   <asp:Label ID="txtRequestedDate" runat="server" Text='<%# Eval("REQUEST_DATE")%>' />--%>
                                                <asp:TextBox ID="txtRequestedDate" Width="80px" runat="server" Enabled="true" ToolTip="Requested Date"
                                                    class="md-form-control form-control login_form_content_input requires_true" Text='<%# Eval("REQUEST_DATE")%>' />
                                                <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="true"
                                                    OnClientDateSelectionChanged="checkDate_NextSystemDate_Inline" TargetControlID="txtRequestedDate">
                                                </cc1:CalendarExtender>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ReqCmp Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtReqCmpDate" Width="80px" runat="server" Enabled="true" ToolTip="Requested Date"
                                                    OnTextChanged="txtReqCmpDate_TextChanged"
                                                    class="md-form-control form-control login_form_content_input requires_true" Text='<%# Eval("REQCMP_DATE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Max Requested Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtmaxreqDate" Width="80px" runat="server" Enabled="true" ToolTip="Max Requested Date"
                                                    class="md-form-control form-control login_form_content_input requires_true" Text='<%# Eval("LAST_REQ_DATE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Return value Date" Visible="false">
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtcheqDate" Width="80px" runat="server" Enabled="true" ToolTip="Cheque Return value Date"
                                                    OnTextChanged="txtReqCmpDate_TextChanged"
                                                    class="md-form-control form-control login_form_content_input requires_true" Text='<%# Eval("D_CHEQUEDATE")%>' />
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
                                                <asp:CheckBox ID="ChkSelectAll" Text="Select All" OnClick="selectAll(this)" runat="server" ToolTip="Select" />
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
                            <asp:Panel ID="pnlViewRqstDtls" Visible="false" runat="server" GroupingText="View Representation Details"
                                Width="100%" CssClass="stylePanel" BorderColor="#77B6E9" BorderWidth="0">
                                <asp:GridView ID="gvViewRequestDtls" OnRowDataBound="gvViewRequestDtls_Databound" runat="server" AutoGenerateColumns="false" RowStyle-HorizontalAlign="Center" Width="100%" EmptyDataText="No Cheque Representation Records Found">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeReturnVault" runat="server" Text='<%# Eval("SNO")%>' ToolTip="S.No." />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="18px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("CHEQUE_NUMBER")%>' ToolTip="Cheque Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceipt" runat="server" Text='<%# Eval("RECEIPT_NO")%>' ToolTip="Receipt Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblContractNumber" runat="server" Text='<%# Eval("CONTRACT_NUM")%>' ToolTip="Account Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Status" Visible="false">
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
                                        <asp:TemplateField HeaderText="Receipt Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNo" runat="server" Text='<%# Eval("Receipt_Number")%>' ToolTip="Receipt Number" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeAmount" runat="server" Text='<%# Eval("CHEQUE_AMNT")%>' ToolTip="Cheque Amount" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested By" Visible="false">
                                            <ItemTemplate>
                                                <asp:DropDownList ID="ddlRequest" Width="100%" runat="server"></asp:DropDownList>
                                                <asp:Label ID="lblRequestedBy" Visible="false" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Requested Date">
                                            <ItemTemplate>
                                                <%-- <asp:TextBox ID="txtRequestedDate" Width="80px" runat="server" Enabled="false"  ToolTip="Requested Date"
                                                    Text='<%# Eval("REQUEST_DATE")%>' />--%>
                                                <asp:Label ID="txtRequestedDate" runat="server" Text='<%# Eval("REQUEST_DATE")%>' ToolTip="Requested Date" />
                                                <%-- <cc1:CalendarExtender ID="ACERequestedDate" runat="server" Enabled="false"
                                                    PopupButtonID="imgDate" OnClientDateSelectionChanged="checkDate_NextSystemDate_Inline" TargetControlID="txtRequestedDate">
                                                </cc1:CalendarExtender>--%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("Receipt_Number")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="false" HeaderText="Select">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="ChkSelectAll" Text="Select All" OnClick="selectAll(this)" runat="server" ToolTip="Select" />
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
                            <asp:Panel ID="pnlRetVaultOption" GroupingText="Cheque Representation"
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
                                            <asp:TextBox ID="txtReason" runat="server" MaxLength="100"
                                                class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label>
                                                <asp:Label ID="lblRequestReason" runat="server" Text="Request Reason" CssClass="styleDisplayLabel"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" id="divsave" runat="server" visible="false">
                                        <div class="md-input">
                                            <%--<div align="right" class="fixed_btn">--%>
                                            <button class="css_btn_enabled" id="btnsaveRV" title="Save[Alt+S]" onclick="if(CheckMandatory(this))" causesvalidation="false"
                                                onserverclick="btnSave_Click" runat="server" type="button" accesskey="S">
                                                <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                                            </button>
                                            <%-- </div>--%>
                                            <%--  <asp:Button ID="btnsaveRV" runat="server" OnClientClick="return CheckMandatory(this)" CssClass="styleSubmitButton"
                                    ToolTip="Save, Alt+S" AccessKey="S" OnClick="btnSave_Click" Width="80px" Text="Save" />--%>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="btn_height"></div>
                <div align="right">
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" causesvalidation="false" onclick="if(fnCheckPageValidators())" onserverclick="btnSave_Click" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
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
                        <i class="fa fa-thumbs-up" aria-hidden="true"></i>&emsp;Ac<u>k</u>nowledge
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
                                        <%--   <asp:TemplateField HeaderText="Cheque Current Stage" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeNumber" runat="server" Text='<%# Eval("ACCOUNT_STAGE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Cheque Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeStatus" runat="server" Text='<%# Eval("Cheque_Number")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Receipt Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNO" runat="server" Text='<%# Eval("RECEIPT_NO")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="12%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeDate" runat="server" Text='<%# Eval("CHQ_DATE")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Installment Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstallmentNo" runat="server" Text='<%# Eval("INSTALLMENT_NUMBER")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="15%" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Receipt Number" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblReceiptNumber" runat="server" Text='<%# Eval("RECEIPT_ID")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="12%" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Request by">
                                            <ItemTemplate>
                                                <asp:Label ID="lblREQUESTED_BY" runat="server" Text='<%# Eval("REQUESTED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved By / Rejected By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAPPROVED_BY" runat="server" Text='<%# Eval("APPROVED_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Approval Cancelled By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAPPROVED_BY" runat="server" Text='<%# Eval("APPROVED_CANCEL_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Handover / Rejected By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHOV_BY" runat="server" Text='<%# Eval("HOV_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="15%" />
                                        </asp:TemplateField>
                                        <%--  <asp:TemplateField HeaderText="Rejected Over to Accounts Dept By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHOV_ACK_BY" runat="server" Text='<%# Eval("HOV_REJ_BY")%>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="20%" />
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Acknowledged By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCHQ_RV_ACK" runat="server" Text='<%# Eval("Acknowledged_By")%>' />
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
                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Ex<u>i</u>t
                            </button>
                            <%-- <asp:Button ID="btnDEVModalCancel" runat="server" Text="Exit" OnClick="btnCloseBreakUpModelPop_Click"
                                ToolTip="Exit, Alt+I" AccessKey="I" class="styleSubmitButton" />--%>
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

