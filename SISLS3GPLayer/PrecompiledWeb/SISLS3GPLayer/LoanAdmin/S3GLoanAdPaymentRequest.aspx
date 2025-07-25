<%@ page language="C#" autoeventwireup="true" title="Payment Request" masterpagefile="~/Common/S3GMasterPageCollapse.master" inherits="Loan_Admin_S3GLoanAdminPaymentRequest, App_Web_yy0xp33b" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc3" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="UC6" %>
<asp:Content ID="ContentPaymentRequest" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">

    <script type="text/javascript" language="javascript">
        var btnActive_index = 0;
        var index = 0;
        function pageLoad(s, a) {
            PageLoadTabContSetFocus();
            tab = $find('ctl00_ContentPlaceHolder1_TabContainerER');
            tab.add_activeTabChanged(on_Change);
            var newindex = tab.get_activeTabIndex(index);
            btnActive_index = newindex;
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            function on_Change(sender, e) {
                if (TC.get_activeTab().get_tabIndex() != 0) {
                    fnMoveNextTab('Tab');
                }
                else {
                    tab.set_activeTabIndex(0);;
                    btnActive_index = 0;
                    return;
                }
            }

        }

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_TabContainerER_TabPanelPR_btnLoadCustomer').click();
        }
        function fnLoadAccount() {
            document.getElementById('ctl00_ContentPlaceHolder1_TabContainerER_TabPanelPR_btnLoadAccount').click();
        }
        function addcommas(input) {

            var nstr = input.value;
            nstr += '';
            var xarr = nstr.split('.');
            var x1 = xarr[0];
            var x2 = x1.length > 1 ? '.' + xarr[1] : '';

            var rgx = /(\d+)(\d{2})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            alert(x1 + x2);

        }


        function checkValueDate_NextSystemDate(sender, args) {

            // 
            var today = new Date();
            var currentyear = today.getYear();
            var currentmonth = today.getMonth() + 1;


            if (currentmonth > 3) {
                pastvalidyear = currentyear;
                futurevalidyear = currentyear + 1;

            }
            else {
                pastvalidyear = currentyear - 1;
                futurevalidyear = currentyear;

            }
            //if ((sender._selectedDate.getMonth() + 1) > currentmonth && (sender._selectedDate.getYear() == currentyear))//Future month date cannot be selected
            //{
            //    alert('You cannot select a date greater than the current month end and lesser than the current year');
            //    sender._textbox.set_Value(today.format(sender._format));
            //    return;
            //}
            //if (sender._selectedDate.getYear() == pastvalidyear || sender._selectedDate.getYear() == futurevalidyear) {
            //    if (sender._selectedDate.getYear() == futurevalidyear && (sender._selectedDate.getMonth() + 1) > 3) {
            //        alert('You cannot select a date greater than the current month end and lesser than the current year');
            //        sender._textbox.set_Value(today.format(sender._format));
            //        return;
            //    }
            //    if (sender._selectedDate.getYear() == pastvalidyear && (sender._selectedDate.getMonth() + 1) <= 3) {
            //        alert('You cannot select a date greater than the current month end and lesser than the current year');
            //        sender._textbox.set_Value(today.format(sender._format));
            //        return;
            //    }
            //}
            //else {
            //    alert('You cannot select a date greater than the current month end and lesser than the current year');
            //    sender._textbox.set_Value(today.format(sender._format));
            //    return;

            //}

        }

        function Funcheckvaliddecimal(input) {

            var Amountvalue = input.value;
            var count = 0;
            if (Amountvalue != '') {
                for (var i = 0; i < Amountvalue.length; i++) {
                    var c = Amountvalue.charAt(i);
                    if (c == '.') {
                        count++;
                    }
                }
                if (count > 1) {
                    alert('Enter a valid Decimal');
                    input.value = '';
                    input.focus();
                    return;
                }

            }
        }


        function fnConfirmSave() {

            if (confirm('Are you sure you want to save?')) {
                return true;
            }
            else
                return false;

        }


        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_TabContainerER');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            //strValgrp = "Save";
            //  Valgrp.validationGroup = strValgrp;

            var newindex = tab.get_activeTabIndex(index);
            if (Source_Invoker == 'btnNextTab') {
                newindex = btnActive_index + 1;
            }
            else if (Source_Invoker == 'btnPrevTab') {
                newindex = btnActive_index - 1;
            }
            else {
                newindex = tab.get_activeTabIndex(index);
                btnActive_index = newindex;
            }
            if (newindex > index) {
                if (!fnCheckPageValidators(strValgrp, false)) {
                    tab.set_activeTabIndex(index);
                }
                else {

                    switch (index) {
                        case 0:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;
                        case 1:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                var TC = $find("<%=TabContainerER.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 0) {
                    $get("<%=ddlLOB.ClientID %>").focus();

                }
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=ddlbankname.ClientID %>").focus();
                }

                //Focus End
            }
        }

        function PageLoadTabContSetFocus() {
            var TC = $find("<%=TabContainerER.ClientID %>");
            if (TC.get_activeTab().get_tabIndex() == 0) {
                $get("<%=ddlLOB.ClientID %>").focus();
            }
        }

        function fnTrashCommonSuggest(e) {
            if (document.getElementById(e + '_hdnSelectedValue').value == "0") {
                document.getElementById(e + '_TxtName').value = "";
                document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_TxtName').value == "") {
                document.getElementById(e + '_hdnSelectedValue').value = "0";
                document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
            }
            if (document.getElementById(e + '_txtLastSelectedText').value != "") {
                if (document.getElementById(e + '_TxtName').value.trim() !== document.getElementById(e + '_txtLastSelectedText').value.trim()) {
                    document.getElementById(e + '_TxtName').value = "";
                    document.getElementById(e + '_hdnSelectedValue').value = "0";
                    document.getElementById('<%=txtCustomerNames.ClientID %>').value = "";
                }
            }
        }

        function fnTrashSuggest(e) {
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


    </script>

    <asp:UpdatePanel ID="updPayment" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="tab-pane fade in active show">
                    <div class="row">
                        <div class="col">
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="" ID="lblHeading"> </asp:Label>
                            </h6>
                        </div>
                    </div>
                    <div>
                        <div class="row">
                            <cc1:TabContainer ID="TabContainerER" runat="server" CssClass="styleTabPanel" Width="100%"
                                ScrollBars="None">
                                <cc1:TabPanel runat="server" ID="TabPanelPR" CssClass="tabpan" BackColor="Red">
                                    <HeaderTemplate>
                                        Payment Request
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <asp:Panel ID="pnlPaymentInformation1" runat="server" ToolTip="Payment Information"
                                                        GroupingText="Payment Information" CssClass="stylePanel" Width="100%">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" runat="server" ToolTip="Line of Business" AutoPostBack="true"
                                                                            OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <asp:HiddenField ID="hdnLobCode" runat="server" />
                                                                        <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Line of Business" ID="lblLOB" CssClass="styleReqFieldLabel"
                                                                                ToolTip="Line of Business"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlLOB" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlLOB" InitialValue="0"
                                                                                ErrorMessage="Select Line of Business" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvLineOfBussiness" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlLOB" InitialValue="0"
                                                                                ErrorMessage="Select Line of Business" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" runat="server" ToolTip="Location" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Disb Location" ToolTip="Disb Location" ID="lblBranch" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlBranch" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlBranch" InitialValue="0"
                                                                                ErrorMessage="Select Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlDisLocation" runat="server" ToolTip="Disb Branch" AutoPostBack="true"
                                                                            OnSelectedIndexChanged="ddlDisLocation_SelectedIndexChanged"
                                                                            CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Disb Branch" ToolTip="Disb Branch" ID="lblDisbLocation" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDisLocation" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlDisLocation" InitialValue="0"
                                                                                ErrorMessage="Select Disb Branch" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPaymentRequestNo" ToolTip="Payment Request Number(This is an autogenerated value)"
                                                                            ReadOnly="true" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ToolTip="Payment Request Number" Text="Request No." ID="lblPaymentRequestNo"
                                                                                CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <%--<div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPaymentRequestNo" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="txtPaymentRequestNo" InitialValue=""
                                                                                ErrorMessage="Enter Request No." ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPaymentStatus" ToolTip="Payment Status" runat="server" Enabled="false" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Status" ToolTip="Payment Status" ID="lblPaymentStatus" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPaymentStatus" CssClass="validation_msg_box_sapn"
                                                                                InitialValue="0" runat="server" SetFocusOnError="True" ControlToValidate="ddlPaymentStatus"
                                                                                ErrorMessage="Select Status" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPaymentRequestDate" ToolTip="Payment Request Date" ReadOnly="false"
                                                                            runat="server" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                        <%-- <asp:Image ID="imgPaymentRequestDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderPaymentRequestDate" runat="server" Enabled="true"
                                                                            PopupButtonID="imgPaymentRequestDate" OnClientDateSelectionChanged="checkValueDate_NextSystemDate"
                                                                            TargetControlID="txtPaymentRequestDate" Format="dd/MM/YYYY">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Request Date" ToolTip="Payment Request Date" ID="lblPaymentRequestDate"
                                                                                CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPaymentDate" CssClass="validation_msg_box_sapn"
                                                                                InitialValue="" runat="server" SetFocusOnError="True" ControlToValidate="txtPaymentRequestDate"
                                                                                ErrorMessage="Enter Request Date" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtValueDate" runat="server" ToolTip="Value date" ReadOnly="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <%-- <asp:Image ID="imgValueDate" runat="server" ImageUrl="~/Images/calendaer.gif" />--%>
                                                                        <cc1:CalendarExtender ID="CalendarExtenderValueDate" runat="server" Enabled="true"
                                                                            PopupButtonID="imgValueDate" OnClientDateSelectionChanged="checkValueDate_NextSystemDate"
                                                                            TargetControlID="txtValueDate" Format="dd/MM/YYYY">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Value Date" ToolTip="Value date" ID="lblValueDate"
                                                                                CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvValueDate" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ValidationGroup="Save" ControlToValidate="txtValueDate"
                                                                                ErrorMessage="Enter Value Date"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPayMode" runat="server" ToolTip="Pay mode" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlPayMode_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Pay Mode" ToolTip="Pay mode" ID="lblPayMode" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPayMode" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlPayMode" InitialValue="0"
                                                                                ErrorMessage="Select Pay Mode" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlInstrumentType" runat="server" ToolTip="Instrument Type" Enabled="false" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Instrument Type" ToolTip="Instrument Type" ID="lbl_InstrumentType" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPayTo" runat="server" ToolTip="Pay to" AutoPostBack="True"
                                                                            OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" Enabled="false" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Pay To" ToolTip="Pay to" ID="lblPayTo" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPayTo" CssClass="validation_msg_box_sapn"
                                                                                runat="server" SetFocusOnError="True" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                                ErrorMessage="Select Pay To" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPayToOne" CssClass="validation_msg_box_sapn"
                                                                                runat="server" SetFocusOnError="True" Enabled="false" InitialValue="0" ControlToValidate="ddlPayTo"
                                                                                ErrorMessage="Select Pay To" ValidationGroup="btngo"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <UC6:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" IsMandatory="false" />
                                                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_Click"
                                                                            Style="display: none" />
                                                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerNames" runat="server" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblCustomerCode" runat="server" Text="Customer Code / Name" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerNames"
                                                                                ErrorMessage="Select a Customer/Entity" ValidationGroup="Save" Enabled="true" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="rfvcmbCustomers" runat="server" ControlToValidate="txtCustomerNames"
                                                                                ErrorMessage="Select a Customer/Entity" InitialValue="" ValidationGroup="btngo" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvBatchNo" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <uc3:Suggest ID="ddlBatchNo" runat="server" ErrorMessage="Select Invoice Batch No." ValidationGroup="GridPayment" ServiceMethod="GetBatchNo" />
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Invoice Batch No." ToolTip="Invoice Batch No." ID="lblInvoiceBatchNo"
                                                                                CssClass="styleFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="chkAccountBased" AutoPostBack="True" ToolTip="Account Based Payment"
                                                                            runat="server" OnSelectedIndexChanged="chkAccountBased_SelectedIndexChanged"
                                                                            Enabled="false" CssClass="md-form-control form-control">
                                                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                            <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="GL Based" ToolTip="Account Based Payment" ID="lblAccountBased"
                                                                                CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAccountNoDummy" runat="server" CssClass="md-form-control form-control"
                                                                            Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                        <UC6:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both" OnItem_Selected="ucAccountLov_Item_Selected"
                                                                            strLOV_Code="ACC_PYMACC" ServiceMethod="GetHeaderAccount" class="md-form-control form-control" />
                                                                        <asp:Button ID="btnLoadAccount" runat="server" Text="Load Account" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                            Style="display: none" />
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblAccountNo" Text="Account No"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddl_AccountType" runat="server" ToolTip="Account Type" Enabled="false" CssClass="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Account Type" ToolTip="Account Type" ID="Label2"
                                                                                CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <asp:CheckBox ID="ChkContractRef" AutoPostBack="true" OnCheckedChanged="ChkContractRef_CheckedChanged" runat="server" Enabled="false" />
                                                                        <asp:Label runat="server" Text="Contract Ref" ToolTip="Contract Ref" ID="lblContractRef"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <asp:Panel ID="PanelPayType" Visible="true" runat="server" ToolTip="Pay Type" GroupingText="Pay Type"
                                                        CssClass="stylePanel" Width="100%">

                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFromDate" ToolTip="From date" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtenderFromDate" PopupButtonID="imgFromDate"
                                                                        runat="server" Enabled="True" TargetControlID="txtFromDate" Format="dd/MM/YYYY">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="From date" Text="From Date" ID="lblFromDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtToDate" ToolTip="To date" runat="server"
                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:CalendarExtender ID="CalendarExtenderToDate" runat="server" Enabled="True"
                                                                        TargetControlID="txtToDate" Format="dd/MM/YYYY" PopupButtonID="imgToDate">
                                                                    </cc1:CalendarExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="To date" Text="To Date" ID="lblToDate" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlPayType" ToolTip="Pay Type" runat="server"
                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlPayType_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Pay Type" Text="Pay Type" ID="lblPayType" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <button id="btnGo" runat="server" accesskey="G" causesvalidation="false" validationgroup="btngo" class="css_btn_enabled" onserverclick="btnGo_Click" title="Go[Alt+G]" type="button">
                                                                        <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>G</u>o
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </asp:Panel>
                                                </div>
                                                <div class="row" runat="server" id="dvFacInformation" visible="false">
                                                    <asp:Panel ID="pnlFactoringAccounts" Visible="false" runat="server" ToolTip="Client Information" GroupingText="Client Information"
                                                        CssClass="stylePanel" Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDebtPurchaselimit" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDebtPurchaselimit" runat="server" CssClass="styleDisplayLabel" Text="Debt Purchase limit" ToolTip="Debt Purchase limit"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtPrepaymentLimit" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblPrepaymentLimit" runat="server" CssClass="styleDisplayLabel" Text="Prepayment Limit"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtMargin" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblMargin" runat="server" CssClass="styleDisplayLabel" Text="Margin" ToolTip="Margin"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDebtsOutstanding" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDebtsOutstanding" runat="server" CssClass="styleDisplayLabel" Text="Debts Outstanding" ToolTip="Debts Outstanding"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDebtsApproved" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDebtsApproved" runat="server" CssClass="styleDisplayLabel" Text="Debts Approved" ToolTip="Debts Approved"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtUnDebtsApproved" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblUnDebtsApproved" runat="server" CssClass="styleDisplayLabel" Text="Debts Un Approved" ToolTip="Debts Un Approved"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtOverdueInvoices" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblOverdueInvoices" runat="server" CssClass="styleDisplayLabel" Text="Overdue Invoices" ToolTip="Overdue Invoices"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDefaultInvoices" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDefaultInvoices" runat="server" CssClass="styleDisplayLabel" Text="Default Invoices" ToolTip="Default Invoices"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDrawingPower" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>

                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblDrawingPower" runat="server" CssClass="styleDisplayLabel" Text="Drawing Power" ToolTip="Drawing Power"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFundsinUse" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblFundsinUse" runat="server" CssClass="styleDisplayLabel" Text="Funds in Use" ToolTip="Funds in Use"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtAvailableFunds" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lblAvailableFunds" runat="server" CssClass="styleDisplayLabel" Text="Available Funds" ToolTip="Available Funds"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtFundsInUseAfterDis" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label ID="lbltxtFundsInUseAfterDis" runat="server" CssClass="styleDisplayLabel" Text="Funds in use after Disbursement" ToolTip="Funds in use after Disbursement"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row" runat="server" id="dvCurrency" visible="false">
                                                    <asp:Panel ID="Currency" runat="server" CssClass="stylePanel" ToolTip="Currency Informations"
                                                        GroupingText="Currency Information" Width="100%">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:DropDownList ID="ddlCurrencyCode" ToolTip="Currency Code" runat="server" AutoPostBack="true"
                                                                        OnSelectedIndexChanged="ddlCurrencyCode_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                    </asp:DropDownList>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Currency Code" ToolTip="Currency Code" ID="lblCurrencyCode"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCurrencyCode" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ControlToValidate="ddlCurrencyCode" InitialValue="0"
                                                                            ErrorMessage="Select Currency Code" ValidationGroup="Save"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtCurrencyValue" runat="server" ToolTip="Exchange Value"
                                                                        Enabled="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" Text="Currency Value" ToolTip="Currency Value" ID="lblCurrencyValue"
                                                                            CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                                <div class="md-input">
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Default Currency Code " Text="(Default Currency)"
                                                                            ID="defaultCurrency" CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txt_ExchangeValue" runat="server" ToolTip="Exchange Amount" ReadOnly="true"
                                                                        MaxLength="12"
                                                                        onfocusOut="Funcheckvaliddecimal(this);" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="ftetxt_ExchangeValue" runat="server" TargetControlID="txtDocAmount"
                                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Exchange Amount" Text="Exchange Amount" ID="lblExhange"
                                                                            CssClass="styleDisplayLabel"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDocAmount" runat="server" ToolTip="Document Amount" MaxLength="12"
                                                                        onfocusOut="Funcheckvaliddecimal(this);" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="fteDocAmount" runat="server" TargetControlID="txtDocAmount"
                                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <asp:Label ID="lbldefaultcurrencyvalue" runat="server" />
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="Document Amount" Text="Document Amount" ID="lblDocAmount"
                                                                            CssClass="styleReqFieldLabel"></asp:Label>
                                                                    </label>
                                                                    <div class="validation_msg_box">
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDocAmount" CssClass="validation_msg_box_sapn"
                                                                            runat="server" SetFocusOnError="True" ValidationGroup="Save" ControlToValidate="txtDocAmount"
                                                                            ErrorMessage="Enter Document Amount"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvFundsinUse" runat="server" visible="false">
                                                                <div class="md-input">
                                                                    <asp:TextBox ID="txtDocAfterAmount" runat="server" ToolTip="Document Amount" MaxLength="12" ReadOnly="true"
                                                                        onfocusOut="Funcheckvaliddecimal(this);" Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                    <cc1:FilteredTextBoxExtender ID="fteDocAfterAmount" runat="server" TargetControlID="txtDocAfterAmount"
                                                                        ValidChars="." FilterType="Numbers,Custom" Enabled="True">
                                                                    </cc1:FilteredTextBoxExtender>
                                                                    <span class="highlight"></span>
                                                                    <span class="bar"></span>
                                                                    <label>
                                                                        <asp:Label runat="server" ToolTip="FIU after Transaction" Text="FIU after Transaction" ID="lblAfterTran"
                                                                            CssClass="styleFieldLabel"></asp:Label>
                                                                        <asp:Label runat="server" ToolTip="FIU after Transaction" Text="" ID="lblFundsinUseAll"
                                                                            CssClass="styleFieldLabel" Visible="false"></asp:Label>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <asp:Panel ID="PanelPaymentDetails" Width="100%" runat="server"
                                                            GroupingText="Payment Details" CssClass="stylePanel">
                                                            <div class="gird" style="max-height: 450px; overflow-y: scroll;">
                                                                <asp:GridView runat="server" ShowFooter="true" ID="grvPaymentDetails" Width="100%"
                                                                    OnRowDataBound="grvPaymentDetails_RowDataBound" Visible="true"
                                                                    OnRowDeleting="grvPaymentDetails_RowDeleting" RowStyle-HorizontalAlign="Center"
                                                                    AutoGenerateColumns="False" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccountNumber" ToolTip="Account Number" runat="server"
                                                                                    Text='<%#Eval("PANum")%>' Visible="false"></asp:Label>
                                                                                <asp:LinkButton ID="lblPrimeAccountNumber" ToolTip="Account Number"
                                                                                    runat="server" Text='<%#Eval("PANum")%>' CausesValidation="false" Style="color: red; text-underline-position: below;" OnClick="lblMLA_Number_Click"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <uc3:Suggest ID="ddlFooterPrimeAccountNumber" Width="150px" OnItem_Selected="ddlFooterPrimeAccountNumber_SelectedIndexChanged"
                                                                                        AutoPostBack="true" runat="server" ErrorMessage="Enter Account Number" ValidationGroup="GridPayment" ServiceMethod="GetPANum" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sub Account Number" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSubAccountNumber" ToolTip="Sub Account Number" runat="server"
                                                                                    Text='<%#Eval("SANum")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlFooterSubAccountNumber" ToolTip="Sub Account Number" AutoPostBack="true"
                                                                                        runat="server" OnSelectedIndexChanged="ddlFooterSubAccountNumber_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PayTypeCode" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPayTypeID" Text='<%#Eval("PayTypeID")%>' runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%-- Cash Flow Type from Cash flow master --%>
                                                                        <asp:TemplateField HeaderText="Pay Type">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblFlowType" ToolTip="Pay Type" runat="server" Text='<%#Eval("Flow_Type")%>'></asp:Label>
                                                                                <asp:HiddenField ID="hndPayTypeID" runat="server" Value='<%#Eval("CashFlow_ID")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlFooterFlowType" ToolTip="Pay Type" runat="server"
                                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlFooterFlowType_SelectedIndexChanged"
                                                                                        CssClass="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterFlowType" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" ValidationGroup="GridPayment" runat="server" ControlToValidate="ddlFooterFlowType"
                                                                                            InitialValue="0" ErrorMessage="Select Pay Type"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%-- Ref Document No  --%>
                                                                        <asp:TemplateField HeaderText="Ref Document No" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblRefDocNo" ToolTip="Referance Document Number(Asset Verification)"
                                                                                    runat="server" Text='<%#Eval("RefDocNo")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlFooterRefDocNo" Width="125px" ToolTip="Referance Document Number(Asset Verification)"
                                                                                        runat="server" OnSelectedIndexChanged="ddlFooterRefDocNo_OnSelectedIndexChanged"
                                                                                        CssClass="md-form-control form-control"
                                                                                        AutoPostBack="true">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterRefDocNo" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" ValidationGroup="GridPayment" runat="server" ControlToValidate="ddlFooterRefDocNo"
                                                                                            InitialValue="0" Enabled="false" ErrorMessage="Select Ref Document No"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%--Asset Master - Asset Information--%>
                                                                        <asp:TemplateField HeaderText="DIM 2ID" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblDIM2ID" ToolTip="Asset Information" runat="server"
                                                                                    Text='<%#Eval("Asset_ID")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Asset or Invoice Number">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lblDIM2" ToolTip="Asset or Invoice Information" runat="server" Style="color: red; text-underline-position: below;" Text='<%#Eval("Asset")%>' CausesValidation="false" AccessKey="I" OnClick="btnFtRef_Click"></asp:LinkButton>
                                                                                <asp:HiddenField ID="hndAssetID" runat="server" Value='<%#Eval("Asset_ID")%>' />
                                                                                <%--<i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                                <asp:Button ID="btnastRef" Width="30px" runat="server"
                                                                                    CssClass="grid_btn" Text=".." ToolTip="Ref the Details, Alt+I" CausesValidation="false" AccessKey="I" OnClick="btnFtRef_Click"></asp:Button>--%>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <table>
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <div class="md-input">
                                                                                                        <asp:DropDownList ID="ddlFooterDIM2" Width="200px" ToolTip="Asset Information" runat="server" AutoPostBack="true"
                                                                                                            OnSelectedIndexChanged="ddlFooterDIM2_OnSelectedIndexChanged" CssClass="md-form-control form-control">
                                                                                                        </asp:DropDownList>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                        <div class="grid_validation_msg_box">
                                                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterDIM2" CssClass="validation_msg_box_sapn"
                                                                                                                SetFocusOnError="True" ValidationGroup="GridPayment" runat="server" ControlToValidate="ddlFooterDIM2"
                                                                                                                InitialValue="0" ErrorMessage="Select Asset or Invoice Number"></asp:RequiredFieldValidator>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <asp:Button ID="btnFtAdd" runat="server"
                                                                                                        CssClass="btn_5" Text=".." ToolTip="Ref the Details, Alt+V" AccessKey="V" Enabled="false" CausesValidation="false"
                                                                                                        OnClick="btnFtAdd_Click"></asp:Button>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </thead>
                                                                                    </table>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                            <ItemStyle HorizontalAlign="Left" />
                                                                        </asp:TemplateField>
                                                                        <%--<asp:TemplateField HeaderText="Invoice Number"
                                                                            Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lblInvoice" ToolTip="Asset Information" runat="server"
                                                                                    Text='<%#Eval("Asset")%>' AccessKey="F" CausesValidation="false" OnClick="lblInvoice_Click"></asp:LinkButton>
                                                                                <asp:HiddenField ID="hndInvoiceID" runat="server" Value='<%#Eval("Asset_ID")%>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlInvoice" ToolTip="Invoice" runat="server" AutoPostBack="true"
                                                                                        OnSelectedIndexChanged="ddlFooterDIM2_OnSelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input">
                                                                                    </asp:DropDownList>
                                                                                    <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                                    <asp:Button ID="btnftInvoiceAdd" runat="server"
                                                                                        CssClass="grid_btn" Text=".." ToolTip="Ref the Details, Alt+E" AccessKey="E"
                                                                                        CausesValidation="false" OnClick="btnftInvoiceAdd_Click" Visible="false"></asp:Button>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RFVInvoice" CssClass="validation_msg_box_sapn"
                                                                                            SetFocusOnError="True" ValidationGroup="GridPayment" runat="server" ControlToValidate="ddlInvoice"
                                                                                            InitialValue="0" ErrorMessage="Select Invoice Number"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>--%>
                                                                        <%-- GL Account --%>
                                                                        <asp:TemplateField HeaderText="GL Account" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPaydtlGLCode" ToolTip="GL Account" runat="server" Text='<%#Eval("GL_Code")%>' Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblPaydtlGLCodeDesc" ToolTip="GL Description" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlFooterGL_Code" Width="220px" ToolTip="GL Account" runat="server"
                                                                                        AutoPostBack="true" OnSelectedIndexChanged="ddlFooterGL_Code_SelectedIndexChanged" CssClass="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvddlFooterGL_Code" runat="server" ControlToValidate="ddlFooterGL_Code"
                                                                                            SetFocusOnError="True" ValidationGroup="GridPayment" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                                            Display="Dynamic" ErrorMessage="Select GL Account"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%-- SL Account --%>
                                                                        <asp:TemplateField HeaderText="SL Account" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPaydtlSL_Code" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Code")%>' Visible="false"></asp:Label>
                                                                                <asp:Label ID="lblPaydtlSL_CodeDesc" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <uc3:Suggest ID="ddlFooterSL_Code" runat="server" Width="150px" ServiceMethod="GetSLCodes" ToolTip="SL Account" />
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%-- Description --%>
                                                                        <asp:TemplateField HeaderText="Narration">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblDescription" ToolTip="Description" runat="server"
                                                                                    TextMode="MultiLine" MaxLength="100" onkeyup="maxlengthfortxt(100);" Text='<%#Eval("Description")%>'
                                                                                    AutoPostBack="true" OnTextChanged="Desc_TextChanged" class="md-form-control form-control login_form_content_input lowercase"> </asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtFooterDescription" Width="300px" ToolTip="Description" TextMode="MultiLine"
                                                                                        MaxLength="100" onkeyup="maxlengthfortxt(100);" runat="server"
                                                                                        Wrap="true" class="md-form-control form-control login_form_content_input lowercase"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Invoice Amount" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtInvoiceAmount" ToolTip="Amount" Style="text-align: right"
                                                                                    MaxLength="12" runat="server" Text='<%#Eval("InvoiceAmount")%>' ReadOnly="true"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtFInvoiceAmount" ToolTip="Amount" Style="text-align: right"
                                                                                        MaxLength="12" runat="server" ReadOnly="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="PPL of Invoice" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtEligibleAmount" ToolTip="Amount" Style="text-align: right"
                                                                                    MaxLength="12" runat="server" Text='<%#Eval("EligibleAmount")%>' ReadOnly="true"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtFEligibleAmount" ToolTip="Amount" Style="text-align: right"
                                                                                        MaxLength="12" runat="server" ReadOnly="true"
                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <%-- Amount --%>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Amount">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="lblAmount" ToolTip="Amount" Style="text-align: right"
                                                                                    MaxLength="12" runat="server" Text='<%#Eval("Amount")%>' AutoPostBack="true"
                                                                                    OnTextChanged="Desc_TextChanged" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <asp:Label ID="lblActualAmount" runat="server" Text='<%#Eval("ActualAmount")%>'
                                                                                    Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:TextBox ID="txtFooterAmount" onchange="fnthousands_separators(this,1)" ToolTip="Amount" runat="server" Width="150px" MaxLength="12"
                                                                                        Style="text-align: right" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <asp:Label ID="lblFooterActualAmount" runat="server" Visible="false"></asp:Label>
                                                                                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtFooterAmount"
                                                                                        FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="grid_validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                                            SetFocusOnError="True" ValidationGroup="GridPayment" CssClass="validation_msg_box_sapn"
                                                                                            Display="Dynamic" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Select">
                                                                            <HeaderTemplate>
                                                                                <asp:CheckBox ID="chkAll" runat="server" ToolTip="Select All" Text="Select All" AutoPostBack="true" OnCheckedChanged="chkAll_CheckedChanged" />
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSelAccount" runat="server" AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("Is_Check")) %>' OnCheckedChanged="chkSelAccount_OnCheckedChanged" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%-- Action --%>
                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="lnkRemove" runat="server"
                                                                                    CausesValidation="false" CssClass="grid_btn_delete"
                                                                                    CommandName="Delete" Text="Remove" ToolTip="Remove from the grid, Alt+R" AccessKey="R"
                                                                                    OnClientClick="return confirm('Are you sure you want to Remove this record?');"></asp:Button>
                                                                                <asp:Button ID="btnAddAdjust" ValidationGroup="GridPayment"
                                                                                    runat="server" Text="Adj" CausesValidation="false"
                                                                                    CssClass="grid_btn" ToolTip="Add from the grid, Alt+4" AccessKey="4" OnClick="btnAddAdjust_Click"></asp:Button>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <button class="css_btn_enabled" id="lnkAdd" onserverclick="lnkAdd_Click" runat="server"
                                                                                        type="button" accesskey="A" title="Add the Details[Alt+A]" validationgroup="GridPayment">
                                                                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                                    </button>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle CssClass="styleGridHeader" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                </div>
                                                <div class="row" style="float: right; padding-right: 7%;">
                                                    <asp:Label ID="lblAmount" CssClass="styleDisplayLabel" runat="server" Text="Sub-Total : " Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="lblPaymentDetailsTotal" ToolTip="Total amount of payment details grid"
                                                        CssClass="styleDisplayLabel" runat="server" Text="0" Font-Bold="True"></asp:Label>
                                                </div>
                                                <asp:Panel ID="PanelPaymentAdjustment" ToolTip="Payment Adjustment Informations"
                                                    Width="100%" runat="server" GroupingText="Payment Adjustment" CssClass="stylePanel">
                                                    <div class="row" runat="server" visible="false" id="dvAdjustments">
                                                        <asp:Panel ID="pnlAdjustments" Visible="true" runat="server" ToolTip="Adjustment Details" GroupingText="Adjustment Details"
                                                            CssClass="stylePanel" Width="100%">
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAdjustmentFrom" ToolTip="From date" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calAdjustfrom" PopupButtonID="imgFromDate"
                                                                            runat="server" Enabled="True" TargetControlID="txtAdjustmentFrom" Format="dd/MM/YYYY">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ToolTip="From date" Text="From Date" ID="lblAdjustmentFrom" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtAdjustmentTo" ToolTip="To date" runat="server"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calAdjustmentTo" runat="server" Enabled="True"
                                                                            TargetControlID="txtAdjustmentTo" Format="dd/MM/YYYY" PopupButtonID="imgToDate">
                                                                        </cc1:CalendarExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ToolTip="To date" Text="To Date" ID="lblAdjustmentTo" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlAddorLessValue" ToolTip="Add Or Less" runat="server"
                                                                            CssClass="md-form-control form-control">
                                                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                            <%--<asp:ListItem Value="1">Add</asp:ListItem>--%>
                                                                            <asp:ListItem Value="2">Less</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ToolTip="Pay Type" Text="Add Or Less" ID="Label5" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">

                                                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvAddorLessValue" CssClass="validation_msg_box_sapn"
                                                                                SetFocusOnError="True" runat="server" ControlToValidate="ddlAddorLessValue" InitialValue="0"
                                                                                ErrorMessage="Select Add Or Less" ValidationGroup="btnadjusts"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <button id="btnAdjustments" runat="server" accesskey="A" causesvalidation="true" validationgroup="btnadjusts" class="css_btn_enabled" onserverclick="btnAdjustments_Click" title="Adjustment[Alt+A]" type="button">
                                                                            <i aria-hidden="true" class="fa fa-arrow-circle-right"></i>&#8195;<u>A</u>djustment
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ToolTip="Payment Adjustment grid" ShowFooter="true"
                                                                ID="grvPaymentAdjustment" Width="100%" OnRowDataBound="grvPaymentAdjustment_RowDataBound"
                                                                OnRowDeleting="grvPaymentAdjustment_RowDeleting" RowStyle-HorizontalAlign="Center "
                                                                AutoGenerateColumns="False" class="gird_details">
                                                                <Columns>
                                                                    <%--Add or Less grid --%>
                                                                    <asp:TemplateField HeaderText="Add or Less" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAddOrLess" ToolTip="Add or Less" Width="100%" runat="server" Text='<%#Eval("AddOrLess")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterAddOrLess" ToolTip="Add or Less" Width="75px" AutoPostBack="true"
                                                                                    OnSelectedIndexChanged="ddlFooterAddOrLess_OnSelectedIndexChanged" runat="server" CssClass="md-form-control form-control login_form_content_input">
                                                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                                                    <asp:ListItem Value="1">Add</asp:ListItem>
                                                                                    <asp:ListItem Value="2">Less</asp:ListItem>
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterAddOrLess" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" runat="server" ControlToValidate="ddlFooterAddOrLess"
                                                                                        InitialValue="0" ErrorMessage="Select Add/Less"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%--Prime Account Number - From Entity Master (in PaymentDetails SQL Table - column PANum) --%>
                                                                    <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPrimeAccountNumber" ToolTip="Account Number" Width="100%"
                                                                                runat="server" Text='<%#Eval("PANum")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <uc3:Suggest ID="ddlFooterPrimeAccountNumberAdj" Width="135px" OnItem_Selected="ddlFooterPrimeAccountNumberA_SelectedIndexChanged"
                                                                                    AutoPostBack="true" runat="server" ErrorMessage="Enter Account Number" ValidationGroup="GridPaymentadj" ServiceMethod="GetPANumA" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%--Reference Number - From Debit Note--%>
                                                                    <asp:TemplateField HeaderText="Reference Number" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblReferenceNumber" ToolTip="Reference Number" Width="100%" runat="server"
                                                                                Text='<%#Eval("SANum")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblReferenceDocnumber" ToolTip="Reference Number" Width="100%" runat="server"
                                                                                Text='<%#Eval("REF_NUMBER")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <uc3:Suggest ID="aceRefNumber" OnItem_Selected="aceRefNumber_SelectedIndexChanged" Width="125px" AutoPostBack="true" runat="server" ServiceMethod="GetReferenceList" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%--Pay type --%>
                                                                    <asp:TemplateField HeaderText="Pay Type" ItemStyle-HorizontalAlign="Left">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAdjsPayType" ToolTip="Pay Type" Text='<%#Eval("PayType")%>' Width="100%"
                                                                                runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterPayType" ToolTip="Pay Type" runat="server"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlFooterPayType_OnSelectedIndexChanged" Width="175px" CssClass="md-form-control form-control login_form_content_input">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RFVddlFooterFlowType" CssClass="validation_msg_box_sapn"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" runat="server" ControlToValidate="ddlFooterPayType"
                                                                                        InitialValue="0" ErrorMessage="Select Pay Type"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%--Sub Account Number - From Entity Master (in PaymentDetails SQL Table - column SANum)--%>
                                                                    <asp:TemplateField HeaderText="PayTypeCode" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblPayTypeID" Text='<%#Eval("PayTypeID")%>' Width="100%" runat="server"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%-- GL Account --%>
                                                                    <asp:TemplateField HeaderText="GL Account" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblGLCode" ToolTip="GL Account" Width="100%" runat="server" Text='<%#Eval("GL_Code")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblGLCodeDesc" ToolTip="GL Account" Width="100%" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:DropDownList ID="ddlFooterGL_Code" ToolTip="GL Account" Width="220px" runat="server" AutoPostBack="true"
                                                                                    OnSelectedIndexChanged="ddlFooterGL_CodeA_SelectedIndexChanged" CssClass="md-form-control form-control login_form_content_input">
                                                                                </asp:DropDownList>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFooterGL_Code" runat="server" ControlToValidate="ddlFooterGL_Code"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                                                        Display="Dynamic" ErrorMessage="Select GL Account"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%-- SL Account --%>
                                                                    <asp:TemplateField HeaderText="SL Account" Visible="false">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblSL_Code" Width="100%" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Code")%>'></asp:Label>
                                                                            <asp:Label ID="lblSL_CodeDesc" Width="100%" ToolTip="SL Description" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <uc3:Suggest ID="ddlFooterSL_Code" runat="server" Width="150px" ServiceMethod="GetSLCodesA" ToolTip="SL Account" />
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%-- Description --%>
                                                                    <asp:TemplateField HeaderText="Narration">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblDescription" ToolTip="Description" Width="100%" runat="server"
                                                                                Text='<%#Eval("Remarks")%>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <asp:TextBox ID="txtFooterDescription" ToolTip="Description" Width="300px" TextMode="MultiLine"
                                                                                    CssClass="md-form-control form-control login_form_content_input lowercase"
                                                                                    Wrap="true" MaxLength="60" onkeyup="maxlengthfortxt(60);" runat="server"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%-- Amount --%>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblAmount" Width="100%" ToolTip="Amount" runat="server" Text='<%#Eval("Amount")%>'
                                                                                Style="text-align: right"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFooterAmount" onchange="fnthousands_separators(this,1)" ToolTip="Amount" Width="150px" runat="server" MaxLength="12"
                                                                                    class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <asp:Label ID="lblFooterAmountAdj" runat="server"
                                                                                    Visible="false"></asp:Label>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" TargetControlID="txtFooterAmount"
                                                                                    FilterType="Numbers,Custom" ValidChars=".," Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="grid_validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvtxtFooterAmount" runat="server" ControlToValidate="txtFooterAmount"
                                                                                        SetFocusOnError="True" ValidationGroup="GridPaymentadj" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                        Display="Dynamic" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                    <%-- Action --%>
                                                                    <asp:TemplateField HeaderText="Action">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkAdjRemove" Width="100%" ToolTip="Remove from the grid,[Alt+Shift+D]" runat="server" AccessKey="D"
                                                                                CommandName="Delete" CausesValidation="false" Text="Remove" CssClass="grid_btn_delete"
                                                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <button class="css_btn_enabled" id="lnkAddAdjust" onserverclick="lnkAddAdjust_Click" runat="server"
                                                                                    type="button" accesskey="T" title="Add the Details[Alt+T]" validationgroup="GridPaymentadj">
                                                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                                                </button>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <HeaderStyle CssClass="styleGridHeader" />
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="float: right; padding-right: 6%;">
                                                        <asp:Label ID="lblTotAdjustmentTotal" CssClass="styleDisplayLabel" Font-Bold="True" runat="server" Text="Adjustment Total : "></asp:Label>
                                                        <asp:Label ID="lblAdjAmt" CssClass="styleDisplayLabel" ToolTip="Total amount of payment adjustment grid"
                                                            Font-Bold="True" runat="server" Text="0"></asp:Label>
                                                    </div>
                                                </asp:Panel>
                                                <div class="row" style="float: right; padding-right: 7%;">
                                                    <asp:Label ID="lblPaymentAdjust" CssClass="styleDisplayLabel" runat="server" Text="Grand Total  : " Font-Bold="True"></asp:Label>
                                                    <asp:Label ID="lbltotalPaymentAdjust" ToolTip="Total amount of payment adjustment grid"
                                                        runat="server" Text="0" CssClass="styleDisplayLabel" Font-Bold="True"></asp:Label>
                                                </div>
                                                <div>
                                                    <div class="row">
                                                        <div>
                                                            <asp:Panel DefaultButton="btnPassword" ID="PnlPassword" Style="display: none" runat="server"
                                                                Height="25%" BackColor="White" BorderStyle="Solid" BorderColor="Black" Width="30%">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label runat="server" ToolTip="password" Text="Enter your password" ID="lblPasswordHeader"
                                                                                        CssClass="styleDisplayLabel"></asp:Label>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtPassword" ToolTip="password" runat="server" TextMode="Password" class="md-form-control form-control login_form_content_input requires_false"
                                                                                    MaxLength="30"></asp:TextBox>
                                                                                <span class="highlight"></span>
                                                                                <span class="bar"></span>
                                                                                <label>
                                                                                    <asp:Label ID="lblPassword" ToolTip="password" runat="server" Text="Password:" Font-Bold="true"></asp:Label>

                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                            <asp:Button ID="btnPassword" ToolTip="Authenticate password,[Alt+W]" CausesValidation="false"
                                                                                CssClass="save_btn fa fa-floppy-o" OnClick="btnPassword_Click" AccessKey="W" Text="Submit" runat="server" />
                                                                            <i class="fa fa-floppy-o btn_i" aria-hidden="true"></i>
                                                                            <asp:Button ID="btnCancelPass" ToolTip="Cancel" CausesValidation="false" OnClick="btnCancelPass_Click"
                                                                                CssClass="save_btn fa fa-floppy-o" Text="Cancel" runat="server" />
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                            <asp:Label ID="lblErrorMessagePass" runat="server" CssClass="styleMandatoryLabel" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                        <div>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" TargetControlID="chkAccountBased"
                                                                PopupControlID="PnlPassword" BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                                                                Enabled="True">
                                                            </cc1:ModalPopupExtender>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="display: none">
                                                        <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                                                        <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                                                        <asp:Button ID="btnAddressClear" UseSubmitBehavior="false" OnClick="btnAddressClear_Click" runat="server" Text="" />
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                            <asp:ValidationSummary ValidationGroup="btngo" ID="ValidationSummary5" runat="server"
                                                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                            <asp:ValidationSummary ValidationGroup="GridPayment" ID="ValidationSummary1" runat="server"
                                                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                            <asp:ValidationSummary ValidationGroup="GridPaymentadj" ID="ValidationSummary2" runat="server"
                                                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                            <asp:ValidationSummary ValidationGroup="Print" ID="ValidationSummary3" runat="server"
                                                                CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel runat="server" ID="TabPanelPBD" CssClass="tabpan" BackColor="Red" Enabled="false">
                                    <HeaderTemplate>
                                        Payment Bank Details
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:RadioButtonList ID="RBLCompanyCashorBankAcct" Enabled="false" runat="server" ToolTip="Company cash or bank account for Demand draft"
                                                                    RepeatDirection="Horizontal" OnSelectedIndexChanged="RBLCompanyCashorBankAcct_SelectedIndexChanged"
                                                                    AutoPostBack="true" Visible="false" CssClass="md-form-control form-control radio">
                                                                    <asp:ListItem Text="Bank Account" Value="1" Selected="True"></asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkReplace" AutoPostBack="true" OnCheckedChanged="chkReplace_CheckedChanged" runat="server" Enabled="false" />
                                                                <asp:Label runat="server" Text="Cheque Replace" ToolTip="Cheque Replace" ID="lblReplaceCheque"
                                                                    CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:CheckBox ID="chkHold" AutoPostBack="true" OnCheckedChanged="chkHold_CheckedChanged" runat="server" Enabled="true" />
                                                                <asp:Label runat="server" Text="Hold Cheques" ToolTip="Hold Cheques" ID="lblHoldCheque"
                                                                    CssClass="styleDisplayLabel"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlbankname" ToolTip="Bank Name" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlbankname_OnSelectedIndexChanged" CssClass="md-form-control form-control" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBankName" ToolTip="Bank Name" runat="server" Text="Bank Name" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvbankname" runat="server" Display="Dynamic" ControlToValidate="ddlbankname"
                                                                        ValidationGroup="Save" InitialValue="0" ErrorMessage="Select Bank Name" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="rfvbanknameC" runat="server" Display="Dynamic" ControlToValidate="ddlbankname"
                                                                        ValidationGroup="PrintC" ErrorMessage="Enter Bank Name" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlAcctNumber" ToolTip="Account Number" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlAcctNumber_OnSelectedIndexChanged" CssClass="md-form-control form-control" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblAcctnumber" ToolTip="Account Number" runat="server" Text="Account Number"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVAcctNumberC" runat="server" Display="Dynamic" ControlToValidate="ddlAcctNumber"
                                                                        ValidationGroup="PrintC" InitialValue="0" ErrorMessage="Select Account Number"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="RFVAcctNumber" runat="server" Display="Dynamic" ControlToValidate="ddlAcctNumber"
                                                                        ValidationGroup="Save" InitialValue="0" ErrorMessage="Select Account Number"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvHoldCheque" visible="false">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlholdCheques" ToolTip="Hold Cheques" runat="server" AutoPostBack="true"
                                                                    OnSelectedIndexChanged="ddlholdCheques_OnSelectedIndexChanged" CssClass="md-form-control form-control" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblHoldChequesval" ToolTip="Bank Name" runat="server" Text="Cheque Number" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvHoldCheques" runat="server" Display="Dynamic" ControlToValidate="ddlholdCheques"
                                                                        ValidationGroup="Save" InitialValue="0" ErrorMessage="Select Hold Cheques" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtBankbranch" runat="server" ToolTip="Bank Branch" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblBankbranch" runat="server" ToolTip="Bank Branch" Text="Bank Branch" CssClass="styleDisplayLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtGLCode" runat="server" ToolTip="GL Account" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" />

                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblGLcode" runat="server" ToolTip="GL Account" Text="GL Account" CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtGLCode" runat="server" Display="Dynamic" ControlToValidate="txtGLCode"
                                                                        ValidationGroup="Save" ErrorMessage="Enter GL Account" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="rfvtxtGLCodeC" runat="server" Display="Dynamic" ControlToValidate="txtGLCode"
                                                                        ValidationGroup="PrintC" ErrorMessage="Enter GL Account" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtSLCode" runat="server" ToolTip="SL Code" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblSLcode" runat="server" ToolTip="SL Code" Text="SL Code" CssClass="styleDisplayLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtInstrumentNumber" runat="server" ToolTip="Instrument Number"
                                                                    ReadOnly="false" MaxLength="12" class="md-form-control form-control login_form_content_input requires_false" />
                                                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtInstrumentNumber"
                                                                    FilterType="Numbers" Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInstrumentNumber" runat="server" ToolTip="Instrument Number" Text="Instrument Number"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtInstrumentNumber" runat="server" Display="Dynamic"
                                                                        ControlToValidate="txtInstrumentNumber" ValidationGroup="Print" ErrorMessage="Enter Instrument Number"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="rfvtxtInstrumentNumberC" runat="server" Display="Dynamic"
                                                                        ControlToValidate="txtInstrumentNumber" ValidationGroup="PrintC" ErrorMessage="Enter Instrument Number"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                                                                        ControlToValidate="txtInstrumentNumber" ValidationGroup="Save" ErrorMessage="Enter Instrument Number"
                                                                        CssClass="validation_msg_box_sapn" Enabled="true" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtInstrumentDate" ToolTip="Instrument Date" runat="server"
                                                                    class="md-form-control form-control login_form_content_input requires_true" />
                                                                <cc1:CalendarExtender ID="CalendarExtenderInstrumentDate" runat="server" Enabled="True"
                                                                    PopupButtonID="ImageInstrumentDate" OnClientDateSelectionChanged="checkValueDate_NextSystemDate" TargetControlID="txtInstrumentDate">
                                                                </cc1:CalendarExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblInstrumentDate" runat="server" ToolTip="Instrument Date" Text="Instrument Date"
                                                                        CssClass="styleReqFieldLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvtxtInstrumentDate" runat="server" Display="Dynamic"
                                                                        ControlToValidate="txtInstrumentDate" ValidationGroup="Save" ErrorMessage="Enter Instrument Date"
                                                                        CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:DropDownList ID="ddlChequeStatus" ToolTip="Cheque status" runat="server" Enabled="false" CssClass="md-form-control form-control" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblChequeStatus" ToolTip="Cheque status" runat="server" Text="Cheque Print Status" CssClass="styleDisplayLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtRemarks" TextMode="MultiLine" ToolTip="Remarks" Rows="3" runat="server"
                                                                    MaxLength="60" onkeyup="maxlengthfortxt(60);" CssClass="md-form-control form-control login_form_content_input lowercase" Width="200px" />
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblRemarks" runat="server" ToolTip="Remarks" Text="Remarks" CssClass="styleDisplayLabel" />
                                                                </label>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVRemarks" runat="server" Display="Dynamic" ControlToValidate="txtRemarks"
                                                                        ValidationGroup="Save" ErrorMessage="Enter Remarks" CssClass="validation_msg_box_sapn"
                                                                        Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvPmtGatewayRefNo" visible="false">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtPmtGatewayRefNo" runat="server" ToolTip="Payment GateWay Ref No" MaxLength="30"
                                                                    class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label>
                                                                    <asp:Label ID="lblPaymentGatewayRefNo" ToolTip="Payment Gateway Reference No" runat="server" Text="Payment Gateway Ref No" CssClass="styleDisplayLabel" />
                                                                </label>
                                                                <%--<div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="RFVPmtGatewayRefNo" runat="server" Display="Dynamic" ControlToValidate="txtPmtGatewayRefNo"
                                                                        ValidationGroup="Save" ErrorMessage="Enter Payment GateWay Ref No" CssClass="validation_msg_box_sapn"
                                                                        Enabled="True" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>--%>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                            <div class="md-input">
                                                                <asp:TextBox ID="txtFavouringName" runat="server" MaxLength="100" ReadOnly="true" ToolTip="Favouring Name" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <label class="tess">
                                                                    <asp:Label ID="lblFavouringName" ToolTip="Favouring Name" runat="server" Text="Favouring Name" CssClass="styleDisplayLabel" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvUpdateCheque" visible="false">
                                                            <div class="md-input">
                                                                <button class="css_btn_enabled" id="btnupdatecheque" title="UpdateCheque[Alt+U]" onclick="if(confirm('Do you want to update Instrument Number for this record?'))" causesvalidation="false" onserverclick="btnupdatecheque_ServerClick" runat="server"
                                                                    type="button" accesskey="U">
                                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>U</u>pdate cheque
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                                    <asp:Button runat="server" ID="btnPrintVoucher" ToolTip="Print Voucher" Text="Print Voucher"
                                                                        CssClass="save_btn fa fa-floppy-o" OnClick="btnPrintVoucher_Click" />
                                                                    <asp:Button runat="server" ID="btnPrintCheque" ToolTip="Print Cheque" Text="Print Cheque"
                                                                        CssClass="save_btn fa fa-floppy-o" ValidationGroup="Print" Visible="false" OnClick="btnPrintCheque_Click" />
                                                                    <asp:Button runat="server" ID="btnCoveringLetter" ToolTip="Covering Letter" Text="Covering Letter"
                                                                        CssClass="save_btn fa fa-floppy-o" OnClick="btnCoveringLetter_Click" />

                                                                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12" runat="server" id="dvlanguage" visible="false">
                                                                        <div class="md-input">
                                                                            <asp:DropDownList ID="ddlLanguage" AutoPostBack="false" ToolTip="Language" runat="server"
                                                                                class="md-form-control form-control  requires_false">
                                                                            </asp:DropDownList>
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label ID="lblLanguage" ToolTip="Language" runat="server" Text="Language"></asp:Label>
                                                                            </label>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="display: none;">
                                                                    <asp:ValidationSummary ValidationGroup="Print" ID="ValidationSummary4" runat="server"
                                                                        CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>

                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>
                        </div>
                        <div style="display: none" class="row">
                            <div class="col">
                                <iframe id="MyIframeOpenFile" visible="false" src="~/Common/S3GViewFileCheckList.aspx" runat="server" scrolling="no" frameborder="0" style="border: none; overflow: hidden; width: 100px; height: 21px;" allowtransparency="true"></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="float: right; margin-top: 5px;">
                        <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Save'))" validationgroup="Save" causesvalidation="false" onserverclick="btnSave_Click" runat="server"
                            type="button" accesskey="S">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                        </button>
                        <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_Click" runat="server"
                            type="button" accesskey="L">
                            <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                        </button>
                        <button class="css_btn_enabled" id="btnCancel" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_Click" runat="server"
                            type="button" accesskey="X">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                        </button>
                        <button class="css_btn_enabled" id="btnPDFPrint" title="Print the Details[Alt+P]" causesvalidation="false" onserverclick="btnPDFPrint_Click" runat="server"
                            type="button" accesskey="P">
                            <i class="fa fa-file-pdf-o" aria-hidden="true"></i>&emsp;<u>P</u>rint
                        </button>
                        <button class="css_btn_enabled" id="btnCancelPayment" title="Cancel Payment[Alt+C]" onclick="if(confirm('Are you sure want to cancel this record?'))" causesvalidation="false" onserverclick="btnCancelPayment_Click" runat="server"
                            type="button" accesskey="C">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>ancel Payment
                        </button>
                        <asp:Button runat="server" ID="btnPayPrint" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                            OnClick="btnPayPrint_Click" Style="display: none;" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:ValidationSummary ValidationGroup="Save" ID="vs_PaymentRequest" runat="server"
                            CssClass="styleMandatoryLabel" HeaderText="Correct the following validation(s):  " ShowMessageBox="false" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPDFPrint" />
            <asp:PostBackTrigger ControlID="btnPayPrint" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Label ID="lblInstallmentPop" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeInstallmentPop" runat="server" PopupControlID="dvInstallmentPop" TargetControlID="lblInstallmentPop"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInstallmentPop" style="display: none; width: 75%; height: 50%;">
        <div>
            <asp:Panel ID="pnlInstallmentPop" GroupingText="Asset Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updInstView" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 250px;">
                            <div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAssetName" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_AssetName" runat="server" CssClass="styleReqFieldLabel" Text="Asset Code and Description"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtAssetCodeV" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_AssetCodeV" runat="server" CssClass="styleReqFieldLabel" Text="Asset Number"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtMarginAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_MarginAmount" runat="server" CssClass="styleReqFieldLabel" Text="Margin Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txtTradeIn" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_DiscountValue" runat="server" CssClass="styleReqFieldLabel" Text="Discount Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_FinanceAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_FinanceAmount" runat="server" CssClass="styleReqFieldLabel" Text="Finance Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                        <div class="md-input">
                                            <asp:TextBox ID="txt_PaidAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                            <span class="highlight"></span>
                                            <span class="bar"></span>
                                            <label class="tess">
                                                <asp:Label ID="lbl_PaidAmount" runat="server" CssClass="styleReqFieldLabel" Text="Paid Amount"></asp:Label>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="vertical-align: middle;">
                                            <%--<asp:Button runat="server" ID="btnOk" title="Exit[Alt+3]" OnClientClick="fnConfirmExit();" CausesValidation="false"
                                                OnClick="btnInsrtOk_Click" Text="Exit" CssClass="save_btn fa fa-floppy-o" AccessKey="3" />--%>
                                            <button class="css_btn_enabled" id="btnPopupCancel" title="Exit[Alt+3]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnInsrtCancel_Click" runat="server"
                                                type="button" accesskey="3">
                                                <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    <asp:Label ID="lblInvoicePopup" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpelInvoicePopup" runat="server" PopupControlID="dvlInvoicePopup" TargetControlID="lblInvoicePopup"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvlInvoicePopup" style="display: none; width: 60%; height: 60%;">
        <div>
            <asp:Panel ID="pnlInvoiceDetails" GroupingText="Invoice Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 290px;">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceAccountNumber" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceAccountNumber" runat="server" CssClass="styleDisplayLabel" Text="Account number" ToolTip="Account number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceNoPopup" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceNoPopup" runat="server" CssClass="styleDisplayLabel" Text="Invoice No" ToolTip="Invoice No"></asp:Label>

                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceDatePopup" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceDatePopup" runat="server" CssClass="styleDisplayLabel" Text="Invoice Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoicePartyName" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoicePartyName" runat="server" CssClass="styleDisplayLabel" Text="Customer Name" ToolTip="Customer Name"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceDueDate" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceDueDate" runat="server" CssClass="styleDisplayLabel" Text="Due Date" ToolTip="Due Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceAmount" runat="server" CssClass="styleDisplayLabel" Text="Invoice Amount" ToolTip="Invoice Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtEligibilityInvoice" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblEligibilityInvoice" runat="server" CssClass="styleDisplayLabel" Text="Eligibility Invoice Amount" ToolTip="Eligibility Invoice Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoicePaidAmount" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false" Style="text-align: right"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoicePaidAmount" runat="server" CssClass="styleDisplayLabel" Text="Paid Amount" ToolTip="Paid Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" style="vertical-align: middle;">
                                    <button class="css_btn_enabled" id="btnInvoicePopup" title="Exit[Alt+5]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnInvoiceOk_Click" runat="server"
                                        type="button" accesskey="5">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                    </button>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>

    <asp:Label ID="lblAdjustmentDtl" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeAdjustmentDtl" runat="server" PopupControlID="dvAdjustmentDtl" TargetControlID="lblAdjustmentDtl"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvAdjustmentDtl" style="display: none; width: 65%; height: 50%;">
        <div>
            <asp:Panel ID="pnlAdjustmentDtl" GroupingText="Payment Adjustment" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updAdjustmentDtl" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 300px;">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAddOrLess" ToolTip="Add or Less" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlAddOrLess_OnSelectedIndexChanged" runat="server" class="md-form-control form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">Add</asp:ListItem>
                                            <asp:ListItem Value="2">Less</asp:ListItem>
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvddlAddOrLess" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" ValidationGroup="AdjustmentDtl" runat="server" ControlToValidate="ddlAddOrLess"
                                                InitialValue="0" ErrorMessage="Select Add/Less"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="Label4" CssClass="styleReqFieldLabel"
                                                Text="Add or Less"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAdjAccountNumber" runat="server" condentEditable="false" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblAdjAccountNumber" runat="server" CssClass="styleDisplayLabel" Text="Account number" ToolTip="Account Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAdjInvoiceAssetNumber" runat="server" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_false"></asp:TextBox>
                                        <asp:Label ID="lblAdjInvoiceAssetNumberValue" runat="server" Visible="false" CssClass="styleDisplayLabel" Text="Invoice or Asset Number" ToolTip="Invoice or Asset Number"></asp:Label>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblAdjInvoiceAssetNumber" runat="server" CssClass="styleDisplayLabel" Text="Invoice or Asset Number" ToolTip="Invoice or Asset Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc3:Suggest ID="aceAdjRefNumber" OnItem_Selected="aceAdjRefNumber_SelectedIndexChanged"
                                            AutoPostBack="false" runat="server" ServiceMethod="GetReferenceList" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblAdjRefNumber" runat="server" CssClass="styleDisplayLabel" Text="Reference number" ToolTip="Reference Number"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAdjPayType" Width="100%" ToolTip="Pay Type" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlAdjPayType_OnSelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvddlAdjPayType" CssClass="validation_msg_box_sapn"
                                                SetFocusOnError="True" ValidationGroup="AdjustmentDtl" runat="server" ControlToValidate="ddlAdjPayType"
                                                InitialValue="0" ErrorMessage="Select Pay Type"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label runat="server" ID="lblAdjPayType" CssClass="styleReqFieldLabel"
                                                Text="Pay Type"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:DropDownList ID="ddlAdjGL_Code" ToolTip="GL Account" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlAdjGL_Code_SelectedIndexChanged" class="md-form-control form-control">
                                        </asp:DropDownList>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvddlAdjGL_Code" runat="server" ControlToValidate="ddlAdjGL_Code"
                                                SetFocusOnError="True" ValidationGroup="AdjustmentDtl" InitialValue="0" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" ErrorMessage="Select GL Account"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label class="tess">
                                            <asp:Label ID="lblAdjGLCode" runat="server" CssClass="styleDisplayLabel" Text="GL Account" ToolTip="GL Account"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <uc3:Suggest ID="ddlAdjSL_Code" runat="server" ServiceMethod="GetSLCodesA" ToolTip="SL Account" Width="100px" />
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAdjSL_Code" runat="server" CssClass="styleDisplayLabel" Text="SL Account"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAdjDescription" ToolTip="Description" TextMode="MultiLine"
                                            class="md-form-control form-control login_form_content_input lowercase"
                                            Wrap="true" MaxLength="60" onkeyup="maxlengthfortxt(60);" runat="server"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblNarration" runat="server" CssClass="styleDisplayLabel" Text="Narration" ToolTip="Margin"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtAdjAmount" ToolTip="Amount" runat="server" MaxLength="12"
                                            class="md-form-control form-control login_form_content_input" Style="text-align: right"></asp:TextBox>
                                        <asp:Label ID="lblAdjActualAmount" runat="server" Visible="false"></asp:Label>
                                        <cc1:FilteredTextBoxExtender ID="fteAdjAmount" runat="server" TargetControlID="txtAdjAmount"
                                            FilterType="Numbers,Custom" ValidChars="." Enabled="True">
                                        </cc1:FilteredTextBoxExtender>
                                        <div class="validation_msg_box">
                                            <asp:RequiredFieldValidator ID="rfvtxtAdjAmount" runat="server" ControlToValidate="txtAdjAmount"
                                                SetFocusOnError="True" ValidationGroup="AdjustmentDtl" CssClass="validation_msg_box_sapn"
                                                Display="Dynamic" ErrorMessage="Enter Amount"></asp:RequiredFieldValidator>
                                        </div>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblAdjAmount" runat="server" CssClass="styleDisplayLabel" Text="Amount" ToolTip="Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div>
                                    <button class="css_btn_enabled" id="btnAddAdj" onserverclick="btnAddAdj_Click" runat="server"
                                        type="button" title="Add the Details[Alt+J]" accesskey="J" validationgroup="AdjustmentDtl">
                                        <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                    </button>
                                    <button class="css_btn_enabled" id="btnAddExit" title="Exit[Alt+1]" accesskey="1" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnAddExit_Click" runat="server"
                                        type="button">
                                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Exit
                                    </button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="gird">
                                    <asp:GridView runat="server" ToolTip="Payment Adjustment grid" ShowFooter="false"
                                        ID="grvAdjustment" Width="100%" OnRowDataBound="grvAdjustment_RowDataBound"
                                        OnRowDeleting="grvAdjustment_RowDeleting" RowStyle-HorizontalAlign="Center "
                                        AutoGenerateColumns="False" class="gird_details">
                                        <Columns>
                                            <%--Add or Less grid --%>
                                            <asp:TemplateField HeaderText="Add or Less" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessAddOrLess" ToolTip="Add or Less" Width="100%" runat="server" Text='<%#Eval("AddOrLess")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%--Prime Account Number - From Entity Master (in PaymentDetails SQL Table - column PANum) --%>
                                            <asp:TemplateField HeaderText="Account Number" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessAccountNumber" ToolTip="Account Number"
                                                        runat="server" Text='<%#Eval("PANum")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reference Number" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdReferenceNumber" ToolTip="Reference Number" Width="100%" runat="server"
                                                        Text='<%#Eval("SANum")%>' Visible="false"></asp:Label>
                                                    <asp:Label ID="lblAdReferenceDocnumber" ToolTip="Reference Number" Width="100%" runat="server"
                                                        Text='<%#Eval("REF_NUMBER")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%--Pay type --%>
                                            <asp:TemplateField HeaderText="Pay Type" ItemStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessPayType" ToolTip="Pay Type" Text='<%#Eval("PayType")%>' Width="100%"
                                                        runat="server"></asp:Label>
                                                    <asp:Label ID="lblAdLessPayTypeID" ToolTip="Pay Type" Text='<%#Eval("PayTypeID")%>' Width="100%"
                                                        runat="server" Visible="false"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%-- GL Account --%>
                                            <asp:TemplateField HeaderText="GL Account">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessGLCode" ToolTip="GL Account" Width="100%" runat="server" Text='<%#Eval("GL_Code")%>'></asp:Label>
                                                    <asp:Label ID="lblAdLessGLCodeDesc" ToolTip="GL Account" Width="100%" runat="server" Text='<%#Eval("GL_Desc")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%-- SL Account --%>
                                            <asp:TemplateField HeaderText="SL Account" FooterStyle-Width="10%" ItemStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessSL_Code" Width="100%" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Code")%>'></asp:Label>
                                                    <asp:Label ID="lblAdLessSL_CodeDesc" Width="100%" ToolTip="SL Account" runat="server" Text='<%#Eval("SL_Desc")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%-- Description --%>
                                            <asp:TemplateField HeaderText="Narration" FooterStyle-Width="20%" ItemStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessDescription" ToolTip="Description" Width="100%" runat="server"
                                                        Text='<%#Eval("Remarks")%>'></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%-- Amount --%>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Right" HeaderText="Amount" FooterStyle-Width="20%"
                                                ItemStyle-Width="20%">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAdLessAmount" Width="100%" ToolTip="Amount" runat="server" Text='<%#Eval("Amount")%>'
                                                        Style="text-align: right"></asp:Label>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                            <%-- Action --%>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="lnkAdRemove" Width="100%" ToolTip="Remove from the grid,[Alt+Shift+E]" runat="server"
                                                        CommandName="Delete" CausesValidation="false" Text="Remove" AccessKey="E" CssClass="grid_btn_delete" OnClientClick="return confirm('Are you sure you want to Remove this record?');"></asp:Button>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="styleGridHeader" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>


    <asp:Label ID="lblDefaultCustShow" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeDefaultCustShow" runat="server" PopupControlID="pnlDefaultCustShow" TargetControlID="lblDefaultCustShow"
        BackgroundCssClass="modalBackground" Enabled="true" BehaviorID="ModalBID" />
    <asp:Panel ID="pnlDefaultCustShow" GroupingText="" Height="150px" Width="300px" runat="server" Style="padding: 8px; text-wrap: normal; display: none;"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="md-input">
                            <asp:Label ID="lblDefaultCustShowErrorMsg" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <button class="css_btn_enabled" id="btnSaveOk" title="Ok[Alt+1]" accesskey="1" causesvalidation="false" onserverclick="btnSaveOk_Click"
                            runat="server" type="button">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;Ok
                        </button>
                        <button class="css_btn_enabled" id="btnSaveCancel" title="Cancel[Alt+2]" accesskey="2" causesvalidation="false" onserverclick="btnSaveCancel_Click"
                            runat="server" type="button">
                            <i class="fa fa-reply" aria-hidden="true"></i>&emsp;Cancel
                        </button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
