<%@ page language="C#" masterpagefile="~/Common/S3GMasterPageCollapse.master" autoeventwireup="true" inherits="Collection_S3GClnReceiptProcessing, App_Web_ycyxh5gd" title="Untitled Page" enableeventvalidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/UserControls/LOBMasterView.ascx" TagName="LOV" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc" TagName="Suggest" Src="~/UserControls/S3GAutoSuggest.ascx" %>
<%@ Register Src="~/UserControls/CommonSearch.ascx" TagName="ICM" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript" language="javascript">
        var btnActive_index = 0;
        var index = 0;
        function pageLoad(s, a) {
            var TC = $find("<%=tcReceipt.ClientID %>");

            tab = $find('ctl00_ContentPlaceHolder1_tcReceipt');
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
        function fnMoveNextTab(Source_Invoker) {
            tab = $find('ctl00_ContentPlaceHolder1_tcReceipt');
            var strValgrp = tab._tabs[index]._tab.outerText.trim();
            var btnSave = document.getElementById('<%=btnSave.ClientID %>')
            strValgrp = "Submit";
            Valgrp.validationGroup = strValgrp;

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
                        case 2:
                            tab.set_activeTabIndex(newindex);
                            index = tab.get_activeTabIndex(index);
                            btnActive_index = index;
                            break;

                    }
                }
            }
            else {
                tab.set_activeTabIndex(newindex);
                var TC = $find("<%=tcReceipt.ClientID %>");
                if (TC.get_activeTab().get_tabIndex() == 1) {
                    $get("<%=txtInstrumentNo.ClientID %>").focus();
                }
                if (TC.get_activeTab().get_tabIndex() == 2) {
                    $get("<%=gvDebitCredit.ClientID %>").focus();
                }
                //Focus End
            }
        }

        function fnSelectBranch(chkSelectBranch, chkSelectAllBranch) {

            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvShowInstallment');
            var TargetChildControl = chkSelectAllBranch;
            var selectall = 0;
            var Inputs = gvBranchWise.getElementsByTagName("input");
            if (!chkSelectBranch.checked) {
                chkSelectAllBranch.checked = false;
            }
            else {
                for (var n = 0; n < Inputs.length; ++n) {
                    if (Inputs[n].type == 'checkbox') {
                        if (Inputs[n].checked) {
                            selectall = selectall + 1;
                        }
                    }
                }
                if (selectall == gvBranchWise.rows.length - 1) {
                    chkSelectAllBranch.checked = true;
                }
            }
        }
        function fnSelectAll(chkSelectAllBranch, chkSelectBranch) {
            var gvBranchWise = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_gvShowInstallment');
            var TargetChildControl = chkSelectBranch;
            //Get all the control of the type INPUT in the base control.
            var Inputs = gvBranchWise.getElementsByTagName("input");
            //Checked/Unchecked all the checkBoxes in side the GridView.
            for (var n = 0; n < Inputs.length; ++n)
                if (Inputs[n].type == 'checkbox' &&
            Inputs[n].id.indexOf(TargetChildControl, 0) >= 0)
                    Inputs[n].checked = chkSelectAllBranch.checked;
        }


        function NumericCheck(evt) {

            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);

            var regex = new RegExp("[0-9\r]", "g");


            if (key.match(regex) == null) {


                window.event.keyCode = 0
                return false;
            }

        }

        function AlphaNumericCheck(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);

            var regex = new RegExp("[0-9a-zA-Z\r]", "g");


            if (key.match(regex) == null) {


                window.event.keyCode = 0
                return false;
            }
        }

        function MaskMoney(evt) {
            alert(evt);
            alert(evt.keyCode);
            if (!(evt.keyCode == 46) || (evt.keyCode >= 48 && evt.keyCode <= 57)) return false;
            alert(evt.keyCode);
            var parts = evt.srcElement.value.split('.');
            if (parts.length > 2) return false;
            if (evt.keyCode == 46) return (parts.length == 1);
            if (parts[0].length >= 14) return false;
            if (parts.length == 2 && parts[1].length >= 2) return false;
        }


        function validate(evt) {
            var theEvent = evt || window.event;
            var key = theEvent.keyCode || theEvent.which;
            key = String.fromCharCode(key);
            var regex = /[0-9]|\.{0,3}/;
            if (!regex.test(key)) {
                theEvent.returnValue = false;
            }
        }

        function DisableControls() {

            var ddlPaymentMode = document.getElementById('<%=ddlPaymentMode.ClientID%>');
            var ddlDraweeBank = document.getElementById('<%=ddlDraweeBank.ClientID%>');
            var txtInstrumentDate = document.getElementById('<%=txtInstrumentDate.ClientID%>');
            var txtInstrumentNo = document.getElementById('<%=txtInstrumentNo.ClientID%>');
            var txtLocation = document.getElementById('<%=txtLocation.ClientID%>');

            if (ddlPaymentMode.options[ddlPaymentMode.selectedIndex].text == "Cash") {
                ddlDraweeBank.disabled = true;
                txtInstrumentDate.disabled = true;
                txtInstrumentNo.disabled = true;
                txtLocation.disabled = true;

                document.getElementById('<%=ddlDraweeBank.ClientID%>').options.selectedIndex = 0;
            }
            else {
                ddlDraweeBank.disabled = false;
                txtInstrumentDate.disabled = false;
                txtInstrumentNo.disabled = false;

                txtLocation.disabled = false;
                //document.getElementById('<%=ddlDraweeBank.ClientID%>').options.selectedIndex=0;
            }

        }

        function checkDate_DocDate(sender, args) {
            //debugger;
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtDocDate').value;
            var selectedDate = sender._selectedDate;
            var millsecondsdiff = Math.abs(Date.parseInvariant(varDocDate, sender._format) - sender._selectedDate);
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var days = Math.floor(millsecondsdiff / millisecondsPerDay);
            var varGapDays = "<%=strValueDateGapDays%>";
            if (days > varGapDays) {
                var varAlert = "Gap Days between Doc Date and Value Date should be " + varGapDays + " days";
                document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value = "";
                alert(varAlert);
                return;
            }

        }

        //new function to validate gap days on  - ONBLUR and editable textbox date field.
        function checkDate_DocDateOnBlur(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {
            fnDoDate(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation);
            //debugger;
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtDocDate').value;
            var varValueDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value;

            if (varValueDate !== "") {
                //var selectedDate = sender._selectedDate;
                var millsecondsdiff = Math.abs(Date.parseInvariant(varDocDate, eFormat) - Date.parseInvariant(varValueDate, eFormat));
                var millisecondsPerDay = 1000 * 60 * 60 * 24;
                var days = Math.floor(millsecondsdiff / millisecondsPerDay);
                var varGapDays = "<%=strValueDateGapDays%>";
                if (days > varGapDays) {
                    var varAlert = "Gap Days between Doc Date and Value Date should be " + varGapDays + " days";
                    document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_txtValueDate').value = "";
                    alert(varAlert);
                    return;
                }
            }
        }

        function checkDate_InstrumentDate(sender, args) {
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value;
            var selectedDate = sender._selectedDate;
            var millsecondsdiff = sender._selectedDate - new Date();
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var days = Math.floor(millsecondsdiff / millisecondsPerDay);
            var varGapDays = "<%=strInstrumentDateGapDays%>";
            if (days < -varGapDays) {
                var varAlert = "Instrument Date should be less than or equal to " + varGapDays + " days";
                document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value = (new Date()).format(sender._format);
                alert(varAlert);
                return;
            }
        }

        function checkDate_InstrumentDate_OnBlur(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation) {
            fnDoDate(el, erID, eFormat, IsFutureDateValidation, IsBackDateValidation);
            //debugger;
            var varDocDate = document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value;
            if (varDocDate != "") {
                var millsecondsdiff = Date.parseInvariant(varDocDate, eFormat) - new Date();
                var millisecondsPerDay = 1000 * 60 * 60 * 24;
                var days = Math.floor(millsecondsdiff / millisecondsPerDay);
                var varGapDays = "<%=strInstrumentDateGapDays%>";
                if (days < ((-1) * varGapDays)) {
                    var varAlert = "Instrument Date should be less than or equal to " + varGapDays + " days";
                    document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabControlDataSheet_txtInstrumentDate').value = (new Date()).format(eFormat);
                    alert(varAlert);
                    return;
                }
                if (days > varGapDays) {
                    var varAlert = "Instrument Date should be less than or equal to " + varGapDays + " days";
                    document.getElementById('<%=txtInstrumentDate.ClientID%>').value = (new Date()).format(eFormat);
                    alert(varAlert);
                    return;
                }
            }
        }

        function fnLoadCustomer() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnLoadCustomer').click();
        }
        function fnLoadCustomerInfo() {
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnLoadCustomerOth').click();
        }
        function funshowaddless() {

            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_btnAddLess').click();
            document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_cpeDemo_ClientState').collapsed = !document.getElementById('ctl00_ContentPlaceHolder1_tcReceipt_TabMainPage_cpeDemo_ClientState').collapsed;

        }

        function fnLoadAccount() {
            document.getElementById('<%=btnLoadAccount.ClientID%>').click();
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="tab-content" class="tab-content">
                <div class="row">
                    <div class="col">
                        <div>
                            <h6 class="title_name">
                                <asp:Label runat="server" Text="Receipt Processing" ID="lblHeading" CssClass="styleDisplayLabel"></asp:Label>
                            </h6>
                            <asp:HiddenField ID="hiddenamount" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <cc1:TabContainer ID="tcReceipt" runat="server" CssClass="styleTabPanel" ScrollBars="None"
                            Width="98%" ActiveTabIndex="0">
                            <cc1:TabPanel ID="TabMainPage" runat="server" BackColor="Red" CssClass="tabpan" HeaderText="General"
                                Width="98%">
                                <HeaderTemplate>
                                    General
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                        <ContentTemplate>
                                            <div>
                                                <div class="row">
                                                    <asp:Panel ID="PnlReceiptInfo" runat="server" GroupingText="Receipt Information"
                                                        CssClass="stylePanel" Width="99%">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="divAccountLOV" runat="server" visible="true">
                                                                    <div class="md-input">
                                                                        <div>
                                                                            <asp:TextBox ID="txtAccountCode" runat="server" class="md-form-control form-control login_form_content_input requires_true"
                                                                                Style="display: none;" MaxLength="100"></asp:TextBox>
                                                                            <uc4:ICM ID="ucAccountLov" onblur="fnLoadAccount()" runat="server" AutoPostBack="true" ShowHideAddressImageButton="false" DispalyContent="Both"
                                                                                OnItem_Selected="ucAccountLov_Item_Selected" strLOV_Code="ACC_ACCA" ServiceMethod="GetAccountList" ToolTip="Account Number" />
                                                                            <asp:Button ID="btnLoadAccount" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadAccount_Click"
                                                                                Style="display: none" />
                                                                            <span class="highlight"></span>
                                                                            <span class="bar"></span>
                                                                            <label>
                                                                                <asp:Label runat="server" Text="Account Number" ToolTip="Account Number" ID="lblprimeaccno" CssClass="styleDisplayLabel"></asp:Label>
                                                                            </label>
                                                                            <div class="validation_msg_box">
                                                                                <asp:RequiredFieldValidator ID="rfvAccountNumber" runat="server" ControlToValidate="txtAccountCode"
                                                                                    ErrorMessage="Select Account Number" ValidationGroup="Appropriation" Enabled="true" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlLOB" ToolTip="Line of Business" runat="server" OnSelectedIndexChanged="ddlLOB_SelectedIndexChanged"
                                                                            AutoPostBack="True" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <asp:HiddenField ID="hdnLobCode" runat="server" />
                                                                        <asp:HiddenField ID="ddlLOB_SelectedItem_Text" runat="server" />
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvLOB" runat="server" ControlToValidate="ddlLOB" SetFocusOnError="true"
                                                                                Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn" ErrorMessage="Select a Line of Business" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="rfvShowLOB" runat="server" ControlToValidate="ddlLOB" SetFocusOnError="true"
                                                                                Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn" ErrorMessage="Select a Line of Business" ValidationGroup="Show"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="rfvAppLOB" runat="server" ControlToValidate="ddlLOB" SetFocusOnError="true"
                                                                                Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn" ErrorMessage="Select a Line of Business" ValidationGroup="Appropriation"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblLOB" runat="server" CssClass="styleReqFieldLabel" Text="Line of Business"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlBranch" AutoPostBack="true" ToolTip="Branch" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged"
                                                                            runat="server" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvddlBranch" runat="server" ControlToValidate="ddlBranch" SetFocusOnError="true"
                                                                                Display="Dynamic" InitialValue="0" CssClass="validation_msg_box_sapn" ErrorMessage="Select a Branch" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label class="tess">
                                                                            <asp:Label ID="lblBranch" runat="server" CssClass="styleReqFieldLabel" Text="Branch" ToolTip="Branch"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlReceiptType" runat="server" AutoPostBack="True" ToolTip="Receipt Type"
                                                                            OnSelectedIndexChanged="ddlReceiptType_SelectedIndexChanged" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblReceipType" runat="server" CssClass="styleReqFieldLabel" Text="Receipt Type" ToolTip="Receipt Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPaymentMode" AutoPostBack="True" runat="server" ToolTip="Mode"
                                                                            OnSelectedIndexChanged="ddlPaymentMode_SelectedIndexChanged" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvMode" runat="server" ControlToValidate="ddlPaymentMode" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Select a Mode" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPaymentMode" runat="server" CssClass="styleReqFieldLabel" Text="Mode"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlChequeMode" runat="server" class="md-form-control form-control" ToolTip="Cheque Mode">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvChequeMode" runat="server" ControlToValidate="ddlChequeMode" Enabled="false" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Select Cheque Mode" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblChequeMode" runat="server" Text="Cheque Mode"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlChequeType" runat="server" class="md-form-control form-control" ToolTip="Cheque Type">
                                                                        </asp:DropDownList>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvChequeType" runat="server" ControlToValidate="ddlChequeType" Enabled="false" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Select Cheque Type" CssClass="validation_msg_box_sapn" InitialValue="0" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblChequeType" runat="server" Text="Cheque Type"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlPayTo" runat="server" AutoPostBack="True" class="md-form-control form-control"
                                                                            OnSelectedIndexChanged="ddlPayTo_SelectedIndexChanged" ToolTip="Receipt To">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblPayTo" runat="server" CssClass="styleReqFieldLabel" Text="Receipt To"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc4:ICM ID="ucCustomerCodeLov" onblur="fnLoadCustomer()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            strLOV_Code="CUS_ACCA" ServiceMethod="GetCustomerList" OnItem_Selected="ucCustomerCodeLov_Item_Selected" ToolTip="Customer Name" />
                                                                        <asp:Button ID="btnLoadCustomer" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomer_OnClick"
                                                                            Style="display: none" />
                                                                        <asp:HiddenField ID="hdnCustId" runat="server" />
                                                                        <asp:TextBox ID="txtCustomerCode" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerNames" runat="server" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerID" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblCustomerName" CssClass="styleDisplayLabel" Text="Customer Name"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvcmbCustomer" runat="server" ControlToValidate="txtCustomerNames"
                                                                                ErrorMessage="Select a Customer/Entity" ValidationGroup="Submit" Enabled="true" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <uc4:ICM ID="ucCustomerCodeLovOth" onblur="fnLoadCustomerInfo()" HoverMenuExtenderLeft="true" runat="server" AutoPostBack="true" DispalyContent="Both"
                                                                            strLOV_Code="CUS_ACOTH" ServiceMethod="GetCustomerListOth" OnItem_Selected="ucCustomerCodeLovOth_Item_Selected" ToolTip="Factoring Customer Name" />
                                                                        <asp:Button ID="btnLoadCustomerOth" runat="server" Text="Load Customer" CausesValidation="false" UseSubmitBehavior="false" OnClick="btnLoadCustomerOth_OnClick"
                                                                            Style="display: none" />
                                                                        <asp:HiddenField ID="hdnCustIdOth" runat="server" />
                                                                        <asp:TextBox ID="txtCustomerCodeOth" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerIDOth" runat="server" ReadOnly="True" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <asp:TextBox ID="txtCustomerNamesOth" runat="server" Style="display: none;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" ID="lblFactCustomerName" CssClass="styleDisplayLabel" Text="Factoring Customer Name" ToolTip="Factoring Customer Name"></asp:Label>
                                                                        </label>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvtCustomerNamesOth" runat="server" ControlToValidate="txtCustomerNamesOth"
                                                                                ErrorMessage="Select a Factoring Customer Name" ValidationGroup="Submit" Enabled="false" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="rfvtCustomerNamesOthShow" runat="server" ControlToValidate="txtCustomerNamesOth"
                                                                                ErrorMessage="Select a Factoring Customer Name" ValidationGroup="Show" Enabled="false" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                                Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDocNo" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender
                                                                            ID="ftetxtDocNo" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtDocNo" ValidChars="/-">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <%-- <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDocNo" runat="server" ControlToValidate="txtDocNo" SetFocusOnError="true"
                                                                                Display="Dynamic" InitialValue="" CssClass="validation_msg_box_sapn" ErrorMessage="Enter a Receipt Number" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDocNo" runat="server" CssClass="styleReqFieldLabel" Text="Receipt Number"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDocDate" runat="server" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender
                                                                            ID="ftxtDocDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtDocDate" ValidChars="/-">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <cc1:CalendarExtender ID="calDocDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                            PopupButtonID="imgDocdate" TargetControlID="txtDocDate">
                                                                            <%--OnClientDateSelectionChanged="checkDate_NextSystemDate"--%>
                                                                        </cc1:CalendarExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDocDate" runat="server" ControlToValidate="txtDocDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Doc Date" SetFocusOnError="True"
                                                                                ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDocDate" runat="server" CssClass="styleReqFieldLabel" Text="Doc Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtValueDate" runat="server" AutoPostBack="true" OnTextChanged="txtValueDate_Changed" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <cc1:CalendarExtender ID="calValueDate" runat="server" Enabled="True" Format="DD/MM/YYYY" PopupButtonID="imgValueDate"
                                                                            TargetControlID="txtValueDate" OnClientDateSelectionChanged="checkDate_NextSystemDate">
                                                                        </cc1:CalendarExtender>
                                                                        <cc1:FilteredTextBoxExtender ID="ftxtValueDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                            TargetControlID="txtValueDate" ValidChars="/-">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtValueDate"
                                                                                CssClass="validation_msg_box_sapn" Display="Dynamic" ErrorMessage="Enter Value Date"
                                                                                SetFocusOnError="True" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblValueDate" runat="server" CssClass="styleReqFieldLabel" Text="Value Date"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtFactoredAmount" onchange="fnthousands_separators(this,1)" runat="server" MaxLength="15" ToolTip="Factored Amount"
                                                                            class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtFactoredAmount_TextChanged"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftFactoredAmount" runat="server" TargetControlID="txtFactoredAmount"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblFactoredAmount" runat="server" CssClass="styleFieldLabel" Text="Factored Amount"></asp:Label>
                                                                        </label>
                                                                        <%--  <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvFactoredAmount" runat="server" ControlToValidate="txtFactoredAmount" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Enter Factored Amount" ValidationGroup="Appropriation" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtunFactoreAmount" onchange="fnthousands_separators(this,1)" runat="server" MaxLength="15" ToolTip="Un Factored Amount"
                                                                            class="md-form-control form-control login_form_content_input requires_true" AutoPostBack="true" OnTextChanged="txtunFactoreAmount_TextChanged"></asp:TextBox>
                                                                        <cc1:FilteredTextBoxExtender ID="ftunFactoreAmount" runat="server" TargetControlID="txtunFactoreAmount"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblUnFactoreAmount" runat="server" CssClass="styleFieldLabel" Text="Un Factored Amount"></asp:Label>
                                                                        </label>
                                                                        <%--<div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvunFactoreAmount" runat="server" ControlToValidate="txtunFactoreAmount" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Enter Factored Amount" ValidationGroup="Appropriation" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtDocAmount" onchange="fnthousands_separators(this,1)" runat="server" MaxLength="15" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <div class="validation_msg_box">
                                                                            <asp:RequiredFieldValidator ID="rfvDocAmount" runat="server" ControlToValidate="txtDocAmount" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Enter a Doc Amount" ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                            <asp:RequiredFieldValidator ID="rfvAppDocAmount" runat="server" ControlToValidate="txtDocAmount" SetFocusOnError="true"
                                                                                Display="Dynamic" ErrorMessage="Enter a Doc Amount" ValidationGroup="Appropriation" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                        </div>
                                                                        <cc1:FilteredTextBoxExtender ID="docAmntFileterExtndr" runat="server" TargetControlID="txtDocAmount"
                                                                            FilterType="Numbers,Custom" ValidChars=".," Enabled="true">
                                                                        </cc1:FilteredTextBoxExtender>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblDocAmount" runat="server" CssClass="styleReqFieldLabel" Text="Doc Amount"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlGivenBy" runat="server" class="md-form-control form-control" ToolTip="Given By" AutoPostBack="true" OnTextChanged="ddlGivenBy_SelectedIndexChanged"
                                                                            Enabled="true">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Given By" ID="lblGivenBy" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlTRRef" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTRRef_SelectedIndexChanged" class="md-form-control form-control">
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label ID="lblTRRef" runat="server" CssClass="styleDisplayLabel" Text="TR Ref"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" style="display: none">
                                                                    <div class="md-input">
                                                                        <asp:DropDownList ID="ddlAccountBased" AutoPostBack="True" runat="server" OnSelectedIndexChanged="ddlAccountBased_SelectedIndexChanged" class="md-form-control form-control"
                                                                            Enabled="true">
                                                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                                                            <asp:ListItem Value="0" Selected="True">No</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="GL Based" ID="lblAccountBased" CssClass="styleReqFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtGivenByName" runat="server" MaxLength="100" ReadOnly="true" ToolTip="Given By Name"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Given By Name" ID="lblGivenByName" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtReceiptStatus" runat="server" MaxLength="15" ReadOnly="true" ToolTip="Receipt Status"
                                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        <span class="highlight"></span>
                                                                        <span class="bar"></span>
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Receipt Status" ID="lblReceiptStatus" CssClass="styleDisplayLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvBatchNo" runat="server" visible="false">
                                                                    <div class="md-input">
                                                                        <uc:Suggest ID="ddlBatchNo" runat="server" ErrorMessage="Select Invoice Batch No." ValidationGroup="Show" ServiceMethod="GetBatchNo" />
                                                                        <label>
                                                                            <asp:Label runat="server" Text="Invoice Batch No." ToolTip="Invoice Batch No." ID="lblInvoiceBatchNo"
                                                                                CssClass="styleFieldLabel"></asp:Label>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <button class="css_btn_enabled" id="btnCashDeposit" title="Cash Denomination[Alt+Shift+D]" tooltip="Cash Denomination"
                                                                            causesvalidation="false" onserverclick="btnCashDeposit_OnClick" runat="server"
                                                                            type="button" accesskey="D">
                                                                            <i class="fa fa-money" aria-hidden="true"></i>&emsp;Cash <u>D</u>enomination
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvStatus" runat="server" visible="false">
                                                                    <h1 class="title_name" style="font-weight: bolder; font-size: xx-large;">
                                                                        <asp:Label runat="server" ID="lblAccountStatus" CssClass="styleDisplayLabel"></asp:Label>
                                                                    </h1>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <asp:Panel GroupingText="Transaction Amount"
                                                        ID="pnlCurrency" runat="server" CssClass="stylePanel" Width="100%" Visible="false">
                                                        <div class="gird">
                                                            <asp:GridView runat="server" ShowFooter="true"
                                                                ID="grvCurrency" Width="99%" OnRowDeleting="grvCurrency_RowDeleting"
                                                                AutoGenerateColumns="False" class="gird_details">
                                                                <Columns>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" Visible="false" HeaderText="Txn Currency Id">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="Label3" Text='<%#Eval("TXN_CURRENCY_ID")%>' Visible="true"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Txn Currency">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblSNO" Text='<%#Eval("RECEIPT_ID")%>' Visible="false"></asp:Label>
                                                                            <asp:Label runat="server" ID="lblTXN_CURRENCY" Text='<%#Eval("TXN_CURRENCY")%>' ToolTip="Txn Currency"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:DropDownList ID="ddlCurrencyType" runat="server" Width="182px" class="md-form-control form-control" ToolTip="Txn Currency"
                                                                                    AutoPostBack="true" OnSelectedIndexChanged="ddlCurrencyType_SelectedIndexChanged" ValidationGroup="Currency">
                                                                                </asp:DropDownList>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvCurrencyType" runat="server" ControlToValidate="ddlCurrencyType" InitialValue="0"
                                                                                        Display="Dynamic" ErrorMessage="Select the Txn Currency" ValidationGroup="Currency" SetFocusOnError="true"
                                                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Exchange Rate">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblExchange_Rate" Text='<%#Eval("EXCHANGE_RATE")%>' ToolTip="Exchange Rate"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFExchange_Rate" runat="server" Width="182px" ReadOnly="true" ToolTip="Exchange Rate"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Txn Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblTXN_AMOUNT" Text='<%#Eval("TXN_AMOUNT")%>' ToolTip="Txn Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtTXN_AMOUNT" runat="server" Width="182px" AutoPostBack="true" ToolTip="Txn Amount"
                                                                                    OnTextChanged="txtTXN_AMOUNT_TextChanged" class="md-form-control form-control login_form_content_input requires_true"
                                                                                    Style="text-align: right" ValidationGroup="Currency">

                                                                                </asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender
                                                                                    ID="ftxtTXN_AMOUNT" runat="server" Enabled="True" FilterType="Custom, Numbers"
                                                                                    TargetControlID="txtTXN_AMOUNT" ValidChars=".">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                                <div class="validation_msg_box">
                                                                                    <asp:RequiredFieldValidator ID="rfvTxnAmount" runat="server" ControlToValidate="txtTXN_AMOUNT"
                                                                                        Display="Dynamic" ErrorMessage="Select the Txn Amount" ValidationGroup="Currency" SetFocusOnError="true"
                                                                                        CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                </div>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Account Currency">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblAccount_Currency" Text='<%#Eval("ACCOUNT_CURRENCY")%>' ToolTip="Account Currency"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txtFAccount_Currency" runat="server" Width="182px" ReadOnly="true" ToolTip="Account Currency"
                                                                                Style="text-align: left" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Account Amount">
                                                                        <ItemTemplate>
                                                                            <asp:Label runat="server" ID="lblAccount_Amount" Text='<%#Eval("ACCOUNT_AMOUNT")%>' ToolTip="Account Amount"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input">
                                                                                <asp:TextBox ID="txtFAccount_Amount" runat="server" ReadOnly="true" Width="182px" ToolTip="Account Amount"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="lnkDelete" runat="server" CommandName="Delete" CausesValidation="false" Text="Remove"
                                                                                OnClientClick="return confirm('Are you sure you want to Remove this record?');" ToolTip="Remove[Alt+M]"
                                                                                CssClass="grid_btn_delete" AccessKey="M"></asp:Button>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            <div class="md-input" style="margin: 0px;">
                                                                                <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server"
                                                                                    type="button" accesskey="1" title="Add[Alt+1]" validationgroup="Currency">
                                                                                    <i class="fa fa-plus" aria-hidden="true"></i>&emsp;Add
                                                                                </button>
                                                                            </div>
                                                                        </FooterTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <HeaderStyle CssClass="styleGridHeader" />
                                                                <FooterStyle HorizontalAlign="Center" />
                                                                <RowStyle HorizontalAlign="Center" />
                                                            </asp:GridView>
                                                        </div>
                                                    </asp:Panel>
                                                </div>
                                                <div class="row">
                                                    <button class="css_btn_enabled" id="btnAppropriationLogic" title="Suggest[Alt+G]" validationgroup="Appropriation"
                                                        onserverclick="btnAppropriationLogic_OnClick" runat="server"
                                                        type="button" accesskey="G">
                                                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;Su<u>g</u>gest
                                                    </button>
                                                    <button class="css_btn_enabled" id="btnShow" title="Show[Alt+H]" validationgroup="Show"
                                                        onserverclick="btnShow_OnClick" runat="server" causesvalidation="true"
                                                        type="button" accesskey="H">
                                                        <i class="fa fa-search" aria-hidden="true"></i>&emsp;S<u>h</u>ow
                                                    </button>
                                                </div>
                                                <div>
                                                    <div class="row">
                                                        <asp:Panel ID="pnlAccount" runat="server" CssClass="stylePanel" GroupingText="Account Details"
                                                            Visible="False" Width="100%">
                                                            <div id="div1" style="width: 100%;" runat="server" class="gird">
                                                                <asp:GridView ID="gvMLASLA" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                                                    OnRowCancelingEdit="gvMLASLA_RowCancelingEdit" OnRowCommand="gvMLASLA_RowCommand"
                                                                    OnRowDataBound="gvMLASLA_RowDataBound" OnRowDeleting="gvMLASLA_RowDeleting" ShowFooter="True"
                                                                    Width="100%" class="gird_details">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="SNo." Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSNo" runat="server" Visible="false" Text='<% #Bind("SNo")%>'></asp:Label>
                                                                                <asp:HiddenField ID="hiddendetails" runat="server" Value='<%#Bind("RECEIPT_PROC_DETAILS_ID") %>' />
                                                                                <asp:Label ID="lblreceiptdetails" runat="server" Visible="false" Text='<% #Bind("RECEIPT_PROC_DETAILS_ID")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblPANUM" runat="server" ToolTip="Account No" Text='<%#Bind("PrimeAccountNo") %>' Visible="false"></asp:Label>
                                                                                <asp:LinkButton ID="lblPrimeAccountNumber" ToolTip="Account Number"
                                                                                    runat="server" Text='<%#Eval("PrimeAccountNo")%>' CausesValidation="false" Style="color: red; text-underline-position: below;" OnClick="lblMLA_Number_Click"></asp:LinkButton>
                                                                                <asp:Label ID="lblSNos" runat="server" Text='<% #Bind("SNo")%>' Visible="false"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlPANum" runat="server" AppendDataBoundItems="True" AutoPostBack="True" ToolTip="Account No"
                                                                                        OnSelectedIndexChanged="ddlPANum_SelectedIndexChanged" class="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvPANum" runat="server" ControlToValidate="ddlPANum"
                                                                                            Display="Dynamic" InitialValue="0" ErrorMessage="Select the Account No" CssClass="validation_msg_box_sapn"
                                                                                            ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField Visible="false" HeaderText="Sub Account No">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSANUM" runat="server" Text='<%#Bind("SubAccountNo") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlSANum" runat="server" class="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Description Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDesc" runat="server" Text='<%#Bind("AccountDescriptionId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="MICR NO" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblMICRNO" runat="server" Text='<%#Bind("MICRNO") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="PDC Instrument No" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblIPDCNo" Text='<%#Bind("PDCREFNO") %>' Visible="false" runat="server"></asp:Label>
                                                                                <asp:Label ID="Label1" Text='<%#Bind("PDCREFNOBankName") %>' ToolTip="PDC Instrument No" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlPdcRefNo" runat="server" AutoPostBack="True" ToolTip="PDC Instrument No" class="md-form-control form-control"
                                                                                        OnSelectedIndexChanged="ddlPdcRefNo_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <asp:Button ID="btnftInvoiceAdd" Width="30px" runat="server"
                                                                                        CssClass="grid_btn" Text=".." ToolTip="Ref the Details, Alt+R" AccessKey="R" OnClick="btnftInvoiceAdd_Click" Visible="false"></asp:Button>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Account Description">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblAccDescription" runat="server" ToolTip="Account Description" Text='<%#Bind("AccountDescription") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <asp:DropDownList ID="ddlAccDesc" runat="server" AutoPostBack="True"
                                                                                        class="md-form-control form-control" ToolTip="Account Description"
                                                                                        OnSelectedIndexChanged="ddlAccDesc_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvAccDes" runat="server" ControlToValidate="ddlAccDesc"
                                                                                            Display="Dynamic" InitialValue="0" ErrorMessage="Select the Account Description" CssClass="validation_msg_box_sapn"
                                                                                            ValidationGroup="AccountDetails"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="GLAccount Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGLAccDesc" runat="server" Text='<%#Bind("GLAccountId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlGLAccDesc" runat="server" Text='<%#Bind("GLAccountId") %>'></asp:Label>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="GL Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblGLAccount" runat="server" Text='<%#Bind("GLAccount") %>' ToolTip="GL Account"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlGLAccount" runat="server" ToolTip="GL Account">
                                                                                </asp:Label>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SLAccount Id" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLAccDesc" runat="server" Text='<%#Bind("SLAccountId") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="ddlSLAccDesc" runat="server" Text='<%#Bind("SLAccountId") %>'></asp:Label>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="SL Account">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblSLAccount" runat="server" Text='<%#Bind("SLAccount") %>' ToolTip="SL Account"></asp:Label>
                                                                                <asp:HiddenField ID="hiddenslcode" runat="server" Value='<%#Bind("SLAccount") %>' />
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:Label ID="ddlSLAccount" runat="server" Text='<%#Bind("SLAccount") %>' ToolTip="SL Account"> </asp:Label>
                                                                                    <asp:DropDownList ID="ddlSLAccDescF" runat="server" AutoPostBack="True" Visible="false"
                                                                                        Width="130px" class="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="NTD Instrument No" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNTDInstrumentNo" runat="server" Text='<%#Bind("NTDInstrumentNo") %>' ToolTip="NTD Instrument No"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:DropDownList ID="ddlNTDInstrumentNo" runat="server" class="md-form-control form-control" ToolTip="NTD Instrument No">
                                                                                    </asp:DropDownList>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Next Banking Date" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNextBankingDate" runat="server" Text='<%#Bind("NEXTBANKINGDATE") %>' ToolTip="Next Banking Date"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input" style="margin: 0px;">
                                                                                    <table>
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txtNTDDays" runat="server" Style="text-align: right;" AutoComplete="off" Width="35px" MaxLength="2"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="NTD Days"
                                                                                                            AutoPostBack="true" OnTextChanged="txtNTDDays_TextChanged"></asp:TextBox>
                                                                                                        <cc1:FilteredTextBoxExtender ID="ftetxtNTDDays" runat="server" TargetControlID="txtNTDDays"
                                                                                                            FilterType="Numbers" Enabled="true">
                                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                                        <span class="highlight"></span>
                                                                                                        <span class="bar"></span>
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <div class="md-input">
                                                                                                        <asp:TextBox ID="txtNextBankingDate" Enabled="false" runat="server" AutoComplete="off" Width="125px"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="Next Banking Date"></asp:TextBox>
                                                                                                        <%-- <cc1:FilteredTextBoxExtender
                                                                                                            ID="FilteredTextBoxExtender1" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                                                                            TargetControlID="txtNextBankingDate" ValidChars="/-">
                                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                                        <cc1:CalendarExtender ID="ceNextBankingDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                                                                            PopupButtonID="imgNextBankingDate" TargetControlID="txtNextBankingDate">
                                                                                                        </cc1:CalendarExtender>--%>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </thead>
                                                                                    </table>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Taxable Amount">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtAmount" runat="server" Text='<%#Bind("Amount") %>' ToolTip="Amount"
                                                                                    OnTextChanged="txtAmount_TextChanged" AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAmount" runat="server" TargetControlID="txtAmount"
                                                                                    FilterType="Custom,Numbers" ValidChars=".," Enabled="True">
                                                                                </cc1:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="txtAccountAmount" onchange="fnthousands_separators(this,1)" runat="server" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                                        class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                    <cc1:FilteredTextBoxExtender ID="ftxtAccountAmount" runat="server" TargetControlID="txtAccountAmount"
                                                                                        FilterType="Custom,Numbers" ValidChars=".," Enabled="True">
                                                                                    </cc1:FilteredTextBoxExtender>
                                                                                    <div class="validation_msg_box">
                                                                                        <asp:RequiredFieldValidator ID="rfvAcAmount" runat="server" ControlToValidate="txtAccountAmount"
                                                                                            Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="AccountDetails" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                        <asp:RequiredFieldValidator ID="rfvInstAmount" runat="server" ControlToValidate="txtAccountAmount"
                                                                                            Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="InstallmentDet" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                    </div>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Tax Rate">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtTaxPercentage" runat="server" Text='<%#Bind("TAXPERCENTAGE") %>' ToolTip="Tax Rate" Width="70px"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="ftxtTaxPercentage" onchange="fnthousands_separators(this,1)" runat="server" ToolTip="Tax Rate" AutoCompleteType="Disabled"
                                                                                        class="md-form-control form-control login_form_content_input requires_true" Visible="false"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="VAT Amount">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtTaxAmount" runat="server" Text='<%#Bind("TAXAMOUNT") %>' ToolTip="Tax Amount" Width="70px"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="ftxtTaxAmount" onchange="fnthousands_separators(this,1)" runat="server" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                                        class="md-form-control form-control login_form_content_input requires_true" Visible="false"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                         <asp:TemplateField Visible="false" HeaderText="Tax Applicable">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtTaxApplicable" runat="server" Text='<%#Bind("TAX_APPLICABLE") %>' ToolTip="Tax Amount" Width="70px"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right;"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Total Amount">
                                                                            <ItemTemplate> 
                                                                                <asp:TextBox ID="txtTotalTaxAmount" runat="server" Text='<%#Bind("TOTALAMOUNT") %>' ToolTip="Total Amt.(Inc. VAT)" Width="150px"
                                                                                    class="md-form-control form-control login_form_content_input requires_true" Enabled="false"></asp:TextBox>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:TextBox ID="ftxtTotalTaxAmount" onchange="fnthousands_separators(this,1)" runat="server" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                                        class="md-form-control form-control login_form_content_input requires_true" Visible="false"></asp:TextBox>
                                                                                    <span class="highlight"></span>
                                                                                    <span class="bar"></span>
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View Installments" Visible="false">
                                                                            <ItemTemplate>
                                                                                <%--<asp:Button ID="btnInstallmentNoI" runat="server" Text="Installments" ToolTip="Installments" Width="100%" OnClick="btnInstallmentNoI_Click" CssClass="grid_btn" />--%>
                                                                                <button class="css_btn_enabled" id="btnInstallmentNoI" title="Installments[Alt+I]" onserverclick="btnInstallmentNoI_Click" runat="server"
                                                                                    type="button" accesskey="I">
                                                                                    <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>I</u>nstallments
                                                                                </button>

                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:Button ID="btnInstallmentNoF" Visible="false" runat="server" Text="Installments" ToolTip="Installments" ValidationGroup="InstallmentDet" Width="100%" OnClick="btnInstallmentNoF_Click" CssClass="grid_btn" />
                                                                                </div>
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="View Invoice" Visible="false">
                                                                            <ItemTemplate>
                                                                                <%--<asp:Button ID="btnInvoiceI" runat="server" Text="Invoice" Width="100%" ToolTip="View Invoice" OnClick="btnInvoiceI_Click" CssClass="grid_btn" />--%>
                                                                                <button class="css_btn_enabled" id="btnInvoiceI" title="Invoice[Alt+I]" onserverclick="btnInvoiceI_Click" runat="server"
                                                                                    type="button" accesskey="I">
                                                                                    <i class="fa fa-search" aria-hidden="true"></i>&emsp;<u>I</u>nvoice
                                                                                </button>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Button ID="btnInvoiceF" runat="server" Text="Invoice" ValidationGroup="InstallmentDet" Width="100%"
                                                                                    OnClick="btnInvoiceF_Click" CssClass="grid_btn" ToolTip="Invoice" Visible="false" />
                                                                            </FooterTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <FooterStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                            ItemStyle-Width="70px">
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="lnkEdit" runat="server" CausesValidation="false" CommandName="Delete" ToolTip="Remove[Alt+R]"
                                                                                    Text="Remove" CssClass="grid_btn_delete" AccessKey="R"></asp:Button>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <div class="md-input">
                                                                                    <asp:Button ID="btnAdd" runat="server" CausesValidation="true" CssClass="grid_btn" ToolTip="Add[Alt+A]"
                                                                                        ValidationGroup="AccountDetails" CommandName="Add" Text="Add" AccessKey="A"></asp:Button>
                                                                                </div>
                                                                                <%-- <div class="md-input" style="margin: 0px;">
                                                                         <button class="css_btn_enabled" id="btnAdd" onserverclick="btnAdd_Click" runat="server"
                                                                             type="button" accesskey="A" title="Add[Alt+A]" validationgroup="Currency">
                                                                             <i class="fa fa-plus" aria-hidden="true"></i>&emsp;<u>A</u>dd
                                                                         </button>
                                                                     </div>--%>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="CashflowId" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblCFMID" runat="server" Text='<%#Bind("CFMID") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <FooterTemplate>
                                                                                <asp:Label ID="lblCFM" runat="server" Width="100px" Text='<%#Bind("CFMID") %>'> </asp:Label>
                                                                            </FooterTemplate>
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="InstallmentDate" Visible="false">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblInstallmentDate" runat="server" Text='<%#Bind("InstallmentDate") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                            <div class="row" style="float: right; padding-right: 11%;">
                                                                <asp:Label ID="lblTotal1" runat="server" Text="Total : "
                                                                    Style="padding-right: 74px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                                <asp:Label ID="lblTotal" runat="server" Text="" Style="padding-right: 74px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row" style="display: none;">
                                                        <asp:Panel ID="divRoiRules" runat="server" CssClass="accordionHeader" Width="100%">
                                                            <div style="float: left;">
                                                                Add/Less details
                                                            </div>
                                                            <div style="float: left; margin-left: 20px;">
                                                                <asp:Button ID="btnAddLess" runat="server" Style="display: none;" CssClass="styleSubmitButton"
                                                                    Text="Show Details..." OnClick="btnAddLess_OnClick" />
                                                                <asp:Label ID="lblDetails" runat="server" onclick='funshowaddless()'>(Show Details...)</asp:Label>
                                                            </div>
                                                            <div style="float: right; vertical-align: middle;">
                                                                <asp:ImageButton ID="imgDetails" runat="server" OnClientClick="funshowaddless()"
                                                                    ImageUrl="~/Images/expand_blue.jpg" AlternateText="(Show Details...)" />
                                                            </div>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="row" style="display: none;">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Panel ID="pnlAddLess" runat="server" CssClass="stylePanel" Width="100%">
                                                                <div class="gird">
                                                                    <asp:GridView ID="gvAddLess" OnRowDeleting="gvAddLess_RowDeleting" ShowFooter="true"
                                                                        runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAddLess_RowDataBound"
                                                                        Width="100%" class="gird_details">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="AccountNo">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAddLessPrimeAccountNo" ToolTip="Account No" runat="server" Text='<%# Bind("PrimeAccountNo") %>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input" style="margin: 0px;">
                                                                                        <asp:DropDownList ID="ddlPrimeAccountNo" runat="server" ToolTip="Account No"
                                                                                            OnSelectedIndexChanged="ddlPrimeAccountNo_SelectedIndexChanged"
                                                                                            AutoPostBack="true" class="md-form-control form-control">
                                                                                        </asp:DropDownList>
                                                                                        <span class="highlight"></span>
                                                                                        <span class="bar"></span>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Sub AccountNo" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSubAccountNo" runat="server" Text='<%# Bind("SubAccountNo") %>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:DropDownList ID="ddlSubAccountNo" runat="server" class="md-form-control form-control">
                                                                                    </asp:DropDownList>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="AddLessId" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAddLessId" runat="server" Text='<%# Bind("AddLessId") %>' />
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Add or Less">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAddLess" runat="server" Text='<%# Bind("AddLess") %>' ToolTip="Add or Less" />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlAddLess" runat="server" AutoPostBack="true" ToolTip="Add or Less"
                                                                                            OnSelectedIndexChanged="ddlAddLess_SelectedIndexChanged" class="md-form-control form-control">
                                                                                            <asp:ListItem Selected="True" Text="--Select--" Value="0">
                                                                                            </asp:ListItem>
                                                                                            <asp:ListItem Text="Add" Value="1">
                                                                                            </asp:ListItem>
                                                                                            <asp:ListItem Text="Less" Value="2">
                                                                                            </asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvAddLess" runat="server" ControlToValidate="ddlAddLess"
                                                                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select a Add or Less"
                                                                                                ValidationGroup="AddLess" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="TaxId" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTaxId" runat="server" Text='<%# Bind("TaxId") %>' />
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Tax Type">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblTaxType" runat="server" Text='<%# Bind("TaxType") %>' ToolTip="Tax Type" />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input">
                                                                                        <asp:DropDownList ID="ddlTaxType" runat="server" OnSelectedIndexChanged="ddlTaxType_SelectedIndexChanged"
                                                                                            AutoPostBack="true" class="md-form-control form-control">
                                                                                        </asp:DropDownList>

                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvTaxType" runat="server" ControlToValidate="ddlTaxType"
                                                                                                Display="Dynamic" InitialValue="0" ErrorMessage="Select a Tax Type" ValidationGroup="AddLess"
                                                                                                CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="GL Account">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblGLAccCode" runat="server" Text='<%# Bind("GLAccCode") %>' ToolTip="GL Account"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="SL Account">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSLAccCode" runat="server" Text='<%# Bind("SLAccCode") %>' ToolTip="SL Account"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblAddLessAmount" runat="server" Text='<%# Bind("Amount") %>' ToolTip="Amount" />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <div class="md-input">
                                                                                        <asp:TextBox ID="txtAddLessAmount" Style="text-align: right;" runat="server" ToolTip="Amount"
                                                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtAddLessAmount" runat="server" TargetControlID="txtAddLessAmount"
                                                                                            FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                                        </cc1:FilteredTextBoxExtender>

                                                                                        <div class="validation_msg_box">
                                                                                            <asp:RequiredFieldValidator ID="rfvAddAmount" runat="server" ControlToValidate="txtAddLessAmount"
                                                                                                Display="Dynamic" ErrorMessage="Enter the Amount" ValidationGroup="AddLess" CssClass="validation_msg_box_sapn">
                                                                                            </asp:RequiredFieldValidator>
                                                                                        </div>
                                                                                    </div>
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                                <FooterStyle HorizontalAlign="Right" />
                                                                                <ItemStyle HorizontalAlign="Right" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                                ItemStyle-Width="70px" FooterStyle-Width="70px">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="lbtnRemove" runat="server" CausesValidation="false" Text="Remove" ToolTip="Remove"
                                                                                        CommandName="Delete" CssClass="grid_btn_delete"></asp:Button>
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:Button ID="btnAdd" runat="server" CssClass="grid_btn" ValidationGroup="AddLess" ToolTip="Add"
                                                                                        Text="Add" OnClick="btnInsertAddLess_OnClick" />
                                                                                </FooterTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="CashFlowFlag" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblCFMID" runat="server" Text='<%# Bind("cashflow_flag_id") %>' />
                                                                                </ItemTemplate>
                                                                                <FooterTemplate>
                                                                                    <asp:Label ID="lblCFMID1" runat="server" Text='<%# Bind("cashflow_flag_id") %>' />
                                                                                </FooterTemplate>
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                    </asp:GridView>
                                                                </div>
                                                                <div>
                                                                    <asp:Label ID="lblAddTotal" runat="server" Style="padding-right: 74px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                                    <asp:Label ID="lblLessTotal" runat="server" Style="padding-right: 74px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                                </div>
                                                            </asp:Panel>
                                                        </div>
                                                    </div>
                                                    <div class="row" runat="server" visible="false">
                                                        <cc1:CollapsiblePanelExtender ID="cpeDemo" runat="Server" TargetControlID="pnlAddLess"
                                                            ExpandControlID="divRoiRules" CollapseControlID="divRoiRules" Collapsed="True"
                                                            TextLabelID="lblDetails" ImageControlID="imgDetails" ExpandedText="(Hide Details...)"
                                                            CollapsedText="(Show Details...)" ExpandedImage="~/Images/collapse_blue.jpg"
                                                            CollapsedImage="~/Images/expand_blue.jpg" SuppressPostBack="false" SkinID="CollapsiblePanelDemo" />
                                                    </div>

                                                    <div class="row">
                                                        <asp:Panel ID="pnlShowMethod" runat="server" CssClass="stylePanel" GroupingText="Installment Details"
                                                            Width="100%">
                                                            <asp:UpdatePanel ID="updShow" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <div style="float: right; margin-top: 5px;">
                                                                            <button class="css_btn_enabled" id="btnShowApply" title="Apply[Alt+Shift+Y]" visible="false"
                                                                                causesvalidation="false" onserverclick="btnShowApply_OnClick" runat="server"
                                                                                type="button" accesskey="Y">
                                                                                <i class="fa fa-check" aria-hidden="true"></i>&emsp;Appl<u>y</u>
                                                                            </button>
                                                                        </div>
                                                                        <div>
                                                                            <div class="gird" style="max-height: 450px; overflow-y: scroll;">
                                                                                <asp:GridView ID="gvShowInstallment" runat="server" AutoGenerateColumns="false" Width="100%"
                                                                                    OnRowDataBound="gvShowInstallment_RowDataBound" class="gird_details">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="PrimeAccountNo" HeaderText="Account No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="SubAccountNo" HeaderText="Sub Account No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" Visible="false" />
                                                                                        <asp:BoundField DataField="PDCInstrumentNo" HeaderText="PDC Instrument No" HeaderStyle-HorizontalAlign="Right"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="INSTALLMENT_NO" HeaderText="Installment No." HeaderStyle-HorizontalAlign="Right"
                                                                                            ItemStyle-HorizontalAlign="Right" />
                                                                                        <asp:BoundField DataField="InstallmentDate" HeaderText="Installment Date" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Center" />
                                                                                        <asp:BoundField DataField="AccountDescription" HeaderText="Account Description" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="txtShowAmount" runat="server" Text='<%#Bind("Amount") %>' Enabled="true" AutoPostBack="true"
                                                                                                    Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"
                                                                                                    OnTextChanged="txtShowAmount_TextChanged" />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblFlagId" runat="server" Text='<%#Bind("AccountDescriptionId") %>' />
                                                                                                <asp:Label ID="lblInstallmentDate" runat="server" Visible="false" Text='<%#Bind("InstallmentDate") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCFMId" runat="server" Text='<%#Bind("CFMID") %>' />
                                                                                                <asp:Label ID="lblInstallment_No" runat="server" Text='<%#Bind("INSTALLMENT_NO") %>' />
                                                                                                <asp:Label ID="lblPrimeAccountNo" runat="server" Text='<%#Bind("PrimeAccountNo") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblGL_Account" runat="server" Text='<%#Bind("GL_Account") %>' />
                                                                                                <asp:Label ID="lblGL_Account_Desc" runat="server" Text='<%#Bind("GL_Account_Desc") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSL_Account" runat="server" Text='<%#Bind("SL_Account") %>' />
                                                                                                <asp:Label ID="lblSL_Account_Desc" runat="server" Text='<%#Bind("SL_Account_Desc") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblShowAmount" runat="server" Text='<%#Bind("Amount") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:fnSelectAll(this,'chkSelect');" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                            <div class="gird" style="max-height: 450px; overflow-y: scroll;" id="dvFactoringInvoice" runat="server" visible="false">
                                                                                <asp:Panel ID="pnlFacInvoice" runat="server" CssClass="stylePanel" GroupingText="Invoice Details"
                                                                                    Width="100%">
                                                                                    <div style="width: 100%;" class="gird">
                                                                                        <asp:GridView ID="grvFacInvoice" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                                                                                            OnRowCommand="grvFacInvoice_RowCommand"
                                                                                            OnRowDataBound="grvFacInvoice_RowDataBound" OnRowDeleting="grvFacInvoice_RowDeleting" ShowFooter="True"
                                                                                            Width="100%" class="gird_details">
                                                                                            <Columns>
                                                                                                <asp:TemplateField HeaderText="SNo." Visible="false">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblSNo" runat="server" Visible="false" Text='<% #Bind("SNo")%>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Invoice No">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblInvoice_no" runat="server" ToolTip="Invoice No" Text='<%#Bind("Invoice_no") %>'></asp:Label>
                                                                                                        <asp:Label ID="lblInvoice_ID" runat="server" ToolTip="Invoice ID" Text='<%#Bind("INVOICE_ID") %>' Visible="false"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <uc:Suggest ID="ddlInvoiceNumber" Width="135px" OnItem_Selected="ddlInvoiceNumber_SelectedIndexChanged"
                                                                                                                AutoPostBack="true" runat="server" ErrorMessage="Enter Invoice Number" IsMandatory="true"
                                                                                                                ValidationGroup="btnAddInvoice" ServiceMethod="GetInvoicenumberList" />
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Invoice Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblInvoice_Date" runat="server" Text='<%#Bind("Invoice_Date") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFInvoice_Date" runat="server" Text='<%#Bind("Invoice_Date") %>' ToolTip="Amount"
                                                                                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: center"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Invoice Amount">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblInvoice_Amount" runat="server" Text='<%#Bind("Invoice_Amount") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFInvoice_Amount" runat="server" Text='<%#Bind("Invoice_Amount") %>' ToolTip="Invoice Amount"
                                                                                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Invoice Due Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblInvoice_Due_Date" runat="server" Text='<%#Bind("Invoice_Due_Date") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFInvoiceDueDate" runat="server" Text='<%#Bind("Invoice_Due_Date") %>' ToolTip="Invoice Due Date"
                                                                                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: center"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Outstanding days">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblOutstanding_days" Text='<%#Bind("Outstanding_days") %>' ToolTip="Realized Amt as on Date" runat="server"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFOutstanding_days" runat="server" Text='<%#Bind("Outstanding_days") %>' ToolTip="Outstanding days"
                                                                                                                class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Realized Amt as on Date">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblRealized_Amount" Text='<%#Bind("Realized_Amount") %>' ToolTip="Realized Amt as on Date" runat="server"></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFRealized_Amount" runat="server" Text='<%#Bind("Realized_Amount") %>' ToolTip="Realized Amt as on Date"
                                                                                                                class="md-form-control form-control login_form_content_input requires_true" Enabled="false" Style="text-align: right"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Balance Amount">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblBalanceAmount" runat="server" ToolTip="Balance Amount" Text='<%#Bind("Balance_Amount") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input" style="margin: 0px;">
                                                                                                            <asp:TextBox ID="txtFBalanceAmount" runat="server" Text='<%#Bind("Balance_Amount") %>' Enabled="false" ToolTip="Amount"
                                                                                                                AutoPostBack="true" class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Un-Aproved Amount">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Label ID="lblUnapprovedAmount" runat="server" Text='<%#Bind("Un_ApprovedAmount") %>'></asp:Label>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <asp:TextBox ID="txtFUnapprovedAmount" runat="server" Text='<%#Bind("Un_ApprovedAmount") %>' Enabled="false" ToolTip="Amount"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right"></asp:TextBox>
                                                                                                    </FooterTemplate>
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Allocated Amount">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:TextBox ID="txtAllocatedAmount" runat="server" Text='<%#Bind("AllocatedAmount") %>' ToolTip="Amount"
                                                                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right" ReadOnly="true"></asp:TextBox>
                                                                                                        <cc1:FilteredTextBoxExtender ID="ftxtAmount" runat="server" TargetControlID="txtAllocatedAmount"
                                                                                                            FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                                                        </cc1:FilteredTextBoxExtender>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input">
                                                                                                            <asp:TextBox ID="txtFAllocatedAmount" runat="server" ToolTip="Amount" AutoCompleteType="Disabled"
                                                                                                                class="md-form-control form-control login_form_content_input requires_true"
                                                                                                                OnTextChanged="txtFAllocatedAmount_TextChanged" AutoPostBack="true" Style="text-align: right"></asp:TextBox>
                                                                                                            <span class="highlight"></span>
                                                                                                            <span class="bar"></span>
                                                                                                            <cc1:FilteredTextBoxExtender ID="ftxtAccountAmount" runat="server" TargetControlID="txtFAllocatedAmount"
                                                                                                                FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                                                            </cc1:FilteredTextBoxExtender>
                                                                                                            <div class="validation_msg_box">
                                                                                                                <asp:RequiredFieldValidator ID="rfvAcAmount" runat="server" ControlToValidate="txtFAllocatedAmount"
                                                                                                                    Display="Dynamic" ErrorMessage="Enter the Allocated Amount" ValidationGroup="btnInvAdd" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                    <FooterStyle HorizontalAlign="Right" />
                                                                                                    <ItemStyle HorizontalAlign="Right" />
                                                                                                </asp:TemplateField>
                                                                                                <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                                                                    ItemStyle-Width="70px">
                                                                                                    <ItemTemplate>
                                                                                                        <asp:Button ID="lnkInvoiceDelete" runat="server" CausesValidation="false" CommandName="Delete" ToolTip="Remove[Alt+R]"
                                                                                                            Text="Remove" CssClass="grid_btn_delete" AccessKey="R" OnClientClick="return confirm('Are you sure you want to Remove this record?');"></asp:Button>
                                                                                                    </ItemTemplate>
                                                                                                    <FooterTemplate>
                                                                                                        <div class="md-input">
                                                                                                            <asp:Button ID="btnAddInvoice" runat="server" CausesValidation="true" CssClass="grid_btn" ToolTip="Add[Alt+A]"
                                                                                                                ValidationGroup="btnInvAdd" CommandName="Add" Text="Add" AccessKey="A"></asp:Button>
                                                                                                        </div>
                                                                                                    </FooterTemplate>
                                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                                </asp:TemplateField>
                                                                                            </Columns>
                                                                                        </asp:GridView>
                                                                                    </div>
                                                                                    <div class="row" style="float: right; padding-right: 5%;">
                                                                                        <asp:Label ID="lblFacInvoiceTot" runat="server" Text="Total Invoice : "
                                                                                            Style="padding-right: 9px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                                                        <asp:Label ID="lblFacInvoiceTotAmt" runat="server" Text="" Style="padding-right: 9px" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                                                    </div>
                                                                                </asp:Panel>
                                                                            </div>
                                                                            <div class="gird" style="max-height: 450px; overflow-y: scroll;">
                                                                                <asp:GridView ID="grvShowInvoice" runat="server" AutoGenerateColumns="false"
                                                                                    OnRowDataBound="grvShowInvoice_RowDataBound" Width="100%" class="gird_details">
                                                                                    <Columns>
                                                                                        <asp:BoundField DataField="PrimeAccountNo" HeaderText="Account No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="AccountDescription" HeaderText="Account Description" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="FIL_NO" HeaderText="Batch No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="INVOICE_NO" HeaderText="Invoice No" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Left" />
                                                                                        <asp:BoundField DataField="INVOICE_AMOUNT" HeaderText="Invoice Amount" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Right" />
                                                                                        <asp:BoundField DataField="PAID_AMOUNT" HeaderText="Paid Amount" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Right" />
                                                                                        <asp:BoundField DataField="Amount_To_Paid" HeaderText="Amount To Paid" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Right" />
                                                                                        <asp:BoundField DataField="GAP_DAYS" HeaderText="Outstanding days" HeaderStyle-HorizontalAlign="Center"
                                                                                            ItemStyle-HorizontalAlign="Right" />
                                                                                        <asp:TemplateField HeaderText="Amount" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="txtAmount" runat="server" Text='<%#Bind("Amount") %>'
                                                                                                    Style="text-align: right;" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                                                                <cc1:FilteredTextBoxExtender ID="ftxtAmount" runat="server" TargetControlID="txtAmount"
                                                                                                    FilterType="Custom,Numbers" ValidChars=".," Enabled="True">
                                                                                                </cc1:FilteredTextBoxExtender>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblFlagId" runat="server" Text='<%#Bind("AccountDescriptionId") %>' />
                                                                                                <asp:Label ID="lblInstallmentDate" runat="server" Visible="false" Text='<%#Bind("InstallmentDate") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblCFMId" runat="server" Text='<%#Bind("CFMID") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblGL_Account" runat="server" Text='<%#Bind("GL_Account") %>' />
                                                                                                <asp:Label ID="lblGL_Account_Desc" runat="server" Text='<%#Bind("GL_Account_Desc") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField Visible="false" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSL_Account" runat="server" Text='<%#Bind("SL_Account") %>' />
                                                                                                <asp:Label ID="lblFSL_Account_Desc" runat="server" Text='<%#Bind("SL_Account_Desc") %>' />
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Invoice ID" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblINVOICE_ID" runat="server" Text='<% #Bind("INVOICE_ID")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Entity ID" Visible="false">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblEntity" runat="server" Text='<% #Bind("ENTITY_ID")%>'></asp:Label>
                                                                                            </ItemTemplate>
                                                                                            <ItemStyle HorizontalAlign="right" />
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                                                                            <HeaderTemplate>
                                                                                                <asp:CheckBox ID="chkSelectAll" runat="server" onclick="javascript:fnSelectAll(this,'chkSelect');" />
                                                                                            </HeaderTemplate>
                                                                                            <ItemTemplate>
                                                                                                <asp:CheckBox ID="chkSelect" runat="server" />
                                                                                            </ItemTemplate>
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
                                                <div class="row">
                                                    <asp:Panel DefaultButton="btnPassword" ID="PnlPassword" Style="display: none" runat="server"
                                                        Height="25%" BackColor="White" BorderStyle="Solid" BorderColor="Black" Width="30%">
                                                        <div>
                                                            <div class="row">
                                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                                    <div class="md-input">
                                                                        <asp:TextBox ID="txtPassword" ToolTip="password" runat="server" Width="200px" TextMode="Password" class="md-form-control form-control login_form_content_input requires_true"
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
                                                                <asp:Button ID="btnPassword" ToolTip="Authenticate password" CausesValidation="false"
                                                                    CssClass="styleSubmitButton" OnClick="btnPassword_Click" Text="Submit" runat="server" />

                                                                <asp:Button ID="btnCancelPass" ToolTip="Cancel" CausesValidation="false" OnClick="btnCancelPass_Click"
                                                                    CssClass="styleSubmitButton" Text="Cancel" runat="server" />
                                                            </div>
                                                            <div class="row">
                                                                <div class="md-input">
                                                                    <asp:Label ID="lblErrorMessagePass" runat="server" CssClass="styleMandatoryLabel" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:Panel>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtenderPassword" runat="server" TargetControlID="ddlAccountBased"
                                                        PopupControlID="PnlPassword" BackgroundCssClass="styleModalBackground" DynamicServicePath=""
                                                        Enabled="True">
                                                    </cc1:ModalPopupExtender>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="TabControlDataSheet" runat="server" BackColor="Red" CssClass="tabpan"
                                HeaderText="Drawee/Deposit Bank" Width="98%">
                                <HeaderTemplate>
                                    Drawee/Deposit Bank
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtInstrumentNo" runat="server" onkeypress="return NumericCheck(event)"
                                                            MaxLength="10" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblInstrumentNo" runat="server" CssClass="styleDisplayLabel" Text="Instrument No"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvInstrumentNo" runat="server" ControlToValidate="txtInstrumentNo" SetFocusOnError="true" Display="Dynamic" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Enter Instrument No" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtInstrumentDate" runat="server" Enabled="False" AutoComplete="off" ReadOnly="True"
                                                            class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender
                                                            ID="ftxtInstrumentDate" runat="server" Enabled="True" FilterType="Custom, Numbers, UppercaseLetters, LowercaseLetters"
                                                            TargetControlID="txtInstrumentDate" ValidChars="/-">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <cc1:CalendarExtender ID="calInstrumentDate" runat="server" Enabled="True" Format="DD/MM/YYYY"
                                                            PopupButtonID="imgInstrumentDate"
                                                            TargetControlID="txtInstrumentDate">
                                                        </cc1:CalendarExtender>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator
                                                                ID="rfvInstrumentDate" runat="server" ControlToValidate="txtInstrumentDate" CssClass="validation_msg_box_sapn"
                                                                Display="Dynamic" Enabled="False" ErrorMessage="Enter Instrument Date" SetFocusOnError="True"
                                                                ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblInstrumentDate" runat="server" CssClass="styleDisplayLabel" Text="Instrument Date"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <uc:Suggest ID="ddlDraweeBank" runat="server" ServiceMethod="GetDraweeBank" AutoPostBack="true" ToolTip="Drawee Bank"
                                                            OnItem_Selected="ddlDraweeBank_SelectedIndexChanged" ErrorMessage="Select a Drawee Bank" IsMandatory="true" ValidationGroup="Submit" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDraweeBank" runat="server" CssClass="styleDisplayLabel" Text="Drawee Bank"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvDraweeLocation">
                                                    <div class="md-input">
                                                        <uc:Suggest ID="ddlDraweeLocation" runat="server" ServiceMethod="GetDraweeLocation" ToolTip="Drawee Branch"
                                                            ErrorMessage="Select Branch" IsMandatory="true" ValidationGroup="Submit" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDraweeLocation" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvLocation" runat="server" visible="false">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtLocation" runat="server" MaxLength="40" class="md-form-control form-control login_form_content_input requires_true" Visible="false"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtLocation" runat="server" Enabled="True" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                            TargetControlID="txtLocation" ValidChars=" ">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblLocation" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvtxtLocation" runat="server" ControlToValidate="txtLocation" SetFocusOnError="true" Display="Dynamic" InitialValue="" CssClass="validation_msg_box_sapn"
                                                                ErrorMessage="Enter Branch" ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtDraweeBankAccNo" runat="server" MaxLength="30"
                                                            class="md-form-control form-control login_form_content_input requires_true" ToolTip="Drawee Bank Acc No."></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDraweeBankAccNo" runat="server" CssClass="styleDisplayLabel" Text="Drawee Bank Acc No."></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtPaymentGateway" runat="server" MaxLength="25" onkeypress="return NumericCheck(event)" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblpaymentGateway" runat="server" CssClass="styledReqFieldLabel" Text="MICR"></asp:Label>
                                                        </label>
                                                    </div>
                                                    <div class="validation_msg_box">
                                                        <asp:RequiredFieldValidator
                                                            ID="rfvMICR" runat="server" ControlToValidate="txtPaymentGateway" CssClass="validation_msg_box_sapn"
                                                            Display="Dynamic" Enabled="False" ErrorMessage="Enter MICR" SetFocusOnError="True"
                                                            ValidationGroup="Submit"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtACKNo" runat="server" MaxLength="12" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="ftxtACKNo" runat="server" Enabled="True" FilterType="Custom, UppercaseLetters, LowercaseLetters"
                                                            TargetControlID="txtACKNo" ValidChars="">
                                                        </cc1:FilteredTextBoxExtender>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblACKNo" runat="server" CssClass="styleDisplayLabel" Text="ACK No"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="TxtBank" runat="server" MaxLength="50" Visible="False" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblBankName" runat="server" Text="Bank Name" Visible="False"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDraweeBank" runat="server" ControlToValidate="TxtBank"
                                                                Display="Dynamic" InitialValue="" Enabled="true" ErrorMessage="Select a Bank Name"
                                                                ValidationGroup="Submit" CssClass="validation_msg_box_sapn"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlDepositBankName" ToolTip="Bank Name" runat="server" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDepositBankName_SelectedIndexChanged" class="md-form-control form-control" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDepbankname" runat="server" Display="Dynamic" ControlToValidate="ddlDepositBankName"
                                                                ValidationGroup="Submit" InitialValue="0" ErrorMessage="Select Deposit Bank" CssClass="validation_msg_box_sapn"
                                                                Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDepositBank" ToolTip="Deposit Bank" runat="server" Text="Deposit Bank" CssClass="styleReqFieldLabel" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:DropDownList ID="ddlDepAcctNumber" ToolTip="Account Number" runat="server" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlDepAcctNumber_SelectedIndexChanged" class="md-form-control form-control" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDepActNumber" runat="server" Display="Dynamic" ControlToValidate="ddlDepAcctNumber"
                                                                ValidationGroup="Submit" InitialValue="0" ErrorMessage="Select Account Number"
                                                                CssClass="validation_msg_box_sapn" Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblDepAcctnumber" ToolTip="Account Number" runat="server" Text="Account Number"
                                                                CssClass="styleReqFieldLabel" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtIFSC_Code" runat="server" ToolTip="MICR Code" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblIFSC_Code" runat="server" ToolTip="MICR Code" Text="MICR Code"
                                                                CssClass="styleFieldLabel" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtBankbranch" runat="server" ToolTip="Bank Branch" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblBankbranch" runat="server" ToolTip="Bank Branch" Text="Bank Branch" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtGLCode" runat="server" ToolTip="GL Code" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvDepGlCode" runat="server" Display="Dynamic" ControlToValidate="txtGLCode"
                                                                ValidationGroup="Submit" ErrorMessage="GL Code should not be blank" CssClass="validation_msg_box_sapn"
                                                                Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblGLcode" runat="server" ToolTip="GL Code" Text="GL Code" CssClass="styleReqFieldLabel" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtSLCode" runat="server" ToolTip="SL Code" ReadOnly="true" class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblSLcode" runat="server" ToolTip="SL Code" Text="SL Code" />
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvbnktBraweeBank" visible="false">
                                                    <div class="md-input">
                                                        <uc:Suggest ID="btDraweeBank" runat="server" ServiceMethod="GetDraweeBank" ToolTip="Drawee Bank" AutoPostBack="true"
                                                            ErrorMessage="Select a Drawee Bank" OnItem_Selected="btDraweeBank_Item_Selected" IsMandatory="true" ValidationGroup="Submit" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblbtDraweeBank" runat="server" CssClass="styleDisplayLabel" Text="Drawee Bank"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvbnktBraweeBankLocation" visible="false">
                                                    <div class="md-input">
                                                        <uc:Suggest ID="btDraweeLocation" runat="server" ServiceMethod="GetDraweeLocation" ToolTip="Drawee Branch"
                                                            ErrorMessage="Select Branch" IsMandatory="true" ValidationGroup="Submit" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblbtDraweeLocation" runat="server" CssClass="styleDisplayLabel" Text="Branch"></asp:Label>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" id="dvBankRef" visible="false" runat="server">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtBankRefNumber" runat="server" MaxLength="25" onkeypress="return NumericCheck(event)" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblBankRefNumber" runat="server" CssClass="styleReqdFieldLabel" Text="Reference Number"></asp:Label>
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvBankRef" runat="server" Display="Dynamic" ControlToValidate="txtBankRefNumber"
                                                                ValidationGroup="Submit" ErrorMessage="Enter Reference Number" CssClass="validation_msg_box_sapn"
                                                                Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12" runat="server" id="dvCreditCardRef" visible="false">
                                                    <div class="md-input">
                                                        <asp:TextBox ID="txtCardRefNumber" runat="server" MaxLength="35" ToolTip="Card Reference Number"
                                                            class="md-form-control form-control login_form_content_input requires_true" />
                                                        <span class="highlight"></span>
                                                        <span class="bar"></span>
                                                        <label>
                                                            <asp:Label ID="lblCardRefNumber" runat="server" ToolTip="Card Reference Number" Text="Card Reference Number" />
                                                        </label>
                                                        <div class="validation_msg_box">
                                                            <asp:RequiredFieldValidator ID="rfvCardRefNumber" runat="server" Display="Dynamic" ControlToValidate="txtCardRefNumber"
                                                                ValidationGroup="Submit" ErrorMessage="Enter Card Reference Number" CssClass="validation_msg_box_sapn"
                                                                Enabled="false" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </ContentTemplate>
                            </cc1:TabPanel>
                            <cc1:TabPanel ID="tpDBT_CRD" runat="server" BackColor="Red" CssClass="tabpan"
                                HeaderText="DN / CN - Receipt" Width="98%" Visible="false">
                                <HeaderTemplate>
                                    DN / CN - Receipt
                                </HeaderTemplate>
                                <ContentTemplate>
                                    <asp:Panel ID="pnlDebitCredit" runat="server" CssClass="stylePanel" Width="100%">
                                        <div class="gird">
                                            <asp:GridView ID="gvDebitCredit" ShowFooter="true" runat="server" AutoGenerateColumns="False" Width="100%" OnRowDeleting="gvDebitCredit_RowDeleting"
                                                OnRowDataBound="gvDebitCredit_RowDataBound" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Account No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDrPrimeAccountNo" runat="server" ToolTip="Account No" Text='<%# Bind("PrimeAccountNo") %>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlDrCrPANUM" runat="server" ToolTip="Account No"
                                                                    class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvDrCrPanum" runat="server" ControlToValidate="ddlDrCrPANUM" SetFocusOnError="true"
                                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select a Account Number" CssClass="validation_msg_box_sapn" ValidationGroup="DebitCredit"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Debit or Credit Note">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDrCr" runat="server" Text='<%# Bind("DrCrID") %>' Visible="false" />
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DrCr") %>' ToolTip="Debit or Credit Note" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlCreditDebit" runat="server" AutoPostBack="true" ToolTip="Debit or Credit Note"
                                                                    OnSelectedIndexChanged="ddlCreditDebit_SelectedIndexChanged" class="md-form-control form-control">
                                                                    <asp:ListItem Selected="True" Text="--Select--" Value="0">
                                                                    </asp:ListItem>
                                                                    <asp:ListItem Text="Credit" Value="1">
                                                                    </asp:ListItem>
                                                                    <asp:ListItem Text="Debit" Value="2">
                                                                    </asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCreditDebit" runat="server" ControlToValidate="ddlCreditDebit" SetFocusOnError="true"
                                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select a Credit/Debit Note" CssClass="validation_msg_box_sapn" ValidationGroup="DebitCredit">
                                                                    </asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Debit or Credit No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCRDRNO" runat="server" Text='<%# Bind("DebitNo") %>' ToolTip="Debit / Credit No" />
                                                            <asp:Label ID="lblCRDRID" runat="server" Text='<%# Bind("DebitID") %>' Visible="false" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:DropDownList ID="ddlCreditDebitNo" runat="server" AutoPostBack="true" ToolTip="Debit / Credit No"
                                                                    OnSelectedIndexChanged="ddlCreditDebitNo_SelectedIndexChanged" class="md-form-control form-control">
                                                                </asp:DropDownList>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCreditDebitNo" runat="server" ControlToValidate="ddlCreditDebitNo" SetFocusOnError="true"
                                                                        Display="Dynamic" InitialValue="0" ErrorMessage="Select a  Debit/Credit Note No." CssClass="validation_msg_box_sapn"
                                                                        ValidationGroup="DebitCredit"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Debit_CreditID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCRDRId1" runat="server" Text='<%# Bind("DebitID") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Balance Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblBalAmount" runat="server" Text='<%# Bind("BalAmt") %>' ToolTip="Balance Amount" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtBalAmount" Style="text-align: right;" runat="server" ReadOnly="true" Text='<%# Bind("BalAmt") %>'
                                                                    class="md-form-control form-control login_form_content_input requires_true" ToolTip="Balance Amount"> </asp:TextBox>
                                                            </div>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-HorizontalAlign="Left" HeaderText="Collection Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCollAmount" runat="server" Text='<%# Bind("CollAmt") %>' ToolTip="Collection Amount" />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <div class="md-input" style="margin: 0px;">
                                                                <asp:TextBox ID="txtCollAmount" Style="text-align: right;" runat="server" Text='<%# Bind("CollAmt") %>' ToolTip="Collection Amount"
                                                                    class="md-form-control form-control login_form_content_input requires_true"> </asp:TextBox>
                                                                <cc1:FilteredTextBoxExtender ID="ftxtDebitAmount" runat="server" TargetControlID="txtCollAmount"
                                                                    FilterType="Custom,Numbers" ValidChars="." Enabled="True">
                                                                </cc1:FilteredTextBoxExtender>
                                                                <span class="highlight"></span>
                                                                <span class="bar"></span>
                                                                <div class="validation_msg_box">
                                                                    <asp:RequiredFieldValidator ID="rfvCollAmt" runat="server" ControlToValidate="txtCollAmount" SetFocusOnError="true"
                                                                        Display="Dynamic" ErrorMessage="Enter Collection Amount"
                                                                        CssClass="validation_msg_box_sapn" ValidationGroup="DebitCredit"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                        </FooterTemplate>
                                                        <ItemStyle HorizontalAlign="Right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField FooterStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                                                        ItemStyle-Width="70px" FooterStyle-Width="70px">
                                                        <ItemTemplate>
                                                            <asp:Button ID="lbtnRemove" runat="server" CausesValidation="false" Text="Remove" ToolTip="Remove"
                                                                CommandName="Delete" CssClass="grid_btn_delete"></asp:Button>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <asp:Button ID="btnDrCrNote" runat="server" CssClass="grid_btn" ValidationGroup="DebitCredit"
                                                                Text="Add" OnClick="btnDrCrNote_OnClick" ToolTip="Add" />
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </asp:Panel>
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
                    <button class="css_btn_enabled" id="btnSave" title="Save[Alt+S]" onclick="if(fnCheckPageValidators('Submit'))" validationgroup="Submit" causesvalidation="false"
                        onserverclick="btnSave_OnClick" runat="server"
                        type="button" accesskey="S">
                        <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;<u>S</u>ave
                    </button>
                    <button class="css_btn_enabled" id="btnClear" title="Clear[Alt+L]" onclick="if(fnConfirmClear())" causesvalidation="false" onserverclick="btnClear_OnClick" runat="server"
                        type="button" accesskey="L">
                        <i class="fa fa-eraser" aria-hidden="true"></i>&emsp;C<u>l</u>ear
                    </button>
                    <button class="css_btn_enabled" id="Button3" title="Exit[Alt+X]" onclick="if(fnConfirmExit())" causesvalidation="false" onserverclick="btnCancel_OnClick" runat="server"
                        type="button" accesskey="X">
                        <i class="fa fa-reply" aria-hidden="true"></i>&emsp;E<u>x</u>it
                    </button>
                    <button class="css_btn_enabled" id="btnReceiptCancel" title="Receipt Cancel[Alt+T]" onclick="if(confirm('Are you sure want to cancel this record?'))" causesvalidation="false"
                        onserverclick="btnReceiptCancel_OnClick" runat="server"
                        type="button" accesskey="T">
                        <i class="fa fa-times" aria-hidden="true"></i>&emsp;Receip<u>t</u> Cancel
                    </button>
                    <asp:Button runat="server" ID="btnPrint" Text="Print" CausesValidation="false" CssClass="styleSubmitButton"
                        OnClick="btnPrint_Click" Style="display: none;" />
                    <asp:Button runat="server" ID="btnRecSave" Text="ReceiptSave" CausesValidation="false" CssClass="styleSubmitButton"
                        OnClick="btnRecSave_OnClick" Style="display: none;" />
                </div>
                <div class="row" style="display: none">
                    <asp:Button ID="btnNextTab" AccessKey="N" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnNextTab');" runat="server" Text="" />
                    <asp:Button ID="btnPrevTab" AccessKey="P" UseSubmitBehavior="false" OnClientClick="return fnMoveNextTab('btnPrevTab');" runat="server" Text="" />
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <asp:CustomValidator ID="cvReceiptProcessing" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Submit" HeaderText="Correct the following validation(s):" Enabled="false"></asp:CustomValidator>
                        <asp:ValidationSummary ID="vsBilling" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Submit" HeaderText="Correct the following validation(s):" Enabled="true" />
                        <asp:ValidationSummary ID="vsAddless" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="AddLess" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsCreditDebit" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="DebitCredit" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsAccountDetails" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="AccountDetails" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsAppropriation" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Appropriation" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsShowMethod" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Show" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsInstallment" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="InstallmentDet" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:ValidationSummary ID="vsCurrency" runat="server" CssClass="styleMandatoryLabel"
                            ValidationGroup="Currency" HeaderText="Correct the following validation(s):" Enabled="false" />
                        <asp:HiddenField ID="hdvAmount" runat="server" />
                        <asp:HiddenField ID="hvfGLPostingCode" runat="server" />
                        <asp:HiddenField ID="hvfCashFlowID" runat="server" />
                        <asp:HiddenField ID="hvfCustomerID" runat="server" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPrint" />
            <asp:PostBackTrigger ControlID="btnRecSave" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:Label ID="lblModal" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderApprover" runat="server" TargetControlID="lblModal"
        PopupControlID="PnlInstall" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlInstall" GroupingText="Installment Details" CssClass="stylePanel" runat="server"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="40%" BorderColor="#0092c8">
        <asp:UpdatePanel ID="upPass" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <div id="divTransaction" class="container" runat="server" style="height: 200px;">
                            <asp:GridView ID="grvInstall" runat="server" AutoGenerateColumns="false" Width="99%">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" Text='<% #Bind("Serial_No")%>' Style="text-align: right" runat="server" ToolTip="S.No."></asp:Label>
                                            <asp:Label ID="lblSNoI" runat="server" Visible="false" Text='<% #Bind("SNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="left" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Installment No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<% #Bind("INSTALLMENT_NO")%>' ToolTip="Installment No."></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="40%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<% #Bind("AMOUNT")%>' ToolTip="Amount"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="right" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="row" align="center">
                        <button class="css_btn_enabled" id="btnDEVModalCancel" title="Close[Alt+Z]" causesvalidation="false"
                            onserverclick="btnDEVModalCancel_Click" runat="server"
                            type="button" accesskey="Z">
                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;Close
                        </button>
                    </div>
                    <div class="row" style="display: none;">
                        <asp:ValidationSummary ID="vsPopUp" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                            HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <asp:Label ID="lblModalinvoice" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="ModalPopupExtenderInV" runat="server" TargetControlID="lblModalinvoice"
        PopupControlID="PnlInvs" BackgroundCssClass="styleModalBackground" Enabled="true">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="PnlInvs" GroupingText="Invoice Details" CssClass="stylePanel" runat="server"
        BackColor="White" BorderStyle="Solid" BorderWidth="2px" BorderColor="#0092c8">
        <asp:UpdatePanel ID="UpdINV" runat="server">
            <ContentTemplate>
                <div>
                    <div class="row">
                        <asp:Label ID="lblamount" Text="Amount : " runat="server"></asp:Label>
                        <asp:Label ID="lblbalanceamount" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div>
                                <div class="row">
                                    <div id="div2" class="container" runat="server" style="height: 200px;">
                                        <div class="gird">
                                            <asp:GridView ID="grvInvoice" runat="server" AutoGenerateColumns="false" Width="99%" class="gird_details">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="SNo">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSNo" Text="<%#Container.DataItemIndex+1%>" Style="text-align: right" runat="server"></asp:Label>
                                                            <asp:Label ID="lblSNoI" runat="server" Visible="false" Text="<%#Container.DataItemIndex+1%>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallmentNo" runat="server" Text='<% #Bind("INVOICE_NO")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Entity" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEntity" runat="server" Text='<% #Bind("ENTITY_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<% #Bind("AMOUNT")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmountBALANCE" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Invoice ID" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblINVOICE_ID" runat="server" Text='<% #Bind("INVOICE_ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkInv" runat="server" OnCheckedChanged="chkInv_CheckedChanged" AutoPostBack="true" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <asp:Button ID="OK" runat="server" Text="OK" OnClick="OK_Click"
                                        ToolTip="Close" class="styleSubmitButton" Visible="false" />

                                    <%-- <asp:Button ID="btnCancelInv" runat="server" Text="Close" OnClick="btnCancelInv_Click"
                                        ToolTip="Close" class="styleSubmitButton" />--%>

                                    <div align="center">
                                        <button class="css_btn_enabled" id="btnCancelInv" title="Close[Alt+C]" causesvalidation="false"
                                            onserverclick="btnCancelInv_Click" runat="server"
                                            type="button" accesskey="C">
                                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>lose
                                        </button>
                                    </div>
                                </div>
                                <div class="row">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="true" ValidationGroup="PopUpAdd"
                                        HeaderText="Correct the following validation(s):" CssClass="styleMandatoryLabel" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>

    <asp:Label ID="lblCashDenoPop" runat="server" Style="display: none;"></asp:Label>
    <cc1:ModalPopupExtender ID="mpeCashDenoPop" runat="server" PopupControlID="dvInstallmentPop" TargetControlID="lblCashDenoPop"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInstallmentPop" style="display: none; width: 60%; height: 80%;">
        <div id="Div3" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-right: -25px;">
            <asp:ImageButton ID="imglblCashDenoPopPop" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imglblCashDenoPop_Click" />
        </div>
        <div>
            <asp:Panel ID="pnllblCashDenoPop" GroupingText="Cash Denomination Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="updCashDenoPop" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 400px;">
                            <div>
                                <div class="row">
                                    <div class="gird">
                                        <asp:GridView ID="grvCashDenomination" runat="server" Width="100%" AutoGenerateColumns="false" OnRowDataBound="grvCashDenomination_RowDataBound"
                                            RowStyle-HorizontalAlign="Center" ShowFooter="true" class="gird_details">
                                            <Columns>
                                                <asp:TemplateField HeaderText="COMMON LOOKUP ID" ItemStyle-HorizontalAlign="Left" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCOMMON_LOOKUP_ID" runat="server" Text='<%# Bind("COMMON_LOOKUP_ID") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblCOMMON_CODE" runat="server" Text='<%# Bind("COMMON_CODE") %>' ToolTip="Value"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RO" ItemStyle-HorizontalAlign="Left">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCOMMON_FLAG" runat="server" Text='<%# Bind("COMMON_FLAG") %>' ToolTip="RO"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Value" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtCOMMON_DESCRIPTION" runat="server" Text='<%# Bind("COMMON_DESCRIPTION") %>' Enabled="false"
                                                            ToolTip="Value" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Numbers" ItemStyle-HorizontalAlign="left">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtNumbers" runat="server" ToolTip="Numbers" Text='<%# Bind("Numbers") %>' OnTextChanged="txtNumbers_TextChanged" AutoPostBack="true"
                                                            class="md-form-control form-control login_form_content_input requires_true" MaxLength="3" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="NumbersFileterExtndr" runat="server" TargetControlID="txtNumbers"
                                                            FilterType="Numbers,Custom" Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotalDenAmount" runat="server" Text="Total"></asp:Label>
                                                    </FooterTemplate>
                                                    <FooterStyle HorizontalAlign="Right" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Amount" ItemStyle-HorizontalAlign="Right">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtCurrTOTAL_AMOUNT" runat="server" Text='<%# Bind("TOTAL_AMOUNT") %>' ToolTip="Amount"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="AmountFileterExtndr" runat="server" TargetControlID="txtCurrTOTAL_AMOUNT"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtTotDinAmount" runat="server" ToolTip="Total Amount"
                                                            class="md-form-control form-control login_form_content_input requires_true" Style="text-align: right;"></asp:TextBox>
                                                        <cc1:FilteredTextBoxExtender ID="AmountFileterExtndr" runat="server" TargetControlID="txtTotDinAmount"
                                                            FilterType="Numbers,Custom" ValidChars="." Enabled="true">
                                                        </cc1:FilteredTextBoxExtender>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row" align="center">
                                    <div align="center">
                                        <button class="css_btn_enabled" id="btnCashOk" title="Ok[Alt+O]" causesvalidation="false"
                                            onserverclick="btnCashOk_Click" runat="server"
                                            type="button" accesskey="o">
                                            <i class="fa fa-check" aria-hidden="true"></i>&emsp;<u>O</u>k
                                        </button>
                                    </div>
                                    <div align="center">
                                        <button class="css_btn_enabled" id="btnCashCancel" title="Close[Alt+C]" causesvalidation="false"
                                            onserverclick="btnCashCancel_Click" runat="server"
                                            type="button" accesskey="C">
                                            <i class="fa fa-times" aria-hidden="true"></i>&emsp;<u>C</u>lose
                                        </button>
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
    <cc1:ModalPopupExtender ID="mpeInvoicePopup" runat="server" PopupControlID="dvInvoicePopup" TargetControlID="lblInvoicePopup"
        BackgroundCssClass="modalBackground" Enabled="true" />
    <div runat="server" id="dvInvoicePopup" style="display: none; width: 60%; height: 50%;">
        <div id="Div4" style="float: right; width: 50px; height: 50px; cursor: pointer; background-image: none; position: absolute; margin-top: -15px; margin-left: -25px;">
            <asp:ImageButton ID="imgInvoicePopup" runat="server" Width="50px" Height="50px" ImageUrl="~/Images/close.png"
                OnClick="imgInvoicePopup_Click" />
        </div>
        <div>
            <asp:Panel ID="pnlInvoiceDetails" GroupingText="Invoice Details" CssClass="stylePanel" runat="server"
                BackColor="White" BorderStyle="Solid" BorderWidth="2px" Width="100%" BorderColor="#0092c8">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <div class="container" style="height: 300px;">
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtinvoiceNo" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblinvoiceNo" runat="server" CssClass="styleDisplayLabel" Text="Invoice No" ToolTip="Invoice No"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceDate" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceDate" runat="server" CssClass="styleDisplayLabel" Text="Invoice Date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceAmount" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceAmount" runat="server" CssClass="styleDisplayLabel" Text="Invoice Amount" ToolTip="Invoice Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtInvoiceduedate" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvoiceduedate" runat="server" CssClass="styleDisplayLabel" Text="Invoice due date" ToolTip="Invoice due date"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtRealizedAmount" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblRealizedAmount" runat="server" CssClass="styleDisplayLabel" Text="Realized Amount" ToolTip="Realized Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtUnDebtsApproved" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblInvBalanceAmount" runat="server" CssClass="styleDisplayLabel" Text="Balance Amount" ToolTip="Balance Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                                    <div class="md-input">
                                        <asp:TextBox ID="txtUnApprovedAmount" runat="server" condentEditable="false" class="md-form-control form-control login_form_content_input requires_true"></asp:TextBox>
                                        <span class="highlight"></span>
                                        <span class="bar"></span>
                                        <label>
                                            <asp:Label ID="lblUnApprovedAmount" runat="server" CssClass="styleDisplayLabel" Text="Un Approved Amount" ToolTip="Un Approved Amount"></asp:Label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <button class="css_btn_enabled" id="btnInvoicePopup" title="Ok[Alt+K]" causesvalidation="false"
                                    onserverclick="btnInvoiceOk_Click" runat="server" type="button" accesskey="K">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>&emsp;O<u>k</u>
                                </button>
                                <button class="css_btn_enabled" id="btnInvoiceCancel" title="Exit[Alt+E]" causesvalidation="false"
                                    onserverclick="btnInvoiceCancel_Click" runat="server" type="button" accesskey="E">
                                    <i class="fa fa-reply" aria-hidden="true"></i>&emsp;<u>E</u>xit
                                </button>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
